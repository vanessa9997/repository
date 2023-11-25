<?php

	require('header.php');

	//po wylogowaniu updatujemy sesję, przypisujemy nowego anonimowego użytkownika
	$session ->updateSession(new user(true));
	header('Location:index.php');
	
	require('footer.php');
	
?>