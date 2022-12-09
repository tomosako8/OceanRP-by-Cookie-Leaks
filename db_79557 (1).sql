-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 87.98.236.134:3306
-- Czas generowania: 09 Gru 2022, 15:03
-- Wersja serwera: 10.5.15-MariaDB-0+deb11u1
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_79557`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'Caution', 0),
('property_black_money', 'Mieszkanie', 0),
('society_ambulance', 'Ambulance', 1),
('society_baker', 'Piekarz', 1),
('society_burgershot', 'Burgershot', 1),
('society_cardealer', 'Lux MotorSport', 1),
('society_casino', 'Casino Royale', 1),
('society_courier', 'Go Postal', 1),
('society_doj', 'Department Of Justice', 1),
('society_dtu', 'DTU', 1),
('society_extreme', 'Extreme Sports', 1),
('society_farming', 'Farmer', 1),
('society_fisherman', 'Rybak', 1),
('society_galaxy', 'Galaxy Club', 1),
('society_garbage', 'Śmieciarz', 1),
('society_gheneraugarage', 'Ghenerau Garage', 1),
('society_grower', 'Winiarz', 1),
('society_highcommand', 'highcommand', 1),
('society_hwp', 'Highway Patrol', 1),
('society_hwp1', 'Highway Patrol', 1),
('society_krawiec', 'Fly Beliodas', 1),
('society_mechanik', 'LS Customs', 1),
('society_mechanik2', 'Mechanik 2', 1),
('society_mechanik3', 'Mechanik 3', 1),
('society_mechanik4', 'Mechanik 4', 1),
('society_milkman', 'Mleczarz', 1),
('society_miner', 'Górnik', 1),
('society_org1', 'Organizacja 1', 1),
('society_org10', 'Organizacja 10', 1),
('society_org100', 'Organizacja 100', 1),
('society_org101', 'Organizacja 101', 1),
('society_org102', 'Organizacja 102', 1),
('society_org103', 'Organizacja 103', 1),
('society_org104', 'Organizacja 104', 1),
('society_org105', 'Organizacja 105', 1),
('society_org106', 'Organizacja 106', 1),
('society_org107', 'Organizacja 107', 1),
('society_org108', 'Organizacja 108', 1),
('society_org109', 'Organizacja 109', 1),
('society_org11', 'Organizacja 11', 1),
('society_org110', 'Organizacja 110', 1),
('society_org111', 'Organizacja 111', 1),
('society_org112', 'Organizacja 112', 1),
('society_org113', 'Organizacja 113', 1),
('society_org114', 'Organizacja 114', 1),
('society_org115', 'Organizacja 115', 1),
('society_org116', 'Organizacja 116', 1),
('society_org117', 'Organizacja 117', 1),
('society_org118', 'Organizacja 118', 1),
('society_org119', 'Organizacja 119', 1),
('society_org12', 'Organizacja 12', 1),
('society_org120', 'Organizacja 120', 1),
('society_org13', 'Organizacja 13', 1),
('society_org14', 'Organizacja 14', 1),
('society_org15', 'Organizacja 15', 1),
('society_org16', 'Organizacja 16', 1),
('society_org17', 'Organizacja 17', 1),
('society_org18', 'Organizacja 18', 1),
('society_org19', 'Organizacja 19', 1),
('society_org2', 'Organizacja 2', 1),
('society_org20', 'Organizacja 20', 1),
('society_org21', 'Organizacja 21', 1),
('society_org22', 'Organizacja 22', 1),
('society_org23', 'Organizacja 23', 1),
('society_org24', 'Organizacja 24', 1),
('society_org25', 'Organizacja 25', 1),
('society_org26', 'Organizacja 26', 1),
('society_org27', 'Organizacja 27', 1),
('society_org28', 'Organizacja 28', 1),
('society_org29', 'Organizacja 29', 1),
('society_org3', 'Organizacja 3', 1),
('society_org30', 'Organizacja 30', 1),
('society_org31', 'Organizacja 31', 1),
('society_org32', 'Organizacja 32', 1),
('society_org33', 'Organizacja 33', 1),
('society_org34', 'Organizacja 34', 1),
('society_org35', 'Organizacja 35', 1),
('society_org36', 'Organizacja 36', 1),
('society_org37', 'Organizacja 37', 1),
('society_org38', 'Organizacja 38', 1),
('society_org39', 'Organizacja 39', 1),
('society_org4', 'Organizacja 4', 1),
('society_org40', 'Organizacja 40', 1),
('society_org41', 'Organizacja 41', 1),
('society_org42', 'Organizacja 42', 1),
('society_org43', 'Organizacja 43', 1),
('society_org44', 'Organizacja 44', 1),
('society_org45', 'Organizacja 45', 1),
('society_org46', 'Organizacja 46', 1),
('society_org47', 'Organizacja 47', 1),
('society_org48', 'Organizacja 48', 1),
('society_org49', 'Organizacja 49', 1),
('society_org5', 'Organizacja 5', 1),
('society_org50', 'Organizacja 50', 1),
('society_org51', 'Organizacja 51', 1),
('society_org52', 'Organizacja 52', 1),
('society_org53', 'Organizacja 53', 1),
('society_org54', 'Organizacja 54', 1),
('society_org55', 'Organizacja 55', 1),
('society_org56', 'Organizacja 56', 1),
('society_org57', 'Organizacja 57', 1),
('society_org58', 'Organizacja 58', 1),
('society_org59', 'Organizacja 59', 1),
('society_org6', 'Organizacja 6', 1),
('society_org60', 'Organizacja 60', 1),
('society_org61', 'Organizacja 61', 1),
('society_org62', 'Organizacja 62', 1),
('society_org63', 'Organizacja 63', 1),
('society_org64', 'Organizacja 64', 1),
('society_org65', 'Organizacja 65', 1),
('society_org66', 'Organizacja 66', 1),
('society_org67', 'Organizacja 67', 1),
('society_org68', 'Organizacja 68', 1),
('society_org69', 'Organizacja 69', 1),
('society_org7', 'Organizacja 7', 1),
('society_org70', 'Organizacja 70', 1),
('society_org71', 'Organizacja 71', 1),
('society_org72', 'Organizacja 72', 1),
('society_org73', 'Organizacja 73', 1),
('society_org74', 'Organizacja 74', 1),
('society_org8', 'Organizacja 8', 1),
('society_org80', 'Organizacja 80', 1),
('society_org81', 'Organizacja 81', 1),
('society_org82', 'Organizacja 82', 1),
('society_org83', 'Organizacja 83', 1),
('society_org84', 'Organizacja 84', 1),
('society_org85', 'Organizacja 85', 1),
('society_org86', 'Organizacja 86', 1),
('society_org87', 'Organizacja 87', 1),
('society_org88', 'Organizacja 88', 1),
('society_org89', 'Organizacja 89', 1),
('society_org9', 'Organizacja 9', 1),
('society_org90', 'Organizacja 90', 1),
('society_org91', 'Organizacja 91', 1),
('society_org92', 'Organizacja 92', 1),
('society_org93', 'Organizacja 93', 1),
('society_org94', 'Organizacja 94', 1),
('society_org95', 'Organizacja 95', 1),
('society_org96', 'Organizacja 96', 1),
('society_org97', 'Organizacja 97', 1),
('society_org98', 'Organizacja 98', 1),
('society_org99', 'Organizacja 99', 1),
('society_pizzeria', 'Pizza This', 1),
('society_police', 'SASP', 1),
('society_psycholog', 'LSPO', 1),
('society_pullpet', 'Pullpet Company', 1),
('society_rafiner', 'Rafiner', 1),
('society_sams', 'sams', 1),
('society_sams2', 'Ambulance', 1),
('society_sert', 'SERT', 1),
('society_sheriff', 'SASD', 1),
('society_slaughter', 'Rzeźnik', 1),
('society_strefy', 'strefy', 1),
('society_strefy1', 'strefy1', 1),
('society_strefy10', 'strefy10', 1),
('society_strefy2', 'strefy2', 1),
('society_strefy3', 'strefy3', 1),
('society_strefy4', 'strefy4', 1),
('society_strefy5', 'strefy5', 1),
('society_strefy6', 'strefy6', 1),
('society_strefy7', 'strefy7', 1),
('society_strefy8', 'strefy8', 1),
('society_strefy9', 'strefy9', 1),
('society_swat', 'SWAT', 1),
('society_taxi', 'Taxi', 1),
('society_usms', 'USMS', 1),
('society_weazel', 'Weazel News', 1),
('society_wiesbuda', 'WiesBuda', 1),
('society_winiarz', 'Winiarz', 1),
('society_x-gamer', 'X-Gamer', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `account_money` double DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `account_black_money` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Mieszkanie', 0),
('society_ambulance', 'Ambulance', 1),
('society_baker', 'Piekarz', 1),
('society_burgershot', 'Burgershot', 1),
('society_cardealer', 'Lux MotorSport', 1),
('society_casino', 'Casino Royale', 1),
('society_courier', 'Go Postal', 1),
('society_doj', 'Department Of Justice', 1),
('society_dtu', 'DTU', 1),
('society_extreme', 'Extreme Sports', 1),
('society_farming', 'Farmer', 1),
('society_fisherman', 'Rybak', 1),
('society_galaxy', 'Galaxy Club', 1),
('society_garbage', 'Śmieciarz', 1),
('society_grower', 'Winiarz', 1),
('society_highcommand', 'highcommand', 1),
('society_hwp', 'Highway Patrol', 1),
('society_hwp1', 'Highway Patrol', 1),
('society_krawiec', 'Fly Beliodas', 1),
('society_mechanik', 'LS Customs', 1),
('society_mechanik2', 'Mechanik 2', 1),
('society_mechanik3', 'Mechanik 3', 1),
('society_mechanik4', 'Mechanik 4', 1),
('society_milkman', 'Mleczarz', 1),
('society_miner', 'Górnik', 1),
('society_org1', 'Organizacja 1', 1),
('society_org10', 'Organizacja 10', 1),
('society_org100', 'Organizacja 100', 1),
('society_org101', 'Organizacja 101', 1),
('society_org102', 'Organizacja 102', 1),
('society_org103', 'Organizacja 103', 1),
('society_org104', 'Organizacja 104', 1),
('society_org105', 'Organizacja 105', 1),
('society_org106', 'Organizacja 106', 1),
('society_org107', 'Organizacja 107', 1),
('society_org108', 'Organizacja 108', 1),
('society_org109', 'Organizacja 109', 1),
('society_org11', 'FOS', 1),
('society_org110', 'Organizacja 110', 1),
('society_org111', 'Organizacja 111', 1),
('society_org112', 'Organizacja 112', 1),
('society_org113', 'Organizacja 113', 1),
('society_org114', 'Organizacja 114', 1),
('society_org115', 'Organizacja 115', 1),
('society_org116', 'Organizacja 116', 1),
('society_org117', 'Organizacja 117', 1),
('society_org118', 'Organizacja 118', 1),
('society_org119', 'Organizacja 119', 1),
('society_org12', 'Organizacja 12', 1),
('society_org120', 'Organizacja 120', 1),
('society_org13', 'Organizacja 13', 1),
('society_org14', 'Organizacja 14', 1),
('society_org15', 'Organizacja 15', 1),
('society_org16', 'Organizacja 16', 1),
('society_org17', 'Organizacja 17', 1),
('society_org18', 'Organizacja 18', 1),
('society_org19', 'Organizacja 19', 1),
('society_org2', 'Organizacja 2', 1),
('society_org20', 'Organizacja 20', 1),
('society_org21', 'Organizacja 21', 1),
('society_org22', 'Organizacja 22', 1),
('society_org23', 'Organizacja 23', 1),
('society_org24', 'Organizacja 24', 1),
('society_org25', 'Organizacja 25', 1),
('society_org26', 'Organizacja 26', 1),
('society_org27', 'Organizacja 27', 1),
('society_org28', 'Organizacja 28', 1),
('society_org29', 'Organizacja 29', 1),
('society_org3', 'Organizacja 3', 1),
('society_org30', 'Organizacja 30', 1),
('society_org31', 'Organizacja 31', 1),
('society_org32', 'Organizacja 32', 1),
('society_org33', 'Organizacja 33', 1),
('society_org34', 'Organizacja 34', 1),
('society_org35', 'Karypel Genk', 1),
('society_org36', 'Organizacja 36', 1),
('society_org37', 'Organizajca 37', 1),
('society_org38', 'Organizacja 38', 1),
('society_org39', 'Organizacja 39', 1),
('society_org4', 'Organizacja 4', 1),
('society_org40', 'Organizacja 40', 1),
('society_org41', 'Organizacja 41', 1),
('society_org42', 'Organizacja 42', 1),
('society_org43', 'Organizacja 43', 1),
('society_org44', 'Organizacja 44', 1),
('society_org45', 'Organizacja 45', 1),
('society_org46', 'Organizacja 46', 1),
('society_org47', 'Organizacja 47', 1),
('society_org48', 'Organizacja 48', 1),
('society_org49', 'Organizacja 49', 1),
('society_org5', 'Organizacja 5', 1),
('society_org50', 'Organizacja 50', 1),
('society_org51', 'Organizacja 51', 1),
('society_org52', 'Organizacja 52', 1),
('society_org53', 'Organizacja 53', 1),
('society_org54', 'Organizacja 54', 1),
('society_org55', 'Organizacja 55', 1),
('society_org56', 'Organizacja 56', 1),
('society_org57', 'Organizacja 57', 1),
('society_org58', 'Organizacja 58', 1),
('society_org59', 'Organizacja 59', 1),
('society_org6', 'Organizacja 6', 1),
('society_org60', 'Organizacja 60', 1),
('society_org61', 'Organizacja 61', 1),
('society_org62', 'Organizacja 62', 1),
('society_org63', 'Organizacja 63', 1),
('society_org64', 'Organizacja 64', 1),
('society_org65', 'Organizacja 65', 1),
('society_org66', 'Organizacja 66', 1),
('society_org67', 'Organizacja 67', 1),
('society_org68', 'Organizacja 68', 1),
('society_org69', 'Organizacja 69', 1),
('society_org7', 'Organizacja 7', 1),
('society_org70', 'Organizacja 70', 1),
('society_org71', 'Organizacja 71', 1),
('society_org72', 'Organizacja 72', 1),
('society_org73', 'Organizacja 73', 1),
('society_org74', 'Organizacja 74', 1),
('society_org8', 'Organizacja 8', 1),
('society_org80', 'Organizacja 80', 1),
('society_org81', 'Organizacja 81', 1),
('society_org82', 'Organizacja 82', 1),
('society_org83', 'Organizacja 83', 1),
('society_org84', 'Organizacja 84', 1),
('society_org85', 'Organizacja 85', 1),
('society_org86', 'Organizacja 86', 1),
('society_org87', 'Organizacja 87', 1),
('society_org88', 'Organizacja 88', 1),
('society_org89', 'Organizacja 89', 1),
('society_org9', 'Organizacja 9', 1),
('society_org90', 'Organizacja 90', 1),
('society_org91', 'Organizacja 91', 1),
('society_org92', 'Organizacja 92', 1),
('society_org93', 'Organizacja 93', 1),
('society_org94', 'Organizacja 94', 1),
('society_org95', 'Organizacja 95', 1),
('society_org96', 'Organizacja 96', 1),
('society_org97', 'Organizacja 97', 1),
('society_org98', 'Organizacja 98', 1),
('society_org99', 'Organizacja 99', 1),
('society_pizzeria', 'Pizza This', 1),
('society_police', 'SASP', 1),
('society_psycholog', 'LSPO', 1),
('society_pullpet', 'Pullpet Company', 1),
('society_rafiner', 'Rafiner', 1),
('society_sams', 'sams', 1),
('society_sams2', 'Ambulance', 1),
('society_sert', 'SERT', 1),
('society_sheriff', 'BCSO', 1),
('society_slaughter', 'Rzeźnik', 1),
('society_strefy', 'strefy', 1),
('society_strefy1', 'strefy1', 1),
('society_strefy10', 'strefy10', 1),
('society_strefy2', 'strefy2', 1),
('society_strefy3', 'strefy3', 1),
('society_strefy4', 'strefy4', 1),
('society_strefy5', 'strefy5', 1),
('society_strefy6', 'strefy6', 1),
('society_strefy7', 'strefy7', 1),
('society_strefy8', 'strefy8', 1),
('society_strefy9', 'strefy9', 1),
('society_swat', 'SWAT', 1),
('society_taxi', 'Taxi', 1),
('society_usms', 'USMS', 1),
('society_weazel', 'Weazel News', 1),
('society_wiesbuda', 'WiesBuda', 1),
('society_winiarz', 'Winiarz', 1),
('society_x-gamer', 'X-Gamer', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_legaljobs`
--

CREATE TABLE `addon_legaljobs` (
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `addon_legaljobs`
--

INSERT INTO `addon_legaljobs` (`name`, `level`) VALUES
('baker', 1),
('burgershot', 1),
('courier', 1),
('farming', 1),
('fisherman', 1),
('grower', 1),
('krawiec', 1),
('milkman', 1),
('miner', 1),
('pizzeria', 1),
('rafiner', 1),
('slaughter', 1),
('taxi', 1),
('weazel', 1),
('winiarz', 1),
('x-gamer', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_organizations`
--

CREATE TABLE `addon_organizations` (
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `items` int(11) NOT NULL DEFAULT 0,
  `weapons` int(11) NOT NULL DEFAULT 0,
  `safe` int(11) NOT NULL DEFAULT 0,
  `pistolmk2` int(11) NOT NULL DEFAULT 0,
  `snspistol` int(11) NOT NULL DEFAULT 0,
  `interactions` int(11) NOT NULL DEFAULT 0,
  `menuf7` int(11) NOT NULL DEFAULT 0,
  `addoncloakroom` int(11) NOT NULL DEFAULT 0,
  `narkotyki` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `addon_organizations`
--

INSERT INTO `addon_organizations` (`name`, `level`, `items`, `weapons`, `safe`, `pistolmk2`, `snspistol`, `interactions`, `menuf7`, `addoncloakroom`, `narkotyki`) VALUES
('society_org1', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org10', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org100', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org101', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org102', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org103', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org104', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org105', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org106', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org107', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org108', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org109', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org11', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org110', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org111', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org112', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org113', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org114', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org115', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org116', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org117', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org118', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org119', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org12', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org120', 4, 1, 0, 1, 0, 0, 0, 1, 1, 0),
('society_org13', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org14', 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
('society_org15', 1, 1, 0, 1, 0, 0, 0, 1, 1, 0),
('society_org16', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org17', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org18', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org19', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org2', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org20', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org21', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org22', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org23', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
('society_org24', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org25', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org26', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org27', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org28', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org3', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org30', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org31', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org32', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org33', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org34', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org35', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org36', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org37', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org38', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org39', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org4', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org40', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org41', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org42', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org43', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org44', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org48', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org49', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org50', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org51', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org52', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org53', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org55', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org56', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org57', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org58', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org59', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org6', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org60', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org61', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org62', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org63', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org64', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org65', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org66', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org67', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org68', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org69', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org7', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org70', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org71', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org72', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org73', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org74', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org8', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org80', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org81', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org82', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org83', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org84', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org85', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org86', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org87', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org88', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org89', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org9', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org90', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org91', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org92', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org93', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org94', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org95', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org96', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org97', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org98', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('society_org99', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anticheat`
--

CREATE TABLE `anticheat` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8_bin NOT NULL,
  `license` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nazwa` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `discord` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `powod` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `datanadania` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `liveid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `xbl` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `anticheat`
--

INSERT INTO `anticheat` (`id`, `identifier`, `license`, `ip`, `nazwa`, `discord`, `powod`, `datanadania`, `liveid`, `xbl`) VALUES
(1, 'steam:', 'license:', 'ip:', 'sffdsd', 'discord:', 'ewer', '1.02.2022', 'live:', 'xbl:');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `archiwum_dokumenty`
--

CREATE TABLE `archiwum_dokumenty` (
  `society` text NOT NULL,
  `documents` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `battlepass`
--

CREATE TABLE `battlepass` (
  `hex` varchar(50) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bitki`
--

CREATE TABLE `bitki` (
  `id` int(11) NOT NULL,
  `org_name` text DEFAULT NULL,
  `org_label` text DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `loses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boats`
--

CREATE TABLE `boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `license` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `boats`
--

INSERT INTO `boats` (`name`, `model`, `price`, `category`, `license`) VALUES
('Ponton z silnikiem', 'dinghy2', 1000000, 'cheap', 1),
('JetMax', 'jetmax', 1500000, 'motorowki', 1),
('Marquis', 'marquis', 10000000, 'yacht', 1),
('Skuter wodny', 'seashark', 500000, 'cheap', 0),
('Squalo', 'squalo', 1700000, 'motorowki', 1),
('Suntrap', 'suntrap', 5000000, 'motorowki', 1),
('Tropic', 'tropic', 2100000, 'motorowki', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boats_categories`
--

CREATE TABLE `boats_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `boats_categories`
--

INSERT INTO `boats_categories` (`name`, `label`) VALUES
('cheap', 'Budżetowe'),
('motorowki', 'Motorówki'),
('yacht', 'Jachty');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cayo_config`
--

CREATE TABLE `cayo_config` (
  `cayoconfig` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `cayo_config`
--

INSERT INTO `cayo_config` (`cayoconfig`) VALUES
('{\"boughtProm\":true,\"boughtPonton\":true}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cayo_mines`
--

CREATE TABLE `cayo_mines` (
  `id` int(11) NOT NULL,
  `position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cayo_schowki`
--

CREATE TABLE `cayo_schowki` (
  `name` text NOT NULL,
  `contents` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `digit` int(11) DEFAULT 1,
  `accounts` varchar(255) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job_level` varchar(255) NOT NULL DEFAULT '{"level":0,"points":0}',
  `secondjob` varchar(50) DEFAULT 'unemployed',
  `secondjob_grade` int(11) DEFAULT 0,
  `thirdjob` varchar(50) DEFAULT 'unemployed',
  `thirdjob_grade` int(11) DEFAULT 0,
  `job_id` varchar(255) DEFAULT '{"name":"nojob","id":0}',
  `inventory` longtext DEFAULT NULL,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"z":0.0,"y":0.0,"x":0.0}',
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dateofbirth` varchar(255) DEFAULT NULL,
  `sex` varchar(1) DEFAULT 'M',
  `height` varchar(128) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `isDead` tinyint(1) DEFAULT 0,
  `phone_number` varchar(10) DEFAULT NULL,
  `slot` varchar(255) DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `account_number` varchar(10) DEFAULT NULL,
  `taxiKursy` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chat_bans`
--

CREATE TABLE `chat_bans` (
  `id` int(11) NOT NULL,
  `identifier` varchar(55) NOT NULL,
  `unix` int(11) NOT NULL,
  `chat` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crimes`
--

CREATE TABLE `crimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jail` int(11) NOT NULL,
  `fine` double(8,2) NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_character`
--

CREATE TABLE `crime_character` (
  `crime_id` bigint(20) UNSIGNED NOT NULL,
  `character_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dailycase`
--

CREATE TABLE `dailycase` (
  `hex` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dailycases`
--

CREATE TABLE `dailycases` (
  `steamid` text NOT NULL,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `darkchat_messages`
--

CREATE TABLE `darkchat_messages` (
  `id` int(11) NOT NULL,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Mieszkanie', 0),
('society_ambulance', 'SAMS', 1),
('society_baker', 'Piekarz', 1),
('society_burgershot', 'Burgershot', 1),
('society_cardealer', 'Lux MotorSport', 1),
('society_casino', 'Casino Royale', 1),
('society_courier', 'Go Postal', 1),
('society_doj', 'Department Of Justice', 1),
('society_dtu', 'DTU', 1),
('society_extreme', 'Extreme Sports', 1),
('society_farming', 'Farmer', 1),
('society_fisherman', 'Rybak', 1),
('society_galaxy', 'Galaxy Club', 1),
('society_garbage', 'Śmieciarz', 1),
('society_grower', 'Sadownik', 1),
('society_krawiec', 'Fly Beliodas', 1),
('society_mechanik', 'LS Customs', 1),
('society_mechanik2', 'Mechanik 2', 1),
('society_mechanik3', 'Mechanik 3', 1),
('society_mechanik4', 'Mechanik 4', 1),
('society_milkman', 'Mleczarz', 1),
('society_miner', 'Górnik', 1),
('society_org1', 'Organizacja 1', 1),
('society_org10', 'Organizacja 10', 1),
('society_org100', 'Organizacja 100', 1),
('society_org101', 'Organizacja 101', 1),
('society_org102', 'Organizacja 102', 1),
('society_org103', 'Organizacja 103', 1),
('society_org104', 'Organizacja 104', 1),
('society_org105', 'Organizacja 105', 1),
('society_org106', 'Organizacja 106', 1),
('society_org107', 'Organizacja 107', 1),
('society_org108', 'Organizacja 108', 1),
('society_org109', 'Organizacja 109', 1),
('society_org11', 'Organizacja 11', 1),
('society_org110', 'Organizacja 110', 1),
('society_org111', 'Organizacja 111', 1),
('society_org112', 'Organizacja 112', 1),
('society_org113', 'Organizacja 113', 1),
('society_org114', 'Organizacja 114', 1),
('society_org115', 'Organizacja 115', 1),
('society_org116', 'Organizacja 116', 1),
('society_org117', 'Organizacja 117', 1),
('society_org118', 'Organizacja 118', 1),
('society_org119', 'Organizacja 119', 1),
('society_org12', 'Organizacja 12', 1),
('society_org120', 'Organizacja 120', 1),
('society_org13', 'Organizacja 13', 1),
('society_org14', 'Organizacja 14', 1),
('society_org15', 'Organizacja 15', 1),
('society_org16', 'Organizacja 16', 1),
('society_org17', 'Organizacja 17', 1),
('society_org18', 'Organizacja 18', 1),
('society_org19', 'Organizacja 19', 1),
('society_org2', 'Organizacja 2', 1),
('society_org20', 'Organizacja 20', 1),
('society_org21', 'Organizacja 21', 1),
('society_org22', 'Organizacja 22', 1),
('society_org23', 'Organizacja 23', 1),
('society_org24', 'Organizacja 24', 1),
('society_org25', 'Organizacja 25', 1),
('society_org26', 'Organizacja 26', 1),
('society_org27', 'Organizacja 27', 1),
('society_org28', 'Organizacja 28', 1),
('society_org29', 'Organizacja 29', 1),
('society_org3', 'Organizacja 3', 1),
('society_org30', 'Organizacja 30', 1),
('society_org31', 'Organizacja 31', 1),
('society_org32', 'Organizacja 32', 1),
('society_org33', 'Organizacja 33', 1),
('society_org34', 'Organizacja 34', 1),
('society_org35', 'Organizacja 35', 1),
('society_org36', 'Organizacja 36', 1),
('society_org37', 'Organizacja 37', 1),
('society_org38', 'Organizacja 38', 1),
('society_org39', 'Organizacja 39', 1),
('society_org4', 'Organizacja 4', 1),
('society_org40', 'Organizacja 40', 1),
('society_org41', 'Organizacja 41', 1),
('society_org42', 'Organizacja 42', 1),
('society_org43', 'Organizacja 43', 1),
('society_org44', 'Organizacja 44', 1),
('society_org45', 'Organizacja 45', 1),
('society_org46', 'Organizacja 46', 1),
('society_org47', 'Organizacja 47', 1),
('society_org48', 'Organizacja 48', 1),
('society_org49', 'Organizacja 49', 1),
('society_org5', 'Organizacja 5', 1),
('society_org50', 'Organizacja 50', 1),
('society_org51', 'Organizacja 51', 1),
('society_org52', 'Organizacja 52', 1),
('society_org53', 'Organizacja 53', 1),
('society_org54', 'Organizacja 54', 1),
('society_org55', 'Organizacja 55', 1),
('society_org56', 'Organizacja 56', 1),
('society_org57', 'Organizacja 57', 1),
('society_org58', 'Organizacja 58', 1),
('society_org59', 'Organizacja 59', 1),
('society_org6', 'Organizacja 6', 1),
('society_org60', 'Organizacja 60', 1),
('society_org61', 'Organizacja 61', 1),
('society_org62', 'Organizacja 62', 1),
('society_org63', 'Organizacja 63', 1),
('society_org64', 'Organizacja 64', 1),
('society_org65', 'Organizacja 65', 1),
('society_org66', 'Organizacja 66', 1),
('society_org67', 'Organizacja 67', 1),
('society_org68', 'Organizacja 68', 1),
('society_org69', 'Organizacja 69', 1),
('society_org7', 'Organizacja 7', 1),
('society_org70', 'Organizacja 70', 1),
('society_org71', 'Organizacja 71', 1),
('society_org72', 'Organizacja 72', 1),
('society_org73', 'Organizacja 73', 1),
('society_org74', 'Organizacja 74', 1),
('society_org8', 'Organizacja 8', 1),
('society_org80', 'Organizacja 80', 1),
('society_org81', 'Organizacja 81', 1),
('society_org82', 'Organizacja 82', 1),
('society_org83', 'Organizacja 83', 1),
('society_org84', 'Organizacja 84', 1),
('society_org85', 'Organizacja 85', 1),
('society_org86', 'Organizacja 86', 1),
('society_org87', 'Organizacja 87', 1),
('society_org88', 'Organizacja 88', 1),
('society_org89', 'Organizacja 89', 1),
('society_org9', 'Organizacja 9', 1),
('society_org90', 'Organizacja 90', 1),
('society_org91', 'Organizacja 91', 1),
('society_org92', 'Organizacja 92', 1),
('society_org93', 'Organizacja 93', 1),
('society_org94', 'Organizacja 94', 1),
('society_org95', 'Organizacja 95', 1),
('society_org96', 'Organizacja 96', 1),
('society_org97', 'Organizacja 97', 1),
('society_org98', 'Organizacja 98', 1),
('society_org99', 'Organizacja 99', 1),
('society_police', 'SASP', 1),
('society_psycholog', 'LSPO', 1),
('society_pullpet', 'Pullpet Company', 1),
('society_rafiner', 'Rafiner', 1),
('society_sert', 'SERT', 1),
('society_sheriff', 'BCSO', 1),
('society_slaughter', 'Rzeźnik', 1),
('society_taxi', 'Taxi', 1),
('society_usms', 'USMS', 1),
('society_weazel', 'Weazel News', 1),
('society_wiesbuda', 'WiesBuda', 1),
('society_winiarz', 'Winiarz', 1),
('society_x-gamer', 'Kawiarnia', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `data2` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `db_clothes`
--

CREATE TABLE `db_clothes` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `digit` int(11) DEFAULT 1,
  `bag` int(11) NOT NULL DEFAULT 0,
  `bag2` int(11) NOT NULL DEFAULT 0,
  `tshirt` int(11) NOT NULL DEFAULT 0,
  `tshirt2` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torso2` int(11) NOT NULL DEFAULT 0,
  `legs` int(11) NOT NULL DEFAULT 0,
  `legs2` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoes2` int(11) NOT NULL DEFAULT 0,
  `arms` int(11) NOT NULL DEFAULT 0,
  `arms2` int(11) NOT NULL DEFAULT 0,
  `chain` int(11) NOT NULL DEFAULT 0,
  `chain2` int(11) NOT NULL DEFAULT 0,
  `mask` int(11) NOT NULL DEFAULT 0,
  `mask2` int(11) NOT NULL DEFAULT 0,
  `decals` int(11) NOT NULL DEFAULT 0,
  `decals2` int(11) NOT NULL DEFAULT 0,
  `hat` int(11) NOT NULL DEFAULT 0,
  `hat2` int(11) NOT NULL DEFAULT 0,
  `glasses` int(11) NOT NULL DEFAULT 0,
  `glasses2` int(11) NOT NULL DEFAULT 0,
  `watches` int(11) NOT NULL DEFAULT 0,
  `watches2` int(11) NOT NULL DEFAULT 0,
  `bracelets` int(11) NOT NULL DEFAULT 0,
  `bracelets2` int(11) NOT NULL DEFAULT 0,
  `bproof1` int(11) NOT NULL DEFAULT 0,
  `bproof2` int(11) NOT NULL DEFAULT 0,
  `face` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dokumenty`
--

CREATE TABLE `dokumenty` (
  `identifier` text NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exile_bans`
--

CREATE TABLE `exile_bans` (
  `license` varchar(50) COLLATE utf8_bin NOT NULL,
  `identifier` varchar(25) COLLATE utf8_bin NOT NULL,
  `playerip` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `discord` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `hwid` longtext COLLATE utf8_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin NOT NULL,
  `added` datetime DEFAULT current_timestamp(),
  `live` varchar(21) COLLATE utf8_bin DEFAULT NULL,
  `xbl` varchar(21) COLLATE utf8_bin DEFAULT NULL,
  `expired` varchar(50) COLLATE utf8_bin NOT NULL,
  `bannedby` varchar(32) COLLATE utf8_bin NOT NULL,
  `isBanned` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `exile_bans`
--

INSERT INTO `exile_bans` (`license`, `identifier`, `playerip`, `name`, `discord`, `hwid`, `reason`, `added`, `live`, `xbl`, `expired`, `bannedby`, `isBanned`) VALUES
('nieznane', 'nieznane', 'xx.xx.xx.xx', '', 'nieznane', '[]', 'brak', '2022-11-02 16:34:15', 'nieznane', 'nieznane', '-1', 'nieznany', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exile_zones`
--

CREATE TABLE `exile_zones` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fuel_km`
--

CREATE TABLE `fuel_km` (
  `carplate` varchar(10) NOT NULL,
  `fuel` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `given_items`
--

CREATE TABLE `given_items` (
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `holdup`
--

CREATE TABLE `holdup` (
  `name` varchar(55) NOT NULL,
  `nextRob` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `holdup`
--

INSERT INTO `holdup` (`name`, `nextRob`) VALUES
('bazawojskowa', 0),
('blainecounty', 0),
('Casino', 0),
('EVinewoodBank', 0),
('fleeca', 0),
('HumaneLabs', 0),
('jubiler', 0),
('Pacyfik', 0),
('RockfordBank', 0),
('Route68Bank', 0),
('WVinewoodBank2', 0),
('yacht', 0),
('ZbrojowniaSASP', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `holdup_sklepholdup`
--

CREATE TABLE `holdup_sklepholdup` (
  `name` varchar(55) NOT NULL,
  `nextRob` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `holdup_sklepholdup`
--

INSERT INTO `holdup_sklepholdup` (`name`, `nextRob`) VALUES
('Sklep1', 0),
('Sklep10', 0),
('Sklep2', 0),
('Sklep3', 0),
('Sklep4', 0),
('Sklep7', 0),
('Sklep9', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `instagram_account`
--

CREATE TABLE `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `instagram_followers`
--

CREATE TABLE `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `instagram_posts`
--

CREATE TABLE `instagram_posts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `instagram_stories`
--

CREATE TABLE `instagram_stories` (
  `owner` varchar(50) COLLATE armscii8_bin NOT NULL,
  `data` text COLLATE armscii8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `insta_stories`
--

CREATE TABLE `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `investigations`
--

CREATE TABLE `investigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `investigation_comments`
--

CREATE TABLE `investigation_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `investigation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `investigation_users`
--

CREATE TABLE `investigation_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `investigation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `items`
--

CREATE TABLE `items` (
  `name` varchar(150) NOT NULL,
  `label` varchar(150) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `data` varchar(999) NOT NULL DEFAULT '{}',
  `type` varchar(50) NOT NULL DEFAULT 'item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `data`, `type`) VALUES
('aceton', 'Aceton', 25, 0, 1, '{}', 'item'),
('alive_chicken', 'Żywy kurczak', 100, 0, 1, '{}', 'item'),
('anchovy', 'Anchovy', 20, 0, 1, '{}', 'item'),
('antydzwon', 'OG Creis', 5, 0, 1, '{}', 'item'),
('Aperitif', 'aperitif', 15, 0, 1, '{}', 'item'),
('apteczka', 'Apteczka', 1, 0, 1, '{}', 'item'),
('ball', 'Piłka', 10, 0, 1, '{}', 'item'),
('bandage', 'Bandaz', 100, 0, 1, '{}', 'item'),
('bandaz', 'Bandaż', 2, 0, 1, '{}', 'item'),
('barierka', 'Barierka', 5, 0, 1, '{}', 'item'),
('barylkakokainy', 'Baryłka Kokainy', 10, 0, 1, '{}', 'item'),
('barylkametaamfetaminy', 'Baryłka Metaamfetaminy', 10, 0, 1, '{}', 'item'),
('barylkaopium', 'Baryłka Opium', 10, 0, 1, '{}', 'item'),
('barylkaziola', 'Baryłka Marihuany', 10, 0, 1, '{}', 'item'),
('basketball', 'Piłka Koszykowa', 1, 0, 1, '{}', 'item'),
('bazaheroinowa', 'Baza Heroinowa', 100, 0, 1, '{}', 'item'),
('bazakokainowa', 'Baza Kokainowa', 300, 0, 1, '{}', 'item'),
('beer', 'Harnaś 0.5L', 100, 0, 1, '{}', 'item'),
('black_phone', 'iPhone 13 Pro Max Czarny', 3, 0, 1, '{}', 'item'),
('blantoghaze', 'Blant z OG Haze', 100, 0, 1, '{}', 'item'),
('bletka', 'Bletka', 20, 0, 1, '{}', 'item'),
('blowpipe', 'Wytrych', 10, 0, 1, '{}', 'item'),
('blue_phone', 'iPhone 13 Pro Max Niebieski', 3, 0, 1, '{}', 'item'),
('bodycam', 'Bodycam', 5, 0, 1, '{}', 'item'),
('bon1', 'Zmiana rejestracji w pojeździe', 10, 0, 1, '{}', 'item'),
('bon10', 'Skrócenie bana o 24h', 10, 0, 1, '{}', 'item'),
('bon11', 'Auto limitowane', 10, 0, 1, '{}', 'item'),
('bon12', 'Dom limitowany', 10, 0, 1, '{}', 'item'),
('bon13', 'Śmigłowiec lub Samolot', 10, 0, 1, '{}', 'item'),
('bon14', 'Samolot', 10, 0, 1, '{}', 'item'),
('bon15', 'Skrócenie bana o 72h', 10, 0, 1, '{}', 'item'),
('bon16', 'HMMWV z salonu + FT', 10, 0, 1, '{}', 'item'),
('bon17', 'Zniżka 25% na tuning do auta', 10, 0, 1, '{}', 'item'),
('bon18', 'Zniżka 50% na tuning do auta', 10, 0, 1, '{}', 'item'),
('bon19', 'Ubranie z wybraną przez ciebie grafiką', 10, 0, 1, '{}', 'item'),
('bon2', 'Zniżka 50% na tuning do auta', 10, 0, 1, '{}', 'item'),
('bon20', 'Limitowane malowanie na dowolne auto', 10, 0, 1, '{}', 'item'),
('bon21', 'Dowolne auto car dealera', 10, 0, 1, '{}', 'item'),
('bon22', 'BMW M2 EXILE EDITION', 10, 0, 1, '{}', 'item'),
('bon23', 'Toyota Supra Limited Edition', 10, 0, 1, '{}', 'item'),
('bon24', 'Dowolna limitka z limited dźwiękiem', 10, 0, 1, '{}', 'item'),
('bon25', 'Pakiet limitek 2+1', 10, 0, 1, '{}', 'item'),
('bon3', 'Auto z brokera do 5mln', 10, 0, 1, '{}', 'item'),
('bon4', 'Zniżka do brokera 20%', 10, 0, 1, '{}', 'item'),
('bon5', 'Auto z brokera do 10mln', 10, 0, 1, '{}', 'item'),
('bon6', 'Zniżka 40% do brokera', 10, 0, 1, '{}', 'item'),
('bon7', 'Bon na darmowy tuning do auta', 10, 0, 1, '{}', 'item'),
('bon8', 'Auto z brokera do 15mln', 10, 0, 1, '{}', 'item'),
('bon9', 'Zniżka 50% do brokera', 10, 0, 1, '{}', 'item'),
('bottle', 'Butelka', -1, 0, 1, '{}', 'item'),
('bread', 'Chleb', 30, 0, 1, '{}', 'item'),
('breadfresh', 'Swiezy chleb', -1, 0, 1, '{}', 'item'),
('breads', 'Świeży chleb', 100, 0, 1, '{}', 'item'),
('brownsugar', 'Brown Sugar', 300, 0, 1, '{}', 'item'),
('brzoskwinia', 'Brzoskwinia', 150, 0, 1, '{}', 'item'),
('burbon', 'Burbon', 10, 0, 1, '{}', 'item'),
('burger', 'Burger', 100, 0, 1, '{}', 'item'),
('bzgas', 'Gaz łzawiący', -1, 0, 1, '{}', 'item_weapon'),
('cake', 'Ciasto', 100, 0, 1, '{}', 'item'),
('capricciosa', 'Pizza Capricciosa', 100, 0, 1, '{}', 'item'),
('carchest', 'Car Chest', 200, 0, 1, '{}', 'item'),
('cardok', 'Fałszywe dokumenty pojazdu', 1, 0, 0, '{}', 'item'),
('carfarba', 'Farba do samochodu', 1, 0, 0, '{}', 'item'),
('carjack', 'Podnosnik', 5, 0, 1, '{}', 'item'),
('carnadajnik', 'Nadajnik', 1, 0, 0, '{}', 'item'),
('carokit', 'Mechaniczny zestaw blacharski', 5, 0, 1, '{}', 'item'),
('carotool', 'Części blacharskie', 5, 0, 1, '{}', 'item'),
('carrej', 'Fałszywa rejestracja', 1, 0, 0, '{}', 'item'),
('car_door', 'Drzwi od auta', 4, 0, 1, '{}', 'item'),
('car_hood', 'maska samochodu', 4, 0, 1, '{}', 'item'),
('car_trunk', 'bagażnik samochodowy', 2, 0, 1, '{}', 'item'),
('car_wheel', 'opona samochodowa ', 4, 0, 1, '{}', 'item'),
('cayopackstatue', 'Zapakowana Figurka', 15, 0, 1, '{}', 'item'),
('cayostatue', 'Figurka', 15, 0, 1, '{}', 'item'),
('cayo_mine', 'Mina wodna Cayo Perico', -1, 0, 1, '{}', 'item'),
('chipsy', 'Chipsy', 30, 0, 1, '{}', 'item'),
('chlorowodorek', 'Chlorowodorek Metaamfetaminy', 150, 0, 1, '{}', 'item'),
('chocolate', 'Czekolada', 30, 0, 1, '{}', 'item'),
('ciastkozwrozba', 'Ciastko z wrozba', 15, 0, 1, '{}', 'item'),
('ciasto', 'Ciasto', 100, 0, 1, '{}', 'item'),
('classic_phone', 'iPhone 14 Pro Max Grafitowy', 5, 0, 1, '{}', 'item'),
('clip', 'Magazynek', 100, 0, 1, '{}', 'item'),
('clipaddons', 'Magazynek Pirotech', 10, 0, 1, '{}', 'item'),
('clipsmg', 'Magazynek SMG', 10, 0, 1, '{}', 'item_weapon'),
('clip_drum', 'Magazynek bębnowy', 5, 0, 1, '{}', 'item'),
('clip_extended', 'Powiększony magazynek', 50, 0, 1, '{}', 'item'),
('clothe', 'Ubranie', 40, 0, 1, '{}', 'item'),
('cocaineleaves', 'Liść Kokainy', 100, 1, 1, '{}', 'item'),
('cocaine_cut', 'Cut Cocaine', -1, 0, 1, '{}', 'item'),
('cocaine_packaged', 'Packaged Cocaine', -1, 0, 1, '{}', 'item'),
('cocaine_uncut', 'Uncut Cocaine', -1, 0, 1, '{}', 'item'),
('coke', 'Liść Kokainy', 150, 0, 1, '{}', 'item'),
('cokeperico', 'Liść Kokainy Perico', 150, 0, 1, '{}', 'item'),
('cokeperico_pooch', 'Porcja kokainy Perico', 30, 0, 1, '{}', 'item'),
('coke_pooch', 'Porcja kokainy', 30, 0, 1, '{}', 'item'),
('cola', 'Coca Cola', 30, 0, 1, '{}', 'item'),
('contract', 'Kontrakt', 5, 0, 1, '{}', 'item'),
('copper', ' Miedź', 25, 0, 1, '{}', 'item'),
('crimowa', 'Illegal Chest', 200, 0, 1, '{}', 'item'),
('croquettes', 'Karma dla zwierzat ', 15, 0, 1, '{}', 'item'),
('crusher', 'Crusher', 3, 0, 1, '{}', 'item'),
('crusheroghaze', 'asdas', 3, 0, 1, '{}', 'item'),
('cupcake', 'Babeczka', 30, 0, 1, '{}', 'item'),
('cut_money', 'Counterfeit Cash - Cut', -1, 0, 1, '{}', 'item'),
('cydr', 'Cydr', 10, 0, 1, '{}', 'item'),
('cytryna', 'Cytryna', 150, 0, 1, '{}', 'item'),
('dailycase', 'Daily Case', 1, 0, 1, '{}', 'item'),
('diamentowakarta', 'Diamentowa Karta', -1, 0, 1, '{}', 'item'),
('diamond', 'Diament', 25, 0, 1, '{}', 'item'),
('digiscanner', 'digiscanner', 10, 0, 1, '{}', 'item_weapon'),
('dokument', 'Dokument', 10, 0, 1, '{\"url\":\"\"}', 'item'),
('drill', 'Wiertlo', 3, 0, 1, '{}', 'item'),
('drill2', 'Wiertło II Generacji', 10, 0, 1, '{}', 'item'),
('drink', 'Drink', 10, 0, 1, '{}', 'item'),
('dynia', 'Dynia', 3000, 0, 1, '{}', 'item'),
('dysk', 'Dysk z danymi', 10, 0, 1, '{}', 'item'),
('efederyna', 'Efederyna', 100, 0, 1, '{}', 'item'),
('efederynakruszona', 'Efederyna Kruszona', 60, 0, 1, '{}', 'item'),
('emerald', 'Emerald', 25, 0, 1, '{}', 'item'),
('exctasy_pooch', 'Ekstazy', 30, 0, 1, '{}', 'item'),
('extendedclip', 'Magazynek broń długa', 100, 0, 1, '{}', 'item'),
('fajerwerki', 'Fajerwerki', 999999, 0, 1, '{}', 'item'),
('faktura1', 'Faktura Palomino Freeway', 1, 0, 1, '{}', 'item'),
('faktura2', 'Faktura Paleto Bay', 1, 0, 1, '{}', 'item'),
('faktura3', 'Faktura Droga 68', 1, 0, 1, '{}', 'item'),
('faktura4', 'Faktura Great Ocean Highway', 1, 0, 1, '{}', 'item'),
('fakturabaker', 'Faktura Piekarz', -1, 0, 1, '{}', 'item'),
('fakturafisherman', 'Faktura Rybak', -1, 0, 1, '{}', 'item'),
('fakturagrower', 'Faktura Sadownik', -1, 0, 1, '{}', 'item'),
('fakturakurier', 'Faktura Kurier', -1, 0, 1, '{}', 'item'),
('fakturamilkman', 'Faktura Mleczarz', -1, 0, 1, '{}', 'item'),
('fakturataxi', 'Faktura Taxi', -1, 0, 1, '{}', 'item'),
('fakturaweazel', 'Faktura Weazel', -1, 0, 1, '{}', 'item'),
('fenacetyna', 'Fenacetyna', 100, 0, 1, '{}', 'item'),
('fireextinguisher', 'Gaśnica', -1, 0, 1, '{}', 'item'),
('firework', 'Wyrzutnia fajerwerek', -1, 0, 1, '{}', 'item'),
('firstaid', 'First-Aid Kit', 10, 0, 1, '{}', 'item'),
('fish', 'Ryba', 100, 0, 1, '{}', 'item'),
('fishingfood', 'Przynęta na ryby', 100, 0, 1, '{}', 'item'),
('fishingrod', 'Wędka', 1, 0, 1, '{}', 'item'),
('fishreworked', 'Przygotowana Ryba', 100, 0, 1, '{}', 'item'),
('fixkit', 'Mechaniczny zestaw naprawczy', 5, 0, 1, '{}', 'item'),
('fixkit2', 'Zestaw naprawczy', 5, 0, 1, '{}', 'item'),
('fixtool', 'Części naprawcze', 5, 0, 1, '{}', 'item'),
('flare', 'Flara', 10, 0, 1, '{}', 'item_weapon'),
('flaregun', 'Flare Gun', 10, 0, 1, '{}', 'item_weapon'),
('flashbang', 'Flashbang', 10, 0, 1, '{}', 'item_weapon'),
('flashlight_dodatek', 'Latarka do broni', 5, 0, 1, '{}', 'item'),
('flavour', 'Mąka', 100, 0, 1, '{}', 'item'),
('fountain', 'Fontanna', 10, 0, 1, '{}', 'item'),
('gauze', 'Gauze', 25, 0, 1, '{}', 'item'),
('gazbottle', 'Części do palnika', 5, 0, 1, '{}', 'item'),
('gazeta', 'Gazeta Weazel', 20, 0, 1, '{}', 'item'),
('gofry', 'Gofry z cukrem pudrem', 30, 0, 1, '{}', 'item'),
('gofry2', 'Gofry z owocami', 30, 0, 1, '{}', 'item'),
('gofry3', 'Gofry z bitą śmietaną', 30, 0, 1, '{}', 'item'),
('gold_phone', 'iPhone 13 Pro Max Złoty', 3, 0, 1, '{}', 'item'),
('golfclub', 'Kij golfowy', 10, 0, 1, '{}', 'item_weapon'),
('gopro', 'GoPro', 5, 0, 1, '{}', 'item'),
('gps', 'GPS', 1, 0, 0, '{}', 'item'),
('grenadelauncher', 'Granatnik', 10, 0, 1, '{}', 'item_weapon'),
('grenadelauncher_ammo', 'Amunicja do granatnika', 250, 0, 1, '{}', 'item'),
('grip', 'Uchwyt', 5, 0, 1, '{}', 'item'),
('gumka', 'Prezerwatywa', 3, 0, 1, '{}', 'item'),
('gusenberg', 'Gusenberg', 10, 0, 1, '{}', 'item'),
('hamburger', 'Hamburger', 30, 0, 1, '{}', 'item'),
('hammer', 'Młotek', 10, 0, 1, '{}', 'item_weapon'),
('handcuff', 'Kajdanki', 3, 0, 1, '{}', 'item'),
('hatchet', 'Topór', 10, 0, 1, '{}', 'item_weapon'),
('heroina', 'Heroina', 50, 0, 1, '{}', 'item'),
('hifi', 'Boombox', 1, 0, 1, '{}', 'item'),
('hominglauncher', 'Wyrzutnia namierzająca', 10, 0, 1, '{}', 'item'),
('hydrocodone', 'Hydrocodone', 5, 0, 1, '{}', 'item'),
('icetea', 'Lipton', 30, 0, 1, '{}', 'item'),
('invoice', 'Faktura', 500, 0, 1, '{}', 'item'),
('iron', 'Żelazo', 50, 0, 1, '{}', 'item'),
('ironsights', 'IronSights', 10, 0, 1, '{}', 'item'),
('jablka', 'Jabłko', 40, 0, 1, '{}', 'item'),
('jablko', 'Jabłko', 150, 0, 1, '{}', 'item'),
('jablko_pooch', 'Kompot', 30, 0, 1, '{}', 'item'),
('jewels', 'Biżuteria', -1, 0, 1, '{}', 'item'),
('joint', 'Joint', -1, 0, 1, '{}', 'item'),
('juice', 'Sok owocowy', 40, 0, 1, '{}', 'item'),
('kamzaduza', 'Kamizelka duża', 10, 0, 1, '{}', 'item'),
('kamzasaspbigsert', 'Kamizelka SERT 100%', 1, 0, 1, '{}', 'item'),
('kamzasaspbigswat', 'Kamizelka SWAT 100%', 1, 0, 1, '{}', 'item'),
('kamzasaspsmall', 'Kamizelka SASP/SHERIFF 75%', 1, 0, 1, '{}', 'item'),
('kamzasmall', 'Kamizelka Mała', 10, 0, 1, '{}', 'item'),
('karnister', 'Karnister', 1, 0, 1, '{}', 'item'),
('kartafulltune', 'Karta FullTune', 5, 0, 1, '{}', 'item'),
('kartaprzeprania', 'Karta Przeprania', 5, 0, 1, '{}', 'item'),
('kartawymiany', 'Karta Wymiany Narkotyków', 5, 0, 1, '{}', 'item'),
('kasksaspsert', 'Kask Kuloodporny SERT', 1, 0, 1, '{}', 'item'),
('kasksaspswat', 'Kask Kuloodporny SWAT', 1, 0, 1, '{}', 'item'),
('kawa', 'X-Gamer', 100, 0, 1, '{}', 'item'),
('kocyk', 'kocyk ', 1, 0, 1, '{}', 'item'),
('kokaina', 'Kokaina', 50, 0, 1, '{}', 'item'),
('kolczatka', 'Kolczatka', 5, 0, 1, '{}', 'item'),
('koniak', 'Koniak', 10, 0, 1, '{}', 'item'),
('krotkofalowka', 'Krótkofalówka', 100, 0, 1, '{}', 'item'),
('kwas', 'Kwas', 300, 0, 1, '{}', 'item'),
('kwitek', 'Kwitek', 50, 0, 1, '{}', 'item'),
('laptop', 'Zaszyfrowany laptop', 5, 0, 1, '{}', 'item'),
('legalna', 'Legal Chest', 200, 0, 1, '{}', 'item'),
('leki', 'Leki', 5, 0, 1, '{}', 'item'),
('liquid', 'Liquid', 10, 0, 1, '{}', 'item'),
('lisciekoki', 'Liść Kokainy', 50, 0, 1, '{}', 'item'),
('lockpick', 'Lockpick', 1, 0, 1, '{}', 'item'),
('lornetka', 'Lornetka', 1, 0, 1, '{}', 'item'),
('maka', 'Maka', 40, 0, 1, '{}', 'item'),
('makulatura', 'Makulatura', 100, 0, 1, '{}', 'item'),
('mandarynka', 'Mandarynka', 150, 0, 1, '{}', 'item'),
('material', 'Materiał', 5, 0, 1, '{}', 'item'),
('material_krawiec', 'Materiał Fly Beliodas', 100, 0, 1, '{}', 'item'),
('mdp2p', 'MDP2P', 150, 0, 1, '{}', 'item'),
('medic', 'Przedmioty medyczne', 40, 0, 1, '{}', 'item'),
('medikit', 'Apteczka', 100, 0, 1, '{}', 'item'),
('meta', 'Metaamfetamina', 50, 0, 1, '{}', 'item'),
('meth', 'Krzystał metamfetaminy', 150, 0, 1, '{}', 'item'),
('meth_packaged', 'Packaged Meth', -1, 0, 1, '{}', 'item'),
('meth_pooch', 'Porcja metamfetaminy', 30, 0, 1, '{}', 'item'),
('meth_raw', 'Raw Meth', -1, 0, 1, '{}', 'item'),
('mieszacz', 'Mieszacz', 1, 0, 1, '{}', 'item'),
('milk', 'Mleko', 30, 0, 1, '{}', 'item'),
('milkjuice', 'Sok mleczny', 50, 0, 1, '{}', 'item'),
('milk_in_bottle', 'Butelka mleka', 50, 0, 1, '{}', 'item'),
('milk_in_pail', 'Wiaderko mleka', 100, 0, 1, '{}', 'item'),
('minigun_ammo', 'Amunicja do miniguna', 250, 0, 1, '{}', 'item'),
('molotovremove', 'Zgaś Koktajl Molotova', 10, 0, 1, '{}', 'item'),
('morfina', 'Morfina', 50, 0, 1, '{}', 'item'),
('morphine', 'Morphine', 5, 0, 1, '{}', 'item'),
('nightvision', 'Nocna wizja', 10, 0, 1, '{}', 'item'),
('nozyczki', 'Nożyczki', 10, 0, 1, '{}', 'item'),
('nurek_1', 'Strój do nurkowania I', 1, 0, 1, '{}', 'item'),
('nurek_2', 'Strój do nurkowania II', 1, 0, 1, '{}', 'item'),
('nurek_3', 'Strój do nurkowania III', 1, 0, 1, '{}', 'item'),
('nurek_4', 'Strój do nurkowania IV', 1, 0, 1, '{}', 'item'),
('nurek_5', 'Strój do nurkowania V', 1, 0, 1, '{}', 'item'),
('nurek_6', 'Strój do nurkowania VI', 1, 0, 1, '{}', 'item'),
('obraczka', 'Obrączka', 2, 0, 1, '{}', 'item'),
('odporneetui', 'Wodoodporne Etui', 5, 0, 1, '{}', 'item'),
('odpornetorba', 'Wodoodporna Torba', 5, 0, 1, '{}', 'item'),
('oghaze_pooch', 'Woreczek OG Haze', 100, 0, 1, '{}', 'item'),
('opaska', 'Opaska Lokalizacyjna', 1, 0, 0, '{}', 'item'),
('opium', 'Opium', 150, 0, 1, '{}', 'item'),
('opium_pooch', 'Pakunek z opium', 30, 0, 1, '{}', 'item'),
('orange', 'Porzeczka', 40, 0, 1, '{}', 'item'),
('pacholek', 'Pachołek', 10, 0, 1, '{}', 'item'),
('packaged_chicken', 'Zapakowany kurczak', 100, 0, 1, '{}', 'item'),
('paczka1', 'Paczka Ratusz', 20, 0, 1, '{}', 'item'),
('paczka2', 'Paczka LSC', 20, 0, 1, '{}', 'item'),
('paczka3', 'Paczka Urząd', 20, 0, 1, '{}', 'item'),
('paczka4', 'Paczka SASP', 20, 0, 1, '{}', 'item'),
('paczka5', 'Faktura', 20, 0, 1, '{}', 'item'),
('panic', 'Panic button', 3, 0, 1, '{}', 'item'),
('papieros', 'Papieros', 20, 0, 1, '{}', 'item'),
('paracetamol', 'Paracetamol', 150, 0, 1, '{}', 'item'),
('parachute', 'Spadochron', 2, 0, 1, '{}', 'item'),
('pastakokainowa', 'Pasta Kokainowa', 50, 0, 1, '{}', 'item'),
('pear', 'Winogrono', 100, 0, 1, '{}', 'item'),
('pendrive', 'Pendrive', 10, 0, 1, '{}', 'item'),
('petrol', 'Kanister', 1, 0, 1, '{}', 'item'),
('petrolcan', 'Kanister', 10, 0, 1, '{}', 'item_weapon'),
('phone', 'Telefon', 10, 0, 1, '{}', 'item'),
('photos', 'Zdjęcia do gazety', 100, 0, 1, '{}', 'item'),
('pilka', 'Piłka', 10, 0, 1, '{}', 'item'),
('pipebomb', 'Bomba rurowa', 10, 0, 1, '{}', 'item_weapon'),
('pistol_ammo', 'Amunicja do pistoletu', 250, 0, 1, '{}', 'item'),
('platynowakarta', 'Platynowa Karta', 10, 0, 1, '{}', 'item'),
('pomarancza', 'Pomarańcza', 150, 0, 1, '{}', 'item'),
('powerbank', 'PowerBank', 1, 0, 1, '{}', 'item'),
('prasa', 'Sprasowany złom', 50, 0, 1, '{}', 'item'),
('proxmine', 'Bomba zbliżeniowa', 10, 0, 1, '{}', 'item_weapon'),
('pszenica', 'Pszenica', 40, 0, 1, '{}', 'item'),
('pulpet', 'Pulpet', 100, 0, 1, '{}', 'item'),
('purple_phone', 'iPhone 13 Pro Max Fioletowy', 3, 0, 1, '{}', 'item'),
('radio', 'Radio', 1, 0, 1, '{}', 'item'),
('radiocar', 'Radio Samochodowe', 5, 0, 1, '{}', 'item'),
('radiocar_dismounter', 'Narzędzia do Radia Samochodowego', 5, 0, 1, '{}', 'item'),
('railgun', 'Railgun', 10, 0, 1, '{}', 'item_weapon'),
('raport', 'Raport', 6, 0, 1, '{}', 'item'),
('redbull', 'Redbull', 5, 0, 1, '{}', 'item'),
('red_phone', 'iPhone 13 Pro Max Czerwony', 3, 0, 1, '{}', 'item'),
('removeparachute', 'Zdejmij spadochron', 2, 0, 1, '{}', 'item'),
('rifle_ammo', 'Amunicja do karabinu', 250, 0, 1, '{}', 'item'),
('roza', 'Róża', 3, 0, 1, '{}', 'item'),
('rpg', 'Wyrzutnia rakiet', 10, 0, 1, '{}', 'item_weapon'),
('rpg_ammo', 'Amunicja do RPG', 250, 0, 1, '{}', 'item'),
('salmon', 'Salmon', 20, 0, 1, '{}', 'item'),
('samarka', 'Samarka', 5, 0, 1, '{}', 'item'),
('scope', 'Celownik', 5, 0, 1, '{}', 'item'),
('scope_advanced', 'Luneta Advanced', 10, 0, 1, '{}', 'item'),
('scope_holo', 'Celownik MK I', 10, 0, 1, '{}', 'item'),
('scope_large', 'Celownik MK III', 10, 0, 1, '{}', 'item'),
('scope_medium', 'Celownik MK II', 10, 0, 1, '{}', 'item'),
('scope_nightvision', 'Luneta Nightvision', 10, 0, 1, '{}', 'item'),
('scope_thermal', 'Luneta Thermal', 10, 0, 1, '{}', 'item'),
('scope_zoom', 'Luneta Zoom', 10, 0, 1, '{}', 'item'),
('scrap', 'Zlom', 30, 0, 1, '{}', 'item'),
('scratchcard', 'Zdrapka - Srebrna', 10, 0, 1, '{}', 'item'),
('scratchcarddiamond', 'Zdrapka - Diamentowa', 5, 0, 1, '{}', 'item'),
('scratchcardgold', 'Zdrapka - Złota', 5, 0, 1, '{}', 'item'),
('seed_weed', 'Nasiona ziola', 5, 0, 1, '{}', 'item'),
('ser', 'Ser', -1, 0, 1, '{}', 'item'),
('shot', 'Shot', 10, 0, 1, '{}', 'item'),
('shotburst', 'Singleshot', 10, 0, 1, '{}', 'item'),
('shotgun_ammo', 'Amunicja do strzelby', 250, 0, 1, '{}', 'item'),
('sim', 'Sim', 1, 0, 1, '{}', 'item'),
('sim_card', 'Karta SIM', -1, 0, 1, '{}', 'item'),
('skarpetka', 'Skarpeta na głowe', 1, 0, 1, '{}', 'item'),
('skladniki', 'Składniki', 100, 0, 1, '{}', 'item'),
('slaughtered_chicken', 'Martwy kurczak', 100, 0, 1, '{}', 'item'),
('sloik', 'Słoik z pulpetami', 100, 0, 1, '{}', 'item'),
('smg_ammo', 'Amunicja do SMG', 250, 0, 1, '{}', 'item'),
('smokegrenade', 'Gaz dymny', 10, 0, 1, '{}', 'item_weapon'),
('sniper_ammo', 'Amunicja do snajperki', 250, 0, 1, '{}', 'item'),
('snowball', 'Śnieżka', 10, 0, 1, '{}', 'item_weapon'),
('soda', 'Soda', 5, 0, 1, '{}', 'item'),
('sok', 'Sok', 80, 0, 1, '{}', 'item'),
('sok_mlekowy', 'Sok Mlekowy', 150, 0, 1, '{}', 'item'),
('sorted_money', 'Counterfeit Cash - Sorted', 10, 0, 1, '{}', 'item'),
('spray', 'Spray do Graffiti', 30, 0, 1, '{}', 'item'),
('spray_remover', 'Zmazywacz do Graffiti', 30, 1, 1, '{}', 'item'),
('srebrnakarta', 'Srebrna karta', 10, 0, 1, '{}', 'item'),
('starburst', 'Rakietka', 10, 0, 1, '{}', 'item'),
('steel', 'Stal', 100, 0, 1, '{}', 'item'),
('stickybomb', 'Bomba przylepna', 10, 0, 1, '{}', 'item_weapon'),
('suppressor', 'Tłumik', 5, 0, 1, '{}', 'item'),
('tablet', 'Tablet Exile-Book', 1, 1, 1, '{}', 'item'),
('tequila', 'Tequila', 100, 0, 1, '{}', 'item'),
('toolbox', 'Przybornik', 5, 0, 1, '{}', 'item'),
('tost', 'Tost', 15, 0, 1, '{}', 'item'),
('tosti', 'Kanapka Uber Eats', 10, 0, 1, '{}', 'item'),
('trailburst', 'Wyrzutnia', 10, 0, 1, '{}', 'item'),
('trout', 'Trout', 20, 0, 1, '{}', 'item'),
('tuna', 'Tuna', 40, 0, 1, '{}', 'item'),
('ubrania_krawiec', 'Ubrania Fly Beliodas', 10, 0, 1, '{}', 'item'),
('urzadzenie', 'Urządzenie Hakerskie', 5, 0, 1, '{}', 'item'),
('vape', 'E-Papieros', 3, 0, 1, '{}', 'item'),
('vicodin', 'Vicodin', 5, 0, 1, '{}', 'item'),
('vodka', 'Soplica 0.7L', 100, 0, 1, '{}', 'item'),
('walizka', 'Walizka', 20, 0, 1, '{}', 'item'),
('walizka_pistol', 'Walizka - Pistolet', 10, 0, 1, '{}', 'item'),
('walizka_pistolmk2', 'Walizka - Pistolet MK2', 10, 0, 1, '{}', 'item'),
('walizka_snspistol', 'Walizka - Pukawka', 10, 0, 1, '{}', 'item'),
('walizka_snspistolmk2', 'Walizka - Pukawka MK2', 10, 0, 1, '{}', 'item'),
('walizka_vintagepistol', 'Walizka - Pistolet Vintage', 10, 0, 1, '{}', 'item'),
('washed_orange', 'Umyta pomarańcza', 50, 0, 1, '{}', 'item'),
('water', 'Woda', 30, 0, 1, '{}', 'item'),
('weaponchest', 'Weapon Chest', 200, 0, 1, '{}', 'item'),
('WEAPON_ADVANCEDRIFLE', 'Karabin zaawansowany', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_APPISTOL', 'AP Pistol', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_ASSAULTRIFLE', 'Karabin szturmowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_ASSAULTRIFLE_MK2', 'Karabin szturmowy MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_ASSAULTSMG', 'Assault SMG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_AUTOSHOTGUN', 'Strzelba automatyczna', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_BAT', 'Kij bejsbolowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_BATTLEAXE', 'Topór bojowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_BULLPUPRIFLE_MK2', 'Bullpup Rifle MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_CARBINERIFLE', 'Carbine Rifle', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_CARBINERIFLE_MK2', 'Carbine Rifle MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_CERAMICPISTOL', 'Pistolet Ceramiczny', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMBATMG', 'Combat MG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMBATMG_MK2', 'Combat MG MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMBATPDW', 'Combat PDW', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMBATPISTOL', 'Pistolet bojowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMPACTLAUNCHER', 'Wyrzutnia kompaktowa', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_COMPACTRIFLE', 'Karabin kompaktowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_CROWBAR', 'Łom', -1, 0, 1, '{}', 'item_weapon'),
('WEAPON_DAGGER', 'Dagger', -1, 0, 1, '{}', 'item_weapon'),
('WEAPON_DBSHOTGUN', 'DB Shotgun', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_DOUBLEACTION', 'Double-Action Revolver', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_FLASHBANG', 'FLASHBANG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_FLASHLIGHT', 'Latarka', 5, 0, 1, '{}', 'item_weapon'),
('WEAPON_GRENADE', 'Granat', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_HEAVYPISTOL', 'Ciężki pistolet', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_HEAVYRIFLE', 'Heavy Rifle', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_HEAVYSHOTGUN', 'Ciężka strzelba', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_HEAVYSNIPER', 'Ciężka snajperka', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_HEAVYSNIPER_MK2', 'Ciężka snajperka MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_KNIFE', 'Nóż', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_KNUCKLE', 'Kastet', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MACHETE', 'Maczeta', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MACHINEPISTOL', 'Pistolet maszynowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MARKSMANPISTOL', 'Pistolet wyborowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MARKSMANRIFLE', 'Karabin wyborowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MARKSMANRIFLE_MK2', 'Karabin wyborowy MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MG', 'MG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MICROSMG', 'Micro SMG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MILITARYRIFLE', 'Military Rifle', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MINIGUN', 'Minigun', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MINISMG', 'Mini SMG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MOLOTOV', 'Koktajl Molotova', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_MUSKET', 'Muszkiet', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_NIGHTSTICK', 'Pałka', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_PISTOL', 'Pistolet', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_PISTOL50', 'Pistolet .50', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_PISTOL_MK2', 'Pistolet MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_POOLCUE', 'Kij bilardowy', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_PUMPSHOTGUN', 'Pompa tłokowa', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_PUMPSHOTGUN_MK2', 'Pompa tłokowa MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_REMOTESNIPER', 'Zdalna snajperka', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_REVOLVER', 'Rewolwer', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_REVOLVER_MK2', 'Rewolwer MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SAWNOFFSHOTGUN', 'Obrzyn', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SMG', 'SMG', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SMG_MK2', 'SMG MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SNIPERRIFLE', 'Snajperka', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SNSPISTOL', 'Pukawka', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SNSPISTOL_MK2', 'Pukawka MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SPECIALCARBINE', 'Karabinek specjalny', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SPECIALCARBINE_MK2', 'Karabin specjalny MK2', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_STUNGUN', 'Paralizator', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_SWITCHBLADE', 'Scyzoryk', 10, 0, 1, '{}', 'item_weapon'),
('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 10, 0, 1, '{}', 'item_weapon'),
('weed', 'Top Marihuany', 150, 0, 1, '{}', 'item'),
('weed_packaged', 'Packaged Weed', -1, 0, 1, '{}', 'item'),
('weed_pooch', 'Porcja Marihuany', 30, 0, 1, '{}', 'item'),
('weed_untrimmed', 'Untrimmed Weed', -1, 0, 1, '{}', 'item'),
('whisky', 'Jack Daniels 0.7L', 100, 0, 1, '{}', 'item'),
('winogrono', 'Winogrono', 150, 0, 1, '{}', 'item'),
('winogrono2', 'Winogrono', 100, 0, 1, '{}', 'item'),
('wizytowka', 'Wizytówka', 1, 0, 0, '{}', 'item'),
('worek', 'Worek na głowę', 8, 0, 1, '{}', 'item'),
('wrench', 'Klucz', -1, 0, 1, '{}', 'item_weapon'),
('wytrych', 'Wytrych', 10, 0, 1, '{}', 'item'),
('xgamermieszanka', 'Mieszanka X-Gamer', 100, 0, 1, '{}', 'item'),
('zapalniczka', 'Zapalniczka', 3, 0, 1, '{}', 'item'),
('ziarnokawy', 'Ziarno Kawy', 100, 0, 1, '{}', 'item'),
('zlotakarta', 'Złota karta', 10, 0, 1, '{}', 'item');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `digit` int(11) DEFAULT NULL,
  `jail_time` int(11) NOT NULL,
  `timeleft` int(11) DEFAULT NULL,
  `executed` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jakastabela`
--

CREATE TABLE `jakastabela` (
  `hex` varchar(50) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'SAMS', 1),
('baker', 'Piekarz', 1),
('burgershot', 'Burgershot', 1),
('cardealer', 'Luxury Company', 1),
('casino', 'Casino Royale', 1),
('cayo_perico', 'Cayo Perico Suzener', 1),
('courier', 'Go Postal', 1),
('deliverer', 'PostOP', 1),
('doj', 'Department Of Justice', 1),
('dtu', 'DTU', 1),
('extreme', 'Extreme Sports', 1),
('farming', 'Farmer', 1),
('fisherman', 'Rybak', 0),
('galaxy', 'Galaxy Club', 1),
('garbage', 'Śmieciarz', 1),
('gheneraugarage', 'Ghenerau Garage', 1),
('hwp', 'Highway Patrol', 1),
('k9', 'K9', 1),
('krawiec', 'Fly Beliodas', 0),
('mechanik', 'Los Santos Tuners', 1),
('mechanik2', 'LST', 1),
('milkman', 'Mleczarz', 0),
('miner', 'Górnik', 1),
('offambulance', 'SAMS (PS)', 1),
('offcardealer', 'Luxury Company (PS)', 1),
('offdoj', 'Departament Of Justice (PS)', 1),
('offgheneraugarage', 'Ghenerau Garage (PS)', 1),
('offk9', 'K9', 1),
('offmechanik', 'Los Santos Tuners (PS)', 1),
('offmechanik2', 'LST (PS)', 1),
('offpolice', 'SASP (PS)', 1),
('offsheriff', '(PS) SASD', 1),
('org1', '#1 The Families', 1),
('org10', '#10 Black Disciples', 1),
('org100', '#100 Wolna', 1),
('org101', '#101 Wolna', 1),
('org102', '#102 Wolna', 1),
('org103', '#103 Wolna', 1),
('org104', '#104 Wolna', 1),
('org105', '#105 Wolna', 1),
('org106', '#106 Wolna', 1),
('org107', '#107 Wolna', 1),
('org108', '#108 Wolna', 1),
('org109', '#109 Wolna', 1),
('org11', '#11 San Fierro Rifa', 1),
('org110', '#110 Wolna', 1),
('org111', '#111 Wolna', 1),
('org112', '#112 Wolna', 1),
('org113', '#113 Wolna', 1),
('org114', '#114 Wolna', 1),
('org115', '#15 Wolna', 1),
('org116', '#116 Wolna', 1),
('org117', '#117 Wolna', 1),
('org118', '#118 Wolna', 1),
('org119', '#119 Wolna', 1),
('org12', '#12 Avenues', 1),
('org120', '#120 Black Dragon', 1),
('org13', '#13 Mara Salvatrucha', 1),
('org14', '#14 La Cosa Nostra', 1),
('org15', '#15 TTR', 1),
('org16', '#16 Leyte', 1),
('org17', '#17 Cayo Perico', 1),
('org18', '#18 MDMA ', 1),
('org19', '#19 187', 1),
('org2', '#2 MarabuntaGrande', 1),
('org20', '#20 Wolna', 1),
('org21', '#21 Wolna', 1),
('org22', '#22 Wolna', 1),
('org23', '#23 Wolna', 1),
('org24', '#24 Wolna', 1),
('org25', '#25 Wolna', 1),
('org26', '#26 Wolna', 1),
('org27', '#27 Mafia', 1),
('org28', '#28 07', 1),
('org29', '#29 Wolna', 1),
('org3', '#3 Yakuza', 1),
('org30', '#30 BNB', 1),
('org31', '#31 Wolna', 1),
('org32', '#32 Wolna', 1),
('org33', '#33 Wolna', 1),
('org34', '#34 Wolna', 1),
('org35', '#35 Wolna', 1),
('org36', '#36 Wolna', 1),
('org37', '#37 Wolna', 1),
('org38', '#38 Wolna', 1),
('org39', '#39 Wolna', 1),
('org4', '#4 Bloods', 1),
('org40', '#40 Wolna', 1),
('org41', '#41 GNC', 1),
('org42', '#42 Wolna', 1),
('org43', '#43 Wolna', 1),
('org44', '#44 Wolna', 1),
('org45', '#45 Wolna', 1),
('org46', '#46 Wolna', 1),
('org47', '#47 Wolna', 1),
('org48', '#48 Wolna', 1),
('org49', '#49 Wolna', 1),
('org5', '#5 Ballas', 1),
('org50', '#50 Wolna', 1),
('org51', '#51 Wolna', 1),
('org52', '#52 Wolna', 1),
('org53', '#53 Wolna', 1),
('org54', '#54 Wolna', 1),
('org55', '#55 Wolna', 1),
('org56', '#56 Wolna', 1),
('org57', '#57 Wolna', 1),
('org58', '#58 Wolna', 1),
('org59', '#59 Wolna', 1),
('org6', '#6 LozAztecas', 1),
('org60', '#60 Wolna', 1),
('org61', '#61 Wolna', 1),
('org62', '#62 Wolna', 1),
('org63', '#63 Wolna', 1),
('org64', '#64 Wolna', 1),
('org65', '#65 Wolna', 1),
('org66', '#66 Wolna', 1),
('org67', '#67 Wolna', 1),
('org68', '#68 Wolna', 1),
('org69', '#69 Wolna', 1),
('org7', '#7 Vagos', 1),
('org70', '#70 Wolna', 1),
('org71', '#71 Wolna', 1),
('org72', '#72 Wolna', 1),
('org73', '#73 Wolna', 1),
('org74', '#74 Wolna', 1),
('org8', '#8 Crips', 1),
('org80', '#80 Wolna', 1),
('org81', '#81 Wolna', 1),
('org82', '#82 Wolna', 1),
('org83', '#83 Wolna', 1),
('org84', '#84 Wolna', 1),
('org85', '#85 Wolna', 1),
('org86', '#86 Wolna', 1),
('org87', '#87 Wolna', 1),
('org88', '#88 Wolna', 1),
('org89', '#89 Wolna', 1),
('org9', '#9 The Lost', 1),
('org90', '#90 Wolna', 1),
('org91', '#91 Wolna', 1),
('org92', '#92 Wolna', 1),
('org93', '#93 Wolna', 1),
('org94', '#94 Wolna', 1),
('org95', '#96 Wolna', 1),
('org96', '#96 Wolna', 1),
('org97', '#97 Wolna', 1),
('org98', '#98 Wolna', 1),
('org99', '#99 Wolna', 1),
('pizzeria', 'Pizza This', 1),
('police', 'SASP', 1),
('psycholog', 'LSPO', 1),
('pullpet', 'Pullpet Company', 1),
('rafiner', 'Rafiner', 1),
('sert', 'SERT', 1),
('sheriff', 'SASD', 1),
('slaughter', 'Rzeźnik', 1),
('swat', 'SWAT', 1),
('taxi', 'DT Cab. Co.', 0),
('unemployed', 'Bezrobotny', 1),
('usms', 'USMS', 1),
('weazel', 'Weazel News', 0),
('wiesbuda', 'WieśBuda', 1),
('winiarz', 'Winiarz', 0),
('x-gamer', 'X-Gamer', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jobs_insurance`
--

CREATE TABLE `jobs_insurance` (
  `name` varchar(50) NOT NULL,
  `job_label` varchar(50) DEFAULT NULL,
  `oc` int(11) NOT NULL DEFAULT 0,
  `nnw` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jobs_insurance`
--

INSERT INTO `jobs_insurance` (`name`, `job_label`, `oc`, `nnw`) VALUES
('ambulance', 'SAMS', 0, 1),
('baker', 'Piekarz', 0, 0),
('burgershot', 'Burgershot', 0, 0),
('cardealer', 'Salon samochodowy', 0, 0),
('casino', 'Kasyno', 0, 0),
('courier', 'Go Postal', 0, 0),
('doj', 'Department Of Justice', 0, 0),
('extreme', 'Extreme Sports', 0, 0),
('farming', 'Farmer', 0, 0),
('fisherman', 'RYBAK', 0, 0),
('gheneraugarage', 'Ghenerau Garage', 0, 0),
('grower', 'Sadownik', 0, 0),
('krawiec', 'Krawiec', 0, 0),
('mechanik', 'Los Santos Tuners', 0, 0),
('mechanik2', 'Molti Garage', 0, 0),
('milkman', 'Mleczarz', 0, 0),
('miner', 'StoneWork', 0, 0),
('offambulance', 'SAMS (PS)', 0, 1),
('offgheneraugarage', 'Ghenerau Garage (PS)', 0, 0),
('offmechanik', 'Los Santos Tuners (PS)', 0, 0),
('offmechanik2', 'Moltii Garage (PS)', 0, 0),
('pizzeria', 'Pizzeria', 0, 0),
('police', 'SASP', 0, 1),
('psycholog', 'LSPO', 0, 0),
('sheriff', 'SASD', 0, 1),
('slaughter', 'Rzeźnik', 0, 0),
('taxi', 'Taxi', 0, 0),
('weazel', 'Weazel News', 0, 0),
('wiesbuda', 'WieśBud', 0, 0),
('winiarz', 'Winiarz', 0, 0),
('x-gamer', 'X-Gamer', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Na zasiłku', 100, '{}', '{}'),
(20, 'police', 0, 'recruit', 'Cadet', 400, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(21, 'police', 1, 'officer', 'Probie Trooper', 500, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(22, 'police', 2, 'officer', 'Trooper', 700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23, 'police', 3, 'officer', 'Senior Trooper', 900, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(24, 'police', 4, 'sergeant', 'Sergeant', 1100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(25, 'police', 5, 'sergeant', 'Senior Sergeant', 1400, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(26, 'police', 6, 'sergeant', 'Staff Sergeant', 1700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(27, 'police', 7, 'intendent', 'Lieutenant', 2000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(28, 'police', 8, 'intendent', 'Staff Lieutenant', 2300, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(29, 'police', 9, 'intendent', 'Captain', 2600, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(30, 'police', 10, 'lieutenant', 'Staff Captain', 2900, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(31, 'police', 11, 'boss', 'Commander', 3300, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(32, 'police', 12, 'boss', 'Assistant Chief of Police', 3500, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(34, 'police', 13, 'boss', 'Deputy Chief of Police', 3700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(35, 'police', 14, 'boss', 'Chief of Police', 4000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(36, 'offsheriff', 0, 'recruit', 'Cadet', 150, '{}', '{}'),
(37, 'offsheriff', 1, 'probie', 'Probie Deputy', 200, '{}', '{}'),
(38, 'offsheriff', 2, 'deputy', 'Deputy', 250, '{}', '{}'),
(39, 'offsheriff', 3, 's_deputy', 'Senior Deputy', 300, '{}', '{}'),
(40, 'offsheriff', 4, 'corporal', 'Sergeant', 350, '{}', '{}'),
(41, 'offsheriff', 5, 'sergeant', 'Senior Sergeant', 400, '{}', '{}'),
(42, 'offsheriff', 6, 'm_sergeant', 'Master Sergeant', 500, '{}', '{}'),
(43, 'offsheriff', 7, 'lieutenant', 'Lieutenant', 600, '{}', '{}'),
(44, 'offsheriff', 8, 's_lieutenant', 'Senior Lieutenant', 700, '{}', '{}'),
(45, 'offsheriff', 9, 'captain', 'Captain', 800, '{}', '{}'),
(46, 'offsheriff', 10, 's_captain', 'Senior Captain', 850, '{}', '{}'),
(47, 'offsheriff', 11, 'chief', 'Division Chief', 1000, '{}', '{}'),
(48, 'offsheriff', 12, 'undersheriff', 'Undersheriff', 1100, '{}', '{}'),
(49, 'offsheriff', 13, 'boss', 'Sheriff', 1200, '{}', '{}'),
(70, 'taxi', 8, 'boss', 'Zastępca', 950, '{}', '{}'),
(71, 'taxi', 0, 'rekrut', 'Okres próbny', 200, '{}', '{}'),
(100, 'org36', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(101, 'org36', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(102, 'org36', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(103, 'org36', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(104, 'org36', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(105, 'org36', 5, 'szef', 'Szef', 100, '{}', '{}'),
(111, 'x-gamer', 5, 'specjalistakaw', 'Specjalista', 700, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(112, 'x-gamer', 4, 'zawodowieckaw', 'Zawodowiec', 600, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(113, 'x-gamer', 1, 'mlodszypracownik', 'Młodszy Pracownik', 300, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(115, 'fisherman', 0, 'employee', 'Stażysta', 600, '{}', '{}'),
(116, 'fisherman', 1, 'employee', 'Młodszy pracownik', 700, '{}', '{}'),
(117, 'fisherman', 2, 'employee', 'Pracownik', 800, '{}', '{}'),
(118, 'fisherman', 3, 'employee', 'Fachowiec', 900, '{}', '{}'),
(119, 'fisherman', 4, 'employee', 'Zawodowiec', 1000, '{}', '{}'),
(120, 'fisherman', 5, 'employee', 'Specjalista', 1100, '{}', '{}'),
(121, 'slaughter', 0, 'kawiarnia', 'Stażysta', 600, '{}', '{}'),
(122, 'slaughter', 1, 'mlodszypracownik', ' Młodszy pracownik', 700, '{}', '{}'),
(123, 'slaughter', 2, 'kawiarnia2', 'Pracownik', 800, '{}', '{}'),
(124, 'slaughter', 3, 'kawiarnia3', 'Fachowiec', 900, '{}', '{}'),
(125, 'slaughter', 4, 'zawodowieckaw', 'Zawodowiec', 1000, '{}', '{}'),
(126, 'slaughter', 5, 'specjalistakw', 'Specjalista', 1100, '{}', '{}'),
(127, 'slaughter', 8, 'boss', 'Właściciel', 1500, '{}', '{}'),
(128, 'slaughter', 7, 'underboss', 'Zastępca', 1400, '{}', '{}'),
(129, 'slaughter', 6, 'kawiarnia4', 'Manager', 1300, '{}', '{}'),
(130, 'fisherman', 6, 'employee', 'Manager', 1300, '{}', '{}'),
(131, 'fisherman', 7, 'boss', 'Zastępca', 1400, '{}', '{}'),
(132, 'fisherman', 8, 'boss', 'Właściciel', 1500, '{}', '{}'),
(133, 'ambulance', 0, 'ambulance', 'Nurse', 400, '{}', '{}'),
(134, 'ambulance', 1, 'ambulance', 'Paramedic', 600, '{}', '{}'),
(135, 'ambulance', 2, 'ambulance', 'Senior Paramedic', 700, '{}', '{}'),
(136, 'ambulance', 3, 'ambulance', 'Doctor', 800, '{}', '{}'),
(137, 'ambulance', 4, 'ambulance', 'Senior Doctor', 1000, '{}', '{}'),
(138, 'ambulance', 5, 'ambulance', 'Medical Specialist', 1200, '{}', '{}'),
(139, 'ambulance', 6, 'ambulance', 'Surgeon', 1400, '{}', '{}'),
(140, 'ambulance', 7, 'ambulance', 'Assistant Neurosurgeon', 1600, '{}', '{}'),
(141, 'ambulance', 8, 'ambulance', 'Neurosurgeon', 1800, '{}', '{}'),
(142, 'ambulance', 9, 'ambulance', 'Professor', 2000, '{}', '{}'),
(143, 'ambulance', 10, 'boss', '2Head of the Hospital', 2400, '{}', '{}'),
(144, 'ambulance', 11, 'boss', 'Head of the Hospital', 2600, '{}', '{}'),
(145, 'ambulance', 12, 'boss', 'Assistant Director of the Hospital', 2800, '{}', '{}'),
(146, 'ambulance', 13, 'boss', 'Director of the Hospital', 3000, '{}', '{}'),
(147, 'offambulance', 0, 'ambulance', 'Nurse', 200, '{}', '{}'),
(148, 'offambulance', 1, 'ambulance', 'Paramedic', 250, '{}', '{}'),
(149, 'offambulance', 2, 'ambulance', 'Senior Paramedic', 300, '{}', '{}'),
(150, 'offambulance', 3, 'ambulance', 'Doctor', 325, '{}', '{]'),
(151, 'offambulance', 4, 'ambulance', 'Senior Doctor', 350, '{}', '{}'),
(152, 'offambulance', 5, 'ambulance', 'Medical Specialist', 375, '{}', '{}'),
(153, 'offambulance', 6, 'ambulance', 'Surgeon', 400, '{}', '{}'),
(154, 'offambulance', 7, 'ambulance', 'Assistant Neurosurgeon', 450, '{}', '{}'),
(155, 'offambulance', 8, 'ambulance', 'Neurosurgeon', 500, '{}', '{}'),
(156, 'offambulance', 9, 'ambulance', 'Professor', 600, '{}', '{}'),
(157, 'offambulance', 10, 'boss', '2Head of the Hospital', 700, '{}', '{}'),
(158, 'offambulance', 11, 'boss', 'Head of the Hospital', 800, '{}', '{}'),
(159, 'offambulance', 12, 'boss', 'Assistant Director of the Hospital', 900, '{}', '{}'),
(160, 'offambulance', 13, 'boss', 'Director of the Hospital', 1000, '{}', '{}'),
(161, 'hwp', 0, 'hwp', 'Proobie Officer of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(162, 'hwp', 1, 'hwp', 'Officer of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(163, 'hwp', 2, 'hwp', 'Sergeant of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(164, 'hwp', 3, 'hwp', 'Lieutenant of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(165, 'hwp', 4, 'hwp', 'Capitan of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(166, 'hwp', 5, 'hwp', 'Commander of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(167, 'hwp', 6, 'hwp', 'Deputy Chief of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(168, 'hwp', 7, 'hwp', 'Chief of HP', 100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(169, 'org37', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(170, 'org37', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(171, 'org37', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(172, 'org37', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(173, 'org37', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(174, 'org37', 5, 'szef', 'Szef', 100, '{}', '{}'),
(175, 'org38', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(176, 'org38', 1, 'zolnierz', 'Zołnierz', 100, '{}', '{}'),
(177, 'org38', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(178, 'org38', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(179, 'org38', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(180, 'org38', 5, 'szef', 'Szef', 100, '{}', '{}'),
(181, 'org39', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(182, 'org39', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(183, 'org39', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(184, 'org39', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(185, 'org39', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(186, 'org39', 5, 'szef', 'Szef', 100, '{}', '{}'),
(187, 'org35', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(188, 'org35', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(189, 'org35', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(190, 'org35', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(191, 'org35', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(192, 'org35', 5, 'szef', 'Szef', 100, '{}', '{}'),
(193, 'org46', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(194, 'org46', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(195, 'org46', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(196, 'org46', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(197, 'org46', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(198, 'org46', 5, 'szef', 'Szef', 100, '{}', '{}'),
(199, 'org41', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(200, 'org41', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(201, 'org41', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(202, 'org41', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(203, 'org41', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(204, 'org41', 5, 'szef', 'Szef', 100, '{}', '{}'),
(205, 'org71', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(206, 'org71', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(207, 'org71', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(208, 'org71', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(209, 'org71', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(210, 'org71', 5, 'szef', 'Szef', 100, '{}', '{}'),
(218, 'taxi', 1, 'rekrut', 'Stażysta', 300, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":118,\"torso_2\":1,\"shoes_1\":10,\"shoes_2\":1,\"pants_1\":54, \"pants_2\":2, \"arms\":4}'),
(219, 'taxi', 2, 'nowicjusz', 'Młodszy pracownik', 400, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(221, 'taxi', 3, 'kierowca', 'Pracownik', 500, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(222, 'taxi', 4, 'stazysta', 'Fachowiec', 600, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(224, 'taxi', 5, 'zawodowiec', 'Zawodowiec', 700, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(226, 'taxi', 6, 'obsluga', 'Specjalista', 800, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(227, 'taxi', 7, 'manager', 'Manager', 900, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(228, 'taxi', 9, 'boss', 'Właściciel', 1000, '{}', '{}'),
(229, 'org47', 5, 'szef', 'Szef', 100, '{}', '{}'),
(230, 'org47', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(231, 'org47', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(232, 'org47', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(233, 'org47', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(234, 'org47', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(235, 'org43', 5, 'szef', 'Szef', 100, '{}', '{}'),
(236, 'org43', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(237, 'org43', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(238, 'org43', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(239, 'org43', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(240, 'org43', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(251, 'baker', 0, 'kawiarnia', 'Rekrut', 600, '{}', '{}'),
(252, 'baker', 1, 'mlodszypracownik', 'Nowicjusz', 700, '{}', '{}'),
(253, 'baker', 4, 'zawodowieckaw', 'Zawodowiec', 1000, '{}', '{}'),
(254, 'baker', 6, 'koordynator', 'Koordynator', 1300, '{}', '{}'),
(255, 'baker', 7, 'kawiarnia4', 'Manager', 1400, '{}', '{}'),
(256, 'baker', 8, 'underboss', 'Prezes', 1500, '{}', '{}'),
(257, 'baker', 5, 'specjalistakw', 'Specjalista', 1100, '{}', '{}'),
(258, 'baker', 9, 'boss', 'Właściciel', 1200, '{}', '{}'),
(259, 'baker', 2, 'kawiarnia2', 'Pracownik', 800, '{}', '{}'),
(260, 'baker', 3, 'kawiarnia3', 'Fachowiec', 900, '{}', '{}'),
(268, 'cardealer', 0, 'sprzedawca', 'Sprzedawca', 700, '{}', '{}'),
(269, 'cardealer', 1, 'doradca', 'Doradca', 900, '{}', '{}'),
(270, 'cardealer', 3, 'manager', 'Manager', 1100, '{}', '{}'),
(271, 'winiarz', 0, 'kawiarnia', 'Stażysta', 600, '{}', '{}'),
(272, 'winiarz', 1, 'mlodszypracownik', 'Młodszy pracownik', 700, '{}', '{}'),
(273, 'winiarz', 2, 'kawiarnia2', 'Pracownik', 800, '{}', '{}'),
(274, 'winiarz', 3, 'kawiarnia3', 'Fachowiec', 900, '{}', '{}'),
(275, 'winiarz', 4, 'zawodowieckaw', 'Zawodowiec', 1000, '{}', '{}'),
(276, 'winiarz', 5, 'specjalistakw', 'Specjalista', 1100, '{}', '{}'),
(278, 'winiarz', 6, 'kawiarnia4', 'Manager', 1400, '{}', '{}'),
(279, 'winiarz', 7, 'underboss', 'Zastępca', 1500, '{}', '{}'),
(280, 'winiarz', 8, 'boss', 'Właściciel', 1700, '{}', '{}'),
(281, 'burgershot', 0, 'kawiarnia', 'Stażysta', 200, '{}', '{}'),
(282, 'burgershot', 1, 'mlodszypracownik', 'Młodszy pracownik', 300, '{}', '{}'),
(283, 'burgershot', 2, 'kawiarnia2', 'Pracownik', 400, '{}', '{}'),
(284, 'burgershot', 3, 'kawiarnia3', 'Fachowiec', 500, '{}', '{}'),
(285, 'burgershot', 4, 'zawodowieckaw', 'Zawodowiec', 600, '{}', '{}'),
(286, 'burgershot', 5, 'specjalistakw', 'Specjalista', 700, '{}', '{}'),
(288, 'burgershot', 6, 'kawiarnia4', 'Manager', 800, '{}', '{}'),
(289, 'burgershot', 7, 'underboss', 'Zastępca', 900, '{}', '{}'),
(290, 'burgershot', 8, 'boss', 'Właściciel', 1000, '{}', '{}'),
(300, 'offpolice', 0, 'recruit', 'Cadet', 150, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(301, 'offpolice', 1, 'officer', 'Probie Trooper', 200, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(302, 'offpolice', 2, 'officer', 'Trooper', 250, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(303, 'offpolice', 3, 'officer', 'Senior Trooper', 300, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(304, 'offpolice', 4, 'sergeant', 'Seargeant', 350, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(305, 'offpolice', 5, 'sergeant', 'Senior Sergeant', 400, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(306, 'offpolice', 6, 'sergeant', 'Staff Sergeant', 450, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(307, 'offpolice', 7, 'sergeant', 'Lieutenant', 500, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(308, 'offpolice', 8, 'sergeant', 'Staff Lieutenant', 600, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(309, 'offpolice', 9, 'sergeant', 'Captain', 700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(310, 'offpolice', 10, 'lieutenant', 'Staff Captain', 800, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(311, 'offpolice', 11, 'lieutenant', 'Commander', 850, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(312, 'offpolice', 12, 'boss', 'Assistant Chief of Police', 1000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(313, 'offpolice', 13, 'boss', 'Deputy Chief of Police', 1100, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(314, 'offpolice', 14, 'boss', 'Chief of Police', 1200, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(357, 'deliverer', 0, 'recruit', 'Zatrudniony', 250, '{}', '{}'),
(360, 'org45', 5, 'szef', 'Szef', 100, '{}', '{}'),
(361, 'org45', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(362, 'org45', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(363, 'org45', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(364, 'org45', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(365, 'org45', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(366, 'org44', 5, 'szef', 'Szef', 100, '{}', '{}'),
(367, 'org44', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(368, 'org44', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(369, 'org44', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(370, 'org44', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(371, 'org44', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(372, 'org42', 5, 'szef', 'Szef', 100, '{}', '{}'),
(373, 'org42', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(374, 'org42', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(375, 'org42', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(376, 'org42', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(377, 'org42', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(378, 'org72', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(379, 'org72', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(380, 'org72', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(381, 'org72', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(382, 'org72', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(383, 'org72', 5, 'szef', 'Szef', 100, '{}', '{}'),
(384, 'org73', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(385, 'org73', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(386, 'org73', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(387, 'org73', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(388, 'org73', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(389, 'org73', 5, 'szef', 'Szef', 100, '{}', '{}'),
(390, 'org74', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(391, 'org74', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(392, 'org74', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(393, 'org74', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(394, 'org74', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(395, 'org74', 5, 'szef', 'Szef', 100, '{}', '{}'),
(403, 'mechanik', 0, 'recrue', 'Rekrut', 300, '{}', '{}'),
(404, 'mechanik', 1, 'novice', 'Nowicjusz', 500, '{}', '{}'),
(405, 'mechanik', 4, 'novice', 'Zawodowiec', 1100, '{}', '{}'),
(406, 'mechanik', 5, 'experimente', 'Specjalista', 1300, '{}', '{}'),
(407, 'mechanik', 7, 'chief', 'Zast. Szefa', 1800, '{}', '{}'),
(408, 'mechanik', 8, 'boss', 'Szef', 2000, '{}', '{}'),
(409, 'offmechanik', 0, 'recrue', 'Rekrut', 150, '{}', '{}'),
(410, 'offmechanik', 1, 'novice', 'Nowicjusz', 200, '{}', '{}'),
(411, 'offmechanik', 4, 'novice', 'Zawodowiec', 500, '{}', '{}'),
(412, 'offmechanik', 5, 'experimente', 'Specjalista', 600, '{}', '{}'),
(413, 'offmechanik', 7, 'chief', 'Zast. Szef', 900, '{}', '{}'),
(414, 'offmechanik', 8, 'boss', 'Szef', 1000, '{}', '{}'),
(435, 'k9', 1, 'boss', 'Molly', 100, '{}', '{}'),
(436, 'k9', 0, 'boss', 'Magulon', 100, '{}', '{}'),
(437, 'k9', 2, 'boss', 'Livia', 100, '{}', '{}'),
(438, 'offk9', 0, 'boss', 'Magulon', 100, '{}', '{}'),
(439, 'offk9', 1, 'boss', 'Molly', 100, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(440, 'offk9', 2, 'boss', 'Livia', 100, '{}', '{}'),
(441, 'k9', 3, 'boss', 'Anon', 100, '{}', '{}'),
(442, 'offk9', 3, 'boss', 'Anon', 100, '{}', '{}'),
(443, 'k9', 4, 'boss', 'Ivy', 100, '{}', '{}'),
(444, 'offk9', 4, 'boss', 'Ivy', 100, '{}', '{}'),
(445, 'k9', 5, 'boss', 'Imago', 100, '{}', '{}'),
(446, 'offk9', 5, 'boss', 'Imago', 100, '{}', '{}'),
(447, 'k9', 6, 'boss', 'Lulu', 100, '{}', '{}'),
(448, 'offk9', 6, 'boss', 'Lulu', 100, '{}', '{}'),
(469, 'sert', 0, 'sert', 'Member', 100, '{}', '{}'),
(470, 'casino', 0, 'ochroniarz', 'Ochroniarz', 500, '{}', '{}'),
(471, 'casino', 1, 'szef_ochrony', 'Szef ochrony', 700, '{}', '{}'),
(472, 'casino', 2, 'barman', 'Barman', 800, '{}', '{}'),
(473, 'casino', 3, 'krupier', 'Licytator', 1100, '{}', '{}'),
(474, 'casino', 4, 'manager', 'Manager', 1200, '{}', '{}'),
(475, 'casino', 5, 'wspolnik', 'Wspólnik', 1300, '{}', '{}'),
(476, 'casino', 6, 'wlasciciel', 'Właściciel', 1500, '{}', '{}'),
(477, 'extreme', 0, 'pracownik', 'Pracownik', 150, '{}', '{}'),
(478, 'extreme', 1, 's_pracownik', 'Starszy pracownik', 250, '{}', '{}'),
(479, 'extreme', 2, 'instruktor', 'Instruktor', 350, '{}', '{}'),
(480, 'extreme', 3, 'manager', 'Manager', 450, '{}', '{}'),
(481, 'extreme', 4, 'wlasciciel', 'Właściciel', 600, '{}', '{}'),
(482, 'org1', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(483, 'org1', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(484, 'org1', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(485, 'org1', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(486, 'org1', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(487, 'org1', 5, 'szef', 'Szef', 100, '{}', '{}'),
(488, 'org2', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(489, 'org2', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(490, 'org2', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(491, 'org2', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(492, 'org2', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(493, 'org2', 5, 'szef', 'Szef', 100, '{}', '{}'),
(494, 'org3', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(495, 'org3', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(496, 'org3', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(497, 'org3', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(498, 'org3', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(499, 'org3', 5, 'szef', 'Szef', 100, '{}', '{}'),
(500, 'org4', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(501, 'org4', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(502, 'org4', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(503, 'org4', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(504, 'org4', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(505, 'org4', 5, 'szef', 'Szef', 100, '{}', '{}'),
(506, 'org5', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(507, 'org5', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(508, 'org5', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(509, 'org5', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(510, 'org5', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(511, 'org5', 5, 'szef', 'Szef', 100, '{}', '{}'),
(512, 'org6', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(513, 'org6', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(514, 'org6', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(515, 'org6', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(516, 'org6', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(517, 'org6', 5, 'szef', 'Szef', 100, '{}', '{}'),
(518, 'org7', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(519, 'org7', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(520, 'org7', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(521, 'org7', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(522, 'org7', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(523, 'org7', 5, 'szef', 'Szef', 100, '{}', '{}'),
(524, 'org8', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(525, 'org8', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(526, 'org8', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(527, 'org8', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(528, 'org8', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(529, 'org8', 5, 'szef', 'Szef', 100, '{}', '{}'),
(530, 'org9', 0, 'rekrut', 'Outsider', 100, '{}', '{}'),
(531, 'org9', 1, 'zolnierz', 'Ballas Member', 100, '{}', '{}'),
(532, 'org9', 2, 'kapitan', 'Homie', 100, '{}', '{}'),
(533, 'org9', 3, 'doradca', 'Gangbanger', 100, '{}', '{}'),
(534, 'org9', 4, 'zastepca', 'BG', 100, '{}', '{}'),
(535, 'org9', 5, 'szef', 'OG', 100, '{}', '{}'),
(536, 'org10', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(537, 'org10', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(538, 'org10', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(539, 'org10', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(540, 'org10', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(541, 'org10', 5, 'szef', 'Szef', 100, '{}', '{}'),
(547, 'dtu', 0, 'recruit', 'New Agent Trainee', 700, '{}', '{}'),
(548, 'dtu', 1, 'recruit', 'Special Agent', 800, '{}', '{}'),
(549, 'dtu', 2, 'recruit', 'Senior Special Agent', 900, '{}', '{}'),
(550, 'dtu', 3, 'recruit', 'Special Agent in Charge', 100, '{}', '{}'),
(551, 'x-gamer', 0, 'kawiarnia', 'Stażysta', 200, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(552, 'x-gamer', 7, 'underboss', 'Zastępca', 900, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(553, 'x-gamer', 8, 'boss', 'Wlasciciel', 1000, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(554, 'doj', 0, 'recruit', 'Aplikant', 1200, '{}', '{}'),
(555, 'doj', 1, 'recruit', 'Adwokat', 1500, '{}', '{}'),
(556, 'doj', 2, 'recruit', 'Adwokat Młodszy', 2000, '{}', '{}'),
(557, 'doj', 3, 'recruit', 'Adwokat Starszy', 2500, '{}', '{}'),
(558, 'galaxy', 0, 'recruit', 'Rekrut', 200, '{}', '{}'),
(559, 'galaxy', 1, 'recruit', 'Pracownik', 500, '{}', '{}'),
(560, 'galaxy', 2, 'recruit', 'Starszy Pracownik', 700, '{}', '{}'),
(561, 'galaxy', 3, 'recruit', 'DJ', 1000, '{}', '{}'),
(598, 'org11', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(599, 'org11', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(600, 'org11', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(601, 'org11', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(602, 'org11', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(603, 'org11', 5, 'szef', 'Szef', 100, '{}', '{}'),
(606, 'psycholog', 0, 'stazysta', 'Stażysta', 1000, '{}', '{}'),
(607, 'psycholog', 1, '1stopien', 'Młodszy Psycholog', 1500, '{}', '{}'),
(608, 'psycholog', 2, '2stopien', 'Psycholog', 1750, '{}', '{}'),
(609, 'psycholog', 3, 'mlodszy', 'Starszy Psycholog', 2000, '{}', '{}'),
(610, 'psycholog', 4, 'starszy', 'Zastępca Dyrektora', 2750, '{}', '{}'),
(611, 'psycholog', 5, 'dyrektor', 'Dyrektor', 3000, '{}', '{}'),
(612, 'org13', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(613, 'org13', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(614, 'org13', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(616, 'org13', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(617, 'org13', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(618, 'org13', 5, 'szef', 'Szef', 100, '{}', '{}'),
(619, 'org12', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(620, 'org12', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(621, 'org12', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(622, 'org12', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(623, 'org12', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(624, 'org12', 5, 'szef', 'Szef', 100, '{}', '{}'),
(625, 'usms', 0, 'usms', 'Funkcjonariusz', 500, '{}', '{}'),
(626, 'x-gamer', 2, 'kawiarnia2', 'Pracownik', 400, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(627, 'x-gamer', 3, 'kawiarnia3', 'Fachowiec', 500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(628, 'x-gamer', 6, 'kawiarnia4', 'Manager', 800, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":282,\"torso_2\":8,\"arms\":8,\"pants_1\":68,\"pants_2\":2,\"shoes_1\":75,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":295,\"torso_2\":8,\"arms\":70,\"pants_1\":116,\"pants_2\":0,\"shoes_1\":33,\"shoes_2\":4,\"helmet_1\":-1,\"helmet_2\":0}'),
(632, 'mechanik', 3, 'novice', 'Fachowiec', 900, '{}', '{}'),
(634, 'mechanik', 2, 'novice', 'Majster', 700, '{}', '{}'),
(635, 'mechanik', 6, 'experimente', 'Koordynator', 1500, '{}', '{}'),
(636, 'offmechanik', 3, 'novice', 'Fachowiec', 400, '{}', '{}'),
(637, 'offmechanik', 2, 'novice', 'Majster', 300, '{}', '{}'),
(638, 'offmechanik', 6, 'experimente', 'Koordynator', 700, '{}', '{}'),
(639, 'courier', 0, 'employee', 'Rekrut', 600, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(640, 'courier', 1, 'employee', 'Nowicjusz', 700, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":35,\"pants_2\":0,\"shoes_1\":7,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(641, 'courier', 2, 'employee', 'Pracownik', 800, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(642, 'courier', 4, 'employee', 'Zawodowiec', 1000, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":35,\"pants_2\":0,\"shoes_1\":7,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(643, 'courier', 5, 'employee', 'Specjalista', 1100, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(644, 'sheriff', 0, 'recruit', 'Cadet', 400, '{}', '{}'),
(645, 'sheriff', 1, 'probie', 'Probie Deputy', 600, '{}', '{}'),
(646, 'sheriff', 2, 'deputy', 'Deputy', 800, '{}', '{}'),
(647, 'sheriff', 3, 's_deputy', 'Senior Deputy', 1100, '{}', '{}'),
(648, 'sheriff', 4, 'corporal', 'Sergeant', 1400, '{}', '{}'),
(649, 'sheriff', 5, 'sergeant', 'Senior Sergeant', 1700, '{}', '{}'),
(650, 'sheriff', 6, 'm_sergeant', 'Master Sergeant', 2000, '{}', '{}'),
(651, 'sheriff', 7, 'lieutenant', 'Lieutenant', 2300, '{}', '{}'),
(652, 'sheriff', 8, 's_lieutenant', 'Senior Lieutenant', 2600, '{}', '{}'),
(653, 'sheriff', 9, 'captain', 'Captain', 2900, '{}', '{}'),
(654, 'sheriff', 10, 's_captain', 'Senior Captain', 3300, '{}', '{}'),
(655, 'sheriff', 11, 'chief', 'Division Chief', 3500, '{}', '{}'),
(656, 'sheriff', 12, 'undersheriff', 'Undersheriff', 3700, '{}', '{}'),
(657, 'sheriff', 13, 'boss', 'Sheriff', 4000, '{}', '{}'),
(658, 'org14', 0, 'rekrut', 'Członek', 100, '{}', '{}'),
(659, 'org14', 2, 'zolnierz', 'Wprawiony', 100, '{}', '{}'),
(660, 'org14', 3, 'kapitan', 'Weteran', 100, '{}', '{}'),
(661, 'org14', 4, 'doradca', 'Herszt ', 100, '{}', '{}'),
(662, 'org14', 5, 'zastepca', 'Underboss', 100, '{}', '{}'),
(663, 'org14', 6, 'szef', 'Boss', 100, '{}', '{}'),
(664, 'org15', 5, 'szef', 'Szef', 100, '{}', '{}'),
(665, 'org15', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(666, 'org15', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(667, 'org15', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(668, 'org15', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(669, 'org15', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(670, 'courier', 3, 'employee', 'Fachowiec', 900, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":35,\"pants_2\":0,\"shoes_1\":7,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}\r\n', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(671, 'courier', 6, 'employee', 'Manager', 1300, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(672, 'courier', 7, 'employee', 'Zastępca', 1400, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(673, 'courier', 8, 'employee', 'boss', 1500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":171,\"torso_2\":1,\"arms\":0,\"pants_1\":26,\"pants_2\":3,\"shoes_1\":14,\"shoes_2\":1,\"bags_1\":21,\"bags_2\":7,\"helmet_1\":58,\"helmet_2\":2}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":27,\"torso_2\":5,\"arms\":0,\"pants_1\":112,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":0,\"helmet_1\":-1,\"helmet_2\":0}'),
(674, 'org14', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(675, 'mechanik2', 0, 'recrue', 'Rekrut', 600, '{}', '{}'),
(676, 'mechanik2', 1, 'novice', 'Nowicjusz', 1100, '{}', '{}'),
(677, 'mechanik2', 4, 'novice', 'Zawodowiec', 1900, '{}', '{}'),
(678, 'mechanik2', 5, 'experimente', 'Specjalista', 2100, '{}', '{}'),
(679, 'mechanik2', 7, 'chief', 'Zast. Szefa', 2700, '{}', '{}'),
(680, 'mechanik2', 8, 'boss', 'Szef', 2000, '{}', '{}'),
(681, 'mechanik2', 3, 'novice', 'Fachowiec', 1700, '{}', '{}'),
(682, 'mechanik2', 2, 'novice', 'Majster', 1500, '{}', '{}'),
(683, 'mechanik2', 6, 'experimente', 'Koordynator', 2500, '{}', '{}'),
(684, 'offmechanik2', 0, 'recrue', 'Rekrut', 200, '{}', '{}'),
(685, 'offmechanik2', 1, 'novice', 'Nowicjusz', 300, '{}', '{}'),
(686, 'offmechanik2', 4, 'novice', 'Zawodowiec', 600, '{}', '{}'),
(687, 'offmechanik2', 5, 'experimente', 'Specjalista', 700, '{}', '{}'),
(688, 'offmechanik2', 7, 'chief', 'Zast. Szefa', 900, '{}', '{}'),
(689, 'offmechanik2', 8, 'boss', 'Szef', 1000, '{}', '{}'),
(690, 'offmechanik2', 3, 'novice', 'Fachowiec', 500, '{}', '{}'),
(691, 'offmechanik2', 2, 'novice', 'Majster', 400, '{}', '{}'),
(692, 'offmechanik2', 6, 'experimente', 'Koordynator', 800, '{}', '{}'),
(700, 'milkman', 0, 'employee', 'Rekrut', 600, '{}', '{}'),
(701, 'milkman', 1, 'employee', 'Nowicjusz', 700, '{}', '{}'),
(702, 'milkman', 2, 'employee', 'Pracownik', 800, '{}', '{}'),
(703, 'milkman', 3, 'employee', 'Fachowiec', 900, '{}', '{}'),
(704, 'milkman', 4, 'employee', 'Zawodowiec', 1000, '{}', '{}'),
(705, 'milkman', 5, 'employee', 'Specjalista', 1100, '{}', '{}'),
(706, 'milkman', 6, 'employee', 'Manager', 1300, '{}', '{}'),
(707, 'milkman', 7, 'employee', 'Zastępca', 1400, '{}', '{}'),
(708, 'milkman', 8, 'boss', 'Właściciel', 1500, '{}', '{}'),
(709, 'weazel', 0, 'employee', 'Stażysta', 600, '{}', '{}'),
(710, 'weazel', 1, 'employee', 'Nowicjusz', 700, '{}', '{}'),
(711, 'weazel', 2, 'employee', 'Młodszy pracownik', 800, '{}', '{}'),
(712, 'weazel', 3, 'employee', 'Pracownik', 900, '{}', '{}'),
(713, 'weazel', 4, 'employee', 'Fachowiec', 1000, '{}', '{}'),
(714, 'weazel', 5, 'employee', 'Zawodowiec', 1100, '{}', '{}'),
(715, 'weazel', 7, 'employee', 'Manager', 1300, '{}', '{}'),
(716, 'weazel', 8, 'employee', 'Zastępca', 1400, '{}', '{}'),
(717, 'weazel', 9, 'boss', 'Właściciel', 1500, '{}', '{}'),
(718, 'org40', 0, 'rekrut', 'Konfident dla Składek', 100, '{}', '{}'),
(719, 'org40', 1, 'zolnierz', 'Zaufany Konfident', 100, '{}', '{}'),
(720, 'org40', 2, 'kapitan', 'Kapitan aka Konfas', 100, '{}', '{}'),
(721, 'org40', 3, 'doradca', 'Doradca ds. Konfidentów', 100, '{}', '{}'),
(722, 'org40', 4, 'zastepca', 'Zastepca Konfidenta', 100, '{}', '{}'),
(723, 'org40', 5, 'szef', 'Naczelny Konfident', 100, '{}', '{}'),
(724, 'org48', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(725, 'org48', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(726, 'org48', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(727, 'org48', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(728, 'org48', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(729, 'org48', 5, 'szef', 'Szef', 100, '{}', '{}'),
(730, 'org49', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(731, 'org49', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(732, 'org49', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(733, 'org49', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(734, 'org49', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(735, 'org49', 5, 'szef', 'Szef', 100, '{}', '{}'),
(736, 'org50', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(737, 'org50', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(738, 'org50', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(739, 'org50', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(740, 'org50', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(741, 'org50', 5, 'szef', 'Szef', 100, '{}', '{}'),
(742, 'org51', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(743, 'org51', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(744, 'org51', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(745, 'org51', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(746, 'org51', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(747, 'org51', 5, 'szef', 'Szef', 100, '{}', '{}'),
(748, 'org52', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(749, 'org52', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(750, 'org52', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(751, 'org52', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(752, 'org52', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(753, 'org52', 5, 'szef', 'Szef', 100, '{}', '{}'),
(754, 'org53', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(755, 'org53', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(756, 'org53', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(757, 'org53', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(758, 'org53', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(759, 'org53', 5, 'szef', 'Szef', 100, '{}', '{}'),
(760, 'org54', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(761, 'org54', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(762, 'org54', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(763, 'org54', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(764, 'org54', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(765, 'org54', 5, 'szef', 'Szef', 100, '{}', '{}'),
(766, 'org55', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(767, 'org55', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(768, 'org55', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(769, 'org55', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(770, 'org55', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(771, 'org55', 5, 'szef', 'Szef', 100, '{}', '{}'),
(772, 'org56', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(773, 'org56', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(774, 'org56', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(775, 'org56', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(776, 'org56', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(777, 'org56', 5, 'szef', 'Szef', 100, '{}', '{}'),
(778, 'org57', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(779, 'org57', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(780, 'org57', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(781, 'org57', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(782, 'org57', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(783, 'org57', 5, 'szef', 'Szef', 100, '{}', '{}'),
(784, 'org58', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(785, 'org58', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(786, 'org58', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(787, 'org58', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(788, 'org58', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(789, 'org58', 5, 'szef', 'Szef', 100, '{}', '{}'),
(790, 'org59', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(791, 'org59', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(792, 'org59', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(793, 'org59', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(794, 'org59', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(795, 'org59', 5, 'szef', 'Szef', 100, '{}', '{}'),
(800, 'swat', 0, 'swat', 'Member', 100, '{}', '{}'),
(801, 'org60', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(802, 'org60', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(803, 'org60', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(804, 'org60', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(805, 'org60', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(806, 'org60', 5, 'szef', 'Szef', 100, '{}', '{}'),
(807, 'org61', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(808, 'org61', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(809, 'org61', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(810, 'org61', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(811, 'org61', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(812, 'org61', 5, 'szef', 'Szef', 100, '{}', '{}'),
(813, 'org62', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(814, 'org62', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(815, 'org62', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(816, 'org62', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(817, 'org62', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(818, 'org62', 5, 'szef', 'Szef', 100, '{}', '{}'),
(819, 'org63', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(820, 'org63', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(821, 'org63', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(822, 'org63', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(823, 'org63', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(824, 'org63', 5, 'szef', 'Szef', 100, '{}', '{}'),
(825, 'org64', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(826, 'org64', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(827, 'org64', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(828, 'org64', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(829, 'org64', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(830, 'org64', 5, 'szef', 'Szef', 100, '{}', '{}'),
(831, 'org65', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(832, 'org65', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(833, 'org65', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(834, 'org65', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(835, 'org65', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(836, 'org65', 5, 'szef', 'Szef', 100, '{}', '{}'),
(837, 'org66', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(838, 'org66', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(839, 'org66', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(840, 'org66', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(841, 'org66', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(842, 'org66', 5, 'szef', 'Szef', 100, '{}', '{}'),
(843, 'org67', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(844, 'org67', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(845, 'org67', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(846, 'org67', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(847, 'org67', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(848, 'org67', 5, 'szef', 'Szef', 100, '{}', '{}'),
(849, 'org68', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(850, 'org68', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(851, 'org68', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(852, 'org68', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(853, 'org68', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(854, 'org68', 5, 'szef', 'Szef', 100, '{}', '{}'),
(855, 'org69', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(856, 'org69', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(857, 'org69', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(858, 'org69', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(859, 'org69', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(860, 'org69', 5, 'szef', 'Szef', 100, '{}', '{}'),
(861, 'org70', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(862, 'org70', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(863, 'org70', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(864, 'org70', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(865, 'org70', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(866, 'org70', 5, 'szef', 'Szef', 100, '{}', '{}'),
(890, 'pullpet', 0, 'employee', 'Rekrut', 600, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(891, 'pullpet', 1, 'employee', 'Nowicjusz', 700, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(892, 'pullpet', 2, 'employee', 'Zawodowiec', 800, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(893, 'pullpet', 3, 'employee', 'Manager', 1200, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(894, 'pullpet', 4, 'employee', 'Szef', 1500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(900, 'dtu', 4, 'boss', 'Deputy Director of D.T.U.', 1000, '{}', '{}'),
(901, 'dtu', 5, 'boss', 'Director of D.T.U.', 1000, '{}', '{}'),
(911, 'cardealer', 4, 'zastepca', 'Zastępca Właściciela', 1200, '{}', '{}'),
(912, 'cardealer', 5, 'wlasciciel', 'Właściciel', 1500, '{}', '{}'),
(913, 'cardealer', 2, 'konsultant', 'Konsultant', 1000, '{}', '{}'),
(991, 'doj', 4, 'recruit', 'Prokurator', 2500, '{}', '{}'),
(992, 'doj', 5, 'boss', 'Adwokat Generalny', 3000, '{}', '{}'),
(993, 'doj', 6, 'boss', 'Prokurator Generalny', 3000, '{}', '{}'),
(994, 'doj', 7, 'boss', 'Sędzia', 5000, '{}', '{}'),
(1000, 'offdoj', 0, 'recruit', 'Aplikant', 1200, '{}', '{}'),
(1001, 'offdoj', 1, 'recruit', 'Adwokat', 1500, '{}', '{}'),
(1002, 'offdoj', 2, 'recruit', 'Adwokat Młodszy', 2000, '{}', '{}'),
(1003, 'offdoj', 3, 'recruit', 'Adwokat Starszy', 2500, '{}', '{}'),
(1004, 'offdoj', 4, 'recruit', 'Prokurator', 2500, '{}', '{}'),
(1005, 'offdoj', 5, 'boss', 'Adwokat Generalny', 3000, '{}', '{}'),
(1006, 'offdoj', 6, 'boss', 'Prokurator Generalny', 3000, '{}', '{}'),
(1007, 'offdoj', 7, 'boss', 'Sędzia', 5000, '{}', '{}'),
(1008, 'pizzeria', 0, 'rekrut', 'Rekrut', 200, '{}', '{}'),
(1009, 'pizzeria', 1, 'mlodszypracownik', 'Młodszy Pracownik', 300, '{}', '{}'),
(1010, 'pizzeria', 2, 'kawiarnia2', 'Pracownik', 400, '{}', '{}'),
(1011, 'pizzeria', 3, 'kawiarnia3', 'Fachowiec', 500, '{}', '{}'),
(1012, 'pizzeria', 4, 'zawodowieckaw', 'Zawodowiec', 600, '{}', '{}'),
(1013, 'pizzeria', 5, 'specjalistakaw', 'Specjalista', 700, '{}', '{}'),
(1015, 'pizzeria', 6, 'kawiarnia4', 'Manager', 800, '{}', '{}'),
(1016, 'pizzeria', 7, 'underboss', 'Zastępca', 900, '{}', '{}'),
(1017, 'pizzeria', 8, 'boss', 'Właściciel', 1000, '{}', '{}'),
(1020, 'gheneraugarage', 0, 'recrue', 'Rekrut', 800, '{}', '{}'),
(1021, 'gheneraugarage', 1, 'novice', 'Nowicjusz', 1100, '{}', '{}'),
(1022, 'gheneraugarage', 2, 'novice', 'Majster', 1500, '{}', '{}'),
(1023, 'gheneraugarage', 3, 'novice', 'Fachowiec', 1700, '{}', '{}'),
(1024, 'gheneraugarage', 4, 'novice', 'Zawodowiec', 1900, '{}', '{}'),
(1025, 'gheneraugarage', 5, 'experimente', 'Specjalista', 2100, '{}', '{}'),
(1026, 'gheneraugarage', 6, 'experimente', 'Koordynator', 2500, '{}', '{}'),
(1027, 'gheneraugarage', 7, 'chief', 'Zastępca Szefa', 2700, '{}', '{}'),
(1028, 'gheneraugarage', 8, 'boss', 'Szef', 3000, '{}', '{}'),
(1029, 'offgheneraugarage', 0, 'recrue', 'Rekrut', 200, '{}', '{}'),
(1030, 'offgheneraugarage', 1, 'novice', 'Nowicjusz', 300, '{}', '{}'),
(1031, 'offgheneraugarage', 2, 'novice', 'Majster', 400, '{}', '{}'),
(1032, 'offgheneraugarage', 3, 'novice', 'Fachowiec', 500, '{}', '{}'),
(1033, 'offgheneraugarage', 4, 'novice', 'Zawodowiec', 600, '{}', '{}'),
(1034, 'offgheneraugarage', 5, 'experimente', 'Specjalista', 700, '{}', '{}'),
(1035, 'offgheneraugarage', 6, 'experimente', 'Koordynator', 800, '{]', '{}'),
(1036, 'offgheneraugarage', 7, 'chief', 'Zastępca Szefa', 900, '{}', '{}'),
(1037, 'offgheneraugarage', 8, 'boss', 'Szef', 1000, '{}', '{}'),
(1040, 'offcardealer', 0, 'sprzedawca', 'Sprzedawca', 700, '{}', '{}'),
(1041, 'offcardealer', 1, 'doradca', 'Doradca', 900, '{}', '{}'),
(1042, 'offcardealer', 2, 'konsultant', 'Konsultant', 1000, '{}', '{}'),
(1043, 'offcardealer', 3, 'manager', 'Manager', 1100, '{}', '{}'),
(1044, 'offcardealer', 4, 'zastepca', 'Zastępca Właściciela', 1200, '{}', '{}'),
(1045, 'offcardealer', 5, 'wlasciciel', 'Właściciel', 1500, '{}', '{}'),
(1100, 'org80', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1101, 'org80', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1102, 'org80', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1103, 'org80', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1104, 'org80', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1105, 'org80', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1106, 'org81', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1107, 'org81', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1108, 'org81', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1109, 'org81', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1110, 'org81', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1111, 'org81', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1112, 'org82', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1113, 'org82', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1114, 'org82', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1115, 'org82', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1116, 'org82', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1117, 'org82', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1118, 'org83', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1119, 'org83', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1120, 'org83', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1121, 'org83', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1122, 'org83', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1123, 'org83', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1124, 'org84', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1125, 'org84', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1126, 'org84', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1127, 'org84', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1128, 'org84', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1129, 'org84', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1130, 'org85', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1131, 'org85', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1132, 'org85', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1133, 'org85', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1134, 'org85', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1135, 'org85', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1136, 'org86', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1137, 'org86', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1138, 'org86', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1139, 'org86', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1140, 'org86', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1141, 'org86', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1142, 'org87', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1143, 'org87', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1144, 'org87', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1145, 'org87', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1146, 'org87', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1147, 'org87', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1148, 'org88', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1149, 'org88', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1150, 'org88', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1151, 'org88', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1152, 'org88', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1153, 'org88', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1154, 'org89', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1155, 'org89', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1156, 'org89', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1157, 'org89', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1158, 'org89', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1159, 'org89', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1160, 'org90', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1161, 'org90', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1162, 'org90', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1163, 'org90', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1164, 'org90', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1165, 'org90', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1166, 'org91', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1167, 'org91', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1168, 'org91', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1169, 'org91', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1170, 'org91', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1171, 'org91', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1172, 'org92', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1173, 'org92', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1174, 'org92', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1175, 'org92', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1176, 'org92', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1177, 'org92', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1178, 'org93', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1179, 'org93', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1180, 'org93', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1181, 'org93', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1182, 'org93', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1183, 'org93', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1184, 'org94', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1185, 'org94', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1186, 'org94', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1187, 'org94', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1188, 'org94', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1189, 'org94', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1190, 'org95', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1191, 'org95', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1192, 'org95', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1193, 'org95', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1194, 'org95', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1195, 'org95', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1196, 'org96', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1197, 'org96', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1198, 'org96', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1199, 'org96', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1200, 'org96', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1201, 'org96', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1202, 'org97', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1203, 'org97', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1204, 'org97', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1205, 'org97', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1206, 'org97', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1207, 'org97', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1208, 'org98', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1209, 'org98', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1210, 'org98', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1211, 'org98', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1212, 'org98', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1213, 'org98', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1214, 'org99', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1215, 'org99', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1216, 'org99', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1217, 'org99', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1218, 'org99', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1219, 'org99', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1220, 'org100', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1221, 'org100', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1222, 'org100', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1223, 'org100', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1224, 'org100', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1225, 'org100', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1226, 'org101', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1227, 'org101', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1228, 'org101', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1229, 'org101', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1230, 'org101', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1231, 'org101', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1232, 'org102', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1233, 'org102', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1234, 'org102', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1235, 'org102', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1236, 'org102', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1237, 'org102', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1238, 'org103', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1239, 'org103', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1240, 'org103', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1241, 'org103', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1242, 'org103', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1243, 'org103', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1244, 'org104', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1245, 'org104', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1246, 'org104', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1247, 'org104', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1248, 'org104', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1249, 'org104', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1250, 'org105', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1251, 'org105', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1252, 'org105', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1253, 'org105', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1254, 'org105', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1255, 'org105', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1256, 'org106', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1257, 'org106', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1258, 'org106', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1259, 'org106', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1260, 'org106', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1261, 'org106', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1262, 'org107', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1263, 'org107', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1264, 'org107', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1265, 'org107', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1266, 'org107', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1267, 'org107', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1268, 'org108', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1269, 'org108', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1270, 'org108', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1271, 'org108', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1272, 'org108', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1273, 'org108', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1274, 'org109', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1275, 'org109', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1276, 'org109', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1277, 'org109', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1278, 'org109', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1279, 'org109', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1280, 'org110', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1281, 'org110', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1282, 'org110', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1283, 'org110', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1284, 'org110', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1285, 'org110', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1286, 'org111', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1287, 'org111', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1288, 'org111', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1289, 'org111', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1290, 'org111', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1291, 'org111', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1292, 'org112', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1293, 'org112', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1294, 'org112', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1295, 'org112', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1296, 'org112', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1297, 'org112', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1298, 'org113', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1299, 'org113', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1300, 'org113', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1301, 'org113', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1302, 'org113', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1303, 'org113', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1304, 'org114', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1305, 'org114', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1306, 'org114', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1307, 'org114', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1308, 'org114', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1309, 'org114', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1310, 'org115', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1311, 'org115', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1312, 'org115', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1313, 'org115', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1314, 'org115', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1315, 'org115', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1316, 'org116', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1317, 'org116', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1318, 'org116', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1319, 'org116', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1320, 'org116', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1321, 'org116', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1322, 'org117', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1323, 'org117', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1324, 'org117', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1325, 'org117', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1326, 'org117', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1327, 'org117', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1328, 'org118', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1329, 'org118', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1330, 'org118', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1331, 'org118', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1332, 'org118', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1333, 'org118', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1334, 'org119', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1335, 'org119', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1336, 'org119', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1337, 'org119', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1338, 'org119', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1339, 'org119', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1340, 'org120', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(1341, 'org120', 1, 'zolnierz', 'Zolnierz', 100, '{}', '{}'),
(1342, 'org120', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(1343, 'org120', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(1344, 'org120', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(1345, 'org120', 5, 'szef', 'Szef', 100, '{}', '{}'),
(1401, 'weazel', 6, 'employee', 'Specjalista', 1400, '{}', '{}'),
(1500, 'krawiec', 0, 'krawiec', 'Stażysta', 500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1501, 'krawiec', 1, 'krawiec', 'Młodszy pracownik', 600, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1502, 'krawiec', 2, 'krawiec', 'Pracownik', 650, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1503, 'krawiec', 3, 'krawiec', 'Fachowiec', 700, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1504, 'krawiec', 4, 'krawiec', 'Zawodowiec', 750, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1505, 'krawiec', 5, 'krawiec', 'Specjalista', 800, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1507, 'krawiec', 6, 'krawiec', 'Manager', 1100, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1508, 'krawiec', 7, 'krawiec', 'Zastępca', 1300, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1509, 'krawiec', 8, 'krawiec', 'Właściciel', 1500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(1900, 'wiesbuda', 0, 'wiesbuda', 'Pracownik', 500, '{}', '{}'),
(1901, 'wiesbuda', 1, 'wiesbuda', 'Szef', 800, '{}', '{}'),
(7003, 'org16', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7004, 'org16', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7005, 'org16', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7006, 'org16', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7007, 'org16', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7008, 'org16', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7009, 'org17', 0, 'rekrut', 'Robotnik', 100, '{}', '{}'),
(7010, 'org17', 1, 'zolnierz', 'Szeregowy', 100, '{}', '{}'),
(7011, 'org17', 2, 'kapitan', 'Zolnierz', 100, '{}', '{}'),
(7012, 'org17', 3, 'doradca', 'Przemytnik', 100, '{}', '{}'),
(7013, 'org17', 4, 'zastepca', 'Mechanik', 100, '{}', '{}'),
(7014, 'org17', 5, 'szef', 'Kontroler jakosci', 100, '{}', '{}'),
(7015, 'org18', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7016, 'org18', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7017, 'org18', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7018, 'org18', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7019, 'org18', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7020, 'org18', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7021, 'org19', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7022, 'org19', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7023, 'org19', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7024, 'org19', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7025, 'org19', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7026, 'org19', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7027, 'org20', 0, 'rekrut', 'Soldato', 100, '{}', '{}'),
(7028, 'org20', 1, 'zolnierz', 'Halcones', 100, '{}', '{}'),
(7029, 'org20', 2, 'kapitan', 'Socarios', 100, '{}', '{}'),
(7030, 'org20', 3, 'doradca', 'Associate', 100, '{}', '{}'),
(7031, 'org20', 4, 'zastepca', 'Tenientes', 100, '{}', '{}'),
(7032, 'org20', 5, 'szef', 'Capo', 100, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(7033, 'org21', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7034, 'org21', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7035, 'org21', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7036, 'org21', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7037, 'org21', 4, 'zastepca', 'Zastepca', 100, '{}', '{}'),
(7038, 'org21', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7046, 'org22', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7047, 'org22', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7048, 'org22', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7049, 'org22', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7050, 'org22', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7051, 'org22', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7052, 'org23', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7053, 'org23', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7054, 'org23', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7055, 'org23', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7056, 'org23', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7057, 'org23', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7058, 'org24', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7059, 'org24', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7060, 'org24', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7061, 'org24', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7062, 'org24', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7063, 'org24', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7152, 'org25', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7153, 'org25', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7154, 'org25', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7155, 'org25', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7156, 'org25', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7157, 'org25', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7258, 'org26', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7259, 'org26', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7260, 'org26', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7261, 'org26', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7262, 'org26', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7263, 'org26', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7358, 'org27', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7359, 'org27', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7360, 'org27', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7361, 'org27', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7362, 'org27', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7363, 'org27', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7458, 'org28', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7459, 'org28', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7460, 'org28', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7461, 'org28', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7462, 'org28', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7463, 'org28', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7558, 'org29', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7559, 'org29', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7560, 'org29', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7561, 'org29', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7562, 'org29', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7563, 'org29', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7658, 'org30', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7659, 'org30', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7660, 'org30', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7661, 'org30', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7662, 'org30', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7663, 'org30', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7758, 'org31', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7759, 'org31', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7760, 'org31', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7761, 'org31', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7762, 'org31', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7763, 'org31', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7858, 'org32', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7859, 'org32', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7860, 'org32', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7861, 'org32', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7862, 'org32', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7863, 'org32', 5, 'szef', 'Szef', 100, '{}', '{}'),
(7958, 'org33', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(7959, 'org33', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(7960, 'org33', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(7961, 'org33', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(7962, 'org33', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(7963, 'org33', 5, 'szef', 'Szef', 100, '{}', '{}'),
(8058, 'org34', 0, 'rekrut', 'Rekrut', 100, '{}', '{}'),
(8059, 'org34', 1, 'zolnierz', 'Żołnierz', 100, '{}', '{}'),
(8060, 'org34', 2, 'kapitan', 'Kapitan', 100, '{}', '{}'),
(8061, 'org34', 3, 'doradca', 'Doradca', 100, '{}', '{}'),
(8062, 'org34', 4, 'zastepca', 'Zastępca', 100, '{}', '{}'),
(8063, 'org34', 5, 'szef', 'Szef', 100, '{}', '{}'),
(8181, 'farming', 0, 'employee', 'Rekrut', 600, '{}', '{}'),
(8182, 'farming', 1, 'employee', 'Nowicjusz', 700, '{}', '{}'),
(8183, 'farming', 2, 'employee', 'Pracownik', 800, '{}', '{}'),
(8184, 'farming', 3, 'employee', 'Fachowiec', 900, '{}', '{}'),
(8185, 'farming', 4, 'employee', 'Zawodowiec', 1000, '{}', '{}'),
(8186, 'farming', 5, 'employee', 'Specjalista', 1100, '{}', '{}'),
(8205, 'garbage', 0, 'employee', 'Rekrut', 600, '{}', '{}'),
(8206, 'garbage', 1, 'employee', 'Nowicjusz', 700, '{}', '{}'),
(8207, 'garbage', 2, 'employee', 'Zawodowiec', 800, '{}', '{}'),
(8208, 'garbage', 3, 'employee', 'Manager', 1200, '{}', '{}'),
(8209, 'garbage', 4, 'employee', 'Zastępca szefa', 1300, '{}', '{}'),
(8210, 'garbage', 5, 'boss', 'Szef', 1500, '{}', '{}'),
(8230, 'miner', 0, 'employee', 'Rekrut', 600, '{}', '{}'),
(8231, 'miner', 1, 'employee', 'Nowicjusz', 700, '{}', '{}'),
(8232, 'miner', 2, 'employee', 'Pracownik', 800, '{}', '{}'),
(8233, 'miner', 3, 'employee', 'Fachowiec', 900, '{}', '{}'),
(8234, 'miner', 4, 'employee', 'Zawodowiec', 1000, '{}', '{}'),
(8235, 'miner', 5, 'employee', 'Specjalista', 1100, '{}', '{}'),
(8236, 'galaxy', 4, 'recruit', 'Ochrona', 1000, '{}', '{}'),
(8237, 'galaxy', 6, 'recruit', 'Szef Ochrony', 1300, '{}', '{}'),
(8238, 'galaxy', 5, 'recruit', 'Tancerka', 1000, '{}', '{}'),
(8239, 'galaxy', 7, 'recruit', 'Barman', 1000, '{}', '{}'),
(8240, 'galaxy', 8, 'recruit', 'Menadżer', 1500, '{}', '{}'),
(8241, 'galaxy', 9, 'recruit', 'Właściciel', 2000, '{}', '{}'),
(8248, 'farming', 6, 'employee', 'Manager', 1300, '{}', '{}'),
(8249, 'farming', 7, 'boss', 'Zastępca', 1400, '{}', '{}'),
(8250, 'farming', 8, 'boss', 'Właściciel', 1500, '{}', '{}'),
(8254, 'miner', 6, 'employee', 'Manager', 1300, '{}', '{}'),
(8255, 'miner', 7, 'employee', 'Zastępca', 1400, '{}', '{}'),
(8256, 'miner', 8, 'employee', 'Właściciel', 1500, '{}', '{}'),
(8295, 'rafiner', 0, 'rafiner', 'Okres Próbny', 500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8296, 'rafiner', 1, 'rafiner', 'Rekrut', 600, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8297, 'rafiner', 2, 'rafiner', 'Pracownik', 650, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8298, 'rafiner', 3, 'rafiner', 'Stażysta', 700, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8299, 'rafiner', 4, 'rafiner', 'Zawodowiec', 750, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8300, 'rafiner', 5, 'rafiner', 'Specjalista', 800, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8301, 'rafiner', 6, 'rafiner', 'Koordynator', 900, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8302, 'rafiner', 7, 'rafiner', 'Manager', 1100, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8303, 'rafiner', 8, 'rafiner', 'Zastępca', 1300, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(8304, 'rafiner', 9, 'rafiner', 'Szef', 1500, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":238,\"torso_2\":0,\"arms\":2,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":12,\"shoes_2\":10,\"helmet_1\":7,\"helmet_2\":0}', '{\"tshirt_1\":14,\"tshirt_2\":0,\"torso_1\":78,\"torso_2\":5,\"arms\":21,\"pants_1\":68,\"pants_2\":0,\"shoes_1\":3,\"shoes_2\":1,\"helmet_1\":-1,\"helmet_2\":0}'),
(70322, 'org17', 6, 'cayo', 'Zastępca Szefa', 800, '', ''),
(70323, 'org17', 7, 'cayoo', 'Szef', 1000, '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kits`
--

CREATE TABLE `kits` (
  `id` int(11) NOT NULL,
  `org` varchar(50) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `items` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('air', 'Licencja pilota'),
('boat', 'Patent sternika'),
('coke_transform', 'Stary klucz'),
('dmv', 'Pozwolenie na praktyke'),
('drive', 'Prawo jazdy kat.B'),
('drive_bike', 'Prawo jazdy kat.A'),
('drive_truck', 'Prawo jazdy kat.C'),
('dtu', 'DTU'),
('ems_insurance', 'NNW'),
('exctasy_transform', 'Stary klucz'),
('hc', 'High Command'),
('heli', 'HELI'),
('hp', 'Highway Patrol'),
('nurek', 'NUREK'),
('oc_insurance', 'Ubezpieczenie OC'),
('opium_transform', 'Stary klucz'),
('sams_aid', 'AID'),
('sams_heli', 'Licencja Pilota SAMS'),
('sert', 'SERT'),
('seu', 'SEU'),
('sheriff', 'BCSO'),
('usms', 'USMS'),
('weapon', 'Licencja na bron');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_judgments_suggestion`
--

CREATE TABLE `lspd_mdc_judgments_suggestion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `length` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `showName` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `lspd_mdc_judgments_suggestion`
--

INSERT INTO `lspd_mdc_judgments_suggestion` (`id`, `name`, `description`, `length`, `fee`, `categoryId`, `showName`) VALUES
(1, 'Jazda bez prawa jazdy', '', 0, 7500, 1, 1),
(2, 'Jazda bez ważnego ubezpieczenia OC', '', 0, 10000, 1, 1),
(3, 'Przekroczenie prędkości w mieście', '', 0, 5000, 1, 1),
(4, 'Stwarzanie zagrożenia w ruchu lądowym', '', 0, 12000, 1, 1),
(6, 'Jazda niepoprawnym pasem ruchu', '', 0, 7000, 1, 1),
(7, 'Przejazd na czerwonym świetle', '', 0, 2500, 1, 1),
(8, 'Przekroczenie prędkości poza miastem', '', 0, 10000, 1, 1),
(9, 'Zły stan techniczny pojazdu', '', 0, 12000, 1, 1),
(10, 'Spowodowanie wypadku', '', 0, 10000, 1, 1),
(11, 'Niewłaściwe parkowanie', '', 0, 5000, 1, 1),
(12, 'Obrazy FP', '', 5, 13000, 2, 1),
(13, 'Fałszywe zgłoszenie', '', 5, 10000, 2, 1),
(14, 'Składanie fałszywych zeznań', '', 5, 15000, 2, 1),
(16, 'Kradzież bądź próba kradzieży pojazdu', '', 5, 20000, 2, 1),
(17, 'Kradzież bądź próba kradzieży radiowozu', '', 10, 25000, 2, 1),
(18, 'Niewykonywanie poleceń FP', '', 10, 25000, 2, 1),
(19, 'Ucieczka przed policja', '', 10, 2000, 2, 1),
(20, 'Chodzenie zamaskowanym po mieście', '', 0, 10000, 2, 1),
(21, 'Współudział w przestępstwie', '', 10, 25000, 2, 1),
(24, 'Wtargnięcie', '', 5, 15000, 2, 1),
(25, 'Udział w bójce', '', 5, 15000, 2, 1),
(26, 'Nieumyślne spowodowanie uszczerbku na zdrowiu', '', 5, 15000, 2, 1),
(28, 'Mobilizacja SASP', '', 15, 60000, 2, 1),
(29, 'Porwanie bądź próba porwania', '', 5, 25000, 2, 1),
(30, 'Porwanie bądź próba porwania FP', '', 15, 30000, 2, 1),
(31, 'Napad na kasetke', '', 10, 20000, 3, 1),
(32, 'Napad na Bank', '', 40, 90000, 3, 1),
(33, 'Napad na Kasyno/Jubiler/Muzeum', '', 35, 160000, 3, 1),
(35, 'Napad na Humane Labs/Zbrojownia/Yacht', '', 50, 350000, 3, 1),
(37, 'Usiłowanie zabójstwa', '', 15, 40000, 3, 1),
(38, 'Usiłowanie zabójstwa FP', '', 20, 65000, 3, 1),
(39, 'Napad na funkcjonariusza SASP', '', 10, 25000, 3, 1),
(40, 'Handel nielegalną bronią', '', 25, 100000, 3, 1),
(41, 'Groźby karalne', '', 5, 20000, 3, 1),
(42, 'Próba odbicia obywatela z rąk SASP', '', 25, 65000, 3, 1),
(43, 'Odbicie obywatela z rąk SASP', '', 35, 85000, 3, 1),
(44, 'Członek zorganizowanej grupy przestępczej', '', 40, 150000, 3, 1),
(45, 'Przywódca zorg. grupy przestępczej', 'Możliwe dożywocie', 100, 300000, 3, 1),
(46, 'Terroryzm', '', 250, 500000, 3, 1),
(47, 'Morderstwo', 'DOŻYWOCIE!!!', 0, 1000000, 3, 1),
(48, 'Posiadanie broni bez zezwolenia', '', 15, 50000, 4, 1),
(49, 'Posiadanie zarejestrowanej broni krótkiej', '', 25, 60000, 4, 1),
(50, 'Posiadanie nielegalnej broni długiej', '', 80, 200000, 4, 1),
(51, 'Posiadanie zarejestrowanej broni długiej', '', 80, 300000, 4, 1),
(52, 'Posiadanie narkotyków twardych', '', 25, 60000, 4, 1),
(53, 'Posiadanie narkotyków miękkich', '', 15, 20000, 4, 1),
(54, 'Handel narkotykami twardymi', '', 35, 85000, 4, 1),
(55, 'Handel narkotykami miękkimi', '', 20, 35000, 4, 1),
(56, 'Groźby przy użyciu broni', '', 15, 30000, 4, 1),
(57, 'Modyfikacja broni bądź posiadanie dodatków do broni', '', 15, 40000, 4, 1),
(58, 'Posiadanie kontrabandy lub broni białej bez zezwolenia', '', 10, 25000, 4, 1),
(59, 'Napad na Magazyn SASP', '', 55, 360000, 3, 1),
(60, 'Napad na Pacyfik', ' ', 40, 200000, 3, 1),
(61, 'Napad na Baze Wojskową', ' ', 60, 420000, 3, 1),
(62, 'Ucieczka z więzienia', '', 50, 150000, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_judgments_suggestion_category`
--

CREATE TABLE `lspd_mdc_judgments_suggestion_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `color` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `lspd_mdc_judgments_suggestion_category`
--

INSERT INTO `lspd_mdc_judgments_suggestion_category` (`id`, `name`, `color`) VALUES
(1, 'Wykroczenia drogowe', '1'),
(2, 'Przestępstwa Lekkie', '1'),
(3, 'Przestępstwa Ciężkie', '1'),
(4, 'Przestępstwa Związane Z Bronią lub Narkotykami', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_tag_suggestion`
--

CREATE TABLE `lspd_mdc_tag_suggestion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `lspd_mdc_tag_suggestion`
--

INSERT INTO `lspd_mdc_tag_suggestion` (`id`, `name`, `description`, `type`) VALUES
(1, 'Poszukiwany', 'Obywatel jest aktualnie poszukiwany', 'CITIZEN'),
(2, 'Niebezpieczny', 'Obywatel jest niebezpieczny', 'CITIZEN'),
(3, 'Handlarz narokytków', 'Obywatel jest handlarzem narkotyków', 'CITIZEN'),
(4, 'Handlarz bronią', 'Obywatel jest handlarzem bronią', 'CITIZEN'),
(5, 'Grupa przestępcza', 'Obywatel jest powiązany z grupą przestępczą', 'CITIZEN'),
(6, 'Poszukiwany', 'Pojazd jest aktualnie poszukiwany', 'VEHICLE');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_user_notes`
--

CREATE TABLE `lspd_mdc_user_notes` (
  `id` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8_bin NOT NULL,
  `text` varchar(500) COLLATE utf8_bin NOT NULL,
  `addedBy` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_vehicle_notes`
--

CREATE TABLE `lspd_mdc_vehicle_notes` (
  `id` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_bin NOT NULL,
  `addedBy` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_user_judgments`
--

CREATE TABLE `lspd_user_judgments` (
  `id` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8_bin NOT NULL,
  `crimes` varchar(1000) COLLATE utf8_bin NOT NULL,
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `addedBy` varchar(128) COLLATE utf8_bin NOT NULL,
  `length` int(11) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `digit` int(11) DEFAULT 1,
  `co_owner1` varchar(55) DEFAULT NULL,
  `co_digit1` int(11) DEFAULT NULL,
  `co_owner2` varchar(55) DEFAULT NULL,
  `co_digit2` int(11) DEFAULT NULL,
  `shared` varchar(60) DEFAULT NULL,
  `arleady_owned` int(11) NOT NULL DEFAULT 0,
  `co_owner3` varchar(55) DEFAULT NULL,
  `co_digit3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) COLLATE utf8_bin NOT NULL,
  `digit` int(11) DEFAULT 1,
  `co_owner` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `co_digit` int(11) DEFAULT 1,
  `co_owner2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `co_digit2` int(11) DEFAULT 1,
  `co_owner3` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `co_digit3` int(11) DEFAULT 1,
  `vehicle` longtext COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'stored',
  `plate` varchar(12) COLLATE utf8_bin NOT NULL,
  `type` varchar(20) COLLATE utf8_bin DEFAULT 'car',
  `job` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `destroyed` int(11) DEFAULT NULL,
  `vehicleid` int(11) DEFAULT NULL,
  `firstmodel` varchar(16) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_accounts`
--

CREATE TABLE `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_alertjobs`
--

CREATE TABLE `phone_alertjobs` (
  `id` int(11) NOT NULL,
  `job` varchar(255) NOT NULL,
  `alerts` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_chatrooms`
--

CREATE TABLE `phone_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(50) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT NULL,
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_chatroom_messages`
--

CREATE TABLE `phone_chatroom_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_chats`
--

CREATE TABLE `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_crypto`
--

CREATE TABLE `phone_crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'btc',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_news`
--

CREATE TABLE `phone_news` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_notifies`
--

CREATE TABLE `phone_notifies` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_numbers`
--

CREATE TABLE `phone_numbers` (
  `identifier` varchar(200) NOT NULL DEFAULT '',
  `data` text DEFAULT NULL,
  `defaultNumber` varchar(50) NOT NULL,
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_reminders`
--

CREATE TABLE `phone_reminders` (
  `id` int(11) DEFAULT NULL,
  `owner` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `ownernumber` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `planes`
--

CREATE TABLE `planes` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `planes`
--

INSERT INTO `planes` (`name`, `model`, `price`, `category`) VALUES
('Luxor Deluxe', 'luxor2', 100000000, 'planes'),
('Mammatus', 'mammatus', 30000000, 'planes'),
('Honda HA-420 HondaJet', 'MyZoneSamolot', 150000000, 'planes'),
('Super Volito', 'supervolito2', 65000000, 'heli'),
('Velum', 'velum2', 40000000, 'planes'),
('Vestra', 'vestra', 40000000, 'planes'),
('Volatus', 'volatus', 80000000, 'heli');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `planes_categories`
--

CREATE TABLE `planes_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `planes_categories`
--

INSERT INTO `planes_categories` (`name`, `label`) VALUES
('heli', 'Helikoptery'),
('planes', 'Samoloty');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  `isBlocked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_gallery`
--

CREATE TABLE `player_gallery` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_notes`
--

CREATE TABLE `player_notes` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `is_open` int(11) NOT NULL DEFAULT 0,
  `garage` varchar(255) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `price` int(11) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `is_open`, `garage`, `room_menu`, `doors`, `price`, `is_available`) VALUES
(1, 'Urzednicza1', 'Urzędnicza Pokój 1', '{\"y\":-218.63,\"z\":53.27,\"x\":312.93}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-218.65,\"z\":53.27,\"x\":312.92}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(2, 'Urzednicza2', 'Urzędnicza Pokój 2', '{\"y\":-217.95,\"z\":53.27,\"x\":310.86}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-218.08,\"z\":53.27,\"x\":310.84}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(3, 'Urzednicza3', 'Urzędnicza Pokój 3', '{\"y\":-216.55,\"z\":53.27,\"x\":307.32}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-216.65,\"z\":53.27,\"x\":307.3}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(4, 'Urzednicza4', 'Urzędnicza Pokój 4', '{\"y\":-213.35,\"z\":53.27,\"x\":307.65}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-213.4,\"z\":53.27,\"x\":307.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(5, 'Urzednicza5a', 'Urzędnicza Pokój 5a', '{\"y\":-208.08,\"z\":53.27,\"x\":309.65}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-208.12,\"z\":53.27,\"x\":309.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(6, 'Urzednicza5b', 'Urzędnicza Pokój 5b', '{\"y\":-203.48,\"z\":53.27,\"x\":311.57}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-203.47,\"z\":53.27,\"x\":311.5}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(7, 'Urzednicza6', 'Urzędnicza Pokój 6', '{\"y\":-198.18,\"z\":53.27,\"x\":313.59}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.21,\"z\":53.27,\"x\":313.52}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(8, 'Urzednicza7', 'Urzędnicza Pokój 7', '{\"y\":-194.81,\"z\":53.28,\"x\":315.78}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-194.81,\"z\":53.28,\"x\":315.74}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(9, 'Urzednicza8', 'Urzędnicza Pokój 8', '{\"y\":-196.45,\"z\":53.28,\"x\":319.35}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-196.42,\"z\":53.28,\"x\":319.31}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(10, 'Urzednicza11', 'Urzędnicza Pokój 11', '{\"y\":-218.57,\"z\":57.07,\"x\":312.94}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-218.57,\"z\":57.07,\"x\":312.94}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(11, 'Urzednicza12', 'Urzędnicza Pokój 12', '{\"y\":-217.9,\"z\":57.07,\"x\":310.88}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-217.9,\"z\":57.07,\"x\":310.88}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(12, 'Urzednicza13', 'Urzędnicza Pokój 13', '{\"y\":-216.62,\"z\":57.07,\"x\":307.32}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-216.62,\"z\":57.07,\"x\":307.32}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(13, 'Urzednicza14', 'Urzędnicza Pokój 14', '{\"y\":-213.27,\"z\":57.07,\"x\":307.63}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-213.27,\"z\":57.07,\"x\":307.63}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(14, 'Urzednicza15', 'Urzędnicza Pokój 15', '{\"y\":-208.08,\"z\":57.07,\"x\":309.63}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-208.08,\"z\":57.07,\"x\":309.63}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(15, 'Urzednicza16', 'Urzędnicza Pokój 16', '{\"y\":-203.42,\"z\":57.07,\"x\":311.39}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-203.42,\"z\":57.07,\"x\":311.39}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(16, 'Urzednicza17', 'Urzędnicza Pokój 17', '{\"y\":-198.19,\"z\":57.07,\"x\":313.58}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.19,\"z\":58.02,\"x\":313.58}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(17, 'Urzednicza18', 'Urzędnicza Pokój 18', '{\"y\":-195.02,\"z\":57.07,\"x\":315.71}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-195.02,\"z\":58.02,\"x\":315.71}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(18, 'Urzednicza19', 'Urzędnicza Pokój 19', '{\"y\":-196.28,\"z\":57.07,\"x\":319.27}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-196.28,\"z\":58.02,\"x\":319.27}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(19, 'Urzednicza20', 'Urzędnicza Pokój 20', '{\"y\":-197.12,\"z\":57.07,\"x\":321.31}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-197.12,\"z\":58.02,\"x\":321.31}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(20, 'Urzednicza21', 'Urzędnicza Pokój 21', '{\"y\":-225.04,\"z\":53.27,\"x\":329.37}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-225.04,\"z\":53.27,\"x\":329.37}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(21, 'Urzednicza22', 'Urzędnicza Pokój 22', '{\"y\":-225.94,\"z\":53.27,\"x\":331.36}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-225.94,\"z\":53.27,\"x\":331.36}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(22, 'Urzednicza23', 'Urzędnicza Pokój 23', '{\"y\":-227.2,\"z\":53.27,\"x\":334.94}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-227.2,\"z\":53.27,\"x\":334.94}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(23, 'Urzednicza24', 'Urzędnicza Pokój 24', '{\"y\":-224.76,\"z\":53.27,\"x\":336.96}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-224.76,\"z\":53.27,\"x\":336.96}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(24, 'Urzednicza25', 'Urzędnicza Pokój 25', '{\"y\":-219.37,\"z\":53.27,\"x\":338.87}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-219.37,\"z\":53.27,\"x\":338.87}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(25, 'Urzednicza26', 'Urzędnicza Pokój 26', '{\"y\":-214.76,\"z\":53.27,\"x\":340.63}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-214.76,\"z\":53.27,\"x\":340.63}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(26, 'Urzednicza27', 'Urzędnicza Pokój 27', '{\"y\":-209.56,\"z\":53.27,\"x\":342.71}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-209.56,\"z\":53.27,\"x\":342.71}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(27, 'Urzednicza28', 'Urzędnicza Pokój 28', '{\"y\":-205.03,\"z\":53.27,\"x\":344.64}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-205.03,\"z\":53.27,\"x\":344.64}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(28, 'Urzednicza29', 'Urzędnicza Pokój 29', '{\"y\":-199.7,\"z\":53.27,\"x\":346.75}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-199.7,\"z\":53.27,\"x\":346.75}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(29, 'Urzednicza30', 'Urzędnicza Pokój 30', '{\"y\":-225.12,\"z\":57.07,\"x\":329.42}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-225.12,\"z\":57.07,\"x\":329.42}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(30, 'Urzednicza31', 'Urzędnicza Pokój 31', '{\"y\":-225.91,\"z\":57.07,\"x\":331.41}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-225.91,\"z\":57.07,\"x\":331.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(31, 'Urzednicza32', 'Urzędnicza Pokój 32', '{\"y\":-227.25,\"z\":57.07,\"x\":334.98}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-227.25,\"z\":57.07,\"x\":334.98}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(32, 'Urzednicza33', 'Urzędnicza Pokój 33', '{\"y\":-224.73,\"z\":57.07,\"x\":337.01}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-224.73,\"z\":57.07,\"x\":337.01}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(33, 'Urzednicza34', 'Urzędnicza Pokój 34', '{\"y\":-219.43,\"z\":57.07,\"x\":338.94}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-219.43,\"z\":57.07,\"x\":338.94}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 2000000, 1),
(34, 'Urzednicza35', 'Urzędnicza Pokój 35', '{\"y\":-214.91,\"z\":57.07,\"x\":340.89}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-214.91,\"z\":57.07,\"x\":340.89}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(35, 'Urzednicza36', 'Urzędnicza Pokój 36', '{\"y\":-209.53,\"z\":57.07,\"x\":342.74}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-209.53,\"z\":57.07,\"x\":342.74}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 750000, 1),
(36, 'Urzednicza37', 'Urzędnicza Pokój 37', '{\"y\":-205.0,\"z\":57.07,\"x\":344.54}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-205.0,\"z\":57.07,\"x\":344.54}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(37, 'Urzednicza39', 'Urzędnicza Pokój 39', '{\"y\":-199.65,\"z\":57.07,\"x\":346.6}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-198.18,\"z\":-89.95,\"x\":310.28}', '{\"y\":-199.65,\"z\":57.07,\"x\":346.6}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":307.93,\"y\":-203.7,\"z\":-89.95}', NULL, 1000000, 1),
(38, 'IntegrityWay', 'Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":37.05}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, 0, NULL, NULL, NULL, 0, 1),
(39, 'IntegrityWay1', 'Integrity Way Apt 1', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.13}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.13}', NULL, '[]', 'IntegrityWay', 0, 1, 0, 0, NULL, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.53}', NULL, 15000000, 1),
(40, 'IntegrityWay2', 'Integrity Way Apt 2', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.21}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.21}', NULL, '[]', 'IntegrityWay', 0, 1, 0, 0, NULL, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.22}', NULL, 999999999, 1),
(41, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.02,\"y\":312.56,\"z\":84.75}', NULL, NULL, '{\"x\":-775.02,\"y\":312.56,\"z\":84.75}', '[]', NULL, 0, 0, 1, 0, NULL, NULL, NULL, 0, 1),
(42, 'MiltonDrive1', 'Milton Drive Apt 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":211.1}', '{\"x\":-779.751,\"y\":323.385,\"z\":211.1}', NULL, '[]', 'MiltonDrive', 0, 1, 0, 0, NULL, '{\"x\":-766.661,\"y\":327.672,\"z\":210.5}', NULL, 6500000, 1),
(43, 'MiltonDrive2', 'Milton Drive Apt 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":187.01}', '{\"x\":-781.808,\"y\":315.866,\"z\":187.01}', NULL, '[]', 'MiltonDrive', 0, 1, 0, 0, NULL, '{\"x\":-795.735,\"y\":326.757,\"z\":186.41}', NULL, 6500000, 1),
(44, 'MiltonDrive3', 'Milton Drive Apt 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.79}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.79}', NULL, '[]', 'MiltonDrive', 0, 1, 0, 0, NULL, '{\"x\":-765.386,\"y\":330.782,\"z\":195.19}', NULL, 9999999, 1),
(45, 'MarathonAve', 'Marathon Ave', '{\"x\":-1447.31,\"y\":-537.67,\"z\":33.79}', NULL, NULL, '{\"x\":-1447.31,\"y\":-537.67,\"z\":33.79}', '[]', NULL, 0, 0, 1, 0, NULL, NULL, NULL, 0, 1),
(46, 'MarathonAve1', 'Marathon Ave Apt 1', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.14}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.14}', NULL, '[]', 'MarathonAve', 0, 1, 0, 0, NULL, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.54}', NULL, 6500000, 1),
(47, 'MarathonAve2', 'Marathon Ave Apt 2', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":56.03}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":56.03}', NULL, '[]', 'MarathonAve', 0, 1, 0, 0, NULL, '{\"x\":-1457.026,\"y\":-530.219,\"z\":56.04}', NULL, 6500000, 1),
(48, 'MeteorSt1', 'Meteor St Pokój 1', '{\"y\":202.02,\"z\":103.79,\"x\":485.77}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":202.02,\"z\":103.79,\"x\":485.77}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(49, 'MeteorSt2', 'Meteor St Pokój 2', '{\"y\":206.36,\"z\":103.79,\"x\":482.47}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":206.36,\"z\":103.79,\"x\":482.47}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(50, 'MeteorSt3', 'Meteor St Pokój 3', '{\"y\":213.17,\"z\":103.79,\"x\":484.86}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":213.17,\"z\":103.79,\"x\":484.86}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(51, 'MeteorSt4', 'Meteor St Pokój 4', '{\"y\":220.69,\"z\":103.79,\"x\":487.61}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":220.69,\"z\":103.79,\"x\":487.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1400000, 1),
(52, 'MeteorSt5', 'Meteor St Pokój 5', '{\"y\":227.24,\"z\":103.79,\"x\":489.99}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":220.69,\"z\":103.79,\"x\":487.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(53, 'MeteorSt6', 'Meteor St Pokój 6', '{\"y\":237.26,\"z\":103.79,\"x\":496.72}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":237.26,\"z\":103.79,\"x\":496.72}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(54, 'MeteorSt7', 'Meteor St Pokój 7', '{\"y\":234.29,\"z\":103.79,\"x\":505.13}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":234.29,\"z\":103.79,\"x\":505.13}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 2000000, 1),
(55, 'MeteorSt8', 'Meteor St Pokój 8', '{\"y\":231.79,\"z\":103.79,\"x\":511.37}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":231.79,\"z\":103.79,\"x\":511.37}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(56, 'MeteorSt9', 'Meteor St Pokój 9', '{\"y\":228.87,\"z\":103.79,\"x\":519.08}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":228.87,\"z\":103.79,\"x\":519.08}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(57, 'MeteorSt10', 'Meteor St Pokój 10', '{\"y\":225.82,\"z\":103.79,\"x\":527.51}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":225.82,\"z\":103.79,\"x\":527.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(58, 'MeteorSt11', 'Meteor St Pokój 11', '{\"y\":222.13,\"z\":103.79,\"x\":531.24}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":222.13,\"z\":103.79,\"x\":531.24}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(59, 'MeteorSt12', 'Meteor St Pokój 12', '{\"y\":213.19,\"z\":103.79,\"x\":527.92}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":213.19,\"z\":103.79,\"x\":527.92}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 2000000, 1),
(60, 'MeteorSt13', 'Meteor St Pokój 13', '{\"y\":206.71,\"z\":103.79,\"x\":525.61}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":206.71,\"z\":103.79,\"x\":525.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(61, 'MeteorSt14', 'Meteor St Pokój 14', '{\"y\":206.71,\"z\":103.79,\"x\":525.61}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":206.71,\"z\":103.79,\"x\":525.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(62, 'MeteorSt15', 'Meteor St Pokój 15', '{\"y\":199.41,\"z\":103.79,\"x\":522.44}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":199.41,\"z\":103.79,\"x\":522.44}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(63, 'MeteorSt16', 'Meteor St Pokój 16', '{\"y\":191.88,\"z\":103.79,\"x\":520.13}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":191.88,\"z\":103.79,\"x\":520.13}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(64, 'MeteorSt17', 'Meteor St Pokój 17', '{\"y\":191.37,\"z\":103.79,\"x\":514.75}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":191.37,\"z\":103.79,\"x\":514.75}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(65, 'MeteorSt18', 'Meteor St Pokój 18', '{\"y\":193.8,\"z\":103.79,\"x\":508.38}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":193.8,\"z\":103.79,\"x\":508.38}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(66, 'MeteorSt19', 'Meteor St Pokój 19', '{\"y\":201.85,\"z\":107.36,\"x\":485.79}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":201.85,\"z\":107.36,\"x\":485.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(67, 'MeteorSt20', 'Meteor St Pokój 20', '{\"y\":206.05,\"z\":107.36,\"x\":482.22}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":206.05,\"z\":107.36,\"x\":482.22}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(68, 'MeteorSt21', 'Meteor St Pokój 21', '{\"y\":213.2,\"z\":107.36,\"x\":484.87}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":213.2,\"z\":107.36,\"x\":484.87}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(69, 'MeteorSt22', 'Meteor St Pokój 22', '{\"y\":193.47,\"z\":107.36,\"x\":508.35}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":193.47,\"z\":107.36,\"x\":508.35}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(70, 'MeteorSt23', 'Meteor St Pokój 23', '{\"y\":191.22,\"z\":107.36,\"x\":514.84}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":191.22,\"z\":107.36,\"x\":514.84}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 700000, 1),
(71, 'MeteorSt24', 'Meteor St Pokój 24', '{\"y\":191.95,\"z\":107.36,\"x\":520.36}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":191.95,\"z\":107.36,\"x\":520.36}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(72, 'MeteorSt25', 'Meteor St Pokój 25', '{\"y\":199.19,\"z\":107.36,\"x\":522.93}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":189.29,\"z\":-89.95,\"x\":500.43}', '{\"y\":199.19,\"z\":107.36,\"x\":522.93}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":494.66,\"y\":192.61,\"z\":-89.95}', NULL, 1000000, 1),
(73, 'CougarAve1', 'Cougar Ave Pokój 1', '{\"y\":-249.3,\"z\":47.33,\"x\":-1543.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-249.3,\"z\":47.33,\"x\":-1543.24}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(74, 'CougarAve2', 'Cougar Ave Pokój 2', '{\"y\":-255.05,\"z\":47.33,\"x\":-1538.46}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-255.05,\"z\":47.33,\"x\":-1538.46}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1000000, 1),
(75, 'CougarAve3', 'Cougar Ave Pokój 3', '{\"y\":-260.28,\"z\":47.33,\"x\":-1533.19}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-260.28,\"z\":47.33,\"x\":-1533.19}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1600000, 1),
(76, 'CougarAve4', 'Cougar Ave Pokój 4', '{\"y\":-270.34,\"z\":47.33,\"x\":-1536.8}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-270.34,\"z\":47.33,\"x\":-1536.8}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(77, 'CougarAve5', 'Cougar Ave Pokój 5', '{\"y\":-272.33,\"z\":47.33,\"x\":-1538.2}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.33,\"z\":47.33,\"x\":-1538.2}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(78, 'CougarAve6', 'Cougar Ave Pokój 6', '{\"y\":-276.56,\"z\":47.33,\"x\":-1541.29}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-276.56,\"z\":47.33,\"x\":-1541.29}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(79, 'CougarAve7', 'Cougar Ave Pokój 7', '{\"y\":-278.59,\"z\":47.33,\"x\":-1542.84}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-278.59,\"z\":47.33,\"x\":-1542.84}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(80, 'CougarAve9', 'Cougar Ave Pokój 9', '{\"y\":-284.12,\"z\":47.33,\"x\":-1550.21}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-284.12,\"z\":47.33,\"x\":-1550.21}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(81, 'CougarAve10', 'Cougar Ave Pokój 10', '{\"y\":-279.43,\"z\":47.33,\"x\":-1555.59}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-279.43,\"z\":47.33,\"x\":-1555.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1000000, 1),
(82, 'CougarAve11', 'Cougar Ave Pokój 11', '{\"y\":-274.6,\"z\":47.33,\"x\":-1560.8}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-274.6,\"z\":47.33,\"x\":-1560.8}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(83, 'CougarAve12', 'Cougar Ave Pokój 12', '{\"y\":-265.78,\"z\":47.33,\"x\":-1583.45}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-265.78,\"z\":47.33,\"x\":-1583.45}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(84, 'CougarAve13', 'Cougar Ave Pokój 13', '{\"y\":-277.9,\"z\":47.33,\"x\":-1582.15}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-277.9,\"z\":47.33,\"x\":-1582.15}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1000000, 1),
(85, 'CougarAve14', 'Cougar Ave Pokój 14', '{\"y\":-289.94,\"z\":47.33,\"x\":-1574.75}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-289.94,\"z\":47.33,\"x\":-1574.75}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1600000, 1),
(86, 'CougarAve15', 'Cougar Ave Pokój 15', '{\"y\":-295.02,\"z\":47.33,\"x\":-1569.54}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-295.02,\"z\":47.33,\"x\":-1569.54}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1000000, 1),
(87, 'CougarAve16', 'Cougar Ave Pokój 16', '{\"y\":-300.12,\"z\":47.33,\"x\":-1564.44}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-300.12,\"z\":47.33,\"x\":-1564.44}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 1000000, 1),
(88, 'CougarAve17', 'Cougar Ave Pokój 17', '{\"y\":-290.26,\"z\":47.33,\"x\":-1555.15}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-290.26,\"z\":47.33,\"x\":-1555.15}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(89, 'CougarAve18', 'Cougar Ave Pokój 18', '{\"y\":-285.35,\"z\":47.33,\"x\":-1560.67}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-285.35,\"z\":47.33,\"x\":-1560.67}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(90, 'CougarAve19', 'Cougar Ave Pokój 19', '{\"y\":-280.42,\"z\":47.33,\"x\":-1566.13}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-272.54,\"z\":-89.95,\"x\":-1564.24}', '{\"y\":-280.42,\"z\":47.33,\"x\":-1566.13}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1559.95,\"y\":-277.71,\"z\":-89.95}', NULL, 800000, 1),
(91, 'BayCitiAve1', 'Bay Citi Ave Pokój 1', '{\"y\":-453.42,\"z\":41.70,\"x\":-1706.83}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-453.42,\"z\":41.70,\"x\":-1706.83}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(92, 'BayCitiAve2', 'Bay Citi Ave Pokój 2', '{\"y\":-460.55,\"z\":40.70,\"x\":-1698.31}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-460.55,\"z\":40.70,\"x\":-1698.31}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 1000000, 1),
(93, 'BayCitiAve3', 'Bay Citi Ave Pokój 3', '{\"y\":-464.7,\"z\":40.70,\"x\":-1692.98}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-464.7,\"z\":40.70,\"x\":-1692.98}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(94, 'BayCitiAve4', 'Bay Citi Ave Pokój 4', '{\"y\":-474.65,\"z\":40.70,\"x\":-1700.19}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-474.65,\"z\":40.70,\"x\":-1700.19}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(95, 'BayCitiAve5', 'Bay Citi Ave Pokój 5', '{\"y\":-480.45,\"z\":40.70,\"x\":-1704.63}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-480.45,\"z\":40.70,\"x\":-1704.63}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(96, 'BayCitiAve6', 'Bay Citi Ave Pokój 6', '{\"y\":-480.92,\"z\":40.70,\"x\":-1709.67}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-480.92,\"z\":40.70,\"x\":-1709.67}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 1000000, 1),
(97, 'BayCitiAve7', 'Bay Citi Ave Pokój 7', '{\"y\":-477.2,\"z\":40.70,\"x\":-1712.67}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-477.2,\"z\":40.70,\"x\":-1712.67}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(98, 'BayCitiAve8', 'Bay Citi Ave Pokój 8', '{\"y\":-470.33,\"z\":40.70,\"x\":-1713.47}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-470.33,\"z\":40.70,\"x\":-1713.47}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 1000000, 1),
(99, 'BayCitiAve9', 'Bay Citi Ave Pokój 9', '{\"y\":-463.63,\"z\":40.70,\"x\":-1714.14}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-459.17,\"z\":-89.95,\"x\":-1694.89}', '{\"y\":-463.63,\"z\":40.70,\"x\":-1714.14}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1699.57,\"y\":-454.63,\"z\":-89.95}', NULL, 800000, 1),
(100, 'MarathonAve1a', 'Marathon Ave Pokój 1', '{\"y\":-668.27,\"z\":28.08,\"x\":-1493.67}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-668.27,\"z\":28.08,\"x\":-1493.67}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 9999999, 1),
(101, 'MarathonAve2a', 'Marathon Ave Pokój 2', '{\"y\":-664.53,\"z\":28.08,\"x\":-1497.99}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-664.53,\"z\":28.08,\"x\":-1497.99}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 1000000, 1),
(102, 'MarathonAve3', 'Marathon Ave Pokój 3', '{\"y\":-661.66,\"z\":28.08,\"x\":-1495.24}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-661.66,\"z\":28.08,\"x\":-1495.24}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(103, 'MarathonAve4', 'Marathon Ave Pokój 4', '{\"y\":-658.41,\"z\":28.08,\"x\":-1490.69}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-658.41,\"z\":28.08,\"x\":-1490.69}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 1000000, 1),
(104, 'MarathonAve5', 'Marathon Ave Pokój 5', '{\"y\":-655.52,\"z\":28.63,\"x\":-1486.66}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-655.52,\"z\":28.63,\"x\":-1486.66}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 2000000, 1),
(105, 'MarathonAve6', 'Marathon Ave Pokój 6', '{\"y\":-652.12,\"z\":28.63,\"x\":-1482.15}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-652.12,\"z\":28.63,\"x\":-1482.15}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(106, 'MarathonAve7', 'Marathon Ave Pokój 7', '{\"y\":-649.44,\"z\":28.63,\"x\":-1477.97}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-649.44,\"z\":28.63,\"x\":-1477.97}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 2000000, 1),
(107, 'MarathonAve8', 'Marathon Ave Pokój 8', '{\"y\":-645.99,\"z\":28.63,\"x\":-1473.49}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-645.99,\"z\":28.63,\"x\":-1473.49}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(108, 'MarathonAve9', 'Marathon Ave Pokój 9', '{\"y\":-643.21,\"z\":28.63,\"x\":-1469.5}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-643.21,\"z\":28.63,\"x\":-1469.5}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(109, 'MarathonAve10', 'Marathon Ave Pokój 10', '{\"y\":-639.77,\"z\":28.63,\"x\":-1464.97}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-639.77,\"z\":28.63,\"x\":-1464.97}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(110, 'MarathonAve11', 'Marathon Ave Pokój 11', '{\"y\":-641.05,\"z\":28.63,\"x\":-1461.47}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-641.05,\"z\":28.63,\"x\":-1461.47}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(111, 'MarathonAve12', 'Marathon Ave Pokój 12', '{\"y\":-653.39,\"z\":28.63,\"x\":-1452.57}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-653.39,\"z\":28.63,\"x\":-1452.57}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(112, 'MarathonAve13', 'Marathon Ave Pokój 13', '{\"y\":-655.88,\"z\":28.63,\"x\":-1454.39}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-655.88,\"z\":28.63,\"x\":-1454.39}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(113, 'MarathonAve14', 'Marathon Ave Pokój 14', '{\"y\":-659.08,\"z\":28.63,\"x\":-1459.19}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-659.08,\"z\":28.63,\"x\":-1459.19}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(114, 'MarathonAve15', 'Marathon Ave Pokój 15', '{\"y\":-661.95,\"z\":28.63,\"x\":-1463.2}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-661.95,\"z\":28.63,\"x\":-1463.2}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(115, 'MarathonAve16', 'Marathon Ave Pokój 16', '{\"y\":-665.43,\"z\":28.63,\"x\":-1467.66}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-665.43,\"z\":28.63,\"x\":-1467.66}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(116, 'MarathonAve17', 'Marathon Ave Pokój 17', '{\"y\":-668.14,\"z\":28.63,\"x\":-1471.63}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-668.14,\"z\":28.63,\"x\":-1471.63}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(117, 'MarathonAve18', 'Marathon Ave Pokój 18', '{\"y\":-641.14,\"z\":32.43,\"x\":-1461.49}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-641.14,\"z\":32.43,\"x\":-1461.49}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(118, 'MarathonAve19', 'Marathon Ave Pokój 19', '{\"y\":-645.62,\"z\":32.43,\"x\":-1458.07}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-645.62,\"z\":32.43,\"x\":-1458.07}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 2000000, 1),
(119, 'MarathonAve20', 'Marathon Ave Pokój 20', '{\"y\":-648.71,\"z\":32.43,\"x\":-1455.91}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-648.71,\"z\":32.43,\"x\":-1455.91}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(120, 'MarathonAve21', 'Marathon Ave Pokój 21', '{\"y\":-653.26,\"z\":32.43,\"x\":-1452.42}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-653.26,\"z\":32.43,\"x\":-1452.42}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(121, 'MarathonAve22', 'Marathon Ave Pokój 22', '{\"y\":-655.71,\"z\":32.43,\"x\":-1454.57}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-655.71,\"z\":32.43,\"x\":-1454.57}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(122, 'MarathonAve23', 'Marathon Ave Pokój 23', '{\"y\":-659.2,\"z\":32.43,\"x\":-1459.03}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-659.2,\"z\":32.43,\"x\":-1459.03}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 2000000, 1),
(123, 'MarathonAve24', 'Marathon Ave Pokój 24', '{\"y\":-662.03,\"z\":32.43,\"x\":-1463.1}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-662.03,\"z\":32.43,\"x\":-1463.1}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(124, 'MarathonAve25', 'Marathon Ave Pokój 25', '{\"y\":-665.28,\"z\":32.43,\"x\":-1467.74}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-665.28,\"z\":32.43,\"x\":-1467.74}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(125, 'MarathonAve26', 'Marathon Ave Pokój 26', '{\"y\":-668.08,\"z\":32.43,\"x\":-1471.73}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-668.08,\"z\":32.43,\"x\":-1471.73}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(126, 'MarathonAve27', 'Marathon Ave Pokój 27', '{\"y\":-671.65,\"z\":32.43,\"x\":-1476.15}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-671.65,\"z\":32.43,\"x\":-1476.15}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(127, 'MarathonAve28', 'Marathon Ave Pokój 28', '{\"y\":-639.68,\"z\":32.43,\"x\":-1464.9}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-639.68,\"z\":32.43,\"x\":-1464.9}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(128, 'MarathonAve29', 'Marathon Ave Pokój 29', '{\"y\":-643.13,\"z\":32.43,\"x\":-1469.44}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-643.13,\"z\":32.43,\"x\":-1469.44}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(129, 'MarathonAve30', 'Marathon Ave Pokój 30', '{\"y\":-645.91,\"z\":32.43,\"x\":-1473.51}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-645.91,\"z\":32.43,\"x\":-1473.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(130, 'MarathonAve31', 'Marathon Ave Pokój 31', '{\"y\":-649.24,\"z\":32.43,\"x\":-1478.12}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-649.24,\"z\":32.43,\"x\":-1478.12}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 1600000, 1),
(131, 'MarathonAve32', 'Marathon Ave Pokój 32', '{\"y\":-652.16,\"z\":32.43,\"x\":-1482.1}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-652.16,\"z\":32.43,\"x\":-1482.1}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 999999, 1),
(132, 'MarathonAve33', 'Marathon Ave Pokój 33', '{\"y\":-655.6,\"z\":32.43,\"x\":-1486.59}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-655.6,\"z\":32.43,\"x\":-1486.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(133, 'MarathonAve34', 'Marathon Ave Pokój 34', '{\"y\":-658.45,\"z\":32.43,\"x\":-1490.6}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-658.45,\"z\":32.43,\"x\":-1490.6}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(134, 'MarathonAve35', 'Marathon Ave Pokój 35', '{\"y\":-661.72,\"z\":32.43,\"x\":-1495.18}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-661.72,\"z\":32.43,\"x\":-1495.18}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(135, 'MarathonAve36', 'Marathon Ave Pokój 36', '{\"y\":-664.68,\"z\":32.43,\"x\":-1498.07}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-664.68,\"z\":32.43,\"x\":-1498.07}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 1000000, 1),
(136, 'MarathonAve37', 'Marathon Ave Pokój 37', '{\"y\":-668.11,\"z\":32.43,\"x\":-1493.58}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-668.11,\"z\":32.43,\"x\":-1493.58}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(137, 'MarathonAve38', 'Marathon Ave Pokój 38', '{\"y\":-671.34,\"z\":32.43,\"x\":-1489.86}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-669.08,\"z\":-89.95,\"x\":-1470.45}', '{\"y\":-671.34,\"z\":32.43,\"x\":-1489.86}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1464.75,\"y\":-665.64,\"z\":-89.95}', NULL, 800000, 1),
(138, 'ProcopioDrive1', 'Procopio Drive Nr. 1', '{\"y\":6637.33,\"z\":30.14,\"x\":-41.64}', '{\"y\":6635.15,\"z\":-90.15,\"x\":-40.82}', '{\"y\":6635.15,\"z\":-90.15,\"x\":-40.82}', '{\"y\":6637.33,\"z\":30.14,\"x\":-41.64}', '[]', NULL, 1, 1, 0, 0, '{\"x\":-52.7,\"y\":6622.27,\"z\":29.94}', '{\"x\":-47.81,\"y\":6653.36,\"z\":-90.15}', NULL, 4500000, 1),
(139, 'ProcopioDrive2', 'Procopio Drive Nr. 2', '{\"y\":6314.16,\"z\":27.99,\"x\":-407.21}', '{\"y\":6313.1,\"z\":-90.15,\"x\":-403.31}', '{\"y\":6313.1,\"z\":-90.15,\"x\":-403.31}', '{\"y\":6314.16,\"z\":27.99,\"x\":-407.21}', '[]', NULL, 1, 1, 0, 0, '{\"x\":-396.11,\"y\":6311.73,\"z\":28.95}', '{\"x\":-411.88,\"y\":6330.82,\"z\":-90.15}', NULL, 5500000, 1),
(140, 'ChollaSpringsAve1', 'Cholla Springs Ave', '{\"y\":3907.8,\"z\":32.80,\"x\":1809.06}', '{\"y\":3902.74,\"z\":-90.15,\"x\":1814.47}', '{\"y\":3902.74,\"z\":-90.15,\"x\":1814.47}', '{\"y\":3907.8,\"z\":32.80,\"x\":1809.06}', '[]', NULL, 1, 1, 0, 0, '{\"x\":1815.17,\"y\":3887.68,\"z\":33.78}', '{\"x\":1814.3,\"y\":3922.43,\"z\":-90.15}', NULL, 4000000, 1),
(141, 'GreatOceanHwy1', 'Great Ocean Hwy Pokój 1', '{\"y\":6322.6,\"z\":30.63,\"x\":-111.33}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6322.6,\"z\":30.63,\"x\":-111.33}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(142, 'GreatOceanHwy2', 'Great Ocean Hwy Pokój 2', '{\"y\":6325.81,\"z\":30.63,\"x\":-114.45}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6325.81,\"z\":30.63,\"x\":-114.45}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(143, 'GreatOceanHwy3', 'Great Ocean Hwy Pokój 3', '{\"y\":6327.08,\"z\":30.63,\"x\":-120.01}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6327.08,\"z\":30.63,\"x\":-120.01}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(144, 'GreatOceanHwy4', 'Great Ocean Hwy Pokój 4', '{\"y\":6322.53,\"z\":34.55,\"x\":-111.32}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6322.53,\"z\":34.45,\"x\":-111.32}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(145, 'GreatOceanHwy5', 'Great Ocean Hwy Pokój 5', '{\"y\":6325.97,\"z\":34.55,\"x\":-114.43}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6325.97,\"z\":34.45,\"x\":-114.43}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1200000, 1),
(146, 'GreatOceanHwy6', 'Great Ocean Hwy Pokój 6', '{\"y\":6327.04,\"z\":34.55,\"x\":-120.14}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6327.04,\"z\":34.45,\"x\":-120.14}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(147, 'GreatOceanHwy7', 'Great Ocean Hwy Pokój 7', '{\"y\":6330.96,\"z\":30.63,\"x\":-103.34}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6330.96,\"z\":30.63,\"x\":-103.34}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1100000, 1),
(148, 'GreatOceanHwy8', 'Great Ocean Hwy Pokój 8', '{\"y\":6334.09,\"z\":30.63,\"x\":-106.55}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6334.09,\"z\":30.63,\"x\":-106.55}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1000000, 1),
(149, 'GreatOceanHwy9', 'Great Ocean Hwy Pokój 9', '{\"y\":6339.76,\"z\":30.63,\"x\":-107.47}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6339.76,\"z\":30.63,\"x\":-107.47}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(150, 'GreatOceanHwy10', 'Great Ocean Hwy Pokój 10', '{\"y\":6345.2,\"z\":30.63,\"x\":-102.07}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6345.2,\"z\":30.63,\"x\":-102.07}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1050000, 1),
(151, 'GreatOceanHwy11', 'Great Ocean Hwy Pokój 11', '{\"y\":6348.43,\"z\":30.63,\"x\":-98.84}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6348.43,\"z\":30.63,\"x\":-98.84}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1000000, 1),
(152, 'GreatOceanHwy12', 'Great Ocean Hwy Pokój 12', '{\"y\":6353.78,\"z\":30.63,\"x\":-93.31}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6353.78,\"z\":30.63,\"x\":-93.31}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(153, 'GreatOceanHwy13', 'Great Ocean Hwy Pokój 13', '{\"y\":6357.21,\"z\":30.63,\"x\":-90.16}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6357.21,\"z\":30.63,\"x\":-90.16}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(154, 'GreatOceanHwy14', 'Great Ocean Hwy Pokój 14', '{\"y\":6362.6,\"z\":30.63,\"x\":-84.75}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6362.6,\"z\":30.63,\"x\":-84.75}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(155, 'GreatOceanHwy15', 'Great Ocean Hwy Pokój 15', '{\"y\":6330.8,\"z\":34.55,\"x\":-103.28}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6330.8,\"z\":34.45,\"x\":-103.28}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1100000, 1),
(156, 'GreatOceanHwy16', 'Great Ocean Hwy Pokój 16', '{\"y\":6333.97,\"z\":34.55,\"x\":-106.56}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6333.97,\"z\":34.45,\"x\":-106.56}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(157, 'GreatOceanHwy17', 'Great Ocean Hwy Pokój 17', '{\"y\":6339.62,\"z\":34.55,\"x\":-107.41}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6339.62,\"z\":34.45,\"x\":-107.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 2000000, 1),
(158, 'GreatOceanHwy18', 'Great Ocean Hwy Pokój 18', '{\"y\":6345.15,\"z\":34.55,\"x\":-102.04}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6345.15,\"z\":34.45,\"x\":-102.04}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(159, 'GreatOceanHwy19', 'Great Ocean Hwy Pokój 19', '{\"y\":6348.44,\"z\":34.55,\"x\":-98.87}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6348.44,\"z\":34.45,\"x\":-98.87}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `is_open`, `garage`, `room_menu`, `doors`, `price`, `is_available`) VALUES
(160, 'GreatOceanHwy20', 'Great Ocean Hwy Pokój 20', '{\"y\":6353.9,\"z\":34.55,\"x\":-93.46}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6353.9,\"z\":34.45,\"x\":-93.46}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1000000, 1),
(161, 'GreatOceanHwy21', 'Great Ocean Hwy Pokój 21', '{\"y\":6357.09,\"z\":34.55,\"x\":-90.22}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6357.09,\"z\":34.45,\"x\":-90.22}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 1200000, 1),
(162, 'GreatOceanHwy22', 'Great Ocean Hwy Pokój 22', '{\"y\":6362.49,\"z\":34.55,\"x\":-84.82}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6360.1,\"z\":-89.95,\"x\":-89.88}', '{\"y\":6357.09,\"z\":34.45,\"x\":-90.22}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-94.19,\"y\":6365.16,\"z\":-89.95}', NULL, 550000, 1),
(163, 'Droga1681', 'Droga 68 Nr. 1 Pokój 1', '{\"y\":2654.61,\"z\":37.20,\"x\":1142.0}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2654.61,\"z\":37.20,\"x\":1142.0}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 1000000, 1),
(164, 'Droga1682', 'Droga 68 Nr. 1 Pokój 2', '{\"y\":2651.13,\"z\":37.20,\"x\":1142.35}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2651.13,\"z\":37.20,\"x\":1142.35}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 1000000, 1),
(165, 'Droga1683', 'Droga 68 Nr. 1 Pokój 3', '{\"y\":2643.53,\"z\":37.20,\"x\":1142.29}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2643.53,\"z\":37.20,\"x\":1142.29}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(166, 'Droga1684', 'Droga 68 Nr. 1 Pokój 4', '{\"y\":2641.74,\"z\":37.20,\"x\":1141.13}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.74,\"z\":37.20,\"x\":1141.13}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(167, 'Droga1685', 'Droga 68 Nr. 1 Pokój 5', '{\"y\":2641.69,\"z\":37.20,\"x\":1136.24}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.69,\"z\":37.20,\"x\":1136.24}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(168, 'Droga1686', 'Droga 68 Nr. 1 Pokój 6', '{\"y\":2641.72,\"z\":37.20,\"x\":1132.79}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.72,\"z\":37.20,\"x\":1132.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(169, 'Droga1687', 'Droga 68 Nr. 1 Pokój 7', '{\"y\":2641.64,\"z\":37.20,\"x\":1125.17}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.64,\"z\":37.20,\"x\":1125.17}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(170, 'Droga1688', 'Droga 68 Nr. 1 Pokój 8', '{\"y\":2641.73,\"z\":37.20,\"x\":1121.4}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.73,\"z\":37.20,\"x\":1121.4}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 1000000, 1),
(171, 'Droga1689', 'Droga 68 Nr. 1 Pokój 9', '{\"y\":2641.64,\"z\":37.20,\"x\":1114.71}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.64,\"z\":37.20,\"x\":1114.71}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(172, 'Droga16810', 'Droga 68 Nr. 1 Pokój 10', '{\"y\":2641.68,\"z\":37.20,\"x\":1107.08}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2641.68,\"z\":37.20,\"x\":1107.08}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(173, 'Droga16811', 'Droga 68 Nr. 1 Pokój 11', '{\"y\":2649.07,\"z\":37.20,\"x\":1106.11}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2649.07,\"z\":37.20,\"x\":1106.11}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(174, 'Droga16812', 'Droga 68 Nr. 1 Pokój 12', '{\"y\":2652.93,\"z\":37.20,\"x\":1106.05}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2632.69,\"z\":-89.95,\"x\":1120.73}', '{\"y\":2652.93,\"z\":37.20,\"x\":1106.05}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":1121.15,\"y\":2639.44,\"z\":-89.95}', NULL, 500000, 1),
(175, 'Droga2681', 'Droga 68 Nr. 2 Pokój 1', '{\"y\":2615.25,\"z\":43.72,\"x\":341.61}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2615.25,\"z\":43.72,\"x\":341.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 1100000, 1),
(176, 'Droga2682', 'Droga 68 Nr. 2 Pokój 2', '{\"y\":2618.41,\"z\":43.73,\"x\":346.81}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2618.41,\"z\":43.73,\"x\":346.81}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 1100000, 1),
(177, 'Droga2683', 'Droga 68 Nr. 2 Pokój 3', '{\"y\":2620.15,\"z\":43.73,\"x\":354.25}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2620.15,\"z\":43.73,\"x\":354.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 500000, 1),
(178, 'Droga2684', 'Droga 68 Nr. 2 Pokój 4', '{\"y\":2623.02,\"z\":43.73,\"x\":359.68}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2623.02,\"z\":43.73,\"x\":359.68}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 500000, 1),
(179, 'Droga2685', 'Droga 68 Nr. 2 Pokój 5', '{\"y\":2625.0,\"z\":43.73,\"x\":366.82}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2625.0,\"z\":43.73,\"x\":366.82}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 1000000, 1),
(180, 'Droga2686', 'Droga 68 Nr. 2 Pokój 6', '{\"y\":2627.97,\"z\":43.73,\"x\":372.27}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2627.97,\"z\":43.73,\"x\":372.27}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 500000, 1),
(181, 'Droga2687', 'Droga 68 Nr. 2 Pokój 7', '{\"y\":2629.65,\"z\":43.73,\"x\":379.71}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2629.65,\"z\":43.73,\"x\":379.71}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 500000, 1),
(182, 'Droga2688', 'Droga 68 Nr. 2 Pokój 8', '{\"y\":2632.67,\"z\":43.73,\"x\":385.08}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2632.67,\"z\":43.73,\"x\":385.08}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 1000000, 1),
(183, 'Droga2689', 'Droga 68 Nr. 2 Pokój 9', '{\"y\":2634.31,\"z\":43.73,\"x\":392.35}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2634.31,\"z\":43.73,\"x\":392.35}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 1100000, 1),
(184, 'Droga26810', 'Droga 68 Nr. 2 Pokój 10', '{\"y\":2637.3,\"z\":43.73,\"x\":397.85}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2619.44,\"z\":-89.95,\"x\":368.99}', '{\"y\":2637.3,\"z\":43.73,\"x\":397.85}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":366.03,\"y\":2625.5,\"z\":-89.95}', NULL, 500000, 1),
(185, 'Vespucci1', '1 Vespucci Canals', '{\"x\":-1024.56,\"y\":-1139.64,\"z\":1.85}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1024.56,\"y\":-1139.64,\"z\":1.85}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(186, 'Vespucci2', '2 Vespucci Canals', '{\"x\":-1034.79,\"y\":-1146.81,\"z\":1.26}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1034.79,\"y\":-1146.81,\"z\":1.26}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(187, 'Vespucci3', '3 Vespucci Canals', '{\"x\":-1046.12,\"y\":-1159.59,\"z\":1.26}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1046.12,\"y\":-1159.59,\"z\":1.26}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(188, 'Vespucci4', '4 Vespucci Canals', '{\"x\":-1063.69,\"y\":-1160.14,\"z\":1.84}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1063.69,\"y\":-1160.14,\"z\":1.84}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(189, 'Vespucci5', '5 Vespucci Canals', '{\"x\":-1068.18,\"y\":-1163.31,\"z\":1.85}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1068.18,\"y\":-1163.31,\"z\":1.85}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(190, 'Vespucci6', '6 Vespucci Canals', '{\"x\":-1073.83,\"y\":-1152.51,\"z\":1.26}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1073.83,\"y\":-1152.51,\"z\":1.26}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1000000, 1),
(191, 'Vespucci7', '7 Vespucci Canals', '{\"x\":-1047.84,\"y\":-1123.10,\"z\":1.26}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1047.84,\"y\":-1123.10,\"z\":1.26}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(192, 'Vespucci8', '8 Vespucci Canals', '{\"x\":-1034.47,\"y\":-1128.24,\"z\":1.26}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1034.47,\"y\":-1128.24,\"z\":1.26}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 650000, 1),
(193, 'Vespucci9', '9 Vespucci Canals', '{\"x\":-1121.89,\"y\":-1046.56,\"z\":1.25}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1121.89,\"y\":-1046.56,\"z\":1.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(194, 'Vespucci10', '10 Vespucci Canals', '{\"x\":-1108.51,\"y\":-1041.22,\"z\":1.25}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1108.51,\"y\":-1041.22,\"z\":1.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(195, 'Vespucci11', '11 Vespucci Canals', '{\"x\":-1075.91,\"y\":-1026.65,\"z\":3.65}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1075.91,\"y\":-1026.65,\"z\":3.65}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(196, 'Vespucci12', '12 Vespucci Canals', '{\"x\":-1065.44,\"y\":-1055.32,\"z\":5.51}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1065.44,\"y\":-1055.32,\"z\":5.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(197, 'Vespucci13', '13 Vespucci Canals', '{\"x\":-1064.19,\"y\":-1057.19,\"z\":5.51}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1064.19,\"y\":-1057.19,\"z\":5.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(198, 'Vespucci14', '14 Vespucci Canals', '{\"x\":-1104.14,\"y\":-1059.81,\"z\":1.83}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1104.14,\"y\":-1059.81,\"z\":1.83}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 650000, 1),
(199, 'Vespucci15', '15 Vespucci Canals', '{\"x\":-1114.37,\"y\":-1068.89,\"z\":1.25}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1114.37,\"y\":-1068.89,\"z\":1.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 1000000, 1),
(200, 'Vespucci16', '16 Vespucci Canals', '{\"x\":-1122.95,\"y\":-1089.58,\"z\":1.65}', '{\"x\":-1101.53,\"y\":-1061.37,\"z\":-91.91}', '{\"x\":-1103.29,\"y\":-1058.17,\"z\":-89.9}', '{\"x\":-1122.95,\"y\":-1089.58,\"z\":1.65}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1108.74,\"y\":-1061.36,\"z\":-89.9}', NULL, 1300000, 1),
(201, 'LaPuerta1', 'La Puerta Pokój 1', '{\"x\":-912.68,\"y\":-1416.94,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-912.68,\"y\":-1416.94,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(202, 'LaPuerta2', 'La Puerta Pokój 2', '{\"x\":-915.59,\"y\":-1418.03,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-915.59,\"y\":-1418.03,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1000000, 1),
(203, 'LaPuerta3', 'La Puerta Pokój 3', '{\"x\":-918.57,\"y\":-1419.20,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-918.57,\"y\":-1419.20,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1000000, 1),
(204, 'LaPuerta4', 'La Puerta Pokój 4', '{\"x\":-922.67,\"y\":-1407.62,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-922.67,\"y\":-1407.62,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1000000, 1),
(205, 'LaPuerta5', 'La Puerta Pokój 5', '{\"x\":-919.77,\"y\":-1406.48,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-919.77,\"y\":-1406.48,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(206, 'LaPuerta6', 'La Puerta Pokój 6', '{\"x\":-916.86,\"y\":-1405.27,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-916.86,\"y\":-1405.27,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1500000, 1),
(207, 'LaPuerta7', 'La Puerta Pokój 7', '{\"x\":-932.83,\"y\":-1411.07,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-932.83,\"y\":-1411.07,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(208, 'LaPuerta8', 'La Puerta Pokój 8', '{\"x\":-935.69,\"y\":-1412.26,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-935.69,\"y\":-1412.26,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1500000, 1),
(209, 'LaPuerta9', 'La Puerta Pokój 9', '{\"x\":-938.67,\"y\":-1413.31,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-938.67,\"y\":-1413.31,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(210, 'LaPuerta10', 'La Puerta Pokój 10', '{\"x\":-928.56,\"y\":-1423.00,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-928.56,\"y\":-1423.00,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(211, 'LaPuerta11', 'La Puerta Pokój 11', '{\"x\":-931.44,\"y\":-1424.01,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-931.44,\"y\":-1424.01,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(212, 'LaPuerta12', 'La Puerta Pokój 12', '{\"x\":-934.35,\"y\":-1425.10,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-934.35,\"y\":-1425.10,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(213, 'LaPuerta13', 'La Puerta Pokój 13', '{\"x\":-959.30,\"y\":-1434.23,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-959.30,\"y\":-1434.23,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(214, 'LaPuerta14', 'La Puerta Pokój 14', '{\"x\":-956.34,\"y\":-1433.05,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-956.34,\"y\":-1433.05,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(215, 'LaPuerta15', 'La Puerta Pokój 15', '{\"x\":-953.55,\"y\":-1431.86,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-953.55,\"y\":-1431.86,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(216, 'LaPuerta16', 'La Puerta Pokój 16', '{\"x\":-963.54,\"y\":-1422.30,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-963.54,\"y\":-1422.30,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(217, 'LaPuerta17', 'La Puerta Pokój 17', '{\"x\":-960.62,\"y\":-1421.27,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-960.62,\"y\":-1421.27,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(218, 'LaPuerta18', 'La Puerta Pokój 18', '{\"x\":-957.72,\"y\":-1420.24,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-957.72,\"y\":-1420.24,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(219, 'LaPuerta19', 'La Puerta Pokój 19', '{\"x\":-979.44,\"y\":-1428.18,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-979.44,\"y\":-1428.18,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(220, 'LaPuerta20', 'La Puerta Pokój 20', '{\"x\":-976.56,\"y\":-1426.98,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-976.56,\"y\":-1426.98,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1000000, 1),
(221, 'LaPuerta21', 'La Puerta Pokój 21', '{\"x\":-973.62,\"y\":-1425.94,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-973.62,\"y\":-1425.94,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 1000000, 1),
(222, 'LaPuerta22', 'La Puerta Pokój 22', '{\"x\":-969.36,\"y\":-1437.79,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-969.36,\"y\":-1437.79,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(223, 'LaPuerta23', 'La Puerta Pokój 23', '{\"x\":-972.27,\"y\":-1438.88,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-972.27,\"y\":-1438.88,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(224, 'LaPuerta24', 'La Puerta Pokój 24', '{\"x\":-975.21,\"y\":-1439.89,\"z\":6.78}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-942.77,\"y\":-1423.05,\"z\":-89.9}', '{\"x\":-975.21,\"y\":-1439.89,\"z\":6.78}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-948.7,\"y\":-1424.57,\"z\":-89.9}', NULL, 700000, 1),
(225, 'Chamberlain1', 'Chamberlain Hills Pokój 1', '{\"x\":-84.04,\"y\":-1622.71,\"z\":30.58}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-84.04,\"y\":-1622.71,\"z\":30.58}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(226, 'Chamberlain2', 'Chamberlain Hills Pokój 2', '{\"x\":-89.94,\"y\":-1629.76,\"z\":30.61}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-89.94,\"y\":-1629.76,\"z\":30.61}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(227, 'Chamberlain3', 'Chamberlain Hills Pokój 3', '{\"x\":-97.51,\"y\":-1638.85,\"z\":31.20}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-97.51,\"y\":-1638.85,\"z\":31.20}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(228, 'Chamberlain4', 'Chamberlain Hills Pokój 4', '{\"x\":-105.29,\"y\":-1632.26,\"z\":32.01}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-105.29,\"y\":-1632.26,\"z\":32.01}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(229, 'Chamberlain5', 'Chamberlain Hills Pokój 5', '{\"x\":-109.19,\"y\":-1628.93,\"z\":32.01}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-109.19,\"y\":-1628.93,\"z\":32.01}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(230, 'Chamberlain6', 'Chamberlain Hills Pokój 6', '{\"x\":-97.37,\"y\":-1612.70,\"z\":31.41}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-97.37,\"y\":-1612.70,\"z\":31.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(231, 'Chamberlain7', 'Chamberlain Hills Pokój 7', '{\"x\":-93.06,\"y\":-1607.58,\"z\":31.41}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-93.06,\"y\":-1607.58,\"z\":31.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 1000000, 1),
(232, 'Chamberlain8', 'Chamberlain Hills Pokój 8', '{\"x\":-88.08,\"y\":-1601.73,\"z\":31.41}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-88.08,\"y\":-1601.73,\"z\":31.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(233, 'Chamberlain9', 'Chamberlain Hills Pokój 9', '{\"x\":-80.46,\"y\":-1608.13,\"z\":30.58}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-80.46,\"y\":-1608.13,\"z\":30.58}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(234, 'Chamberlain10', 'Chamberlain Hills Pokój 10', '{\"x\":-83.74,\"y\":-1622.90,\"z\":33.79}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-83.74,\"y\":-1622.90,\"z\":33.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(235, 'Chamberlain11', 'Chamberlain Hills Pokój 11', '{\"x\":-89.62,\"y\":-1629.91,\"z\":33.79}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-89.62,\"y\":-1629.91,\"z\":33.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(236, 'Chamberlain12', 'Chamberlain Hills Pokój 12', '{\"x\":-97.11,\"y\":-1639.08,\"z\":34.59}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-97.11,\"y\":-1639.08,\"z\":34.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(237, 'Chamberlain13', 'Chamberlain Hills Pokój 13', '{\"x\":-98.14,\"y\":-1638.91,\"z\":34.58}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-98.14,\"y\":-1638.91,\"z\":34.58}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(238, 'Chamberlain14', 'Chamberlain Hills Pokój 14', '{\"x\":-105.58,\"y\":-1632.69,\"z\":35.39}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-105.58,\"y\":-1632.69,\"z\":35.39}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(239, 'Chamberlain15', 'Chamberlain Hills Pokój 15', '{\"x\":-109.62,\"y\":-1628.52,\"z\":35.39}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-109.62,\"y\":-1628.52,\"z\":35.39}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(240, 'Chamberlain16', 'Chamberlain Hills Pokój 16', '{\"x\":-97.74,\"y\":-1612.42,\"z\":34.59}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-97.74,\"y\":-1612.42,\"z\":34.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(241, 'Chamberlain17', 'Chamberlain Hills Pokój 17', '{\"x\":-93.36,\"y\":-1607.35,\"z\":34.59}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-93.36,\"y\":-1607.35,\"z\":34.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 1000000, 1),
(242, 'Chamberlain18', 'Chamberlain Hills Pokój 18', '{\"x\":-87.96,\"y\":-1601.54,\"z\":34.59}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-87.96,\"y\":-1601.54,\"z\":34.59}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(243, 'Chamberlain19', 'Chamberlain Hills Pokój 19', '{\"x\":-80.25,\"y\":-1607.91,\"z\":33.79}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-92.61,\"y\":-1613.65,\"z\":-89.9}', '{\"x\":-80.25,\"y\":-1607.91,\"z\":33.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-97.12,\"y\":-1617.99,\"z\":-89.9}', NULL, 700000, 1),
(254, 'Jamestown1', 'JamesTown Pokój 1', '{\"x\":385.33,\"y\":-1881.95,\"z\":25.08}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":386.51,\"y\":-1882.64,\"z\":24.65}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(255, 'Jamestown2', 'JamesTown Pokój 2', '{\"x\":399.74,\"y\":-1864.59,\"z\":25.76}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":400.06,\"y\":-1865.55,\"z\":25.76}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(256, 'Jamestown3', 'JamesTown Pokój 3', '{\"x\":401.25,\"y\":-1849.53,\"z\":26.36}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":400.49,\"y\":-1850.06,\"z\":25.96}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(257, 'Jamestown4', 'JamesTown Pokój 4', '{\"x\":427.56,\"y\":-1841.85,\"z\":27.51}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":428.16,\"y\":-1842.66,\"z\":27.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(258, 'Jamestown5', 'JamesTown Pokój 5', '{\"x\":440.34,\"y\":-1829.89,\"z\":27.41}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":440.14,\"y\":-1830.79,\"z\":27.41}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 1000000, 1),
(259, 'Jamestown6', 'JamesTown Pokój 6', '{\"x\":405.67,\"y\":-1795.31,\"z\":28.11}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":406.01,\"y\":-1794.96,\"z\":28.07}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(260, 'Jamestown7', 'JamesTown Pokój 7', '{\"x\":398.4811,\"y\":-1789.34,\"z\":28.20}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":399.16,\"y\":-1788.49,\"z\":28.18}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(261, 'Jamestown8', 'JamesTown Pokój 8', '{\"x\":366.95,\"y\":-1802.86,\"z\":28.13}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":366.26,\"y\":-1803.63,\"z\":28.14}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(262, 'Jamestown9', 'JamesTown Pokój 9', '{\"x\":379.04,\"y\":-1812.43,\"z\":28.10}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":378.55,\"y\":-1813.06,\"z\":28.12}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 2000000, 1),
(263, 'Jamestown10', 'JamesTown Pokój 10', '{\"x\":380.432,\"y\":-1813.56,\"z\":28.10}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":379.64,\"y\":-1814.63,\"z\":28.13}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(264, 'Jamestown11', 'JamesTown Pokój 11', '{\"x\":348.86,\"y\":-1820.75,\"z\":27.94}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":348.89,\"y\":-1819.94,\"z\":27.94}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(265, 'Jamestown12', 'JamesTown Pokój 12', '{\"x\":328.89,\"y\":-1845.54,\"z\":26.79}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":328.18,\"y\":-1844.34,\"z\":26.79}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(266, 'Jamestown13', 'JamesTown Pokój 13', '{\"x\":282.61,\"y\":-1898.90,\"z\":26.31}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":282.35,\"y\":-1898.62,\"z\":26.31}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(267, 'Jamestown14', 'JamesTown Pokój 14', '{\"x\":270.15,\"y\":-1917.29,\"z\":25.23}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":269.78,\"y\":-1917.77,\"z\":25.23}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(268, 'Jamestown15', 'JamesTown Pokój 15', '{\"x\":224.90,\"y\":-2036.41,\"z\":17.42}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":224.56,\"y\":-2035.94,\"z\":17.06}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(269, 'Jamestown16', 'JamesTown Pokój 16', '{\"x\":324.30,\"y\":-1937.35,\"z\":24.06}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":324.45,\"y\":-1938.28,\"z\":24.06}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 1000000, 1),
(270, 'Jamestown17', 'JamesTown Pokój 17', '{\"x\":312.08,\"y\":-1956.17,\"z\":23.66}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":313.58,\"y\":-1957.00,\"z\":23.27}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(271, 'Jamestown18', 'JamesTown Pokój 18', '{\"x\":295.76,\"y\":-1971.84,\"z\":21.95}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":296.89,\"y\":-1973.11,\"z\":21.52}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(272, 'Jamestown19', 'JamesTown Pokój 19', '{\"x\":291.47,\"y\":-1980.49,\"z\":20.65}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":291.41,\"y\":-1982.04,\"z\":20.65}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(273, 'Jamestown20', 'JamesTown Pokój 20', '{\"x\":280.04,\"y\":-1993.69,\"z\":19.85}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":280.75,\"y\":-1994.54,\"z\":19.85}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(274, 'Jamestown21', 'JamesTown Pokój 21', '{\"x\":256.88\"y\":-2023.59,\"z\":18.31}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":359.88,\"y\":-2038.52,\"z\":-89.9}', '{\"x\":257.78,\"y\":-2024.48,\"z\":17.91}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":355.5,\"y\":-2033.96,\"z\":-89.9}', NULL, 700000, 1),
(275, 'Vinewood3584', 'Vinewood Hills 3584', '{\"x\":-350.95,\"y\":513.02,\"z\":119.74}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-356.05,\"y\":518.92,\"z\":120.15}', '{\"x\":-330.73,\"y\":513.82,\"z\":119.26}', NULL, 15000000, 1),
(276, 'TongvaHills1954', 'Tongva Hills 1954', '{\"x\":-2601.71,\"y\":1679.6,\"z\":141.11}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-2611.29,\"y\":1684.91,\"z\":141.11}', '{\"x\":-2619.82,\"y\":1712.66,\"z\":145.50}', '[{\"model\":-264728216,\"x\":-2608.79, \"y\":1689.11, \"z\":142.71},\r\n{\"model\":-658026477,\"x\":-2603.71,\"y\":1686.87,\"z\":142.72}]', 30000000, 1),
(277, 'PacificBluffs1', 'Pacific Bluffs 1', '{\"x\":-1985.55,\"y\":-513.46,\"z\":11.28}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-1978.26,\"y\":-493.24,\"z\":12.18}', '{\"x\":-1985.71,\"y\":-505.40,\"z\":11.22}', '[{\"model\":-550386901,\"x\":-1993.92, \"y\":-517.36, \"z\":12.13},{\"model\":-550386901,\"x\":-1975.47, \"y\":-497.53, \"z\":12.02},{\"model\":1980513646,\"x\":-1986.41, \"y\":-503.33, \"z\":12.33},{\"model\":308207762,\"x\":-1986.97, \"y\":-511.65, \"z\":12.33}]', 99999999, 1),
(278, 'BanhamCanyon1', 'Banham Canyon', '{\"x\":-2797.15,\"y\":1432.03,\"z\":99.97}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-2779.38,\"y\":1424.50,\"z\":99.97}', '{\"x\":-2807.09,\"y\":1437.15,\"z\":99.97}', '[{\"model\":224975209,\"x\":-2798.11, \"y\":1431.01, \"z\":100.87},{\"model\":-991010358,\"x\":-2788.64, \"y\":1422.48, \"z\":100.87}]', 5000000, 1),
(280, 'MirrorPark1', 'MirrorPark1', '{\"x\":1302.50,\"y\":-528.92,\"z\":70.53}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1306.47,\"y\":-527.13,\"z\":73.84}', '[{\"model\":520341586,\"x\":1303.43, \"y\":-526.80, \"z\":70.51},\r\n{\"model\":964838196,\"x\":1308.88, \"y\":-512.02, \"z\":70.52}]', 13000000, 1),
(281, 'MirrorPark2', 'MirrorPark2', '{\"x\":1301.24,\"y\":-573.24,\"z\":70.78}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1297.52,\"y\":-574.13,\"z\":74.11}', '[{\"model\":520341586,\"x\":1300.86, \"y\":-574.80, \"z\":70.78},\r\n{\"model\":964838196,\"x\":1296.11, \"y\":-589.82, \"z\":70.78}]', 13000000, 1),
(282, 'MirrorPark3', 'MirrorPark3', '{\"x\":1323.87,\"y\":-582.18,\"z\":72.78}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1319.94,\"y\":-582.73,\"z\":75.62}', '[{\"model\":520341586,\"x\":1323.37, \"y\":-583.57, \"z\":72.30},\r\n{\"model\":964838196,\"x\":1316.43, \"y\":-598.14, \"z\":72.29}]', 20000000, 1),
(283, 'MirrorPark4', 'MirrorPark4', '{\"x\":1347.59,\"y\":-548.07,\"z\":72.94}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1351.94,\"y\":-546.69,\"z\":76.26}', '[{\"model\":964838196,\"x\":1355.16, \"y\":-531.57, \"z\":72.94}]', 13000000, 1),
(284, 'MirrorPark5', 'MirrorPark5', '{\"x\":1366.83,\"y\":-605.25,\"z\":73.77}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1363.91,\"y\":-607.62,\"z\":77.09}', '[{\"model\":520341586,\"x\":1367.42, \"y\":-606.86, \"z\":73.77},\r\n{\"model\":964838196,\"x\":1366.16, \"y\":-622.97, \"z\":73.77}]', 13000000, 1),
(285, 'MirrorPark6', 'MirrorPark6', '{\"x\":1387.89,\"y\":-569.82,\"z\":73.55}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1391.33,\"y\":-571.80,\"z\":76.88}', '[{\"model\":520341586,\"x\":1389.42, \"y\":-569.26, \"z\":73.54},\r\n{\"model\":964838196,\"x\":1404.02, \"y\":-563.30, \"z\":73.55}]', 13000000, 1),
(286, 'MirrorPark7', 'MirrorPark7', '{\"x\":1385.23,\"y\":-592.73,\"z\":73.57}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1385.44,\"y\":-596.98,\"z\":76.86}', '[{\"model\":520341586,\"x\":1386.62, \"y\":-593.71, \"z\":73.54},\r\n{\"model\":964838196,\"x\":1399.06, \"y\":-603.45, \"z\":73.55}]', 13000000, 1),
(288, 'MirrorPark9', 'MirrorPark9', '{\"x\":920.42,\"y\":-571.08,\"z\":57.42}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":921.56,\"y\":-566.27,\"z\":60.74}', '[{\"model\":520341586,\"x\":919.40, \"y\":-569.51, \"z\":57.42},\r\n{\"model\":964838196,\"x\":912.47, \"y\":-554.71, \"z\":57.22}]', 13000000, 1),
(289, 'MirrorPark10', 'MirrorPark10', '{\"x\":961.158,\"y\":-669.30,\"z\":57.49}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":956.97,\"y\":-667.68,\"z\":60.83}', '[{\"model\":520341586,\"x\":959.42, \"y\":-670.30, \"z\":57.50},\r\n{\"model\":964838196,\"x\":945.76, \"y\":-677.58, \"z\":57.50}]', 20000000, 1),
(291, 'VinewoodHillsLake', 'Vinewood Hills Lake', '{\"x\":227.666,\"y\":766.53,\"z\":203.83}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":223.31,\"y\":753.77,\"z\":203.91}', '{\"x\":236.44,\"y\":752.19,\"z\":199.14}', '[{\"model\":1632949967,\"x\":229.62, \"y\":765.71, \"z\":204.03},\r\n{\"model\":-1687047623,\"x\":228.82, \"y\":756.78, \"z\":204.93}]', 1, 1),
(294, 'Chumash1', 'Chumash', '{\"x\":-3214.1697,\"y\":817.55,\"z\":7.98}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-3200.8152,\"y\":836.34,\"z\":7.98}', '{\"x\":-3218.79,\"y\":784.17,\"z\":13.13}', '[{\"model\":308207762,\"x\":-3216.53, \"y\":815.82, \"z\":7.98}]', 1, 1),
(295, 'Licytacja', 'Licytacja', '{\"x\":-658.3524,\"y\":886.4918,\"z\":228.3003}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-651.381,\"y\":887.1215,\"z\":228.2989}', NULL, 15000000, 1),
(296, 'TongvaHills', 'Tongva Hills', '{\"x\":-2588.645,\"y\":1913.14,\"z\":166.54}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-2598.63,\"y\":1889.37,\"z\":162.80}', '[{\"model\":-2044627725,\"x\":-2588.12, \"y\":1910.28, \"z\":166.54},\r\n{\"model\":-2037125725,\"x\":-2594.93, \"y\":1917.20, \"z\"166.35}]', 15000000, 1),
(297, 'RockFordHills', 'Rockford Hills Mad Wayne', '{\"x\":-1094.56,\"y\":427.33,\"z\":74.93}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.14}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.14}', '{\"x\":-1094.56,\"y\":427.33,\"z\":74.93}', '[]', NULL, 1, 1, 0, 0, '{\"x\":-1093.309,\"y\":439.0359,\"z\":74.3363}', '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.54}', NULL, 5000000, 1),
(298, 'WestVinewood', 'West Vinewood', '{\"x\":17.84,\"y\":342.35,\"z\":115.39}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":31.68,\"y\":345.29,\"z\":115.58}', '[{\"model\":-88942360,\"x\":19.09, \"y\":343.40, \"z\":115.70}]', 99999999, 1),
(299, 'Richman', 'Richman', '{\"x\":-1570.21,\"y\"239.69,\"z\":58.64}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1569.27,\"y\":18.55,\"z\":63.67}', '[{\"model\":3963123,\"x\":919.40, \"y\":-569.51, \"z\":57.42},\r\n{\"model\":963213136,\"x\":912.47, \"y\":-554.71, \"z\":57.22},\r\n{\"model\":-780638473,\"x\":-1571.10, \"y\":21.89, \"z\":59.70},\r\n{\"model\":3398153,\"x\":-1570.50, \"y\":21.89, \"z\":59.70}]', 1300000, 1),
(301, 'TrukTruk', 'Rockford Hills Dorset Dr', '{\"x\":-290.3048,\"y\":-431.2168,\"z\":29.2875}', '{\"x\":-139.5198,\"y\":-620.7914,\"z\":167.8703}', '{\"x\":-139.5198,\"y\":-620.7914,\"z\":167.8703}', '{\"x\":-290.3048,\"y\":-431.2168,\"z\":29.2875}', '[]', NULL, 1, 1, 0, 0, '{\"x\":-357.6384,\"y\":-434.0249,\"z\":26.5433}', '{\"x\":-132.2142,\"y\":-634.013,\"z\":167.8705}', NULL, 5000000, 1),
(302, 'Champion', 'Pillbox Hill Peaceful St', '{\"x\":-265.6121,\"y\":-735.4271,\"z\":33.4694}', '{\"x\":-288.2041,\"y\":-722.5544,\"z\":124.5232}', '{\"x\":-288.2041,\"y\":-722.5544,\"z\":124.5232}', '{\"x\":-265.6121,\"y\":-735.4271,\"z\":33.4694}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-270.4279,\"y\":-731.4057,\"z\":124.5233}', NULL, 5000000, 1),
(303, 'BanhamCanyon20', 'BanhamCanyon20', '{\"x\":-2666.09,\"y\":1326.16,\"z\":146.42}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-2674.90,\"y\":1304.31,\"z\":151.06}', '[{\"model\":1901183774,\"x\":-2666.82, \"y\":1326.22, \"z\":146.49},\r\n{\"model\":-1573772550,\"x\":-2652.75, \"y\":1308.12, \"z\":147.49},\r\n{\"model\":-147325430,\"x\":-2667.12, \"y\":1330.42, \"z\":147.49}]', 30000000, 1),
(304, 'GrandSenoraDesert', 'GrandSenoraDesert', '{\"x\":1535.51,\"y\":2231.69,\"z\":76.74}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1547.38,\"y\":2228.24,\"z\":76.84}', '[{\"model\":1573772550,\"x\":1536.55, \"y\":2232.01, \"z\":76.74},\r\n{\"model\":1776046523,\"x\":1537.28, \"y\":2221.65, \"z\":76.83}]', 30000000, 1),
(305, 'WestVinewood1', 'WestVinewood1', '{\"x\":-362.13,\"y\":56.86,\"z\":53.47}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-365.23,\"y\":59.61,\"z\":53.48}', '[{\"model\":-165345653,\"x\":-362.04, \"y\":58.28, \"z\":53.50}]\r\n', 800000, 1),
(306, 'WestVinewood2', 'WestVinewood2', '{\"x\":-350.50,\"y\":56.50,\"z\":53.48}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-347.98,\"y\":59.78,\"z\":53.48}', '[{\"model\":-165345653,\"x\":-350.81, \"y\":58.26, \"z\":53.50}]\r\n', 800000, 1),
(307, 'WestVinewood3', 'WestVinewood3', '{\"x\":-344.02,\"y\":56.45,\"z\":53.48}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-340.95,\"y\":60.56,\"z\":53.48}', '[{\"model\":-165345653,\"x\":-344.01, \"y\":58.18, \"z\":53.48}]\r\n', 800000, 1),
(308, 'WestVinewood4', 'WestVinewood4', '{\"x\":-333.05,\"y\":56.07,\"z\":53.47}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-330.03,\"y\":59.15,\"z\":53.48}', '[{\"model\":-165345653,\"x\":-333.01, \"y\":57.64, \"z\":53.48}]\r\n', 800000, 1),
(309, 'WestVinewood5', 'WestVinewood5', '{\"x\":-330.34,\"y\":52.18,\"z\":57.79}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-327.27,\"y\":54.72,\"z\":57.80}', '[{\"model\":-165345653,\"x\":-329.05, \"y\":52.06, \"z\":57.82}]\r\n', 1000000, 1),
(310, 'WestVinewood6', 'WestVinewood6', '{\"x\":-332.98,\"y\":56.31,\"z\":57.79}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-330.12,\"y\":58.87,\"z\":57.84}', '[{\"model\":-165345653,\"x\":-332.88, \"y\":57.46, \"z\":57.84}]\r\n', 1600000, 1),
(311, 'WestVinewood7', 'WestVinewood7', '{\"x\":-344.18,\"y\":56.91,\"z\":57.84}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-344.17,\"y\":59.68,\"z\":57.84}', '[{\"model\":-165345653,\"x\":-344.96, \"y\":57.96, \"z\":57.84}]\r\n', 1000000, 1),
(312, 'WestVinewood8', 'WestVinewood8', '{\"x\":-350.45,\"y\":57.25,\"z\":57.84}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-347.80,\"y\":59.61,\"z\":57.84}', '[{\"model\":-165345653,\"x\":-350.67, \"y\":58.20, \"z\":57.82}]\r\n', 2000000, 1),
(313, 'WestVinewood9', 'WestVinewood9', '{\"x\":-361.94,\"y\":57.01,\"z\":57.82}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-365.23,\"y\":59.86,\"z\":57.82}', '[{\"model\":-165345653,\"x\":-362.14, \"y\":58.44, \"z\":57.82}]\r\n', 800000, 1),
(314, 'WestVinewood10', 'WestVinewood10', '{\"x\":-366.09,\"y\":53.30,\"z\":57.82}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-368.69,\"y\":55.72,\"z\":57.81}', '[{\"model\":-165345653,\"x\":-367.24, \"y\":53.10, \"z\":57.81}]\r\n', 99999999, 1),
(315, 'BanhamCanyonBeard', 'BanhamCanyonBeard', '{\"x\":-3100.22,\"y\":212.25,\"z\":13.12}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-3093.74,\"y\":207.48,\"z\":16.42}', '[{\"model\":-151228373,\"x\":-3099.19, \"y\":210.77, \"z\":13.06}]\r\n', 9999999, 1),
(316, 'VinewoodHills25', 'VinewoodHills25', '{\"x\":42.87,\"y\":468.09,\"z\":147.14}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":53.74,\"y\":476.48,\"z\":155.38}', '[{\"model\":520341586,\"x\":43.19, \"y\":469.51, \"z\":147.13}]\r\n', 999999999, 1),
(317, 'Lemon', 'Vinewood Mad Wayne Thunder Dr', '{\"x\":-1120.5033,\"y\":484.461,\"z\":81.2107}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-1112.6941,\"y\":479.93,\"z\":81.2106}', '{\"x\":-1109.8514,\"y\":494.7426,\"z\":85.5343}', '[{\"model\":-1516927114,\"x\":-122.477, \"y\":486.7159, \"z\":82.36565}]', 15000000, 1),
(318, 'BayCityAvenue', 'BayCityAvenue', '{\"x\":-1311.0711,\"y\":-931.2374,\"z\":12.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1312.6466,\"y\":-934.6787,\"z\":12.4585}', '[{\"model\":-580006562,\"x\":-1310.6468, \"y\":-932.30, \"z\":13.3219}]', 1000000, 1),
(319, 'BayCityAvenue1', 'BayCityAvenue1', '{\"x\":-1318.0211,\"y\":-934.2374,\"z\":12.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1314.1746,\"y\":-937.3787,\"z\":12.4585}', '[{\"model\":-580006562,\"x\":-1317.7468, \"y\":-934.70, \"z\":13.3219}]', 800000, 1),
(320, 'BayCityAvenue2', 'BayCityAvenue2', '{\"x\":-1319.8211,\"y\":-934.8374,\"z\":12.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1318.946,\"y\":-939.2987,\"z\":12.4585}', '[{\"model\":-580006562,\"x\":-1319.5468, \"y\":-935.40, \"z\":13.3219}]', 2000000, 1),
(321, 'BayCityAvenue3', 'BayCityAvenue3', '{\"x\":-1329.4211,\"y\":-938.2374,\"z\":11.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1325.756,\"y\":-941.2187,\"z\":11.4585}', '[{\"model\":-580006562,\"x\":-1329.0468, \"y\":-939.16, \"z\":12.3219}]', 800000, 1),
(322, 'BayCityAvenue4', 'BayCityAvenue4', '{\"x\":-1331.3311,\"y\":-938.9374,\"z\":11.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1330.146,\"y\":-943.2187,\"z\":11.4585}', '[{\"model\":-580006562,\"x\":-1330.9268, \"y\":-939.66, \"z\":12.3219}]', 800000, 1),
(323, 'BayCityAvenue5', 'BayCityAvenue5', '{\"x\":-1337.3811,\"y\":-941.0874,\"z\":11.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1334.666,\"y\":-944.2187,\"z\":11.4585}', '[{\"model\":-580006562,\"x\":-1337.9268, \"y\":-942.66, \"z\":12.3219}]', 800000, 1),
(324, 'BayCityAvenue6', 'BayCityAvenue6', '{\"x\":-1339.1411,\"y\":-940.3674,\"z\":11.5195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1343.066,\"y\":-942.4187,\"z\":11.4585}', '[{\"model\":-580006562,\"x\":-1339.6368, \"y\":-941.72, \"z\":12.3219}]', 1000000, 1),
(325, 'BayCityAvenue7', 'BayCityAvenue7', '{\"x\":-1310.9911,\"y\":-931.5674,\"z\":15.4195}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1309.826,\"y\":-935.7187,\"z\":15.4585}', '[{\"model\":-580006562,\"x\":-1310.6068, \"y\":-932.27, \"z\":16.3519}]', 800000, 1),
(326, 'BayCityAvenue8', 'BayCityAvenue8', '{\"x\":-1318.0111,\"y\":-934.2274,\"z\":15.4095}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1314.3059,\"y\":-937.4997,\"z\":15.4085}', '[{\"model\":-580006562,\"x\":-1317.7168, \"y\":-934.73, \"z\":16.3519}]', 1000000, 1),
(327, 'BayCityAvenue9', 'BayCityAvenue9', '{\"x\":-1319.9011,\"y\":-934.8274,\"z\":15.4095}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1318.6959,\"y\":-939.0997,\"z\":15.4085}', '[{\"model\":-580006562,\"x\":-1319.6068, \"y\":-935.59, \"z\":16.3519}]', 800000, 1),
(328, 'BayCityAvenue10', 'BayCityAvenue10', '{\"x\":-1329.3511,\"y\":-938.8274,\"z\":14.4095}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1325.6059,\"y\":-941.5297,\"z\":14.4085}', '[{\"model\":-580006562,\"x\":-1328.2468, \"y\":-939.00, \"z\":15.4019}]', 1000000, 1),
(329, 'BayCityAvenue11', 'BayCityAvenue11', '{\"x\":-1331.2111,\"y\":-939.1374,\"z\":14.4095}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1329.9859,\"y\":-943.3297,\"z\":14.4085}', '[{\"model\":-580006562,\"x\":-1330.9568, \"y\":-939.720, \"z\":15.4019}]', 800000, 1),
(330, 'BayCityAvenue12', 'BayCityAvenue12', '{\"x\":-1338.3011,\"y\":-941.5574,\"z\":14.4095}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1334.4359,\"y\":-944.6297,\"z\":14.4085}', '[{\"model\":-580006562,\"x\":-1337.9268, \"y\":-942.450, \"z\":15.4019}]', 800000, 1),
(331, 'VinewoodHills167', 'VinewoodHills167', '{\"x\":-722.2501,\"y\":489.7688,\"z\":108.435}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-741.4952,\"y\":504.7612,\"z\":108.6197}', '[{\"model\":1051049560,\"x\":-723.8928, \"y\":502.59, \"z\":109.4119}]\r\n', 10000000, 1),
(332, 'AceJonesDrive845', 'AceJonesDrive845', '{\"x\":-1539.5975,\"y\":420.9521,\"z\":109.100}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-1545.3267,\"y\":422.0379,\"z\":108.7117}\r\n\r\n', '[{\"model\":308207762,\"x\":-1539.6326, \"y\":420.21, \"z\":110.0919}]\r\n', 15000000, 1),
(333, 'MiltonRoad898', 'MiltonRoad898', '{\"x\":-536.658,\"y\":818.7819,\"z\":196.560}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-551.6412,\"y\":830.7493,\"z\":196.8282}', '{\"x\":-555.7519,\"y\":807.916,\"z\":196.6072}\r\n\r\n', '[{\"model\":-1922281023,\"x\":-539.982, \"y\":802.60, \"z\":197.7219},\r\n{\"model\":224975209,\"x\":-537.0147, \"y\":817.7392, \"z\":197.7529}]', 99999999, 1);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `is_open`, `garage`, `room_menu`, `doors`, `price`, `is_available`) VALUES
(334, 'PacificBlufs10', 'PacificBlufs10', '{\"x\":-2010.43,\"y\":445.50,\"z\":102.06}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-2009.38,\"y\":455.34,\"z\":101.70}', '{\"x\":-2015.85,\"y\":443.66,\"z\":104.92}', '[{\"model\":520341586,\"x\":1367.42, \"y\":-606.86, \"z\":73.77},{\"model\":942022108,\"x\":-2011.82, \"y\":445.09, \"z\":102.05}]\r\n', 9999999, 1),
(335, 'SouthMoMiltonDrive875', 'SouthMoMiltonDrive875', '{\"x\":-947.75,\"y\":567.83,\"z\":100.75}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-956.04,\"y\":555.81,\"z\":104.15}', '[{\"model\":-711771128,\"x\":-947.96, \"y\":567.20, \"z\":101.71}]\r\n', 50000000, 1),
(337, 'PaletoBayProcopio1', 'PaletoBayProcopio1', '{\"x\":-129.82,\"y\":6550.9692,\"z\":28.5729}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-125.34,\"y\":6565.22,\"z\":28.53}', '{\"x\":-140.89,\"y\":6568.32,\"z\":27.03}', '[{\"model\":-1516927114,\"x\":-131.384, \"y\":6552.45, \"z\":29.28}]\r\n', 30000000, 1),
(339, 'lapuerta', 'La Puerta 1', '{\"x\":-1109.48,\"y\":-1481.55,\"z\":3.95}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1110.56,\"y\":-1480.51,\"z\":3.93}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(340, 'lapuert1', 'La Puerta 2', '{\"x\":-1118.26,\"y\":-1487.78,\"z\":3.76}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1119.22,\"y\":-1486.41,\"z\":3.73}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(342, 'lapuert3', 'La Puerta 3', '{\"x\":-1130.26,\"y\":-1496.38,\"z\":3.48}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1131.09,\"y\":-1495.42,\"z\":3.45}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(343, 'lapuert4', 'La Puerta 4', '{\"x\":-1116.63,\"y\":-1506.14,\"z\":3.45}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1116.01,\"y\":-1506.99,\"z\":3.51}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(344, 'lapuert5', 'La Puerta 5', '{\"x\":-1110.86,\"y\":-1498.42,\"z\":3.72}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1110.51,\"y\":-1499.72,\"z\":3.73}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(345, 'lapuert6', 'La Puerta 6', '{\"x\":-1102.16,\"y\":-1492.24,\"z\":3.93}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1101.37,\"y\":-1493.03,\"z\":3.94}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(346, 'lapuert7', 'La Puerta 7', '{\"x\":-1085.96,\"y\":-1503.72,\"z\":4.75}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1086.82,\"y\":-1502.29,\"z\":4.02}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 30000000, 1),
(347, 'lapuert8', 'La Puerta 8', '{\"x\":-1108.66,\"y\":-1527.57,\"z\":5.82}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1108.65,\"y\":-1528.65,\"z\":5.82}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(348, 'lapuert9', 'La Puerta 9', '{\"x\":-1102.41,\"y\":-1537.23,\"z\":3.43}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1101.51,\"y\":-1538.53,\"z\":3.43}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(349, 'lapuert10', 'La Puerta 10', '{\"x\":-1087.35,\"y\":-1529.13,\"z\":3.74}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1085.38,\"y\":-1530.57,\"z\":3.74}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(350, 'lapuert11', 'La Puerta 11', '{\"x\":-1078.35,\"y\":-1524.36,\"z\":3.93}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1077.71,\"y\":-1525.45,\"z\":3.92}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(351, 'lapuert12', 'La Puerta 12', '{\"x\":-1069.80,\"y\":-1514.92,\"z\":4.15}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1068.77,\"y\":-1514.18,\"z\":4.14}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(352, 'lapuert13', 'La Puerta 13', '{\"x\":-1084.86,\"y\":-1558.48,\"z\":3.54}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1085.58,\"y\":-1557.44,\"z\":3.49}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 1300000, 1),
(356, 'lapuert17', 'La Puerta 17', '{\"x\":-1056.81,\"y\":-1587.72,\"z\":3.65}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1056.45,\"y\":-1589.0604,\"z\":3.65}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 2000000, 1),
(359, 'lapuert20', 'La Puerta 20', '{\"x\":-1038.75,\"y\":-1609.855,\"z\":4.048}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-1037.83,\"y\":-1609.6393,\"z\":4.06}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 30000000, 1),
(360, 'lapuert21', 'La Puerta 21', '{\"x\":-857.66,\"y\":-1282.1545,\"z\":5.250}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-857.87,\"y\":-1281.6941,\"z\":5.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 2000000, 1),
(361, 'lapuert22', 'La Puerta 22', '{\"x\":-868.53,\"y\":-1286.1838,\"z\":5.250}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-868.97,\"y\":-1285.5645,\"z\":5.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 30000000, 1),
(362, 'lapuert23', 'La Puerta 23', '{\"x\":-891.43,\"y\":-1294.5626,\"z\":5.250}', '{\"x\":-1039.39,\"y\":-1149.33,\"z\":-91.91}', '{\"x\":-1041.23,\"y\":-1146.15,\"z\":-89.91}', '{\"x\":-891.04,\"y\":-1293.692,\"z\":5.25}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-1046.65,\"y\":-1149.47,\"z\":-89.9}', NULL, 30000000, 1),
(365, 'SandyShores1', 'SandyShores1', '{\"x\":1513.13,\"y\":3566.48,\"z\":34.44}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1512.56,\"y\":3576.06,\"z\":34.48}', '[{\"model\":-543490328,\"x\":1512.22, \"y\":3567.93, \"z\":34.48}]\r\n', 1300000, 1),
(366, 'SandyShores2', 'SandyShores2', '{\"x\":1521.25,\"y\":3570.95,\"z\":34.48}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1513.41,\"y\":3577.53,\"z\":34.47}', '[{\"model\":-543490328,\"x\":1520.33, \"y\":3572.37, \"z\":34.47}]\r\n', 1300000, 1),
(367, 'SandyShores3', 'SandyShores3', '{\"x\":1522.77,\"y\":3571.81,\"z\":34.47}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1520.77,\"y\":3581.62,\"z\":34.48}', '[{\"model\":-543490328,\"x\":1521.99, \"y\":3572.25, \"z\":34.48}]\r\n', 1300000, 1),
(368, 'SandyShores4', 'SandyShores4', '{\"x\":1530.82,\"y\":3576.31,\"z\":34.45}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1523.39,\"y\":3583.45,\"z\":34.45}', '[{\"model\":-543490328,\"x\":1529.91, \"y\":3577.92, \"z\":34.45}]\r\n', 1300000, 1),
(369, 'SandyShores5', 'SandyShores5', '{\"x\":1537.43,\"y\":3580.35,\"z\":34.43}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1535.56,\"y\":3589.91,\"z\":34.44}', '[{\"model\":-543490328,\"x\":1536.56, \"y\":3581.85, \"z\":34.44}]\r\n', 1300000, 1),
(370, 'SandyShores6', 'SandyShores6', '{\"x\":1545.34,\"y\":3585.02,\"z\":34.43}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1537.88,\"y\":3591.39,\"z\":34.46}', '[{\"model\":-543490328,\"x\":1544.46, \"y\":3586.22, \"z\":34.44}]\r\n', 1300000, 1),
(371, 'SandyShores7', 'SandyShores7', '{\"x\":1546.93,\"y\":3585.90,\"z\":34.43}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1544.99,\"y\":3595.51,\"z\":34.44}', '[{\"model\":-543490328,\"x\":1546.346, \"y\":3587.314, \"z\":35.3908', 1300000, 1),
(372, 'SandyShores8', 'SandyShores8', '{\"x\":1555.22,\"y\":3590.57,\"z\":34.42}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1547.44,\"y\":3597.46,\"z\":34.49}', '[{\"model\":-543490328,\"x\":1554.24, \"y\":3591.87, \"z\":34.49}]\r\n', 1300000, 1),
(373, 'SandyShores9', 'SandyShores9', '{\"x\":1558.90,\"y\":3593.12,\"z\":34.44}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1557.10,\"y\":3602.73,\"z\":34.47}', '[{\"model\":-543490328,\"x\":1558.04, \"y\":3594.33, \"z\":34.47}]\r\n', 1300000, 1),
(374, 'SandyShores10', 'SandyShores10', '{\"x\":1566.88,\"y\":3597.51,\"z\":34.43}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1559.20,\"y\":3603.69,\"z\":34.46}', '[{\"model\":-543490328,\"x\":1566.03, \"y\":3598.78, \"z\":34.46}]\r\n', 1300000, 1),
(375, 'SandyShores11', 'SandyShores11', '{\"x\":1512.96,\"y\":3566.08,\"z\":37.77}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1511.09,\"y\":3576.25,\"z\":37.77}', '[{\"model\":-543490328,\"x\":1512.5957, \"y\":3567.4131, \"z\":37.7767}]', 1300000, 1),
(376, 'SandyShores12', 'SandyShores12', '{\"x\":1512.96,\"y\":3566.08,\"z\":37.77}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1511.09,\"y\":3576.25,\"z\":37.77}', '[{\"model\":-543490328,\"x\":1512.24, \"y\":3567.88, \"z\":37.77}]\r\n', 1300000, 1),
(377, 'SandyShores13', 'SandyShores13', '{\"x\":1520.97,\"y\":3571.02,\"z\":37.77}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1513.23,\"y\":3577.59,\"z\":37.78}', '[{\"model\":-543490328,\"x\":1520.43, \"y\":3572.24, \"z\":37.84}]\r\n', 1300000, 1),
(378, 'SandyShores14', 'SandyShores14', '{\"x\":1522.71,\"y\":3572.09,\"z\":37.77}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1520.78,\"y\":3581.59,\"z\":37.78}', '[{\"model\":-543490328,\"x\":1522.11, \"y\":3573.26, \"z\":37.84}]\r\n', 1300000, 1),
(379, 'SandyShores15', 'SandyShores15', '{\"x\":1530.641,\"y\":3576.699,\"z\":38.72703}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1522.958,\"y\":3582.822,\"z\":38.70776}', '[{\"model\":-543490328,\"x\":1529.935, \"y\":3577.831, \"z\":38.72704}]\r\n', 1300000, 1),
(380, 'SandyShores16', 'SandyShores16', '{\"x\":1537.214,\"y\":3580.535,\"z\":38.73005}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1535.581,\"y\":3590.213,\"z\":38.70974}', '[{\"model\":-543490328,\"x\":1536.546, \"y\":3581.699, \"z\":38.73005}]\r\n', 1300000, 1),
(381, 'SandyShores17', 'SandyShores17', '{\"x\":1545.142,\"y\":3585.159,\"z\":38.73009}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1537.491,\"y\":3591.378,\"z\":38.73132}', '[{\"model\":-543490328,\"x\":1544.691, \"y\":3586.033, \"z\":38.73009}]\r\n', 1300000, 1),
(382, 'SandyShores18', 'SandyShores18', '{\"x\":1546.859,\"y\":3586.211,\"z\":38.73009}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1545.161,\"y\":3595.822,\"z\":38.7097}', '[{\"model\":-543490328,\"x\":1546.335, \"y\":3587.032, \"z\":38.73009}]\r\n', 1300000, 1),
(383, 'SandyShores19', 'SandyShores19', '{\"x\":1554.876,\"y\":3590.739,\"z\":38.73009}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1547.071,\"y\":3596.998,\"z\":38.70775}', '[{\"model\":-543490328,\"x\":1554.19, \"y\":3591.842, \"z\":38.73009}]\r\n', 1300000, 1),
(384, 'SandyShores20', 'SandyShores20', '{\"x\":1558.714,\"y\":3593.005,\"z\":38.73008}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1556.898,\"y\":3601.841,\"z\":38.70938}', '[{\"model\":-543490328,\"x\":1558.129, \"y\":3593.911, \"z\":38.73009}]\r\n', 1300000, 1),
(385, 'SandyShores21', 'SandyShores21', '{\"x\":1566.733,\"y\":3597.501,\"z\":38.73005}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1558.886,\"y\":3603.903,\"z\":38.70776}', '[{\"model\":-543490328,\"x\":1566.054, \"y\":3598.609, \"z\":38.73005}]\r\n', 1300000, 1),
(386, 'SandyShores22', 'SandyShores22', '{\"x\":1572.426,\"y\":3614.419,\"z\":35.38733}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1582.111,\"y\":3616.154,\"z\":35.41921}', '[{\"model\":-543490328,\"x\":1573.532, \"y\":3615.101, \"z\":35.38733}]\r\n', 1300000, 1),
(387, 'SandyShores25', 'SandyShores25', '{\"x\":1582.589,\"y\":3596.798,\"z\":34.4372}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1588.922,\"y\":3604.533,\"z\":34.4807}', '[{\"model\":-543490328,\"x\":1583.728, \"y\":3597.435, \"z\":35.38716}]\r\n', 1300000, 1),
(388, 'SandyShores23', 'SandyShores23', '{\"x\":1577.012,\"y\":3606.539,\"z\":35.38849}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1583.391,\"y\":3614.228,\"z\":35.42438}', '[{\"model\":-543490328,\"x\":1578.156, \"y\":3607.161, \"z\":35.38849}]\r\n', 1300000, 1),
(389, 'SandyShores24', 'SandyShores24', '{\"x\":1578.208,\"y\":3604.842,\"z\":35.39511}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1587.743,\"y\":3606.4,\"z\":35.41956}', '[{\"model\":-543490328,\"x\":1579.057, \"y\":3605.332, \"z\":35.39534}]\r\n', 1300000, 1),
(390, 'SandyShores26', 'SandyShores26', '{\"x\":1586.382,\"y\":3590.204,\"z\":35.38636}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1596.047,\"y\":3591.982,\"z\":35.43631}', '[{\"model\":-543490328,\"x\":1587.473, \"y\":3590.91, \"z\":35.38636}]\r\n', 1300000, 1),
(391, 'SandyShores27', 'SandyShores27', '{\"x\":1591.147,\"y\":3582.399,\"z\":35.39439}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1597.489,\"y\":3590.086,\"z\":35.43448}', '[{\"model\":-543490328,\"x\":1592.042, \"y\":3582.89, \"z\":35.39595}]\r\n', 1300000, 1),
(392, 'SandyShores28', 'SandyShores28', '{\"x\":1592.017,\"y\":3580.593,\"z\":35.38922}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1601.781,\"y\":3582.363,\"z\":35.43623}', '[{\"model\":-543490328,\"x\":1593.134, \"y\":3581.258, \"z\":35.38922}]\r\n', 1300000, 1),
(393, 'SandyShores29', 'SandyShores29', '{\"x\":1596.36,\"y\":3572.386,\"z\":35.37679}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1602.809,\"y\":3580.36,\"z\":35.43448}', '[{\"model\":-543490328,\"x\":1597.772, \"y\":3573.28, \"z\":35.37809}]\r\n', 1300000, 1),
(394, 'SandyShores30', 'SandyShores30', '{\"x\":1599.13,\"y\":3568.881,\"z\":35.39993}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1608.381,\"y\":3570.345,\"z\":35.43671}', '[{\"model\":-543490328,\"x\":1599.959, \"y\":3569.394, \"z\":35.39993}]\r\n', 1300000, 1),
(395, 'SandyShores31', 'SandyShores31', '{\"x\":1603.462,\"y\":3560.729,\"z\":35.38857}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1609.702,\"y\":3568.467,\"z\":35.43448}', '[{\"model\":-543490328,\"x\":1604.544, \"y\":3561.45, \"z\":35.38857}]\r\n', 1300000, 1),
(396, 'SandyShores32', 'SandyShores32', '{\"x\":1603.557,\"y\":3560.823,\"z\":38.69086}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1609.807,\"y\":3568.589,\"z\":38.71289}', '[{\"model\":-543490328,\"x\":1604.392, \"y\":3561.327, \"z\":38.69086}]\r\n', 1300000, 1),
(397, 'SandyShores33', 'SandyShores33', '{\"x\":1599.082,\"y\":3568.83,\"z\":38.69085}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1608.717,\"y\":3570.529,\"z\":38.73641}', '[{\"model\":-543490328,\"x\":1599.917, \"y\":3569.333, \"z\":38.69085}]\r\n', 1300000, 1),
(401, 'SandyShores35', 'SandyShores35', '{\"x\":1591.983,\"y\":3580.663,\"z\":38.69085}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1601.777,\"y\":3582.253,\"z\":38.73684}', '[{\"model\":-543490328,\"x\":1593.119, \"y\":3581.296, \"z\":37.69085}]\r\n', 1300000, 1),
(402, 'SandyShores36', 'SandyShores36', '{\"x\":1591.11,\"y\":3582.329,\"z\":38.69085}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1597.218,\"y\":3590.046,\"z\":38.71288}', '[{\"model\":-543490328,\"x\":1591.978, \"y\":3582.773, \"z\":37.69085}]\r\n', 1300000, 1),
(403, 'SandyShores37', 'SandyShores37', '{\"x\":1586.386,\"y\":3590.216,\"z\":38.69085}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1596.047,\"y\":3591.965,\"z\":38.73661}', '[{\"model\":-543490328,\"x\":1587.495, \"y\":3590.939, \"z\":37.69085}]\r\n', 1300000, 1),
(404, 'SandyShores38', 'SandyShores38', '{\"x\":1582.621,\"y\":3596.795,\"z\":37.7813}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1588.882,\"y\":3604.619,\"z\":37.7628}', '[{\"model\":-543490328,\"x\":1583.742, \"y\":3597.453, \"z\":37.7313}]\r\n', 1300000, 1),
(405, 'SandyShores39', 'SandyShores39', '{\"x\":1578.036,\"y\":3604.733,\"z\":38.73135}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1587.941,\"y\":3606.628,\"z\":38.7364}', '[{\"model\":-543490328,\"x\":1579.08, \"y\":3605.508, \"z\":37.73135}]\r\n', 1300000, 1),
(406, 'SandyShores40', 'SandyShores40', '{\"x\":1576.959,\"y\":3606.299,\"z\":38.73134}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1583.474,\"y\":3614.293,\"z\":38.71293}', '[{\"model\":-543490328,\"x\":1578.052, \"y\":3607.002, \"z\":37.73134}]\r\n', 1300000, 1),
(407, 'SandyShores41', 'SandyShores41', '{\"x\":1572.515,\"y\":3614.576,\"z\":38.73135}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":1582.368,\"y\":3616.34,\"z\":38.73633}', '[{\"model\":-543490328,\"x\":1573.37, \"y\":3615.085, \"z\":37.73135}]\r\n', 1300000, 1),
(410, 'Sliwa ', 'Pillbox Hill Peaceful St 1', '{\"x\":-305.0695,\"y\":-721.1398,\"z\":27.0787}', '{\"x\":-288.2041,\"y\":-722.5544,\"z\":124.5232}', '{\"x\":-288.2041,\"y\":-722.5544,\"z\":124.5232}', '{\"x\":-306.4203,\"y\":-724.2571,\"z\":27.0811}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-270.4279,\"y\":-731.4057,\"z\":124.5233}', NULL, 15000000, 1),
(411, 'RanczoMelina1', 'RanczoMelina1', '{\"x\":566.41296386719,\"y\":-1777.7565917969,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":567.03277587891,\"y\":-1776.3961181641,\"z\":28.135860443115}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(412, 'RanczoMelina2', 'RanczoMelina2', '{\"x\":550.74224853516,\"y\":-1775.6422119141,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":552.05798339844,\"y\":-1776.51171875,\"z\":28.173025131226}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 1000000, 1),
(413, 'RanczoMelina3', 'RanczoMelina3', '{\"x\":552.77679443359,\"y\":-1771.7965087891,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":554.29870605469,\"y\":-1772.4191894531,\"z\":28.173343658447}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 2000000, 1),
(414, 'RanczoMelina4', 'RanczoMelina4', '{\"x\":555.32891845703,\"y\":-1766.4132080078,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":555.88439941406,\"y\":-1766.9254150391,\"z\":28.314624786377}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(415, 'RanczoMelina5', 'RanczoMelina5', '{\"x\":558.40447998047,\"y\":-1759.9083251953,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":559.28601074219,\"y\":-1760.4693603516,\"z\":28.168279647827}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 1000000, 1),
(416, 'RanczoMelina6', 'RanczoMelina6', '{\"x\":562.10736083984,\"y\":-1752.1776123047,\"z\":28.362}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":562.95550537109,\"y\":-1752.6788330078,\"z\":28.15852355957}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(417, 'RanczoMelina7', 'RanczoMelina7', '{\"x\":559.9873046875,\"y\":-1775.7418212891,\"z\":32.5308}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":560.38043212891,\"y\":-1774.7000732422,\"z\":32.480815887451}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(418, 'RanczoMelina8', 'RanczoMelina8', '{\"x\":558.59979248047,\"y\":-1776.3568115234,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":559.96112060547,\"y\":-1775.5726318359,\"z\":32.480808258057}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(419, 'RanczoMelina9', 'RanczoMelina9', '{\"x\":550.47253417969,\"y\":-1770.9416503906,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":551.07482910156,\"y\":-1771.5988769531,\"z\":32.442626953125}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 1000000, 1),
(420, 'RanczoMelina10', 'RanczoMelina10', '{\"x\":552.77819824219,\"y\":-1765.3952636719,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":553.62072753906,\"y\":-1765.8189697266,\"z\":32.44261932373}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(421, 'RanczoMelina11', 'RanczoMelina11', '{\"x\":555.94683837891,\"y\":-1758.9779052734,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":555.92022705078,\"y\":-1760.2438964844,\"z\":32.44261932373}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 1000000, 1),
(422, 'RanczoMelina12', 'RanczoMelina12', '{\"x\":559.62396240234,\"y\":-1751.0832519531,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":559.28479003906,\"y\":-1752.8532714844,\"z\":32.44261932373}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 800000, 1),
(423, 'RanczoMelina13', 'RanczoMelina13', '{\"x\":561.6435546875,\"y\":-1747.3101806641,\"z\":32.4926}', '{\"x\":562.79016113281,\"y\":-1766.6586914062,\"z\":-49.0127}', '{\"x\":563.10510253906,\"y\":-1765.5826416016,\"z\":-49.062648773193}', '{\"x\":560.90405273438,\"y\":-1749.0421142578,\"z\":32.44261932373}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":563.38983154297,\"y\":-1760.8623046875,\"z\":-49.0127}', '', 1000000, 1),
(424, 'Ranczo2Melina1', 'Ranczo2Melina1', '{\"x\":460.90365600586,\"y\":-1573.7663574219,\"z\":31.837}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":461.80798339844,\"y\":-1574.3466796875,\"z\":32.792114257812}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 1000000, 1),
(425, 'Ranczo2Melina2', 'Ranczo2Melina2', '{\"x\":465.77993774414,\"y\":-1567.4625244141,\"z\":31.8423}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":465.01931762695,\"y\":-1569.01171875,\"z\":31.792324066162}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 800000, 1),
(426, 'Ranczo2Melina3', 'Ranczo2Melina3', '{\"x\":471.10043334961,\"y\":-1561.4327392578,\"z\":31.8423}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":472.18832397461,\"y\":-1562.5406494141,\"z\":31.792331695557}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 1000000, 1),
(427, 'Ranczo2Melina4', 'Ranczo2Melina4', '{\"x\":467.11645507812,\"y\":-1590.20703125,\"z\":31.8423}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":467.83383178711,\"y\":-1588.9019775391,\"z\":31.792072296143}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 1000000, 1),
(428, 'Ranczo2Melina5', 'Ranczo2Melina5', '{\"x\":461.1096496582,\"y\":-1585.0146484375,\"z\":31.8421}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":462.97564697266,\"y\":-1586.2496337891,\"z\":31.792037963867}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 1000000, 1),
(429, 'Ranczo2Melina6', 'Ranczo2Melina6', '{\"x\":455.04336547852,\"y\":-1579.8254394531,\"z\":31.842}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":455.73135375977,\"y\":-1578.7921142578,\"z\":31.792011260986}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 100000, 1),
(430, 'Ranczo2Melina7', 'Ranczo2Melina7', '{\"x\":442.4274597168,\"y\":-1569.4417724609,\"z\":31.8423}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":440.38604736328,\"y\":-1567.5657958984,\"z\":31.792278289795}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 800000, 1),
(431, 'Ranczo2Melina8', 'Ranczo2Melina8', '{\"x\":436.36416625977,\"y\":-1564.5085449219,\"z\":31.8423}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":434.79837036133,\"y\":-1562.9814453125,\"z\":31.792327880859}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 800000, 1),
(432, 'Ranczo2Melina9', 'Ranczo2Melina9', '{\"x\":430.50567626953,\"y\":-1558.9366455078,\"z\":31.8422}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":432.29614257812,\"y\":-1558.9375,\"z\":31.792110443115}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 1000000, 1),
(433, 'Ranczo2Melina10', 'Ranczo2Melina10', '{\"x\":479.99111938477,\"y\":-1553.025390625,\"z\":28.3326}', '{\"x\":446.02563476562,\"y\":-1572.9571533203,\"z\":-38.6421}', '{\"x\":446.47613525391,\"y\":-1570.9812011719,\"z\":-38.692100524902}', '{\"x\":481.20401000977,\"y\":-1551.8182373047,\"z\":28.282619476318}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":447.03515625,\"y\":-1566.4908447266,\"z\":-38.6421}', '', 800000, 1),
(462, 'StrawnerryMelina1', 'StrawnerryMelina1', '{\"x\":-35.544826507568,\"y\":-1555.1030273438,\"z\":29.7267}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-34.646591186523,\"y\":-1554.0933837891,\"z\":29.676740646362}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(463, 'StrawnerryMelina2', 'StrawnerryMelina2', '{\"x\":-44.548774719238,\"y\":-1547.2766113281,\"z\":30.4958}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-42.848659515381,\"y\":-1548.1147460938,\"z\":29.687532424927}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(464, 'StrawnerryMelina3', 'StrawnerryMelina3', '{\"x\":-35.699970245361,\"y\":-1537.2880859375,\"z\":30.0977}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-35.004859924316,\"y\":-1538.1666259766,\"z\":29.693084716797}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(465, 'StrawnerryMelina4', 'StrawnerryMelina4', '{\"x\":-26.823406219482,\"y\":-1544.6237792969,\"z\":29.7268}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-27.950796127319,\"y\":-1546.2884521484,\"z\":29.686855316162}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(466, 'StrawnerryMelina5', 'StrawnerryMelina5', '{\"x\":-19.836977005005,\"y\":-1550.7807617188,\"z\":29.7268}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-21.480554580688,\"y\":-1550.3439941406,\"z\":29.676755905151}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(467, 'StrawnerryMelina6', 'StrawnerryMelina6', '{\"x\":-25.056470870972,\"y\":-1556.6844482422,\"z\":29.7368}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-26.136024475098,\"y\":-1555.8562011719,\"z\":29.68684387207}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(468, 'StrawnerryMelina7', 'StrawnerryMelina7', '{\"x\":-33.734764099121,\"y\":-1566.8391113281,\"z\":32.0714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-34.986885070801,\"y\":-1565.9411621094,\"z\":32.021389007568}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(469, 'StrawnerryMelina8', 'StrawnerryMelina8', '{\"x\":-35.471420288086,\"y\":-1554.9008789062,\"z\":32.8714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-35.053798675537,\"y\":-1554.4947509766,\"z\":32.821384429932}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(470, 'StrawnerryMelina9', 'StrawnerryMelina9', '{\"x\":-44.190956115723,\"y\":-1547.1730957031,\"z\":33.6714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-43.231433868408,\"y\":-1548.314453125,\"z\":33.621421813965}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(471, 'StrawnerryMelina10', 'StrawnerryMelina10', '{\"x\":-35.869171142578,\"y\":-1537.1964111328,\"z\":33.6714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-34.579818725586,\"y\":-1538.4614257812,\"z\":33.621421813965}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(472, 'StrawnerryMelina11', 'StrawnerryMelina11', '{\"x\":-26.844848632812,\"y\":-1544.5321044922,\"z\":32.8714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-26.016551971436,\"y\":-1545.3758544922,\"z\":32.821422576904}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(473, 'StrawnerryMelina12', 'StrawnerryMelina12', '{\"x\":-14.595821380615,\"y\":-1543.6057128906,\"z\":32.0716}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-15.410829544067,\"y\":-1543.0556640625,\"z\":32.021389007568}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(474, 'StrawnerryMelina13', 'StrawnerryMelina13', '{\"x\":-19.797861099243,\"y\":-1550.5556640625,\"z\":32.8714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-21.074781417847,\"y\":-1549.6800537109,\"z\":32.821380615234}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(475, 'StrawnerryMelina14', 'StrawnerryMelina14', '{\"x\":-28.490934371948,\"y\":-1560.8553466797,\"z\":32.8714}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-29.638465881348,\"y\":-1559.26953125,\"z\":32.821384429932}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(477, 'ChamberlainHillsMelina2', 'ChamberlainHillsMelina2', '{\"x\":-71.433715820312,\"y\":-1508.4317626953,\"z\":32.4861}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-71.525650024414,\"y\":-1510.5915527344,\"z\":32.436126708984}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(478, 'ChamberlainHillsMelina3', 'ChamberlainHillsMelina3', '{\"x\":-65.296829223633,\"y\":-1513.4421386719,\"z\":32.4861}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-66.009071350098,\"y\":-1514.0266113281,\"z\":32.436141967773}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(479, 'ChamberlainHillsMelina4', 'ChamberlainHillsMelina4', '{\"x\":-60.388687133789,\"y\":-1517.5684814453,\"z\":32.4861}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-61.549774169922,\"y\":-1518.7044677734,\"z\":32.445861816406}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(480, 'ChamberlainHillsMelina5', 'ChamberlainHillsMelina5', '{\"x\":-53.834766387939,\"y\":-1523.5510253906,\"z\":32.4861}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-55.611839294434,\"y\":-1523.5196533203,\"z\":32.445861816406}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 1000000, 1),
(481, 'ChamberlainHillsMelina6', 'ChamberlainHillsMelina6', '{\"x\":-59.568370819092,\'y\":-1530.6134033203,\"z\":33.2852}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-61.03422164917,\"y\":-1529.2747802734,\"z\":33.235214233398}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(482, 'ChamberlainHillsMelina7', 'ChamberlainHillsMelina7', '{\"x\":-61.828132629395,\"y\":-1532.1666259766,\"z\":33.2852}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-61.340980529785,\"y\":-1530.3311767578,\"z\":33.235229492188}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(483, 'ChamberlainHillsMelina8', 'ChamberlainHillsMelina8', '{\"x\":-68.765060424805,\"y\":-1526.0717773438,\"z\":33.2853}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-67.810073852539,\"y\":-1525.0654296875,\"z\":33.245265960693}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(484, 'ChamberlainHillsMelina9', 'ChamberlainHillsMelina9', '{\"x\":-77.408004760742,\"y\":-1515.4981689453,\"z\":36.4696}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-78.012832641602,\"y\":-1516.7420654297,\"z\":36.419616699219}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(485, 'ChamberlainHillsMelina10', 'ChamberlainHillsMelina10', '{\"x\":-71.25764465332,\"y\":-1508.5778808594,\"z\":35.6749}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-70.258010864258,\"y\":-1509.7507324219,\"z\":35.62491607666}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(486, 'ChamberlainHillsMelina11', 'ChamberlainHillsMelina11', '{\"x\":-65.476150512695,\"y\":-1513.3013916016,\"z\":35.6749}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-67.200134277344,\"y\":-1512.2899169922,\"z\":35.62491607666}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(487, 'ChamberlainHillsMelina12', 'ChamberlainHillsMelina12', '{\"x\":-60.261810302734,\"y\":-1517.4487304688,\"z\":35.6749}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-62.350440979004,\"y\":-1516.0795898438,\"z:\":35.624908447266}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(488, 'ChamberlainHillsMelina13', 'ChamberlainHillsMelina13', '{\"x\":-53.642433166504,\"y\":-1523.3814697266,\"z\":35.6749}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-55.583984375,\"y\":-1521.8061523438,\"z\":35.624908447266}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(489, 'ChamberlainHillsMelina14', 'ChamberlainHillsMelina14', '{\"x\":-59.510196685791,\"y\":-1530.4760742188,\"z\":36.4696}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-61.120655059814,\"y\":-1532.0301513672,\"z\":36.419616699219}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(490, 'ChamberlainHillsMelina15', 'ChamberlainHillsMelina15', '{\"x\":-62.118679046631,\"y\":-1532.1140136719,\"z\":36.4696}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-63.697593688965,\"y\":-1530.5155029297,\"z\":36.419616699219}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(491, 'ChamberlainHillsMelina15', 'ChamberlainHillsMelina15', '{\"x\":-69.037757873535,\"y\":-1526.4653320312,\"z\":36.4696}', '{\"x\":-43.687919616699,\"y\":-1552.8824462891,\"z\":-49.4011}', '{\"x\":-43.549255371094,\"y\":-1551.8394775391,\"z\":-49.451095581055}', '{\"x\":-67.250495910645,\"y\":-1527.501953125,\"z\":36.419624328613}', '[]', NULL, 1, 1, 0, 0, NULL, '{\"x\":-43.076396942139,\"y\":-1546.9522705078,\"z\":-49.4011}', '', 800000, 1),
(493, 'Blok330LaPuertaPlaza', 'Blok330 LaPuerta Plaza', '{\"x\":-989.4836,\"y\":-1576.0155,\"z\":4.2211}', NULL, NULL, '{\"x\":-992.6227,\"y\":-1577.1671,\"z\":4.2082}', '[]', NULL, 0, 0, 1, 0, NULL, NULL, NULL, 0, 1),
(494, 'Blok330LaPuertaPlaza1', 'Blok330 LaPuerta Plaza 1', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(495, 'Blok330LaPuertaPlaza2', 'Blok330 LaPuerta Plaza 2', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(496, 'Blok330LaPuertaPlaza3', 'Blok330 LaPuerta Plaza 3', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(497, 'Blok330LaPuertaPlaza4', 'Blok330 LaPuerta Plaza 4', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(498, 'Blok330LaPuertaPlaza5', 'Blok330 LaPuerta Plaza 5', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(499, 'Blok330LaPuertaPlaza6', 'Blok330 LaPuerta Plaza 6', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(500, 'Blok330LaPuertaPlaza7', 'Blok330 LaPuerta Plaza 7', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(501, 'Blok330LaPuertaPlaza8', 'Blok330 LaPuerta Plaza 8', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(502, 'Blok330LaPuertaPlaza9', 'Blok330 LaPuerta Plaza 9', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(504, 'Blok330LaPuertaPlaza10', 'Blok330 LaPuerta Plaza 10', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(505, 'Blok330LaPuertaPlaza11', 'Blok330 LaPuerta Plaza 11', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(506, 'Blok330LaPuertaPlaza12', 'Blok330 LaPuerta Plaza 12', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(507, 'Blok330LaPuertaPlaza13', 'Blok330 LaPuerta Plaza 13', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(508, 'Blok330LaPuertaPlaza14', 'Blok330 LaPuerta Plaza 14', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(509, 'Blok330LaPuertaPlaza15', 'Blok330 LaPuerta Plaza 15', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(510, 'Blok330LaPuertaPlaza16', 'Blok330 LaPuerta Plaza 16', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(511, 'Blok330LaPuertaPlaza17', 'Blok330 LaPuerta Plaza 17', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(512, 'Blok330LaPuertaPlaza18', 'Blok330 LaPuerta Plaza 18', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(513, 'Blok330LaPuertaPlaza19', 'Blok330 LaPuerta Plaza 19', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(514, 'Blok330LaPuertaPlaza20', 'Blok330 LaPuerta Plaza 20', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(515, 'Blok330LaPuertaPlaza21', 'Blok330 LaPuerta Plaza 21', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(516, 'Blok330LaPuertaPlaza22', 'Blok330 LaPuerta Plaza 22', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(517, 'Blok330LaPuertaPlaza23', 'Blok330 LaPuerta Plaza 23', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(518, 'Blok330LaPuertaPlaza24', 'Blok330 LaPuerta Plaza 24', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(519, 'Blok330LaPuertaPlaza25', 'Blok330 LaPuerta Plaza 25', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(520, 'Blok330LaPuertaPlaza26', 'Blok330 LaPuerta Plaza 26', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(521, 'Blok330LaPuertaPlaza27', 'Blok330 LaPuerta Plaza 27', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(522, 'Blok330LaPuertaPlaza28', 'Blok330 LaPuerta Plaza 28', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(523, 'Blok330LaPuertaPlaza29', 'Blok330 LaPuerta Plaza 29', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(524, 'Blok330LaPuertaPlaza30', 'Blok330 LaPuerta Plaza 30', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok330LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(525, 'Blok340LaPuertaPlaza', 'Blok340 LaPuerta Plaza', '{\"x\":-936.2824,\"y\":-1523.5504,\"z\":4.2254}', NULL, NULL, '{\"x\":-938.3235,\"y\":-1524.2449,\"z\":4.2264}', '[]', NULL, 0, 0, 1, 0, NULL, NULL, NULL, 0, 1),
(526, 'Blok340LaPuertaPlaza1', 'Blok340 LaPuerta Plaza 1', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `is_open`, `garage`, `room_menu`, `doors`, `price`, `is_available`) VALUES
(527, 'Blok340LaPuertaPlaza2', 'Blok340 LaPuerta Plaza 2', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(528, 'Blok340LaPuertaPlaza3', 'Blok340 LaPuerta Plaza 3', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(529, 'Blok340LaPuertaPlaza4', 'Blok340 LaPuerta Plaza 4', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(530, 'Blok340LaPuertaPlaza5', 'Blok340 LaPuerta Plaza 5', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(531, 'Blok340LaPuertaPlaza6', 'Blok340 LaPuerta Plaza 6', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(532, 'Blok340LaPuertaPlaza7', 'Blok340 LaPuerta Plaza 7', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(533, 'Blok340LaPuertaPlaza8', 'Blok340 LaPuerta Plaza 8', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(534, 'Blok340LaPuertaPlaza9', 'Blok340 LaPuerta Plaza 9', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(535, 'Blok340LaPuertaPlaza10', 'Blok340 LaPuerta Plaza 10', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(536, 'Blok340LaPuertaPlaza11', 'Blok340 LaPuerta Plaza 11', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(537, 'Blok340LaPuertaPlaza12', 'Blok340 LaPuerta Plaza 12', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(538, 'Blok340LaPuertaPlaza13', 'Blok340 LaPuerta Plaza 13', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(539, 'Blok340LaPuertaPlaza14', 'Blok340 LaPuerta Plaza 14', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(540, 'Blok340LaPuertaPlaza15', 'Blok340 LaPuerta Plaza 15', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(541, 'Blok340LaPuertaPlaza16', 'Blok340 LaPuerta Plaza 16', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(542, 'Blok340LaPuertaPlaza17', 'Blok340 LaPuerta Plaza 17', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(543, 'Blok340LaPuertaPlaza18', 'Blok340 LaPuerta Plaza 18', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(544, 'Blok340LaPuertaPlaza19', 'Blok340 LaPuerta Plaza 19', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(545, 'Blok340LaPuertaPlaza20', 'Blok340 LaPuerta Plaza 20', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(546, 'Blok340LaPuertaPlaza21', 'Blok340 LaPuerta Plaza 21', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(547, 'Blok340LaPuertaPlaza22', 'Blok340 LaPuerta Plaza 22', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(548, 'Blok340LaPuertaPlaza23', 'Blok340 LaPuerta Plaza 23', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(549, 'Blok340LaPuertaPlaza24', 'Blok340 LaPuerta Plaza 24', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(550, 'Blok340LaPuertaPlaza25', 'Blok340 LaPuerta Plaza 25', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(551, 'Blok340LaPuertaPlaza26', 'Blok340 LaPuerta Plaza 26', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(552, 'Blok340LaPuertaPlaza27', 'Blok340 LaPuerta Plaza 27', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(553, 'Blok340LaPuertaPlaza28', 'Blok340 LaPuerta Plaza 28', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(554, 'Blok340LaPuertaPlaza29', 'Blok340 LaPuerta Plaza 29', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(555, 'Blok340LaPuertaPlaza30', 'Blok340 LaPuerta Plaza 30', NULL, '{\"x\":-966.45,\"y\":-1542.47,\"z\":-38.29}', '{\"x\":-966.05,\"y\":-1541.46,\"z\":-38.29}', NULL, '[]', 'Blok340LaPuertaPlaza', 0, 1, 0, 0, NULL, '{\"x\":-965.84,\"y\":-1536.53,\"z\":-38.29}', NULL, 1000000, 1),
(556, 'WillaPicturePerfectDrive', 'WillaPicturePerfectDrive', '{\"x\":-1132.4526,\"y\":375.475,\"z\":70.3496}', '', '', '', '[]', NULL, 1, 1, 0, 1, '{\"x\":-1096.5757,\"y\":359.8751,\"z\":67.5712}', '{\"x\":-1125.7471,\"y\":362.9134,\"z\":73.984}', NULL, 15000000, 1),
(557, 'SamAustinWillaDrive', 'SamAustinWillaDrive', '{\"x\":-1462.3888,\"y\":-34.487,\"z\":53.742}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-1460.9426,\"y\":-21.7173,\"z\":53.6356}', '{\"x\":-1482.0602,\"y\":-46.4249,\"z\":53.6946}', '[{\"model\":-1017013428,\"x\":-1465.362, \"y\":-34.41321, \"z\":55.05001}]', 15000000, 1),
(559, 'MiltonRoad530', 'Milton Road 530', '{\"x\":-527.5905,\"y\":518.5278,\"z\":111.9881}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-523.1246,\"y\":514.8145,\"z\":107.1281}', '[{\"model\":-711771128,\"x\":-510.477, \"y\":503.07, \"z\":108.23},\r\n{\"model\":-711771128,\"x\":-526.077, \"y\":516.75, \"z\":113.07}]', 15000000, 1),
(651, 'MadWayneThunderDrive859', 'MadWayneThunderDrive859', '{\"x\":-1274.193,\"y\":494.137,\"z\":96.511}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-1267.100,\"y\":506.238,\"z\":95.99}', '{\"x\":-1286.074,\"y\":484.474,\"z\":96.586}', '[{\"model\":33721332,\"x\":-1278.6562, \"y\":496.4490, \"z\":97.890},\r\n{\"model\":33721332,\"x\":-1278.6372, \"y\":497.4238, \"z\":97.890}]', 15000000, 1),
(652, 'VinewoodHills712', 'VinewoodHills712', '{\"x\":-115.504,\"y\":987.0565,\"z\":234.8021}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-82.386,\"y\":999.6807,\"z\":238.5272}', '[{\"model\":-2146494197,\"x\":-112.396, \"y\":986.020, \"z\":234.80},\r\n{\"model\":-2146494197,\"x\":-112.396, \"y\":986.020, \"z\":234.80}]', 15000000, 1),
(653, 'MarloweDrive844', 'MarloweDrive844', '{\"x\":-1514.015,\"y\":852.96,\"z\":180.644}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-1520.205,\"y\":835.6046,\"z\":185.2}', '[{\"model\":1033441082,\"x\":-1516.958, \"y\":851.0506, \"z\":180.64},\r\n{\"model\":1033441082,\"x\":-1516.958, \"y\":851.0506, \"z\":180.64}]', 15000000, 1),
(655, 'NorthRockfordDrive841', 'NorthRockfordDrive841', '{\"x\":-1735.58,\"y\":379.33,\"z\":88.775}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-1721.98,\"y\":381.454,\"z\":88.7792}', '[{\"model\":-826011544,\"x\":-1132.89, \"y\":378.666, \"z\":88.775}]', 15000000, 1),
(656, 'WestEclipseBoulevard692', 'WestEclipseBoulevard692', '{\"x\":-819.127,\"y\":175.184,\"z\":70.726}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-811.75,\"y\":175.22,\"z\":75.7953}', '[{\"model\":159994461,\"x\":-816.484, \"y\":178.25, \"z\":71.2725},\r\n{\"model\":-1686014385,\"x\":-816.484, \"y\":178.25, \"z\":71.2725}]', 15000000, 1),
(657, 'VinewoodHills713', 'VinewoodHills713', '{\"x\":-87.6278,\"y\":833.51,\"z\":234.969}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-66.864,\"y\":827.67,\"z\":230.38}', '[{\"model\":110411286,\"x\":-85.15, \"y\":834.774, \"z\":234.9698}]', 15000000, 1),
(658, 'NorthRockfordDrive838', 'NorthRockfordDrive838', '{\"x\":-1805.96,\"y\":437.811,\"z\":127.7577}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-1797.28,\"y\":449.966,\"z\":127.3352}', '[]', 15000000, 1),
(660, 'PicturePerfectDrive876', 'PicturePerfectDrive876', '{\"x\":-868.67,\"y\":456.343,\"z\":87.3312}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '{\"x\":-869.8161,\"y\":462.43,\"z\":87.3398}', '{\"x\":-876.57,\"y\":456.54,\"z\":87.3389}', '[{\"model\":365111372,\"x\":-866.763, \"y\":458.03, \"z\":88.2811}]', 15000000, 1),
(661, 'AmericanoWay648', 'AmericanoWay648', '{\"x\":-1538.78,\"y\":126.87,\"z\":55.8303}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, '', '{\"x\":-1502.70,\"y\":118.78,\"z\":54.718}', '[{\"model\":313889039,\"x\":-1536.44, \"y\":131.18, \"z\":56.4268}]', 15000000, 1),
(662, 'LimitHouseDejw', 'Limit House Dejw', '{\"y\":-26.757904052734, \"z\":40.559692382813, \"x\":-855.03460693359}', NULL, NULL, NULL, '[]', NULL, 1, 1, 0, 1, NULL, '{\"x\":-848.21313476563, \"y\":-22.924840927124, \"z\":44.155265808105}', '[{\"model\":-116678456,\"x\":-855.03460693359, \"y\":-26.757904052734, \"z\":40.559692382813}]', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `qbankingsystem`
--

CREATE TABLE `qbankingsystem` (
  `IBAN` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `islem` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `neKadar` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `neZaman` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `kimden` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `qbanking_societies`
--

CREATE TABLE `qbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `qbanking_societies`
--

INSERT INTO `qbanking_societies` (`society`, `society_name`, `value`, `iban`, `is_withdrawing`) VALUES
('society_police', 'SASP', 0, 'CRP_SASP', NULL),
('society_ambulance', 'SAMS', 0, 'CRP_SAMS', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `qbanking_transactions`
--

CREATE TABLE `qbanking_transactions` (
  `id` int(11) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `race_tracks`
--

CREATE TABLE `race_tracks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `radiocar`
--

CREATE TABLE `radiocar` (
  `id` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `spz` varchar(32) NOT NULL,
  `index_music` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `radiocar_owned`
--

CREATE TABLE `radiocar_owned` (
  `id` int(11) NOT NULL,
  `spz` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `signs`
--

CREATE TABLE `signs` (
  `id` int(11) NOT NULL,
  `location` text NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tiktok_users`
--

CREATE TABLE `tiktok_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tiktok_videos`
--

CREATE TABLE `tiktok_videos` (
  `id` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `created` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00:00',
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tinder_accounts`
--

CREATE TABLE `tinder_accounts` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tinder_likes`
--

CREATE TABLE `tinder_likes` (
  `id` int(11) NOT NULL,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tinder_messages`
--

CREATE TABLE `tinder_messages` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towed_cars`
--

CREATE TABLE `towed_cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transactions`
--

CREATE TABLE `transactions` (
  `bank` varchar(50) DEFAULT NULL,
  `fromIdentifier` varchar(50) DEFAULT NULL,
  `fromcharid` int(11) DEFAULT NULL,
  `toIdentifier` varchar(50) DEFAULT NULL,
  `tocharid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `money` double(22,2) DEFAULT 0.00,
  `gold` double(22,2) DEFAULT 0.00,
  `reason` varchar(100) DEFAULT NULL,
  `bankto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_account`
--

CREATE TABLE `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_hashtags`
--

CREATE TABLE `twitter_hashtags` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_mentions`
--

CREATE TABLE `twitter_mentions` (
  `id` int(11) NOT NULL,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(5) NOT NULL,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8_bin NOT NULL,
  `digit` int(11) DEFAULT 1,
  `skin` longtext COLLATE utf8_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job_level` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '{"level":0,"points":0}',
  `secondjob` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'unemployed',
  `secondjob_grade` int(11) NOT NULL DEFAULT 0,
  `thirdjob` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'unemployed',
  `thirdjob_grade` int(11) NOT NULL DEFAULT 0,
  `dealerLevel` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '{"level":0,"points":0}',
  `job_id` varchar(255) COLLATE utf8_bin DEFAULT '{"name":"nojob", "id":0}',
  `position` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `slot` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `group` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `isDead` bit(1) DEFAULT b'0',
  `firstname` varchar(50) COLLATE utf8_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8_bin DEFAULT '',
  `last_property` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` longtext COLLATE utf8_bin DEFAULT NULL,
  `health` int(11) DEFAULT NULL,
  `armour` int(11) NOT NULL DEFAULT 0,
  `tattoos` longtext COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin DEFAULT '#',
  `account_number` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `lastpos` varchar(255) COLLATE utf8_bin DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  `jail` int(11) NOT NULL DEFAULT 0,
  `accounts` longtext COLLATE utf8_bin DEFAULT NULL,
  `components` longtext COLLATE utf8_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8_bin DEFAULT NULL,
  `animacje` longtext COLLATE utf8_bin DEFAULT NULL,
  `opaska` int(11) DEFAULT 0,
  `insuranceDate` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `insuranceOCDate` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `time` int(11) DEFAULT 0,
  `iban` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `apps` text COLLATE utf8_bin DEFAULT NULL,
  `widget` text COLLATE utf8_bin DEFAULT NULL,
  `bt` text COLLATE utf8_bin DEFAULT NULL,
  `charinfo` text COLLATE utf8_bin DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `cryptocurrency` longtext COLLATE utf8_bin DEFAULT NULL,
  `cryptocurrencytransfers` text COLLATE utf8_bin DEFAULT NULL,
  `viptime` int(11) DEFAULT 0,
  `phonePos` text COLLATE utf8_bin DEFAULT NULL,
  `spotify` text COLLATE utf8_bin DEFAULT NULL,
  `phone_recipe` text COLLATE utf8_bin DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `digit` int(11) DEFAULT 1,
  `courses_count` int(11) NOT NULL DEFAULT 0,
  `secondjob` varchar(50) DEFAULT NULL,
  `secondjob_grade` int(11) DEFAULT 0,
  `courses_count_secound` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `owner` varchar(60) NOT NULL,
  `digit` int(11) DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_license_logs`
--

CREATE TABLE `user_license_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_type` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `digit` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_properties`
--

CREATE TABLE `user_properties` (
  `userId` varchar(50) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `digit` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_sim`
--

CREATE TABLE `user_sim` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `digit` int(11) DEFAULT NULL,
  `user` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `userdigit` int(11) DEFAULT NULL,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `house` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL DEFAULT 'Brak',
  `active` int(11) NOT NULL DEFAULT 0,
  `admin1` varchar(100) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `admdigit1` int(11) DEFAULT NULL,
  `admin2` varchar(100) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `admdigit2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `blocked` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `blocked`) VALUES
('Abarth 124 Spider', '124spider', 3350000, 'coupe', 0),
('BMW 1 F20', '125i', 465000, 'hatchbacki', 0),
('BMW M5 F11', '16m5', 1250000, 'sedany', 0),
('BMW M7 G11', '17m760i', 3250000, 'sedany', 0),
('Toyota Tundra', '19tundra', 9000000, 'offroad', 0),
('BMW X5 2020', '20x5m', 9000000, 'suvy', 0),
('Nissan 370Z Nismo', '370z', 3250000, 'coupe', 0),
('Brabus G700 Adventure', '4444', 5100000, 'offroad', 0),
('Lamborghini Diablo GTR', '500gtrlam', 9500000, 'super', 0),
('McLaren 600LT Mansory', '600ltmso', 1000000, '1limitowane', 1),
('McLaren Novitec 720s N-Largo', '720nlargo', 1000000, '1limitowane', 1),
('McLaren 720S', '720s', 5800000, 'super', 0),
('BMW 8 E31 ', '850csi', 375000, 'coupe', 0),
('Porsche 911 R', '911r', 3350000, 'sportowe', 0),
('Porsche 911', '922smg', 3500000, 'sportowe', 0),
('Audi A6 C8 Sedan', 'a6', 5050000, 'sedany', 0),
('Audi A8 FSI', 'a8fsi', 2800000, 'sedany', 0),
('Koenigsegg Agera RS', 'agerars', 17000000, 'super', 0),
('Mercedes AMG GTS Roadster', 'amggtc', 9100000, 'super', 0),
('Mercedes AMG GTS', 'amggts2016', 9000000, 'sportowe', 0),
('Mercedes AMG GTS Mansory', 'amggtsmansory', 9300000, 'sportowe', 0),
('Mercedes AMG GTS Prior', 'amggtsprior', 9200000, 'sportowe', 0),
('Honda S2000', 'ap2', 410000, 'coupe', 0),
('Ferrari LaFerrari Aperta', 'aperta', 14500000, 'super', 0),
('LCC Avarus', 'avarus', 80000, 'x1motocykle', 0),
('Brabus 800 Coupe', 'b800c217', 4000000, 'sportowe', 0),
('Bugatti Divo', 'bdivo', 13100000, 'super', 0),
('Bentley Bentayga Startech', 'bentaygast', 3800000, 'suvy', 0),
('Mercedes E55 AMG', 'benze55', 5450000, 'sedany', 0),
('Nagasaki BF 400', 'bf400', 350000, 'x1motocykle', 0),
('BrabusG900', 'bg700w', 11000000, 'offroad', 0),
('Nagasaki Blazer', 'blazer', 20000, 'x1motocykle', 0),
('Nagasaki Blazer Street', 'blazer4', 45000, 'x1motocykle', 0),
('Dinka Blista ', 'blista', 10000, 'hatchbacki', 0),
('BMW M5 F90', 'bmci', 4900000, 'sedany', 0),
('BMW 5 E39', 'bmwe39', 725000, 'sedany', 0),
('BMW M2 Competition', 'bmwm2', 7000000, 'sportowe', 0),
('bmwm3g80', 'bmwm3g80', 8500000, 'sedany', 0),
('BMW M8', 'bmwm8', 9950000, 'sportowe', 0),
('BMW S1000', 'bmws', 950000, 'x1motocykle', 0),
('BMX', 'bmx', 5000, 'x1motocykle', 0),
('Bugatti Bolide', 'bolide', 30000000, 'super', 0),
('Ford Mustang Boss 429', 'boss429', 750000, 'muscle', 0),
('Brabus Rocket 900', 'brabus', 6000000, 'sedany', 0),
('Brabus G500 Adventure', 'brabus500', 6000000, 'offroad', 0),
('Brabus 850', 'brabus850', 3550000, 'sportowe', 0),
('Brabus 850 Coupe', 'brabus850s', 6250000, 'coupe', 0),
('Brabus GT 800', 'brabusgt700', 6000000, 'sportowe', 0),
('Grotti Brioso R/A', 'brioso', 40000, 'hatchbacki', 0),
('Subaru BRZ Rocket Bunny', 'brz', 1000000, '1limitowane', 1),
('Albany Buccaneer', 'buccaneer', 30000, 'muscle', 0),
('Albany Buccaneer Custom', 'buccaneer2', 35000, 'lowridery', 0),
('Bravado Buffalo', 'buffalo', 60000, 'sedany', 0),
('Buritto', 'buritto3', 100000, 'suvy', 0),
('Mercedes C63', 'c63', 6500000, 'sportowe', 0),
('Mercedes C63 AMG Black Series Liberty Walk', 'c63lb', 1000000, '1limitowane', 1),
('Mercedes C63S', 'c63s', 3450000, 'sportowe', 0),
('Mercedes C63', 'c63w205', 3600000, 'sedany', 0),
('Corvette C7', 'c7', 4200000, 'sportowe', 0),
('Honda CB 500X', 'cb500x', 1900000, 'x1motocykle', 0),
('Honda CBR', 'cbrr', 900000, 'x1motocykle', 0),
('Cheburek', 'cheburek', 350000, 'hatchbacki', 0),
('Nagasaki Chimera', 'chimera', 85000, 'x1motocykle', 0),
('Chino2', 'Chino2', 40000, 'muscle', 0),
('Bugatti Chiron SS', 'chironss', 17000000, 'super', 0),
('Mercedes CLA45', 'cla45', 3450000, 'sedany', 0),
('Nagasaki Cliffhanger', 'cliffhanger', 125000, 'x1motocykle', 0),
('Mercedes CLS63', 'cls2015', 4700000, 'sedany', 0),
('Enus Cognoscenti Cabrio', 'cogcabrio', 100000, 'coupe', 0),
('Bentley Continental GT 2011', 'contgt2011', 1000000, '1limitowane', 1),
('Bentley Continental GT 2018', 'contss18', 9300000, 'sportowe', 0),
('MINI John Cooper Works', 'cooperworks', 350000, 'hatchbacki', 1),
('Cruiser', 'cruiser', 1000, 'x1motocykle', 0),
('Rolls-Royce Cullinan', 'cullinan', 4600000, 'suvy', 0),
('Chevrolet Corvette C6', 'czr1', 890000, 'sportowe', 0),
('Aston Martin DB11', 'db11', 9500000, 'sportowe', 0),
('Dodge Challenger Demon', 'demon', 8250000, 'muscle', 0),
('Dominator', 'Dominator', 160000, 'muscle', 0),
('BMW 5 E34', 'e34', 900000, 'sedany', 0),
('BMW M3 E36 Rocket Bunny', 'e36prb', 1000000, '1limitowane', 1),
('BMW M3 E92 Liberty Walk', 'e92lb', 1000000, '1limitowane', 1),
('Mitsubishi Eclipse 2G', 'eclipse', 1600000, 'coupe', 0),
('Annis Elegy Retro', 'elegy', 200000, 'sportowe', 0),
('Annis Elegy', 'elegy2', 100000, 'sportowe', 0),
('Cadillac Escalade', 'esc21', 2800000, 'suvy', 0),
('Mitsubishi Lancer Evolution X', 'evo10', 1000000, '1limitowane', 1),
('Mitsubishi Lancer Evolution IX MR', 'evo9', 2500000, 'sportowe', 0),
('Ferrari F12tdf', 'f12tdf', 4200000, 'super', 0),
('Ford F150 Ranger', 'f15078', 150000, 'suvy', 0),
('Ferarri F355 Spider', 'f355s', 3700000, 'super', 0),
('Ocelot F620', 'f620', 95000, 'coupe', 0),
('BMW M4 F82', 'f82', 7000000, 'sportowe', 0),
('Willard Faction', 'faction', 30000, 'muscle', 0),
('Willard Faction Custom', 'faction2', 36000, 'lowridery', 0),
('Faggio', 'faggio2', 12500, 'x1motocykle', 0),
('Ferrari 812 Superfast', 'ferrari812', 9200000, 'sportowe', 0),
('Fixter', 'fixter', 3000, 'x1motocykle', 0),
('Ferrari 488 Mansory', 'fm488', 1000000, '1limitowane', 1),
('Porsche 996 GT3', 'fox996', 9000000, 'sportowe', 0),
('Bentley Continental 2020', 'foxbentley', 4100000, 'sportowe', 0),
('Corvette C8', 'foxc8', 4400000, 'sportowe', 0),
('Volkswagen Scirocco', 'foxsci', 1600000, 'hatchbacki', 0),
('Porsche Taycan', 'foxtc', 4250000, 'sportowe', 0),
('Ferrari Portefino', 'fpino', 1000000, '1limitowane', 1),
('Mercedes G63 4x4', 'g634x4', 4800000, 'offroad', 0),
('Mercedes G63 6x6', 'g63amg6x6', 9350000, 'offroad', 0),
('Mercedes G65', 'g65amg', 4500000, 'suvy', 0),
('Lumma CLR G770', 'g770', 4200000, 'suvy', 0),
('Mercedes-Benz G770', 'G770OFFROAD', 10500000, 'sedany', 0),
('Lamborghini Gallardo Superleggera Widebody', 'gallardosuperlb', 1000000, '1limitowane', 1),
('generalie2', 'generalie2', 12500000, 'super', 0),
('Alfa Romeo Giulia GTAM', 'giuliagtam', 13650000, 'sportowe', 0),
('Mercedes GLE450', 'gle450', 2500000, 'suvy', 0),
('Volkswagen Golf 7 GTI', 'golf7gti', 300000, 'hatchbacki', 0),
('Granger', 'Granger', 180000, 'suvy', 0),
('Suzuki GSX-R1000R', 'gsx1000', 1000000, '1limitowane', 1),
('Ford GT', 'gt17', 10000000, 'super', 0),
('Toyota GT86', 'gt86', 2800000, 'coupe', 0),
('Mercedes GLE63 Hamann', 'gta5rp_veh_gle1', 5400000, 'suvy', 0),
('Nissan GTR', 'gtr', 7000000, 'sportowe', 0),
('Plymouth GTX ', 'gtx', 110000, 'muscle', 0),
('Nissan Skyline R34 GTR Widebody', 'gtz34', 1000000, '1limitowane', 1),
('Kawasaki H2', 'h2carb', 850000, 'x1motocykle', 0),
('Hummer H2', 'h2m', 8000000, 'suvy', 0),
('Hummer H6', 'h6', 8500000, 'suvy', 1),
('Honda CBR17', 'hcbr17', 1850000, 'x1motocykle', 0),
('LCC Hexer', 'hexer', 35000, 'x1motocykle', 0),
('Hummer H1', 'hummer', 14000000, 'offroad', 0),
('Hummer EV', 'hummerev', 10300000, 'offroad', 1),
('Hummer EV 6x6', 'hummerev6x6', 10000000, 'offroad', 1),
('HMMWV US ARMY', 'humvee', 17350000, 'offroad', 0),
('Lamborghini Huracan EVO', 'hurevo', 11400000, 'super', 0),
('Declasse Impaler', 'impaler', 35000, 'muscle', 0),
('Infinity Q60', 'inf', 2100000, 'coupe', 0),
('LCC Innovation', 'innovation', 70000, 'x1motocykle', 0),
('Jeep Grand Cherokee', 'jeepg', 550000, 'suvy', 0),
('Jaguar F-Pace Lumma', 'jlumma', 11000000, 'suvy', 0),
('Canis Kamacho', 'kamacho', 10000000, 'offroad', 0),
('Lamborghini Siesto Elemento', 'lambose', 13000000, 'super', 0),
('Mitsubishi Lancer Evolution X', 'lanex400', 2000000, 'sportowe', 0),
('Lamborghini Murcielago SV', 'lp670sv', 13500000, 'super', 0),
('Lamborghini Avendator', 'lp700', 14000000, 'super', 0),
('Lumma M5 E60', 'lummae60', 8500000, 'sportowe', 0),
('BMW M2 Shooting Brake WB', 'm135iwb', 1000000, '1limitowane', 1),
('BMW M3 E46', 'm3e46', 1000000, '1limitowane', 1),
('BMW M3 F80', 'm3f80', 3950000, 'sportowe', 0),
('BMW M5 E60', 'm5e60', 3250000, 'sedany', 0),
('Porsche Macan Prior Design', 'macanpd600m', 1000000, '1limitowane', 1),
('Mercedes EQC400', 'mb400', 2100000, 'suvy', 0),
('Mercedes W126', 'mercw126', 400000, 'sedany', 0),
('Canis Mesa Offroad', 'mesa3', 65000, 'suvy', 0),
('Ford Mustang GT', 'mgt', 3350000, 'muscle', 0),
('Manhart MH8 800', 'mh800', 10000000, '1limitowane', 1),
('Manhart MHX7 700', 'mhx7', 10000000, '1limitowane', 1),
('MiniVan', 'Minivan2', 160000, 'coupe', 0),
('Chevrolet Monte Carlo', 'montecarlo', 1000000, '1limitowane', 1),
('Declasse Moonbeam Custom', 'moonbeam2', 25000, 'lowridery', 0),
('Maserati Quattroporte GTS', 'mqgts', 3400000, 'sedany', 0),
('Ford Mustang Shelby GT350', 'mst', 1000000, '1limitowane', 1),
('Yamaha MT03', 'mt03', 125000, 'x1motocykle', 0),
('Mazda 3', 'mz3c', 320000, 'sedany', 0),
('Brabus G500 Offroad', 'nigger', 15000000, 'offroad', 0),
('WMC Nightblade', 'nightblade', 70000, 'x1motocykle', 0),
('Imponte Nightshade', 'nightshade', 50000, 'muscle', 0),
('Nissan GTR Nismo', 'nismo20', 5200000, 'sportowe', 0),
('Nissan Titan', 'nissantitan17', 5850000, 'suvy', 1),
('McLaren P1', 'p1', 14000000, 'super', 0),
('Porsche Panamera Turbo', 'panamera17turbo', 4500000, 'sportowe', 0),
('Ford Raptor Pandem', 'pandemraptor', 1000000, '1limitowane', 1),
('Benefactor Panto', 'panto', 20000, 'hatchbacki', 0),
('Volkswagen Passat', 'passat', 2000000, 'sedany', 0),
('Mammoth Patriot', 'patriot', 75000, 'suvy', 0),
('Ferrari 488 Pista Spider', 'pistaspider19', 14700000, 'super', 0),
('Plymouth Fury', 'plymouth58', 80000, 'muscle', 0),
('Porsche Panamera Mansory', 'pmansory', 15000000, 'sedany', 0),
('Audi Q8', 'q820', 1900000, 'suvy', 0),
('Audi Q8 Prior', 'q8prior', 8000000, 'suvy', 0),
('Audi R8 Roadster', 'r8c20', 9500000, 'super', 0),
('Dodge RAM 2500', 'ramlh20', 3000000, 'suvy', 0),
('Ford Raptor F-150', 'raptor150', 7000000, 'suvy', 0),
('Ford Raptor Velociraptor 6x6', 'raptor2017', 11500000, 'offroad', 0),
('Karin Rebel', 'rebel2', 25000, 'suvy', 0),
('Koenigsegg Regera', 'Regera', 40000000, 'super', 0),
('Brabus 800', 'rmode63s', 3900000, 'sportowe', 0),
('rmodessenza', 'rmodessenza', 16000000, 'super', 0),
('Mercedes GT 63S', 'rmodgt63', 4000000, 'sportowe', 0),
('Koenigsegg Jesko', 'rmodjesko', 17000000, 'super', 0),
('BMW M8 Cabrio', 'rmodm8c', 7000000, 'sedany', 0),
('Audi RS6 C8 Avant', 'rmodrs6', 6500000, 'sportowe', 0),
('Lamborghini Sian', 'rmodsian', 14500000, 'super', 0),
('Nissan Skyline R34', 'rmodskyline34', 1000000, '1limitowane', 1),
('Toyota Supra MkIV', 'rmodsupra', 5300000, 'sportowe', 0),
('BMW X6', 'rmodx6', 3000000, 'suvy', 0),
('Range Rover Startech', 'rrst', 3600000, 'suvy', 0),
('Audi RS3', 'rs318', 2200000, 'hatchbacki', 0),
('Audi RS6 C8 Widebody', 'rs666', 1000000, '1limitowane', 1),
('Audi RS6 C8 Sedan', 'rs6c8', 9450000, 'sportowe', 0),
('Audi RS6 Mansory', 'rs6mansory', 1000000, '1limitowane', 1),
('Audi RS7 C8 Widebody', 'rs7c8wb', 1000000, '1limitowane', 1),
('Audi RS7 C8 ABT', 'rs7r', 9650000, 'sedany', 0),
('Dodge Charger 70', 'rt70', 700000, 'muscle', 0),
('Mazda RX8 Spirit R', 'rx8r', 12500000, 'sportowe', 0),
('Mercedes S63 AMG 2021', 's63amg21', 1000000, '1limitowane', 1),
('Mercedes S63', 's63w222', 4250000, 'sedany', 0),
('Audi S8 D4', 's8d4', 3450000, 'sedany', 0),
('Declasse Sabre Turbo', 'sabregt', 35000, 'muscle', 0),
('Declasse Sabre Turbo Custom', 'sabregt2', 40000, 'lowridery', 0),
('Maibatsu Sanchez', 'sanchez', 75000, 'x1motocykle', 0),
('Benefactor Schafter', 'schafter2', 80000, 'sedany', 0),
('Benefactor Schafter V12', 'schafter3', 120000, 'sedany', 0),
('Benefactor Schafter LWB', 'schafter4', 135000, 'sedany', 0),
('Volkswagen Scirocco 81', 'sciroccos81', 1000000, '1limitowane', 1),
('Scorcher', 'scorcher', 10000, 'x1motocykle', 0),
('Subaru Impreza WRX', 'scubieblob', 9500000, 'sportowe', 0),
('McLaren Senna', 'senna', 13800000, 'super', 0),
('Ubermacht Sentinel ', 'sentinel', 45000, 'coupe', 0),
('Ubermacht Sentinel XS', 'sentinel2', 55000, 'coupe', 0),
('Chevrolet Silverado Z71', 'silverado', 9000000, 'suvy', 0),
('Nissan Skyline R34', 'skyline', 3250000, 'sportowe', 0),
('Vapid Slamvan', 'slamvan', 38000, 'muscle', 0),
('Vapid Slamvan Custom', 'slamvan3', 45000, 'lowridery', 0),
('Dodge Charger SRT Daytona', 'srtday20', 500000, 'muscle', 0),
('Jeep Wrangler Gladiator 6x6', 'strad6x6', 8500000, 'offroad', 1),
('Karin Sultan', 'sultan', 70000, 'sedany', 0),
('Karin Sultan RS', 'sultanrs', 150000, 'sportowe', 0),
('Skoda SuperB', 'superb', 550000, 'sedany', 0),
('Toyota Supra PD', 'suprapd', 1000000, '1limitowane', 1),
('Range Rover SVR', 'SVR14', 3100000, 'suvy', 0),
('KTM 450 SX-F', 'sxf450', 770000, 'x1motocykle', 0),
('Tampa', 'Tampa', 65000, 'muscle', 0),
('topcar911', 'topcar911', 9000000, 'coupe', 0),
('Tornado5', 'Tornado5', 40000, 'muscle', 0),
('Jeep Trailcat', 'trailcat', 2500000, 'offroad', 0),
('Tribike Yellow', 'tribike', 8000, 'x1motocykle', 0),
('Tribike Red', 'tribike2', 8000, 'x1motocykle', 0),
('Tribike Blue', 'tribike3', 8000, 'x1motocykle', 0),
('Zenvo TS1', 'ts1', 13000000, 'super', 0),
('Audi TT RS', 'tts', 2350000, 'coupe', 0),
('Declasse Tulip', 'tulip', 55000, 'muscle', 0),
('Uaz31', 'uaz31', 4000000, 'offroad', 0),
('Lamborghini Urus', 'urus', 4100000, 'suvy', 0),
('Declasse Vamos', 'vamos', 50000, 'muscle', 0),
('Lamborghini Urus Venatus', 'venatus', 6100000, 'suvy', 0),
('Virgo3', 'Virgo3', 50000, 'muscle', 0),
('Voodoo', 'Voodoo', 52000, 'muscle', 0),
('Mercedes WALD', 'w222wald', 3550000, '1limitowane', 1),
('Ford Bronco', 'wildtrak', 8500000, 'offroad', 1),
('Enus Windsor', 'windsor', 150000, 'coupe', 0),
('Enus Windsor Drop', 'windsor2', 140000, 'sedany', 0),
('Rolls-Royce Wraith', 'wraith', 3350000, 'coupe', 0),
('BMW X5 E53', 'x5e53', 2200000, 'suvy', 0),
('Jaguar XJ', 'xj', 3850000, 'sedany', 0),
('Mercedes X Class 6x6', 'xxxxx', 1000000, '1limitowane', 1),
('Declasse Yosemite', 'yosemite', 90000, 'muscle', 0),
('Yamaha YZF-R6', 'yzfr6', 3300000, 'x1motocykle', 0),
('Chevrolet Camaro Zl1', 'zl12017', 3550000, 'muscle', 0),
('WWC Zombie Bobber', 'zombieb', 40000, 'x1motocykle', 0),
('Annis ZR390', 'zr390', 12500000, 'super', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('1limitowane', 'Limitowane'),
('coupe', 'Coupe'),
('hatchbacki', 'Hatchbacki'),
('lowridery', 'Lowridery'),
('muscle', 'Muscle'),
('offroad', 'Offroady'),
('sedany', 'Sedany, Kombi'),
('sportowe', 'Sportowe'),
('super', 'Super Samochody'),
('suvy', 'Suvy, Pickupy'),
('x1motocykle', 'Motocykle, Quady i Rowery');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_properties`
--

CREATE TABLE `vehicle_properties` (
  `vehicleId` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `veh_km`
--

CREATE TABLE `veh_km` (
  `carplate` varchar(10) NOT NULL,
  `km` varchar(255) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT 0,
  `reset` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_accounts`
--

CREATE TABLE `whatsapp_accounts` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_chats`
--

CREATE TABLE `whatsapp_chats` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_chats_messages`
--

CREATE TABLE `whatsapp_chats_messages` (
  `id` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `readed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_groups`
--

CREATE TABLE `whatsapp_groups` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_groups_messages`
--

CREATE TABLE `whatsapp_groups_messages` (
  `id` int(11) NOT NULL,
  `id_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_groups_users`
--

CREATE TABLE `whatsapp_groups_users` (
  `number_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whatsapp_stories`
--

CREATE TABLE `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(60) NOT NULL,
  `ticket` int(11) NOT NULL DEFAULT 5,
  `back` int(11) NOT NULL DEFAULT 0,
  `discord` varchar(50) DEFAULT 'Brak',
  `license` varchar(50) NOT NULL DEFAULT 'Brak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `whitelist`
--

INSERT INTO `whitelist` (`identifier`, `ticket`, `back`, `discord`, `license`) VALUES
('steam:11100001000056ba', 5, 0, 'Brak', 'Brak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`),
  ADD KEY `label` (`label`);

--
-- Indeksy dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_name` (`account_name`),
  ADD KEY `owner` (`owner`);

--
-- Indeksy dla tabeli `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`),
  ADD KEY `label` (`label`);

--
-- Indeksy dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_name` (`inventory_name`),
  ADD KEY `owner` (`owner`);

--
-- Indeksy dla tabeli `addon_legaljobs`
--
ALTER TABLE `addon_legaljobs`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `addon_organizations`
--
ALTER TABLE `addon_organizations`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `anticheat`
--
ALTER TABLE `anticheat`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`),
  ADD KEY `license` (`license`),
  ADD KEY `ip` (`ip`),
  ADD KEY `nazwa` (`nazwa`),
  ADD KEY `discord` (`discord`),
  ADD KEY `powod` (`powod`),
  ADD KEY `datanadania` (`datanadania`),
  ADD KEY `liveid` (`liveid`),
  ADD KEY `xbl` (`xbl`);

--
-- Indeksy dla tabeli `battlepass`
--
ALTER TABLE `battlepass`
  ADD PRIMARY KEY (`hex`);

--
-- Indeksy dla tabeli `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `bitki`
--
ALTER TABLE `bitki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`model`),
  ADD KEY `category` (`category`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `boats_categories`
--
ALTER TABLE `boats_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `cayo_mines`
--
ALTER TABLE `cayo_mines`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `digit` (`digit`),
  ADD KEY `account_number` (`account_number`);

--
-- Indeksy dla tabeli `chat_bans`
--
ALTER TABLE `chat_bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `chat` (`chat`);

--
-- Indeksy dla tabeli `crimes`
--
ALTER TABLE `crimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crimes_userid_foreign` (`userId`);

--
-- Indeksy dla tabeli `crime_character`
--
ALTER TABLE `crime_character`
  ADD KEY `crime_character_crime_id_index` (`crime_id`),
  ADD KEY `crime_character_character_id_index` (`character_id`);

--
-- Indeksy dla tabeli `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeksy dla tabeli `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indeksy dla tabeli `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `db_clothes`
--
ALTER TABLE `db_clothes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `charid` (`digit`) USING BTREE;

--
-- Indeksy dla tabeli `exile_bans`
--
ALTER TABLE `exile_bans`
  ADD PRIMARY KEY (`license`) USING BTREE,
  ADD KEY `license` (`license`);

--
-- Indeksy dla tabeli `exile_zones`
--
ALTER TABLE `exile_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone` (`time`) USING BTREE;

--
-- Indeksy dla tabeli `fuel_km`
--
ALTER TABLE `fuel_km`
  ADD PRIMARY KEY (`carplate`),
  ADD UNIQUE KEY `carplate` (`carplate`),
  ADD KEY `carplate_2` (`carplate`);

--
-- Indeksy dla tabeli `given_items`
--
ALTER TABLE `given_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `holdup`
--
ALTER TABLE `holdup`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `holdup_sklepholdup`
--
ALTER TABLE `holdup_sklepholdup`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `instagram_posts`
--
ALTER TABLE `instagram_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `instagram_stories`
--
ALTER TABLE `instagram_stories`
  ADD PRIMARY KEY (`owner`) USING BTREE;

--
-- Indeksy dla tabeli `investigations`
--
ALTER TABLE `investigations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigations_created_by_foreign` (`created_by`);

--
-- Indeksy dla tabeli `investigation_comments`
--
ALTER TABLE `investigation_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_comments_investigation_id_index` (`investigation_id`),
  ADD KEY `investigation_comments_user_id_index` (`user_id`);

--
-- Indeksy dla tabeli `investigation_users`
--
ALTER TABLE `investigation_users`
  ADD PRIMARY KEY (`user_id`,`investigation_id`),
  ADD KEY `investigation_users_user_id_index` (`user_id`),
  ADD KEY `investigation_users_investigation_id_index` (`investigation_id`);

--
-- Indeksy dla tabeli `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `digit` (`digit`);

--
-- Indeksy dla tabeli `jakastabela`
--
ALTER TABLE `jakastabela`
  ADD PRIMARY KEY (`hex`);

--
-- Indeksy dla tabeli `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `jobs_insurance`
--
ALTER TABLE `jobs_insurance`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`job_name`,`name`,`label`);

--
-- Indeksy dla tabeli `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`),
  ADD KEY `type` (`type`);

--
-- Indeksy dla tabeli `lspd_mdc_judgments_suggestion`
--
ALTER TABLE `lspd_mdc_judgments_suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lspd_mdc_judgments_suggestion_category` (`categoryId`),
  ADD KEY `name` (`name`),
  ADD KEY `description` (`description`);

--
-- Indeksy dla tabeli `lspd_mdc_judgments_suggestion_category`
--
ALTER TABLE `lspd_mdc_judgments_suggestion_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `lspd_mdc_tag_suggestion`
--
ALTER TABLE `lspd_mdc_tag_suggestion`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lspd_mdc_user_notes`
--
ALTER TABLE `lspd_mdc_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeksy dla tabeli `lspd_mdc_vehicle_notes`
--
ALTER TABLE `lspd_mdc_vehicle_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lspd_mdc_vehicle_notes_owned_vehicles` (`vehicleId`);

--
-- Indeksy dla tabeli `lspd_user_judgments`
--
ALTER TABLE `lspd_user_judgments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `owner` (`owner`),
  ADD KEY `digit` (`digit`);

--
-- Indeksy dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`),
  ADD KEY `owner` (`owner`),
  ADD KEY `job` (`job`),
  ADD KEY `co_owner` (`co_owner`),
  ADD KEY `digit` (`digit`),
  ADD KEY `co_digit` (`co_digit`),
  ADD KEY `co_owner2` (`co_owner2`),
  ADD KEY `co_digit2` (`co_digit2`),
  ADD KEY `co_owner3` (`co_owner3`),
  ADD KEY `co_digit3` (`co_digit3`);

--
-- Indeksy dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeksy dla tabeli `phone_alertjobs`
--
ALTER TABLE `phone_alertjobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job` (`job`);

--
-- Indeksy dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `channel` (`channel`);

--
-- Indeksy dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `num` (`num`);

--
-- Indeksy dla tabeli `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_code` (`room_code`);

--
-- Indeksy dla tabeli `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_crypto`
--
ALTER TABLE `phone_crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indeksy dla tabeli `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_news`
--
ALTER TABLE `phone_news`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeksy dla tabeli `phone_notifies`
--
ALTER TABLE `phone_notifies`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_numbers`
--
ALTER TABLE `phone_numbers`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Indeksy dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownernumber` (`ownernumber`);

--
-- Indeksy dla tabeli `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`model`);

--
-- Indeksy dla tabeli `planes_categories`
--
ALTER TABLE `planes_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Indeksy dla tabeli `player_gallery`
--
ALTER TABLE `player_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeksy dla tabeli `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Indeksy dla tabeli `player_notes`
--
ALTER TABLE `player_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `qbanking_transactions`
--
ALTER TABLE `qbanking_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `radiocar`
--
ALTER TABLE `radiocar`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `signs`
--
ALTER TABLE `signs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tiktok_users`
--
ALTER TABLE `tiktok_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indeksy dla tabeli `tiktok_videos`
--
ALTER TABLE `tiktok_videos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeksy dla tabeli `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tinder_likes`
--
ALTER TABLE `tinder_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tinder_messages`
--
ALTER TABLE `tinder_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeksy dla tabeli `towed_cars`
--
ALTER TABLE `towed_cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `towed_cars_vehicle_id_foreign` (`vehicle_id`);

--
-- Indeksy dla tabeli `transactions`
--
ALTER TABLE `transactions`
  ADD KEY `FK_transactions_banks` (`bank`),
  ADD KEY `FK_transactions_banks_2` (`bankto`);

--
-- Indeksy dla tabeli `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeksy dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `job` (`job`),
  ADD KEY `account_number` (`account_number`),
  ADD KEY `digit` (`digit`,`phone_number`),
  ADD KEY `position` (`position`),
  ADD KEY `firstname` (`firstname`),
  ADD KEY `lastname` (`lastname`),
  ADD KEY `inventory` (`inventory`(768)),
  ADD KEY `job_level` (`job_level`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `height` (`height`),
  ADD KEY `lastpos` (`lastpos`),
  ADD KEY `animacje` (`animacje`(768)),
  ADD KEY `hiddenjob` (`thirdjob`) USING BTREE,
  ADD KEY `status` (`components`(768)) USING BTREE;

--
-- Indeksy dla tabeli `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `digit` (`digit`),
  ADD KEY `job` (`secondjob`) USING BTREE;

--
-- Indeksy dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `digit` (`digit`);

--
-- Indeksy dla tabeli `user_license_logs`
--
ALTER TABLE `user_license_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_license_logs_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `user_properties`
--
ALTER TABLE `user_properties`
  ADD KEY `userId` (`userId`);

--
-- Indeksy dla tabeli `user_sim`
--
ALTER TABLE `user_sim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `userdigit` (`userdigit`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `digit` (`digit`),
  ADD KEY `number` (`number`),
  ADD KEY `admin1` (`admin1`),
  ADD KEY `admdigit1` (`admdigit1`),
  ADD KEY `admin2` (`admin2`),
  ADD KEY `admdigit2` (`admdigit2`),
  ADD KEY `house` (`house`);

--
-- Indeksy dla tabeli `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`),
  ADD KEY `model` (`model`);

--
-- Indeksy dla tabeli `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `vehicle_properties`
--
ALTER TABLE `vehicle_properties`
  ADD KEY `FK_vehicle_properties_owned_vehicles` (`vehicleId`);

--
-- Indeksy dla tabeli `veh_km`
--
ALTER TABLE `veh_km`
  ADD PRIMARY KEY (`carplate`),
  ADD UNIQUE KEY `carplate` (`carplate`),
  ADD KEY `carplate_2` (`carplate`);

--
-- Indeksy dla tabeli `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `whatsapp_chats_messages`
--
ALTER TABLE `whatsapp_chats_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `discord` (`discord`),
  ADD KEY `license` (`license`);

--
-- Indeksy dla tabeli `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `anticheat`
--
ALTER TABLE `anticheat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT dla tabeli `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bitki`
--
ALTER TABLE `bitki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `cayo_mines`
--
ALTER TABLE `cayo_mines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1717;

--
-- AUTO_INCREMENT dla tabeli `chat_bans`
--
ALTER TABLE `chat_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `crimes`
--
ALTER TABLE `crimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `db_clothes`
--
ALTER TABLE `db_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `exile_zones`
--
ALTER TABLE `exile_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `given_items`
--
ALTER TABLE `given_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `instagram_posts`
--
ALTER TABLE `instagram_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `investigations`
--
ALTER TABLE `investigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `investigation_comments`
--
ALTER TABLE `investigation_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90067;

--
-- AUTO_INCREMENT dla tabeli `kits`
--
ALTER TABLE `kits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `lspd_mdc_judgments_suggestion`
--
ALTER TABLE `lspd_mdc_judgments_suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT dla tabeli `lspd_mdc_judgments_suggestion_category`
--
ALTER TABLE `lspd_mdc_judgments_suggestion_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `lspd_mdc_tag_suggestion`
--
ALTER TABLE `lspd_mdc_tag_suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `lspd_mdc_user_notes`
--
ALTER TABLE `lspd_mdc_user_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `lspd_mdc_vehicle_notes`
--
ALTER TABLE `lspd_mdc_vehicle_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `lspd_user_judgments`
--
ALTER TABLE `lspd_user_judgments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `phone_alertjobs`
--
ALTER TABLE `phone_alertjobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1371;

--
-- AUTO_INCREMENT dla tabeli `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `phone_news`
--
ALTER TABLE `phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_notifies`
--
ALTER TABLE `phone_notifies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT dla tabeli `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `player_gallery`
--
ALTER TABLE `player_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `player_notes`
--
ALTER TABLE `player_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=663;

--
-- AUTO_INCREMENT dla tabeli `qbanking_transactions`
--
ALTER TABLE `qbanking_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `radiocar`
--
ALTER TABLE `radiocar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `signs`
--
ALTER TABLE `signs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `tiktok_users`
--
ALTER TABLE `tiktok_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tiktok_videos`
--
ALTER TABLE `tiktok_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tinder_likes`
--
ALTER TABLE `tinder_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tinder_messages`
--
ALTER TABLE `tinder_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `towed_cars`
--
ALTER TABLE `towed_cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_license_logs`
--
ALTER TABLE `user_license_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_sim`
--
ALTER TABLE `user_sim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `whatsapp_chats_messages`
--
ALTER TABLE `whatsapp_chats_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `crime_character`
--
ALTER TABLE `crime_character`
  ADD CONSTRAINT `crime_character_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crime_character_crime_id_foreign` FOREIGN KEY (`crime_id`) REFERENCES `crimes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
