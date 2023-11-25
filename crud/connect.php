  <?php
 
	$host = "localhost";
	$database = "crud";
	$user = "postgres";
	$password = "haslo";


	$connection = pg_connect("host=$host dbname=$database user=$user password=$password") 
		or die("Błąd połączenia z bazą danych!: ". pg_last_error(). "<br/>");
	print "Połączono z bazą danych.<br/>";

   
?>