<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>Borvit - sklep z lokalną żywnością</title>
	<meta name="description" content="Sklep ze zdrową, lokalną żywnością. Sprawdź sam!" />
	<meta name="keywords" content="sklep, zdrowa żywność, lokalne produkty, lokalni dostawcy" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	
	<link href="css/lightbox.css" rel="stylesheet" />
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/lightbox.js"></script>


	<link rel="stylesheet" type="text/css" href="fontello/css/fontello.css">	
	<link rel="stylesheet" type="text/css" href="style.css">
	
	
	<link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Dancing+Script:wght@500&display=swap" rel="stylesheet">
			
</head>

<body>

	<?php

		require('functions.php');
		
		require('sessions.php');
		require('request.php');
		require('user.php');
		require('cart.php');

		$pdo = require 'connect.php';
		
		$request = new userRequest;
		$session = new session;
		$cart = new cart;

	?>

	<div id="container">
		<div id="nav">
			<div id="start">	
				<div id="left">
					<a class="logo" href="index.php">
					<!--<a href="https://www.freepik.com/icon/apple_7265281#fromView=search&term=healthy+foods+in+green+circle&page=2&position=94">Icon by Muhammad_Usman</a>-->
					<img src="logo.png" style="float:left; margin-top:6px; margin-left:10px;">
					<h1 style="float:left; margin:8px; letter-spacing:4px; font-family: 'Dancing Script', cursive; color:#003500;">Borvit</h1>
					<div style="clear: both;"></div>
					</a>
				</div>
				<div id="right">
				
					<ul>
					<?php
						if($session->getUser()->isAnonymous()) {
							
							echo "<li><a href='signin.php'><i class='icon-user-o'>
										<span style='font-size:9px; padding:0;'>rejestracja</span></i>
										</a></li>";
							echo "<li><a href='login.php'><i class='icon-user'>
										<span style='font-size:9px; padding:0;'>zaloguj</span></i>
										</a></li>";
						}
						else {
							
							echo "<li><a href='customer.php'><i class='icon-cog'>
										<span style='font-size:9px; padding:0;'>konto</span></i>
										</a></li>";
							echo "<li><a href='logout.php'><i class='icon-user'>
										<span style='font-size:9px; padding:0;'>wyloguj</span></i>
										</a></li>";
						}
					?>
							
							<li><a href='showcart.php'><i class="icon-basket">
							<span style='font-size:9px; padding:0;'>koszyk</span></i></a></li>
					</ul>
			    </div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div class="inside">
				<!--<a href="https://www.freepik.com/free-photo/bowl-with-tasty-sauce_973282.htm#page=2&query=local%20food%20background&position=0&from_view=search&track=ais">Image by valeria_aksakova</a> on Freepik-->
				<img style='width:100%; margin:0; display:block; position:relative;' src='inside.jpg'>
				<div class='text'>
					<h3 style='text-align:center; letter-spacing:2px; line-height:150%;' >Wierzymy, że najlepsze produkty </br> to te lokalne. </br>
					A najlepsi producenci to nasi sąsiedzi. </br>
					Dlatego oferujemy produkty </br>
					w pełni naturalne, </br>
					pochodzące jedynie od lokalnych wytwórców.</h3>
				</div>
				
		</div>
		<div id="menu">
			<?php showMenu();?>
		</div>
		<div id="content">
			<div id="page">