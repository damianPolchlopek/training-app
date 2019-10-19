unlock tables;
CREATE DATABASE  IF NOT EXISTS `training-app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `training-app`;


--
-- Table structure for table `statistic_history`
--

DROP TABLE IF EXISTS `statistic_history`;
CREATE TABLE `statistic_history` (
  `id` 				int(32)  	NOT NULL AUTO_INCREMENT,
  `date` 			date  		NOT NULL,
  `weight` 			double  	NOT NULL,
  `kcal` 			int(16)  	NOT NULL,
  `protein` 		int(16)  	NOT NULL,
  `carbohydrates` 	int(16)  	NOT NULL,
  `fat` 			int(16)  	NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistic_history`
--

LOCK TABLES `statistic_history` WRITE;
INSERT INTO `statistic_history` VALUES
	(1, '2019-08-01', 75, 0, 0, 0, 0),
	(2, '2019-08-02', 76, 0, 0, 0, 0),
	(3, '2019-08-03', 77, 0, 0, 0, 0),
	(4, '2019-08-04', 76, 0, 0, 0, 0),
	(5, '2019-08-05', 77, 0, 0, 0, 0),
	(6, '2019-08-06', 78, 0, 0, 0, 0),
	(7, '2019-08-07', 79, 0, 0, 0, 0);

UNLOCK TABLES;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `userr`;
CREATE TABLE `userr` (
  `id` 					int(32)  		NOT NULL AUTO_INCREMENT,		-- field needed to spring security
  `username` 			varchar(50)  	NOT NULL,
  `password` 			varchar(50)  	NOT NULL,
  `enabled` 			bool  			NOT NULL,
  `weight` 				int(16)  		NOT NULL,			-- parameter of user
  `weight_goal` 		int(16)  		NOT NULL,
  `height` 				int(16)  		NOT NULL,
  `age` 				int(16)  		NOT NULL,
  `calories_goal` 		int(16)  		NOT NULL, 			-- counted macro to daily goal
  `protein_goal` 		int(16)  		NOT NULL,
  `carbohydrates_goal` 	int(16)  		NOT NULL,
  `fat_goal` 			int(16)  		NOT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userr`
--

LOCK TABLES `userr` WRITE;
INSERT INTO `userr` VALUES
-- id, username, pass, enabled, weight, weight_goal, height, age, cal, protein, carbo, fat
	(1, 'damian', 'damian', true, 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 'a', 'a', true, 0, 0, 0, 0, 0, 0, 0, 0);

UNLOCK TABLES;


--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` 			int(32)  		NOT NULL AUTO_INCREMENT,
  `username` 	varchar(50)  	NOT NULL,
  `authority` 	varchar(50)  	NOT NULL,
  `user_id` 	bool  			NOT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserAuthority FOREIGN KEY (id)
  REFERENCES userr(id)

  
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
INSERT INTO `authority` VALUES
	(1, 'damian', 'USER', 1),
	(2, 'damian', 'ADMIN', 1);

UNLOCK TABLES;

--
-- Table structure for table `meal_category`
--

DROP TABLE IF EXISTS `meal_category`;
CREATE TABLE `meal_category` (
  `id` 		int(32)  		NOT NULL AUTO_INCREMENT,
  `name` 	varchar(50)  	NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal_category`
--

LOCK TABLES `meal_category` WRITE;
INSERT INTO `meal_category` VALUES
	(1, '1posilek'),
	(2, '2posilek'),
	(3, '3posilek'),
	(4, '4posilek'),
	(5, '5posilek');

UNLOCK TABLES;


--
-- Table structure for table `measurement_unit`
--

DROP TABLE IF EXISTS `measurement_unit`;
CREATE TABLE `measurement_unit` (
  `id` 		int(32)  		NOT NULL AUTO_INCREMENT,
  `name` 	varchar(50)  	NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement_unit`
--

LOCK TABLES `measurement_unit` WRITE;
INSERT INTO `measurement_unit` VALUES
	(1, 'kilogramy'),
	(2, 'litry');

UNLOCK TABLES;



--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `id` 					int(32)  		NOT NULL AUTO_INCREMENT,
  `name` 				varchar(50)  	NOT NULL,
  `measurement_unit_id` int(16) 		NOT NULL,
  `amount` 				int(16)  		NOT NULL,
  `kcal` 				int(16) 		NOT NULL,
  `protein` 			int(16)  		NOT NULL,
  `carbohydrates` 		int(16)  		NOT NULL,
  `fat` 				int(16)  		NOT NULL,
  `meal_category_id` 	int(16)  		NOT NULL,
	
  CONSTRAINT FK_MealMealCategory FOREIGN KEY(meal_category_id)
  REFERENCES meal_category(id),
  
  CONSTRAINT FK_MealMeasurementUnit FOREIGN KEY(measurement_unit_id)
  REFERENCES measurement_unit(id),
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
INSERT INTO `meal` VALUES
	(1, 'woda', 2, 100, 0, 0, 0, 0, 1),
    (2, 'kurczak', 1, 100, 0, 0, 0, 0, 1),
	(3, 'something', 1, 2, 0, 0, 0, 0, 2);

UNLOCK TABLES;


--
-- Table structure for table `favorite_meal`
--

DROP TABLE IF EXISTS `favorite_meal`;
CREATE TABLE `favorite_meal`(
	`id` 		int(16) 	NOT NULL AUTO_INCREMENT,
    `user_id` 	int(16) 	NOT NULL,
    `meal_id` 	int(16) 	NOT NULL,
    `amount` 	int(16) 	NOT NULL,
  
  CONSTRAINT FK_FavoriteMealMeal FOREIGN KEY(meal_id)
  REFERENCES meal(id),
  
  CONSTRAINT FK_FavoriteMealUserr FOREIGN KEY(user_id)
  REFERENCES userr(id),
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `favorite_meal`
--

LOCK TABLES `favorite_meal` WRITE;
INSERT INTO `favorite_meal` VALUES
	(1, 1, 1, 7),
	(2, 1, 2, 4);

UNLOCK TABLES;


--
-- Table structure for table `food_day`
--

DROP TABLE IF EXISTS `food_day`;
CREATE TABLE `food_day` (
  `id` 			int(32)  	NOT NULL AUTO_INCREMENT,
  `date` 		date 		NOT NULL, 
  `meal_id` 	int(32)  	NOT NULL,

  CONSTRAINT FK_FoodDayMeal FOREIGN KEY(meal_id)
  REFERENCES meal(id),
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_day`
--

LOCK TABLES `food_day` WRITE;
INSERT INTO `food_day` VALUES
	(1, '2019-08-01', 1),
	(2, '2019-08-02', 1),
	(3, '2019-08-03', 1),
	(4, '2019-08-04', 1),
	(5, '2019-08-05', 2),
	(6, '2019-08-06', 2),
	(7, '2019-08-07', 2);

UNLOCK TABLES;


