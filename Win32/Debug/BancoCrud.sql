CREATE DATABASE  IF NOT EXISTS `ajx_teste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ajx_teste`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ajx_teste
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `tabela_cliente`
--

DROP TABLE IF EXISTS `tabela_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `removido` tinyint(1) DEFAULT '0',
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_cliente`
--

LOCK TABLES `tabela_cliente` WRITE;
/*!40000 ALTER TABLE `tabela_cliente` DISABLE KEYS */;
INSERT INTO `tabela_cliente` VALUES (1,'43768478800','José de almeida ','1987-12-30','José@gmail.com',0,'2021-01-07 18:39:07'),(2,'78548484844','Antonio  Cristino ','2001-01-07','Antonio0292@gmail.com',0,'2021-01-07 18:50:39'),(3,'35478752880','','2007-01-07','maikonmorenfsdihfs@kljdkjash',-1,'2021-01-07 18:49:17'),(4,'78755484848','josé da silva ','2002-01-07','Silva.Silva@hotmail.com',0,'2021-01-07 18:49:10');
/*!40000 ALTER TABLE `tabela_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_cliente_telefone`
--

DROP TABLE IF EXISTS `tabela_cliente_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_cliente_telefone` (
  `telefone` varchar(11) NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `operadoraId` int(11) DEFAULT NULL,
  `removido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`telefone`),
  KEY `clienteId` (`clienteId`),
  KEY `operadoraId` (`operadoraId`),
  CONSTRAINT `tabela_cliente_telefone_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `tabela_cliente` (`cliente_id`),
  CONSTRAINT `tabela_cliente_telefone_ibfk_2` FOREIGN KEY (`operadoraId`) REFERENCES `tabela_operadora` (`operadoraId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_cliente_telefone`
--

LOCK TABLES `tabela_cliente_telefone` WRITE;
/*!40000 ALTER TABLE `tabela_cliente_telefone` DISABLE KEYS */;
INSERT INTO `tabela_cliente_telefone` VALUES ('14981987023',2,3,1),('14998848697',2,1,1),('14998587896',2,3,1),('75778748487',2,3,0),('14987587858',2,1,0);
/*!40000 ALTER TABLE `tabela_cliente_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_operadora`
--

DROP TABLE IF EXISTS `tabela_operadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_operadora` (
  `operadoraId` int(11) NOT NULL AUTO_INCREMENT,
  `operadora` varchar(10) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`operadoraId`),
  UNIQUE KEY `operadora` (`operadora`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_operadora`
--

LOCK TABLES `tabela_operadora` WRITE;
/*!40000 ALTER TABLE `tabela_operadora` DISABLE KEYS */;
INSERT INTO `tabela_operadora` VALUES (1,'VIVO','2021-01-07 17:51:48'),(2,'OI','2021-01-07 17:51:48'),(3,'TIM','2021-01-07 17:51:48'),(4,'CLARO','2021-01-07 17:51:48');
/*!40000 ALTER TABLE `tabela_operadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes`
--

DROP TABLE IF EXISTS `vw_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes` AS SELECT 
 1 AS `cliente_id`,
 1 AS `cpf`,
 1 AS `nome`,
 1 AS `data_nascimento`,
 1 AS `email`,
 1 AS `removido`,
 1 AS `data_hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_telefone`
--

DROP TABLE IF EXISTS `vw_telefone`;
/*!50001 DROP VIEW IF EXISTS `vw_telefone`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_telefone` AS SELECT 
 1 AS `telefone`,
 1 AS `operadora`,
 1 AS `cliente_id`,
 1 AS `removido`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ajx_teste'
--

--
-- Dumping routines for database 'ajx_teste'
--
/*!50003 DROP FUNCTION IF EXISTS `F_TemCPF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TemCPF`(NovoCpf varchar(11)) RETURNS tinyint(1)
return 
if((select count(cpf) from tabela_cliente where cpf = NovoCpf)>0,true,false) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_TemEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TemEmail`(NovoEmail varchar(255)) RETURNS tinyint(1)
return 
if((select count(email) from tabela_cliente where email = NovoEmail)>0,true,false) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_TemTelefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TemTelefone`(NovoTelefone varchar(11)) RETURNS tinyint(1)
return 
if((select count(telefone) from tabela_cliente_telefone where telefone = NovoTelefone)>0,true,false) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_Telefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Telefone`(in OperadoraId int, in ClienteId int, in Telefone varchar(11))
insert into tabela_cliente_telefone values (Telefone,ClienteId,OperadoraId,false) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes` AS select `tabela_cliente`.`cliente_id` AS `cliente_id`,`tabela_cliente`.`cpf` AS `cpf`,`tabela_cliente`.`nome` AS `nome`,`tabela_cliente`.`data_nascimento` AS `data_nascimento`,`tabela_cliente`.`email` AS `email`,`tabela_cliente`.`removido` AS `removido`,`tabela_cliente`.`data_hora` AS `data_hora` from `tabela_cliente` where (`tabela_cliente`.`removido` = FALSE) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_telefone`
--

/*!50001 DROP VIEW IF EXISTS `vw_telefone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_telefone` AS select `t`.`telefone` AS `telefone`,`o`.`operadora` AS `operadora`,`c`.`cliente_id` AS `cliente_id`,`t`.`removido` AS `removido` from ((`tabela_cliente` `c` join `tabela_operadora` `o`) join `tabela_cliente_telefone` `t`) where ((`c`.`cliente_id` = `t`.`clienteId`) and (`o`.`operadoraId` = `t`.`operadoraId`) and (`t`.`removido` = FALSE)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07 16:15:40
