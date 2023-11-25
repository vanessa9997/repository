<?php

	//nasz user 
	class user {
		private $id;
		private $login;
		private $customer;
		private $email;
		private $address;
		private $construct;
			
			
		//domyśnie konstruowana dla użytkownika anonimowego
		public function __construct($anonymous = true) {
				
				//jeśli jest anonimowy- przypisujemy zero i login pusty
				if($anonymous == true) {
					$this->id = 0;
					$this->login = '';
					$this->customer = '';
					$this->email = '';
					$this->address = '';
					
				}
				
				$this->construct = true;
		}
	
		
		//pola private- dla sessions(przypisanie zalogowanego użytkownika do sesji)
		public function setId($id) {
			$this->id = $id;
		}
		
		//sessions- updateSession(dla zalogowanego użytkownika)
		public function getId() {
			return $this->id;
		}


		public function setLogin($login) {
			$this->login = $login;
		}
		
		//doLogin
		public function getLogin() {
			return $this->login;
		}
		
		public function setCustomer($customer) {
			$this->customer = $customer;
		}
		
		public function getCustomer() {
			return $this->customer;
		}
	
		public function setEmail($email) {
			$this->email = $email;
		}
		
		public function getEmail() {
			return $this->email;
		}
	
		public function setAddress($address) {
			$this->address = $address;
		}
		
		public function getAddress() {
			return $this->address;
		}
	
		
		//do doLogin, jeśli porównanie będzie prawdziwe zwracamy true, nie to false
		public function isAnonymous() {
			return ($this->id == 0);
		}
		
		
		public function checkPasswords($login, $password) {
			global $conn;
			
			$stmt = $conn->prepare("SELECT * FROM users WHERE login=:login");
			$stmt->bindValue(":login", $login, PDO::PARAM_STR);
			//$stmt->bindValue(":password", $password, PDO::PARAM_STR);
			$stmt->execute();
			
			
			//jeśli coś zwróci tzn. że logowanie się udało, zwracamy użytkownika, jeśli nie zwracamy 0
			if($row = $stmt->fetchAll(PDO::FETCH_ASSOC)) {
				
				if(password_verify($password,$row[0]['password'])){
				
					$newUser = new user;
					$newUser->setId($row[0]['id']);
					$newUser->login = $row[0]['login'];
					$newUser->customer = $row[0]['customer'];
					$newUser->email = $row[0]['email'];
					$newUser->address = $row[0]['address'];
					
					return $newUser;
				}
				else {
					return 0;
				}
			}
			else {
				return 0;
			}
		}
		
	}
	
?>