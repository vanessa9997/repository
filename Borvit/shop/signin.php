<?php
	require('header.php');
    
	session_start();
	
		if ((isset($_SESSION['udanarejestracja'])) && ($_SESSION['udanarejestracja']==true))
		{
			header('Location: afterSignin.php');
			exit();
		}
		
?>
		
	<div class='form'>
	
		<h2>Rejestracja</h2>
		
		<form action='doSignin.php' method='post'>
		
		<input type='text' value= "<?php
			if (isset($_SESSION['fr_login']))
			{
				echo $_SESSION['fr_login'];
				unset($_SESSION['fr_login']);
			}
		?>"
		name='login' placeholder="login" onfocus="this.placeholder=''" onblur="this.placeholder='login'" >
		
			<?php
				if (isset($_SESSION['e_login']))
				{
					echo '<div class="error">'.$_SESSION['e_login'].'</div>';
					unset($_SESSION['e_login']);
				}
			?>
		
		<input type='password' value= "<?php
			if (isset($_SESSION['fr_password']))
			{
				echo $_SESSION['fr_password'];
				unset($_SESSION['fr_password']);
			}
		?>" 
		name='password' placeholder="hasło" onfocus="this.placeholder=''" onblur="this.placeholder='hasło'">
		
			<?php
				if (isset($_SESSION['e_password']))
				{
					echo '<div class="error">'.$_SESSION['e_password'].'</div>';
					unset($_SESSION['e_password']);
				}
			?>
		
		<input type='text' value= "<?php
			if (isset($_SESSION['fr_customer']))
			{
				echo $_SESSION['fr_customer'];
				unset($_SESSION['fr_customer']);
			}
		?>" 
		name='customer' placeholder="imię i nazwisko" onfocus="this.placeholder=''" onblur="this.placeholder='imię i nazwisko'">
			
				<?php
				if (isset($_SESSION['e_customer']))
				{
					echo '<div class="error">'.$_SESSION['e_customer'].'</div>';
					unset($_SESSION['e_customer']);
				}
				?>
		
		<input type='email' value= "<?php
			if (isset($_SESSION['fr_email']))
			{
				echo $_SESSION['fr_email'];
				unset($_SESSION['fr_email']);
			}
		?>" 
		name='email' placeholder="email" onfocus="this.placeholder=''" onblur="this.placeholder='email'">
		
				<?php
				if (isset($_SESSION['e_email']))
				{
					echo '<div class="error">'.$_SESSION['e_email'].'</div>';
					unset($_SESSION['e_email']);
				}
				?>
		
		<textarea name='address' placeholder="adres" onfocus="this.placeholder=''" onblur="this.placeholder='adres'"><?php
				if (isset($_SESSION['fr_address']))
				{
					echo $_SESSION['fr_address'];
					unset($_SESSION['fr_address']);
				}
			?></textarea>
			<?php
				if (isset($_SESSION['e_address']))
				{
					echo '<div class="error">'.$_SESSION['e_address'].'</div>';
					unset($_SESSION['e_address']);
				}
			?>
		
		<input type='submit' value='zarejestruj'>
		</form>
	
	</div>
	
<?php

	require('footer.php');
	
?>