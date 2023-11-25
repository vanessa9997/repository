<?php
	require('header.php');
		
		session_start();
		
		if (empty($_POST['email']))
		{	
			$wszystko_OK=false;
			$_SESSION['e_email']="Podaj poprawny adres e-mail!";
			
			header('Location:contact.php');
			exit();
				
		} else {
			
			//Udana walidacja? Załóżmy, że tak!
			$wszystko_OK=true;
			
			//email
			$email = $_POST['email'];
			$emailB = filter_var($email, FILTER_SANITIZE_EMAIL);
		
			if ((filter_var($emailB, FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
			{
				$wszystko_OK=false;
				$_SESSION['e_email']="Podaj poprawny adres e-mail!";
				
				header('Location:contact.php');
			}
		
			$email = htmlentities($email, ENT_QUOTES, "UTF-8");
			
			//temat
			$subject = $_POST['subject'];
		
			if (strlen($subject)<5)
			{
				$wszystko_OK=false;
				$_SESSION['e_subject']="To pole musi być uzupełnione!";
				
				header('Location:contact.php');
			}
			
			$subject = htmlspecialchars($subject, ENT_QUOTES);

			//treść
			$content = $_POST['content'];
			
			if (strlen($content)<8)
			{
				$wszystko_OK=false;
				$_SESSION['e_content']="To pole musi być uzupełnione!";
				
				header('Location:contact.php');
			}
			
			$content = htmlspecialchars($content, ENT_QUOTES);
		
			//Zapamiętaj wprowadzone dane do autouzupełniania
			$_SESSION['fr_email'] = $email;
			$_SESSION['fr_subject'] = $subject;
			$_SESSION['fr_content'] = $content;
		
		
			//wszystko OK
			if ($wszystko_OK==true)
			{
		
				//zapis do bazy 
				$stmt = $conn->prepare("INSERT INTO contact (id, email, subject, content) VALUES (null, :email, :subject, :content)");
			
				$stmt->bindValue(':email', $email, PDO::PARAM_STR);
				$stmt->bindValue(':subject', $subject, PDO::PARAM_STR);
				$stmt->bindValue(':content', $content, PDO::PARAM_STR);
				$stmt->execute();
				
				$_SESSION['udanykontakt']=true;
				header('Location: afterContact.php');
			
			}
				
		}
		


	require('footer.php');
	
?>