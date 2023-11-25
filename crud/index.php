<?php

	session_start();
	
	if((isset($_SESSION['login'])) && ($_SESSION['login']==true))
	{
		header('Location:list.php');
		exit();
	}
	
	
	include("connect.php");
	
	$query= 'SELECT p.id_pet, p.pet_name, p.type, o.name FROM pets p, owners o
	WHERE p.id_owner = o.id ORDER BY p.id_pet ASC';
	
	$result = pg_prepare($connection, "query", $query);
	$result = pg_execute($connection, "query", array());
		
	echo "<table>\n";
		echo "<p><tr>";
		echo"<th>Id</th><th>Imię</th><th>Typ</th><th>Właściciel</th>";
		echo "</tr>";
	
	 while($row = pg_fetch_array($result, null, PGSQL_ASSOC)) 
	 {		   
		echo "<tr>";
        echo "<td>".$row['id_pet']."</td>";
        echo "<td>".$row['pet_name']."</td>";
        echo "<td>".$row['type']."</td>";
        echo "<td>".$row['name']."</td>";		
        echo "</tr></p>";
	}
	
	echo "</table>\n";

	pg_free_result($result);
	
	
?>

<!DOCTYPE html>
<html lang="pl">
<head>
	<meta charset="utf=8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Crud</title>
</head>
<body>
	
	<br> </br>
	<b>Logowanie</b>
	<br> </br>
	<form action="login.php" method="post">
	<b>Email: </b><br /><input type="text" name="email" />
	<br/><br/>
	<b>Hasło: </b><br /><input type="password" name="password" />
	<br/><br/>
	<input type="submit" value="Zaloguj"/>
	</form>
<div>
<?php
	
	if(isset($_SESSION['blad']))
	{
		echo $_SESSION['blad'];
	}
?>
</div>
</body>
</html>