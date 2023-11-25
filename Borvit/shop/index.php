<?php

	require('header.php');

	$pdo = require 'connect.php';

		
		function show_category($category_id = null) {
			global $conn;

			if($category_id) {
				$stmt = $conn->prepare("SELECT * FROM products WHERE category_id= :cid");
				$stmt->bindValue(':cid', $category_id, PDO::PARAM_INT);
				$stmt->execute();
			}
			else {
				$stmt = $conn->prepare("SELECT * FROM products");
				$stmt->execute();
			}

			while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		
			$indeks = $row['indeks'];
			$id = $row['id'];
			
			//zdj.
			$images = getProductPictures($indeks);
			if(!empty($images)) {
				$image = $images[0];
			}
			else {
				$image = 'no-photo.jpg';
			}
			
			echo "<div class='product'>";
			echo "<a href='product.php?id=$id'><img src='img/mini/$image'>".$row['name']."<br />";
			echo "<span style='font-size:15px;'>".$row['price']." zł</span></a></div>";
			
			}	
			echo "<div style='clear:both;'></div>";
		}

		if (isset($_GET['category_id'])) {
			$category_id = $_GET['category_id'];
		}
		else {
			$category_id = null;
		}
		
		
		show_category($category_id);
		
		
	require('footer.php');
	
?>