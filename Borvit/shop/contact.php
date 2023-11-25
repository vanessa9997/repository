<?php
	require('header.php');

	session_start();
	
	if ((isset($_SESSION['udanykontakt'])) && ($_SESSION['udanykontakt']==true))
	{
		header('Location:afterContact.php');
		exit();
	}
	
?>
		
	<div class='form'>
	
		<h2>Kontakt</h2>
		
		<form action='doContact.php' method='post'>
		<input type='email' value= "<?php
			if (isset($_SESSION['fr_email']))
			{
				echo $_SESSION['fr_email'];
				unset($_SESSION['fr_email']);
			}
		?>" name='email' placeholder="email" onfocus="this.placeholder=''" onblur="this.placeholder='email'">
			<?php
				if (isset($_SESSION['e_email']))
				{
					echo '<div class="error">'.$_SESSION['e_email'].'</div>';
					unset($_SESSION['e_email']);
				}
			?>
		<input type='text' value= "<?php
			if (isset($_SESSION['fr_subject']))
			{
				echo $_SESSION['fr_subject'];
				unset($_SESSION['fr_subject']);
			}
		?>" name='subject' placeholder="temat" onfocus="this.placeholder=''" onblur="this.placeholder='temat'">
			<?php
				if (isset($_SESSION['e_subject']))
				{
					echo '<div class="error">'.$_SESSION['e_subject'].'</div>';
					unset($_SESSION['e_subject']);
				}
			?>
		<textarea name='content' placeholder="treść" onfocus="this.placeholder=''" onblur="this.placeholder='treść'"><?php
				if (isset($_SESSION['fr_content']))
				{
					echo $_SESSION['fr_content'];
					unset($_SESSION['fr_content']);
				}
			?></textarea>
			<?php
				if (isset($_SESSION['e_content']))
				{
					echo '<div class="error">'.$_SESSION['e_content'].'</div>';
					unset($_SESSION['e_content']);
				}
			?>
		
		<input type='submit' value='wyślij'>
		</form>
	
	</div>
	
<?php
	require('footer.php');
?>