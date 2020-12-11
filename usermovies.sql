-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'musical'),(2,'comedy'),(3,'drama'),(4,'animated'),(5,'fantasy'),(6,'romantic'),(7,'arthouse'),(8,'psychodelic'),(13,'arthouse1'),(14,' psychodelic1 '),(35,'science fiction'),(36,'action');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_actor` (
  `idMovie` int NOT NULL,
  `idActor` int NOT NULL,
  PRIMARY KEY (`idMovie`,`idActor`),
  KEY `FKewei5xtws1sxcjq5xaxdsbxl1` (`idActor`),
  CONSTRAINT `FKajtsjcm90a1mryw8yrf8d2844` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`id`),
  CONSTRAINT `FKewei5xtws1sxcjq5xaxdsbxl1` FOREIGN KEY (`idActor`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (1,1),(2,1),(35,1),(1,2),(1,3),(1,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,14),(4,15),(4,16),(4,17),(5,17),(5,18),(5,19);
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_director` (
  `idMovie` int NOT NULL,
  `idDirector` int NOT NULL,
  PRIMARY KEY (`idMovie`,`idDirector`),
  KEY `FKt97tuk875bmhmkfuljtrk5ti2` (`idDirector`),
  CONSTRAINT `FKm3b07h8prjfunjson3r57sx4a` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`id`),
  CONSTRAINT `FKt97tuk875bmhmkfuljtrk5ti2` FOREIGN KEY (`idDirector`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (1,10),(2,11),(3,12),(4,13),(5,13),(35,13);
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `year` year DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Green Mile',1999),(2,'Forrest Gump',1994),(3,'The Little Mermaid',1994),(4,'Moonlight Kingdom',2012),(5,'The Grand Budapest Hotel',2014),(35,'The Best Film',2008);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genres`
--

DROP TABLE IF EXISTS `movies_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_genres` (
  `movieSet_id` int NOT NULL,
  `genreSet_id` int NOT NULL,
  PRIMARY KEY (`movieSet_id`,`genreSet_id`),
  KEY `FKe1gub2tc3029nk75ya6w7jed3` (`genreSet_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genres`
--

LOCK TABLES `movies_genres` WRITE;
/*!40000 ALTER TABLE `movies_genres` DISABLE KEYS */;
INSERT INTO `movies_genres` VALUES (1,3),(1,5),(2,2),(2,3),(3,1),(3,4),(3,5),(4,2),(4,3),(5,2),(5,3),(35,1),(35,2),(35,7);
/*!40000 ALTER TABLE `movies_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Tom Hanks','actor'),(2,'Michael Clarke Duncan','actor'),(3,'David Morse','actor'),(4,'Bonnie Hunt','actor'),(5,'Robin Wright','actor'),(6,'Mykelti Williamson','actor'),(7,'Jodi Benson','actor'),(8,'Pat Carroll','actor'),(9,'Rene Auberjonois','actor'),(10,'Frank Darabont','director'),(11,'Robert Zemeckis','director'),(12,'John Musker','director'),(13,'Wes Anderson','director'),(14,'Ralph Fiennes','actor'),(15,'Tony Revolori','actor'),(16,'Adrien Brody','actor'),(17,'Edward Norton','actor'),(18,'Jared Gilman','actor'),(19,'Kara Hayward','actor'),(20,'adfslkj','director'),(21,'Yuri Chulyukin','director'),(22,'Nadezhda Rumyantseva','actor'),(23,'Nikolai Rybnikov','actor'),(25,'Svetlana Baskova','director'),(26,'Sergey Pakhomov','actor'),(27,'Vladimir Epifantsev','actor'),(29,'Svetlana Baskova1','director'),(30,'Sergey Pakhomov1','actor'),(31,' Vladimir Epifantsev1 ','actor'),(110,'The Wachowkis','director'),(111,'Keanu Reeves','actor'),(112,'Laurence Fishburne','actor'),(113,'Carrie-Anne Moss','actor'),(114,'Someone','director'),(115,'Pahom','actor'),(116,'Ryan Gosling','actor'),(117,'Joe Mama','director'),(118,'Pahomm','actor'),(119,'Garik Martirosyan','director'),(120,'Garik Harlamov','actor');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idusers_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'user','Mike Wazowski','mwazowski@mail.ru','mike');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movies'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 15:02:41
