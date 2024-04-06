CREATE DATABASE  IF NOT EXISTS `perusahaan1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `perusahaan1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: perusahaan1
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `gaji`
--

DROP TABLE IF EXISTS `gaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaji` (
  `slip_gaji` int NOT NULL,
  `ID_Karyawan` int DEFAULT NULL,
  `ID_Potongan` int DEFAULT NULL,
  `ID_Tunjangan` int DEFAULT NULL,
  `GajiPokok` int DEFAULT NULL,
  `Bonus` int DEFAULT NULL,
  `TanggalPembayaran` date DEFAULT NULL,
  PRIMARY KEY (`slip_gaji`),
  KEY `ID_Karyawan` (`ID_Karyawan`),
  KEY `ID_Potongan` (`ID_Potongan`),
  KEY `ID_Tunjangan` (`ID_Tunjangan`),
  CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`ID_Potongan`) REFERENCES `potongangaji` (`ID_Potongan`),
  CONSTRAINT `gaji_ibfk_3` FOREIGN KEY (`ID_Tunjangan`) REFERENCES `tunjangankaryawan` (`ID_Tunjangan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaji`
--

LOCK TABLES `gaji` WRITE;
/*!40000 ALTER TABLE `gaji` DISABLE KEYS */;
INSERT INTO `gaji` VALUES (1234,1,1,111,5000000,50000,'2024-03-31'),(1235,2,2,112,4500000,30000,'2024-03-31'),(1236,3,2,113,4800000,40000,'2024-03-31'),(1237,4,1,111,5000000,50000,'2024-03-31'),(1238,5,2,112,4500000,30000,'2024-03-31');
/*!40000 ALTER TABLE `gaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karyawan` (
  `ID_Karyawan` int NOT NULL,
  `Nama_Karyawan` varchar(50) DEFAULT NULL,
  `Departemen` varchar(50) DEFAULT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Tanggal_Masuk` date DEFAULT NULL,
  `Lembur` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_Karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` VALUES (1,'Wahyu Ozorah Manurung','HR','Manager','1980-05-15','2010-01-01',1),(2,'Torang Four Yones Manullang','CEO','Excutive','1985-09-20','2015-03-10',1),(3,'Revo','Kepala bidang','Pemasaran','1980-05-15','2010-01-01',0),(4,'Pandu','IT','Back-end','1980-05-15','2010-01-01',1),(5,'Rizki','Keuangan','Akuntan','1990-12-12','2018-07-05',0);
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lembur`
--

DROP TABLE IF EXISTS `lembur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lembur` (
  `ID_lembur` int NOT NULL,
  `ID_Karyawan` int DEFAULT NULL,
  `Uang_Lembur` int DEFAULT NULL,
  PRIMARY KEY (`ID_lembur`),
  KEY `ID_Karyawan` (`ID_Karyawan`),
  CONSTRAINT `lembur_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lembur`
--

LOCK TABLES `lembur` WRITE;
/*!40000 ALTER TABLE `lembur` DISABLE KEYS */;
INSERT INTO `lembur` VALUES (1,1,500000),(2,2,500000);
/*!40000 ALTER TABLE `lembur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potongangaji`
--

DROP TABLE IF EXISTS `potongangaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potongangaji` (
  `ID_Potongan` int NOT NULL,
  `Nama_Potongan` varchar(50) DEFAULT NULL,
  `Persentase_Potongan` int DEFAULT NULL,
  PRIMARY KEY (`ID_Potongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potongangaji`
--

LOCK TABLES `potongangaji` WRITE;
/*!40000 ALTER TABLE `potongangaji` DISABLE KEYS */;
INSERT INTO `potongangaji` VALUES (1,'Potongan Kehadiran',5),(2,'Potongan Kehadiran',5),(3,'Potongan Kehadiran',5),(4,'Potongan Kehadiran',5),(5,'Potongan Kehadiran',5),(6,'Potongan Kehadiran',5);
/*!40000 ALTER TABLE `potongangaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tunjangankaryawan`
--

DROP TABLE IF EXISTS `tunjangankaryawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tunjangankaryawan` (
  `ID_Tunjangan` int NOT NULL,
  `Nama_Tunjangan` varchar(50) DEFAULT NULL,
  `Besaran_Tunjangan` int DEFAULT NULL,
  PRIMARY KEY (`ID_Tunjangan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tunjangankaryawan`
--

LOCK TABLES `tunjangankaryawan` WRITE;
/*!40000 ALTER TABLE `tunjangankaryawan` DISABLE KEYS */;
INSERT INTO `tunjangankaryawan` VALUES (6,'Tunjangan Kesehatan',300000),(111,'Tunjangan Kesehatan',300000),(112,'Tunjangan Kesehatan',300000),(113,'Tunjangan Kesehatan',300000),(114,'Tunjangan Kesehatan',300000),(115,'Tunjangan Kesehatan',300000);
/*!40000 ALTER TABLE `tunjangankaryawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'perusahaan1'
--

--
-- Dumping routines for database 'perusahaan1'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDataKaryawanGaji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDataKaryawanGaji`(
    IN karyawan_id INT
)
BEGIN
    -- Hapus data di tabel Gaji
    DELETE FROM Gaji WHERE ID_Karyawan = karyawan_id;

    -- Hapus data di tabel TunjanganKaryawan
    DELETE FROM TunjanganKaryawan WHERE ID_Tunjangan IN (SELECT ID_Tunjangan FROM Gaji WHERE ID_Karyawan = karyawan_id);

    -- Hapus data di tabel PotonganGaji
    DELETE FROM PotonganGaji WHERE ID_Potongan IN (SELECT ID_Potongan FROM Gaji WHERE ID_Karyawan = karyawan_id);

    -- Hapus data di tabel Lembur
    DELETE FROM Lembur WHERE ID_Karyawan = karyawan_id;

    -- Hapus data di tabel Karyawan
    DELETE FROM Karyawan WHERE ID_Karyawan = karyawan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadDataKaryawanGaji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadDataKaryawanGaji`(IN karyawan_id INT)
BEGIN
    -- Read data Karyawan
    SELECT * FROM Karyawan WHERE ID_Karyawan = karyawan_id;
    
    -- Read data Lembur
    SELECT * FROM Lembur WHERE ID_Karyawan = karyawan_id;
    
    -- Read data PotonganGaji
    SELECT * FROM PotonganGaji;
    
    -- Read data TunjanganKaryawan
    SELECT * FROM TunjanganKaryawan;
    
    -- Read data Gaji
    SELECT * FROM Gaji WHERE ID_Karyawan = karyawan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TambahDataKaryawanGaji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TambahDataKaryawanGaji`(
    IN id_karyawan INT,
    IN nama_karyawan VARCHAR(50),
    IN departemen VARCHAR(50),
    IN jabatan VARCHAR(50),
    IN tanggal_lahir DATE,
    IN tanggal_masuk DATE,
    IN lembur BOOLEAN,
    IN id_lembur INT,
    IN uang_lembur INT,
    IN id_potongan INT,
    IN nama_potongan VARCHAR(50),
    IN persentase_potongan INT,
    IN id_tunjangan INT,
    IN nama_tunjangan VARCHAR(50),
    IN besaran_tunjangan INT,
    IN slip_gaji INT,
    IN gaji_pokok INT,
    IN bonus INT,
    IN tanggal_pembayaran DATE
)
BEGIN
    -- Tambah data ke tabel Karyawan
    INSERT INTO Karyawan (ID_Karyawan, Nama_Karyawan, Departemen, Jabatan, Tanggal_Lahir, Tanggal_Masuk, Lembur)
    VALUES (id_karyawan, nama_karyawan, departemen, jabatan, tanggal_lahir, tanggal_masuk, lembur);

    -- Tambah data ke tabel Lembur
    INSERT INTO Lembur (ID_Lembur, ID_Karyawan, Uang_Lembur)
    VALUES (id_lembur, id_karyawan, uang_lembur);

    -- Tambah data ke tabel PotonganGaji
    INSERT INTO PotonganGaji (ID_Potongan, Nama_Potongan, Persentase_Potongan)
    VALUES (id_potongan, nama_potongan, persentase_potongan);

    -- Tambah data ke tabel TunjanganKaryawan
    INSERT INTO TunjanganKaryawan (ID_Tunjangan, Nama_Tunjangan, Besaran_Tunjangan)
    VALUES (id_tunjangan, nama_tunjangan, besaran_tunjangan);

    -- Tambah data ke tabel Gaji
    INSERT INTO Gaji (slip_gaji, ID_Karyawan, ID_Potongan, ID_Tunjangan, GajiPokok, Bonus, TanggalPembayaran)
    VALUES (slip_gaji, id_karyawan, id_potongan, id_tunjangan, gaji_pokok, bonus, tanggal_pembayaran);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDataKaryawanGaji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDataKaryawanGaji`(
    IN karyawan_id INT,
    IN nama_karyawan VARCHAR(50),
    IN departemen VARCHAR(50),
    IN jabatan VARCHAR(50),
    IN tanggal_lahir DATE,
    IN tanggal_masuk DATE,
    IN lembur BOOLEAN,
    IN uang_lembur INT,
    IN id_potongan INT,
    IN nama_potongan VARCHAR(50),
    IN persentase_potongan INT,
    IN id_tunjangan INT,
    IN nama_tunjangan VARCHAR(50),
    IN besaran_tunjangan INT,
    IN gaji_pokok INT,
    IN bonus INT,
    IN tanggal_pembayaran DATE
)
BEGIN
    -- Update data di tabel Karyawan
    UPDATE Karyawan
    SET Nama_Karyawan = nama_karyawan,
        Departemen = departemen,
        Jabatan = jabatan,
        Tanggal_Lahir = tanggal_lahir,
        Tanggal_Masuk = tanggal_masuk,
        Lembur = lembur
    WHERE ID_Karyawan = karyawan_id;

    -- Update data di tabel Lembur
    UPDATE Lembur
    SET Uang_Lembur = uang_lembur
    WHERE ID_Karyawan = karyawan_id;

    -- Update data di tabel PotonganGaji
    UPDATE PotonganGaji
    SET Nama_Potongan = nama_potongan,
        Persentase_Potongan = persentase_potongan
    WHERE ID_Potongan = id_potongan;

    -- Update data di tabel TunjanganKaryawan
    UPDATE TunjanganKaryawan
    SET Nama_Tunjangan = nama_tunjangan,
        Besaran_Tunjangan = besaran_tunjangan
    WHERE ID_Tunjangan = id_tunjangan;

    -- Update data di tabel Gaji
    UPDATE Gaji
    SET GajiPokok = gaji_pokok,
        Bonus = bonus,
        TanggalPembayaran = tanggal_pembayaran
    WHERE ID_Karyawan = karyawan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 16:30:03
