-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Wrz 2023, 17:44
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Zbożowe'),
(2, 'Orzechy'),
(3, 'Soki'),
(4, 'Miody'),
(5, 'Zupy'),
(6, 'Przetwory');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `contact`
--

INSERT INTO `contact` (`id`, `email`, `subject`, `content`) VALUES
(24, 'tomek123@gmail.com', 'lorem ipsum', 'lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id`, `customer`, `address`, `email`, `date`, `amount`) VALUES
(47, 'Adam Wiśniewski', 'Sopot, ul. Prosta 56', 'wisniewski@gmail.com', '2023-09-19', '26.98');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(54, 47, 1, 1),
(55, 47, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `indeks` varchar(10) NOT NULL,
  `name` varchar(160) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `indeks`, `name`, `description`, `price`, `category_id`) VALUES
(1, 'O01', 'Orzechy laskowe 350 g', 'Producent: Uprawy Kowalskich.\r\nWoreczek orzechów o wadze 350g. Te pożywne owoce leszczyny są podstawowym składnikiem mieszanki studenckiej. Zmielone grubo lub na mąkę wchodzą w skład ciast, past i innych deserów. Doskonale smakują jako dodatek do pieczenia chleba lub do porannej owsianki.', 19.99, 2),
(2, 'S01', 'Sok marchew-pomarańcza 350ml', 'Producent: Bracia Kowalscy.\r\nSkład: 50 % sok z marchwi, 47 % sok pomarańczowy, 3 % sok imbirowy.\r\nSok bogaty w błonnik, witaminę C i beta-karoten. Wyjątkowy smak, łączący w sobie intensywny aromat pomarańczy oraz słodki smak marchwi. Odpowiednia dawka energii na cały dzień. \r\n\r\n\r\n\r\n\r\n', 12.99, 3),
(3, 'P01', 'Dżem malinowy 280 g', 'Producent: Miejsce natury.\r\nSkład: maliny (odmiany polana), woda, cukier. Sporządzono z 80g owoców na 100g produktu. Naturalny dżem bez konserwantów, z przydomowych malin, pasteryzowany. Wyczuwalne pestki. W pełni naturalny.', 8.99, 6),
(4, 'B01', 'Chleb żytni pełnoziarnisty 500g', 'Producent: Domowa piekarnia Lucyny.\r\nSkład: mąka żytnia, zakwas żytni, ziarno żyta, słonecznik, drożdże.\r\nChleb żytni 100% pełnoziarnisty z ziarnem żyta i słonecznikiem, pieczony wg własnej receptury, chleb mokry, ziarnisty na zakwasie. Sycący, o ciemnej barwie i świeżym aromacie.', 6.99, 1),
(5, 'M01', 'Miód wielokwiatowy 500ml', 'Producent: Pasieka Ostrowskich.\r\nSkład: miód wielokwiatowy nektarowy.\r\nMiód powstał z nektaru wielu gatunków kwiatów połączonych w rozmaitych proporcjach. Bogaty smakowo, niezwykle odżywczy, wspomaga serce i układ krążenia, podnosi odporność, niezastąpiony dodatek w kuchni.', 24.99, 4),
(6, 'Z01', 'Zupa krem z dyni 500ml', 'Producent: Przetwórnia babci.\r\nSkład: dynia, marchew, pietruszka, seler, cebula, imbir, czosnek, sól, pieprz, oliwa, mleko kokosowe, bulion warzywny.\r\nAromatyczna, aksamitna, bardzo sycąca, dostarcza porządnej porcji witamin i minerałów, idealna w okresie jesienno-zimowym.\r\n\r\n', 19.99, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessioncart`
--

CREATE TABLE `sessioncart` (
  `id` int(11) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `salt_token` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uniq_info` varchar(32) NOT NULL,
  `browser` text NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `sessions`
--

INSERT INTO `sessions` (`session_id`, `updated_at`, `salt_token`, `user_id`, `uniq_info`, `browser`, `ip`) VALUES
('0aPYZzXHhatGQ1KSd09KEVZQd0x1QE1694598720', 1694598924, '3YsPqF4nIt', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('0BJLitaGH7oCZ3nYwImpx5KK3pCbQW1694948463', 1694948561, 'QyMAz5lxcq', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('0F7482AUtHzHfY4sgyZR35BE0Ck8EB1694610293', 1694611716, 'Kcr3jWWvU8', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('1ELzFEBVe14tjrMEkIkT2MbLXpsNLg1694948567', 1694949003, 'eG405STGxn', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('1L1aEuCwHgijZGCEtwfoTOhEeRZrlJ1694867120', 1694869373, 'WNoJo1FFeA', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('1mW7JfYqepTpsbsT9xMqdoCfHsRhrZ1694860247', 1694860714, 'YV8ir3i0N9', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('1P9OR9WVsoERgUAOzij0i977D5mhBw1694692476', 1694692521, 'UWNQHdfG8p', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('24sG0t9f7id3aIFxB4WIlOhxI08VFU1694599498', 1694599782, 'zLH7RPVD7y', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('2onNNDjqh5MPtM1T8aWoR2gOah1kcB1694949009', 1694949010, '4eED0RS44z', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('4FIuCiMZSmWJ2kOyqt9X2moJN3i6uv1694795270', 1694795494, 'KbnW6me7mU', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('6bAn5ac91GopvSnxiiazs7pN1SpnZD1694689129', 1694689290, '19qKveGiMG', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('6MtaDDDi0TICZo1HJNQnpuheIOOaiT1694710503', 1694710617, 'g9h7N3N5s1', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('6rzwFW8wNOFS8BziGRYaX6w9WbIxfj1694707857', 1694710497, 'xAYYioxSCu', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('7e8PeI4w3uTCZnGctnX1pULQNhTgLZ1694615375', 1694615375, 'aeh07V6U0b', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('7G6HkjPrjTh7hqV9euwqFUSplyY7Xk1694964914', 1694964927, 'l4o3Eg8V5g', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('7okdxrKMlNWLFa8F9fzxyyvn9GxDOt1694616781', 1694616781, '1RDJYx8P7d', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('93Y23UN7KHgQK9pmcLk8grmZBhHiFS1694790087', 1694790366, '2MS59wABPL', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('9qRCdHGWzmBBc0WHbP6YkpOVdbkEUD1694967140', 1694967286, 'SrAmwoQPkV', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('aONm1HPtK2LQxGtmGIljUop9qjJVGy1694692599', 1694692681, 'UhLtBNFAS0', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('ArpD627sV4oANkWIRzppbcWzyKy9ms1694879504', 1694884286, '3Ss8XEoiSU', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('aSvQfv12MpZ8CPayNQ12J1bY05FlWm1695027289', 1695027470, 'fNACC3khAy', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('AY0jNive4K75lMdJmINzA1hM5DyTQA1694964154', 1694964707, 'oeiZbs9XHq', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('aZj7Cu2A8T95A3X1nDKdwHMAYVbd2U1694942122', 1694944835, 'n5xxyVjvJz', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('b1k5AR7B2t5Q2p24RMAdVb0C7SSucO1694862936', 1694865431, 'zm1h7Z1AH9', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('blryqh86ygG3FnjrhMvrNYgKrYoz7Z1694870526', 1694870536, 'hpWi7UyZIo', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('BMPjJAVNCbOwlPK9YjMlh5QkC60r6K1694598928', 1694599491, '3SlVzhCaYR', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('bNCPdZZmXb91OO7YE9HHFLroLUehCg1694967296', 1694968196, 'YeDmtdLiPb', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('C30z4PfJKoVelskYBvIWy5Sep2LIbv1694693297', 1694693574, 'movnjwcyuN', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('cI2PpqsQqfxIFnZybBXfOkYXKysk911694619585', 1694619897, '3oXpJr5kEq', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Cts63bwJwEGyqYbGhHIRdwBpk8LfIQ1694946662', 1694946680, 'NUaCkCxd4O', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('CuAv1GyqUMHF0UAFg467PvGaqWL1Tg1694793070', 1694793376, 'WfVrFG9UHj', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('cWNZ53hkI01snasdrYxBFdJZdqk6oc1694947175', 1694948197, '2DZJFhrFej', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('de7bxo8985dLkqjSN3EGZQDmvUriv21694870682', 1694871152, 'aPK3vMdpNy', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('DJe1bkf6nkwqYGyvfv3mIEIcV5pAvD1694965025', 1694965602, 'n7EcFJqNEq', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('DVnpiInpavawvhmaBXE9BycIhzEqBQ1694625707', 1694625739, 'sdFfKjpQK3', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('DWOTT8YXYxpTsVmGypdfUMyM3pjBR01694693579', 1694693581, 'VYQyQHO9TL', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('e3ZCDTVHuOUBVdGynlxxJJIKBCLRfu1694616788', 1694617579, 'Cpi5KgGb6j', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('E587nG0sYR2RNDU6yjpkg9S239vuMK1694689299', 1694691736, '2BlUVqUjKN', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Euti2JhF5orD4b8QZfef6r9qKDuTiF1695037243', 1695037354, 'OTjf3sab6e', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('FaemajTOUkMcjsS5nSG8HQI5zrIxl21695027515', 1695028264, 'SevJaU2mho', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('g9mxbDWx1uICx1xWD3EC6MKzajxSkl1694865437', 1694865801, 'kCZZBmz54O', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('gDloeZPlxT886RMA3GHVrIGk92jXBd1694945678', 1694946645, 'HQIzdGqh6o', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('GHQGALSN9BfMPsaIFmfewQoWhKRoEI1694793385', 1694794202, '5Gu0ciD3lb', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('gMtBHfPYD7CfuaF5YsTMtOuXfIeX0x1695028571', 1695029102, 'XsiULWdv60', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('GsP0ieiI9NrQXOL33rG29wPDW5z9lN1694625810', 1694625849, '7rZa81ZfIH', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('GsvWfW6aXcsxo57ZQHr52CIvdYAviL1694949369', 1694949384, 'IWyEYWaA2r', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('GX7zmr9ko8wSBNvwznmDRDEHg7Fff01694788548', 1694790076, 'H4GbjF9qMT', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('GYgtPnjJt3pHjUkFdDxHB1NVtUplqA1694706971', 1694707023, 'UqkB3cO1lu', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('gZRUqsMl4zpxsFQPh8iTDYoflEtLza1694692686', 1694692812, 'JChL65ctAh', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('hCwkKZVIWOiKcJLu3O6EyPz0jh8E8l1694965987', 1694966253, 'qLEXs9YW9o', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('HQo2SI4VI71Lbo686BT89gFMXpG6WL1694963934', 1694964086, 'uHqQSk0w3P', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('hwTfUSZ6c6J4lRl6wg7ggCOq7hfQki1694966487', 1694966774, 'hwtSyMrqQx', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('IBN1QTO4VlQmrAzQemJ3K1xQ8oO90l1694946839', 1694947098, 'us7kSc6TA9', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('IFjQWM2oXjt5ssGythcbvHADrgYh4g1694963773', 1694963920, 'zLw5JJDco1', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('IIHsVhe6FjkMJqg8K5wIpdVaPNpK151694618977', 1694619394, 'eA4gRHlcPI', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('imOuW78CRwMLhu34s5x3LiwMJgiItT1694700847', 1694701044, 'Lov6LoxnhW', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('iqw2xYPJ03dOhJTcfQzl3hmyNCqQTI1694947103', 1694947132, 'L94uLfGG3W', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('jeZxmXF97Zqxvy3ix5vrooLxI45Dsl1694965607', 1694965611, 'kOQLbzr5YD', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('JhGWcx3KPpPTSjDgZRoWw3cYBb6jQS1694597158', 1694598689, 'WHCtWnLuJj', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('jHnRTs6ORQs95auxGukuEm5dbd6Z8a1695028269', 1695028413, '4Ly5v6yBqF', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('JIYtmNDhvTBOqgV3C7LTmPfChJUYKQ1694610180', 1694610288, 'Gl72TEPigJ', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('jmYJxbXq65TGMGafpTeCilZbomYyZc1694707184', 1694707224, 'QxDIhJsD47', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('JuxNOy85ND1HziV1lDTmfibelSVvNq1694871158', 1694871979, 'WydYE5SmFu', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('jx2epFwNaqCofAaE0DV6utEVmRDPtS1694707031', 1694707178, '5TlDeqRWBM', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('K3DVhdKmEpUJA1pNASKJOl947r1VqD1694949487', 1694949532, 'wbiV5qF9Fo', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('KGKXOnWUKQMyGL8usA3SOQ7oxOsJV31694619398', 1694619580, '8OyXl6MCNy', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Kk3LiMwNd5VzEd2hh4x14rybBm4GUj1694948202', 1694948277, 'ulbcBKRqiz', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('kNujiWwIdwnfHYcI7ZWSnduH6ydDfw1694686537', 1694688715, 'JyFnNAgTqx', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('KoW2k58HqBBBXIbX5Qqc1kP4nDcgIl1694948282', 1694948457, 'r04Jpg7yoG', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('LZjfEP0kYHeenyeKdaGVnh5B5E0aFR1694968495', 1694968514, 'QP8uRyHhPo', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('MQ9u5x5JNKO6tRDINHMzOkrPBekS9i1694616010', 1694616010, '1GOZ4CENXY', 0, '9f618e3583b0182d5387c0c17df380d6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.0.0', '::1'),
('MrTmDOujkYGuuvshBh6lLsMYzIyATZ1694692526', 1694692564, '3FG55EPDAS', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('mw2xfVtKyt0ujkeQqv12LcU2P2UzgU1695138219', 1695138219, 'h8eayIGSnW', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('N1Arfpafex01T2Z00Ojp6tUx8zqUBR1694620925', 1694621375, 'DgisY4iNjZ', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('nFvGEZf4ucmdXuE4GTgQNz9SQq10LG1694794234', 1694795265, 'bQxDsWrL0j', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('NK5UmFqVyXsYxPYO1ZRFLLkw5xPEjP1694701048', 1694701318, 'L4YqMfIjyB', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('nSIgvddsBare4KxoSBzLEf8jCJQqiU1694968454', 1694968489, 'L2PfCT8wJh', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Nxv8Dg5n0IogFpQER3MOsflQbl0JFq1694968898', 1694968898, 'Rv6N8kfXxl', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('OnDcrQOC7Y2jcoDRfKaxN2i0JP4EcI1694790372', 1694791751, 'Pbg0hcsiqk', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('OOc0xMKetCsoyy4SLv4iiCzXsnnXzB1694947149', 1694947170, 'fL4n1p500s', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('p0fMfovnesXF7PSPj7bQOU0YbBm2mI1694625854', 1694626033, 'r0tCbbDwFa', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('P852SM1SOCObOKhnmVjImr9kMOU9bp1694968418', 1694968448, 'RvWLj5WGUc', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('p96ZwseAPsoHEgWHmuXHj0p70EwWxd1694692189', 1694692468, 'FdX8yPRCIn', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('pDwHwv3iaw3eoEZSuXWfrTRTnSXVyS1694617586', 1694618711, 'NSavhDBiMJ', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('pjJghoP5OY6OwBL0i47LPlOzmgj6hh1694707267', 1694707852, 'JZpdsFxMt3', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('PoNpxRVyhNleCQ87ropskwXgLbERec1695037374', 1695037671, 'DSuJZU6LD2', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('pQbAkmdE5DOyXAPBViCsqnrzvy8PWl1694949801', 1694949801, '9YeXbHK6lf', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('py2okDwSweOSYNPgp61Hy7QcA9EiJf1694688785', 1694689115, 'HsrjVmDLti', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('q9bvL8mujOgObjQcRZdOkrSwqaDzzd1694945481', 1694945663, 'jPZDwHbnRg', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Qa24qWv01F7FyGsYD5dbuV2CrUfs281694692569', 1694692569, 'snPZ1thttV', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('qc1cxZq17HagOoX5WL1sUotFwpdv7i1694618778', 1694618970, 'lb08EpZ0CO', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('qiYgSsRJWok5PPkJ2lgJ38hTh1Ilvn1694615389', 1694615897, 'lJIa7MCT4l', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('QKPZpxixnKZWz3TbsXStM3RQEt4YYA1694625746', 1694625785, 'soWgOM6D0O', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('qpLqCOMEX80MGle5X1kVumWlFcXt2S1694966780', 1694967134, 'WCi9SXnID6', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('qVPxDiiDANcCPyl98weZq35zEPTDyf1694693147', 1694693291, 'H9PoAvXDk3', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('rKbgkmsQfRdlViwB9Oe2b2ZX1TaO8V1694860719', 1694862930, 'eitizqvcG8', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('rmSkrJlq3jpmCs9G0SxSayBW62nuoX1694869378', 1694869620, 'GQLUAygXHA', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('saPEjYZIWrsEWRmKiQrf6h1r4W9pbY1694964712', 1694964907, 'sTecNUxckY', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('SGm4KQCSlPAMbU1lnTlEnlxxPUmd2v1694963766', 1694963768, 'OYKkEgG3UH', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('SS4ar3VyC43GwJ6xZFqOFY6o2WLL5M1694618773', 1694618774, 'npeMZneO4s', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('sVBeDJYUiDEuTcleT0AsOdVK1w6SV81694791758', 1694792242, 'uMze9eWsTr', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Td1h7udHSYTtbCdc1sFnHkWOOorIwN1694691740', 1694692182, 'SyFuHOa6Jd', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('TEthuSx2vNflMcoc0D5m38ktRDlfDG1694946757', 1694946834, 'BMd6gQ0T8a', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('tEWSrXsEErPzfMEd9qNP0hAxRzqX631694692819', 1694693141, 'vz2kaTxRFO', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('u0CHKXv6GR9mpJkUN5Ujs8AfZv4E6Y1694615982', 1694615984, 'bSC7ni4FgO', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('U9KUENHsxTdEw1lCsEQbzpKyl9ApY21694869633', 1694870510, 'hPfQHVgBuR', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Uh2JIYy6fATh8ARYTosUaun2HyLE091694625024', 1694625699, 'v1xY3lNZKy', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('V20dcAooF20Fhpmdn9f7wZMKMlgOoT1694795500', 1694796131, 'RiVQLxX9Lp', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('v9EvzyiLWy6XYO9wyCFwLLBQbCtnNt1694949044', 1694949112, 'w2JQxrit8v', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('VIRbIJPUCvFbV38yd7YKTpWpTPSQyH1695037766', 1695037772, 'UlTXj45x17', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('VPVimcMlQs8ZdggtD9awZ7Vrugtbhd1694968610', 1694968622, 'RiLJTRVNLI', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('WAsIvXrNsxVKQ8KGFV4lsyyXJ8IWB31694615904', 1694615940, 'GsAon1v7QZ', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('WU8Z0QOWdnA2qzIKJosyFmyk64XDwn1694688735', 1694688778, 'nDpZHFKJBJ', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('xIw18v2m3aYUyVcckCn1MKh6JarbBA1695027277', 1695027284, 'YcfXpVxYPt', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('XzKfvoFx1Xwsq2CqrQ8UYnbYnkzQob1694705992', 1694706965, '18s6Eo5Kqt', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('XZXl2mZI1yTcFZmXU4ZNJHVdxlGuQx1694949423', 1694949423, 'IMpBMHUZog', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('y9MHgyx86xCUxHW9KJzkiCeneI3ljl1694619902', 1694620919, 'fI6FtbM8vN', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('ycfuLoXh2I1XY3yXvX7ZKAKbuOCngs1694710622', 1694710840, 'KBw6g0Ypu5', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('YNRcwudnfG5TZtDTDTn7FOEb1qNBLs1694964091', 1694964139, 'RX4rAZ5cIa', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('YQEgq3aNaSi23ZyWIGTMXCnsy5UeVd1694968228', 1694968413, 'OoxtoRwIjN', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('YS9EwUat13yrzVlNMWxkQ5rVvEHzwh1694944841', 1694945476, 'gDTPihLKVD', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('YX1W1Ez07X8H6BeXMNqkkqvMNMc8XC1694787489', 1694788543, 'l0NQXTr4z0', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('Z47I1MznYRbqiBIUAYnJtRZSCDofp01694610099', 1694610175, '7XbF5EMsGl', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('ZIGWQFS7CuAJNsI4V9PTGpEn2xaVdy1695027474', 1695027509, 'm804J3jaXh', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('zXDkrAYUpCFqgrFmfoczaYgwIjGt6t1695037877', 1695037889, 'DGdhmGNK04', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1'),
('ZZUJ72w8OgJyhU5hldt1nFdpw8cIgj1695028420', 1695028485, 'w0Dzlf51jD', 0, '153f449300adad2461eac75ebf7e88fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', '::1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `customer`, `email`, `address`) VALUES
(1, 'adam123', '$2y$10$pzMDaZQadM1waaY97HXAKeWpg9j2DwT6Jiw/owgJvsvbCPnBFz7Tq', 'Adam Wiśniewski', 'wisniewski@gmail.com', 'Sopot, ul. Prosta 56'),
(2, 'jan123', '$2y$10$.a2PKzbeyuNShZz6g1aeMOnWWvKelciwecRATWnTvTbMR7p9h5oGq', 'Jan Kowalski', 'kowalski@gmail.com', 'Kraków, ul. Długa 23'),
(3, 'pawel123', '$2y$10$sSfoBfJDhTqJ98xBbKOMMepedDsnkuvDRxapneSeocIrYLYqr9iE.', 'Paweł Dąbrowski', 'dabrowski@gmail.com', 'Wrocław, ul. Ogrodowa 121'),
(4, 'marek123', '$2y$10$YIG0QZU9XmNNm.99YNw1NeWGtXGA5RDCYVBZQYIXSGBN8yfRCBQZm', 'Marek Nowakowski', 'nowakowski@gmail.com', 'Lipowo, ul. Równa 7');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `sessioncart`
--
ALTER TABLE `sessioncart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT dla tabeli `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `sessioncart`
--
ALTER TABLE `sessioncart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Ograniczenia dla tabeli `sessioncart`
--
ALTER TABLE `sessioncart`
  ADD CONSTRAINT `sessioncart_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`),
  ADD CONSTRAINT `sessioncart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
