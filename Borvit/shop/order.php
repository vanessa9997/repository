<?php

	require('header.php');

	session_start();
		
		if ((isset($_SESSION['udanezam'])) && ($_SESSION['udanezam']==true))
		{
			header('Location:afterOrder.php');
			exit();
		}
		
		$basket = $cart->getProducts();
		
		if (empty($basket)){
			
			$_SESSION['e_basket']="Twój koszyk jest pusty!";
			
			header('Location:showcart.php');
			exit();	
		}
		
		if (isset($_SESSION['e_basket'])) unset($_SESSION['e_basket']);
		
		
			if(!$session->getUser()->isAnonymous()) {
		
				$stmt = $conn->prepare("SELECT id, customer, email, address FROM users WHERE id=:id");
				$stmt->bindValue(':id', $session->getUser()->getId(), PDO::PARAM_INT);
				$stmt->execute();
	
				$row = $stmt->fetch(PDO::FETCH_ASSOC);
				
				$customer = $row['customer'];
				$email = $row['email'];
				$address = $row['address'];
	
			}
		
		
?>

	<div class='form'>
	
		<h2>Dane do wysyłki</h2>
		
		<form action='orderSummary.php' method='post'>
		<input type='text' name='customer' <?= isset($customer) ? 'value="' . $customer . '"' : '' ?>
		 placeholder="imię i nazwisko" onfocus="this.placeholder=''" onblur="this.placeholder='imię i nazwisko'">
			<?php
				if (isset($_SESSION['e_customer']))
				{
					echo '<div class="error">'.$_SESSION['e_customer'].'</div>';
					unset($_SESSION['e_customer']);
				}
			?>
		<input type='email' name='email' <?= isset($email) ? 'value="' . $email . '"' : '' ?> placeholder="email" onfocus="this.placeholder=''" onblur="this.placeholder='email'">
			<?php
				if (isset($_SESSION['e_email']))
				{
					echo '<div class="error">'.$_SESSION['e_email'].'</div>';
					unset($_SESSION['e_email']);
				}
			?>
		
		<textarea name='address' placeholder="adres" onfocus="this.placeholder=''" onblur="this.placeholder='adres'"><?= isset($address) ? $address : '' ?></textarea>
			<?php
				if (isset($_SESSION['e_address']))
				{
					echo '<div class="error">'.$_SESSION['e_address'].'</div>';
					unset($_SESSION['e_address']);
				}
			?>
		<input type='submit' value='zamów'>
		</form>
		
	</div>
	
<?php

	require('footer.php');
	
?>
