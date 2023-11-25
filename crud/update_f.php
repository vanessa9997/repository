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
	
	$id_pet = (int)$_GET["id"];
	
	$query = 'SELECT * FROM pets WHERE id_owner= $1 AND id_pet= $2';

	$result = pg_query_params($connection, $query, array($_SESSION['id'], $id_pet));

	if (!($row = pg_fetch_assoc($result))) 
	{
		header("Location: list.php");
		die();
	}
	

?>

<!DOCTYPE html>
<html lang="pl">
<head>
	<meta charset="utf=8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Crud</title>
</head>
<body>

	<form action="update.php" method="post">
	<input type="hidden" name="id_pet" value="<?php echo $row['id_pet']; ?>">
	<p><b>Imię zwierzaka:</b><br>
	<input type="text" name="imie" value="<?php echo $row['pet_name']; ?>"><br>
	<br/>
	<b>Typ zwierzaka:</b><br>
	<input type="text" name="typ" value="<?php echo $row['type']; ?>"><br>
	<br/>
	<input type="submit" value="Zapisz"></p>
	</form>

<div>
	<?php
	if (isset($_SESSION['blad']))
	{
		echo $_SESSION['blad'] ;
		unset($_SESSION['blad'] );
	}
	?>
</div>


</body>
</html> 

