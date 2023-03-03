-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cake
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `AreaId` int NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(45) NOT NULL,
  `Pincode` int NOT NULL,
  `CityId` int NOT NULL,
  PRIMARY KEY (`AreaId`),
  KEY `CityId_idx` (`CityId`),
  CONSTRAINT `CityId` FOREIGN KEY (`CityId`) REFERENCES `city` (`CityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caketype`
--

DROP TABLE IF EXISTS `caketype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caketype` (
  `CakeId` int NOT NULL AUTO_INCREMENT,
  `CakeType` varchar(45) NOT NULL,
  PRIMARY KEY (`CakeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caketype`
--

LOCK TABLES `caketype` WRITE;
/*!40000 ALTER TABLE `caketype` DISABLE KEYS */;
/*!40000 ALTER TABLE `caketype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `CityId` int NOT NULL AUTO_INCREMENT,
  `CityName` varchar(45) NOT NULL,
  PRIMARY KEY (`CityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporatecustomer`
--

DROP TABLE IF EXISTS `corporatecustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporatecustomer` (
  `CorporateId` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(45) NOT NULL,
  `RegNo` varchar(45) NOT NULL,
  `ContactNo` varchar(12) NOT NULL,
  `AddressLine` varchar(50) NOT NULL,
  `CAreaId` int NOT NULL,
  `CLoginId` int NOT NULL,
  PRIMARY KEY (`CorporateId`),
  KEY `CLoginId_idx` (`CLoginId`),
  KEY `CAreaId_idx` (`CAreaId`),
  CONSTRAINT `CAreaId` FOREIGN KEY (`CAreaId`) REFERENCES `area` (`AreaId`),
  CONSTRAINT `CLoginId` FOREIGN KEY (`CLoginId`) REFERENCES `login` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporatecustomer`
--

LOCK TABLES `corporatecustomer` WRITE;
/*!40000 ALTER TABLE `corporatecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporatecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporatereq`
--

DROP TABLE IF EXISTS `corporatereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporatereq` (
  `ReqId` int NOT NULL AUTO_INCREMENT,
  `NoOfCakes` int NOT NULL,
  `Weight` double NOT NULL,
  `MaxPrice` double NOT NULL,
  `RCorporateId` int NOT NULL,
  PRIMARY KEY (`ReqId`),
  KEY `RCorporateId_idx` (`RCorporateId`),
  CONSTRAINT `RCorporateId` FOREIGN KEY (`RCorporateId`) REFERENCES `corporatecustomer` (`CorporateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporatereq`
--

LOCK TABLES `corporatereq` WRITE;
/*!40000 ALTER TABLE `corporatereq` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporatereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `ContactNo` varchar(12) NOT NULL,
  `AddressLine` varchar(50) NOT NULL,
  `AreaId` int NOT NULL,
  `Login_Id` int NOT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `CityId_idx` (`AreaId`),
  KEY `Login_Id_idx` (`Login_Id`),
  CONSTRAINT `City_Id` FOREIGN KEY (`AreaId`) REFERENCES `city` (`CityId`),
  CONSTRAINT `Login_Id` FOREIGN KEY (`Login_Id`) REFERENCES `login` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customizedorder`
--

DROP TABLE IF EXISTS `customizedorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customizedorder` (
  `COrderId` int NOT NULL AUTO_INCREMENT,
  `Weight` double NOT NULL,
  `Egg/Eggless` tinyint NOT NULL,
  `PhotoPrrint` tinyint(1) NOT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Price` double NOT NULL,
  `CShapeId` int NOT NULL,
  `CCustomerId` int NOT NULL,
  `CVendorId` int NOT NULL,
  `CFlavorId` int NOT NULL,
  PRIMARY KEY (`COrderId`),
  KEY `CShapeId_idx` (`CShapeId`),
  KEY `CCustomerId_idx` (`CCustomerId`),
  KEY `CVendor_idx` (`CVendorId`),
  KEY `CFlavor_idx` (`CFlavorId`),
  CONSTRAINT `CCustomerId` FOREIGN KEY (`CCustomerId`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `CFlavor` FOREIGN KEY (`CFlavorId`) REFERENCES `flavor` (`FlavorId`),
  CONSTRAINT `CShapeId` FOREIGN KEY (`CShapeId`) REFERENCES `shape` (`ShapeId`),
  CONSTRAINT `CVendor` FOREIGN KEY (`CVendorId`) REFERENCES `vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customizedorder`
--

LOCK TABLES `customizedorder` WRITE;
/*!40000 ALTER TABLE `customizedorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `customizedorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `Rating` int DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `FCustomerId` int NOT NULL,
  `FVendorId` int NOT NULL,
  `FProductId` int NOT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `VendorID_idx` (`FVendorId`),
  KEY `ProductId_idx` (`FProductId`),
  KEY `FCustomerId_idx` (`FCustomerId`),
  CONSTRAINT `FCustomerId` FOREIGN KEY (`FCustomerId`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `FProductId` FOREIGN KEY (`FProductId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `FVendorId` FOREIGN KEY (`FVendorId`) REFERENCES `vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavor`
--

DROP TABLE IF EXISTS `flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavor` (
  `FlavorId` int NOT NULL AUTO_INCREMENT,
  `Flavor` varchar(45) NOT NULL,
  PRIMARY KEY (`FlavorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavor`
--

LOCK TABLES `flavor` WRITE;
/*!40000 ALTER TABLE `flavor` DISABLE KEYS */;
/*!40000 ALTER TABLE `flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `LoginId` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Ans` varchar(45) NOT NULL,
  `QueId` int NOT NULL,
  `Roll_Id` int NOT NULL,
  PRIMARY KEY (`LoginId`),
  KEY `Roll_Id_idx` (`Roll_Id`),
  KEY `QueId_idx` (`QueId`),
  CONSTRAINT `QueId` FOREIGN KEY (`QueId`) REFERENCES `question` (`QueId`),
  CONSTRAINT `Roll_Id` FOREIGN KEY (`Roll_Id`) REFERENCES `usertype` (`Roll_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `Amount` double NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `DeliveryDate&Time` datetime NOT NULL,
  `OCustomerId` int NOT NULL,
  `OVendorId` int NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `VendorId_idx` (`OVendorId`),
  KEY `OCustomerId_idx` (`OCustomerId`),
  CONSTRAINT `OCustomerId` FOREIGN KEY (`OCustomerId`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `OVendorId` FOREIGN KEY (`OVendorId`) REFERENCES `vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderItemId` int NOT NULL AUTO_INCREMENT,
  `Quantity` int NOT NULL,
  `OrderId` int NOT NULL,
  `OProductId` int NOT NULL,
  PRIMARY KEY (`OrderItemId`),
  KEY `OrderId_idx` (`OrderId`),
  KEY `OProductId_idx` (`OProductId`),
  CONSTRAINT `OProductId` FOREIGN KEY (`OProductId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `OrderId` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `Amount` double NOT NULL,
  `PaymentMode` varchar(45) NOT NULL,
  `PDate` datetime NOT NULL,
  `TransactionId` int NOT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `POrderId` int NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `POrderId_idx` (`POrderId`),
  CONSTRAINT `POrderId` FOREIGN KEY (`POrderId`) REFERENCES `order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `Price` double NOT NULL,
  `Weight` double NOT NULL,
  `Image` blob NOT NULL,
  `Egg/Eggless` tinyint NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ShapeId` int NOT NULL,
  `PFlavorId` int NOT NULL,
  `PVendorId` int NOT NULL,
  `CakeId` int NOT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `VendorId_idx` (`PVendorId`),
  KEY `FlavorId_idx` (`PFlavorId`),
  KEY `CakeId_idx` (`CakeId`),
  KEY `ShapeId_idx` (`ShapeId`),
  CONSTRAINT `CakeId` FOREIGN KEY (`CakeId`) REFERENCES `caketype` (`CakeId`),
  CONSTRAINT `PFlavorId` FOREIGN KEY (`PFlavorId`) REFERENCES `flavor` (`FlavorId`),
  CONSTRAINT `PVendorId` FOREIGN KEY (`PVendorId`) REFERENCES `vendor` (`VendorId`),
  CONSTRAINT `ShapeId` FOREIGN KEY (`ShapeId`) REFERENCES `shape` (`ShapeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `QueId` int NOT NULL AUTO_INCREMENT,
  `SQuestion` varchar(45) NOT NULL,
  `Ans` varchar(45) NOT NULL,
  PRIMARY KEY (`QueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shape`
--

DROP TABLE IF EXISTS `shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shape` (
  `ShapeId` int NOT NULL AUTO_INCREMENT,
  `Shape` varchar(45) NOT NULL,
  PRIMARY KEY (`ShapeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shape`
--

LOCK TABLES `shape` WRITE;
/*!40000 ALTER TABLE `shape` DISABLE KEYS */;
/*!40000 ALTER TABLE `shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `Roll_Id` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`Roll_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VendorId` int NOT NULL AUTO_INCREMENT,
  `ShopName` varchar(45) NOT NULL,
  `Licence_No` varchar(45) NOT NULL,
  `ContactNo` varchar(12) NOT NULL,
  `Customisation` tinyint(1) DEFAULT '0',
  `AddressLine` varchar(50) NOT NULL,
  `VAreaId` int NOT NULL,
  `VLoginId` int NOT NULL,
  PRIMARY KEY (`VendorId`),
  KEY `CLoginId_idx` (`VLoginId`),
  KEY `VAreaId_idx` (`VAreaId`),
  CONSTRAINT `VAreaId` FOREIGN KEY (`VAreaId`) REFERENCES `area` (`AreaId`),
  CONSTRAINT `VLoginId` FOREIGN KEY (`VLoginId`) REFERENCES `login` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorresponse`
--

DROP TABLE IF EXISTS `vendorresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorresponse` (
  `ResId` int NOT NULL AUTO_INCREMENT,
  `TotalPrice` double NOT NULL,
  `ReqId` int NOT NULL,
  `RVendorId` int NOT NULL,
  PRIMARY KEY (`ResId`),
  KEY `RVendorId_idx` (`RVendorId`),
  KEY `ReqId_idx` (`ReqId`),
  CONSTRAINT `ReqId` FOREIGN KEY (`ReqId`) REFERENCES `corporatereq` (`ReqId`),
  CONSTRAINT `RVendorId` FOREIGN KEY (`RVendorId`) REFERENCES `vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorresponse`
--

LOCK TABLES `vendorresponse` WRITE;
/*!40000 ALTER TABLE `vendorresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorresponse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 22:08:24
