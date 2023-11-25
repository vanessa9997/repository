<?php


	//koszyk
	class cart{
	
		//konstruktor nie będzie używany
		public function __construct(){
		
		}
		
		//zajmuje się dodawaniem produktu do koszyka, czyli dodaniem rekordu do tabeli sessioncart
		//tą funkcję będzie obsługiwać plik addToCart
		public function add($id) {
			global $conn, $session;
			
			//spr co jest w koszyku, czy produkt już nie jest w koszyku, żeby dwa razy nie wyświetlać osobno
			$stmt = $conn->prepare("SELECT * FROM sessioncart WHERE product_id = :id AND session_id = :sid");
			$stmt->bindValue(':id', $id, PDO::PARAM_INT);
			$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
			$stmt->execute();
			
			//spr czy są wyniki
			if($row = $stmt->fetchAll(PDO::FETCH_ASSOC)){
				//update
				
				$qty = $row[0]['quantity'] + 1;
				
				$stmt = $conn->prepare("UPDATE sessioncart SET quantity = :qty
						WHERE session_id = :sid AND product_id = :pid");
				
				$stmt->bindValue(':qty', $qty, PDO::PARAM_INT);
				$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
				$stmt->bindValue(':pid', $id, PDO::PARAM_INT);
				$stmt->execute();
			}		
			 
			else {
				//dodawanie do koszyka polega na dodaniu rekordu do bazy
				//tutaj ostatnia jedynka oznacza, że dodajemy tylko jedną sztukę
				$stmt = $conn->prepare("INSERT INTO sessioncart (id, session_id, product_id, quantity) VALUES (null, :sid, :pid, 1)");
					
				$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
				//id z góry (argument funkcji), przekazywane tablicą get w addToCart
				$stmt->bindValue(':pid', $id, PDO::PARAM_INT);
				$stmt->execute();
			}
		}
		
		//usuwanie produktów z koszyka
		public function remove($id) {
			global $conn, $session; 
			
			//spr ile sztuk w koszyku, jeśli jedna usuniemy produkt z koszyka, a jak nie to zmniejszymy o 1 liczbę sztuk
			$stmt = $conn->prepare("SELECT * FROM sessioncart WHERE product_id = :id AND session_id = :sid");
			$stmt->bindValue(':id', $id, PDO::PARAM_INT);
			$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
			$stmt->execute();
			
			//czytamy cały wiersz
			$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
			//teraz ilość
			$qty = $row[0]['quantity'];
			//pomniejszamy ilość
			$qty--;
			
			
			if ($qty == 0){
				//ważne aby też była sesja bo inaczej można namieszać w innych koszykach gdy ten sam produkt
				$stmt = $conn->prepare("DELETE FROM sessioncart WHERE product_id = :id AND session_id = :sid");
				$stmt->bindValue(':id', $id, PDO::PARAM_INT);
				$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
				$stmt->execute();
			}
			else {
				$stmt = $conn->prepare("UPDATE sessioncart SET quantity = :qty WHERE product_id = :id AND session_id = :sid");
				$stmt->bindValue(':qty', $qty, PDO::PARAM_INT);
				$stmt->bindValue(':id', $id, PDO::PARAM_INT);
				$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
				$stmt->execute();
			}
		}
		
		//do pobrania wszystkich produktów z koszyka
		public function getProducts() {
			global $conn, $session;
			
			//session_id = sesji danego użytkownika, który akurat jest w koszyku
			$stmt = $conn->prepare("SELECT s.id, s.quantity, p.price, p.indeks, p.name, p.id as pid FROM sessioncart s LEFT OUTER JOIN products p ON (s.product_id = p.id) WHERE s.session_id = :sid");
					
			$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
			$stmt->execute();
			
			//uruchamiamy
			$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			return $result;
			
		}
		
		//po złożeniu zamówienia czyścimy koszyk
		public function clear() {
			global $conn, $session;
			
			$stmt = $conn->prepare("DELETE FROM sessioncart WHERE session_id = :sid");
			$stmt->bindValue(':sid', $session->getSessionId(), PDO::PARAM_STR);
			$stmt->execute();
			
		}
		
	}


?>