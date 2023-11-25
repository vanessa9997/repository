<?php

$host = "localhost";
$username = "root";
$password = "haslo";

	try {
		$conn = new PDO("mysql:host=$host;dbname=shop", $username, $password);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$conn -> exec("SET NAMES 'utf8'");
		//echo "Connected successfully";
	} 
	catch(PDOException $e) {
		echo "Connection failed: " . $e->getMessage();
	}


?> 