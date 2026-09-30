`event`-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               9.3.0 - MySQL Community Server - GPL
-- Server OS:                    macos15
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ConventionManagementSystem
DROP DATABASE IF EXISTS `ConventionManagementSystem`;
CREATE DATABASE IF NOT EXISTS `ConventionManagementSystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ConventionManagementSystem`;

-- Dumping structure for table ConventionManagementSystem.ATTENDEE
DROP TABLE IF EXISTS `ATTENDEE`;
CREATE TABLE IF NOT EXISTS `ATTENDEE` (
  `AttendeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`AttendeeID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.ATTENDEE: ~3 rows (approximately)
DELETE FROM `ATTENDEE`;
INSERT INTO `ATTENDEE` (`AttendeeID`, `Name`, `Email`, `Phone`) VALUES
	(1, 'Ghada Mohammed', 'ghada@gmail.com', '0564729102'),
	(2, 'Khalid Fahad', 'khalid@outlook.com', '0592738910'),
	(3, 'Sara Abdullah', 'sara@hotmail.com', '0574937219');

-- Dumping structure for table ConventionManagementSystem.CLIENT
DROP TABLE IF EXISTS `CLIENT`;
CREATE TABLE IF NOT EXISTS `CLIENT` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.CLIENT: ~2 rows (approximately)
DELETE FROM `CLIENT`;
INSERT INTO `CLIENT` (`ClientID`, `Name`, `Email`, `Phone`) VALUES
	(1, 'Mohammed Saad', 'mohammed@gmail.com', '0598463219'),
	(2, 'Nora Ahmad', 'nora@gmail.com', '0598236170');

-- Dumping structure for table ConventionManagementSystem.EVENT
DROP TABLE IF EXISTS `EVENT`;
CREATE TABLE IF NOT EXISTS `EVENT` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Description` text,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `TeamID` int NOT NULL,
  `ClientID` int NOT NULL,
  `VenueID` int NOT NULL,
  PRIMARY KEY (`EventID`),
  KEY `TeamID` (`TeamID`),
  KEY `ClientID` (`ClientID`),
  KEY `VenueID` (`VenueID`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `CLIENT` (`ClientID`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`VenueID`) REFERENCES `VENUE` (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.EVENT: ~2 rows (approximately)
DELETE FROM `EVENT`;
INSERT INTO `EVENT` (`EventID`, `Title`, `Description`, `Start_Date`, `End_Date`, `TeamID`, `ClientID`, `VenueID`) VALUES
	(1, 'AI Trends in 2025', 'A conference on emerging AI technologies and their impact on the industry.', '2025-04-14', '2025-04-17', 1, 2, 1),
	(2, 'Strategic Leadership Forum 2025', 'A high-level gathering of executives and thought leaders to discuss modern leadership challenges, decision-making frameworks, and sustainable strategies for organizational growth.', '2025-01-15', '2025-01-20', 2, 1, 2);

-- Dumping structure for table ConventionManagementSystem.HOSTS
DROP TABLE IF EXISTS `HOSTS`;
CREATE TABLE IF NOT EXISTS `HOSTS` (
  `EventID` int NOT NULL,
  `SpeakerID` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`EventID`,`SpeakerID`),
  KEY `SpeakerID` (`SpeakerID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `EVENT` (`EventID`),
  CONSTRAINT `hosts_ibfk_2` FOREIGN KEY (`SpeakerID`) REFERENCES `SPEAKER` (`SpeakerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.HOSTS: ~3 rows (approximately)
DELETE FROM `HOSTS`;
INSERT INTO `HOSTS` (`EventID`, `SpeakerID`, `Date`, `Time`) VALUES
	(1, 1, '2025-04-15', '10:30:00'),
	(1, 2, '2025-04-17', '14:00:00'),
	(2, 3, '2025-01-15', '12:00:00');

-- Dumping structure for table ConventionManagementSystem.ORGANIZER
DROP TABLE IF EXISTS `ORGANIZER`;
CREATE TABLE IF NOT EXISTS `ORGANIZER` (
  `OrganizerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `TeamID` int NOT NULL,
  PRIMARY KEY (`OrganizerID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `organizer_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.ORGANIZER: ~2 rows (approximately)
DELETE FROM `ORGANIZER`;
INSERT INTO `ORGANIZER` (`OrganizerID`, `Name`, `Email`, `Phone`, `Sex`, `TeamID`) VALUES
	(1, 'Maha Saud', 'maha@outlook.com', '0578990123', 'F', 1),
	(2, 'Abdulaziz Mohammed', 'abdulaziz@gmail.com', '0563748910', 'M', 2);

-- Dumping structure for table ConventionManagementSystem.SPEAKER
DROP TABLE IF EXISTS `SPEAKER`;
CREATE TABLE IF NOT EXISTS `SPEAKER` (
  `SpeakerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Field` varchar(100) NOT NULL,
  PRIMARY KEY (`SpeakerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.SPEAKER: ~3 rows (approximately)
DELETE FROM `SPEAKER`;
INSERT INTO `SPEAKER` (`SpeakerID`, `Name`, `Email`, `Phone`, `Field`) VALUES
	(1, 'Andrew Ng', 'AndrewNg@gmail.com', NULL, 'Artificial Intelligence - Machine Learning'),
	(2, 'Sam Altman', 'SamAltman@gmial.com', NULL, 'Generative AI - CEO of OpenAI'),
	(3, 'Bill Gates', 'BillGates@gmail.com', NULL, 'co-founded Microsoft');

-- Dumping structure for table ConventionManagementSystem.TEAM
DROP TABLE IF EXISTS `TEAM`;
CREATE TABLE IF NOT EXISTS `TEAM` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `LeaderID` int NOT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `LeaderID` (`LeaderID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`LeaderID`) REFERENCES `ORGANIZER` (`OrganizerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.TEAM: ~2 rows (approximately)
DELETE FROM `TEAM`;
INSERT INTO `TEAM` (`TeamID`, `LeaderID`) VALUES
	(1, 1),
	(2, 2);

-- Dumping structure for table ConventionManagementSystem.TICKET
DROP TABLE IF EXISTS `TICKET`;
CREATE TABLE IF NOT EXISTS `TICKET` (
  `TicketID` int NOT NULL AUTO_INCREMENT,
  `Price` decimal(10,2) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Tier` varchar(50) NOT NULL,
  `EventID` int NOT NULL,
  `AttendeeID` int NOT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `EventID` (`EventID`),
  KEY `AttendeeID` (`AttendeeID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `EVENT` (`EventID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`AttendeeID`) REFERENCES `ATTENDEE` (`AttendeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.TICKET: ~3 rows (approximately)
DELETE FROM `TICKET`;
INSERT INTO `TICKET` (`TicketID`, `Price`, `Booking_Date`, `Tier`, `EventID`, `AttendeeID`) VALUES
	(1, 1000.00, '2025-03-21', 'VIP', 1, 1),
	(2, 500.00, '2025-03-31', 'Silver', 1, 2),
	(3, 250.00, '2024-12-10', 'Regular', 2, 3);

-- Dumping structure for table ConventionManagementSystem.VENUE
DROP TABLE IF EXISTS `VENUE`;
CREATE TABLE IF NOT EXISTS `VENUE` (
  `VenueID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ConventionManagementSystem.VENUE: ~2 rows (approximately)
DELETE FROM `VENUE`;
INSERT INTO `VENUE` (`VenueID`, `Name`, `Location`, `Capacity`) VALUES
	(1, 'Riyadh Front Exhibitions & Conferences Center', 'RPPH+7PH, King Khalid International Airport, Riyadh 13413', 11530),
	(2, 'The Ritz-Carlton Riyadh', 'Area, Makkah Al Mukarramah Rd, Al Hada, Riyadh 11493', 1000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
