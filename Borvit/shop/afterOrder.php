<?php
	require('header.php');

	session_start();
	
		if (!isset($_SESSION['udanezam']))
		{
			header('Location:index.php');
			exit();
		}
		else {
			unset($_SESSION['udanezam']);
		}
	
		
	
		//Usuwanie błędów
		if (isset($_SESSION['e_customer'])) unset($_SESSION['e_customer']);
		if (isset($_SESSION['e_email'])) unset($_SESSION['e_email']);
		if (isset($_SESSION['e_address'])) unset($_SESSION['e_address']);
	
?>
		
		<div class='form'>
			<h2>Dziękujemy za złożenie zamówienia!</h2>
			<h4>W razie pytań prosimy o kontakt</h4>
		</div>

<?php

	require('footer.php');
?>