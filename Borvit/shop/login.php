<?php
	require('header.php');

	session_start();
	
	if(!$session->getUser()->isAnonymous()) {
	
		header('Location:customer.php');
		exit();
		
	}
	
?>
	
	<div class='form'>
	
		<h2>Logowanie</h2>
		
		<form action='doLogin.php' method='post'>
		<input type='text' value= "<?php
			if (isset($_SESSION['fr_login']))
			{
				echo $_SESSION['fr_login'];
				unset($_SESSION['fr_login']);
			}
		?>" name='login' placeholder="login" onfocus="this.placeholder=''" onblur="this.placeholder='login'" >
		<input type='password' name='password' placeholder="hasło" onfocus="this.placeholder=''" onblur="this.placeholder='hasło'">
		<input type='submit' value='zaloguj'>
		</form>
		
			<?php
				if (isset($_SESSION['e_login']))
				{
					echo '<div class="error">'.$_SESSION['e_login'].'</div>';
					unset($_SESSION['e_login']);
				}
			?>
		
	</div>
	
<?php
	require('footer.php');
?>