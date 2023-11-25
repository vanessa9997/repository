<?php

	require('header.php');

	//obsługuje funkcję add z klasy cart
	//funkcjonalność dodawania do koszyka produktu o pobranym id
	$cart->add($_GET['id']);
	
	header('Location:showcart.php');

	require('footer.php');
?>