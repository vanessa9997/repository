<?php

	session_start();
	
	if(!isset($_SESSION['login']))
	{
		header('Location:index.php');
		exit();
	}
	
	
	if (!isset($_GET['id']))
	{
		header("Location: list.php");
		die();
	}
	
	
	include("connect.php");
	
	$id_pet = (int)$_GET['id'];
	
	
	$query = 'DELETE FROM pets WHERE id_owner= $1 AND id_pet= $2';
	
	$result = pg_query_params($connection, $query, array($_SESSION['id'], $id_pet));
	
	header("Location:list.php");

?>