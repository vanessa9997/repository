<?php
	require('header.php');

	session_start();

	if($session->getUser()->isAnonymous()) {
		
		header('Location:login.php');
		exit();
	}
	else {
		
		echo "<div class='form'>";
		
			echo "<h3 style='text-align:center;'>Witaj  <span style='color:#006400';>".$session->getUser()->getLogin()."</span> !</h3>";
		
			echo "<div class='data'>";
			
				//dane i ich edycja	
				echo "<h4>Twoje dane</h4>";
				
				echo "<h5>Imię i nazwisko: <span style='color:#006400';>".$session->getUser()->getCustomer()."</span></h5>";
				echo "<h5>Email: <span style='color:#006400';>".$session->getUser()->getEmail()."</span></h5>";
				echo "<h5>Adres: <span style='color:#006400';>".$session->getUser()->getAddress()."</span></h5>";
				
				echo "<a href='update.php' class='buttondata'>Edytuj</a>";
			
			echo "</div>";
			
			
			echo "<div class='orderhistory'>";
				//historia zamówień
				

				$stmt = $conn->prepare("SELECT date, amount FROM orders WHERE customer=:customer");
				
				$stmt->bindValue(':customer', $session->getUser()->getCustomer(), PDO::PARAM_STR);
				$stmt->execute();
				
				$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
				
				if(count($row)>0){
					
					echo "<h4>Historia zamówień</h4>";
					foreach ($row as $cell) {
					
						$date = $cell['date'];
						$amount = $cell['amount'];
										
						echo "<table class='order'>";
					
						echo "<tr><td style='font-size:18px; font-weight:bold; text-align:center;' colspan='4'>$date</td></tr>";
					
						echo "<tr><td>Indeks</td><td>Nazwa</td><td>Ilość</td><td>Cena</td></tr>";
					
						$select = $conn->prepare("SELECT p.id, p.indeks, p.name, op.quantity, p.price FROM products p 
						INNER JOIN orders_products op ON (op.product_id = p.id)
						INNER JOIN orders o ON (op.order_id = o.id)
						WHERE o.date = :date");
				
						$select->bindValue(':date', $date, PDO::PARAM_STR);
						$select->execute();
					
							while($product = $select->fetch(PDO::FETCH_ASSOC)){	
							
								$id = $product['id'];
								$indeks = $product['indeks'];
								$name = $product['name'];
								$quantity = $product['quantity'];
								$price = $product['price'];
								
								echo "<tr style='font-weight:bold;'>
								<td>$indeks</td><td><a class='link' href='product.php?id=$id'>$name</a></td><td>$quantity</td><td>$price</td></tr>";
							
							}
					
						echo "<tr style='font-weight:bold;'><td colspan='3'></td><td>$amount</td></tr>";	
						echo "</table>";
					}
					
				}
						
						
			echo "</div>";
			
		echo "</div>";	
			
		//Usuwanie zmiennych pamiętających wartości wpisane do formularza
		if (isset($_SESSION['fr_login'])) unset($_SESSION['fr_login']);
		
		//Usuwanie błędów
		if (isset($_SESSION['e_login'])) unset($_SESSION['e_login']);
			
	}
	

	require('footer.php');
?>