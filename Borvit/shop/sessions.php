<?php

	class session {
		
		//id sesji jest hashem
		private $id;
		private $ip;
		private $browser;
		private $time;
		private $user;
		private $salt;

		//konstruktor, który będzie się wywoływać przy tworzeniu instancji klasy
		public function __construct() {
			global $conn, $request;
			
			//pliki cookies będą przechowywać id sesji
			//sprawdzamy czy jest cookie
			if(!isset($_COOKIE[SESSION_COOKIE])) {
				//jeśli nie istnieje tworzymy puste cookie
				$_COOKIE[SESSION_COOKIE] = '';
			}
			else {
				//jeśli istnieje spr czy dobre cookie a nie z innej strony
				//spr czy długość nie jest różna od zdef. stałej (40)
				if(strlen($_COOKIE[SESSION_COOKIE]) != SESSION_ID_LENGHT) {
					//jeśli jest nie tak- trzeba stworzyć nową sesję(funkcja)
					$this->newSession();
					//tu wyżej powstanie ta pierwsza sesja
				}	
			}
			
			//pobieramy rekord odnośnie tej sesji z bazy, 
			//trzeba się upewnić, że ta sesja należy do tego użytkownika a nie została skradziona
			$stmt = $conn->prepare('SELECT session_id, updated_at, salt_token, user_id, uniq_info, ip, browser FROM sessions WHERE session_id = :sid AND uniq_info = :info AND updated_at > :updated
			AND ip = :ip AND browser = :browser');
			//updated_at porównujemy czy ta sesja jest jeszcze ważna
					
			//cookie przechowuje nasze id sesji
			$stmt->bindValue(':sid', $_COOKIE[SESSION_COOKIE], PDO::PARAM_STR);
			//od bieżącego czasu odejmuje godzinę(stała), żeby spr czy dana sesja jeszcze nie wygasła
			$stmt->bindValue(':updated', time() - SESSION_COOKIE_EXPIRE, PDO::PARAM_INT);
			//skorzystamy z klasy request, tam funkcja getInfo (porównywane jest uniq_info)
			$stmt->bindValue(':info', $request->getInfo(), PDO::PARAM_STR);
			$stmt->bindValue(':ip', $request->getIp(), PDO::PARAM_STR);
			$stmt->bindValue(':browser', $request->getBrowser(), PDO::PARAM_STR);
			$stmt->execute();
			
			//przechwytujemy sesję - gdy znaleziona w bazie
			if($session = $stmt -> fetch(PDO::FETCH_ASSOC)) {
				//zamykamy kursor, którego używaliśmy przy pobraniu rekordów z bazy
				$stmt -> closeCursor();
				 
				$this->id = $_COOKIE[SESSION_COOKIE];
				//do zmiennych u góry, do id naszej sesji przypisujemy wartości z bazy
				$this->salt = $session['salt_token'];
				$this->ip = $session['ip'];
				$this->browser = $session['browser'];
				$this->time = $session['updated_at'];
			
				//uaktualniamy cookie id danej sesji, czas teraz + o godzinę będzie
				//przedłużać przy każdym odświeżeniu strony
				setcookie(SESSION_COOKIE, $this->id, time() + SESSION_COOKIE_EXPIRE);
				
				//w bazie uaktualniamy datę ostatnich odwiedzin
				$stmt = $conn->prepare('UPDATE sessions SET updated_at = :time WHERE session_id = :sid');
				$stmt->bindValue(':sid', $_COOKIE[SESSION_COOKIE], PDO::PARAM_STR);
				//czas aktualny jaki teraz jest, więc funkcja time()
				$stmt->bindValue(':time', time(), PDO::PARAM_INT);
				$stmt->execute();
				
				
				//pracujemy na użytkowniku
				if($session['user_id'] != 0) {
					//dla zalogowanego użytkownika
					$stmt = $conn->prepare("SELECT login, customer, email, address FROM users WHERE id = :uid");
					$stmt->bindValue(':uid', $session['user_id'], PDO::PARAM_INT);
					$stmt->execute();
					
					//chcemy połączyć tego usera z userem z klasy user (pola login, ...)
					$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
					//tutaj musimy stworzyć nowego usera, żeby zadziałało
					$this->user = new user;
					$this->user->setId($session['user_id']);
					$this->user->setLogin($row[0]['login']);
					$this->user->setCustomer($row[0]['customer']);
					$this->user->setEmail($row[0]['email']);
					$this->user->setAddress($row[0]['address']);
					
					
				}
				else {
					//klasa user, użytkownik anonimowy, tworzymy nową instancję
					$this->user = new user(true);
				}
			}
			else {
				//gdy danej sesji nie ma w bazie
				$stmt->closeCursor();
				//tworzymy nową sesję(funkcja)
				$this->newSession();
			}
					
		}
		
		//odpowiada za zakładanie nowej sesji
		function newSession() {
			global $conn, $request;
			
			//deklarujemy, nadajemy id sesji, losowa sól do logowania
			$this->id = random_session_id();
			$this->salt = random_salt(10);
			//updatujemy cookie, id sesji, czas teraz + godzina
			setcookie(SESSION_COOKIE, $this->id, time() + SESSION_COOKIE_EXPIRE);
			
			
			//dodajemy informacje o sesji do bazy danych, żeby na kolejnej stronie konstruktor odczytał
			$stmt = $conn->prepare('INSERT INTO sessions (session_id, updated_at, salt_token, user_id, uniq_info, browser, ip)
			VALUES (:session_id, :time, :salt, :user_id, :info, :browser, :ip)');
			
			$stmt->bindValue(':session_id', $this->id, PDO::PARAM_STR);
			//przypisujemy czas powstania (nie wygaśnięcia)
			$stmt->bindValue(':time', time(), PDO::PARAM_INT);
			$stmt->bindValue(':salt', $this->salt, PDO::PARAM_STR);
			//zero bo użykownik anonimowy
			$stmt->bindValue(':user_id', 0, PDO::PARAM_INT);
			//tu klasa request i jej funkcja
			$stmt->bindValue(':info', $request->getInfo(), PDO::PARAM_STR);
			$stmt->bindValue(':browser', $request->getBrowser(), PDO::PARAM_STR);
			$stmt->bindValue(':ip', $request->getIp(), PDO::PARAM_STR);
			$stmt->execute();
			//i nowa instancja klasy user użytkownik anonimowy
			$this->user = new user(true);
			
		}
		
		//do uaktualniania sesji, (obiekt user klasy user)
		function updateSession(user $user) {
			global $conn, $request;
			
			//po zalogowaniu użytkownika id jest regenerowane, aby użytkownik zalogowany nie miał takiego samego id sesji jak anonimowy
			
			//losujemy użytkownikowi nowe id sesji
			$newId = random_session_id();
			//generujemy sól
			$newSalt = random_salt(10);
			//ustawiamy cookie
			setcookie(SESSION_COOKIE, $newId, time() + SESSION_COOKIE_EXPIRE);
			
			//wyżej zmiany po stronie użytkownika, po naszej stronie zmiana w bazie danych
			
			//chcemy do tej sesji co już istnieje o session_id = :sid przypisać te wyżej nowe wartości
			//oraz przypisać to do użytkownika, który będzie właścicielem tej sesji
			$stmt = $conn->prepare("UPDATE sessions SET salt_token = :salt, updated_at = :time, session_id = :newId, user_id = :uid WHERE session_id = :sid");
					
			$stmt->bindValue(':salt', $newSalt, PDO::PARAM_STR);
			$stmt->bindValue(':time', time(), PDO::PARAM_INT);
			$stmt->bindValue(':newId', $newId, PDO::PARAM_STR);
			//user z argumentu funkcji
			$stmt->bindValue(':uid', $user->getId(), PDO::PARAM_INT);
			$stmt->bindValue(':sid', $this->id, PDO::PARAM_STR);
			$stmt->execute();
			
			//id zmieniamy na nowe, a usera przypisujemy do zalogowanego
			$this->id = $newId;
			$this->user = $user;
			
		}
		
		
		//do cart
		public function getSessionId() {
			return $this->id;
		}
		
		//do doLogin
		public function getUser() {
			return $this->user;
		}
	}
	
	

?>