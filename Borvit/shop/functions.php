<?php 

	define ('SESSION_COOKIE', 'cookiesklep');
	//długość hasha session id
	define ('SESSION_ID_LENGHT', 40);
	//czas "życia" ciasteczka, godzina
	define ('SESSION_COOKIE_EXPIRE', 3600);

	function showMenu () {
		global $conn, $session;
	
		$stmt = $conn->prepare("SELECT * FROM categories");
		$stmt -> execute();
	
		echo "<ol>";
		echo "<li><a href='index.php'>Wszystkie</a></li>";
	
		while($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
			$category_name = $row['category_name'];
			$category_id = $row['category_id'];
			echo "<li><a href='index.php?category_id=$category_id'>$category_name</a></li>";
		}
		
		echo "</ol>";
	
	}
	
	function getProductPictures($indeks) {
		$images = array();
		
		//W02-x
		for($i=0; $i<10; $i++) {
			$filename = $indeks."-".$i.".jpg";
			$filepath = "img/$filename";
			
			if(file_exists($filepath)) {
				$images[] = $filename;
			}
		}
		
		return $images;
	}
	
	
	//generowanie losowego id sesji
	function random_session_id() {
		//korzysta z czasu
		$utime = time();
		//losowa sól, 40 znaków zakończonych czasem, w którym będzie sesja
		$id = random_salt(40-strlen($utime)).$utime;
		return $id;
	}
	
	//do logowania będzie używana
	function random_salt($len) {
		return random_text($len);
	}
	
	
	//zwraca losowy tekst
	function random_text($len) {
		//baza to cały alfabet
		$base = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890';
		$max = strlen($base)-1;
		$rstring = '';
		//generujemy zmienne pseudolosowe za pomocą microtime(czas dokładny)
		mt_srand((double)microtime()*1000000);
		//losujemy kolejne znaki dopóki ten rstring jest mniejszy
		while(strlen($rstring) < $len)
			//dodajemy do tego coś z tej bazy zawierającej wszystkie litery
			$rstring.=$base[mt_rand(0,$max)];
			return $rstring;
	}
	
?>