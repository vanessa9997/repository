<?php 


	class userRequest{
		
			public $browser;
			public $ip;
			public $info;
			
			
		//nowy request postaje- do pól browser, ip i info przypisywane są user-agent, ip i losowy element
		public function __construct() {
			
			//pobieramy info o przeglądarce użytkownika i jego ip
			//żeby go identyfikować przy kolejnych odwiedzinach
			//$_SERVER zmienna globalna, który posiada informacje o nagłówkach, ścieżkach i miejscach skryptów
			$this->browser = $_SERVER["HTTP_USER_AGENT"];
			$this->ip = $_SERVER["REMOTE_ADDR"];
			//dodatkowe zabezpieczenie losowy hash z przeglądarki, ip + jakiegoś stringu
			//uniq_info z bazy danych, md5- 32 znaki
			$this->info = md5($this->browser.$this->ip."fdi409wjk2");
		}
		
		//dla sessions(zakładania nowej sesji)
		public function getIp() {
			return $this->ip;
		}
			
		public function getBrowser() {
			
			//przycinamy ten user agent do 120 znaków
			$agent = substr($this->browser, 0, 128);
			return $agent;
		}
			
		public function getInfo() {
			return $this->info;
		}
		
	}

?>