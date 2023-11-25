<?php
	require('header.php');

	session_start();

	if($session->getUser()->isAnonymous()) {
		
		header('Location:login.php');
		exit();
	}
	else {
		
		if (empty($_POST['email']))
		{	
			$wszystko_OK=false;
			$_SESSION['e_email']="Podaj poprawny adres e-mail!";
			
			header('Location:update.php');
			exit();
				
		} else {
		
			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
		
			//login
			$login = $_POST['login'];
		
			if ((strlen($login)<3) || (strlen($login)>20))
			{
				$wszystko_OK=false;
				$_SESSION['e_login']="Login musi posiadać od 3 do 20 znaków!";
				
				header('Location:update.php');
			}
			
			if (ctype_alnum($login)==false)
			{
				$wszystko_OK=false;
				$_SESSION['e_login']="Login może składać się tylko z liter i cyfr (bez polskich znaków)";
				
				header('Location:update.php');
			}
			
			//hasło
			$password = $_POST['password'];
		
			if ((strlen($password)<8) || (strlen($password)>20))
			{
				$wszystko_OK=false;
				$_SESSION['e_password']="Hasło musi posiadać od 8 do 20 znaków!";
				
				header('Location:update.php');
			}
		
			$password_hash = password_hash($password, PASSWORD_DEFAULT);
		
			//Imię i nazwisko
			$customer = $_POST['customer'];
		
			if ((strlen($customer)<6) || (strlen($customer)>30))
			{
				$wszystko_OK=false;
				$_SESSION['e_customer']="Podaj poprawne imię i nazwisko";
				
				header('Location:update.php');
			}
			
			$customer = htmlspecialchars($customer, ENT_QUOTES);
			

			//email
			$email = $_POST['email'];
			$emailB = filter_var($email, FILTER_SANITIZE_EMAIL);
		
			if ((filter_var($emailB, FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
			{
				$wszystko_OK=false;
				$_SESSION['e_email']="Podaj poprawny adres e-mail!";
				
				header('Location:update.php');
			}
		
			$email = htmlentities($email, ENT_QUOTES, "UTF-8");
		
			//adres
			$address = $_POST['address'];
		
			if ((strlen($address)<15) || (strlen($address)>40))
			{
				$wszystko_OK=false;
				$_SESSION['e_address']="Podaj pełny adres!";
				
				header('Location:update.php');
			}
			
			$address = htmlspecialchars($address, ENT_QUOTES);
		
		
			//Czy wpisany email nie należy do innego użytkownika?
			$stmt = $conn->prepare("SELECT email FROM users WHERE email='$email'");
			$stmt -> execute();
					
			$user_email = $stmt->fetchAll();
			
			if(count($user_email)>0)
			{
				$emailA = $email;
				$emailB = $session->getUser()->getEmail();
				
				if ($emailA!==$emailB)
				{
					$wszystko_OK=false;
					$_SESSION['e_email']="Istnieje już inne konto przypisane do tego adresu e-mail!";
						
					header('Location:update.php');
				}
			}		
		
					
			//wszystko OK
			if ($wszystko_OK==true)
			{
				//update do bazy 
				$stmt = $conn->prepare("UPDATE users SET login=:login, password=:password, customer=:customer, email=:email, address=:address WHERE id=:id");
			
				$stmt->bindValue(':login', $login, PDO::PARAM_STR);
				$stmt->bindValue(':password', $password_hash, PDO::PARAM_STR);
				$stmt->bindValue(':customer', $customer, PDO::PARAM_STR);
				$stmt->bindValue(':email', $email, PDO::PARAM_STR);
				$stmt->bindValue(':address', $address, PDO::PARAM_STR);
				$stmt->bindValue(':id', $session->getUser()->getId(), PDO::PARAM_INT);
				$stmt->execute();
				
				$_SESSION['udanyupdate']=true;
				header('Location: afterUpdate.php');
			
			}
				
		}
	

	}

	require('footer.php');
?>