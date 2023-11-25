<?php 
	session_start(); 
?>

<!DOCTYPE html>
<html lang="pl">
<head>
	<meta charset="utf=8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Crud</title>
</head>
<body>

	<form action="create.php" method="post">
	<p><b>Imię zwierzaka:</b><br>
	<input type="text" name="imie"><br>
	<br/>
	<b>Typ zwierzaka:</b><br>
	<input type="text" name="typ"><br>
	<br/>
	<input type="submit" value="Dodaj"></p>
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