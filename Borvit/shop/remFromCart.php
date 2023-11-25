<?php

	require('header.php');

	//usuwa produkty z koszyka
	$cart->remove($_GET['id']);
	
	header('Location:showcart.php');
		
	require('footer.php');
?>