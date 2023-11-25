<?php
	
	require('header.php');
	
	session_start();

?>
	
	<div id='basket'>
		<h2 style='margin:20px 60px; text-align:left;'>Koszyk</h2>
		<table>
		
	<?php
	
		//zmienna, która przechowuje to co mamy w koszyku
		$inCart = $cart->getProducts();
		
		echo "<tr style='font-weight:bold;'><td>Indeks</td><td>Nazwa produktu</td><td>Cena</td><td>Ilość</td><td>Wartość</td></tr>";
		
		$sum = 0;
		foreach ($inCart as $product) {
			//to jest id konkretnej pozycji w koszyku(nie produktu)
			$productCartId = $product['id'];
			
			$price = $product['price'];
			$quantity = $product['quantity'];
			$indeks = $product['indeks'];
			$name = $product['name'];
			$total = $quantity * $price;
			$id = $product['pid'];
			$sum+= $total;
			
			$plus = "<a href='addToCart.php?id=$id'>+</a>";
			$minus = "<a href='remFromCart.php?id=$id'>-</a>";
			
			echo "<tr><td>$indeks</td><td>$name</td><td>$price</td><td>$minus $quantity $plus</td><td>$total</td></tr>";
		}
		
	?>
		</table>
		
		
		<h5 style='margin:20px 60px; float:left;'>Płatność: przy odbiorze</h5>
		<h3 style='margin:30px 60px; float:right;'>Suma: <?php echo $sum?> zł </h3>
		<div style='clear:both;'></div>
		
		<a href='order.php' class='button2'>Złóż zamówienie</a>
		
			<?php
			
				if (isset($_SESSION['e_basket']))
				{
					echo '<div class="error">'.$_SESSION['e_basket'].'</div>';
					unset($_SESSION['e_basket']);
				}
				
			?>
	
	</div>
	
<?php
	
	$_SESSION['sum'] = $sum;

	require('footer.php');
?>