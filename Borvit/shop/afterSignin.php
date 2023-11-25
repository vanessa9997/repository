<?php
	require('header.php');

	session_start();
	
		if (!isset($_SESSION['udanarejestracja']))
		{
			header('Location: signin.php');
			exit();
		}
		else {
			unset($_SESSION['udanarejestracja']);
		}
		
		//Usuwanie zmiennych pamiętających wartości wpisane do formularza
		if (isset($_SESSION['fr_login'])) unset($_SESSION['fr_login']);
		if (isset($_SESSION['fr_password'])) unset($_SESSION['fr_password']);
		if (isset($_SESSION['fr_customer'])) unset($_SESSION['fr_customer']);
		if (isset($_SESSION['fr_email'])) unset($_SESSION['fr_email']);
		if (isset($_SESSION['fr_address'])) unset($_SESSION['fr_address']);
	
		//Usuwanie błędów rejestracji
		if (isset($_SESSION['e_login'])) unset($_SESSION['e_login']);
		if (isset($_SESSION['e_password'])) unset($_SESSION['e_password']);
		if (isset($_SESSION['e_customer'])) unset($_SESSION['e_customer']);
		if (isset($_SESSION['e_email'])) unset($_SESSION['e_email']);
		if (isset($_SESSION['e_address'])) unset($_SESSION['e_address']);
	
?>
		
		<div class='form'>
			<h2>Dziękujemy za rejestrację!</h2>
			<h3>Możesz już zalogować się na swoje konto.</h3>
		</div>

<?php

	require('footer.php');
?>