<?php

	require('header.php');
	
	
		function showProduct($id){		
			global $conn;
			
			$stmt = $conn->prepare("SELECT * FROM products WHERE id=:id");
			$stmt->bindValue(':id', $id, PDO::PARAM_INT);
			$stmt->execute();
			

			while($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
				
				echo "<div id='details'>";
					//indeks do zdj.
					$indeks = $row['indeks'];
					//id z bazy będzie argumentem do addToCart, do funkcji add z klasy cart
					$id = $row['id'];
				
					echo "<div class='foto'>";
					
						foreach (getProductPictures($indeks) as $image) {
							
							echo "<div class='img'>";
								echo "<a href='img/$image'>";
								echo "<img style='margin:2px;' src='img/thumbs/$image'>";
								echo "</a>";
								echo "<a class='link' rel='lightbox[$indeks]' href='img/$image'><span class='search'><i class='icon-search'></i></span></a>";
							echo "</div>";
						}
						
						echo "<div style='clear: both;'></div>";
						
					echo "</div>";
					
					echo "<div class='name'>";
						echo "<h2>".$row['name']."</h2>";
						echo "<h3 style='margin-bottom:30px;'>Cena: ".$row['price']." zł</h3>";
						
						echo "<a href='addToCart.php?id=$id' class='button1'>Dodaj do koszyka</a>";
						
					echo "</div>";
					
					echo "<p style='clear:both; padding:15px; border-top:0.8px solid #D3DFFA;'>".$row['description']."</p>";
					
				
				echo "</div>";
			}
		}
			
		if(isset($_GET['id'])) {
			showProduct($_GET['id']);
		}		
		

	require('footer.php');
	
	//Images S01-0, S01-1, S01-2, Z01-1, Z01-2 from https://www.pexels.com/pl-pl/
	
	// no-photo <a href="https://www.freepik.com/free-vector/illustration-camera-icon_2606083.htm#query=no-image&position=1&from_view=search&track=sph">Image by rawpixel.com</a> on Freepik
	
	//Image Z01-0 <a href="https://www.freepik.com/free-photo/pumpkin-puree-glass-jar-pie-ingredient-closeup_17581672.htm#query=cream%20from%20pumpkin&position=15&from_view=search&track=ais">Image by rawpixel.com</a> on Freepik
	
	//M01-0 <a href="https://www.freepik.com/free-photo/delicious-honey-dark-surface_13806932.htm#query=honey&position=4&from_view=search&track=sph">Image by jcomp</a> on Freepik
	
	//M01-1 <a href="https://www.freepik.com/free-photo/delicious-honey-dark-surface_13806936.htm#page=4&query=jar%20of%20honey&position=6&from_view=search&track=ais">Image by jcomp</a> on Freepik
	
	//M01-2 <a href="https://www.freepik.com/free-photo/view-beekeeper-collecting-honey-beeswax_15986942.htm#page=2&query=honey&position=35&from_view=search&track=sph">Image by wirestock</a> on Freepik
	
	
	//Image P01-0 <a href="https://www.freepik.com/free-photo/front-view-raspberry-jam-jars_10889907.htm#query=jar%20of%20jam&position=1&from_view=search&track=ais">Freepik</a>
	
	//Image P01-1 by <a href="https://www.freepik.com/free-photo/raspberry-jam-glass-jars_10889926.htm#query=jar%20of%20jam&position=2&from_view=search&track=ais">Freepik</a>
	
	//Image P01-2 <a href="https://www.freepik.com/free-photo/front-view-jam-jar-with-raspberries_8926118.htm?query=jar%20of%20jam#from_view=detail_alsolike">Freepik</a>
	
	//B01-2 <a href="https://www.freepik.com/free-photo/homebaked-bread-sourdough-rye-bread-with-seeds-cut-into-slices-lies-cutting-board-loaf-bread-glass-milk-healthy-breakfast-idea-selective-focus-close-up-ears-wheat-table_22416073.htm#query=dark%20bread&position=24&from_view=search&track=ais">Image by ededchechine</a> on Freepik
	
	//B01-0 <a href="https://www.freepik.com/free-photo/delicious-healthy-wheat-rye-bread-with-seeds-sacking-close-up-with-selective-focus-fermented-wholesome-bread-healthy-food-loaf-gray-background-with-space-text_22416064.htm#query=dark%20bread&position=4&from_view=search&track=ais">Image by ededchechine</a> on Freepik

	//B01-1<a href="https://www.freepik.com/free-photo/baked-wheat-rye-bread-with-seeds-baking-dish-steam-rises-loaf-close-up-with-selective-focus-fermented-healthy-bread-dark-background-with-space-text_22416063.htm#query=dark%20bread&position=17&from_view=search&track=ais">Image by ededchechine</a> on Freepik
	
	//O01-1 Image by <a href="https://www.freepik.com/free-photo/close-up-ripe-chestnuts-background_5081103.htm#from_view=detail_alsolike">Freepik</a>

	//O01-0 Image by <a href="https://www.freepik.com/free-photo/close-up-view-nuts-concept-arrangement_10426033.htm#query=hazelnuts&position=37&from_view=search&track=sph">Freepik</a>
	
	//O01-2 Image by <a href="https://www.freepik.com/free-photo/nuts-arrangement-with-copy-space_10425803.htm#from_view=detail_serie">Freepik</a>

	
?>
		