<?php

	session_start();
	
	if(!isset($_SESSION['login']))
	{
		header('Location:index.php');
		exit();
	}
	
	if ((!isset($_POST['imie'])) || (!isset($_POST['typ'])))
	{
	    echo "Błąd wprowadzania danych";
		header("Location: list.php");
		die();
	}	 
	
	
	include("connect.php");
	
	
	$pet_name = $_POST['imie'];
	$type = $_POST['typ'];
	
	$query = 'INSERT INTO pets (id_owner, pet_name, type) VALUES ($1, $2, $3)';
	
	$result = pg_query_params($connection, $query, array($_SESSION['id'], $pet_name, $type));

	pg_free_result($result);

	header("Location: list.php");

?>