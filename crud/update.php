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

	$id_pet= $_POST['id_pet'];
	$pet_name = $_POST['imie'];
	$type = $_POST['typ'];
	
	$query = 'UPDATE pets SET pet_name= $1, type= $2 WHERE id_owner= $3 AND id_pet= $4';  
	
	$result = pg_query_params($connection, $query, array($pet_name, $type, $_SESSION['id'], $id_pet));
	
	pg_free_result($result);
	
	header("Location: list.php");

?>

