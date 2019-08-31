unlock tables;
CREATE DATABASE  IF NOT EXISTS `training-app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `training-app`;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `id` int(32)  NOT NULL AUTO_INCREMENT,
  `name` varchar(50)  NOT NULL,
  `amount` int(16)  NOT NULL,
  `kcal` int(16)  NOT NULL,
  `protein` int(16)  NOT NULL,
  `carbohydrates` int(16)  NOT NULL,
  `fat` int(16)  NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

LOCK TABLES `word` WRITE;
INSERT INTO `word` VALUES
	(1, 'woda', 100, 0, 0, 0, 0),
	(2, 'adow', 2, 0, 0, 0, 0);

UNLOCK TABLES;
