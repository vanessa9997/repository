<?php

	session_start();

	if (isset($_SESSION['login']))
	{	
		unset($_SESSION['login']);
	}

	if((!isset($_POST['email'])) || (!isset($_POST['password'])))
	{
		header('Location:index.php');
		exit();
	}

	require_once"connect.php";

	$email = $_POST['email'];
	$password = $_POST['password'];
	
	//do rejestracji dodać
	//$pass_hash = password_hash($password, PASSWORD_DEFAULT);
	
	
	$email = htmlentities($email, ENT_QUOTES, "UTF-8");
	
	
	if ($result_set = pg_query($connection, 
	sprintf("SELECT * FROM owners WHERE email='%s'",
	pg_escape_string($connection,$email))))
	{
		$nr_owner=pg_num_rows($result_set);
		if($nr_owner>0)
		{
			
			$row=pg_fetch_assoc($result_set);
			if (password_verify($password,$row['password']))
			{
			
				$_SESSION['login'] = true;
				
				
				$_SESSION['id'] = $row['id'];
				$_SESSION['name'] = $row['name'];
				$_SESSION['email'] = $row['email'];
				
				
				unset($_SESSION['blad']);
				pg_free_result($result_set);
				header('Location:list.php');
			}
			else {
			
				$_SESSION['blad'] = '<span style="color:red">Nieprawidłowy login lub
				hasło!</span>';
				header('Location:index.php');
				}		
				
		} else {
			
			$_SESSION['blad'] = '<span style="color:red">Nieprawidłowy login lub
			hasło!</span>';
			header('Location:index.php');
			
			
		}
	}
	
?>