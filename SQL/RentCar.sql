-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Feb 2018 um 20:37
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `RentCar`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `demages` varchar(255) DEFAULT NULL,
  `fuel_level` int(11) DEFAULT NULL,
  `add_cost` int(11) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `demages`, `fuel_level`, `add_cost`, `fk_driver_id`, `fk_car_id`) VALUES
(1, 'no damages', 90, 10, 1, 1),
(2, 'dirt in  car', 100, 5, 1, 3),
(3, 'no damages', 100, 0, 1, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_cost` int(11) DEFAULT NULL,
  `car_status` varchar(55) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `company` varchar(55) DEFAULT NULL,
  `horesepower` int(11) DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `consumption` int(11) DEFAULT NULL,
  `diesel_petrol` varchar(55) DEFAULT NULL,
  `tank` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_id`, `car_cost`, `car_status`, `color`, `model`, `company`, `horesepower`, `production_year`, `consumption`, `diesel_petrol`, `tank`) VALUES
(1, 100, 'new', 'red', 'x5', 'BMW', 230, 2018, 1, 'Diesel', 'voll'),
(2, 110, 'new', 'black', 'x5', 'BMW', 230, 2017, 1, 'Diesel', 'full'),
(3, 100, 'old', 'blue', 'x4', 'BMW', 210, 2016, 1, 'Diesel', 'full'),
(4, 80, 'old', 'grey', 'a6', 'Audi', 120, 2000, 1, 'Petrol', 'full'),
(5, 70, 'old', 'blue', 'a6', 'Audi', 120, 2015, 1, 'Diesel', 'full'),
(6, 75, 'old', 'black', 'a3', 'Audi', 90, 2013, 2, 'Petrol', 'full');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `CarLicence` int(11) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `birthday`, `CarLicence`, `adress`, `email`) VALUES
(1, 'Daniel', 'Maier', '1985-12-30', 123456789, 'Niederhofstraße 5', 'daniel_maier@gmx.at'),
(2, 'Simone', 'Neuhofer', '1980-01-03', 891234567, 'Wohnstraße 18/7', 's.neuhofer@gmail.at'),
(3, 'Tobias', 'Ahn', '1995-02-22', 678912345, 'Glasergasse 19/2', 'Tobias.ahn@hotmail.at');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Drop_off_location`
--

CREATE TABLE `Drop_off_location` (
  `drop_off_location_id` int(11) NOT NULL,
  `country_name` varchar(55) DEFAULT NULL,
  `city_name` varchar(55) DEFAULT NULL,
  `adress` varchar(55) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `drop_off_date` date DEFAULT NULL,
  `drop_off_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Drop_off_location`
--

INSERT INTO `Drop_off_location` (`drop_off_location_id`, `country_name`, `city_name`, `adress`, `zip_code`, `drop_off_date`, `drop_off_time`) VALUES
(1, 'Austria', 'Vienna', 'Westbahnhof', 1150, '2018-02-26', '10:00:12'),
(2, 'Austria', 'Salzburg', 'Bahnhof', 5020, '2018-01-06', '13:26:29'),
(3, 'Austria', 'Graz', 'Siemstraße 50', 8010, '2018-01-11', '10:49:14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Insurance`
--

CREATE TABLE `Insurance` (
  `insurance_id` int(11) NOT NULL,
  `police_number` int(11) DEFAULT NULL,
  `days_of_Insurance` int(11) DEFAULT NULL,
  `name_of_Insurance` varchar(100) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Insurance`
--

INSERT INTO `Insurance` (`insurance_id`, `police_number`, `days_of_Insurance`, `name_of_Insurance`, `cost`) VALUES
(1, 29301, 3, 'Wüstenrot', 50),
(2, 90234, 7, 'Zürich', 120),
(3, 28936, 5, 'Wüstenrot', 100);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_time` time DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_insurance_id` int(11) DEFAULT NULL,
  `fk_pick_up_location_id` int(11) DEFAULT NULL,
  `fk_drop_off_location_id` int(11) DEFAULT NULL,
  `fk_additional_charges_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `finalsum` int(11) DEFAULT NULL,
  `rent_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_date`, `invoice_time`, `fk_driver_id`, `fk_car_id`, `fk_insurance_id`, `fk_pick_up_location_id`, `fk_drop_off_location_id`, `fk_additional_charges_id`, `fk_reservation_id`, `finalsum`, `rent_days`) VALUES
(1, '2018-01-06', '13:29:27', 1, 1, 1, 1, 2, 1, 1, 310, 3),
(2, '2018-01-11', '14:00:02', 2, 3, 2, 2, 3, 2, 2, 705, 7),
(3, '2018-02-26', '00:00:02', 3, 5, 1, 3, 1, 3, 3, 350, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Pick_up_location`
--

CREATE TABLE `Pick_up_location` (
  `pick_up_location_id` int(11) NOT NULL,
  `country_name` varchar(55) DEFAULT NULL,
  `city_name` varchar(55) DEFAULT NULL,
  `adress` varchar(55) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `pick_up_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Pick_up_location`
--

INSERT INTO `Pick_up_location` (`pick_up_location_id`, `country_name`, `city_name`, `adress`, `zip_code`, `pick_up_date`, `pick_up_time`) VALUES
(1, 'Austria', 'Vienna', 'Westbahnhof', 1150, '2018-01-04', '14:00:12'),
(2, 'Austria', 'Salzburg', 'Bahnhof', 5020, '2018-01-05', '09:00:12'),
(3, 'Austria', 'Graz', 'Siemstraße 50', 8010, '2018-01-22', '12:11:12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Reservation`
--

CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_insurance_id` int(11) DEFAULT NULL,
  `fk_pick_up_location_id` int(11) DEFAULT NULL,
  `fk_drop_off_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Reservation`
--

INSERT INTO `Reservation` (`reservation_id`, `reservation_date`, `fk_driver_id`, `fk_car_id`, `fk_insurance_id`, `fk_pick_up_location_id`, `fk_drop_off_location_id`) VALUES
(1, '2017-12-05', 1, 1, 1, 1, 2),
(2, '2018-01-01', 2, 3, 2, 2, 3),
(3, '2018-01-05', 3, 5, 3, 3, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `Drop_off_location`
--
ALTER TABLE `Drop_off_location`
  ADD PRIMARY KEY (`drop_off_location_id`);

--
-- Indizes für die Tabelle `Insurance`
--
ALTER TABLE `Insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_insurance_id` (`fk_insurance_id`),
  ADD KEY `fk_pick_up_location_id` (`fk_pick_up_location_id`),
  ADD KEY `fk_drop_off_location_id` (`fk_drop_off_location_id`),
  ADD KEY `fk_additional_charges_id` (`fk_additional_charges_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indizes für die Tabelle `Pick_up_location`
--
ALTER TABLE `Pick_up_location`
  ADD PRIMARY KEY (`pick_up_location_id`);

--
-- Indizes für die Tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_insurance_id` (`fk_insurance_id`),
  ADD KEY `fk_pick_up_location_id` (`fk_pick_up_location_id`),
  ADD KEY `fk_drop_off_location_id` (`fk_drop_off_location_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `additional_charges_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_insurance_id`) REFERENCES `Insurance` (`insurance_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_pick_up_location_id`) REFERENCES `Pick_up_location` (`pick_up_location_id`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fk_drop_off_location_id`) REFERENCES `Drop_off_location` (`drop_off_location_id`),
  ADD CONSTRAINT `invoice_ibfk_6` FOREIGN KEY (`fk_additional_charges_id`) REFERENCES `additional_charges` (`additional_charges_id`),
  ADD CONSTRAINT `invoice_ibfk_7` FOREIGN KEY (`fk_reservation_id`) REFERENCES `Reservation` (`reservation_id`);

--
-- Constraints der Tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `Reservation_ibfk_3` FOREIGN KEY (`fk_insurance_id`) REFERENCES `Insurance` (`insurance_id`),
  ADD CONSTRAINT `Reservation_ibfk_4` FOREIGN KEY (`fk_pick_up_location_id`) REFERENCES `Pick_up_location` (`pick_up_location_id`),
  ADD CONSTRAINT `Reservation_ibfk_5` FOREIGN KEY (`fk_drop_off_location_id`) REFERENCES `Drop_off_location` (`drop_off_location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
