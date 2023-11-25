<?php

	require('header.php');
			
		session_start();
		
		if (empty($_POST['email']))
		{	
			$wszystko_OK=false;
			$_SESSION['e_email']="Podaj poprawny adres e-mail!";
			
			header('Location:order.php');
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
			
			    header('Location:order.php');
			}
				
			$email = htmlentities($email, ENT_QUOTES, "UTF-8");
			
			//Imię i nazwisko
			$customer = $_POST['customer'];
				
			if ((strlen($customer)<6) || (strlen($customer)>30))
			{
				$wszystko_OK=false;
				$_SESSION['e_customer']="Podaj poprawne imię i nazwisko";
				
				header('Location:order.php');
			}
			
			$customer = htmlspecialchars($customer, ENT_QUOTES);
				
			//adres
			$address = $_POST['address'];
				
			if ((strlen($address)<15) || (strlen($address)>40))
			{
				$wszystko_OK=false;
				$_SESSION['e_address']="Podaj pełny adres!";
			
				header('Location:order.php');
			}
			
			$address = htmlspecialchars($address, ENT_QUOTES);
				
				
			//wszystko OK
			if ($wszystko_OK==true)
			{	
				//zapisujemy informacje o zamówieniu do bazy danych
				$stmt = $conn->prepare("INSERT INTO orders (id, customer, address, email, date, amount) VALUES (null, :customer, :address, :email, :date, :amount)");
						
				$stmt->bindValue(':customer', $customer, PDO::PARAM_STR);
				$stmt->bindValue(':address', $address, PDO::PARAM_STR);
				$stmt->bindValue(':email', $email, PDO::PARAM_STR);
				$stmt->bindValue(':date', date('Y-m-d'), PDO::PARAM_STR);
				$stmt->bindValue(':amount', $_SESSION['sum'], PDO::PARAM_STR);
				$stmt->execute();
						
				//funkcja pdo, która zwróci nam id ostatniego insertu
				//żeby wstawić to do tabeli orders_products
				$orderId = $conn->lastInsertId();
						
				//korzystamy z funkcji getProducts w cart
				$orderedProducts = $cart->getProducts();
						
				foreach($orderedProducts as $product) {
					//ten pid pochodzi z funkcji getProducts, tam przypisaliśmy mu alias pid
					$pid = $product['pid'];
					$qty = $product['quantity'];
							
					//info odnośnie samych produktów
					$stmt = $conn->prepare("INSERT INTO orders_products (id, order_id, product_id, quantity) VALUES (null, :orderId, :pid, :qty)");
					$stmt->bindValue(':orderId', $orderId, PDO::PARAM_INT);
					$stmt->bindValue(':pid', $pid, PDO::PARAM_INT);
					$stmt->bindValue(':qty', $qty, PDO::PARAM_INT);
					$stmt->execute();
							
				}
							

				//czyścimy koszyk
				$cart->clear();
						
				$_SESSION['udanezam']=true;	
				header('Location: afterOrder.php');
				
			}
			
		}
			

	require('footer.php');
	
?>