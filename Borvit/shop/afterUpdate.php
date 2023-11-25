<?php
	require('header.php');

	session_start();
	
		if (!isset($_SESSION['udanyupdate']))
		{
			header('Location: update.php');
			exit();
		}
		else {
			unset($_SESSION['udanyupdate']);
		}
			
		//Usuwanie błędów
		if (isset($_SESSION['e_login'])) unset($_SESSION['e_login']);
		if (isset($_SESSION['e_password'])) unset($_SESSION['e_password']);
		if (isset($_SESSION['e_customer'])) unset($_SESSION['e_customer']);
		if (isset($_SESSION['e_email'])) unset($_SESSION['e_email']);
		if (isset($_SESSION['e_address'])) unset($_SESSION['e_address']);
	
?>
		
		<div class='form'>
			<h3>Twoje dane zostały zmienione.</h3>
			<a href="customer.php" class="button1">Powrót</a>
		</div>

<?php

	require('footer.php');
?>