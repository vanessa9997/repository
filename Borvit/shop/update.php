<?php
	require('header.php');
	
	session_start();

	if($session->getUser()->isAnonymous()) {
		
		header('Location:login.php');
		exit();
	}
	
		if ((isset($_SESSION['udanyupdate'])) && ($_SESSION['udanyupdate']==true))
		{
			header('Location: afterUpdate.php');
			exit();
		}
	
	
		$stmt = $conn->prepare("SELECT id, login, customer, email, address FROM users WHERE id=:id");
		$stmt->bindValue(':id', $session->getUser()->getId(), PDO::PARAM_INT);
		$stmt->execute();
	
	
		if (!($row = $stmt->fetch(PDO::FETCH_ASSOC))) 
		{
			header("Location: customer.php");
			die();
		}
	
	
?>
		
	<div class='form'>
	
		<h2>Edycja danych</h2>
		
		<form action='doUpdate.php' method='post'>
		
		<input type='text' name='login' value="<?php echo $row['login']; ?>" placeholder="login" onfocus="this.placeholder=''" onblur="this.placeholder='login'" >
		
			<?php
				if (isset($_SESSION['e_login']))
				{
					echo '<div class="error">'.$_SESSION['e_login'].'</div>';
					unset($_SESSION['e_login']);
				}
			?>
		
		<input type='password' name='password' placeholder="hasło" onfocus="this.placeholder=''" onblur="this.placeholder='hasło'">
		
			<?php
				if (isset($_SESSION['e_password']))
				{
					echo '<div class="error">'.$_SESSION['e_password'].'</div>';
					unset($_SESSION['e_password']);
				}
			?>
		
		<input type='text' name='customer' value="<?php echo $row['customer']; ?>" placeholder="imię i nazwisko" onfocus="this.placeholder=''" onblur="this.placeholder='imię i nazwisko'">
		
			<?php
				if (isset($_SESSION['e_customer']))
				{
					echo '<div class="error">'.$_SESSION['e_customer'].'</div>';
					unset($_SESSION['e_customer']);
				}
			?>
		
		
		<input type='email' name='email' value="<?php echo $row['email']; ?>" placeholder="email" onfocus="this.placeholder=''" onblur="this.placeholder='email'">
		
			<?php
				if (isset($_SESSION['e_email']))
				{
					echo '<div class="error">'.$_SESSION['e_email'].'</div>';
					unset($_SESSION['e_email']);
				}
			?>
		
		<textarea name='address' placeholder="adres" onfocus="this.placeholder=''" onblur="this.placeholder='adres'"><?php echo $row['address']; ?></textarea>
	
			<?php
				if (isset($_SESSION['e_address']))
				{
					echo '<div class="error">'.$_SESSION['e_address'].'</div>';
					unset($_SESSION['e_address']);
				}
			?>
			
		<input type='submit' value='zapisz'>
		</form>
		
	</div>	
		
<?php
	
	require('footer.php');
?>