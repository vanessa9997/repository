<?php

	session_start();
	
	if(!isset($_SESSION['login']))
	{
		header('Location:index.php');
		exit();
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

<?php

	include("connect.php");

	echo"<p>Witaj!".'[<a href="logout.php">Wyloguj</a> | <a href="create_f.php">Dodaj zwierzaka</a>]</p>';
    echo"<p><b>Id</b>: ".$_SESSION['id'];
	echo"<br /><b>Imię</b>: ".$_SESSION['name'];
	echo"<br  /><b>E-mail</b>: ".$_SESSION['email']."</p>";
	
	$query= 'SELECT p.id_pet, p.pet_name, p.type FROM pets p,
	owners o WHERE p.id_owner=o.id AND o.id= $1 ORDER BY p.id_pet ASC';
	
	$result = pg_query_params($connection, $query, array($_SESSION['id']));


	echo "<table>\n";
		echo "<tr>";
		echo"<th>Id</th><th>Imię</th><th>Typ</th>";
		echo "</tr>";
	
	 while($row = pg_fetch_array($result, null, PGSQL_ASSOC)) 
	 {		   
		echo "<tr>";
        echo "<td>".$row['id_pet']."</td>";
        echo "<td>".$row['pet_name']."</td>";
        echo "<td>".$row['type']."</td>";	
        echo "<td><a href=\"update_f.php?id=$row[id_pet]\">Edytuj</a> | <a href=\"delete.php?id=$row[id_pet]\" onClick=\"return confirm('Napewno chcesz usunąć?')\">Usuń</a></td>";		
		echo "</tr>";
	}
	
	echo "</table>\n";

	pg_free_result($result);
	
?>

</body>
</html>


