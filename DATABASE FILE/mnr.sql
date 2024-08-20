-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table realestatephp.about
CREATE TABLE IF NOT EXISTS `about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.about: ~0 rows (approximately)
INSERT INTO `about` (`id`, `title`, `content`, `image`) VALUES
	(10, 'About Us', '<div id="pgc-w5d0dcc3394ac1-0-0" class="panel-grid-cell">\r\n<div id="panel-w5d0dcc3394ac1-0-0-0" class="so-panel widget widget_sow-editor panel-first-child panel-last-child" data-index="0">\r\n<div class="so-widget-sow-editor so-widget-sow-editor-base">\r\n<div class="siteorigin-widget-tinymce textwidget">\r\n<p class="text_all_p_tag_css">This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<p class="text_all_p_tag_css">This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project. (codeastro.com). This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<div id="pgc-w5d0dcc3394ac1-0-0" class="panel-grid-cell">\r\n<div id="panel-w5d0dcc3394ac1-0-0-0" class="so-panel widget widget_sow-editor panel-first-child panel-last-child" data-index="0">\r\n<div class="so-widget-sow-editor so-widget-sow-editor-base">\r\n<div class="siteorigin-widget-tinymce textwidget">\r\n<p class="text_all_p_tag_css">This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<p class="text_all_p_tag_css">This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project. (codeastro.com) This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'condos-pool.png');

-- Dumping structure for table realestatephp.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `auser` varchar(50) NOT NULL,
  `aemail` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `adob` date NOT NULL,
  `aphone` varchar(15) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.admin: ~0 rows (approximately)
INSERT INTO `admin` (`aid`, `auser`, `aemail`, `apass`, `adob`, `aphone`) VALUES
	(9, 'admin', 'admin@gmail.com', 'a29c57c6894dee6e8251510d58c07078ee3f49bf', '1994-12-06', '1470002569');

-- Dumping structure for table realestatephp.city
CREATE TABLE IF NOT EXISTS `city` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.city: ~5 rows (approximately)
INSERT INTO `city` (`cid`, `cname`, `sid`) VALUES
	(9, 'Olisphis', 3),
	(10, 'Alegas', 2),
	(11, 'Floson', 2),
	(12, 'Ulmore', 7),
	(13, 'Awrerton', 15);

-- Dumping structure for table realestatephp.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(250) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.contact: ~0 rows (approximately)
INSERT INTO `contact` (`cid`, `name`, `email`, `phone`, `subject`, `message`) VALUES
	(7, 'codeastro', 'asda@asd.com', '8888885454', 'codeastro.com', 'asdasdasd');

-- Dumping structure for table realestatephp.feedback
CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `fdescription` varchar(300) NOT NULL,
  `status` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.feedback: ~2 rows (approximately)
INSERT INTO `feedback` (`fid`, `uid`, `fdescription`, `status`, `date`) VALUES
	(7, 28, 'This is a demo feedback in order to use set it as Testimonial for the site. Just a simply dummy text rather than using lorem ipsum text lines.', 1, '2022-07-23 16:07:08'),
	(8, 33, 'This is great. This is just great. Hmmm, just a dummy text for users feedback.', 1, '2022-07-23 21:51:09');

-- Dumping structure for table realestatephp.property
CREATE TABLE IF NOT EXISTS `property` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pcontent` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  `bhk` varchar(50) NOT NULL,
  `stype` varchar(100) NOT NULL,
  `bedroom` int NOT NULL,
  `bathroom` int NOT NULL,
  `balcony` int NOT NULL,
  `kitchen` int NOT NULL,
  `hall` int NOT NULL,
  `floor` varchar(50) NOT NULL,
  `size` int NOT NULL,
  `price` int NOT NULL,
  `location` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `pimage` varchar(300) NOT NULL,
  `pimage1` varchar(300) NOT NULL,
  `pimage2` varchar(300) NOT NULL,
  `pimage3` varchar(300) NOT NULL,
  `pimage4` varchar(300) NOT NULL,
  `uid` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `mapimage` varchar(300) NOT NULL,
  `topmapimage` varchar(300) NOT NULL,
  `groundmapimage` varchar(300) NOT NULL,
  `totalfloor` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isFeatured` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.property: ~2 rows (approximately)
INSERT INTO `property` (`pid`, `title`, `pcontent`, `type`, `bhk`, `stype`, `bedroom`, `bathroom`, `balcony`, `kitchen`, `hall`, `floor`, `size`, `price`, `location`, `city`, `state`, `feature`, `pimage`, `pimage1`, `pimage2`, `pimage3`, `pimage4`, `uid`, `status`, `mapimage`, `topmapimage`, `groundmapimage`, `totalfloor`, `date`, `isFeatured`) VALUES
	(25, 'Zills Home', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690, '39 Bailey Drive', 'Floson', 'Colotana', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2022-07-22 22:29:20', 1),
	(30, 'Bungalo', '<p>A bungalow features a simple, low-profile design, often with a large porch or veranda. This architectural style originated in India during the British colonial period and became popular in Western countries in the early 20th century.</p>', 'house', '2 BHK', 'rent', 2, 3, 1, 1, 1, '1st Floor', 20, 150000, '38 Hilado St. Brgy. Villamonte', 'Bacolod City', 'Negros Occidental', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>3 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>No</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>House</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : 10</span> People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>No</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'body.jpg', 'rshmpg.jpg', 'body.jpg', 'body.jpg', 'rshmpg.jpg', 37, 'available', 'house-floor-plan.png', 'main-bg.jpg', '01.jpg', '1 Floor', '2024-05-28 11:42:18', 1);

-- Dumping structure for table realestatephp.state
CREATE TABLE IF NOT EXISTS `state` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.state: ~7 rows (approximately)
INSERT INTO `state` (`sid`, `sname`) VALUES
	(2, 'Colotana'),
	(3, 'Floaii'),
	(4, 'Virconsin'),
	(7, 'West Misstana\n\n'),
	(9, 'New Pennrk\n\n'),
	(10, 'Louiswa\n\n'),
	(15, 'Wisginia\n\n');

-- Dumping structure for table realestatephp.user
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `upass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `utype` varchar(50) NOT NULL,
  `uimage` varchar(300) NOT NULL,
  `ucountry` varchar(300) DEFAULT NULL,
  `reset_token` varchar(300) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.user: ~4 rows (approximately)
INSERT INTO `user` (`uid`, `uname`, `uemail`, `uphone`, `upass`, `utype`, `uimage`, `ucountry`, `reset_token`, `token_expiry`) VALUES
	(30, 'Thomas Olson', 'thomas@mail.com', '7896665555', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'avatarm7-min.jpg', NULL, NULL, NULL),
	(36, 'Joshua Grijaldo', 'admin@gmail.com', '9187566739', 'a29c57c6894dee6e8251510d58c07078ee3f49bf', 'agent', 'pexels-pixabay-358636.jpg', NULL, NULL, NULL),
	(37, 'Agent', 'agent@gmail.com', '0981738727', 'a29c57c6894dee6e8251510d58c07078ee3f49bf', 'agent', 'back_id.png', NULL, NULL, NULL),
	(38, 'user', 'user@gmail.com', '981738727', 'a29c57c6894dee6e8251510d58c07078ee3f49bf', 'user', 'front_id.png', NULL, NULL, NULL),
	(42, 'Joshua C. Grijado', 'grijaldo.joshua29@gmail.com', '0977162838', NULL, 'homeowner', '0123-37456_Front.png', 'Philippines', '0f08107ca926d7ac1658d7ac0efe7d9c96032ee32775c3f52f8da7bb84f0b73e897a933db0157e48ed6b74142a88c6ec2f1c', '2024-08-21 07:01:13');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
