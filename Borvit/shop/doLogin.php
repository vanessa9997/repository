<?php
	require('header.php');
	
	session_start();

	
	if(!$session->getUser()->isAnonymous()) {
	
		header('Location:customer.php');
		exit();
	
	} else {
	
		if((!isset($_POST['login'])) || (!isset($_POST['password'])))
		{
			header('Location:login.php');
			exit();
		}
		
		$login = $_POST['login'];
		$password = $_POST['password'];
		
		$login = htmlentities($login, ENT_QUOTES, "UTF-8");
		
		
		//spr czy hasła się zgadzają, f. wewnątrz klasy użytkownika
		$result = $session->getUser()->checkPasswords($login, $password); 
		
		$_SESSION['fr_login'] = $login;
		
		//ta f. będzie zwracać użytkownika w razie powodzenia
		//spr czy result jest instancją użytkownika, jeśli jest to logowanie się powiodło
		if($result instanceof user) {
			//zalogowany, update sesji, podając jako argument nowego użytkownika, który się zalogował
			$session->updateSession($result);
			header('Location:customer.php');
			
		} else {
			
			$_SESSION['e_login']="Nieprawidłowy login lub hasło!";
			header('Location:login.php');
			exit();
			
		}
				
	} 

	
	require('footer.php');
?>