/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.1.29-rc-community : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `email` text,
  `username` text,
  `password` text,
  `usertype` text,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`name`,`email`,`username`,`password`,`usertype`,`status`) values (2,'Talha Ejaz','talhaejazup@gmail.com','talha539','12345','Admin','Active'),(3,'Hamza Sohail','sohailhamza@gmail.com','hamza544','1234','Receptionist','Active'),(4,'Junaid','junaid@gmail.com','junaid545','123','Receptionist','Active'),(21,'Usama Adil','usama@gmail.com','usama512','123','Admin','Block');

/*Table structure for table `reservation` */

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` text,
  `idproof` text,
  `contactno` text,
  `status` text,
  `roomid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `reservation` */

insert  into `reservation`(`id`,`customername`,`idproof`,`contactno`,`status`,`roomid`) values (2,'Hussam','351039878567','03126085609','Active',8),(3,'jjsh','65525959','0525598589','Active',9);

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text,
  `noofbeds` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `status` text,
  `assigned` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `room` */

insert  into `room`(`id`,`type`,`noofbeds`,`number`,`status`,`assigned`) values (8,'Standard',2,2,'Active','True'),(9,'Standard',2,3,'Active','True'),(10,'Standard',2,1,'Active','False'),(11,'Deluxe',2,4,'Active','False'),(12,'Deluxe',2,5,'Active','False'),(13,'Deluxe',2,6,'Active','False'),(14,'Standard',3,7,'Active','False'),(15,'Standard',3,8,'Active','False'),(16,'Standard',3,9,'Active','False'),(17,'Deluxe',3,10,'Active','False'),(18,'Deluxe',3,11,'Active','False'),(21,'Deluxe',3,12,'Active','False');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
