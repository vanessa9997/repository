<?php
	require('header.php');

	session_start();
	
		if (!isset($_SESSION['udanykontakt']))
		{
			header('Location:contact.php');
			exit();
		}
		else {
			unset($_SESSION['udanykontakt']);
		}
		
		
		//Usuwanie zmiennych pamiętających wartości wpisane do formularza
		if (isset($_SESSION['fr_email'])) unset($_SESSION['fr_email']);
		if (isset($_SESSION['fr_subject'])) unset($_SESSION['fr_subject']);
		if (isset($_SESSION['fr_content'])) unset($_SESSION['fr_content']);
	
		//Usuwanie błędów
		if (isset($_SESSION['e_email'])) unset($_SESSION['e_email']);
		if (isset($_SESSION['e_subject'])) unset($_SESSION['e_subject']);
		if (isset($_SESSION['e_content'])) unset($_SESSION['e_content']);
		
?>

		<div class='form'>
			<h2>Dziękujemy za przesłanie wiadomości!</h2>
		</div>

<?php

	require('footer.php');
?>