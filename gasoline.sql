/*
SQLyog Ultimate v8.71 
MySQL - 5.5.20 : Database - gasoline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gasoline` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `gasoline`;

/*Table structure for table `accessory` */

DROP TABLE IF EXISTS `accessory`;

CREATE TABLE `accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory` */

/*Table structure for table `accessory_import` */

DROP TABLE IF EXISTS `accessory_import`;

CREATE TABLE `accessory_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_import` */

/*Table structure for table `accessory_import_detail` */

DROP TABLE IF EXISTS `accessory_import_detail`;

CREATE TABLE `accessory_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_import_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_import_detail` */

/*Table structure for table `accessory_in_stock` */

DROP TABLE IF EXISTS `accessory_in_stock`;

CREATE TABLE `accessory_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_in_stock` */

/*Table structure for table `accessory_kind` */

DROP TABLE IF EXISTS `accessory_kind`;

CREATE TABLE `accessory_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_kind` */

insert  into `accessory_kind`(`id`,`name`,`commission`,`note`,`status`) values (1,'Bếp',1000,'Bếp',1),(2,'Phụ kiện',2000,'Phụ kiện',1);

/*Table structure for table `accessory_sale` */

DROP TABLE IF EXISTS `accessory_sale`;

CREATE TABLE `accessory_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_sale` */

/*Table structure for table `accessory_sale_change_detail` */

DROP TABLE IF EXISTS `accessory_sale_change_detail`;

CREATE TABLE `accessory_sale_change_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_sale_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_sale_change_detail` */

/*Table structure for table `accessory_sale_detail` */

DROP TABLE IF EXISTS `accessory_sale_detail`;

CREATE TABLE `accessory_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_sale_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_sale_detail` */

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_cash` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`number`,`holder`,`bank`,`branch`,`organization_id`,`note`,`is_cash`) values (5,'Tiền mặt','Cao Huy Hoàng','Quang Trung','Quang Trung',1,'',1),(4,'6002201001366','Công ty TNHH Quang Trung','Agribank','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0),(7,'Tiền mặt','Hiệp Hương','Hiệp Hương','Hiệp Hương',14,'',1),(8,'34567890','Hiệp Hương','Sacombank','Gò Vấp, TP.HCM',14,'',0),(9,'050014822604','Công ty TNHH Quang Trung','Ngân hàng TMCP Sài Gòn Thương Tín','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0),(10,'112002659273','Công ty TNHH Quang Trung','Ngân hàng TMCP Công Thương Việt Nam','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0);

/*Table structure for table `attachment_file` */

DROP TABLE IF EXISTS `attachment_file`;

CREATE TABLE `attachment_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `attachment_file` */

/*Table structure for table `auto` */

DROP TABLE IF EXISTS `auto`;

CREATE TABLE `auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_date` date DEFAULT NULL,
  `auto_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auto` */

insert  into `auto`(`id`,`auto_date`,`auto_name`) values (118,'2019-03-22','in_stock'),(119,'2019-03-25','in_stock'),(120,'2019-03-26','in_stock'),(121,'2019-03-27','in_stock'),(122,'2019-03-28','in_stock'),(123,'2019-03-29','in_stock');

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `shell_12_price` double DEFAULT NULL,
  `shell_45_price` double DEFAULT NULL,
  `credit_date` int(2) DEFAULT NULL,
  `credit_amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `employee_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang hoat dong',
  `kind` int(1) DEFAULT '1' COMMENT '1:khach le, 2: khach si',
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account` text COLLATE utf8_unicode_ci,
  `tax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` text COLLATE utf8_unicode_ci,
  `is_gas` int(1) DEFAULT '0',
  `is_petro` int(1) DEFAULT '0',
  `is_good` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`code`,`name`,`organization_id`,`status`,`kind`,`address`,`phone`,`bank_account`,`tax`,`presenter`,`presenter_position`,`discount`,`is_gas`,`is_petro`,`is_good`) values (1,'TP','Công ty TNHH Gốm Tân Phát',1,1,2,'Lô số 164, Đường N1, Cụm công nghiệp Gốm sứ, Ấp 4, xã Tân Hạnh, Tp. Biên Hòa, Tỉnh Đồng Nai','0915. 87.36.37','','3603454432','Nguyễn Thị Thanh Thúy','Giám đốc','',1,0,0),(2,'LPGHH','Cửa hàng LPG Huy Hoàng',1,1,1,'Số 125/5 ấp Phú Tâm, xã Hòa Hiệp, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','0988789713','','123456789','Nguyễn Tiến Công','Giám đốc','CK1,HT5K',1,0,0),(9,'STXM','Cửa hàng Gas Sơn Trang',1,1,2,'Quốc lộ 55','2543777888','','','','','',1,0,0),(11,'TMPB','Cửa hàng LPG Tài Mai',1,1,2,'','','','','','','',0,0,0),(12,'ahtl','Ánh Hồng',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(13,'bbpt','Ba Bế',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(14,'bbl','Bảy Bàu Lâm',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(15,'bpb','Bắc Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(16,'hsbc','Hiền Soi Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(17,'mtlg','Mười Thuý',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(18,'thxm','Tấn Hùng',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(19,'tlpt','Thanh Liêm',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(20,'bcpb','Bé Cầu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(21,'chpb','Chí Hiếu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(22,'btpb','Bảy Thành',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(23,'bupb','Bưởi Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(24,'calg','Chị An',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(25,'capt','Carmelia Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(26,'qkxm','Quyền Kim',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(27,'ctsr','Chình Thức',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(28,'dhhb','Diệu Hiền',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(29,'dtbk','Duy Tuyên',1,1,2,'Bưng Kè, Xã Hoà Hiệp Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(30,'ddnth','Được Duy Nhất',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(31,'dpbc','Đại Phát',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(32,'gcbc','Gái Cường',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(33,'hbc','Hai Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(34,'hctl','Huyền Chương',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(35,'hdbk','Hoa Đào',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(36,'hhxm','Huy Hoàng Xuyên Mộc',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(37,'hhbk','Hà Hương Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(38,'hlbk','Hoàng Lịch Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(39,'hmsm','Hán Minh',1,1,2,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(40,'hphh','Hùng Phát',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(41,'hqpt','Hoàng Quân',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(42,'hvhb','Hoàn Vân',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(43,'kbcm','Khánh Bằng',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(44,'kclg','Kim Chi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(45,'ksbc','Kim Sương',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(46,'ktbr','Kim Trọng Bưng Riềng',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(47,'kthtl','Kim Thuý Hậu',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(48,'khhh','Kim Hoa',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(49,'lpb','Loan Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(50,'lbc','Linh Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(51,'lhbk','Lý Hải',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(52,'lpt','Liên Đội 3',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(53,'lspb','Lịch Sử',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(54,'lthh','Lài Thi',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(55,'ltsr','Long Tứ',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(56,'mcpb','Minh Châu Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(57,'mdbc','Mỹ Dung',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(58,'mdsr','Minh Điệp',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(59,'mdubc','Minh Đức',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(60,'mnbc','Mầm Non Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(61,'mtbl','Minh Tuấn',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(62,'mtlg','Minh Tú',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(63,'ndpb','Nguyễn Du',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(64,'ntbl','Nguyên Thảo',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(65,'nttt','Ngọc Tâm',1,1,2,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(66,'pd46','Phạm Đăng',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(67,'plbc','Phú Lộc',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(68,'pm46','Phúc Mai',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(69,'pt46','Phụng Tập',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(70,'ptsr','Phương Thảo Sông Ray',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(71,'phsm','Phú Hoàng',1,1,2,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(72,'pthsr','Pháp Thanh',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(73,'qhh','Quang Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(74,'qvpb','Quang Vinh',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(75,'shbl','Sỹ Hường',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(76,'shbc','Sáu Huế',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(77,'sbtr','Sanh Trại Gà',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(78,'stxm','Sơn Trang',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(79,'txm','Tùng Gas',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(80,'thh','Tâm Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(81,'tmpb','Tài Mai',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(82,'tbtr','Thanh Trại Gà',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(83,'tdbc','Thành Dung',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(84,'tdpt','Thảo Đại',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(85,'hpt','Huyền Trại Gà',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(86,'tghb','Trường Giang',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(87,'tbk','Tiên Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(88,'t46','Truyền',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',0,0,0),(89,'tmbc','Thiên Mướp',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(90,'ttpb','Thanh Tuý',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(91,'tslg','Tiến Sơn',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(92,'ttpt','Trung Thuận',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(93,'ttbc','Trung Thu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(94,'ttlg','Trung Thành',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(95,'tth','Thanh Tân Thắng',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(96,'tttt','Thành Tâm',1,1,2,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(97,'athh','Ái Thu',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(98,'ttbc','Tuấn Thanh',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(99,'tpt','Thanh Gò Cà Phước Thuận',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(100,'tktl','Thuỳ Khuyên',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(101,'tbk','Thơ Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(102,'thpt','Thuý Hoàng Phước Tân',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(103,'thpt','Toan Hoa',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(104,'tptl','Thuý Phương',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(105,'ttl','Thị Tân Lâm',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(106,'unpb','Út Nuôi',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(107,'vb46','Văn Bé',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(108,'vqhh','Vũ Quang',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(109,'xdbc','Xuân Đông',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(110,'xhh','Xuân Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(111,'xttl','Xuân Tú',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(112,'mhbc','Minh Hùng',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(113,'ta46','Tuấn Anh 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(114,'tth','Thuý Cầu Kiều',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(115,'dpt','Hùng Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(116,'htbk','Hương Thơm',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(117,'mpb','Mai Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(118,'ttbg','Tình Thuỷ',1,1,2,'Xã Bình Giã, Huyện Châu Đức, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(119,'hhhtn','Hồng Huyên',1,1,2,'Xã Hàm Thuận Nam, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(120,'ptpt','Phương Thảo Phan Thiết',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(121,'hhh','Huệ Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(122,'dhh','Dũng Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(123,'mhhb','Mỹ Hạnh',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(124,'htdn','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh',1,1,2,'39/1 Khu phố 3, Phường Tam Hiệp, Tp. Biên Hoà, Tỉnh Đồng Nai','','','3600874037','','','',1,0,0),(125,'cnpt','Chi nhánh Phan Thiết',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(126,'dhh','Đoàn Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(127,'mcbc','Minh Châu Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(128,'bdqt','Bò Đốt Quang Trung',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(129,'gxbc','Giang Xuân Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(130,'vht','Vàng Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(131,'tbk','Thắng Bàu Ma Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(132,'qth','Quang Thắng Hải',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(133,'vpb','Vân Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(134,'blqt','Bán lẻ',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(135,'tbxt','Tình Bắc',1,1,2,'Xã Xuân Tây, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(136,'hpbk','Hiếu Phượng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(137,'hhcm','Huy Hoàng Cẩm Mỹ',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(138,'ktbc','Kiều Trang',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(139,'tbk','Trọng Cầu 5',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(140,'th10','Tạp Hoá 10',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(141,'hcbc','Huy Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(142,'qpbtr','Quốc Phong',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(143,'hcplg','Hùng Cường Phát',1,1,2,'Xã Long Giao, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(144,'tnbk','Tuyết Nhi',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(145,'mhxm','Minh Hiền',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(146,'dpxd','Dũng Phượng',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(147,'c46','Cường 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(148,'athtn','Gas An Toàn Hàm Thuận Nam',1,1,2,'Thôn Lập Đức, Xã Tân Lập, Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','','',1,0,0),(149,'dhh','Diễm Đội 2 Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(150,'pnbk','Phúc Nguyên',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(151,'hhh','Hoa Đội 2',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(152,'spo','Công ty TNHH Supor Việt Nam',1,1,2,'Lô A-1-CN, KCN Mỹ Phước, phường Mỹ Phước, Thị Xã Bến Cát, Tỉnh Bình Dương','','','','','','',1,0,0),(153,'thsr','Thanh Hà',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(154,'sbk','Sơn Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(155,'hhb','Hoà Hoà Bình',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(156,'nhbtr','Ngọc Huyền',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(157,'htbc','Huyền Trang',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(158,'ttlg','Thanh Tuấn Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(159,'hpbr','Hương Phong Hồ Cốc',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(160,'anbk','Ánh Nhi',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(161,'nhcm','Nở Hoài',1,1,2,'Xã Hoàn Quân, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(162,'thxm','Triệu Huy',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(163,'ybtr','Tạp hoá Yến',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(164,'hbr','Hà Bưng Riềng',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(165,'tha','Công ty TNHH Dầu Khí Thiên Hà',1,1,2,'95 Trịnh Đình Thảo, phường Phú Trung, quận Tân Phú, Tp. HCM','','','','','','',1,0,0),(166,'ltl','Loan Tân Lâm',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(167,'nvqt','Nhân Viên Quang Trung',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(168,'dpt','Dung Cây Điệp',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(169,'pppt','Phương Phát',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(170,'udpt','Uyên Đan',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(171,'htcm','Hà Tuấn Cẩm Mỹ',1,1,2,'Xã Xuân Bảo, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(172,'ntlg','Ngọc Tân Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(173,'h46','Hoè Trại Gà 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(174,'vuc','Công ty TNHH Khí Hoá Lỏng Việt Úc',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(175,'alcm','Ánh Linh',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(176,'hbchau','Hải Bình Châu Xuyên Mộc',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(177,'thcm','Trí Hải',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(178,'mphh','Minh Phương',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(179,'qclg','Quang Châu',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(180,'hhh','Hồng Đội 5',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(181,'thh','Tuyết Đội 2',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(182,'athtb','Gas An Toàn Hàm Thuận Bắc',1,1,2,'Xã Hàm Thắng, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','','',1,0,0),(183,'ttbl','Thảo Toàn',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(184,'kacm','Kim Anh',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(185,'bpcm','Bảy Phước',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(186,'hhh','Hiền Đội 5',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(187,'bapb','Bình An',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(188,'bmpb','Bình Minh Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(189,'xhtb','Gas Xuân Hàm Thuận Bắc',1,1,2,'Thị trấn Phú Long, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','','',1,0,0),(190,'vcm','Gas Vui',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(191,'hbc','Ngọc Hà Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(192,'klhtn','Kim Liên',1,1,2,'Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','','',1,0,0),(193,'hlcm','Hải Linh',1,1,2,'Xã Lâm San, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(194,'mtbc','Minh Trọng',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(195,'tlg','Tuấn Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(196,'hpt','Cô Hương Phước Tân',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(197,'kthi','Kế Thi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(198,'dbc','Đoàn Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(199,'adung','Anh Dũng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(200,'hdung','Hoa Dũng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(201,'chue','Chị Huế Châu Đức',1,1,2,'','','','','','','',1,0,0),(202,'ttung','Thanh Tùng Châu Đức',1,1,2,'Châu Đức, Bà Rịa Vũng Tàu','','','','','','',1,0,0),(203,'bhoan','Bảo Hoan Châu Đức',1,1,2,'','','','','','','',1,0,0),(204,'hnghia','Hiếu Nghĩa',1,1,2,'','','','','','','',1,0,0),(205,'QT','Công ty TNHH Quang Trung',14,1,2,'','','','','','','',1,0,0);

/*Table structure for table `customer_document` */

DROP TABLE IF EXISTS `customer_document`;

CREATE TABLE `customer_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_document` */

/*Table structure for table `customer_in_stock` */

DROP TABLE IF EXISTS `customer_in_stock`;

CREATE TABLE `customer_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `shell_12` int(11) DEFAULT '0',
  `shell_45` int(11) DEFAULT '0',
  `amount` double DEFAULT '0',
  `transport_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_in_stock` */

insert  into `customer_in_stock`(`id`,`day`,`customer_id`,`shell_12`,`shell_45`,`amount`,`transport_amount`) values (41358,'2019-03-22',1,0,0,0,0),(41359,'2019-03-22',2,0,0,0,0),(41360,'2019-03-22',9,0,0,0,0),(41361,'2019-03-22',11,0,0,0,0),(41362,'2019-03-22',12,0,0,0,0),(41363,'2019-03-22',13,0,0,0,0),(41364,'2019-03-22',14,0,0,0,0),(41365,'2019-03-22',15,0,0,0,0),(41366,'2019-03-22',16,0,0,0,0),(41367,'2019-03-22',17,0,0,0,0),(41368,'2019-03-22',18,0,0,0,0),(41369,'2019-03-22',19,0,0,0,0),(41370,'2019-03-22',20,0,0,0,0),(41371,'2019-03-22',21,0,0,0,0),(41372,'2019-03-22',22,0,0,0,0),(41373,'2019-03-22',23,0,0,0,0),(41374,'2019-03-22',24,0,0,0,0),(41375,'2019-03-22',25,0,0,0,0),(41376,'2019-03-22',26,0,0,0,0),(41377,'2019-03-22',27,0,0,0,0),(41378,'2019-03-22',28,0,0,0,0),(41379,'2019-03-22',29,0,0,0,0),(41380,'2019-03-22',30,0,0,0,0),(41381,'2019-03-22',31,0,0,0,0),(41382,'2019-03-22',32,0,0,0,0),(41383,'2019-03-22',33,0,0,0,0),(41384,'2019-03-22',34,0,0,0,0),(41385,'2019-03-22',35,0,0,0,0),(41386,'2019-03-22',36,0,0,0,0),(41387,'2019-03-22',37,0,0,0,0),(41388,'2019-03-22',38,0,0,0,0),(41389,'2019-03-22',39,0,0,0,0),(41390,'2019-03-22',40,0,0,0,0),(41391,'2019-03-22',41,0,0,0,0),(41392,'2019-03-22',42,0,0,0,0),(41393,'2019-03-22',43,0,0,0,0),(41394,'2019-03-22',44,0,0,0,0),(41395,'2019-03-22',45,0,0,0,0),(41396,'2019-03-22',46,0,0,0,0),(41397,'2019-03-22',47,0,0,0,0),(41398,'2019-03-22',48,0,0,0,0),(41399,'2019-03-22',49,0,0,0,0),(41400,'2019-03-22',50,0,0,0,0),(41401,'2019-03-22',51,0,0,0,0),(41402,'2019-03-22',52,0,0,0,0),(41403,'2019-03-22',53,0,0,0,0),(41404,'2019-03-22',54,0,0,0,0),(41405,'2019-03-22',55,0,0,0,0),(41406,'2019-03-22',56,0,0,0,0),(41407,'2019-03-22',57,0,0,0,0),(41408,'2019-03-22',58,0,0,0,0),(41409,'2019-03-22',59,0,0,0,0),(41410,'2019-03-22',60,0,0,0,0),(41411,'2019-03-22',61,0,0,0,0),(41412,'2019-03-22',62,0,0,0,0),(41413,'2019-03-22',63,0,0,0,0),(41414,'2019-03-22',64,0,0,0,0),(41415,'2019-03-22',65,0,0,0,0),(41416,'2019-03-22',66,0,0,0,0),(41417,'2019-03-22',67,0,0,0,0),(41418,'2019-03-22',68,0,0,0,0),(41419,'2019-03-22',69,0,0,0,0),(41420,'2019-03-22',70,0,0,0,0),(41421,'2019-03-22',71,0,0,0,0),(41422,'2019-03-22',72,0,0,0,0),(41423,'2019-03-22',73,0,0,0,0),(41424,'2019-03-22',74,0,0,0,0),(41425,'2019-03-22',75,0,0,0,0),(41426,'2019-03-22',76,0,0,0,0),(41427,'2019-03-22',77,0,0,0,0),(41428,'2019-03-22',78,0,0,0,0),(41429,'2019-03-22',79,0,0,0,0),(41430,'2019-03-22',80,0,0,0,0),(41431,'2019-03-22',81,0,0,0,0),(41432,'2019-03-22',82,0,0,0,0),(41433,'2019-03-22',83,0,0,0,0),(41434,'2019-03-22',84,0,0,0,0),(41435,'2019-03-22',85,0,0,0,0),(41436,'2019-03-22',86,0,0,0,0),(41437,'2019-03-22',87,0,0,0,0),(41438,'2019-03-22',88,0,0,0,0),(41439,'2019-03-22',89,0,0,0,0),(41440,'2019-03-22',90,0,0,0,0),(41441,'2019-03-22',91,0,0,0,0),(41442,'2019-03-22',92,0,0,0,0),(41443,'2019-03-22',93,0,0,0,0),(41444,'2019-03-22',94,0,0,0,0),(41445,'2019-03-22',95,0,0,0,0),(41446,'2019-03-22',96,0,0,0,0),(41447,'2019-03-22',97,0,0,0,0),(41448,'2019-03-22',98,0,0,0,0),(41449,'2019-03-22',99,0,0,0,0),(41450,'2019-03-22',100,0,0,0,0),(41451,'2019-03-22',101,0,0,0,0),(41452,'2019-03-22',102,0,0,0,0),(41453,'2019-03-22',103,0,0,0,0),(41454,'2019-03-22',104,0,0,0,0),(41455,'2019-03-22',105,0,0,0,0),(41456,'2019-03-22',106,0,0,0,0),(41457,'2019-03-22',107,0,0,0,0),(41458,'2019-03-22',108,0,0,0,0),(41459,'2019-03-22',109,0,0,0,0),(41460,'2019-03-22',110,0,0,0,0),(41461,'2019-03-22',111,0,0,0,0),(41462,'2019-03-22',112,0,0,0,0),(41463,'2019-03-22',113,0,0,0,0),(41464,'2019-03-22',114,0,0,0,0),(41465,'2019-03-22',115,0,0,0,0),(41466,'2019-03-22',116,0,0,0,0),(41467,'2019-03-22',117,0,0,0,0),(41468,'2019-03-22',118,0,0,0,0),(41469,'2019-03-22',119,0,0,0,0),(41470,'2019-03-22',120,0,0,0,0),(41471,'2019-03-22',121,0,0,0,0),(41472,'2019-03-22',122,0,0,0,0),(41473,'2019-03-22',123,0,0,0,0),(41474,'2019-03-22',124,0,0,0,0),(41475,'2019-03-22',125,0,0,0,0),(41476,'2019-03-22',126,0,0,0,0),(41477,'2019-03-22',127,0,0,0,0),(41478,'2019-03-22',128,0,0,0,0),(41479,'2019-03-22',129,0,0,0,0),(41480,'2019-03-22',130,0,0,0,0),(41481,'2019-03-22',131,0,0,0,0),(41482,'2019-03-22',132,0,0,0,0),(41483,'2019-03-22',133,0,0,0,0),(41484,'2019-03-22',134,0,0,0,0),(41485,'2019-03-22',135,0,0,0,0),(41486,'2019-03-22',136,0,0,0,0),(41487,'2019-03-22',137,0,0,0,0),(41488,'2019-03-22',138,0,0,0,0),(41489,'2019-03-22',139,0,0,0,0),(41490,'2019-03-22',140,0,0,0,0),(41491,'2019-03-22',141,0,0,0,0),(41492,'2019-03-22',142,0,0,0,0),(41493,'2019-03-22',143,0,0,0,0),(41494,'2019-03-22',144,0,0,0,0),(41495,'2019-03-22',145,0,0,0,0),(41496,'2019-03-22',146,0,0,0,0),(41497,'2019-03-22',147,0,0,0,0),(41498,'2019-03-22',148,0,0,0,0),(41499,'2019-03-22',149,0,0,0,0),(41500,'2019-03-22',150,0,0,0,0),(41501,'2019-03-22',151,0,0,0,0),(41502,'2019-03-22',152,0,0,0,0),(41503,'2019-03-22',153,0,0,0,0),(41504,'2019-03-22',154,0,0,0,0),(41505,'2019-03-22',155,0,0,0,0),(41506,'2019-03-22',156,0,0,0,0),(41507,'2019-03-22',157,0,0,0,0),(41508,'2019-03-22',158,0,0,0,0),(41509,'2019-03-22',159,0,0,0,0),(41510,'2019-03-22',160,0,0,0,0),(41511,'2019-03-22',161,0,0,0,0),(41512,'2019-03-22',162,0,0,0,0),(41513,'2019-03-22',163,0,0,0,0),(41514,'2019-03-22',164,0,0,0,0),(41515,'2019-03-22',165,0,0,0,0),(41516,'2019-03-22',166,0,0,0,0),(41517,'2019-03-22',167,0,0,0,0),(41518,'2019-03-22',168,0,0,0,0),(41519,'2019-03-22',169,0,0,0,0),(41520,'2019-03-22',170,0,0,0,0),(41521,'2019-03-22',171,0,0,0,0),(41522,'2019-03-22',172,0,0,0,0),(41523,'2019-03-22',173,0,0,0,0),(41524,'2019-03-22',174,0,0,0,0),(41525,'2019-03-22',175,0,0,0,0),(41526,'2019-03-22',176,0,0,0,0),(41527,'2019-03-22',177,0,0,0,0),(41528,'2019-03-22',178,0,0,0,0),(41529,'2019-03-22',179,0,0,0,0),(41530,'2019-03-22',180,0,0,0,0),(41531,'2019-03-22',181,0,0,0,0),(41532,'2019-03-22',182,0,0,0,0),(41533,'2019-03-22',183,0,0,0,0),(41534,'2019-03-22',184,0,0,0,0),(41535,'2019-03-22',185,0,0,0,0),(41536,'2019-03-22',186,0,0,0,0),(41537,'2019-03-22',187,0,0,0,0),(41538,'2019-03-22',188,0,0,0,0),(41539,'2019-03-22',189,0,0,0,0),(41540,'2019-03-22',190,0,0,0,0),(41541,'2019-03-22',191,0,0,0,0),(41542,'2019-03-22',192,0,0,0,0),(41543,'2019-03-22',193,0,0,0,0),(41544,'2019-03-22',194,0,0,0,0),(41545,'2019-03-22',195,0,0,0,0),(41546,'2019-03-22',196,0,0,0,0),(41547,'2019-03-22',197,0,0,0,0),(41548,'2019-03-22',198,0,0,0,0),(41549,'2019-03-22',199,0,0,0,0),(41550,'2019-03-22',200,0,0,0,0),(41551,'2019-03-22',201,0,0,0,0),(41552,'2019-03-22',202,0,0,0,0),(41553,'2019-03-22',203,0,0,0,0),(41554,'2019-03-22',204,0,0,0,0),(41555,'2019-03-22',205,0,0,0,0),(41556,'2019-03-23',1,0,0,0,0),(41557,'2019-03-23',2,0,0,0,0),(41558,'2019-03-23',9,0,0,0,0),(41559,'2019-03-23',11,0,0,0,0),(41560,'2019-03-23',12,0,0,0,0),(41561,'2019-03-23',13,0,0,0,0),(41562,'2019-03-23',14,0,0,0,0),(41563,'2019-03-23',15,0,0,0,0),(41564,'2019-03-23',16,0,0,0,0),(41565,'2019-03-23',17,0,0,0,0),(41566,'2019-03-23',18,0,0,0,0),(41567,'2019-03-23',19,0,0,0,0),(41568,'2019-03-23',20,0,0,0,0),(41569,'2019-03-23',21,0,0,0,0),(41570,'2019-03-23',22,0,0,0,0),(41571,'2019-03-23',23,0,0,0,0),(41572,'2019-03-23',24,0,0,0,0),(41573,'2019-03-23',25,0,0,0,0),(41574,'2019-03-23',26,0,0,0,0),(41575,'2019-03-23',27,0,0,0,0),(41576,'2019-03-23',28,0,0,0,0),(41577,'2019-03-23',29,0,0,0,0),(41578,'2019-03-23',30,0,0,0,0),(41579,'2019-03-23',31,0,0,0,0),(41580,'2019-03-23',32,0,0,0,0),(41581,'2019-03-23',33,0,0,0,0),(41582,'2019-03-23',34,0,0,0,0),(41583,'2019-03-23',35,0,0,0,0),(41584,'2019-03-23',36,0,0,0,0),(41585,'2019-03-23',37,0,0,0,0),(41586,'2019-03-23',38,0,0,0,0),(41587,'2019-03-23',39,0,0,0,0),(41588,'2019-03-23',40,0,0,0,0),(41589,'2019-03-23',41,0,0,0,0),(41590,'2019-03-23',42,0,0,0,0),(41591,'2019-03-23',43,0,0,0,0),(41592,'2019-03-23',44,0,0,0,0),(41593,'2019-03-23',45,0,0,0,0),(41594,'2019-03-23',46,0,0,0,0),(41595,'2019-03-23',47,0,0,0,0),(41596,'2019-03-23',48,0,0,0,0),(41597,'2019-03-23',49,0,0,0,0),(41598,'2019-03-23',50,0,0,0,0),(41599,'2019-03-23',51,0,0,0,0),(41600,'2019-03-23',52,0,0,0,0),(41601,'2019-03-23',53,0,0,0,0),(41602,'2019-03-23',54,0,0,0,0),(41603,'2019-03-23',55,0,0,0,0),(41604,'2019-03-23',56,0,0,0,0),(41605,'2019-03-23',57,0,0,0,0),(41606,'2019-03-23',58,0,0,0,0),(41607,'2019-03-23',59,0,0,0,0),(41608,'2019-03-23',60,0,0,0,0),(41609,'2019-03-23',61,0,0,0,0),(41610,'2019-03-23',62,0,0,0,0),(41611,'2019-03-23',63,0,0,0,0),(41612,'2019-03-23',64,0,0,0,0),(41613,'2019-03-23',65,0,0,0,0),(41614,'2019-03-23',66,0,0,0,0),(41615,'2019-03-23',67,0,0,0,0),(41616,'2019-03-23',68,0,0,0,0),(41617,'2019-03-23',69,0,0,0,0),(41618,'2019-03-23',70,0,0,0,0),(41619,'2019-03-23',71,0,0,0,0),(41620,'2019-03-23',72,0,0,0,0),(41621,'2019-03-23',73,0,0,0,0),(41622,'2019-03-23',74,0,0,0,0),(41623,'2019-03-23',75,0,0,0,0),(41624,'2019-03-23',76,0,0,0,0),(41625,'2019-03-23',77,0,0,0,0),(41626,'2019-03-23',78,0,0,0,0),(41627,'2019-03-23',79,0,0,0,0),(41628,'2019-03-23',80,0,0,0,0),(41629,'2019-03-23',81,0,0,0,0),(41630,'2019-03-23',82,0,0,0,0),(41631,'2019-03-23',83,0,0,0,0),(41632,'2019-03-23',84,0,0,0,0),(41633,'2019-03-23',85,0,0,0,0),(41634,'2019-03-23',86,0,0,0,0),(41635,'2019-03-23',87,0,0,0,0),(41636,'2019-03-23',88,0,0,0,0),(41637,'2019-03-23',89,0,0,0,0),(41638,'2019-03-23',90,0,0,0,0),(41639,'2019-03-23',91,0,0,0,0),(41640,'2019-03-23',92,0,0,0,0),(41641,'2019-03-23',93,0,0,0,0),(41642,'2019-03-23',94,0,0,0,0),(41643,'2019-03-23',95,0,0,0,0),(41644,'2019-03-23',96,0,0,0,0),(41645,'2019-03-23',97,0,0,0,0),(41646,'2019-03-23',98,0,0,0,0),(41647,'2019-03-23',99,0,0,0,0),(41648,'2019-03-23',100,0,0,0,0),(41649,'2019-03-23',101,0,0,0,0),(41650,'2019-03-23',102,0,0,0,0),(41651,'2019-03-23',103,0,0,0,0),(41652,'2019-03-23',104,0,0,0,0),(41653,'2019-03-23',105,0,0,0,0),(41654,'2019-03-23',106,0,0,0,0),(41655,'2019-03-23',107,0,0,0,0),(41656,'2019-03-23',108,0,0,0,0),(41657,'2019-03-23',109,0,0,0,0),(41658,'2019-03-23',110,0,0,0,0),(41659,'2019-03-23',111,0,0,0,0),(41660,'2019-03-23',112,0,0,0,0),(41661,'2019-03-23',113,0,0,0,0),(41662,'2019-03-23',114,0,0,0,0),(41663,'2019-03-23',115,0,0,0,0),(41664,'2019-03-23',116,0,0,0,0),(41665,'2019-03-23',117,0,0,0,0),(41666,'2019-03-23',118,0,0,0,0),(41667,'2019-03-23',119,0,0,0,0),(41668,'2019-03-23',120,0,0,0,0),(41669,'2019-03-23',121,0,0,0,0),(41670,'2019-03-23',122,0,0,0,0),(41671,'2019-03-23',123,0,0,0,0),(41672,'2019-03-23',124,0,0,0,0),(41673,'2019-03-23',125,0,0,0,0),(41674,'2019-03-23',126,0,0,0,0),(41675,'2019-03-23',127,0,0,0,0),(41676,'2019-03-23',128,0,0,0,0),(41677,'2019-03-23',129,0,0,0,0),(41678,'2019-03-23',130,0,0,0,0),(41679,'2019-03-23',131,0,0,0,0),(41680,'2019-03-23',132,0,0,0,0),(41681,'2019-03-23',133,0,0,0,0),(41682,'2019-03-23',134,0,0,0,0),(41683,'2019-03-23',135,0,0,0,0),(41684,'2019-03-23',136,0,0,0,0),(41685,'2019-03-23',137,0,0,0,0),(41686,'2019-03-23',138,0,0,0,0),(41687,'2019-03-23',139,0,0,0,0),(41688,'2019-03-23',140,0,0,0,0),(41689,'2019-03-23',141,0,0,0,0),(41690,'2019-03-23',142,0,0,0,0),(41691,'2019-03-23',143,0,0,0,0),(41692,'2019-03-23',144,0,0,0,0),(41693,'2019-03-23',145,0,0,0,0),(41694,'2019-03-23',146,0,0,0,0),(41695,'2019-03-23',147,0,0,0,0),(41696,'2019-03-23',148,0,0,0,0),(41697,'2019-03-23',149,0,0,0,0),(41698,'2019-03-23',150,0,0,0,0),(41699,'2019-03-23',151,0,0,0,0),(41700,'2019-03-23',152,0,0,0,0),(41701,'2019-03-23',153,0,0,0,0),(41702,'2019-03-23',154,0,0,0,0),(41703,'2019-03-23',155,0,0,0,0),(41704,'2019-03-23',156,0,0,0,0),(41705,'2019-03-23',157,0,0,0,0),(41706,'2019-03-23',158,0,0,0,0),(41707,'2019-03-23',159,0,0,0,0),(41708,'2019-03-23',160,0,0,0,0),(41709,'2019-03-23',161,0,0,0,0),(41710,'2019-03-23',162,0,0,0,0),(41711,'2019-03-23',163,0,0,0,0),(41712,'2019-03-23',164,0,0,0,0),(41713,'2019-03-23',165,0,0,0,0),(41714,'2019-03-23',166,0,0,0,0),(41715,'2019-03-23',167,0,0,0,0),(41716,'2019-03-23',168,0,0,0,0),(41717,'2019-03-23',169,0,0,0,0),(41718,'2019-03-23',170,0,0,0,0),(41719,'2019-03-23',171,0,0,0,0),(41720,'2019-03-23',172,0,0,0,0),(41721,'2019-03-23',173,0,0,0,0),(41722,'2019-03-23',174,0,0,0,0),(41723,'2019-03-23',175,0,0,0,0),(41724,'2019-03-23',176,0,0,0,0),(41725,'2019-03-23',177,0,0,0,0),(41726,'2019-03-23',178,0,0,0,0),(41727,'2019-03-23',179,0,0,0,0),(41728,'2019-03-23',180,0,0,0,0),(41729,'2019-03-23',181,0,0,0,0),(41730,'2019-03-23',182,0,0,0,0),(41731,'2019-03-23',183,0,0,0,0),(41732,'2019-03-23',184,0,0,0,0),(41733,'2019-03-23',185,0,0,0,0),(41734,'2019-03-23',186,0,0,0,0),(41735,'2019-03-23',187,0,0,0,0),(41736,'2019-03-23',188,0,0,0,0),(41737,'2019-03-23',189,0,0,0,0),(41738,'2019-03-23',190,0,0,0,0),(41739,'2019-03-23',191,0,0,0,0),(41740,'2019-03-23',192,0,0,0,0),(41741,'2019-03-23',193,0,0,0,0),(41742,'2019-03-23',194,0,0,0,0),(41743,'2019-03-23',195,0,0,0,0),(41744,'2019-03-23',196,0,0,0,0),(41745,'2019-03-23',197,0,0,0,0),(41746,'2019-03-23',198,0,0,0,0),(41747,'2019-03-23',199,0,0,0,0),(41748,'2019-03-23',200,0,0,0,0),(41749,'2019-03-23',201,0,0,0,0),(41750,'2019-03-23',202,0,0,0,0),(41751,'2019-03-23',203,0,0,0,0),(41752,'2019-03-23',204,0,0,0,0),(41753,'2019-03-23',205,0,0,0,0),(41811,'2019-03-24',1,0,0,0,0),(41812,'2019-03-24',2,0,0,0,0),(41813,'2019-03-24',9,0,0,0,0),(41814,'2019-03-24',11,0,0,0,0),(41815,'2019-03-24',12,0,0,0,0),(41816,'2019-03-24',13,0,0,0,0),(41817,'2019-03-24',14,0,0,0,0),(41818,'2019-03-24',15,0,0,0,0),(41819,'2019-03-24',16,0,0,0,0),(41820,'2019-03-24',17,0,0,0,0),(41821,'2019-03-24',18,0,0,0,0),(41822,'2019-03-24',19,0,0,0,0),(41823,'2019-03-24',20,0,0,0,0),(41824,'2019-03-24',21,0,0,0,0),(41825,'2019-03-24',22,0,0,0,0),(41826,'2019-03-24',23,0,0,0,0),(41827,'2019-03-24',24,0,0,0,0),(41828,'2019-03-24',25,0,0,0,0),(41829,'2019-03-24',26,0,0,0,0),(41830,'2019-03-24',27,0,0,0,0),(41831,'2019-03-24',28,0,0,0,0),(41832,'2019-03-24',29,0,0,0,0),(41833,'2019-03-24',30,0,0,0,0),(41834,'2019-03-24',31,0,0,0,0),(41835,'2019-03-24',32,0,0,0,0),(41836,'2019-03-24',33,0,0,0,0),(41837,'2019-03-24',34,0,0,0,0),(41838,'2019-03-24',35,0,0,0,0),(41839,'2019-03-24',36,0,0,0,0),(41840,'2019-03-24',37,0,0,0,0),(41841,'2019-03-24',38,0,0,0,0),(41842,'2019-03-24',39,0,0,0,0),(41843,'2019-03-24',40,0,0,0,0),(41844,'2019-03-24',41,0,0,0,0),(41845,'2019-03-24',42,0,0,0,0),(41846,'2019-03-24',43,0,0,0,0),(41847,'2019-03-24',44,0,0,0,0),(41848,'2019-03-24',45,0,0,0,0),(41849,'2019-03-24',46,0,0,0,0),(41850,'2019-03-24',47,0,0,0,0),(41851,'2019-03-24',48,0,0,0,0),(41852,'2019-03-24',49,0,0,0,0),(41853,'2019-03-24',50,0,0,0,0),(41854,'2019-03-24',51,0,0,0,0),(41855,'2019-03-24',52,0,0,0,0),(41856,'2019-03-24',53,0,0,0,0),(41857,'2019-03-24',54,0,0,0,0),(41858,'2019-03-24',55,0,0,0,0),(41859,'2019-03-24',56,0,0,0,0),(41860,'2019-03-24',57,0,0,0,0),(41861,'2019-03-24',58,0,0,0,0),(41862,'2019-03-24',59,0,0,0,0),(41863,'2019-03-24',60,0,0,0,0),(41864,'2019-03-24',61,0,0,0,0),(41865,'2019-03-24',62,0,0,0,0),(41866,'2019-03-24',63,0,0,0,0),(41867,'2019-03-24',64,0,0,0,0),(41868,'2019-03-24',65,0,0,0,0),(41869,'2019-03-24',66,0,0,0,0),(41870,'2019-03-24',67,0,0,0,0),(41871,'2019-03-24',68,0,0,0,0),(41872,'2019-03-24',69,0,0,0,0),(41873,'2019-03-24',70,0,0,0,0),(41874,'2019-03-24',71,0,0,0,0),(41875,'2019-03-24',72,0,0,0,0),(41876,'2019-03-24',73,0,0,0,0),(41877,'2019-03-24',74,0,0,0,0),(41878,'2019-03-24',75,0,0,0,0),(41879,'2019-03-24',76,0,0,0,0),(41880,'2019-03-24',77,0,0,0,0),(41881,'2019-03-24',78,0,0,0,0),(41882,'2019-03-24',79,0,0,0,0),(41883,'2019-03-24',80,0,0,0,0),(41884,'2019-03-24',81,0,0,0,0),(41885,'2019-03-24',82,0,0,0,0),(41886,'2019-03-24',83,0,0,0,0),(41887,'2019-03-24',84,0,0,0,0),(41888,'2019-03-24',85,0,0,0,0),(41889,'2019-03-24',86,0,0,0,0),(41890,'2019-03-24',87,0,0,0,0),(41891,'2019-03-24',88,0,0,0,0),(41892,'2019-03-24',89,0,0,0,0),(41893,'2019-03-24',90,0,0,0,0),(41894,'2019-03-24',91,0,0,0,0),(41895,'2019-03-24',92,0,0,0,0),(41896,'2019-03-24',93,0,0,0,0),(41897,'2019-03-24',94,0,0,0,0),(41898,'2019-03-24',95,0,0,0,0),(41899,'2019-03-24',96,0,0,0,0),(41900,'2019-03-24',97,0,0,0,0),(41901,'2019-03-24',98,0,0,0,0),(41902,'2019-03-24',99,0,0,0,0),(41903,'2019-03-24',100,0,0,0,0),(41904,'2019-03-24',101,0,0,0,0),(41905,'2019-03-24',102,0,0,0,0),(41906,'2019-03-24',103,0,0,0,0),(41907,'2019-03-24',104,0,0,0,0),(41908,'2019-03-24',105,0,0,0,0),(41909,'2019-03-24',106,0,0,0,0),(41910,'2019-03-24',107,0,0,0,0),(41911,'2019-03-24',108,0,0,0,0),(41912,'2019-03-24',109,0,0,0,0),(41913,'2019-03-24',110,0,0,0,0),(41914,'2019-03-24',111,0,0,0,0),(41915,'2019-03-24',112,0,0,0,0),(41916,'2019-03-24',113,0,0,0,0),(41917,'2019-03-24',114,0,0,0,0),(41918,'2019-03-24',115,0,0,0,0),(41919,'2019-03-24',116,0,0,0,0),(41920,'2019-03-24',117,0,0,0,0),(41921,'2019-03-24',118,0,0,0,0),(41922,'2019-03-24',119,0,0,0,0),(41923,'2019-03-24',120,0,0,0,0),(41924,'2019-03-24',121,0,0,0,0),(41925,'2019-03-24',122,0,0,0,0),(41926,'2019-03-24',123,0,0,0,0),(41927,'2019-03-24',124,0,0,0,0),(41928,'2019-03-24',125,0,0,0,0),(41929,'2019-03-24',126,0,0,0,0),(41930,'2019-03-24',127,0,0,0,0),(41931,'2019-03-24',128,0,0,0,0),(41932,'2019-03-24',129,0,0,0,0),(41933,'2019-03-24',130,0,0,0,0),(41934,'2019-03-24',131,0,0,0,0),(41935,'2019-03-24',132,0,0,0,0),(41936,'2019-03-24',133,0,0,0,0),(41937,'2019-03-24',134,0,0,0,0),(41938,'2019-03-24',135,0,0,0,0),(41939,'2019-03-24',136,0,0,0,0),(41940,'2019-03-24',137,0,0,0,0),(41941,'2019-03-24',138,0,0,0,0),(41942,'2019-03-24',139,0,0,0,0),(41943,'2019-03-24',140,0,0,0,0),(41944,'2019-03-24',141,0,0,0,0),(41945,'2019-03-24',142,0,0,0,0),(41946,'2019-03-24',143,0,0,0,0),(41947,'2019-03-24',144,0,0,0,0),(41948,'2019-03-24',145,0,0,0,0),(41949,'2019-03-24',146,0,0,0,0),(41950,'2019-03-24',147,0,0,0,0),(41951,'2019-03-24',148,0,0,0,0),(41952,'2019-03-24',149,0,0,0,0),(41953,'2019-03-24',150,0,0,0,0),(41954,'2019-03-24',151,0,0,0,0),(41955,'2019-03-24',152,0,0,0,0),(41956,'2019-03-24',153,0,0,0,0),(41957,'2019-03-24',154,0,0,0,0),(41958,'2019-03-24',155,0,0,0,0),(41959,'2019-03-24',156,0,0,0,0),(41960,'2019-03-24',157,0,0,0,0),(41961,'2019-03-24',158,0,0,0,0),(41962,'2019-03-24',159,0,0,0,0),(41963,'2019-03-24',160,0,0,0,0),(41964,'2019-03-24',161,0,0,0,0),(41965,'2019-03-24',162,0,0,0,0),(41966,'2019-03-24',163,0,0,0,0),(41967,'2019-03-24',164,0,0,0,0),(41968,'2019-03-24',165,0,0,0,0),(41969,'2019-03-24',166,0,0,0,0),(41970,'2019-03-24',167,0,0,0,0),(41971,'2019-03-24',168,0,0,0,0),(41972,'2019-03-24',169,0,0,0,0),(41973,'2019-03-24',170,0,0,0,0),(41974,'2019-03-24',171,0,0,0,0),(41975,'2019-03-24',172,0,0,0,0),(41976,'2019-03-24',173,0,0,0,0),(41977,'2019-03-24',174,0,0,0,0),(41978,'2019-03-24',175,0,0,0,0),(41979,'2019-03-24',176,0,0,0,0),(41980,'2019-03-24',177,0,0,0,0),(41981,'2019-03-24',178,0,0,0,0),(41982,'2019-03-24',179,0,0,0,0),(41983,'2019-03-24',180,0,0,0,0),(41984,'2019-03-24',181,0,0,0,0),(41985,'2019-03-24',182,0,0,0,0),(41986,'2019-03-24',183,0,0,0,0),(41987,'2019-03-24',184,0,0,0,0),(41988,'2019-03-24',185,0,0,0,0),(41989,'2019-03-24',186,0,0,0,0),(41990,'2019-03-24',187,0,0,0,0),(41991,'2019-03-24',188,0,0,0,0),(41992,'2019-03-24',189,0,0,0,0),(41993,'2019-03-24',190,0,0,0,0),(41994,'2019-03-24',191,0,0,0,0),(41995,'2019-03-24',192,0,0,0,0),(41996,'2019-03-24',193,0,0,0,0),(41997,'2019-03-24',194,0,0,0,0),(41998,'2019-03-24',195,0,0,0,0),(41999,'2019-03-24',196,0,0,0,0),(42000,'2019-03-24',197,0,0,0,0),(42001,'2019-03-24',198,0,0,0,0),(42002,'2019-03-24',199,0,0,0,0),(42003,'2019-03-24',200,0,0,0,0),(42004,'2019-03-24',201,0,0,0,0),(42005,'2019-03-24',202,0,0,0,0),(42006,'2019-03-24',203,0,0,0,0),(42007,'2019-03-24',204,0,0,0,0),(42008,'2019-03-24',205,0,0,0,0),(42066,'2019-03-25',1,0,0,0,0),(42067,'2019-03-25',2,0,0,0,0),(42068,'2019-03-25',9,0,0,0,0),(42069,'2019-03-25',11,0,0,0,0),(42070,'2019-03-25',12,0,0,0,0),(42071,'2019-03-25',13,0,0,0,0),(42072,'2019-03-25',14,0,0,0,0),(42073,'2019-03-25',15,0,0,0,0),(42074,'2019-03-25',16,0,0,0,0),(42075,'2019-03-25',17,0,0,0,0),(42076,'2019-03-25',18,0,0,0,0),(42077,'2019-03-25',19,0,0,0,0),(42078,'2019-03-25',20,0,0,0,0),(42079,'2019-03-25',21,0,0,0,0),(42080,'2019-03-25',22,0,0,0,0),(42081,'2019-03-25',23,0,0,0,0),(42082,'2019-03-25',24,0,0,0,0),(42083,'2019-03-25',25,0,0,0,0),(42084,'2019-03-25',26,0,0,0,0),(42085,'2019-03-25',27,0,0,0,0),(42086,'2019-03-25',28,0,0,0,0),(42087,'2019-03-25',29,0,0,0,0),(42088,'2019-03-25',30,0,0,0,0),(42089,'2019-03-25',31,0,0,0,0),(42090,'2019-03-25',32,0,0,0,0),(42091,'2019-03-25',33,0,0,0,0),(42092,'2019-03-25',34,0,0,0,0),(42093,'2019-03-25',35,0,0,0,0),(42094,'2019-03-25',36,0,0,0,0),(42095,'2019-03-25',37,0,0,0,0),(42096,'2019-03-25',38,0,0,0,0),(42097,'2019-03-25',39,0,0,0,0),(42098,'2019-03-25',40,0,0,0,0),(42099,'2019-03-25',41,0,0,0,0),(42100,'2019-03-25',42,0,0,0,0),(42101,'2019-03-25',43,0,0,0,0),(42102,'2019-03-25',44,0,0,0,0),(42103,'2019-03-25',45,0,0,0,0),(42104,'2019-03-25',46,0,0,0,0),(42105,'2019-03-25',47,0,0,0,0),(42106,'2019-03-25',48,0,0,0,0),(42107,'2019-03-25',49,0,0,0,0),(42108,'2019-03-25',50,0,0,0,0),(42109,'2019-03-25',51,0,0,0,0),(42110,'2019-03-25',52,0,0,0,0),(42111,'2019-03-25',53,0,0,0,0),(42112,'2019-03-25',54,0,0,0,0),(42113,'2019-03-25',55,0,0,0,0),(42114,'2019-03-25',56,0,0,0,0),(42115,'2019-03-25',57,0,0,0,0),(42116,'2019-03-25',58,0,0,0,0),(42117,'2019-03-25',59,0,0,0,0),(42118,'2019-03-25',60,0,0,0,0),(42119,'2019-03-25',61,0,0,0,0),(42120,'2019-03-25',62,0,0,0,0),(42121,'2019-03-25',63,0,0,0,0),(42122,'2019-03-25',64,0,0,0,0),(42123,'2019-03-25',65,0,0,0,0),(42124,'2019-03-25',66,0,0,0,0),(42125,'2019-03-25',67,0,0,0,0),(42126,'2019-03-25',68,0,0,0,0),(42127,'2019-03-25',69,0,0,0,0),(42128,'2019-03-25',70,0,0,0,0),(42129,'2019-03-25',71,0,0,0,0),(42130,'2019-03-25',72,0,0,0,0),(42131,'2019-03-25',73,0,0,0,0),(42132,'2019-03-25',74,0,0,0,0),(42133,'2019-03-25',75,0,0,0,0),(42134,'2019-03-25',76,0,0,0,0),(42135,'2019-03-25',77,0,0,0,0),(42136,'2019-03-25',78,0,0,0,0),(42137,'2019-03-25',79,0,0,0,0),(42138,'2019-03-25',80,0,0,0,0),(42139,'2019-03-25',81,0,0,0,0),(42140,'2019-03-25',82,0,0,0,0),(42141,'2019-03-25',83,0,0,0,0),(42142,'2019-03-25',84,0,0,0,0),(42143,'2019-03-25',85,0,0,0,0),(42144,'2019-03-25',86,0,0,0,0),(42145,'2019-03-25',87,0,0,0,0),(42146,'2019-03-25',88,0,0,0,0),(42147,'2019-03-25',89,0,0,0,0),(42148,'2019-03-25',90,0,0,0,0),(42149,'2019-03-25',91,0,0,0,0),(42150,'2019-03-25',92,0,0,0,0),(42151,'2019-03-25',93,0,0,0,0),(42152,'2019-03-25',94,0,0,0,0),(42153,'2019-03-25',95,0,0,0,0),(42154,'2019-03-25',96,0,0,0,0),(42155,'2019-03-25',97,0,0,0,0),(42156,'2019-03-25',98,0,0,0,0),(42157,'2019-03-25',99,0,0,0,0),(42158,'2019-03-25',100,0,0,0,0),(42159,'2019-03-25',101,0,0,0,0),(42160,'2019-03-25',102,0,0,0,0),(42161,'2019-03-25',103,0,0,0,0),(42162,'2019-03-25',104,0,0,0,0),(42163,'2019-03-25',105,0,0,0,0),(42164,'2019-03-25',106,0,0,0,0),(42165,'2019-03-25',107,0,0,0,0),(42166,'2019-03-25',108,0,0,-500000,0),(42167,'2019-03-25',109,0,0,0,0),(42168,'2019-03-25',110,0,0,0,0),(42169,'2019-03-25',111,0,0,0,0),(42170,'2019-03-25',112,0,0,0,0),(42171,'2019-03-25',113,0,0,0,0),(42172,'2019-03-25',114,0,0,0,0),(42173,'2019-03-25',115,0,0,0,0),(42174,'2019-03-25',116,0,0,0,0),(42175,'2019-03-25',117,0,0,0,0),(42176,'2019-03-25',118,0,0,0,0),(42177,'2019-03-25',119,0,0,0,0),(42178,'2019-03-25',120,0,0,0,0),(42179,'2019-03-25',121,0,0,0,0),(42180,'2019-03-25',122,0,0,0,0),(42181,'2019-03-25',123,0,0,0,0),(42182,'2019-03-25',124,0,0,0,0),(42183,'2019-03-25',125,0,0,0,0),(42184,'2019-03-25',126,0,0,0,0),(42185,'2019-03-25',127,0,0,0,0),(42186,'2019-03-25',128,0,0,0,0),(42187,'2019-03-25',129,0,0,0,0),(42188,'2019-03-25',130,0,0,0,0),(42189,'2019-03-25',131,0,0,0,0),(42190,'2019-03-25',132,0,0,0,0),(42191,'2019-03-25',133,0,0,0,0),(42192,'2019-03-25',134,0,0,0,0),(42193,'2019-03-25',135,0,0,0,0),(42194,'2019-03-25',136,0,0,0,0),(42195,'2019-03-25',137,0,0,0,0),(42196,'2019-03-25',138,0,0,0,0),(42197,'2019-03-25',139,0,0,0,0),(42198,'2019-03-25',140,0,0,0,0),(42199,'2019-03-25',141,0,0,0,0),(42200,'2019-03-25',142,0,0,0,0),(42201,'2019-03-25',143,0,0,0,0),(42202,'2019-03-25',144,0,0,0,0),(42203,'2019-03-25',145,0,0,0,0),(42204,'2019-03-25',146,0,0,0,0),(42205,'2019-03-25',147,0,0,0,0),(42206,'2019-03-25',148,0,0,0,0),(42207,'2019-03-25',149,0,0,0,0),(42208,'2019-03-25',150,0,0,0,0),(42209,'2019-03-25',151,0,0,0,0),(42210,'2019-03-25',152,0,0,0,0),(42211,'2019-03-25',153,0,0,0,0),(42212,'2019-03-25',154,0,0,0,0),(42213,'2019-03-25',155,0,0,0,0),(42214,'2019-03-25',156,0,0,0,0),(42215,'2019-03-25',157,0,0,0,0),(42216,'2019-03-25',158,0,0,0,0),(42217,'2019-03-25',159,0,0,0,0),(42218,'2019-03-25',160,0,0,0,0),(42219,'2019-03-25',161,0,0,0,0),(42220,'2019-03-25',162,0,0,0,0),(42221,'2019-03-25',163,0,0,0,0),(42222,'2019-03-25',164,0,0,0,0),(42223,'2019-03-25',165,0,0,0,0),(42224,'2019-03-25',166,0,0,0,0),(42225,'2019-03-25',167,0,0,0,0),(42226,'2019-03-25',168,0,0,0,0),(42227,'2019-03-25',169,0,0,0,0),(42228,'2019-03-25',170,0,0,0,0),(42229,'2019-03-25',171,0,0,0,0),(42230,'2019-03-25',172,0,0,0,0),(42231,'2019-03-25',173,0,0,0,0),(42232,'2019-03-25',174,0,0,0,0),(42233,'2019-03-25',175,0,0,0,0),(42234,'2019-03-25',176,0,0,0,0),(42235,'2019-03-25',177,0,0,0,0),(42236,'2019-03-25',178,0,0,0,0),(42237,'2019-03-25',179,0,0,0,0),(42238,'2019-03-25',180,0,0,0,0),(42239,'2019-03-25',181,0,0,0,0),(42240,'2019-03-25',182,0,0,0,0),(42241,'2019-03-25',183,0,0,0,0),(42242,'2019-03-25',184,0,0,0,0),(42243,'2019-03-25',185,0,0,0,0),(42244,'2019-03-25',186,0,0,0,0),(42245,'2019-03-25',187,0,0,0,0),(42246,'2019-03-25',188,0,0,0,0),(42247,'2019-03-25',189,0,0,0,0),(42248,'2019-03-25',190,0,0,0,0),(42249,'2019-03-25',191,0,0,0,0),(42250,'2019-03-25',192,0,0,0,0),(42251,'2019-03-25',193,0,0,0,0),(42252,'2019-03-25',194,0,0,0,0),(42253,'2019-03-25',195,0,0,0,0),(42254,'2019-03-25',196,0,0,0,0),(42255,'2019-03-25',197,0,0,0,0),(42256,'2019-03-25',198,0,0,0,0),(42257,'2019-03-25',199,0,0,0,0),(42258,'2019-03-25',200,0,0,0,0),(42259,'2019-03-25',201,0,0,0,0),(42260,'2019-03-25',202,0,0,0,0),(42261,'2019-03-25',203,0,0,0,0),(42262,'2019-03-25',204,0,0,0,0),(42263,'2019-03-25',205,0,0,0,0),(42264,'2019-03-26',1,0,0,0,0),(42265,'2019-03-26',2,0,0,0,0),(42266,'2019-03-26',9,0,0,0,0),(42267,'2019-03-26',11,0,0,0,0),(42268,'2019-03-26',12,0,0,0,0),(42269,'2019-03-26',13,0,0,0,0),(42270,'2019-03-26',14,0,0,0,0),(42271,'2019-03-26',15,0,0,0,0),(42272,'2019-03-26',16,0,0,0,0),(42273,'2019-03-26',17,0,0,0,0),(42274,'2019-03-26',18,0,0,0,0),(42275,'2019-03-26',19,0,0,0,0),(42276,'2019-03-26',20,0,0,0,0),(42277,'2019-03-26',21,0,0,0,0),(42278,'2019-03-26',22,0,0,0,0),(42279,'2019-03-26',23,0,0,0,0),(42280,'2019-03-26',24,0,0,0,0),(42281,'2019-03-26',25,0,0,0,0),(42282,'2019-03-26',26,0,0,0,0),(42283,'2019-03-26',27,0,0,0,0),(42284,'2019-03-26',28,0,0,0,0),(42285,'2019-03-26',29,0,0,0,0),(42286,'2019-03-26',30,0,0,0,0),(42287,'2019-03-26',31,0,0,0,0),(42288,'2019-03-26',32,0,0,0,0),(42289,'2019-03-26',33,0,0,0,0),(42290,'2019-03-26',34,0,0,0,0),(42291,'2019-03-26',35,0,0,0,0),(42292,'2019-03-26',36,0,0,0,0),(42293,'2019-03-26',37,0,0,0,0),(42294,'2019-03-26',38,0,0,0,0),(42295,'2019-03-26',39,0,0,0,0),(42296,'2019-03-26',40,0,0,0,0),(42297,'2019-03-26',41,0,0,0,0),(42298,'2019-03-26',42,0,0,0,0),(42299,'2019-03-26',43,0,0,0,0),(42300,'2019-03-26',44,0,0,0,0),(42301,'2019-03-26',45,0,0,0,0),(42302,'2019-03-26',46,0,0,0,0),(42303,'2019-03-26',47,0,0,0,0),(42304,'2019-03-26',48,0,0,0,0),(42305,'2019-03-26',49,0,0,0,0),(42306,'2019-03-26',50,0,0,0,0),(42307,'2019-03-26',51,0,0,0,0),(42308,'2019-03-26',52,0,0,0,0),(42309,'2019-03-26',53,0,0,0,0),(42310,'2019-03-26',54,0,0,0,0),(42311,'2019-03-26',55,0,0,0,0),(42312,'2019-03-26',56,0,0,0,0),(42313,'2019-03-26',57,0,0,0,0),(42314,'2019-03-26',58,0,0,0,0),(42315,'2019-03-26',59,0,0,0,0),(42316,'2019-03-26',60,0,0,0,0),(42317,'2019-03-26',61,0,0,0,0),(42318,'2019-03-26',62,0,0,0,0),(42319,'2019-03-26',63,0,0,0,0),(42320,'2019-03-26',64,0,0,0,0),(42321,'2019-03-26',65,0,0,0,0),(42322,'2019-03-26',66,0,0,0,0),(42323,'2019-03-26',67,0,0,0,0),(42324,'2019-03-26',68,0,0,0,0),(42325,'2019-03-26',69,0,0,0,0),(42326,'2019-03-26',70,0,0,0,0),(42327,'2019-03-26',71,0,0,0,0),(42328,'2019-03-26',72,0,0,0,0),(42329,'2019-03-26',73,0,0,0,0),(42330,'2019-03-26',74,0,0,0,0),(42331,'2019-03-26',75,0,0,0,0),(42332,'2019-03-26',76,0,0,0,0),(42333,'2019-03-26',77,0,0,0,0),(42334,'2019-03-26',78,0,0,0,0),(42335,'2019-03-26',79,0,0,0,0),(42336,'2019-03-26',80,0,0,0,0),(42337,'2019-03-26',81,0,0,0,0),(42338,'2019-03-26',82,0,0,0,0),(42339,'2019-03-26',83,0,0,0,0),(42340,'2019-03-26',84,0,0,0,0),(42341,'2019-03-26',85,0,0,0,0),(42342,'2019-03-26',86,0,0,0,0),(42343,'2019-03-26',87,0,0,0,0),(42344,'2019-03-26',88,0,0,0,0),(42345,'2019-03-26',89,0,0,0,0),(42346,'2019-03-26',90,0,0,0,0),(42347,'2019-03-26',91,0,0,0,0),(42348,'2019-03-26',92,0,0,0,0),(42349,'2019-03-26',93,0,0,0,0),(42350,'2019-03-26',94,0,0,0,0),(42351,'2019-03-26',95,0,0,0,0),(42352,'2019-03-26',96,0,0,0,0),(42353,'2019-03-26',97,0,0,0,0),(42354,'2019-03-26',98,0,0,0,0),(42355,'2019-03-26',99,0,0,0,0),(42356,'2019-03-26',100,0,0,0,0),(42357,'2019-03-26',101,0,0,0,0),(42358,'2019-03-26',102,0,0,0,0),(42359,'2019-03-26',103,0,0,0,0),(42360,'2019-03-26',104,0,0,0,0),(42361,'2019-03-26',105,0,0,0,0),(42362,'2019-03-26',106,0,0,0,0),(42363,'2019-03-26',107,0,0,0,0),(42364,'2019-03-26',108,0,0,-500000,0),(42365,'2019-03-26',109,0,0,0,0),(42366,'2019-03-26',110,0,0,0,0),(42367,'2019-03-26',111,0,0,0,0),(42368,'2019-03-26',112,0,0,0,0),(42369,'2019-03-26',113,0,0,0,0),(42370,'2019-03-26',114,0,0,0,0),(42371,'2019-03-26',115,0,0,0,0),(42372,'2019-03-26',116,0,0,0,0),(42373,'2019-03-26',117,0,0,0,0),(42374,'2019-03-26',118,0,0,0,0),(42375,'2019-03-26',119,0,0,0,0),(42376,'2019-03-26',120,0,0,0,0),(42377,'2019-03-26',121,0,0,0,0),(42378,'2019-03-26',122,0,0,0,0),(42379,'2019-03-26',123,0,0,0,0),(42380,'2019-03-26',124,0,0,0,0),(42381,'2019-03-26',125,0,0,0,0),(42382,'2019-03-26',126,0,0,0,0),(42383,'2019-03-26',127,0,0,0,0),(42384,'2019-03-26',128,0,0,0,0),(42385,'2019-03-26',129,0,0,0,0),(42386,'2019-03-26',130,0,0,0,0),(42387,'2019-03-26',131,0,0,0,0),(42388,'2019-03-26',132,0,0,0,0),(42389,'2019-03-26',133,0,0,0,0),(42390,'2019-03-26',134,0,0,0,0),(42391,'2019-03-26',135,0,0,0,0),(42392,'2019-03-26',136,0,0,0,0),(42393,'2019-03-26',137,0,0,0,0),(42394,'2019-03-26',138,0,0,0,0),(42395,'2019-03-26',139,0,0,0,0),(42396,'2019-03-26',140,0,0,0,0),(42397,'2019-03-26',141,0,0,0,0),(42398,'2019-03-26',142,0,0,0,0),(42399,'2019-03-26',143,0,0,0,0),(42400,'2019-03-26',144,0,0,0,0),(42401,'2019-03-26',145,0,0,0,0),(42402,'2019-03-26',146,0,0,0,0),(42403,'2019-03-26',147,0,0,0,0),(42404,'2019-03-26',148,0,0,0,0),(42405,'2019-03-26',149,0,0,0,0),(42406,'2019-03-26',150,0,0,0,0),(42407,'2019-03-26',151,0,0,0,0),(42408,'2019-03-26',152,0,0,0,0),(42409,'2019-03-26',153,0,0,0,0),(42410,'2019-03-26',154,0,0,0,0),(42411,'2019-03-26',155,0,0,0,0),(42412,'2019-03-26',156,0,0,0,0),(42413,'2019-03-26',157,0,0,0,0),(42414,'2019-03-26',158,0,0,0,0),(42415,'2019-03-26',159,0,0,0,0),(42416,'2019-03-26',160,0,0,0,0),(42417,'2019-03-26',161,0,0,0,0),(42418,'2019-03-26',162,0,0,0,0),(42419,'2019-03-26',163,0,0,0,0),(42420,'2019-03-26',164,0,0,0,0),(42421,'2019-03-26',165,0,0,0,0),(42422,'2019-03-26',166,0,0,0,0),(42423,'2019-03-26',167,0,0,0,0),(42424,'2019-03-26',168,0,0,0,0),(42425,'2019-03-26',169,0,0,0,0),(42426,'2019-03-26',170,0,0,0,0),(42427,'2019-03-26',171,0,0,0,0),(42428,'2019-03-26',172,0,0,0,0),(42429,'2019-03-26',173,0,0,0,0),(42430,'2019-03-26',174,0,0,0,0),(42431,'2019-03-26',175,0,0,0,0),(42432,'2019-03-26',176,0,0,0,0),(42433,'2019-03-26',177,0,0,0,0),(42434,'2019-03-26',178,0,0,0,0),(42435,'2019-03-26',179,0,0,0,0),(42436,'2019-03-26',180,0,0,0,0),(42437,'2019-03-26',181,0,0,0,0),(42438,'2019-03-26',182,0,0,0,0),(42439,'2019-03-26',183,0,0,0,0),(42440,'2019-03-26',184,0,0,0,0),(42441,'2019-03-26',185,0,0,0,0),(42442,'2019-03-26',186,0,0,0,0),(42443,'2019-03-26',187,0,0,0,0),(42444,'2019-03-26',188,0,0,0,0),(42445,'2019-03-26',189,0,0,0,0),(42446,'2019-03-26',190,0,0,0,0),(42447,'2019-03-26',191,0,0,0,0),(42448,'2019-03-26',192,0,0,0,0),(42449,'2019-03-26',193,0,0,0,0),(42450,'2019-03-26',194,0,0,0,0),(42451,'2019-03-26',195,0,0,0,0),(42452,'2019-03-26',196,0,0,0,0),(42453,'2019-03-26',197,0,0,0,0),(42454,'2019-03-26',198,0,0,0,0),(42455,'2019-03-26',199,0,0,0,0),(42456,'2019-03-26',200,0,0,0,0),(42457,'2019-03-26',201,0,0,0,0),(42458,'2019-03-26',202,0,0,0,0),(42459,'2019-03-26',203,0,0,0,0),(42460,'2019-03-26',204,0,0,0,0),(42461,'2019-03-26',205,0,0,0,0),(42462,'2019-03-27',1,0,0,0,0),(42463,'2019-03-27',2,0,0,0,0),(42464,'2019-03-27',9,0,0,0,0),(42465,'2019-03-27',11,0,0,0,0),(42466,'2019-03-27',12,0,0,0,0),(42467,'2019-03-27',13,0,0,0,0),(42468,'2019-03-27',14,0,0,0,0),(42469,'2019-03-27',15,0,0,0,0),(42470,'2019-03-27',16,0,0,0,0),(42471,'2019-03-27',17,0,0,0,0),(42472,'2019-03-27',18,0,0,0,0),(42473,'2019-03-27',19,0,0,0,0),(42474,'2019-03-27',20,0,0,0,0),(42475,'2019-03-27',21,0,0,0,0),(42476,'2019-03-27',22,0,0,0,0),(42477,'2019-03-27',23,0,0,0,0),(42478,'2019-03-27',24,0,0,0,0),(42479,'2019-03-27',25,0,0,0,0),(42480,'2019-03-27',26,0,0,0,0),(42481,'2019-03-27',27,0,0,0,0),(42482,'2019-03-27',28,0,0,0,0),(42483,'2019-03-27',29,0,0,0,0),(42484,'2019-03-27',30,0,0,0,0),(42485,'2019-03-27',31,0,0,0,0),(42486,'2019-03-27',32,0,0,0,0),(42487,'2019-03-27',33,0,0,0,0),(42488,'2019-03-27',34,0,0,0,0),(42489,'2019-03-27',35,0,0,0,0),(42490,'2019-03-27',36,0,0,0,0),(42491,'2019-03-27',37,0,0,0,0),(42492,'2019-03-27',38,0,0,0,0),(42493,'2019-03-27',39,0,0,0,0),(42494,'2019-03-27',40,0,0,0,0),(42495,'2019-03-27',41,0,0,0,0),(42496,'2019-03-27',42,0,0,0,0),(42497,'2019-03-27',43,0,0,0,0),(42498,'2019-03-27',44,0,0,0,0),(42499,'2019-03-27',45,0,0,0,0),(42500,'2019-03-27',46,0,0,0,0),(42501,'2019-03-27',47,0,0,0,0),(42502,'2019-03-27',48,0,0,0,0),(42503,'2019-03-27',49,0,0,0,0),(42504,'2019-03-27',50,0,0,0,0),(42505,'2019-03-27',51,0,0,0,0),(42506,'2019-03-27',52,0,0,0,0),(42507,'2019-03-27',53,0,0,0,0),(42508,'2019-03-27',54,0,0,0,0),(42509,'2019-03-27',55,0,0,0,0),(42510,'2019-03-27',56,0,0,0,0),(42511,'2019-03-27',57,0,0,0,0),(42512,'2019-03-27',58,0,0,0,0),(42513,'2019-03-27',59,0,0,0,0),(42514,'2019-03-27',60,0,0,0,0),(42515,'2019-03-27',61,0,0,0,0),(42516,'2019-03-27',62,0,0,0,0),(42517,'2019-03-27',63,0,0,0,0),(42518,'2019-03-27',64,0,0,0,0),(42519,'2019-03-27',65,0,0,0,0),(42520,'2019-03-27',66,0,0,0,0),(42521,'2019-03-27',67,0,0,0,0),(42522,'2019-03-27',68,0,0,0,0),(42523,'2019-03-27',69,0,0,0,0),(42524,'2019-03-27',70,0,0,0,0),(42525,'2019-03-27',71,0,0,0,0),(42526,'2019-03-27',72,0,0,0,0),(42527,'2019-03-27',73,0,0,0,0),(42528,'2019-03-27',74,0,0,0,0),(42529,'2019-03-27',75,0,0,0,0),(42530,'2019-03-27',76,0,0,0,0),(42531,'2019-03-27',77,0,0,0,0),(42532,'2019-03-27',78,0,0,0,0),(42533,'2019-03-27',79,0,0,0,0),(42534,'2019-03-27',80,0,0,0,0),(42535,'2019-03-27',81,0,0,0,0),(42536,'2019-03-27',82,0,0,0,0),(42537,'2019-03-27',83,0,0,0,0),(42538,'2019-03-27',84,0,0,0,0),(42539,'2019-03-27',85,0,0,0,0),(42540,'2019-03-27',86,0,0,0,0),(42541,'2019-03-27',87,0,0,0,0),(42542,'2019-03-27',88,0,0,0,0),(42543,'2019-03-27',89,0,0,0,0),(42544,'2019-03-27',90,0,0,0,0),(42545,'2019-03-27',91,0,0,0,0),(42546,'2019-03-27',92,0,0,0,0),(42547,'2019-03-27',93,0,0,0,0),(42548,'2019-03-27',94,0,0,0,0),(42549,'2019-03-27',95,0,0,0,0),(42550,'2019-03-27',96,0,0,0,0),(42551,'2019-03-27',97,0,0,0,0),(42552,'2019-03-27',98,0,0,0,0),(42553,'2019-03-27',99,0,0,0,0),(42554,'2019-03-27',100,0,0,0,0),(42555,'2019-03-27',101,0,0,0,0),(42556,'2019-03-27',102,0,0,0,0),(42557,'2019-03-27',103,0,0,0,0),(42558,'2019-03-27',104,0,0,0,0),(42559,'2019-03-27',105,0,0,0,0),(42560,'2019-03-27',106,0,0,0,0),(42561,'2019-03-27',107,0,0,0,0),(42562,'2019-03-27',108,0,0,-500000,0),(42563,'2019-03-27',109,0,0,0,0),(42564,'2019-03-27',110,0,0,0,0),(42565,'2019-03-27',111,0,0,0,0),(42566,'2019-03-27',112,0,0,0,0),(42567,'2019-03-27',113,0,0,0,0),(42568,'2019-03-27',114,0,0,0,0),(42569,'2019-03-27',115,0,0,0,0),(42570,'2019-03-27',116,0,0,0,0),(42571,'2019-03-27',117,0,0,0,0),(42572,'2019-03-27',118,0,0,0,0),(42573,'2019-03-27',119,0,0,0,0),(42574,'2019-03-27',120,0,0,0,0),(42575,'2019-03-27',121,0,0,0,0),(42576,'2019-03-27',122,0,0,0,0),(42577,'2019-03-27',123,0,0,0,0),(42578,'2019-03-27',124,0,0,0,0),(42579,'2019-03-27',125,0,0,0,0),(42580,'2019-03-27',126,0,0,0,0),(42581,'2019-03-27',127,0,0,0,0),(42582,'2019-03-27',128,0,0,0,0),(42583,'2019-03-27',129,0,0,0,0),(42584,'2019-03-27',130,0,0,0,0),(42585,'2019-03-27',131,0,0,0,0),(42586,'2019-03-27',132,0,0,0,0),(42587,'2019-03-27',133,0,0,0,0),(42588,'2019-03-27',134,0,0,0,0),(42589,'2019-03-27',135,0,0,0,0),(42590,'2019-03-27',136,0,0,0,0),(42591,'2019-03-27',137,0,0,0,0),(42592,'2019-03-27',138,0,0,0,0),(42593,'2019-03-27',139,0,0,0,0),(42594,'2019-03-27',140,0,0,0,0),(42595,'2019-03-27',141,0,0,0,0),(42596,'2019-03-27',142,0,0,0,0),(42597,'2019-03-27',143,0,0,0,0),(42598,'2019-03-27',144,0,0,0,0),(42599,'2019-03-27',145,0,0,0,0),(42600,'2019-03-27',146,0,0,0,0),(42601,'2019-03-27',147,0,0,0,0),(42602,'2019-03-27',148,0,0,0,0),(42603,'2019-03-27',149,0,0,0,0),(42604,'2019-03-27',150,0,0,0,0),(42605,'2019-03-27',151,0,0,0,0),(42606,'2019-03-27',152,0,0,0,0),(42607,'2019-03-27',153,0,0,0,0),(42608,'2019-03-27',154,0,0,0,0),(42609,'2019-03-27',155,0,0,0,0),(42610,'2019-03-27',156,0,0,0,0),(42611,'2019-03-27',157,0,0,0,0),(42612,'2019-03-27',158,0,0,0,0),(42613,'2019-03-27',159,0,0,0,0),(42614,'2019-03-27',160,0,0,0,0),(42615,'2019-03-27',161,0,0,0,0),(42616,'2019-03-27',162,0,0,0,0),(42617,'2019-03-27',163,0,0,0,0),(42618,'2019-03-27',164,0,0,0,0),(42619,'2019-03-27',165,0,0,0,0),(42620,'2019-03-27',166,0,0,0,0),(42621,'2019-03-27',167,0,0,0,0),(42622,'2019-03-27',168,0,0,0,0),(42623,'2019-03-27',169,0,0,0,0),(42624,'2019-03-27',170,0,0,0,0),(42625,'2019-03-27',171,0,0,0,0),(42626,'2019-03-27',172,0,0,0,0),(42627,'2019-03-27',173,0,0,0,0),(42628,'2019-03-27',174,0,0,0,0),(42629,'2019-03-27',175,0,0,0,0),(42630,'2019-03-27',176,0,0,0,0),(42631,'2019-03-27',177,0,0,0,0),(42632,'2019-03-27',178,0,0,0,0),(42633,'2019-03-27',179,0,0,0,0),(42634,'2019-03-27',180,0,0,0,0),(42635,'2019-03-27',181,0,0,0,0),(42636,'2019-03-27',182,0,0,0,0),(42637,'2019-03-27',183,0,0,0,0),(42638,'2019-03-27',184,0,0,0,0),(42639,'2019-03-27',185,0,0,0,0),(42640,'2019-03-27',186,0,0,0,0),(42641,'2019-03-27',187,0,0,0,0),(42642,'2019-03-27',188,0,0,0,0),(42643,'2019-03-27',189,0,0,0,0),(42644,'2019-03-27',190,0,0,0,0),(42645,'2019-03-27',191,0,0,0,0),(42646,'2019-03-27',192,0,0,0,0),(42647,'2019-03-27',193,0,0,0,0),(42648,'2019-03-27',194,0,0,0,0),(42649,'2019-03-27',195,0,0,0,0),(42650,'2019-03-27',196,0,0,0,0),(42651,'2019-03-27',197,0,0,0,0),(42652,'2019-03-27',198,0,0,0,0),(42653,'2019-03-27',199,0,0,0,0),(42654,'2019-03-27',200,0,0,0,0),(42655,'2019-03-27',201,0,0,0,0),(42656,'2019-03-27',202,0,0,0,0),(42657,'2019-03-27',203,0,0,0,0),(42658,'2019-03-27',204,0,0,0,0),(42659,'2019-03-27',205,0,0,0,0),(42660,'2019-03-28',1,0,0,0,0),(42661,'2019-03-28',2,0,0,0,0),(42662,'2019-03-28',9,0,0,0,0),(42663,'2019-03-28',11,0,0,0,0),(42664,'2019-03-28',12,0,0,0,0),(42665,'2019-03-28',13,0,0,0,0),(42666,'2019-03-28',14,0,0,0,0),(42667,'2019-03-28',15,0,0,0,0),(42668,'2019-03-28',16,0,0,0,0),(42669,'2019-03-28',17,0,0,0,0),(42670,'2019-03-28',18,0,0,0,0),(42671,'2019-03-28',19,0,0,0,0),(42672,'2019-03-28',20,0,0,0,0),(42673,'2019-03-28',21,0,0,0,0),(42674,'2019-03-28',22,0,0,0,0),(42675,'2019-03-28',23,0,0,0,0),(42676,'2019-03-28',24,0,0,0,0),(42677,'2019-03-28',25,0,0,0,0),(42678,'2019-03-28',26,0,0,0,0),(42679,'2019-03-28',27,0,0,0,0),(42680,'2019-03-28',28,0,0,0,0),(42681,'2019-03-28',29,0,0,0,0),(42682,'2019-03-28',30,0,0,0,0),(42683,'2019-03-28',31,0,0,0,0),(42684,'2019-03-28',32,0,0,0,0),(42685,'2019-03-28',33,0,0,0,0),(42686,'2019-03-28',34,0,0,0,0),(42687,'2019-03-28',35,0,0,0,0),(42688,'2019-03-28',36,0,0,0,0),(42689,'2019-03-28',37,0,0,0,0),(42690,'2019-03-28',38,0,0,0,0),(42691,'2019-03-28',39,0,0,0,0),(42692,'2019-03-28',40,0,0,0,0),(42693,'2019-03-28',41,0,0,0,0),(42694,'2019-03-28',42,0,0,0,0),(42695,'2019-03-28',43,0,0,0,0),(42696,'2019-03-28',44,0,0,0,0),(42697,'2019-03-28',45,0,0,0,0),(42698,'2019-03-28',46,0,0,0,0),(42699,'2019-03-28',47,0,0,0,0),(42700,'2019-03-28',48,0,0,0,0),(42701,'2019-03-28',49,0,0,0,0),(42702,'2019-03-28',50,0,0,0,0),(42703,'2019-03-28',51,0,0,0,0),(42704,'2019-03-28',52,0,0,0,0),(42705,'2019-03-28',53,0,0,0,0),(42706,'2019-03-28',54,0,0,0,0),(42707,'2019-03-28',55,0,0,0,0),(42708,'2019-03-28',56,0,0,0,0),(42709,'2019-03-28',57,0,0,0,0),(42710,'2019-03-28',58,0,0,0,0),(42711,'2019-03-28',59,0,0,0,0),(42712,'2019-03-28',60,0,0,0,0),(42713,'2019-03-28',61,0,0,0,0),(42714,'2019-03-28',62,0,0,0,0),(42715,'2019-03-28',63,0,0,0,0),(42716,'2019-03-28',64,0,0,0,0),(42717,'2019-03-28',65,0,0,0,0),(42718,'2019-03-28',66,0,0,0,0),(42719,'2019-03-28',67,0,0,0,0),(42720,'2019-03-28',68,0,0,0,0),(42721,'2019-03-28',69,0,0,0,0),(42722,'2019-03-28',70,0,0,0,0),(42723,'2019-03-28',71,0,0,0,0),(42724,'2019-03-28',72,0,0,0,0),(42725,'2019-03-28',73,0,0,0,0),(42726,'2019-03-28',74,0,0,0,0),(42727,'2019-03-28',75,0,0,0,0),(42728,'2019-03-28',76,0,0,0,0),(42729,'2019-03-28',77,0,0,0,0),(42730,'2019-03-28',78,0,0,0,0),(42731,'2019-03-28',79,0,0,0,0),(42732,'2019-03-28',80,0,0,0,0),(42733,'2019-03-28',81,0,0,0,0),(42734,'2019-03-28',82,0,0,0,0),(42735,'2019-03-28',83,0,0,0,0),(42736,'2019-03-28',84,0,0,0,0),(42737,'2019-03-28',85,0,0,0,0),(42738,'2019-03-28',86,0,0,0,0),(42739,'2019-03-28',87,0,0,0,0),(42740,'2019-03-28',88,0,0,0,0),(42741,'2019-03-28',89,0,0,0,0),(42742,'2019-03-28',90,0,0,0,0),(42743,'2019-03-28',91,0,0,0,0),(42744,'2019-03-28',92,0,0,0,0),(42745,'2019-03-28',93,0,0,0,0),(42746,'2019-03-28',94,0,0,0,0),(42747,'2019-03-28',95,0,0,0,0),(42748,'2019-03-28',96,0,0,0,0),(42749,'2019-03-28',97,0,0,0,0),(42750,'2019-03-28',98,0,0,0,0),(42751,'2019-03-28',99,0,0,0,0),(42752,'2019-03-28',100,0,0,0,0),(42753,'2019-03-28',101,0,0,0,0),(42754,'2019-03-28',102,0,0,0,0),(42755,'2019-03-28',103,0,0,0,0),(42756,'2019-03-28',104,0,0,0,0),(42757,'2019-03-28',105,0,0,0,0),(42758,'2019-03-28',106,0,0,0,0),(42759,'2019-03-28',107,0,0,0,0),(42760,'2019-03-28',108,0,0,-500000,0),(42761,'2019-03-28',109,0,0,0,0),(42762,'2019-03-28',110,0,0,0,0),(42763,'2019-03-28',111,0,0,0,0),(42764,'2019-03-28',112,0,0,0,0),(42765,'2019-03-28',113,0,0,0,0),(42766,'2019-03-28',114,0,0,0,0),(42767,'2019-03-28',115,0,0,0,0),(42768,'2019-03-28',116,0,0,0,0),(42769,'2019-03-28',117,0,0,0,0),(42770,'2019-03-28',118,0,0,0,0),(42771,'2019-03-28',119,0,0,0,0),(42772,'2019-03-28',120,0,0,0,0),(42773,'2019-03-28',121,0,0,0,0),(42774,'2019-03-28',122,0,0,0,0),(42775,'2019-03-28',123,0,0,0,0),(42776,'2019-03-28',124,0,0,0,0),(42777,'2019-03-28',125,0,0,0,0),(42778,'2019-03-28',126,0,0,0,0),(42779,'2019-03-28',127,0,0,0,0),(42780,'2019-03-28',128,0,0,0,0),(42781,'2019-03-28',129,0,0,0,0),(42782,'2019-03-28',130,0,0,0,0),(42783,'2019-03-28',131,0,0,0,0),(42784,'2019-03-28',132,0,0,0,0),(42785,'2019-03-28',133,0,0,0,0),(42786,'2019-03-28',134,0,0,0,0),(42787,'2019-03-28',135,0,0,0,0),(42788,'2019-03-28',136,0,0,0,0),(42789,'2019-03-28',137,0,0,0,0),(42790,'2019-03-28',138,0,0,0,0),(42791,'2019-03-28',139,0,0,0,0),(42792,'2019-03-28',140,0,0,0,0),(42793,'2019-03-28',141,0,0,0,0),(42794,'2019-03-28',142,0,0,0,0),(42795,'2019-03-28',143,0,0,0,0),(42796,'2019-03-28',144,0,0,0,0),(42797,'2019-03-28',145,0,0,0,0),(42798,'2019-03-28',146,0,0,0,0),(42799,'2019-03-28',147,0,0,0,0),(42800,'2019-03-28',148,0,0,0,0),(42801,'2019-03-28',149,0,0,0,0),(42802,'2019-03-28',150,0,0,0,0),(42803,'2019-03-28',151,0,0,0,0),(42804,'2019-03-28',152,0,0,0,0),(42805,'2019-03-28',153,0,0,0,0),(42806,'2019-03-28',154,0,0,0,0),(42807,'2019-03-28',155,0,0,0,0),(42808,'2019-03-28',156,0,0,0,0),(42809,'2019-03-28',157,0,0,0,0),(42810,'2019-03-28',158,0,0,0,0),(42811,'2019-03-28',159,0,0,0,0),(42812,'2019-03-28',160,0,0,0,0),(42813,'2019-03-28',161,0,0,0,0),(42814,'2019-03-28',162,0,0,0,0),(42815,'2019-03-28',163,0,0,0,0),(42816,'2019-03-28',164,0,0,0,0),(42817,'2019-03-28',165,0,0,0,0),(42818,'2019-03-28',166,0,0,0,0),(42819,'2019-03-28',167,0,0,0,0),(42820,'2019-03-28',168,0,0,0,0),(42821,'2019-03-28',169,0,0,0,0),(42822,'2019-03-28',170,0,0,0,0),(42823,'2019-03-28',171,0,0,0,0),(42824,'2019-03-28',172,0,0,0,0),(42825,'2019-03-28',173,0,0,0,0),(42826,'2019-03-28',174,0,0,0,0),(42827,'2019-03-28',175,0,0,0,0),(42828,'2019-03-28',176,0,0,0,0),(42829,'2019-03-28',177,0,0,0,0),(42830,'2019-03-28',178,0,0,0,0),(42831,'2019-03-28',179,0,0,0,0),(42832,'2019-03-28',180,0,0,0,0),(42833,'2019-03-28',181,0,0,0,0),(42834,'2019-03-28',182,0,0,0,0),(42835,'2019-03-28',183,0,0,0,0),(42836,'2019-03-28',184,0,0,0,0),(42837,'2019-03-28',185,0,0,0,0),(42838,'2019-03-28',186,0,0,0,0),(42839,'2019-03-28',187,0,0,0,0),(42840,'2019-03-28',188,0,0,0,0),(42841,'2019-03-28',189,0,0,0,0),(42842,'2019-03-28',190,0,0,0,0),(42843,'2019-03-28',191,0,0,0,0),(42844,'2019-03-28',192,0,0,0,0),(42845,'2019-03-28',193,0,0,0,0),(42846,'2019-03-28',194,0,0,0,0),(42847,'2019-03-28',195,0,0,0,0),(42848,'2019-03-28',196,0,0,0,0),(42849,'2019-03-28',197,0,0,0,0),(42850,'2019-03-28',198,0,0,0,0),(42851,'2019-03-28',199,0,0,0,0),(42852,'2019-03-28',200,0,0,0,0),(42853,'2019-03-28',201,0,0,0,0),(42854,'2019-03-28',202,0,0,0,0),(42855,'2019-03-28',203,0,0,0,0),(42856,'2019-03-28',204,0,0,0,0),(42857,'2019-03-28',205,0,0,0,0),(42858,'2019-03-29',1,0,0,0,0),(42859,'2019-03-29',2,0,0,0,0),(42860,'2019-03-29',9,0,0,0,0),(42861,'2019-03-29',11,0,0,0,0),(42862,'2019-03-29',12,0,0,0,0),(42863,'2019-03-29',13,0,0,0,0),(42864,'2019-03-29',14,0,0,0,0),(42865,'2019-03-29',15,0,0,0,0),(42866,'2019-03-29',16,0,0,0,0),(42867,'2019-03-29',17,0,0,0,0),(42868,'2019-03-29',18,0,0,0,0),(42869,'2019-03-29',19,0,0,0,0),(42870,'2019-03-29',20,0,0,0,0),(42871,'2019-03-29',21,0,0,0,0),(42872,'2019-03-29',22,0,0,0,0),(42873,'2019-03-29',23,0,0,0,0),(42874,'2019-03-29',24,0,0,0,0),(42875,'2019-03-29',25,0,0,0,0),(42876,'2019-03-29',26,0,0,0,0),(42877,'2019-03-29',27,0,0,0,0),(42878,'2019-03-29',28,0,0,0,0),(42879,'2019-03-29',29,0,0,0,0),(42880,'2019-03-29',30,0,0,0,0),(42881,'2019-03-29',31,0,0,0,0),(42882,'2019-03-29',32,0,0,0,0),(42883,'2019-03-29',33,0,0,0,0),(42884,'2019-03-29',34,0,0,0,0),(42885,'2019-03-29',35,0,0,0,0),(42886,'2019-03-29',36,0,0,0,0),(42887,'2019-03-29',37,0,0,0,0),(42888,'2019-03-29',38,0,0,0,0),(42889,'2019-03-29',39,0,0,0,0),(42890,'2019-03-29',40,0,0,0,0),(42891,'2019-03-29',41,0,0,0,0),(42892,'2019-03-29',42,0,0,0,0),(42893,'2019-03-29',43,0,0,0,0),(42894,'2019-03-29',44,0,0,0,0),(42895,'2019-03-29',45,0,0,0,0),(42896,'2019-03-29',46,0,0,0,0),(42897,'2019-03-29',47,0,0,0,0),(42898,'2019-03-29',48,0,0,0,0),(42899,'2019-03-29',49,0,0,0,0),(42900,'2019-03-29',50,0,0,0,0),(42901,'2019-03-29',51,0,0,0,0),(42902,'2019-03-29',52,0,0,0,0),(42903,'2019-03-29',53,0,0,0,0),(42904,'2019-03-29',54,0,0,0,0),(42905,'2019-03-29',55,0,0,0,0),(42906,'2019-03-29',56,0,0,0,0),(42907,'2019-03-29',57,0,0,0,0),(42908,'2019-03-29',58,0,0,0,0),(42909,'2019-03-29',59,0,0,0,0),(42910,'2019-03-29',60,0,0,0,0),(42911,'2019-03-29',61,0,0,0,0),(42912,'2019-03-29',62,0,0,0,0),(42913,'2019-03-29',63,0,0,0,0),(42914,'2019-03-29',64,0,0,0,0),(42915,'2019-03-29',65,0,0,0,0),(42916,'2019-03-29',66,0,0,0,0),(42917,'2019-03-29',67,0,0,0,0),(42918,'2019-03-29',68,0,0,0,0),(42919,'2019-03-29',69,0,0,0,0),(42920,'2019-03-29',70,0,0,0,0),(42921,'2019-03-29',71,0,0,0,0),(42922,'2019-03-29',72,0,0,0,0),(42923,'2019-03-29',73,0,0,0,0),(42924,'2019-03-29',74,0,0,0,0),(42925,'2019-03-29',75,0,0,0,0),(42926,'2019-03-29',76,0,0,0,0),(42927,'2019-03-29',77,0,0,0,0),(42928,'2019-03-29',78,0,0,0,0),(42929,'2019-03-29',79,0,0,0,0),(42930,'2019-03-29',80,0,0,0,0),(42931,'2019-03-29',81,0,0,0,0),(42932,'2019-03-29',82,0,0,0,0),(42933,'2019-03-29',83,0,0,0,0),(42934,'2019-03-29',84,0,0,0,0),(42935,'2019-03-29',85,0,0,0,0),(42936,'2019-03-29',86,0,0,0,0),(42937,'2019-03-29',87,0,0,0,0),(42938,'2019-03-29',88,0,0,0,0),(42939,'2019-03-29',89,0,0,0,0),(42940,'2019-03-29',90,0,0,0,0),(42941,'2019-03-29',91,0,0,0,0),(42942,'2019-03-29',92,0,0,0,0),(42943,'2019-03-29',93,0,0,0,0),(42944,'2019-03-29',94,0,0,0,0),(42945,'2019-03-29',95,0,0,0,0),(42946,'2019-03-29',96,0,0,0,0),(42947,'2019-03-29',97,0,0,0,0),(42948,'2019-03-29',98,0,0,0,0),(42949,'2019-03-29',99,0,0,0,0),(42950,'2019-03-29',100,0,0,0,0),(42951,'2019-03-29',101,0,0,0,0),(42952,'2019-03-29',102,0,0,0,0),(42953,'2019-03-29',103,0,0,0,0),(42954,'2019-03-29',104,0,0,0,0),(42955,'2019-03-29',105,0,0,0,0),(42956,'2019-03-29',106,0,0,0,0),(42957,'2019-03-29',107,0,0,0,0),(42958,'2019-03-29',108,0,0,-500000,0),(42959,'2019-03-29',109,0,0,0,0),(42960,'2019-03-29',110,0,0,0,0),(42961,'2019-03-29',111,0,0,0,0),(42962,'2019-03-29',112,0,0,0,0),(42963,'2019-03-29',113,0,0,0,0),(42964,'2019-03-29',114,0,0,0,0),(42965,'2019-03-29',115,0,0,0,0),(42966,'2019-03-29',116,0,0,0,0),(42967,'2019-03-29',117,0,0,0,0),(42968,'2019-03-29',118,0,0,0,0),(42969,'2019-03-29',119,0,0,0,0),(42970,'2019-03-29',120,0,0,0,0),(42971,'2019-03-29',121,0,0,0,0),(42972,'2019-03-29',122,0,0,0,0),(42973,'2019-03-29',123,0,0,0,0),(42974,'2019-03-29',124,0,0,0,0),(42975,'2019-03-29',125,0,0,0,0),(42976,'2019-03-29',126,0,0,0,0),(42977,'2019-03-29',127,0,0,0,0),(42978,'2019-03-29',128,0,0,0,0),(42979,'2019-03-29',129,0,0,0,0),(42980,'2019-03-29',130,0,0,0,0),(42981,'2019-03-29',131,0,0,0,0),(42982,'2019-03-29',132,0,0,0,0),(42983,'2019-03-29',133,0,0,0,0),(42984,'2019-03-29',134,0,0,0,0),(42985,'2019-03-29',135,0,0,0,0),(42986,'2019-03-29',136,0,0,0,0),(42987,'2019-03-29',137,0,0,0,0),(42988,'2019-03-29',138,0,0,0,0),(42989,'2019-03-29',139,0,0,0,0),(42990,'2019-03-29',140,0,0,0,0),(42991,'2019-03-29',141,0,0,0,0),(42992,'2019-03-29',142,0,0,0,0),(42993,'2019-03-29',143,0,0,0,0),(42994,'2019-03-29',144,0,0,0,0),(42995,'2019-03-29',145,0,0,0,0),(42996,'2019-03-29',146,0,0,0,0),(42997,'2019-03-29',147,0,0,0,0),(42998,'2019-03-29',148,0,0,0,0),(42999,'2019-03-29',149,0,0,0,0),(43000,'2019-03-29',150,0,0,0,0),(43001,'2019-03-29',151,0,0,0,0),(43002,'2019-03-29',152,0,0,0,0),(43003,'2019-03-29',153,0,0,0,0),(43004,'2019-03-29',154,0,0,0,0),(43005,'2019-03-29',155,0,0,0,0),(43006,'2019-03-29',156,0,0,0,0),(43007,'2019-03-29',157,0,0,0,0),(43008,'2019-03-29',158,0,0,0,0),(43009,'2019-03-29',159,0,0,0,0),(43010,'2019-03-29',160,0,0,0,0),(43011,'2019-03-29',161,0,0,0,0),(43012,'2019-03-29',162,0,0,0,0),(43013,'2019-03-29',163,0,0,0,0),(43014,'2019-03-29',164,0,0,0,0),(43015,'2019-03-29',165,0,0,0,0),(43016,'2019-03-29',166,0,0,0,0),(43017,'2019-03-29',167,0,0,0,0),(43018,'2019-03-29',168,0,0,0,0),(43019,'2019-03-29',169,0,0,0,0),(43020,'2019-03-29',170,0,0,0,0),(43021,'2019-03-29',171,0,0,0,0),(43022,'2019-03-29',172,0,0,0,0),(43023,'2019-03-29',173,0,0,0,0),(43024,'2019-03-29',174,0,0,0,0),(43025,'2019-03-29',175,0,0,0,0),(43026,'2019-03-29',176,0,0,0,0),(43027,'2019-03-29',177,0,0,0,0),(43028,'2019-03-29',178,0,0,0,0),(43029,'2019-03-29',179,0,0,0,0),(43030,'2019-03-29',180,0,0,0,0),(43031,'2019-03-29',181,0,0,0,0),(43032,'2019-03-29',182,0,0,0,0),(43033,'2019-03-29',183,0,0,0,0),(43034,'2019-03-29',184,0,0,0,0),(43035,'2019-03-29',185,0,0,0,0),(43036,'2019-03-29',186,0,0,0,0),(43037,'2019-03-29',187,0,0,0,0),(43038,'2019-03-29',188,0,0,0,0),(43039,'2019-03-29',189,0,0,0,0),(43040,'2019-03-29',190,0,0,0,0),(43041,'2019-03-29',191,0,0,0,0),(43042,'2019-03-29',192,0,0,0,0),(43043,'2019-03-29',193,0,0,0,0),(43044,'2019-03-29',194,0,0,0,0),(43045,'2019-03-29',195,0,0,0,0),(43046,'2019-03-29',196,0,0,0,0),(43047,'2019-03-29',197,0,0,0,0),(43048,'2019-03-29',198,0,0,0,0),(43049,'2019-03-29',199,0,0,0,0),(43050,'2019-03-29',200,0,0,0,0),(43051,'2019-03-29',201,0,0,0,0),(43052,'2019-03-29',202,0,0,0,0),(43053,'2019-03-29',203,0,0,0,0),(43054,'2019-03-29',204,0,0,0,0),(43055,'2019-03-29',205,0,0,0,0);

/*Table structure for table `debt_adjustment` */

DROP TABLE IF EXISTS `debt_adjustment`;

CREATE TABLE `debt_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `kind` int(1) DEFAULT '1',
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `debt_adjustment` */

/*Table structure for table `debug` */

DROP TABLE IF EXISTS `debug`;

CREATE TABLE `debug` (
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `debug` */

insert  into `debug`(`note`) values ('2019-02-22'),('1'),('5'),('-9000000'),('2019-02-22'),('1'),('5'),('-9000000');

/*Table structure for table `discount` */

DROP TABLE IF EXISTS `discount`;

CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `discount` */

insert  into `discount`(`id`,`name`,`note`) values (2,'CK1','Chiết khấu 1'),(3,'Ht5k','Hỗ trợ 5k'),(4,'CK2','Chiết khấu 2');

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `document` */

insert  into `document`(`id`,`name`,`note`) values (8,'Giấy phép đăng ký kinh doanh','');

/*Table structure for table `dynamic_field` */

DROP TABLE IF EXISTS `dynamic_field`;

CREATE TABLE `dynamic_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_edit` int(1) DEFAULT '1' COMMENT '0:khong the edit, 1:co the edit',
  `free_value_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field` */

insert  into `dynamic_field`(`id`,`code`,`name`,`organization_id`,`table_name`,`can_edit`,`free_value_id`) values (1,'DAYOFFINYEAR','Số ngày phép trong năm',1,'employee',0,1),(2,'SATURDAY','Làm ngày thứ 7',1,'employee',0,2),(3,'SENIALLOW','Thưởng thâm niên (%)',1,'employee',0,3),(4,'DAYOFFINYEAR','Số ngày phép trong năm',14,'employee',0,4),(5,'SATURDAY','Làm ngày thứ 7',14,'employee',0,5),(6,'SENIALLOW','Thưởng thâm niên (%)',14,'employee',0,6),(7,'TDHV','Trình độ học vấn',1,'employee',1,0);

/*Table structure for table `dynamic_field_free` */

DROP TABLE IF EXISTS `dynamic_field_free`;

CREATE TABLE `dynamic_field_free` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_free` */

insert  into `dynamic_field_free`(`id`,`code`,`name`,`table_name`,`parent_table_name`) values (2,'DAYOFFINYEAR','Số ngày phép trong năm','employee','organization'),(3,'SATURDAY','Làm ngày thứ 7','employee','organization'),(6,'SENIALLOW','Thưởng thâm niên (%)','employee','organization');

/*Table structure for table `dynamic_field_free_value` */

DROP TABLE IF EXISTS `dynamic_field_free_value`;

CREATE TABLE `dynamic_field_free_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_free_value` */

insert  into `dynamic_field_free_value`(`id`,`field_id`,`parent_id`,`value`) values (1,2,1,'12'),(2,3,1,'1'),(3,6,1,'2'),(4,2,14,'13'),(5,3,14,'0.5'),(6,6,14,'1');

/*Table structure for table `dynamic_field_value` */

DROP TABLE IF EXISTS `dynamic_field_value`;

CREATE TABLE `dynamic_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_value` */

insert  into `dynamic_field_value`(`id`,`field_id`,`parent_id`,`value`) values (1,1,17,'12'),(2,2,17,'1'),(3,3,17,'2'),(4,7,17,'Cao Đẳng'),(5,4,18,'13'),(6,5,18,'0.5'),(7,6,18,'1'),(8,1,19,'12'),(9,2,19,'1'),(10,3,19,'2'),(11,7,19,''),(12,1,20,'12'),(13,2,20,'1'),(14,3,20,'2'),(15,7,20,''),(16,1,20,'12'),(17,2,20,'1'),(18,3,20,'2'),(19,7,20,''),(20,1,21,'12'),(21,2,21,'1'),(22,3,21,'2'),(23,7,21,''),(24,1,21,'12'),(25,2,21,'1'),(26,3,21,'2'),(27,7,21,''),(28,1,21,'12'),(29,2,21,'1'),(30,3,21,'2'),(31,7,21,''),(32,1,18,'12'),(33,2,18,'1'),(34,3,18,'2'),(35,7,18,''),(36,1,0,'12'),(37,2,0,'1'),(38,3,0,'2'),(39,7,0,''),(40,1,23,'12'),(41,2,23,'1'),(42,3,23,'2'),(43,7,23,''),(44,1,23,'12'),(45,2,23,'1'),(46,3,23,'2'),(47,7,23,''),(48,1,24,'12'),(49,2,24,'1'),(50,3,24,'2'),(51,7,24,''),(52,1,25,'12'),(53,2,25,'1'),(54,3,25,'2'),(55,7,25,''),(56,1,26,'12'),(57,2,26,'1'),(58,3,26,'2'),(59,7,26,''),(60,1,32,'12'),(61,2,32,'1'),(62,3,32,'2'),(63,7,32,''),(64,4,42,'13'),(65,5,42,'0.5'),(66,6,42,'1');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: da bi khoa, 1: dang su dung',
  `seniority` int(2) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`id`,`idcard`,`fullname`,`email`,`salary`,`organization_id`,`birthday`,`status`,`seniority`,`start_date`) values (1,NULL,'Admin','admin@gmail.com',0,-1,'2018-08-23',1,0,NULL),(19,'171192314','Cao Thị Minh','c@gmail.com',0,1,NULL,1,1,NULL),(18,NULL,'Lê Ngọc Phước','ntb@gmail.com',2000000,14,'1980-01-15',1,1,'2000-01-01'),(17,'045082000026','Phan Khắc Hùng','hungpk.quangtrung@gmail.com',7300000,1,'1982-11-17',1,1,'2014-01-01'),(20,'273075081','Cao Phi Hùng','hungtat@gmail.com',5300000,1,'1982-01-23',1,1,'2014-01-01'),(21,'171347560','Cao Thị Sáng','',4800000,1,'1968-01-13',1,1,NULL),(23,'172430427','Phạm Văn Sơn','a@a.com',5300000,1,'1981-09-17',1,1,NULL),(24,'273399388','Đoàn Xuân Vũ','',0,1,'1990-03-10',1,1,NULL),(25,'273463776','Lê Ngọc Phước','',5300000,1,'1984-03-16',1,1,NULL),(26,'273571217','Nguyễn Minh Trung','',4800000,1,'1994-10-09',1,1,NULL),(27,'273577993','Mai Văn Thừa','',4800000,1,'1994-01-16',1,1,NULL),(28,'273140291','Nguyễn Hữu Quốc Hưng','',5300000,1,'1984-07-08',1,1,NULL),(29,'171075650','Cao Văn Kính','',4800000,1,'1963-10-26',1,1,NULL),(30,'273437479','Lê Hoàng Phước','',4800000,1,'1990-03-20',1,1,NULL),(31,'07708400063','Cao Huy Hoàng','',0,1,'1984-10-28',1,1,NULL),(32,'04008200037','Đặng Quang Thắng Bảy','',6300000,1,'1982-02-23',2,1,NULL),(33,'273508376','Trần Thanh Nam','',4800000,1,'1992-10-19',1,1,NULL),(34,'273651458','Nguyễn Thanh Hiền','',4800000,1,'1993-12-16',1,1,NULL),(35,'273288034','Lê Thị Khánh Linh','',5300000,1,'1988-07-04',1,1,NULL),(36,'273211619','Nguyễn Đức Tuấn','',5300000,1,'1988-02-15',1,1,NULL),(37,'02418400067','Hoàng Thị Lan Thuý','',3307000,1,'1984-09-22',1,1,NULL),(38,'162712864','Nguyễn Tiến Lãng','',6300000,1,'1985-11-06',1,1,NULL),(39,'273048894','Nguyễn Thanh Dũng','',5300000,1,'1969-03-15',1,1,NULL),(40,'273148634','Tạ Thị Kim Lộc','',5300000,1,'1985-01-02',1,1,NULL),(41,'273651568','Phạm Ngọc Phước Phi','',4800000,1,'1994-07-20',1,1,NULL),(42,'12345679','Nguyễn Phương Trình','',0,14,NULL,1,1,NULL);

/*Table structure for table `employee_advance` */

DROP TABLE IF EXISTS `employee_advance`;

CREATE TABLE `employee_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `advance_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `inner_sale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_advance` */

insert  into `employee_advance`(`id`,`code`,`employee_id`,`advance_date`,`amount`,`account_id`,`note`,`created_employee_id`,`inner_sale_id`) values (8,'20190330-SI-0002_aut',17,'2019-03-29',100000,5,'a',17,7);

/*Table structure for table `employee_off` */

DROP TABLE IF EXISTS `employee_off`;

CREATE TABLE `employee_off` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `actual_off_day` int(3) DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_off` */

/*Table structure for table `employee_off_increase` */

DROP TABLE IF EXISTS `employee_off_increase`;

CREATE TABLE `employee_off_increase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_off_increase` */

/*Table structure for table `employee_off_money` */

DROP TABLE IF EXISTS `employee_off_money`;

CREATE TABLE `employee_off_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_off_money` */

/*Table structure for table `employee_salary` */

DROP TABLE IF EXISTS `employee_salary`;

CREATE TABLE `employee_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `real_salary` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `month_day` int(2) DEFAULT NULL,
  `working_day` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary` */

/*Table structure for table `employee_salary_field` */

DROP TABLE IF EXISTS `employee_salary_field`;

CREATE TABLE `employee_salary_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_field` */

/*Table structure for table `employee_salary_field_detail` */

DROP TABLE IF EXISTS `employee_salary_field_detail`;

CREATE TABLE `employee_salary_field_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_salary_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_field_detail` */

/*Table structure for table `employee_salary_timesheet_detail` */

DROP TABLE IF EXISTS `employee_salary_timesheet_detail`;

CREATE TABLE `employee_salary_timesheet_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_salary_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_timesheet_detail` */

/*Table structure for table `expense` */

DROP TABLE IF EXISTS `expense`;

CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `account_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `month_count` int(2) DEFAULT NULL,
  `is_usually` int(1) DEFAULT '0' COMMENT '0: khong thuong xuyen, 1: thuong xuyen',
  `type` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `expense` */

/*Table structure for table `fixed_asset` */

DROP TABLE IF EXISTS `fixed_asset`;

CREATE TABLE `fixed_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `month_count` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1:dang khau hao, 2:tam ngung khau hao',
  `is_closed` int(1) DEFAULT '0' COMMENT '0:dang su dung, 1:da dong',
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fixed_asset` */

/*Table structure for table `fixed_asset_depreciation` */

DROP TABLE IF EXISTS `fixed_asset_depreciation`;

CREATE TABLE `fixed_asset_depreciation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fixed_asset_depreciation` */

/*Table structure for table `fixed_asset_depreciation_detail` */

DROP TABLE IF EXISTS `fixed_asset_depreciation_detail`;

CREATE TABLE `fixed_asset_depreciation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixed_asset_depreciation_id` int(11) DEFAULT NULL,
  `fixed_asset_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_calculate` int(1) DEFAULT '1' COMMENT '1:checked, 0:unchecked',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fixed_asset_depreciation_detail` */

/*Table structure for table `fixed_asset_group` */

DROP TABLE IF EXISTS `fixed_asset_group`;

CREATE TABLE `fixed_asset_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fixed_asset_group` */

insert  into `fixed_asset_group`(`id`,`name`,`organization_id`) values (1,'Tài sản cố định',1);

/*Table structure for table `fraction_gas` */

DROP TABLE IF EXISTS `fraction_gas`;

CREATE TABLE `fraction_gas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fraction_gas` */

/*Table structure for table `fraction_gas_detail` */

DROP TABLE IF EXISTS `fraction_gas_detail`;

CREATE TABLE `fraction_gas_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraction_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fraction_gas_detail` */

/*Table structure for table `gas_export_wholesale` */

DROP TABLE IF EXISTS `gas_export_wholesale`;

CREATE TABLE `gas_export_wholesale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale` */

/*Table structure for table `gas_export_wholesale_detail` */

DROP TABLE IF EXISTS `gas_export_wholesale_detail`;

CREATE TABLE `gas_export_wholesale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_export_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale_detail` */

/*Table structure for table `gas_export_wholesale_shell_detail` */

DROP TABLE IF EXISTS `gas_export_wholesale_shell_detail`;

CREATE TABLE `gas_export_wholesale_shell_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_export_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale_shell_detail` */

/*Table structure for table `gas_import` */

DROP TABLE IF EXISTS `gas_import`;

CREATE TABLE `gas_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import` */

/*Table structure for table `gas_import_detail` */

DROP TABLE IF EXISTS `gas_import_detail`;

CREATE TABLE `gas_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_import_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import_detail` */

/*Table structure for table `gas_price_list` */

DROP TABLE IF EXISTS `gas_price_list`;

CREATE TABLE `gas_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `customer_id` int(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_price_list` */

/*Table structure for table `gas_retail` */

DROP TABLE IF EXISTS `gas_retail`;

CREATE TABLE `gas_retail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_retail` */

/*Table structure for table `gas_retail_detail` */

DROP TABLE IF EXISTS `gas_retail_detail`;

CREATE TABLE `gas_retail_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_retail_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_retail_detail` */

/*Table structure for table `gas_retail_promotion` */

DROP TABLE IF EXISTS `gas_retail_promotion`;

CREATE TABLE `gas_retail_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_retail_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_retail_promotion` */

/*Table structure for table `gas_retail_return_shell` */

DROP TABLE IF EXISTS `gas_retail_return_shell`;

CREATE TABLE `gas_retail_return_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_retail_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_retail_return_shell` */

/*Table structure for table `gas_return` */

DROP TABLE IF EXISTS `gas_return`;

CREATE TABLE `gas_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return` */

/*Table structure for table `gas_return_detail` */

DROP TABLE IF EXISTS `gas_return_detail`;

CREATE TABLE `gas_return_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_return_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return_detail` */

/*Table structure for table `gas_return_vendor` */

DROP TABLE IF EXISTS `gas_return_vendor`;

CREATE TABLE `gas_return_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return_vendor` */

insert  into `gas_return_vendor`(`id`,`vendor_id`,`organization_id`) values (2,22,1);

/*Table structure for table `gas_wholesale` */

DROP TABLE IF EXISTS `gas_wholesale`;

CREATE TABLE `gas_wholesale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `gas_return` int(11) DEFAULT NULL,
  `gas_return_price` double DEFAULT NULL,
  `gas_return_amount` double DEFAULT NULL,
  `paid_old_debt_amount` double DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale` */

insert  into `gas_wholesale`(`id`,`code`,`created_date`,`customer_id`,`total`,`discount`,`total_pay`,`paid`,`debt`,`account_id`,`vehicle_out_id`,`note`,`gas_return`,`gas_return_price`,`gas_return_amount`,`paid_old_debt_amount`,`created_employee_id`) values (50,'20190326-GS-0001','2019-03-25',108,500000,0,500000,0,500000,5,36,'',0,833,0,10000,17);

/*Table structure for table `gas_wholesale_detail` */

DROP TABLE IF EXISTS `gas_wholesale_detail`;

CREATE TABLE `gas_wholesale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_detail` */

insert  into `gas_wholesale_detail`(`id`,`gas_wholesale_id`,`shell_id`,`quantity`,`price`,`amount`) values (69,50,6,20,20000,400000),(68,50,5,10,10000,100000);

/*Table structure for table `gas_wholesale_fee` */

DROP TABLE IF EXISTS `gas_wholesale_fee`;

CREATE TABLE `gas_wholesale_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` int(2) DEFAULT '1' COMMENT '1:tang, -1:giam',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_fee` */

insert  into `gas_wholesale_fee`(`id`,`name`,`kind`,`status`) values (1,'Bù vỏ',1,1),(2,'Chiết khấu',-1,1);

/*Table structure for table `gas_wholesale_fee_detail` */

DROP TABLE IF EXISTS `gas_wholesale_fee_detail`;

CREATE TABLE `gas_wholesale_fee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `fee_id` int(11) DEFAULT NULL,
  `kind` int(2) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_fee_detail` */

/*Table structure for table `gas_wholesale_promotion` */

DROP TABLE IF EXISTS `gas_wholesale_promotion`;

CREATE TABLE `gas_wholesale_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_promotion` */

/*Table structure for table `gas_wholesale_return_shell` */

DROP TABLE IF EXISTS `gas_wholesale_return_shell`;

CREATE TABLE `gas_wholesale_return_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_return_shell` */

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good` */

insert  into `good`(`id`,`code`,`name`,`price`,`unit_id`,`organization_id`,`status`) values (1,'NW01','NIWA  AUTO 10W-40 SJ/CH4 -  4L',100000,4,1,1),(2,'NW02','NIWA  AUTO 20W-50 SJ/CH4 -  4L',200000,4,1,1),(3,'NW03','NIWA  OIL 10W-40 SL/CI4 -  4L',300000,4,1,1);

/*Table structure for table `good_import` */

DROP TABLE IF EXISTS `good_import`;

CREATE TABLE `good_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_import` */

/*Table structure for table `good_import_detail` */

DROP TABLE IF EXISTS `good_import_detail`;

CREATE TABLE `good_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_import_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_import_detail` */

/*Table structure for table `good_in_stock` */

DROP TABLE IF EXISTS `good_in_stock`;

CREATE TABLE `good_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_in_stock` */

insert  into `good_in_stock`(`id`,`day`,`good_id`,`organization_id`,`store_id`,`in_stock`) values (544,'2019-03-22',1,1,7,0),(545,'2019-03-22',2,1,7,0),(546,'2019-03-22',3,1,7,0),(547,'2019-03-23',1,1,7,0),(548,'2019-03-23',2,1,7,0),(549,'2019-03-23',3,1,7,0),(550,'2019-03-24',1,1,7,0),(551,'2019-03-24',2,1,7,0),(552,'2019-03-24',3,1,7,0),(553,'2019-03-25',1,1,7,0),(554,'2019-03-25',2,1,7,0),(555,'2019-03-25',3,1,7,0),(556,'2019-03-26',1,1,7,0),(557,'2019-03-26',2,1,7,0),(558,'2019-03-26',3,1,7,0),(559,'2019-03-27',1,1,7,0),(560,'2019-03-27',2,1,7,0),(561,'2019-03-27',3,1,7,0),(562,'2019-03-28',1,1,7,0),(563,'2019-03-28',2,1,7,0),(564,'2019-03-28',3,1,7,0),(565,'2019-03-29',1,1,7,0),(566,'2019-03-29',2,1,7,0),(567,'2019-03-29',3,1,7,0);

/*Table structure for table `good_sale` */

DROP TABLE IF EXISTS `good_sale`;

CREATE TABLE `good_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_sale` */

/*Table structure for table `good_sale_detail` */

DROP TABLE IF EXISTS `good_sale_detail`;

CREATE TABLE `good_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_sale_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_sale_detail` */

/*Table structure for table `income` */

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `amount` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `income` */

/*Table structure for table `inner_sale` */

DROP TABLE IF EXISTS `inner_sale`;

CREATE TABLE `inner_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `inner_sale` */

insert  into `inner_sale`(`id`,`code`,`created_date`,`employee_id`,`total`,`discount`,`paid`,`debt`,`total_pay`,`account_id`,`note`,`created_employee_id`) values (3,'20190323-SI-0001','2019-03-22',35,5000,100,900,4000,4900,5,'abc',17),(4,'20190323-SI-0002','2019-03-22',0,0,0,0,0,0,5,'đốt lò vỏ',17),(5,'20190323-SI-0003','2019-03-22',0,0,0,0,0,0,5,'nấu trà',17),(6,'20190330-SI-0001','2019-03-29',40,50000,0,10000,40000,50000,5,'b',17),(7,'20190330-SI-0002','2019-03-29',17,140000,0,40000,100000,140000,5,'c',17);

/*Table structure for table `inner_sale_detail` */

DROP TABLE IF EXISTS `inner_sale_detail`;

CREATE TABLE `inner_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inner_sale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `inner_sale_detail` */

insert  into `inner_sale_detail`(`id`,`inner_sale_id`,`shell_id`,`quantity`,`price`,`amount`) values (6,3,5,10,100,1000),(7,3,6,20,200,4000),(8,4,6,1,0,0),(9,4,7,2,0,0),(10,5,6,3,0,0),(11,5,7,4,0,0),(12,6,5,100,100,10000),(13,6,6,200,200,40000),(14,7,5,100,200,20000),(15,7,6,300,400,120000);

/*Table structure for table `lo_vo` */

DROP TABLE IF EXISTS `lo_vo`;

CREATE TABLE `lo_vo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lo_vo` */

/*Table structure for table `lo_vo_employee_detail` */

DROP TABLE IF EXISTS `lo_vo_employee_detail`;

CREATE TABLE `lo_vo_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lo_vo_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lo_vo_employee_detail` */

/*Table structure for table `lpg_import` */

DROP TABLE IF EXISTS `lpg_import`;

CREATE TABLE `lpg_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `import_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `kind` int(1) DEFAULT '1',
  `paper_quantity` int(11) DEFAULT NULL,
  `actual_quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `invoice_amount` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `account_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  `link_lpg_ids` text COLLATE utf8_unicode_ci,
  `link_lpg_codes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_import` */

/*Table structure for table `lpg_in_stock` */

DROP TABLE IF EXISTS `lpg_in_stock`;

CREATE TABLE `lpg_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=808 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_in_stock` */

insert  into `lpg_in_stock`(`id`,`organization_id`,`vendor_id`,`day`,`in_stock`) values (752,1,15,'2019-03-22',0),(753,1,16,'2019-03-22',0),(754,1,22,'2019-03-22',0),(755,14,15,'2019-03-22',0),(756,14,23,'2019-03-22',0),(757,1,23,'2019-03-22',0),(758,14,22,'2019-03-22',0),(759,1,15,'2019-03-23',0),(760,1,16,'2019-03-23',0),(761,1,22,'2019-03-23',0),(762,14,15,'2019-03-23',0),(763,14,23,'2019-03-23',0),(764,1,23,'2019-03-23',0),(765,14,22,'2019-03-23',0),(766,1,15,'2019-03-24',0),(767,1,16,'2019-03-24',0),(768,1,22,'2019-03-24',0),(769,14,15,'2019-03-24',0),(770,14,23,'2019-03-24',0),(771,1,23,'2019-03-24',0),(772,14,22,'2019-03-24',0),(773,1,15,'2019-03-25',0),(774,1,16,'2019-03-25',0),(775,1,22,'2019-03-25',0),(776,14,15,'2019-03-25',0),(777,14,23,'2019-03-25',0),(778,1,23,'2019-03-25',0),(779,14,22,'2019-03-25',0),(780,1,15,'2019-03-26',0),(781,1,16,'2019-03-26',0),(782,1,22,'2019-03-26',0),(783,14,15,'2019-03-26',0),(784,14,23,'2019-03-26',0),(785,1,23,'2019-03-26',0),(786,14,22,'2019-03-26',0),(787,1,15,'2019-03-27',0),(788,1,16,'2019-03-27',0),(789,1,22,'2019-03-27',0),(790,14,15,'2019-03-27',0),(791,14,23,'2019-03-27',0),(792,1,23,'2019-03-27',0),(793,14,22,'2019-03-27',0),(794,1,15,'2019-03-28',0),(795,1,16,'2019-03-28',0),(796,1,22,'2019-03-28',0),(797,14,15,'2019-03-28',0),(798,14,23,'2019-03-28',0),(799,1,23,'2019-03-28',0),(800,14,22,'2019-03-28',0),(801,1,15,'2019-03-29',0),(802,1,16,'2019-03-29',0),(803,1,22,'2019-03-29',0),(804,14,15,'2019-03-29',0),(805,14,23,'2019-03-29',0),(806,1,23,'2019-03-29',0),(807,14,22,'2019-03-29',0);

/*Table structure for table `lpg_sale` */

DROP TABLE IF EXISTS `lpg_sale`;

CREATE TABLE `lpg_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `kind` int(1) DEFAULT '1',
  `customer_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_transport` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `account_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_sale` */

/*Table structure for table `money_in_stock` */

DROP TABLE IF EXISTS `money_in_stock`;

CREATE TABLE `money_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL COMMENT '0: tien mat',
  `organization_id` int(11) DEFAULT NULL COMMENT 'neu account_id=0 thi la id cua organization',
  `in_stock` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `money_in_stock` */

insert  into `money_in_stock`(`id`,`day`,`account_id`,`organization_id`,`in_stock`) values (739,'2019-03-22',4,1,0),(740,'2019-03-22',5,1,0),(741,'2019-03-22',7,14,0),(742,'2019-03-22',8,14,0),(743,'2019-03-22',9,1,0),(744,'2019-03-22',10,1,0),(745,'2019-03-23',4,1,0),(746,'2019-03-23',5,1,0),(747,'2019-03-23',7,14,0),(748,'2019-03-23',8,14,0),(749,'2019-03-23',9,1,0),(750,'2019-03-23',10,1,0),(752,'2019-03-24',4,1,0),(753,'2019-03-24',5,1,0),(754,'2019-03-24',7,14,0),(755,'2019-03-24',8,14,0),(756,'2019-03-24',9,1,0),(757,'2019-03-24',10,1,0),(759,'2019-03-25',4,1,0),(760,'2019-03-25',5,1,1000000),(761,'2019-03-25',7,14,0),(762,'2019-03-25',8,14,0),(763,'2019-03-25',9,1,0),(764,'2019-03-25',10,1,0),(765,'2019-03-26',4,1,0),(766,'2019-03-26',5,1,1000000),(767,'2019-03-26',7,14,0),(768,'2019-03-26',8,14,0),(769,'2019-03-26',9,1,0),(770,'2019-03-26',10,1,0),(771,'2019-03-27',4,1,0),(772,'2019-03-27',5,1,1000000),(773,'2019-03-27',7,14,0),(774,'2019-03-27',8,14,0),(775,'2019-03-27',9,1,0),(776,'2019-03-27',10,1,0),(777,'2019-03-28',4,1,0),(778,'2019-03-28',5,1,1000000),(779,'2019-03-28',7,14,0),(780,'2019-03-28',8,14,0),(781,'2019-03-28',9,1,0),(782,'2019-03-28',10,1,0),(783,'2019-03-29',4,1,0),(784,'2019-03-29',5,1,1042000),(785,'2019-03-29',7,14,0),(786,'2019-03-29',8,14,0),(787,'2019-03-29',9,1,0),(788,'2019-03-29',10,1,0);

/*Table structure for table `old_shell` */

DROP TABLE IF EXISTS `old_shell`;

CREATE TABLE `old_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `old_shell` */

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1: dang su dung',
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account` text COLLATE utf8_unicode_ci,
  `tax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization` */

insert  into `organization`(`id`,`code`,`name`,`address`,`status`,`phone`,`fax`,`bank_account`,`tax`,`presenter`,`presenter_position`) values (1,'QT','Công ty TNHH Quang Trung','21 Bình Giã, khu phố Phước Lộc, thị trấn Phước Bửu, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu',1,'0254.3771972','0254.3877075','050014822604, tại ngân hàng Sacombank - PGD Xuyên Mộc, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','3501475916','Cao Huy Hoàng','Giám đốc'),(14,'HT','Công ty TNHH Khí Hóa Lỏng Hưng Thịnh','39/1, KP3, P. Tam Hiệp, TP. Biên Hòa, Đồng Nai',1,'(0251)3.818.111','(0251)3.855.550','050046951171 Ngân hàng TMCP Sài Gòn Thương Tín- Sacombank Chi nhánh Đ.Nai','3600874037','Trần Quang Ngọc','Giám đốc');

/*Table structure for table `organization_shell` */

DROP TABLE IF EXISTS `organization_shell`;

CREATE TABLE `organization_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization_shell` */

insert  into `organization_shell`(`id`,`organization_id`,`shell_id`) values (4,14,1),(5,14,2),(6,1,9),(7,1,10),(8,1,2),(9,1,1);

/*Table structure for table `parameter` */

DROP TABLE IF EXISTS `parameter`;

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_show` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `parameter` */

insert  into `parameter`(`id`,`code`,`name`,`value`,`note`,`is_show`) values (3,'startdate','Ngày bắt đầu sử dụng','01/01/2018',NULL,0),(2,'mailbeforeday','Số ngày nhắc mail trước sinh nhật','3',NULL,1),(4,'insurancepersonal','Bảo hiểm xã hội - Nhân viên đóng (%)','8',NULL,1),(5,'insurancecompany','Bảo hiểm xã hội - Công ty đóng (%)','17',NULL,1),(6,'seniallowday','Số ngày nhắc mail trước khi thay đổi thâm niên','2',NULL,1),(7,'lovo','Lò vỏ','150000',NULL,1),(8,'100km','Số lít dầu cho 100 km','28',NULL,1),(9,'1000kggas','Số lít dầu cho 1000 kg gas','1',NULL,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `users` text COLLATE utf8_unicode_ci,
  `organizations` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`,`note`,`users`,`organizations`) values (8,'admin','Quyền quản trị hệ thống','1','1,14'),(11,'Admin Quang Trung','','11,13','1'),(12,'Admin Hưng Thịnh','','14','14');

/*Table structure for table `permission_detail` */

DROP TABLE IF EXISTS `permission_detail`;

CREATE TABLE `permission_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `operation` int(2) DEFAULT NULL,
  `function` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission_detail` */

insert  into `permission_detail`(`id`,`permission_id`,`operation`,`function`) values (17,8,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(16,8,1,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(18,8,3,'1,5,8,4,13,14,53,54,15,20,22,23,51,52,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(19,8,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(20,8,6,'56'),(35,11,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,95,38,39,40,42,43,44,45,46,48,49,50,60,61,93'),(36,11,6,'56,57,89,81,62,63,69,64,65,88,86,94,92,66,67,68,79,80,97,71,72,73,74,78,84,85,87,91'),(34,11,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(33,11,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(32,11,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(31,11,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(37,12,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(38,12,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(39,12,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(40,12,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(41,12,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(42,12,6,'56,57,89,81,62,63,69,64,65,88,92,66,67,68,79,80,71,72,73,74,78,84,85,87,91');

/*Table structure for table `petro` */

DROP TABLE IF EXISTS `petro`;

CREATE TABLE `petro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro` */

insert  into `petro`(`id`,`code`,`name`,`price`,`unit_id`,`organization_id`,`status`) values (6,'DO','DẦU DO 0,05S',20000,5,1,1),(5,'A92-E5','XĂNG A92-E5',300000,5,1,2),(4,'A95','XĂNG A95',100000,5,1,0),(7,'HD40(T18)','HD40(T18)',0,5,1,0),(8,'HD40(4L)','NHỚT HD 40 (can 4 L)',0,5,1,0),(9,'SHELL(T18)','NHỚT SHELL (thùng 18 L)',0,5,1,0),(10,'N68 (T18)','NHỚT THỦY LỰC 68 (thùng 18 L)',0,5,1,0),(11,'N140 (L)','NHỚT ĐẶC 140',0,5,1,0);

/*Table structure for table `petro_import` */

DROP TABLE IF EXISTS `petro_import`;

CREATE TABLE `petro_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_import` */

/*Table structure for table `petro_import_detail` */

DROP TABLE IF EXISTS `petro_import_detail`;

CREATE TABLE `petro_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petro_import_id` int(11) DEFAULT NULL,
  `petro_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_import_detail` */

/*Table structure for table `petro_in_stock` */

DROP TABLE IF EXISTS `petro_in_stock`;

CREATE TABLE `petro_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `petro_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_in_stock` */

insert  into `petro_in_stock`(`id`,`day`,`petro_id`,`organization_id`,`store_id`,`in_stock`) values (481,'2019-03-22',6,1,4,0),(482,'2019-03-22',6,1,6,0),(483,'2019-03-23',6,1,4,0),(484,'2019-03-23',6,1,6,0),(486,'2019-03-24',6,1,4,0),(487,'2019-03-24',6,1,6,0),(489,'2019-03-25',6,1,4,0),(490,'2019-03-25',6,1,6,0),(491,'2019-03-26',6,1,4,0),(492,'2019-03-26',6,1,6,0),(493,'2019-03-27',6,1,4,0),(494,'2019-03-27',6,1,6,0),(495,'2019-03-28',6,1,4,0),(496,'2019-03-28',6,1,6,0),(497,'2019-03-29',6,1,4,0),(498,'2019-03-29',6,1,6,0);

/*Table structure for table `petro_sale` */

DROP TABLE IF EXISTS `petro_sale`;

CREATE TABLE `petro_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_sale` */

/*Table structure for table `petro_sale_detail` */

DROP TABLE IF EXISTS `petro_sale_detail`;

CREATE TABLE `petro_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petro_sale_id` int(11) DEFAULT NULL,
  `petro_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_sale_detail` */

/*Table structure for table `promotion_material` */

DROP TABLE IF EXISTS `promotion_material`;

CREATE TABLE `promotion_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material` */

insert  into `promotion_material`(`id`,`name`,`unit_id`,`status`) values (3,'Đĩa thủy tinh+ly',8,1),(4,'Thố tráng men',8,1);

/*Table structure for table `promotion_material_import` */

DROP TABLE IF EXISTS `promotion_material_import`;

CREATE TABLE `promotion_material_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_import` */

/*Table structure for table `promotion_material_import_detail` */

DROP TABLE IF EXISTS `promotion_material_import_detail`;

CREATE TABLE `promotion_material_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_import_detail` */

/*Table structure for table `promotion_material_in_stock` */

DROP TABLE IF EXISTS `promotion_material_in_stock`;

CREATE TABLE `promotion_material_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_in_stock` */

insert  into `promotion_material_in_stock`(`id`,`day`,`promotion_material_id`,`organization_id`,`in_stock`) values (1079,'2019-03-22',3,1,0),(1080,'2019-03-22',4,1,0),(1081,'2019-03-22',3,14,0),(1082,'2019-03-22',4,14,0),(1083,'2019-03-23',3,1,0),(1084,'2019-03-23',4,1,0),(1085,'2019-03-23',3,14,0),(1086,'2019-03-23',4,14,0),(1090,'2019-03-24',3,1,0),(1091,'2019-03-24',4,1,0),(1092,'2019-03-24',3,14,0),(1093,'2019-03-24',4,14,0),(1097,'2019-03-25',3,1,0),(1098,'2019-03-25',4,1,0),(1099,'2019-03-25',3,14,0),(1100,'2019-03-25',4,14,0),(1101,'2019-03-26',3,1,0),(1102,'2019-03-26',4,1,0),(1103,'2019-03-26',3,14,0),(1104,'2019-03-26',4,14,0),(1105,'2019-03-27',3,1,0),(1106,'2019-03-27',4,1,0),(1107,'2019-03-27',3,14,0),(1108,'2019-03-27',4,14,0),(1109,'2019-03-28',3,1,0),(1110,'2019-03-28',4,1,0),(1111,'2019-03-28',3,14,0),(1112,'2019-03-28',4,14,0),(1113,'2019-03-29',3,1,0),(1114,'2019-03-29',4,1,0),(1115,'2019-03-29',3,14,0),(1116,'2019-03-29',4,14,0);

/*Table structure for table `promotion_material_sale` */

DROP TABLE IF EXISTS `promotion_material_sale`;

CREATE TABLE `promotion_material_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `payment_mode` int(1) DEFAULT '1',
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_sale` */

/*Table structure for table `promotion_material_sale_detail` */

DROP TABLE IF EXISTS `promotion_material_sale_detail`;

CREATE TABLE `promotion_material_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_sale_detail` */

/*Table structure for table `retail_debt` */

DROP TABLE IF EXISTS `retail_debt`;

CREATE TABLE `retail_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `retail_debt` */

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `route` */

insert  into `route`(`id`,`name`,`distance`,`note`) values (2,'Thị Vải - Supor',197,''),(3,'Gò dầu - Hưng Thịnh',110,''),(4,'Gò dầu - Quang Trung',140,''),(5,'Thị Vải - Quang Trung',125,''),(6,'Gò dầu - Nhóm 1 - Nhóm 2',110,'16'),(7,'Gò dầu - Nhóm 2 - Nhóm 3',132,'16'),(8,'Gò dầu - Nhóm 3 - Nhóm 3',143,'16'),(9,'Gò dầu - Nhóm 2 - Nhóm 2',118,'16'),(10,'Thị Vải - Nhóm 1 - Nhóm 2',125,'17'),(11,'Thị Vải - Nhóm 2 - Nhóm 3',147,'17'),(12,'Thị Vải - Nhóm 3 - Nhóm 3',158,'17'),(13,'Thị Vải - Nhóm 1 - Nhóm 3 (Thị Vải - Nhóm3)',136,'17'),(14,'Thị Vải - Nhóm 2 - Nhóm 2',133,'17'),(15,'Thị Vải - Hưng Thịnh',125,'14'),(16,'Thị Vải - Gốm Minh Tiến',112,''),(17,'Gò dầu - Gốm Minh Tiến',97,'13'),(18,'Gò dầu - Beta',88,'10'),(19,'Gò dầu - Trạm Gia Bảo',200,'12'),(20,'Gò dầu - Supor',182,'15');

/*Table structure for table `salary_timesheet_field` */

DROP TABLE IF EXISTS `salary_timesheet_field`;

CREATE TABLE `salary_timesheet_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `salary_timesheet_field` */

/*Table structure for table `shell` */

DROP TABLE IF EXISTS `shell`;

CREATE TABLE `shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:dang khoa, 1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell` */

insert  into `shell`(`id`,`kind_id`,`code`,`name`,`price`,`unit_id`,`status`) values (1,38,'ST12X','Star Gas 12kg sơn xám',0,4,1),(2,39,'ST45X','Start Gas 45kg sơn xám',200000,4,1),(3,38,'Pet','Petimex',150000,4,1),(8,38,'MAIKHE','MAI KHÊ GAS',0,4,1),(9,38,'ST12H','Star Gas 12kg sơn hồng',0,4,1),(10,39,'ST45H','Star Gas 45kg sơn hồng',0,4,1),(11,38,'AGAS','AGAS',0,4,1),(12,38,'NVP','NVP',0,4,1),(13,38,'VANLOC','VẠN LỘC GAS',0,4,1),(14,38,'GIADINH','GIA ĐÌNH GAS',0,4,1),(15,38,'HGAS','H GAS',0,4,1),(16,38,'HOANGAN','HOÀNG ÂN GAS',0,4,1),(17,38,'MT','MT GAS',0,4,1),(18,38,'ORIGIN','ORIGIN GAS',0,4,1),(19,38,'ONIC','ONIC GAS',0,4,1),(20,38,'PACIFIC','PACIFIC GAS',0,4,1),(21,38,'PETIMEX','PETIMEX GAS',0,4,1),(22,38,'PETROLIMEX','PETROLIMEX GAS',0,4,1),(23,38,'PETROVIETNAM','PETROVIETNAM GAS',0,4,1),(24,38,'SAIGONPETRO','SAIGON PETRO GAS',0,4,1),(25,38,'SAIGONGAS','SAIGON GAS',0,4,1),(26,38,'SHELLGAS','SHELL GAS',0,4,1),(27,38,'SOPET','SOPET GAS',0,4,1),(28,38,'THAILAN','THAILAN GAS',0,4,1),(29,38,'TOTAL','TOTAL GAS',0,4,1),(30,38,'VINA','VINA GAS',0,4,1),(31,38,'ELF','ELF GAS',0,4,1),(32,38,'HIEPHUONG','HIỆP HƯƠNG GAS',0,4,1),(33,38,'THUDUC','THỦ ĐỨC GAS',0,4,1),(34,38,'UNIQUE','UNIQUE GAS',0,4,1),(35,38,'VGAS','V GAS',0,4,1),(36,38,'PM','PM GAS',0,4,1),(37,38,'VIMEXCO','VIMEXCO GAS',0,4,1),(38,38,'VINASHIN','VINASHIN GAS',0,4,1),(39,38,'VT','VT GAS',0,4,1),(40,38,'VOTAP','VỎ TẠP CÁC LOẠI',0,4,1),(41,38,'VOVECHAI','VỎ VE CHAI',0,4,1);

/*Table structure for table `shell_gas_in_stock` */

DROP TABLE IF EXISTS `shell_gas_in_stock`;

CREATE TABLE `shell_gas_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `shell_vendor_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_gas_in_stock` */

insert  into `shell_gas_in_stock`(`id`,`day`,`shell_vendor_id`,`in_stock`) values (1,'2019-03-22',6,-222),(2,'2019-03-22',7,-6),(3,'2019-03-22',5,-109),(4,'2019-03-23',6,0),(5,'2019-03-23',8,0),(6,'2019-03-23',5,0),(7,'2019-03-23',7,0),(11,'2019-03-24',6,0),(12,'2019-03-24',8,0),(13,'2019-03-24',5,0),(14,'2019-03-24',7,0),(18,'2019-03-25',6,-20),(19,'2019-03-25',8,0),(20,'2019-03-25',5,-10),(21,'2019-03-25',7,0),(22,'2019-03-26',6,0),(23,'2019-03-26',8,0),(24,'2019-03-26',5,0),(25,'2019-03-26',7,0),(26,'2019-03-27',6,0),(27,'2019-03-27',8,0),(28,'2019-03-27',5,0),(29,'2019-03-27',7,0),(30,'2019-03-28',6,0),(31,'2019-03-28',8,0),(32,'2019-03-28',5,0),(33,'2019-03-28',7,0),(34,'2019-03-29',6,-500),(35,'2019-03-29',8,0),(36,'2019-03-29',5,-200),(37,'2019-03-29',7,0);

/*Table structure for table `shell_import` */

DROP TABLE IF EXISTS `shell_import`;

CREATE TABLE `shell_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT '0',
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `account_id` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_import` */

insert  into `shell_import`(`id`,`code`,`created_date`,`shell_id`,`quantity`,`price`,`amount`,`account_id`,`note`,`created_employee_id`,`vendor_id`) values (49,'20190323-SI-0001','2019-03-22',9,100,0,0,5,'',17,22),(50,'20190323-SI-0002','2019-03-22',1,200,0,0,5,'',17,22),(51,'20190323-SI-0003','2019-03-22',10,300,0,0,5,'',17,22),(52,'20190323-SI-0004','2019-03-22',2,400,0,0,5,'',17,22);

/*Table structure for table `shell_in_stock` */

DROP TABLE IF EXISTS `shell_in_stock`;

CREATE TABLE `shell_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0' COMMENT 'vo binh rong',
  PRIMARY KEY (`id`),
  KEY `shell_id` (`shell_id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_in_stock` */

insert  into `shell_in_stock`(`id`,`day`,`organization_id`,`shell_id`,`in_stock`) values (128,'2019-03-22',1,9,100),(129,'2019-03-22',1,1,200),(130,'2019-03-22',1,10,300),(131,'2019-03-22',1,2,400),(132,'2019-03-22',1,6,-20),(133,'2019-03-22',1,7,-20),(134,'2019-03-23',1,1,200),(135,'2019-03-23',1,2,400),(136,'2019-03-23',1,9,100),(137,'2019-03-23',1,10,300),(138,'2019-03-24',1,1,200),(139,'2019-03-24',1,2,400),(140,'2019-03-24',1,9,100),(141,'2019-03-24',1,10,300),(142,'2019-03-25',1,1,200),(143,'2019-03-25',1,2,400),(144,'2019-03-25',1,9,100),(145,'2019-03-25',1,10,300),(146,'2019-03-26',1,1,200),(147,'2019-03-26',1,2,400),(148,'2019-03-26',1,9,100),(149,'2019-03-26',1,10,300),(150,'2019-03-27',1,1,200),(151,'2019-03-27',1,2,400),(152,'2019-03-27',1,9,100),(153,'2019-03-27',1,10,300),(154,'2019-03-28',1,1,200),(155,'2019-03-28',1,2,400),(156,'2019-03-28',1,9,100),(157,'2019-03-28',1,10,300),(158,'2019-03-29',1,1,200),(159,'2019-03-29',1,2,400),(160,'2019-03-29',1,9,100),(161,'2019-03-29',1,10,300);

/*Table structure for table `shell_kind` */

DROP TABLE IF EXISTS `shell_kind`;

CREATE TABLE `shell_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_kind` */

insert  into `shell_kind`(`id`,`code`,`name`,`weight`,`commission`,`status`) values (38,'12KG','Bình 12KG',12,500,1),(39,'45KG','Bình 45KG',45,1000,1);

/*Table structure for table `shell_return` */

DROP TABLE IF EXISTS `shell_return`;

CREATE TABLE `shell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_return` */

/*Table structure for table `shell_return_detail` */

DROP TABLE IF EXISTS `shell_return_detail`;

CREATE TABLE `shell_return_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shell_return_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_return_detail` */

/*Table structure for table `shell_return_supplier` */

DROP TABLE IF EXISTS `shell_return_supplier`;

CREATE TABLE `shell_return_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_return_supplier` */

/*Table structure for table `shell_return_supplier_detail` */

DROP TABLE IF EXISTS `shell_return_supplier_detail`;

CREATE TABLE `shell_return_supplier_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shell_return_supplier_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_return_supplier_detail` */

/*Table structure for table `shell_sale` */

DROP TABLE IF EXISTS `shell_sale`;

CREATE TABLE `shell_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_sale` */

/*Table structure for table `shell_sale_detail` */

DROP TABLE IF EXISTS `shell_sale_detail`;

CREATE TABLE `shell_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shell_sale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_sale_detail` */

/*Table structure for table `shell_statistic` */

DROP TABLE IF EXISTS `shell_statistic`;

CREATE TABLE `shell_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shell_id` int(11) DEFAULT NULL,
  `quantity_empty` int(10) DEFAULT NULL,
  `quantity_full` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_statistic` */

/*Table structure for table `shell_vendor` */

DROP TABLE IF EXISTS `shell_vendor`;

CREATE TABLE `shell_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_vendor` */

insert  into `shell_vendor`(`id`,`organization_id`,`shell_id`,`vendor_id`,`quantity`) values (5,1,9,22,100),(6,1,1,22,200),(7,1,10,22,300),(8,1,2,22,400);

/*Table structure for table `shield_decrease` */

DROP TABLE IF EXISTS `shield_decrease`;

CREATE TABLE `shield_decrease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `vendor_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_decrease` */

/*Table structure for table `shield_import` */

DROP TABLE IF EXISTS `shield_import`;

CREATE TABLE `shield_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `vendor_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_import` */

/*Table structure for table `shield_in_stock` */

DROP TABLE IF EXISTS `shield_in_stock`;

CREATE TABLE `shield_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_in_stock` */

insert  into `shield_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`in_stock`) values (1210,'2019-03-22',15,1,0),(1211,'2019-03-22',16,1,0),(1212,'2019-03-22',22,1,0),(1213,'2019-03-22',23,1,0),(1214,'2019-03-22',15,14,0),(1215,'2019-03-22',22,14,0),(1216,'2019-03-22',23,14,0),(1217,'2019-03-23',15,1,0),(1218,'2019-03-23',16,1,0),(1219,'2019-03-23',22,1,0),(1220,'2019-03-23',23,1,0),(1221,'2019-03-23',15,14,0),(1222,'2019-03-23',22,14,0),(1223,'2019-03-23',23,14,0),(1224,'2019-03-24',15,1,0),(1225,'2019-03-24',16,1,0),(1226,'2019-03-24',22,1,0),(1227,'2019-03-24',23,1,0),(1228,'2019-03-24',15,14,0),(1229,'2019-03-24',22,14,0),(1230,'2019-03-24',23,14,0),(1231,'2019-03-25',15,1,0),(1232,'2019-03-25',16,1,0),(1233,'2019-03-25',22,1,0),(1234,'2019-03-25',23,1,0),(1235,'2019-03-25',15,14,0),(1236,'2019-03-25',22,14,0),(1237,'2019-03-25',23,14,0),(1238,'2019-03-26',15,1,0),(1239,'2019-03-26',16,1,0),(1240,'2019-03-26',22,1,0),(1241,'2019-03-26',23,1,0),(1242,'2019-03-26',15,14,0),(1243,'2019-03-26',22,14,0),(1244,'2019-03-26',23,14,0),(1245,'2019-03-27',15,1,0),(1246,'2019-03-27',16,1,0),(1247,'2019-03-27',22,1,0),(1248,'2019-03-27',23,1,0),(1249,'2019-03-27',15,14,0),(1250,'2019-03-27',22,14,0),(1251,'2019-03-27',23,14,0),(1252,'2019-03-28',15,1,0),(1253,'2019-03-28',16,1,0),(1254,'2019-03-28',22,1,0),(1255,'2019-03-28',23,1,0),(1256,'2019-03-28',15,14,0),(1257,'2019-03-28',22,14,0),(1258,'2019-03-28',23,14,0),(1259,'2019-03-29',15,1,0),(1260,'2019-03-29',16,1,0),(1261,'2019-03-29',22,1,0),(1262,'2019-03-29',23,1,0),(1263,'2019-03-29',15,14,0),(1264,'2019-03-29',22,14,0),(1265,'2019-03-29',23,14,0);

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  `is_petro` int(1) DEFAULT '0',
  `is_good` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `store` */

insert  into `store`(`id`,`code`,`name`,`organization_id`,`status`,`is_petro`,`is_good`) values (6,'QTK2','Kho cửa hàng Thái Bảo',1,1,1,0),(4,'QTK1','Trạm chiết nạp khí hoá lỏng LPG Quang Trung',1,1,1,0),(7,'KTG','Kho trạm gas',1,1,0,1);

/*Table structure for table `temp_gas_commission` */

DROP TABLE IF EXISTS `temp_gas_commission`;

CREATE TABLE `temp_gas_commission` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity_12` int(11) DEFAULT NULL,
  `quantity_45` int(11) DEFAULT NULL,
  `quantity_lovo` int(11) DEFAULT NULL,
  `accessory_kind_id` int(11) DEFAULT NULL,
  `quantity_accessory` int(11) DEFAULT NULL,
  `commission_accessory` double DEFAULT NULL,
  `employee_ids` text COLLATE utf8_unicode_ci,
  `employee_count` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `temp_gas_commission` */

/*Table structure for table `temp_petro_stock` */

DROP TABLE IF EXISTS `temp_petro_stock`;

CREATE TABLE `temp_petro_stock` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `petro_id` int(11) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `import_quantity` int(11) DEFAULT NULL,
  `export_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `temp_petro_stock` */

/*Table structure for table `timesheet` */

DROP TABLE IF EXISTS `timesheet`;

CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `timesheet_date` date DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `timesheet` */

/*Table structure for table `transport_service` */

DROP TABLE IF EXISTS `transport_service`;

CREATE TABLE `transport_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `charge_for_vendor` int(1) DEFAULT '1',
  `charge_for_customer` int(1) DEFAULT '0',
  `in_quantity` double DEFAULT NULL,
  `out_quantity` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_diff` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `rate_diff` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `money_organization_id` int(11) DEFAULT NULL,
  `money_amount` double DEFAULT NULL,
  `vendor_vendor_id` int(11) DEFAULT NULL,
  `vendor_amount` double DEFAULT NULL,
  `customer_customer_id` int(11) DEFAULT NULL,
  `customer_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transport_service` */

insert  into `transport_service`(`id`,`code`,`created_date`,`vendor_id`,`customer_id`,`transporter_id`,`charge_for_vendor`,`charge_for_customer`,`in_quantity`,`out_quantity`,`price`,`price_diff`,`rate`,`rate_diff`,`amount`,`paid`,`debt`,`account_id`,`note`,`created_employee_id`,`money_organization_id`,`money_amount`,`vendor_vendor_id`,`vendor_amount`,`customer_customer_id`,`customer_amount`) values (1,'20190311-TS-0001','2019-03-10',22,0,25,1,0,-1000,2000,3000,4000,5000,0,-15000000,0,-15000000,5,'',17,1,-0,25,-15000000,0,0),(2,'20190311-TS-0002','2019-03-10',22,0,25,1,0,100,200,300,400,500,0,15000,0,15000,5,'',17,1,-0,25,15000,0,0);

/*Table structure for table `trip_fee` */

DROP TABLE IF EXISTS `trip_fee`;

CREATE TABLE `trip_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `fee` text COLLATE utf8_unicode_ci,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_fee` */

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit` */

insert  into `unit`(`id`,`name`,`status`) values (6,'Thùng',1),(5,'Lít',1),(4,'Bình',1),(7,'Cái',1),(8,'Bộ',1),(9,'Kg',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`employee_id`,`username`,`password`,`menu`,`status`) values (1,1,'tu','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Xuất xe về\"><item id=\"vehicleinlist\" text=\"Danh sách xuất xe về\"/><item id=\"vehicleinadd\" text=\"Thêm xuất xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán sỉ gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán sỉ gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán sỉ gas\"/></item><item id=\"gasretails\" complex=\"true\" text=\"Bán lẻ gas\"><item id=\"gasretaillist\" text=\"Danh sách phiếu bán lẻ gas\"/><item id=\"gasretailadd\" text=\"Thêm phiếu bán lẻ gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"gasreturns\" complex=\"true\" text=\"Trả gas\"><item id=\"gasreturnlist\" text=\"Danh sách trả gas\"/><item id=\"gasreturnadd\" text=\"Thêm trả gas\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"petroimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtretails\" complex=\"true\" text=\"Công nợ bán lẻ\"><item id=\"debtretaillist\" text=\"Danh sách công nợ bán lẻ\"/><item id=\"debtretailadd\" text=\"Thêm công nợ bán lẻ\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ bán sỉ\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ bán sỉ\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ bán sỉ\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(11,17,'hungpk','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(12,18,'ntb','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(13,20,'hungcp','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(14,42,'trinh','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1);

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle` */

insert  into `vehicle`(`id`,`plate`,`note`) values (6,'72C-06534','Xe tải chở Gas 72C-06534'),(5,'72C-07468','Xe bồn chở Gas 72C-07468'),(7,'72C-09728','Xe tải chở Gas 72C-09728'),(8,'72C-06784','Xe tải chở Gas 72C-06784'),(9,'72C-13179','Xe xitec chở xăng dầu 20.000L 72C-13179'),(10,'72C-06625','Xe xitec chở xăng dầu 16.000L 72C-06625'),(11,'51C-98349','Xe bán tải 51C-98349');

/*Table structure for table `vehicle_in` */

DROP TABLE IF EXISTS `vehicle_in`;

CREATE TABLE `vehicle_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in` */

insert  into `vehicle_in`(`id`,`code`,`employee_id`,`created_date`,`vehicle_out_id`,`note`,`created_employee_id`) values (29,'20190323-VI-0001',NULL,'2019-03-22',36,'a',17);

/*Table structure for table `vehicle_in_accessory_detail` */

DROP TABLE IF EXISTS `vehicle_in_accessory_detail`;

CREATE TABLE `vehicle_in_accessory_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_in_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_accessory_detail` */

/*Table structure for table `vehicle_in_detail` */

DROP TABLE IF EXISTS `vehicle_in_detail`;

CREATE TABLE `vehicle_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_in_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_detail` */

insert  into `vehicle_in_detail`(`id`,`vehicle_in_id`,`shell_id`,`quantity`,`price`,`amount`) values (58,29,6,2,0,0),(57,29,5,1,0,0);

/*Table structure for table `vehicle_in_return_shell_detail` */

DROP TABLE IF EXISTS `vehicle_in_return_shell_detail`;

CREATE TABLE `vehicle_in_return_shell_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_in_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_return_shell_detail` */

/*Table structure for table `vehicle_out` */

DROP TABLE IF EXISTS `vehicle_out`;

CREATE TABLE `vehicle_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out` */

insert  into `vehicle_out`(`id`,`code`,`created_date`,`vehicle_id`,`note`,`created_employee_id`) values (36,'20190323-VO-0001','2019-03-22',10,'',17);

/*Table structure for table `vehicle_out_detail` */

DROP TABLE IF EXISTS `vehicle_out_detail`;

CREATE TABLE `vehicle_out_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_detail` */

insert  into `vehicle_out_detail`(`id`,`vehicle_out_id`,`shell_id`,`quantity`,`price`,`amount`,`note`) values (78,36,6,200,0,0,NULL),(77,36,5,100,0,0,NULL);

/*Table structure for table `vehicle_out_employee_detail` */

DROP TABLE IF EXISTS `vehicle_out_employee_detail`;

CREATE TABLE `vehicle_out_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_employee_detail` */

insert  into `vehicle_out_employee_detail`(`id`,`vehicle_out_id`,`employee_id`,`note`) values (42,36,41,''),(41,36,17,''),(40,36,40,'');

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: dang khoa, 1: dang su dung',
  `equal_organization_id` int(11) DEFAULT '-1',
  `has_stock` int(1) DEFAULT '0' COMMENT '0:khong tinh NXT, 1:tinh NXT',
  `is_gas` int(1) DEFAULT '0',
  `is_petro` int(1) DEFAULT '0',
  `is_good` int(1) DEFAULT '0',
  `is_transport` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`code`,`name`,`address`,`tax`,`phone`,`fax`,`organization_id`,`status`,`equal_organization_id`,`has_stock`,`is_gas`,`is_petro`,`is_good`,`is_transport`) values (23,'HUNGTHINH','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh','','','','',14,1,14,1,1,0,0,0),(16,'KDK','Công ty kinh doanh sản phẩm khí','address','tax','phone','fax',1,1,-1,1,1,0,0,0),(15,'THIENHA','Công ty TNHH Dầu Khí Thiên Hà','','','','',1,1,-1,1,1,0,0,1),(18,'TCP','Công Ty TNHH Thanh Châu Phát',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0),(19,'PVO MD','Công ty cổ phần xăng dầu dầu khí Vũng Tàu',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0),(20,'NIWA','NIWA',NULL,NULL,NULL,NULL,1,1,-1,0,0,0,1,0),(21,'HGA','Công Ty TNHH Hưng Gia Anh',NULL,NULL,NULL,NULL,1,1,-1,0,1,0,0,0),(22,'QuangTrung','Công ty TNHH Quang Trung','','','','',1,1,1,1,1,0,0,1),(25,'PN','Phúc Nguyên','','','','',1,1,-1,0,0,0,0,1);

/*Table structure for table `vendor_customer` */

DROP TABLE IF EXISTS `vendor_customer`;

CREATE TABLE `vendor_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_customer` */

insert  into `vendor_customer`(`id`,`organization_id`,`vendor_id`,`customer_id`) values (9,14,22,205),(10,1,23,124),(11,1,15,165);

/*Table structure for table `vendor_debt` */

DROP TABLE IF EXISTS `vendor_debt`;

CREATE TABLE `vendor_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `vendor_id` int(11) DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `kind` int(1) DEFAULT NULL COMMENT '1:tien hang, 2:tien van chuyen',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_debt` */

/*Table structure for table `vendor_in_stock` */

DROP TABLE IF EXISTS `vendor_in_stock`;

CREATE TABLE `vendor_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `shell_12` int(11) DEFAULT '0',
  `shell_45` int(11) DEFAULT '0',
  `transport_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1346 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_in_stock` */

insert  into `vendor_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`amount`,`shell_12`,`shell_45`,`transport_amount`) values (1241,'2019-03-22',15,1,0,0,0,0),(1242,'2019-03-22',15,14,0,0,0,0),(1243,'2019-03-22',16,1,0,0,0,0),(1244,'2019-03-22',18,1,0,0,0,0),(1245,'2019-03-22',19,1,0,0,0,0),(1246,'2019-03-22',20,1,0,0,0,0),(1247,'2019-03-22',21,1,0,0,0,0),(1248,'2019-03-22',22,1,0,300,700,0),(1249,'2019-03-22',22,14,0,0,0,0),(1250,'2019-03-22',23,1,0,0,0,0),(1251,'2019-03-22',23,14,0,0,0,0),(1252,'2019-03-22',25,1,0,0,0,-14985000),(1253,'2019-03-23',15,1,0,0,0,0),(1254,'2019-03-23',15,14,0,0,0,0),(1255,'2019-03-23',16,1,0,0,0,0),(1256,'2019-03-23',18,1,0,0,0,0),(1257,'2019-03-23',19,1,0,0,0,0),(1258,'2019-03-23',20,1,0,0,0,0),(1259,'2019-03-23',21,1,0,0,0,0),(1260,'2019-03-23',22,1,0,300,700,0),(1261,'2019-03-23',22,14,0,0,0,0),(1262,'2019-03-23',23,1,0,0,0,0),(1263,'2019-03-23',23,14,0,0,0,0),(1264,'2019-03-23',25,1,0,0,0,-14985000),(1268,'2019-03-24',15,1,0,0,0,0),(1269,'2019-03-24',15,14,0,0,0,0),(1270,'2019-03-24',16,1,0,0,0,0),(1271,'2019-03-24',18,1,0,0,0,0),(1272,'2019-03-24',19,1,0,0,0,0),(1273,'2019-03-24',20,1,0,0,0,0),(1274,'2019-03-24',21,1,0,0,0,0),(1275,'2019-03-24',22,1,0,300,700,0),(1276,'2019-03-24',22,14,0,0,0,0),(1277,'2019-03-24',23,1,0,0,0,0),(1278,'2019-03-24',23,14,0,0,0,0),(1279,'2019-03-24',25,1,0,0,0,-14985000),(1283,'2019-03-25',15,1,0,0,0,0),(1284,'2019-03-25',15,14,0,0,0,0),(1285,'2019-03-25',16,1,0,0,0,0),(1286,'2019-03-25',18,1,0,0,0,0),(1287,'2019-03-25',19,1,0,0,0,0),(1288,'2019-03-25',20,1,0,0,0,0),(1289,'2019-03-25',21,1,0,0,0,0),(1290,'2019-03-25',22,1,0,300,700,0),(1291,'2019-03-25',22,14,0,0,0,0),(1292,'2019-03-25',23,1,0,0,0,0),(1293,'2019-03-25',23,14,0,0,0,0),(1294,'2019-03-25',25,1,0,0,0,-14985000),(1295,'2019-03-26',15,1,0,0,0,0),(1296,'2019-03-26',15,14,0,0,0,0),(1297,'2019-03-26',16,1,0,0,0,0),(1298,'2019-03-26',18,1,0,0,0,0),(1299,'2019-03-26',19,1,0,0,0,0),(1300,'2019-03-26',20,1,0,0,0,0),(1301,'2019-03-26',21,1,0,0,0,0),(1302,'2019-03-26',22,1,0,300,700,0),(1303,'2019-03-26',22,14,0,0,0,0),(1304,'2019-03-26',23,1,0,0,0,0),(1305,'2019-03-26',23,14,0,0,0,0),(1306,'2019-03-26',25,1,0,0,0,-14985000),(1307,'2019-03-27',15,1,0,0,0,0),(1308,'2019-03-27',15,14,0,0,0,0),(1309,'2019-03-27',16,1,0,0,0,0),(1310,'2019-03-27',18,1,0,0,0,0),(1311,'2019-03-27',19,1,0,0,0,0),(1312,'2019-03-27',20,1,0,0,0,0),(1313,'2019-03-27',21,1,0,0,0,0),(1314,'2019-03-27',22,1,0,300,700,0),(1315,'2019-03-27',22,14,0,0,0,0),(1316,'2019-03-27',23,1,0,0,0,0),(1317,'2019-03-27',23,14,0,0,0,0),(1318,'2019-03-27',25,1,0,0,0,-14985000),(1319,'2019-03-28',15,1,0,0,0,0),(1320,'2019-03-28',15,14,0,0,0,0),(1321,'2019-03-28',16,1,0,0,0,0),(1322,'2019-03-28',18,1,0,0,0,0),(1323,'2019-03-28',19,1,0,0,0,0),(1324,'2019-03-28',20,1,0,0,0,0),(1325,'2019-03-28',21,1,0,0,0,0),(1326,'2019-03-28',22,1,0,300,700,0),(1327,'2019-03-28',22,14,0,0,0,0),(1328,'2019-03-28',23,1,0,0,0,0),(1329,'2019-03-28',23,14,0,0,0,0),(1330,'2019-03-28',25,1,0,0,0,-14985000),(1331,'2019-03-29',15,1,0,0,0,0),(1332,'2019-03-29',15,14,0,0,0,0),(1333,'2019-03-29',16,1,0,0,0,0),(1334,'2019-03-29',18,1,0,0,0,0),(1335,'2019-03-29',19,1,0,0,0,0),(1336,'2019-03-29',20,1,0,0,0,0),(1337,'2019-03-29',21,1,0,0,0,0),(1338,'2019-03-29',22,1,0,300,700,0),(1339,'2019-03-29',22,14,0,0,0,0),(1340,'2019-03-29',23,1,0,0,0,0),(1341,'2019-03-29',23,14,0,0,0,0),(1342,'2019-03-29',25,1,0,0,0,-14985000);

/*Table structure for table `vendor_organization` */

DROP TABLE IF EXISTS `vendor_organization`;

CREATE TABLE `vendor_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_organization` */

insert  into `vendor_organization`(`id`,`vendor_id`,`organization_id`) values (11,15,1),(12,16,1),(16,18,1),(17,19,1),(18,20,1),(19,21,1),(20,22,1),(21,15,14),(22,23,14),(24,23,1),(25,22,14),(26,24,1),(27,25,1);

/*Table structure for table `wholesale_debt` */

DROP TABLE IF EXISTS `wholesale_debt`;

CREATE TABLE `wholesale_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `customer_id` int(11) DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `kind` int(1) DEFAULT NULL COMMENT '1:tien hang, 2:tien van chuyen',
  `gas_wholesale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

insert  into `wholesale_debt`(`id`,`code`,`created_date`,`content`,`customer_id`,`paid`,`account_id`,`note`,`created_employee_id`,`kind`,`gas_wholesale_id`) values (4,'20190326-GS-0001_aut','2019-03-25',NULL,108,10000,5,'',17,1,50);

/* Trigger structure for table `accessory_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteAccessoryImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteAccessoryImportDetail` AFTER DELETE ON `accessory_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM accessory_import AS f, employee AS eo
	WHERE f.id=old.accessory_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=old.accessory_id;
		UPDATE accessory_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `accessory_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSaleAccessoryDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSaleAccessoryDetail` AFTER DELETE ON `accessory_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM accessory_sale AS f, employee AS eo
	WHERE f.id=old.accessory_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=old.accessory_id;
		IF _in_stock_id<>0 THEN
			UPDATE accessory_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `fraction_gas_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteFractionDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteFractionDetail` AFTER DELETE ON `fraction_gas_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _weight, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sk.weight, s.id INTO _date, _organization_id, _vendor_id, _weight, _shell
	FROM fraction_gas AS f, shell_vendor AS sv, shell AS s, shell_kind AS sk
	WHERE f.id=OLD.fraction_id AND sv.id=OLD.shell_id AND sv.shell_id=s.id AND s.kind_id=sk.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id
		FROM lpg_in_stock
		WHERE DATEDIFF(`day`,_date)=0 AND organization_id= _organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock + old.quantity * _weight WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id
		FROM shell_in_stock
		WHERE DATEDIFF(`day`,_date)=0 AND organization_id= _organization_id AND shell_id=_shell;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock + OLD.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id<>0 THEN
			UPDATE shell_gas_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM shield_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id AND ss.vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE shield_in_stock SET in_stock=in_stock  + OLD.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_export_wholesale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteExportWholesaleDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteExportWholesaleDetail` AFTER DELETE ON `gas_export_wholesale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id
	INTO _date, _organization_id, _vendor_id, _shell
	FROM gas_export_wholesale AS f, shell_vendor AS sv, shell AS s
	WHERE f.id=old.gas_export_wholesale_id AND sv.id=old.shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id<>0 THEN
			UPDATE shell_gas_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_export_wholesale_shell_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteExportWholesaleReturnShellDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteExportWholesaleReturnShellDetail` AFTER DELETE ON `gas_export_wholesale_shell_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM gas_export_wholesale AS f, employee AS eo
	WHERE f.id=old.gas_export_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGasImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGasImportDetail` AFTER DELETE ON `gas_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id INTO _date, _organization_id, _vendor_id
	FROM gas_import AS f, employee AS eo
	WHERE f.id=old.gas_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=old.shell_id;
		UPDATE shell_gas_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=OLD.shell_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity - old.quantity WHERE id=_in_stock_id;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_wholesale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGasWholesaleDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGasWholesaleDetail` AFTER DELETE ON `gas_wholesale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id
	INTO _date, _organization_id, _vendor_id, _shell
	FROM gas_wholesale AS f, shell_vendor AS sv, shell AS s
	WHERE f.id=old.gas_wholesale_id AND sv.id=old.shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		UPDATE shell_gas_in_stock SET in_stock=in_stock + old.quantity  WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_wholesale_promotion` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGasWholesalePromotionMaterialDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGasWholesalePromotionMaterialDetail` AFTER DELETE ON `gas_wholesale_promotion` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM gas_wholesale AS f, employee AS eo
	WHERE f.id=old.gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=old.promotion_material_id;
		IF _in_stock_id<>0 THEN
			UPDATE promotion_material_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `gas_wholesale_return_shell` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGasWholesaleReturnShellDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGasWholesaleReturnShellDetail` AFTER DELETE ON `gas_wholesale_return_shell` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM gas_wholesale AS f, employee AS eo
	WHERE f.id=old.gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
    END */$$


DELIMITER ;

/* Trigger structure for table `good_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGoodImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGoodImportDetail` AFTER DELETE ON `good_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _store_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.store_id INTO _date, _organization_id, _store_id
	FROM good_import AS f, employee AS eo
	WHERE f.id=old.good_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- good_in_stock
		SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=old.good_id AND store_id=_store_id;
		UPDATE good_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `good_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSaleGoodDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSaleGoodDetail` AFTER DELETE ON `good_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _store_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.store_id INTO _date, _organization_id, _store_id
	FROM good_sale AS f, employee AS eo
	WHERE f.id=old.good_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- good_in_stock
		SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=old.good_id AND store_id=_store_id;
		UPDATE good_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `inner_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSaleInnerDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSaleInnerDetail` AFTER DELETE ON `inner_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id
	INTO _date, _organization_id, _vendor_id, _shell
	FROM inner_sale AS f, shell_vendor AS sv, shell AS s
	WHERE f.id=OLD.inner_sale_id AND sv.id=OLD.shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		UPDATE shell_gas_in_stock SET in_stock=in_stock + OLD.quantity  WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `petro_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deletePetroImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deletePetroImportDetail` AFTER DELETE ON `petro_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _store_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.store_id
	INTO _date, _organization_id, _store_id
	FROM petro_import AS f, employee AS eo
	WHERE f.id=OLD.petro_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- petro_in_stock
		SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=OLD.petro_id AND store_id=_store_id;
		UPDATE petro_in_stock SET in_stock=in_stock - OLD.quantity  WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `petro_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSalePetroDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSalePetroDetail` AFTER DELETE ON `petro_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _store_id, _account_id, _customer_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.store_id, f.account_id, f.customer_id INTO _date, _organization_id, _store_id, _account_id, _customer_id
	FROM petro_sale AS f, employee AS eo
	WHERE f.id=old.petro_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- petro_in_stock
		SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=old.petro_id AND store_id=_store_id;
		IF _in_stock_id<>0 THEN
			UPDATE petro_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `promotion_material_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deletePromotionMaterialImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deletePromotionMaterialImportDetail` AFTER DELETE ON `promotion_material_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM promotion_material_import AS f, employee AS eo
	WHERE f.id=OLD.import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=OLD.promotion_material_id;
		UPDATE promotion_material_in_stock SET in_stock=in_stock - OLD.quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `shell_return_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteShellReturnDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteShellReturnDetail` AFTER DELETE ON `shell_return_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _customer_id, _is_shell_12, _is_shell_45 INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.customer_id INTO _date, _organization_id, _customer_id
	FROM shell_return AS f, employee AS eo
	WHERE f.id=old.shell_return_id AND f.created_employee_id=eo.id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=old.shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=old.shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
		IF _in_stock_id<>0 THEN
			IF _is_shell_12=1 THEN
				UPDATE customer_in_stock SET shell_12=shell_12 + old.quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE customer_in_stock SET shell_45=shell_45 + OLD.quantity WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `shell_return_supplier_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteShellReturnSupplierDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteShellReturnSupplierDetail` AFTER DELETE ON `shell_return_supplier_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _is_shell_12, _is_shell_45 INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id INTO _date, _organization_id, _vendor_id
	FROM shell_return_supplier AS f, employee AS eo
	WHERE f.id=old.shell_return_supplier_id AND f.created_employee_id=eo.id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=old.shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=old.shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 + old.quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 + old.quantity WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `shell_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSaleShellDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSaleShellDetail` AFTER DELETE ON `shell_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id
	INTO _date, _organization_id
	FROM shell_sale AS f, employee AS eo
	WHERE f.id=old.shell_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		UPDATE shell_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
			
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
		
    END */$$


DELIMITER ;

/* Trigger structure for table `vehicle_in_accessory_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteVehicleInAccessoryDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteVehicleInAccessoryDetail` AFTER DELETE ON `vehicle_in_accessory_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM vehicle_in AS f, employee AS eo
	WHERE f.id=old.vehicle_in_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=old.accessory_id;
		IF _in_stock_id<>0 THEN
			UPDATE accessory_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `vehicle_in_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteVehicleInDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteVehicleInDetail` AFTER DELETE ON `vehicle_in_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sv.shell_id INTO _date, _organization_id, _vendor_id, _shell
	FROM vehicle_in AS f, shell_vendor AS sv
	WHERE f.id=old.vehicle_in_id AND sv.id=old.shell_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id<>0 THEN
			UPDATE shell_gas_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `vehicle_in_return_shell_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteVehicleInReturnShellDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteVehicleInReturnShellDetail` AFTER DELETE ON `vehicle_in_return_shell_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM vehicle_in AS f, employee AS eo
	WHERE f.id=old.vehicle_in_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=old.shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `vehicle_out_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteVehicleOutDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteVehicleOutDetail` AFTER DELETE ON `vehicle_out_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sv.shell_id INTO _date, _organization_id, _vendor_id, _shell
	FROM vehicle_out AS f, shell_vendor AS sv
	WHERE f.id=old.vehicle_out_id AND sv.id=old.shell_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id<>0 THEN
			UPDATE shell_gas_in_stock SET in_stock=in_stock + old.quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
    END */$$


DELIMITER ;

/* Procedure structure for procedure `autoCreateFixedAssetDepreciation` */

/*!50003 DROP PROCEDURE IF EXISTS  `autoCreateFixedAssetDepreciation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `autoCreateFixedAssetDepreciation`(IN _code VARCHAR(20))
BEGIN
	declare _id int;
	select id into _id from fixed_asset_depreciation where code=_code;
	if _id is null then
		insert into fixed_asset_depreciation(code, created_date, note) values(_code, sysdate(),'');
		SELECT LAST_INSERT_ID() INTO _id;
	
		insert into fixed_asset_depreciation_detail(fixed_asset_depreciation_id,fixed_asset_id,unit_id,quantity,is_calculate)
		select _id, a.id, a.unit_id, a.quantity, a.status
		from fixed_asset as a
		where a.is_closed=0;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `clear_gas_commission_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `clear_gas_commission_report` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clear_gas_commission_report`(IN _session_id VARCHAR(255))
BEGIN
	DELETE FROM temp_gas_commission WHERE session_id=_session_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `clear_petro_stock_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `clear_petro_stock_report` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clear_petro_stock_report`(IN _session_id VARCHAR(255))
BEGIN
	DELETE FROM temp_petro_stock WHERE session_id=_session_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteAccessoryImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteAccessoryImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAccessoryImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM accessory_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM accessory_import_detail WHERE accessory_import_id=_id;
	DELETE FROM accessory_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtAdjustment`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_customer_id, _old_vendor_id, _organization_id, _kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT a.created_date, a.amount, a.customer_id, a.vendor_id, e.organization_id, a.kind 
		INTO _date, _old_amount, _old_customer_id, _old_vendor_id, _organization_id, _kind
	FROM debt_adjustment as a, employee as e WHERE a.id=_id and a.created_employee_id=e.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		IF _old_vendor_id<>0 THEN
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			if _kind=1 then
				UPDATE vendor_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
			else
				UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_amount WHERE id=_in_stock_id;
			end if;
		ELSEIF _old_customer_id<>0 THEN
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_old_customer_id;
			IF _kind=1 THEN
				UPDATE customer_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
			else
				UPDATE customer_in_stock SET transport_amount=transport_amount - _old_amount WHERE id=_in_stock_id;
			end if;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	DELETE FROM debt_adjustment WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtVendor`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id, _old_vendor_id, _kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, paid, account_id, vendor_id, kind INTO _date, _old_amount, _old_account_id, _old_vendor_id, _kind
	FROM vendor_debt WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM vendor_in_stock as ss, vendor_debt AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.vendor_id=_old_vendor_id AND ss.organization_id=eo.organization_id and eo.id=s.created_employee_id and s.id=_id;
		IF _in_stock_id<>0 THEN
			IF _kind=1 THEN
				UPDATE vendor_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
			else
				UPDATE vendor_in_stock SET transport_amount=transport_amount + _old_amount WHERE id=_in_stock_id;
			end if;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, vendor_debt AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM vendor_debt WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtWholesale`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id, _kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, paid, account_id, kind INTO _date, _old_amount, _old_account_id, _kind
	FROM wholesale_debt WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM customer_in_stock AS ss, wholesale_debt AS s
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id=s.customer_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			IF _kind=1 THEN
				UPDATE customer_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
			ELSE
				UPDATE customer_in_stock SET transport_amount=transport_amount + _old_amount WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, wholesale_debt AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM wholesale_debt WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDynamicField` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDynamicField` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDynamicField`(IN _ids text)
BEGIN
	set _ids = concat(',',_ids,',');
	DELETE FROM employee_salary_field WHERE _ids LIKE CONCAT('%,',field_id,',%');
	delete from dynamic_field_value where _ids like CONCAT('%,',field_id,',%');
	DELETE FROM salary_timesheet_field WHERE _ids LIKE CONCAT('%,',field_id,',%');
	DELETE FROM dynamic_field WHERE _ids LIKE CONCAT('%,',id,',%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmployeeAdvance`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id INT DEFAULT 0;
	declare _old_amount double;
	DECLARE _date DATE;
	
	SELECT advance_date, amount, account_id INTO _date, _old_amount, _old_account_id
	FROM employee_advance WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, employee_advance AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM employee_advance WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteEmployeeOffMoney` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteEmployeeOffMoney` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmployeeOffMoney`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, amount, account_id INTO _date, _old_amount, _old_account_id
	FROM employee_off_money WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, employee_off_money AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM employee_off_money WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteExpense` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteExpense` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteExpense`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, amount, account_id INTO _date, _old_amount, _old_account_id
	FROM expense WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, expense AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM expense WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteExportWholesale`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id, _customer_id INT DEFAULT 0;
	declare _old_paid, _old_debt double default 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt
	INTO _date, _organization_id, _account_id, _customer_id, _old_paid, _old_debt
	FROM gas_export_wholesale AS f, employee as eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id 
		FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id<>0 THEN
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM gas_export_wholesale_detail WHERE gas_export_wholesale_id=_id;
	DELETE FROM gas_export_wholesale_shell_detail WHERE gas_export_wholesale_id=_id;
	DELETE FROM gas_export_wholesale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteFixedAsset` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteFixedAsset` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFixedAsset`(IN _ids TEXT)
BEGIN
	SET _ids = CONCAT(',',_ids,',');
	DELETE FROM fixed_asset_depreciation_detail WHERE _ids LIKE CONCAT('%,',fixed_aset_id,',%');
	DELETE FROM fixed_asset WHERE _ids LIKE CONCAT('%,',id,',%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteFixedAssetDepreciation` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteFixedAssetDepreciation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFixedAssetDepreciation`(IN _id INT)
BEGIN
	DELETE FROM fixed_asset_depreciation_detail WHERE fixed_asset_depreciation_id=_id;
	DELETE FROM fixed_asset_depreciation WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteFixedAssetGroup` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteFixedAssetGroup` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFixedAssetGroup`(IN _ids TEXT)
BEGIN
	SET _ids = CONCAT(',',_ids,',');
	DELETE FROM fixed_asset WHERE _ids LIKE CONCAT('%,',group_id,',%');
	DELETE FROM fixed_asset_group WHERE _ids LIKE CONCAT('%,',id,',%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteFraction` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteFraction` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFraction`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, f.account_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_vendor_id, _old_account_id, _old_paid, _old_debt
	FROM gas_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	delete from fraction_gas_detail where fraction_id=_id;
	DELETE FROM fraction_gas WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGasImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _account_id INT DEFAULT 0;
	declare _paid, _debt double default 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, f.account_id, f.paid, f.debt INTO _date, _organization_id, _vendor_id, _account_id, _paid, _debt
	FROM gas_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE vendor_in_stock SET amount=amount - _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM gas_import_detail WHERE gas_import_id=_id;
	DELETE FROM gas_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGasRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGasRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGasRetail`(IN _id INT)
BEGIN
	DELETE FROM gas_retail_detail WHERE gas_retail_id=_id;
	DELETE FROM gas_retail_promotion WHERE gas_retail_id=_id;
	DELETE FROM gas_retail_return_shell WHERE gas_retail_id=_id;
	DELETE FROM gas_retail WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGasReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGasReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGasReturn`(IN _id INT)
BEGIN
	DELETE FROM gas_return_detail WHERE gas_return_id=_id;
	DELETE FROM gas_return WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGasWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGasWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGasWholesale`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _gas_return, _customer_id, _account_id INT DEFAULT 0;
	DECLARE _paid, _debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.gas_return, f.customer_id, f.account_id, f.paid, f.debt
	INTO _date, _organization_id, _gas_return, _customer_id, _account_id, _paid, _debt
	FROM gas_wholesale AS f, employee AS eo 
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT vendor_id INTO _vendor_id FROM gas_return_vendor WHERE organization_id=_organization_id LIMIT 1;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id= _organization_id AND vendor_id=_vendor_id;
		UPDATE lpg_in_stock SET in_stock=in_stock - _gas_return WHERE id=_in_stock_id;
		
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND account_id=_account_id AND organization_id=_organization_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		UPDATE customer_in_stock SET amount=amount - _debt WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM gas_wholesale_detail WHERE gas_wholesale_id=_id;
	delete from gas_wholesale_promotion where gas_wholesale_id=_id;
	DELETE FROM gas_wholesale_return_shell WHERE gas_wholesale_id=_id;
	DELETE FROM gas_wholesale_fee_detail WHERE gas_wholesale_id=_id;
	DELETE FROM gas_wholesale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGoodImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGoodImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGoodImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM good_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM good_import_detail WHERE good_import_id=_id;
	DELETE FROM good_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteIncome`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, amount, account_id INTO _date, _old_amount, _old_account_id
	FROM income WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, income AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=s.account_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM income WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteLoVo` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteLoVo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLoVo`(IN _id INT)
BEGIN
	DELETE FROM lo_vo_employee_detail WHERE lo_vo_id=_id;
	DELETE FROM lo_vo WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteLpgImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteLpgImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLpgImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_quantity, _organization_id, _import_vendor_id, _vendor_id, _kind INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE;
	DECLARE _date DATE;
	
	SELECT i.import_date, i.actual_quantity, i.paid, i.debt, eo.organization_id, i.vendor_id, i.kind
	INTO _date, _old_quantity, _old_paid, _old_debt, _organization_id, _vendor_id, _kind
	FROM lpg_import as i, employee AS eo WHERE eo.id=i.created_employee_id and i.id=_id;
	
	SELECT id INTO _import_vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM lpg_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id  AND ss.vendor_id=_import_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		if _kind=1 then
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id<>0 THEN
				UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM money_in_stock AS ss, lpg_import AS i
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id AND ss.account_id=i.account_id AND i.id=_id;
			IF _in_stock_id<>0 THEN
				UPDATE money_in_stock SET in_stock=in_stock + _old_paid WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM lpg_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLpgSale`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_quantity, _organization_id, _vendor_id, _kind INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE;
	DECLARE _date DATE;
	
	SELECT s.sale_date, s.quantity, s.paid, s.debt, eo.organization_id, s.kind
	INTO _date, _old_quantity, _old_paid, _old_debt, _organization_id, _kind
	FROM lpg_sale as s, employee as eo WHERE s.created_employee_id=eo.id and s.id=_id;
	
	SELECT id INTO _vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		IF _vendor_id <> 0 THEN
			SELECT ss.id INTO _in_stock_id FROM lpg_in_stock AS ss WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_vendor_id;
			IF _in_stock_id<>0 THEN
				UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			END IF;
		end if;
	
		IF _kind=1 THEN
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM customer_in_stock AS ss, lpg_sale AS s
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id= s.customer_id AND s.id=_id;
			IF _in_stock_id<>0 THEN
				UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM money_in_stock AS ss, lpg_sale AS s, employee AS eo
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND ss.account_id=s.account_id AND s.id=_id;
			IF _in_stock_id<>0 THEN
				UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM lpg_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldShell`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_quantity, _old_shell_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT created_date, quantity, shell_id INTO _date, _old_quantity, _old_shell_id
	FROM old_shell WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_in_stock AS ss, old_shell AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 and ss.shell_id=s.shell_id AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM old_shell WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deletePetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deletePetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePetroImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM petro_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM petro_import_detail WHERE petro_import_id=_id;
	DELETE FROM petro_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deletePromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deletePromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePromotionMaterialImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM promotion_material_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM promotion_material_import_detail WHERE import_id=_id;
	DELETE FROM promotion_material_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleAccessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleAccessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleAccessory`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id INT DEFAULT 0;
	DECLARE _paid DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.paid INTO _date, _organization_id, _account_id, _paid
	FROM accessory_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM accessory_sale_detail WHERE accessory_sale_id=_id;
	DELETE FROM accessory_sale_change_detail WHERE accessory_sale_id=_id;
	DELETE FROM accessory_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleGood`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id, _customer_id INT DEFAULT 0;
	DECLARE _paid, _debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt INTO _date, _organization_id, _account_id, _customer_id, _paid, _debt
	FROM good_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		UPDATE customer_in_stock SET amount=amount - _debt WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM good_sale_detail WHERE good_sale_id=_id;
	DELETE FROM good_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleInner`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id INT DEFAULT 0;
	DECLARE _paid, _debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT eo.organization_id, f.created_date, f.account_id, f.paid, f.debt 
	INTO _organization_id, _date, _account_id, _paid, _debt
	FROM inner_sale AS f, employee AS eo 
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM inner_sale_detail WHERE inner_sale_id=_id;
	DELETE FROM inner_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSalePetro`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id, _customer_id INT DEFAULT 0;
	declare _paid, _debt double default 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt INTO _date, _organization_id, _account_id, _customer_id, _paid, _debt
	FROM petro_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id<>0 THEN
			UPDATE customer_in_stock SET amount=amount - _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM petro_sale_detail WHERE petro_sale_id=_id;
	DELETE FROM petro_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleShell`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id, _customer_id INT DEFAULT 0;
	DECLARE _paid, _debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT eo.organization_id, f.created_date, f.account_id, f.customer_id, f.paid, f.debt 
	INTO _organization_id, _date, _account_id, _customer_id, _paid, _debt
	FROM shell_sale AS f, employee AS eo 
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
		UPDATE customer_in_stock SET amount=amount - _debt WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM shell_sale_detail WHERE shell_sale_id=_id;
	DELETE FROM shell_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShellImport`(IN _id int)
BEGIN
	DECLARE _shell_vendor_id, _old_shell_vendor_quantity, _vendor_id, _is_shell_12, _is_shell_45, _date_diff, _in_stock_id, _old_quantity
		, _shell_id, _organization_id INT DEFAULT 0;
	declare _old_amount double;
	DECLARE _date DATE;
	
	SELECT sv.id, sv.quantity, sv.vendor_id, sv.shell_id, eo.organization_id 
	INTO _shell_vendor_id, _old_shell_vendor_quantity, _vendor_id, _shell_id, _organization_id
	FROM shell_vendor as sv, shell_import as i, employee as eo
	WHERE i.id=_id AND eo.id=i.created_employee_id and sv.shell_id=i.shell_id AND sv.vendor_id=i.vendor_id AND sv.organization_id=eo.organization_id ;
	
	select created_date, quantity, amount into _date, _old_quantity, _old_amount from shell_import where id=_id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_in_stock as ss, shell_import as i
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id and ss.shell_id=i.shell_id and i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 - _old_quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 - _old_quantity WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock as ss, shell_import AS i
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.account_id=i.account_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM shell_import WHERE id=_id;
	
	UPDATE shell_vendor SET quantity=quantity-_old_shell_vendor_quantity WHERE id=_shell_vendor_id;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShellReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShellReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShellReturn`(IN _id INT)
BEGIN
	DELETE FROM shell_return_detail WHERE shell_return_id=_id;
	DELETE FROM shell_return WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShellReturnSupplier` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShellReturnSupplier` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShellReturnSupplier`(IN _id INT)
BEGIN
	DELETE FROM shell_return_supplier_detail WHERE shell_return_supplier_id=_id;
	DELETE FROM shell_return_supplier WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShieldDecrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShieldDecrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShieldDecrease`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT created_date, quantity INTO _date, _old_quantity FROM shield_decrease WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shield_in_stock AS ss, shield_decrease AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id AND ss.vendor_id=i.vendor_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE shield_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM shield_decrease WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShieldImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT created_date, quantity INTO _date, _old_quantity FROM shield_import WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shield_in_stock AS ss, shield_import AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id AND ss.vendor_id=i.vendor_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE shield_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM shield_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTransportService`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_money_organization_id, _old_vendor_vendor_id, _old_customer_customer_id INT DEFAULT 0;
	DECLARE _old_money_amount, _old_vendor_amount, _old_customer_amount DOUBLE DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
		, f.money_organization_id, f.money_amount, f.vendor_vendor_id, f.vendor_amount, f.customer_customer_id, f.customer_amount
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
		, _old_money_organization_id, _old_money_amount, _old_vendor_vendor_id, _old_vendor_amount, _old_customer_customer_id, _old_customer_amount
	FROM transport_service AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		IF _old_money_organization_id<>0 THEN
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_old_money_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_money_amount WHERE id=_in_stock_id;
		end if;
	
		IF _old_vendor_vendor_id<>0 THEN
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_vendor_id;
			UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_vendor_amount WHERE id=_in_stock_id;
		END IF;
	
		IF _old_customer_customer_id<>0 THEN
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_old_customer_customer_id;
			UPDATE customer_in_stock SET transport_amount=transport_amount - _old_customer_amount WHERE id=_in_stock_id;
		END IF;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM transport_service WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteVehicleIn` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteVehicleIn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVehicleIn`(IN _id INT)
BEGIN
	DELETE FROM vehicle_in_detail WHERE vehicle_in_id=_id;
	DELETE FROM vehicle_in_return_shell_detail WHERE vehicle_in_id=_id;
	DELETE FROM vehicle_in_accessory_detail WHERE vehicle_in_id=_id;
	DELETE FROM vehicle_in WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteVehicleOut` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteVehicleOut` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVehicleOut`(IN _id INT)
BEGIN
	DELETE FROM vehicle_out_detail WHERE vehicle_out_id=_id;
	DELETE FROM vehicle_out_employee_detail WHERE vehicle_out_id=_id;
	DELETE FROM vehicle_out WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_accessory_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_accessory_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_accessory_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id as organization_id, o.name as organization_name, a.id as accessory_id, a.name as accessory_name, s.in_stock as opening_stock
	FROM accessory_in_stock AS s, organization AS o, accessory as a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.accessory_id=a.id AND s.organization_id=o.id AND a.STATUS=1 and o.status=1
	order by o.name, a.name
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_customer_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_customer_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_customer_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS customer_id, a.NAME AS customer_name, s.amount AS opening_stock
		, s.shell_12 as opening_stock_12, s.shell_45 AS opening_stock_45
	FROM customer_in_stock AS s, customer AS a, organization AS o
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.customer_id=a.id AND a.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_good_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_good_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_good_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, so.id as store_id, so.name as store_name, a.id AS good_id, a.NAME AS good_name, s.in_stock AS opening_stock
	FROM good_in_stock AS s, organization AS o, store as so, good AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.good_id=a.id AND s.organization_id=o.id and s.store_id=so.id AND a.STATUS=1 AND o.STATUS=1 and so.status=1 and so.is_good=1
	ORDER BY o.NAME, so.name, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_lpg_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_lpg_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_lpg_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS vendor_id, a.NAME AS vendor_name, s.in_stock AS opening_stock
	FROM lpg_in_stock AS s, organization AS o, vendor AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.vendor_id=a.id AND s.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_money_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_money_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_money_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS account_id, concat(a.number,' - ',a.bank,' - ',a.branch) AS account_name, s.in_stock AS opening_stock
	FROM money_in_stock AS s, organization AS o, account AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.account_id=a.id AND s.organization_id=o.id AND o.STATUS=1
	ORDER BY o.NAME, a.number
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_petro_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_petro_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_petro_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS store_id, so.NAME AS store_name, a.id AS petro_id, a.NAME AS petro_name, s.in_stock AS opening_stock
	FROM petro_in_stock AS s, organization AS o, store AS so, petro AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.petro_id=a.id AND s.organization_id=o.id AND s.store_id=so.id AND a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1
	ORDER BY o.NAME, so.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_promotion_material_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_promotion_material_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_promotion_material_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS promotion_material_id, a.NAME AS promotion_material_name, s.in_stock AS opening_stock
	FROM promotion_material_in_stock AS s, organization AS o, promotion_material AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.promotion_material_id=a.id AND s.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shell_gas_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shell_gas_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shell_gas_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS shell_id, so.NAME AS shell_name, a.id AS vendor_id, a.NAME AS vendor_name, s.in_stock AS opening_stock
	FROM shell_gas_in_stock AS s, shell_vendor AS sv, organization AS o, shell AS so, vendor AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.shell_vendor_id=sv.id AND sv.shell_id=so.id AND sv.organization_id=o.id AND sv.vendor_id=a.id 
		AND a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND a.is_gas=1
	ORDER BY o.NAME, so.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shell_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shell_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shell_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS shell_id, a.NAME AS shell_name, s.in_stock AS opening_stock
	FROM shell_in_stock AS s, organization AS o, shell AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.shell_id=a.id AND s.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shield_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shield_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shield_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS vendor_id, a.NAME AS vendor_name, s.in_stock AS opening_stock
	FROM shield_in_stock AS s, organization AS o, vendor AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.vendor_id=a.id AND s.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_vendor_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_vendor_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_vendor_opening_stock`(IN _date VARCHAR(20))
BEGIN
	SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS vendor_id, a.NAME AS vendor_name, s.amount AS opening_stock
	FROM vendor_in_stock AS s, organization AS o, vendor AS a
	WHERE DATE(s.`day`) = STR_TO_DATE(_date,'%d/%m/%Y')
		AND s.vendor_id=a.id AND s.organization_id=o.id AND a.STATUS=1 AND o.STATUS=1
	ORDER BY o.NAME, a.NAME
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getAutoSalaryEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAutoSalaryEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAutoSalaryEmployee`()
BEGIN
	declare _start_date date;
	
	select str_to_date(p.value,"%d/%m/%Y") into _start_date from parameter AS p where p.CODE='startdate';
	SELECT distinct month(s.created_date) as salary_month, year(s.created_date) AS salary_year
	FROM employee_salary AS s
	WHERE datediff(s.created_date,_start_date)>0;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getBirthdayEmployeeBeforeDay` */

/*!50003 DROP PROCEDURE IF EXISTS  `getBirthdayEmployeeBeforeDay` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getBirthdayEmployeeBeforeDay`(IN _day INT)
BEGIN
	select e.id, e.fullname, e.email
	from employee as e
	where month(sysdate())=month(e.birthday) and day(sysdate())=_day+day(e.birthday) and e.status=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getDayOffAndSalaryOfEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `getDayOffAndSalaryOfEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getDayOffAndSalaryOfEmployee`(IN _employee_id int, OUT _day_off INT, OUT _salary double)
BEGIN
	declare _off int default 0;
	set _day_off = 0;
	select coalesce(dv.value,0) into _off
	from dynamic_field as d, dynamic_field_value as dv
	where d.id=dv.field_id and d.code='DAYOFFINYEAR' and dv.parent_id=_employee_id;
	set _day_off = _day_off + _off;
	
	set _off = 0;
	SELECT coalesce(sum(IF(tbl_out.diff + tbl_out.start_number < 8, 0, 1 + (IF(tbl_out.start_number=1,tbl_out.diff, tbl_out.diff + tbl_out.start_number - 7) DIV 7))),0) into _off
	FROM
		(SELECT DATEDIFF(tbl_in.to_date,tbl_in.from_date) + 1 AS diff, DAYOFWEEK(tbl_in.from_date) AS start_number
		FROM
			(SELECT IF(YEAR(SYSDATE())>YEAR(o.from_date),STR_TO_DATE(CONCAT("01/01",YEAR(SYSDATE())),"%d/%M/%Y"),o.from_date) AS from_date
				, IF(YEAR(o.to_date)>YEAR(SYSDATE()),STR_TO_DATE(CONCAT("31/12",YEAR(SYSDATE())),"%d/%M/%Y"),o.to_date) AS to_date
			FROM employee_off AS o
			WHERE (YEAR(o.from_date)=YEAR(SYSDATE()) OR YEAR(o.to_date)=YEAR(SYSDATE())) AND o.employee_id=_employee_id
			) AS tbl_in
		) AS tbl_out;
	SET _day_off = _day_off - _off;
	
	SET _off = 0;
	select coalesce(sum(i.quantity),0) into _off
	from employee_off_increase as i
	where i.employee_id=_employee_id and year(sysdate())=year(i.created_date);
	SET _day_off = _day_off + _off;
	
	SET _off = 0;
	SELECT COALESCE(sum(m.quantity),0) INTO _off
	FROM employee_off_money AS m
	WHERE m.employee_id=_employee_id AND YEAR(SYSDATE())=YEAR(m.created_date);
	SET _day_off = _day_off - _off;
	
	select salary into _salary from employee where id=_employee_id;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getFixedAssetDepreciationDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `getFixedAssetDepreciationDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getFixedAssetDepreciationDetail`(in _fixed_asset_depreciation_id int)
BEGIN
	declare _created_date date;
	select created_date into _created_date from fixed_asset_depreciation where id=_fixed_asset_depreciation_id;
	
	SELECT det.id, det.fixed_asset_depreciation_id, s.quantity, s.price, s.id AS fixed_asset_id, s.NAME AS fixed_asset_name, u.id AS unit_id
		, u.NAME AS unit_name, det.is_calculate, s.start_date
	FROM unit AS u, fixed_asset AS s
	LEFT JOIN  fixed_asset_depreciation_detail AS det ON det.fixed_asset_id=s.id AND det.fixed_asset_depreciation_id=_fixed_asset_depreciation_id
        WHERE s.unit_id=u.id AND s.is_closed=0
        HAVING det.id IS NOT NULL OR (det.id IS NULL AND DATEDIFF(_created_date,s.start_date)>=0) ORDER BY det.id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNotSalaryEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNotSalaryEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNotSalaryEmployee`(IN _date VARCHAR(20))
BEGIN
	declare _search_date date;
	select STR_TO_DATE(_date,'%d/%m/%Y') into _search_date;
	select e.id, coalesce(e.salary,0) as salary
	from employee as e
	left join (SELECT s.employee_id
				FROM employee_salary AS s
				WHERE month(s.created_date)=month(_search_date) and year(s.created_date)=year(_search_date)) as salary_tbl
		on e.id=salary_tbl.employee_id
	where salary_tbl.employee_id is null
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importAccessoryOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importAccessoryOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importAccessoryOpeningStock`(in _date varchar(20), in _organization_id int, in _accessory_id int, in _in_stock double)
BEGIN
	declare _id int;
	declare _old_stock, _diff double default 0;
	
	select id, in_stock into _id, _old_stock
	from accessory_in_stock
	where DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') and organization_id=_organization_id and accessory_id=_accessory_id;
	
	if _id is null then
		insert into accessory_in_stock(`day`, organization_id, accessory_id, in_stock)
		values (_date, _organization_id, _accessory_id, _in_stock);
	else
		set _diff = _in_stock - _old_stock;
		update accessory_in_stock set in_stock=_in_stock where id=_id;
	
		update accessory_in_stock set in_stock=in_stock + _diff where DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			and organization_id=_organization_id and accessory_id=_accessory_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importCustomerOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importCustomerOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importCustomerOpeningStock`(IN _date VARCHAR(20), IN _customer_id INT, IN _in_stock DOUBLE, IN _in_stock_12 DOUBLE, IN _in_stock_45 DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _old_stock_12, _old_stock_45, _diff, _diff_12, _diff_45 DOUBLE DEFAULT 0;
	
	SELECT id, amount, shell_12, shell_45 INTO _id, _old_stock, _old_stock_12, _old_stock_45
	FROM customer_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND customer_id=_customer_id;
	
	IF _id IS NULL THEN
		INSERT INTO customer_in_stock(`day`, customer_id, amount, shell_12, shell_45)
		VALUES (_date, _customer_id, _in_stock, _in_stock_12, _in_stock_45);
	ELSE
		SET _diff = _in_stock - _old_stock;
		SET _diff_12 = _in_stock_12 - _old_stock_12;
		SET _diff_45 = _in_stock_45 - _old_stock_45;
	
		UPDATE customer_in_stock SET amount=_in_stock, shell_12=_in_stock_12, shell_45=_in_stock_45 WHERE id=_id;
	
		UPDATE customer_in_stock SET amount=amount + _diff, shell_12=shell_12 + _diff_12, shell_45=shell_45 + _diff_45 
		WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') AND customer_id=_customer_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importGoodOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importGoodOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importGoodOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, in _store_id int, IN _good_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM good_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND store_id=_store_id and good_id=_good_id;
	
	IF _id IS NULL THEN
		INSERT INTO good_in_stock(`day`, organization_id, store_id, good_id, in_stock)
		VALUES (_date, _organization_id, _store_id, _good_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE good_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE good_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id and store_id=_store_id AND good_id=_good_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importLpgOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importLpgOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importLpgOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _vendor_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM lpg_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND vendor_id=_vendor_id;
	
	IF _id IS NULL THEN
		INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock)
		VALUES (_date, _organization_id, _vendor_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE lpg_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE lpg_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND vendor_id=_vendor_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importMoneyOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importMoneyOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importMoneyOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _account_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM money_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND account_id=_account_id;
	
	IF _id IS NULL THEN
		INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock)
		VALUES (_date, _organization_id, _account_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE money_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE money_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND account_id=_account_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importPetroOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importPetroOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importPetroOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _store_id INT, IN _petro_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM petro_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND store_id=_store_id AND petro_id=_petro_id;
	
	IF _id IS NULL THEN
		INSERT INTO petro_in_stock(`day`, organization_id, store_id, petro_id, in_stock)
		VALUES (_date, _organization_id, _store_id, _petro_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE petro_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE petro_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND store_id=_store_id AND petro_id=_petro_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importPromotionMaterialOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importPromotionMaterialOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importPromotionMaterialOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _promotion_material_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM promotion_material_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
	
	IF _id IS NULL THEN
		INSERT INTO promotion_material_in_stock(`day`, organization_id, promotion_material_id, in_stock)
		VALUES (_date, _organization_id, _promotion_material_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE promotion_material_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE promotion_material_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importShellGasOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importShellGasOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importShellGasOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _shell_id INT, IN _vendor_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT ss.id, in_stock INTO _id, _old_stock
	FROM shell_gas_in_stock as ss, shell_vendor as sv
	WHERE DATE(ss.`day`) = STR_TO_DATE(_date,'%d/%m/%Y') and ss.shell_vendor_id=sv.id 
		AND sv.organization_id=_organization_id AND sv.shell_id=_shell_id AND sv.vendor_id=_vendor_id;
	
	IF _id IS NULL THEN
		INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock)
		select _date, sv.id, _in_stock
		from shell_vendor AS sv
		where sv.organization_id=_organization_id AND sv.shell_id=_shell_id AND sv.vendor_id=_vendor_id;
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE shell_gas_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE shell_gas_in_stock as ss, shell_vendor as sv 
		SET ss.in_stock=in_stock + _diff 
		WHERE DATE(ss.`day`) > STR_TO_DATE(_date,'%d/%m/%Y')
			and ss.shell_vendor_id=sv.id
			AND sv.organization_id=_organization_id AND sv.shell_id=_shell_id AND sv.vendor_id=_vendor_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importShellOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importShellOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importShellOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _shell_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM shell_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND shell_id=_shell_id;
	
	IF _id IS NULL THEN
		INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock)
		VALUES (_date, _organization_id, _shell_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE shell_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE shell_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND shell_id=_shell_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importShieldOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importShieldOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importShieldOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _vendor_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM shield_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND vendor_id=_vendor_id;
	
	IF _id IS NULL THEN
		INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock)
		VALUES (_date, _organization_id, _vendor_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE shield_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE shield_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND vendor_id=_vendor_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importVendorOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importVendorOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importVendorOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _vendor_id INT, IN _in_stock DOUBLE, in _in_stock_transport double)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _old_stock_transport, _diff, _diff_transport DOUBLE DEFAULT 0;
	
	SELECT id, amount, transport_amount INTO _id, _old_stock, _old_stock_transport
	FROM vendor_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND vendor_id=_vendor_id;
	
	IF _id IS NULL THEN
		INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount, transport_amount)
		VALUES (_date, _organization_id, _vendor_id, _in_stock, _in_stock_transport);
	ELSE
		SET _diff = _in_stock - _old_stock;
		SET _diff_transport = _in_stock_transport - _old_stock_transport;
		UPDATE vendor_in_stock SET amount=_in_stock, transport_amount=_in_stock_transport WHERE id=_id;
	
		UPDATE vendor_in_stock SET amount=amount + _diff, transport_amount=transport_amount + _diff_transport 
		WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND vendor_id=_vendor_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertAccessoryImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAccessoryImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAccessoryImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;	
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO accessory_import (CODE, created_date, vendor_id, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertAccessoryImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAccessoryImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAccessoryImportDetail`(IN _accessory_import_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM accessory_import AS f, employee AS eo
	WHERE f.id=_accessory_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
		IF _in_stock_id=0 THEN
			INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, _quantity);
		ELSE
			UPDATE accessory_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO accessory_import_detail(accessory_import_id, accessory_id, quantity, price, amount) 
	VALUES (_accessory_import_id, _accessory_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertAttachmentFile` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAttachmentFile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAttachmentFile`(in _name varchar(255), in _source VARCHAR(255), in _link VARCHAR(255), in _employee_id int, in _type int
	, in _parent_id int, OUT _id INT)
BEGIN
	INSERT INTO attachment_file (name, source, link, employee_id, type, parent_id, created_date)
	VALUES (_name, _source, _link, _employee_id, _type, _parent_id, sysdate());
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertContract` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertContract` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertContract`(IN _code VARCHAR(20), IN _customer_id INT, IN _created_date VARCHAR(20), IN _shell_12_price DOUBLE
	, IN _shell_45_price DOUBLE, IN _credit_date INT, in _credit_amount double, IN _note TEXT, in _employee_id int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO contract (CODE, customer_id, created_date, shell_12_price, shell_45_price, credit_date, credit_amount, note, employee_id, created_employee_id)
	VALUES (_code, _customer_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _shell_12_price, _shell_45_price, _credit_date, _credit_amount, _note, _employee_id, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtAdjustment`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _vendor_id INT, IN _customer_id INT, in _kind int, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO debt_adjustment (CODE, created_date, amount, vendor_id, customer_id, kind, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _amount, _vendor_id, _customer_id, _kind, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		if _vendor_id<>0 then
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				if _kind=1 then
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _amount);
				else
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, _amount);
				end if;
			ELSE
				IF _kind=1 THEN
					UPDATE vendor_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
				else
					UPDATE vendor_in_stock SET transport_amount=transport_amount + _amount WHERE id=_in_stock_id;
				end if;
			END IF;
		elseif _customer_id<>0 then
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				IF _kind=1 THEN
					INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _amount);
				else
					INSERT INTO customer_in_stock(`day`, customer_id, transport_amount) VALUES (_date, _customer_id, _amount);
				end if;
			ELSE
				IF _kind=1 THEN
					UPDATE customer_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
				else
					UPDATE customer_in_stock SET transport_amount=transport_amount + _amount WHERE id=_in_stock_id;
				end if;
			END IF;
		end if;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtRetail`(IN _code VARCHAR(20), IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO retail_debt (CODE, customer_id, created_date, paid, account_id, note, created_employee_id)
	VALUES (_code, _customer_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _paid, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtVendor`(IN _code VARCHAR(20), IN _vendor_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, in _kind int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO vendor_debt (CODE, vendor_id, created_date, paid, account_id, note, created_employee_id, kind)
	VALUES (_code, _vendor_id, _date, _paid, _account_id, _note, _created_employee_id, _kind);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			if _kind=1 then
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, -_paid);
			else
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, -_paid);
			end if;
		ELSE
			IF _kind=1 THEN
				UPDATE vendor_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
			else
				UPDATE vendor_in_stock SET transport_amount=transport_amount - _paid WHERE id=_in_stock_id;
			end if;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtWholesale`(IN _code VARCHAR(20), IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, in _kind int, in _gas_wholesale_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO wholesale_debt (CODE, customer_id, created_date, paid, account_id, note, created_employee_id, kind, gas_wholesale_id)
	VALUES (_code, _customer_id, _date, _paid, _account_id, _note, _created_employee_id, _kind, _gas_wholesale_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			IF _kind=1 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, -_paid);
			ELSE
				INSERT INTO customer_in_stock(`day`, customer_id, transport_amount) VALUES (_date, _customer_id, -_paid);
			END IF;
		ELSE
			IF _kind=1 THEN
				UPDATE customer_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
			else
				UPDATE customer_in_stock SET transport_amount=transport_amount - _paid WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeAdvance`(in _code varchar(20), in _employee_id int, in _advance_date varchar(20), in _amount double
	, in _account_id int, in _note text, in _created_employee_id int, in _inner_sale_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_advance_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	insert into employee_advance (code, employee_id, advance_date, amount, account_id, note, created_employee_id, inner_sale_id)
	values (_code, _employee_id, _date, _amount, _account_id, _note, _created_employee_id, _inner_sale_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeOff` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeOff` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeOff`(in _code varchar(20), in _employee_id int, in _created_date varchar(20), IN _from_date VARCHAR(20)
	, IN _to_date VARCHAR(20), in _note text, in _actual_off_day int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	insert into employee_off (code, employee_id, created_date, from_date, to_date, note, actual_off_day, created_employee_id)
	values (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), STR_TO_DATE(_from_date,'%d/%m/%Y'), STR_TO_DATE(_to_date,'%d/%m/%Y'), _note, _actual_off_day, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeOffIncrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeOffIncrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeOffIncrease`(IN _code VARCHAR(20), IN _employee_id INT, IN _created_date VARCHAR(20)
	, IN _quantity int, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO employee_off_increase (CODE, employee_id, created_date, quantity, note, created_employee_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeOffMoney` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeOffMoney` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeOffMoney`(IN _code VARCHAR(20), IN _employee_id INT, IN _created_date VARCHAR(20), IN _quantity int, IN _price DOUBLE
	, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO employee_off_money (CODE, employee_id, created_date, quantity, price, amount, account_id, note, created_employee_id)
	VALUES (_code, _employee_id, _date, _quantity, _price, _amount, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeTimesheet` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeTimesheet` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeTimesheet`(IN _code VARCHAR(20), IN _employee_id INT, IN _timesheet_date VARCHAR(20), in _field_id int
	, IN _quantity int, IN _note TEXT, in _created_employee_id int, OUT _id INT)
BEGIN
	declare _field_name varchar(255) default '';
	select name into _field_name from dynamic_field where id=_field_id;
	INSERT INTO timesheet (CODE, employee_id, timesheet_date, field_id, field_name, quantity, note, created_employee_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_timesheet_date,'%d/%m/%Y'), _field_id, _field_name, _quantity, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExpense` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExpense` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExpense`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _from_date VARCHAR(20), IN _to_date VARCHAR(20)
	, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _is_usually int, IN _type INT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _f_date, _t_date DATE;
	DECLARE _y, _m INT;
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	SET _f_date = STR_TO_DATE(_from_date,'%d/%m/%Y');
	SET _t_date = STR_TO_DATE(_to_date,'%d/%m/%Y');
	
	SET _y = 12 * (YEAR(_t_date) - YEAR(_f_date));
	SET _m = _y + MONTH(_t_date) - MONTH(_f_date);
	
	INSERT INTO expense (CODE, created_date, from_date, to_date, amount, account_id, note, content, is_usually, month_count, `type`, created_employee_id)
	VALUES (_code, _date, STR_TO_DATE(_from_date,'%d/%m/%Y'), STR_TO_DATE(_to_date,'%d/%m/%Y'), _amount, _account_id
		, _note, _content, _is_usually, _m, _type, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesale`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee as eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
		
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_export_wholesale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesaleDetail`(IN _gas_export_wholesale_id INT, IN _shell_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, s.id INTO _organization_id, _vendor_id, _shell
	FROM shell_vendor AS sv, shell AS s WHERE sv.id=_shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_export_wholesale_detail(gas_export_wholesale_id, shell_id, quantity, price, amount) 
	VALUES (_gas_export_wholesale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesaleReturnShellDetail`(IN _gas_export_wholesale_id INT, IN _shell_id INT, IN _quantity INT, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM gas_export_wholesale AS f, employee as eo
	WHERE f.id=_gas_export_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) values(_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_export_wholesale_shell_detail(gas_export_wholesale_id, shell_id, quantity) 
	VALUES (_gas_export_wholesale_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertFixedAssetDepreciation` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertFixedAssetDepreciation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFixedAssetDepreciation`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _note TEXT, OUT _id INT)
BEGIN
	INSERT INTO fixed_asset_depreciation (CODE, created_date, note)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _note);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertFixedAssetDepreciationDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertFixedAssetDepreciationDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFixedAssetDepreciationDetail`(IN _fixed_asset_depreciation_id INT, IN _fixed_asset_id INT, in _is_calculate int)
BEGIN
	INSERT INTO fixed_asset_depreciation_detail(fixed_asset_depreciation_id, fixed_asset_id, quantity, is_calculate, unit_id) 
	select _fixed_asset_depreciation_id, a.id, a.quantity, _is_calculate, a.unit_id
	from fixed_asset as a
	where a.id=_fixed_asset_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertFraction` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertFraction` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFraction`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _note TEXT, in _created_employee_id int, OUT _id INT)
BEGIN
	INSERT INTO fraction_gas (CODE, created_date, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertFractionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertFractionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFractionDetail`(in _fraction_id int, in _shell_id int, in _quantity int, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _weight, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, sk.weight, s.id INTO _organization_id, _vendor_id, _weight, _shell
	FROM shell_vendor as sv, shell as s, shell_kind as sk
	WHERE sv.id=_shell_id and sv.shell_id=s.id and s.kind_id=sk.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, -_quantity*_weight);
		ELSE
			UPDATE lpg_in_stock SET in_stock=in_stock -_quantity*_weight WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell, -_quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock as ss, shell_vendor as sv
		WHERE DATEDIFF(ss.`day`,_date)=0 and ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id and sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			select _date, id, _quantity from shell_vendor where organization_id=_organization_id AND vendor_id=_vendor_id and shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, -_quantity);
		ELSE
			UPDATE shield_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	insert into fraction_gas_detail(fraction_id, shell_id, quantity) values (_fraction_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), in _vendor_id int, in _store_id int
	, in _rate double, in _total double, in _paid double, in _debt double, in _account_id int, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasImportDetail`(IN _gas_import_id INT, IN _shell_id INT, IN _quantity INT, in _price double
	, in _amount double, IN _created_date VARCHAR(20), in _vendor_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM gas_import AS f, employee as eo
	WHERE f.id=_gas_import_id and f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			select id into _in_stock_id
			FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				insert into shell_vendor(organization_id, shell_id, vendor_id, quantity) values (_organization_id, _shell_id, _vendor_id, 0);
				SELECT LAST_INSERT_ID() INTO _in_stock_id;
			end if;
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) values (_date, _in_stock_id, _quantity);
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity + _quantity WHERE id=_in_stock_id;
	END IF;
	
	INSERT INTO gas_import_detail(gas_import_id, shell_id, quantity, price, amount) VALUES (_gas_import_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasPrice` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasPrice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasPrice`(IN _code VARCHAR(20), IN _from_date VARCHAR(20), IN _to_date VARCHAR(20)
	, IN _price DOUBLE, IN _customer_id INT, IN _note TEXT, OUT _id INT)
BEGIN
	INSERT INTO gas_price_list (CODE, from_date, to_date, customer_id, price, note)
	VALUES (_code, STR_TO_DATE(_from_date,'%d/%m/%Y'), STR_TO_DATE(_to_date,'%d/%m/%Y'), _customer_id, _price, _note);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasRetail`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _vehicle_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, OUT _id INT)
BEGIN
	INSERT INTO gas_retail (CODE, created_date, customer_id, vehicle_id, total, paid, debt, discount, total_pay, account_id, note)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _vehicle_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasRetailDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasRetailDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasRetailDetail`(IN _gas_retail_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO gas_retail_detail(gas_retail_id, shell_id, quantity, price, amount) 
	VALUES (_gas_retail_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasRetailPromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasRetailPromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasRetailPromotionMaterialDetail`(IN _gas_retail_id INT, IN _promotion_material_id INT, IN _quantity INT)
BEGIN
	INSERT INTO gas_retail_promotion(gas_retail_id, promotion_material_id, quantity) 
	VALUES (_gas_retail_id, _promotion_material_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasRetailReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasRetailReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasRetailReturnShellDetail`(IN _gas_retail_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
	INSERT INTO gas_retail_return_shell(gas_retail_id, shell_id, quantity) 
	VALUES (_gas_retail_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasReturn`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO gas_return (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasReturnDetail`(IN _gas_return_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO gas_return_detail(gas_return_id, shell_id, quantity, price, amount) 
	VALUES (_gas_return_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasReturnVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasReturnVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasReturnVendor`(in _id int, in _vendor_id int, in _organization_id int)
BEGIN
	if _id=0 then
		insert into gas_return_vendor(vendor_id, organization_id) values(_vendor_id, _organization_id);
	else
		update gas_return_vendor set vendor_id=_vendor_id, organization_id=_organization_id where id=_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesale`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _vehicle_out_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT
	, in _gas_return int, in _gas_return_price double, in _gas_return_amount double, IN _created_employee_id INT, in _old_paid_debt double, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT vendor_id INTO _vendor_id FROM gas_return_vendor WHERE organization_id=_organization_id limit 1;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _gas_return);
		ELSE
			UPDATE lpg_in_stock SET in_stock=in_stock + _gas_return WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.account_id=_account_id AND ss.organization_id=_organization_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES(_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM customer_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES(_date, _customer_id, _debt);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_wholesale (CODE, created_date, customer_id, vehicle_out_id, total, paid, debt, discount, total_pay, account_id, note, gas_return, gas_return_price, gas_return_amount, created_employee_id, paid_old_debt_amount)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _vehicle_out_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _gas_return, _gas_return_price, _gas_return_amount, _created_employee_id, _old_paid_debt);
	SELECT LAST_INSERT_ID() INTO _id;
	
	IF _old_paid_debt<>0 THEN
		CALL insertDebtWholesale(CONCAT(_code,'_auto'), _customer_id, _created_date, _old_paid_debt, _account_id, '', _created_employee_id, 1, _id, @auto_id);
	END IF;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesaleDetail`(IN _gas_wholesale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, s.id INTO _organization_id, _vendor_id, _shell
	FROM shell_vendor AS sv, shell AS s WHERE sv.id=_shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id and shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_wholesale_detail(gas_wholesale_id, shell_id, quantity, price, amount) 
	VALUES (_gas_wholesale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesaleFeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesaleFeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesaleFeeDetail`(IN _gas_wholesale_id INT, IN _fee_id INT, IN _amount INT, IN _note text)
BEGIN
	INSERT INTO gas_wholesale_fee_detail(gas_wholesale_id, fee_id, kind, amount, note) 
	select _gas_wholesale_id, id, kind, _amount, _note from gas_wholesale_fee where id=_fee_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesalePromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesalePromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesalePromotionMaterialDetail`(IN _gas_wholesale_id INT, IN _promotion_material_id INT, IN _quantity INT
	, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM gas_wholesale AS f, employee AS eo
	WHERE f.id=_gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
		IF _in_stock_id=0 THEN
			INSERT INTO promotion_material_in_stock(`day`, organization_id, promotion_material_id, in_stock) VALUES (_date, _organization_id, _promotion_material_id, -_quantity);
		ELSE
			UPDATE promotion_material_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_wholesale_promotion(gas_wholesale_id, promotion_material_id, quantity) 
	VALUES (_gas_wholesale_id, _promotion_material_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesaleReturnShellDetail`(IN _gas_wholesale_id INT, IN _shell_id INT, IN _quantity INT, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM gas_wholesale AS f, employee AS eo
	WHERE f.id=_gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, +_quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO gas_wholesale_return_shell(gas_wholesale_id, shell_id, quantity) 
	VALUES (_gas_wholesale_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGoodImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGoodImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGoodImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO good_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGoodImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGoodImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGoodImportDetail`(IN _good_import_id INT, IN _good_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM good_import AS f, employee AS eo WHERE f.id=_good_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- good_in_stock
		SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO good_in_stock(`day`, organization_id, good_id, store_id, in_stock) VALUES (_date, _organization_id, _good_id, _store_id, _quantity);
		ELSE
			UPDATE good_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO good_import_detail(good_import_id, good_id, quantity, price, amount) VALUES (_good_import_id, _good_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertIncome`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _amount DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _type int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO income (CODE, created_date, amount, account_id, note, content, `type`, created_employee_id)
	VALUES (_code, _date, _amount, _account_id, _note, _content, _type, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInStockDay` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInStockDay` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInStockDay`(in _day varchar(20))
BEGIN
	DECLARE _date, _start_date, _current_date, _pre_date DATE;
	
	select STR_TO_DATE(_day,'%d/%m/%Y') into _current_date;
	SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _start_date FROM parameter where code='startdate';
	
	set _date=null;
	select `day` into _date from shell_in_stock order by id desc limit 1;
	if _date is null then
		set _date=_start_date;
	end if;
	
	DELETE FROM shell_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM shell_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock)
	SELECT _current_date, tbl_shell.organization_id, tbl_shell.shell_id, coalesce(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM (
		SELECT sv.shell_id, sv.organization_id
		FROM shell AS s, organization AS o, shell_vendor AS sv
		WHERE o.id=sv.organization_id AND sv.shell_id=s.id AND s.STATUS=1 AND o.STATUS=1 GROUP BY o.id, s.id
	) AS tbl_shell
	LEFT JOIN (
		SELECT  organization_id, shell_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM shell_in_stock WHERE date(`day`)=_pre_date
	) AS tbl_old_stock ON tbl_shell.shell_id=tbl_old_stock.shell_id AND tbl_shell.organization_id=tbl_old_stock.organization_id
	LEFT JOIN (
		SELECT i.shell_id, eo.organization_id, COALESCE(SUM(i.quantity),0) AS in_stock
		FROM shell_import AS i, employee as eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i.shell_id, eo.organization_id
		UNION ALL
		SELECT sv.shell_id, sv.organization_id,  -SUM(f_det.quantity) AS in_stock
		FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
		WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY sv.shell_id, sv.organization_id
		UNION ALL
		SELECT i_det.shell_id, eo.organization_id, SUM(i_det.quantity) AS in_stock
		FROM gas_wholesale_return_shell AS i_det, gas_wholesale AS i, employee AS eo
		WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i_det.shell_id, eo.organization_id
		UNION ALL
		SELECT i_det.shell_id, eo.organization_id, -SUM(i_det.quantity) AS in_stock
		FROM shell_sale_detail AS i_det, shell_sale AS i, employee AS eo
		WHERE i_det.shell_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i_det.shell_id, eo.organization_id
		UNION ALL
		SELECT i.shell_id, eo.organization_id, SUM(i.quantity) AS in_stock
		FROM old_shell AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.shell_id, eo.organization_id
		UNION ALL
		SELECT sv.shell_id, sv.organization_id, SUM(f_det.quantity) AS in_stock
		FROM shell_return_detail AS f_det, shell_return AS f, shell_vendor AS sv
		WHERE f_det.shell_return_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY f_det.shell_id, sv.organization_id
		UNION ALL
		SELECT sv.shell_id, sv.organization_id, -SUM(f_det.quantity) AS in_stock
		FROM shell_return_supplier_detail AS f_det, shell_return_supplier AS f, shell_vendor as sv
		WHERE f_det.shell_return_supplier_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY f_det.shell_id, sv.organization_id
		UNION ALL
		SELECT f_det.shell_id, eo.organization_id,  SUM(f_det.quantity) AS in_stock
		FROM vehicle_in_return_shell_detail AS f_det, vehicle_in AS f, employee AS eo
		WHERE f_det.vehicle_in_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f.created_employee_id=eo.id
		GROUP BY f_det.shell_id, eo.organization_id
		UNION ALL
		SELECT f_det.shell_id, eo.organization_id,  SUM(f_det.quantity) AS in_stock
		FROM gas_export_wholesale_shell_detail AS f_det, gas_export_wholesale AS f, employee AS eo
		WHERE f_det.gas_export_wholesale_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f.created_employee_id=eo.id
		GROUP BY f_det.shell_id, eo.organization_id
	) AS tbl ON tbl.shell_id=tbl_shell.shell_id AND tbl.organization_id=tbl_shell.organization_id
	GROUP BY tbl_shell.organization_id, tbl_shell.shell_id;
	
	set _date=null;
	select `day` into _date from shell_gas_in_stock order by id desc limit 1;
	if _date is null then
		set _date=_start_date;
	end if;
	
	DELETE FROM shell_gas_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM shell_gas_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO shell_gas_in_stock(DAY, shell_vendor_id, in_stock)
	SELECT _current_date, sv.id, coalesce(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM vendor AS v, shell AS s, organization AS o, shell_vendor AS sv
	LEFT JOIN (
		SELECT id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM shell_gas_in_stock WHERE date(`day`)=_pre_date
	) AS tbl_old_stock ON sv.id=tbl_old_stock.id
	LEFT JOIN (
		SELECT sv.id, SUM(f_det.quantity) AS in_stock
		FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
		WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY sv.id
		union all
		SELECT sv.id, SUM(f_det.quantity) AS in_stock
		FROM gas_import_detail AS f_det, gas_import AS f, shell_vendor AS sv
		WHERE f_det.gas_import_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY sv.id
		UNION ALL
		SELECT sv.id, -SUM(i_det.quantity) AS in_stock
		FROM gas_wholesale_detail AS i_det, gas_wholesale AS i, shell_vendor AS sv
		WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i_det.shell_id=sv.id
		GROUP BY sv.id
		UNION ALL
		SELECT sv.id, -SUM(i_det.quantity) AS in_stock
		FROM vehicle_out_detail AS i_det, vehicle_out AS i, shell_vendor AS sv
		WHERE i_det.vehicle_out_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i_det.shell_id=sv.id
		GROUP BY sv.id
		UNION ALL
		SELECT sv.id, SUM(i_det.quantity) AS in_stock
		FROM vehicle_in_detail AS i_det, vehicle_in AS i, shell_vendor AS sv
		WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i_det.shell_id=sv.id
		GROUP BY sv.id
		UNION ALL
		SELECT sv.id, -SUM(f_det.quantity) AS in_stock
		FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f, shell_vendor as sv
		WHERE f_det.gas_export_wholesale_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			AND f_det.shell_id=sv.id
		GROUP BY sv.id
		UNION ALL
		SELECT sv.id, -SUM(i_det.quantity) AS in_stock
		FROM inner_sale_detail AS i_det, inner_sale AS i, shell_vendor AS sv
		WHERE i_det.inner_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i_det.shell_id=sv.id
		GROUP BY sv.id
	) AS tbl ON tbl.id=sv.id
	WHERE o.id=sv.organization_id AND sv.shell_id=s.id AND sv.vendor_id=v.id AND s.STATUS=1 AND o.STATUS=1 and v.status=1 GROUP BY o.id, s.id;
	
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM lpg_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM lpg_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM lpg_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO lpg_in_stock(DAY, organization_id, vendor_id, in_stock)
	SELECT _current_date, tbl_lpg_in_stock.organization_id, tbl_lpg_in_stock.vendor_id, COALESCE(tbl_lpg_in_stock.tbl_old_stock_quantity,0) 
		+ COALESCE(tbl_lpg_in_stock.tbl_import_quantity,0) - COALESCE(tbl_lpg_in_stock.tbl_export_quantity,0) 
		- COALESCE(tbl_lpg_in_stock.tbl_sale_quantity,0) - COALESCE(tbl_lpg_in_stock.tbl_fraction_quantity,0) 
		+ COALESCE(tbl_lpg_in_stock.tbl_gas_return_quantity,0)
	FROM (
		SELECT vo.organization_id, vo.vendor_id, tbl_import.tbl_import_quantity, tbl_export.tbl_export_quantity, tbl_sale.tbl_sale_quantity
			, tbl_old_stock.tbl_old_stock_quantity, tbl_fraction.tbl_fraction_quantity, tbl_gas_return.tbl_gas_return_quantity
		FROM vendor as v, vendor_organization as vo
		LEFT JOIN (
			SELECT COALESCE(SUM(i.actual_quantity),0) AS tbl_import_quantity, v.id as vendor_id, eo.organization_id
			FROM lpg_import as i, employee as eo, vendor as v
			WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
				and i.created_employee_id=eo.id and eo.organization_id=v.equal_organization_id
			group by i.vendor_id, eo.organization_id
		) AS tbl_import ON tbl_import.vendor_id=vo.vendor_id and tbl_import.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(SUM(i.actual_quantity),0) AS tbl_export_quantity, i.vendor_id, v.equal_organization_id as organization_id
			FROM lpg_import AS i, vendor AS v
			WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
				AND i.vendor_id=v.id
			GROUP BY i.vendor_id, v.equal_organization_id
		) AS tbl_export ON tbl_export.vendor_id=vo.vendor_id AND tbl_export.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(SUM(s.quantity),0) AS tbl_sale_quantity, v.id as vendor_id, eo.organization_id
			FROM lpg_sale AS s, employee AS eo, vendor as v
			WHERE DATE(s.sale_date) > _date AND DATE(s.sale_date) <= _current_date
				AND s.created_employee_id=eo.id and v.equal_organization_id=eo.organization_id
			GROUP BY v.id, eo.organization_id
		) AS tbl_sale ON tbl_sale.vendor_id=vo.vendor_id AND tbl_sale.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(in_stock,0) AS tbl_old_stock_quantity, vendor_id, organization_id
			FROM lpg_in_stock 
			WHERE DATE(`day`) = _pre_date
		) AS tbl_old_stock ON tbl_old_stock.vendor_id=vo.vendor_id and tbl_old_stock.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(SUM(f_det.quantity*k.weight),0) AS tbl_fraction_quantity, sv.vendor_id, sv.organization_id
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor as sv, shell AS s, shell_kind AS k
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
				AND f_det.shell_id=sv.id and sv.shell_id=s.id AND s.kind_id=k.id
			group by sv.vendor_id, sv.organization_id
		) AS tbl_fraction ON tbl_fraction.vendor_id=vo.vendor_id AND tbl_fraction.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(SUM(s.gas_return),0) AS tbl_gas_return_quantity, rv.vendor_id, rv.organization_id
			FROM gas_wholesale AS s, employee as eo, gas_return_vendor as rv
			WHERE DATE(s.created_date) > _date AND DATE(s.created_date) <= _current_date
				and s.created_employee_id=eo.id and eo.organization_id=rv.organization_id
			GROUP BY rv.vendor_id, rv.organization_id
		) AS tbl_gas_return ON tbl_gas_return.vendor_id=vo.vendor_id and tbl_gas_return.organization_id=vo.organization_id
		where v.id=vo.vendor_id and v.status=1 and v.has_stock=1
	) AS tbl_lpg_in_stock;
	SET _date=NULL;
	SELECT `day` INTO _date FROM accessory_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM accessory_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM accessory_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO accessory_in_stock(DAY, organization_id, accessory_id, in_stock)
	SELECT _current_date, o.id, s.id, coalesce(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM accessory AS s
	left join organization as o on 1
	LEFT JOIN (
		SELECT organization_id, accessory_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM accessory_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON s.id=tbl_old_stock.accessory_id and tbl_old_stock.organization_id=o.id
	LEFT JOIN (
		SELECT i_det.accessory_id, eo.organization_id, SUM(i_det.quantity) AS in_stock
		FROM accessory_import_detail AS i_det, accessory_import AS i, employee as eo
		WHERE i_det.accessory_import_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i_det.accessory_id, eo.organization_id
		UNION ALL
		SELECT i_det.accessory_id, eo.organization_id, -SUM(i_det.quantity) AS in_stock
		FROM accessory_sale_detail AS i_det, accessory_sale AS i, employee AS eo
		WHERE i_det.accessory_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i_det.accessory_id, eo.organization_id
	) AS tbl ON tbl.accessory_id=s.id and tbl.organization_id=o.id
	WHERE s.STATUS=1 and o.status=1 GROUP BY o.id, s.id;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM promotion_material_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM promotion_material_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM promotion_material_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO promotion_material_in_stock(DAY, promotion_material_id, organization_id, in_stock)
	SELECT _current_date, s.id, o.id, COALESCE(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM promotion_material AS s
	left join organization as o on 1
	LEFT JOIN (
		SELECT promotion_material_id, organization_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM promotion_material_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON s.id=tbl_old_stock.promotion_material_id and tbl_old_stock.organization_id=o.id
	LEFT JOIN (
		SELECT i_det.promotion_material_id, eo.organization_id, SUM(i_det.quantity) AS in_stock
		FROM promotion_material_import_detail AS i_det, promotion_material_import AS i, employee as eo
		WHERE i_det.promotion_material_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i_det.promotion_material_id, eo.organization_id
		UNION ALL
		SELECT i_det.promotion_material_id, eo.organization_id, -SUM(i_det.quantity) AS in_stock
		FROM gas_wholesale_promotion AS i_det, gas_wholesale AS i, employee as eo
		WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i_det.promotion_material_id, eo.organization_id
	) AS tbl ON tbl.promotion_material_id=s.id and tbl.organization_id=o.id
	WHERE s.STATUS=1 and o.status=1 GROUP BY o.id, s.id;
	SET _date=NULL;
	SELECT `day` INTO _date FROM petro_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM petro_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM petro_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO petro_in_stock(DAY, petro_id, store_id, organization_id, in_stock)
	SELECT _current_date, s.id, o.id, o.organization_id, COALESCE(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM petro AS s
	left join store as o on 1
	LEFT JOIN (
		SELECT petro_id, store_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM petro_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON s.id=tbl_old_stock.petro_id and tbl_old_stock.store_id=o.id
	LEFT JOIN (
		SELECT i_det.petro_id, i.store_id, SUM(i_det.quantity) AS in_stock
		FROM petro_import_detail AS i_det, petro_import AS i
		WHERE i_det.petro_import_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.petro_id, i.store_id
		UNION ALL
		SELECT i_det.petro_id, i.store_id, -SUM(i_det.quantity) AS in_stock
		FROM petro_sale_detail AS i_det, petro_sale AS i
		WHERE i_det.petro_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.petro_id, i.store_id
	) AS tbl ON tbl.petro_id=s.id and tbl.store_id=o.id
	WHERE s.STATUS=1 and o.status=1 and o.is_petro=1 GROUP BY o.id, s.id;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM good_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM good_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM good_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO good_in_stock(DAY, good_id, organization_id, store_id, in_stock)
	SELECT _current_date, s.id, o.organization_id, o.id, COALESCE(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM good AS s
	LEFT JOIN store AS o ON 1
	LEFT JOIN (
		SELECT good_id, store_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM good_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON s.id=tbl_old_stock.good_id AND tbl_old_stock.store_id=o.id
	LEFT JOIN (
		SELECT i_det.good_id, i.store_id, SUM(i_det.quantity) AS in_stock
		FROM good_import_detail AS i_det, good_import AS i
		WHERE i_det.good_import_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.good_id, i.store_id
		UNION ALL
		SELECT i_det.good_id, i.store_id, -SUM(i_det.quantity) AS in_stock
		FROM good_sale_detail AS i_det, good_sale AS i
		WHERE i_det.good_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.good_id, i.store_id
	) AS tbl ON tbl.good_id=s.id AND tbl.store_id=o.id
	WHERE s.STATUS=1 AND o.STATUS=1 and o.is_good=1 GROUP BY o.id, s.id;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM money_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM money_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM money_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO money_in_stock(DAY, account_id, organization_id, in_stock)
	SELECT _current_date, a.id, a.organization_id, COALESCE(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM account AS a
	LEFT JOIN (
		SELECT account_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM money_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON a.id=tbl_old_stock.account_id 
	LEFT JOIN (
		SELECT a.account_id, -SUM(a.amount) AS in_stock
		FROM employee_advance AS a
		WHERE DATE(a.advance_date) > _date AND DATE(a.advance_date) <= _current_date
		GROUP BY a.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.amount) AS in_stock
		FROM employee_off_money AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM gas_export_wholesale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.amount) AS in_stock
		FROM shell_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM lpg_import AS i
		WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM lpg_sale AS i
		WHERE DATE(i.sale_date) > _date AND DATE(i.sale_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM gas_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM gas_wholesale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM gas_retail AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM shell_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM accessory_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM promotion_material_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM petro_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM good_import AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM accessory_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM petro_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM good_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, -SUM(i.paid) AS in_stock
		FROM vendor_debt AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM retail_debt AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM wholesale_debt AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.amount) AS in_stock
		FROM income AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, sum(amount/IF(month_count=0,1,month_count)) AS in_stock
		FROM expense AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.money_amount) AS in_stock
		FROM transport_service AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
		UNION ALL
		SELECT i.account_id, SUM(i.paid) AS in_stock
		FROM inner_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.account_id
	) AS tbl ON tbl.account_id=a.id
	GROUP BY a.id;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM shield_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM shield_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM shield_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO shield_in_stock(DAY, vendor_id, organization_id, in_stock)
	SELECT _current_date, vo.vendor_id, vo.organization_id, coalesce(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	from vendor as v, vendor_organization AS vo
	left join (
		SELECT SUM(i.quantity) AS in_stock, i.vendor_id, eo.organization_id
		FROM shield_import as i, employee as eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.created_employee_id=eo.id
		group by eo.organization_id, i.vendor_id 
		UNION ALL
		SELECT -SUM(i.quantity) AS in_stock, i.vendor_id, eo.organization_id
		FROM shield_decrease AS i, employee as eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		group by eo.organization_id, i.vendor_id
		UNION ALL
		SELECT -SUM(f_det.quantity) AS in_stock, sv.vendor_id, sv.organization_id
		FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor as sv
		WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _date AND DATE(f.created_date) <= _current_date
			and f_det.shell_id=sv.id
		group by sv.organization_id, sv.vendor_id
	) AS tbl on tbl.vendor_id=vo.vendor_id and tbl.organization_id=vo.organization_id
	LEFT JOIN (
		SELECT COALESCE(in_stock,0) AS tbl_old_in_stock, vendor_id, organization_id
		FROM shield_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON tbl_old_stock.vendor_id=vo.vendor_id and tbl_old_stock.organization_id=vo.organization_id
	where v.STATUS=1 and v.has_stock=1 and v.id=vo.vendor_id
	group by vo.organization_id, vo.vendor_id
	;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM customer_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM customer_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM customer_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO customer_in_stock(DAY, customer_id, shell_12, shell_45, amount)
	SELECT _current_date, c.id, COALESCE(tbl_old_stock.shell_12,0) + COALESCE(SUM(tbl.quantity_12),0)
		, COALESCE(tbl_old_stock.shell_45,0) + COALESCE(SUM(tbl.quantity_45),0)
		, COALESCE(tbl_old_stock.amount,0) + COALESCE(SUM(tbl.debt),0)
	FROM customer AS c
	LEFT JOIN (
		SELECT i.customer_id, SUM(IF(shell_12.id IS NOT NULL, idet.quantity,0)) AS quantity_12
			, SUM(IF(shell_45.id IS NOT NULL, idet.quantity,0)) AS quantity_45
			, 0 as debt
		FROM gas_wholesale AS i, gas_wholesale_detail AS idet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			and i.id=idet.gas_wholesale_id
		GROUP BY i.customer_id
		union all
		SELECT i.customer_id, -SUM(IF(shell_12.id IS NOT NULL, idet.quantity,0)) AS quantity_12
			, -SUM(IF(shell_45.id IS NOT NULL, idet.quantity,0)) AS quantity_45
			, 0 as debt
		FROM gas_wholesale AS i, gas_wholesale_return_shell AS idet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.id=idet.gas_wholesale_id
		GROUP BY i.customer_id
		union all
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, sum(i.debt) as debt
		FROM gas_wholesale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS debt
		FROM gas_export_wholesale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		union all
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, sum(i.debt) as debt
		FROM good_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS debt
		FROM petro_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS debt
		FROM shell_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS debt
		FROM lpg_sale AS i
		WHERE DATE(i.sale_date) > _date AND DATE(i.sale_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -SUM(i.paid) AS debt
		FROM wholesale_debt AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_customer_id as customer_id, 0 AS quantity_12, 0 AS quantity_45, -SUM(i.customer_amount) AS debt
		FROM transport_service AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date and i.customer_id<>0
		GROUP BY i.customer_customer_id
	) AS tbl ON tbl.customer_id=c.id
	LEFT JOIN (
		SELECT customer_id, COALESCE(shell_12,0) AS shell_12, COALESCE(shell_45,0) AS shell_45, COALESCE(amount,0) AS amount
		FROM customer_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON tbl_old_stock.customer_id=c.id
	WHERE c.STATUS=1
	GROUP BY c.id
	;
	
	SET _date=NULL;
	SELECT `day` INTO _date FROM vendor_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM vendor_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM vendor_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	INSERT INTO vendor_in_stock(DAY, vendor_id, organization_id, amount, shell_12, shell_45, transport_amount)
	SELECT _current_date, vo.vendor_id, vo.organization_id, COALESCE(tbl_old_stock.amount,0) + COALESCE(SUM(tbl.debt),0)
		, COALESCE(tbl_old_stock.shell_12,0) + COALESCE(SUM(tbl.quantity_12),0)
		, COALESCE(tbl_old_stock.shell_45,0) + COALESCE(SUM(tbl.quantity_45),0)
		, COALESCE(tbl_old_stock.transport_amount,0) + COALESCE(SUM(tbl.transport_debt),0)
	FROM vendor as v, organization as o, vendor_organization AS vo
	LEFT JOIN (
		SELECT i.vendor_id, eo.organization_id, sum(i.debt) as debt, 0 as quantity_12, 0 as quantity_45, 0 as transport_debt
		FROM lpg_import AS i, employee as eo
		WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		union all
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM gas_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, 0 AS debt
			, SUM(IF(shell_12.id IS NOT NULL, i.quantity,0)) AS quantity_12
			, SUM(IF(shell_45.id IS NOT NULL, i.quantity,0)) AS quantity_45
			, 0 AS transport_debt
		FROM employee AS eo, shell_import AS i
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON i.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON i.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, 0 AS debt
			, SUM(IF(shell_12.id IS NOT NULL, idet.quantity,0)) AS quantity_12
			, SUM(IF(shell_45.id IS NOT NULL, idet.quantity,0)) AS quantity_45
			, 0 AS transport_debt
		FROM employee AS eo, gas_import AS i, gas_import_detail as idet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		union all
		SELECT i.vendor_id, eo.organization_id, - SUM(if(i.kind=1,i.paid,0)) AS debt, 0 AS quantity_12, 0 AS quantity_45, - SUM(IF(i.kind=2,i.paid,0)) AS transport_debt
		FROM vendor_debt AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		union all
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM promotion_material_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, 0 AS debt
			, -SUM(IF(shell_12.id IS NOT NULL, idet.quantity,0)) AS quantity_12
			, -SUM(IF(shell_45.id IS NOT NULL, idet.quantity,0)) AS quantity_45
			, 0 AS transport_debt
		FROM employee AS eo, shell_return_supplier AS i, shell_return_supplier_detail AS idet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_vendor_id as vendor_id, eo.organization_id, 0 AS debt, 0 AS quantity_12, 0 AS quantity_45, SUM(i.vendor_amount) AS transport_debt
		FROM transport_service AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_vendor_id
	) AS tbl ON tbl.vendor_id=vo.vendor_id and tbl.organization_id=vo.organization_id
	LEFT JOIN (
		SELECT vendor_id, organization_id, COALESCE(amount,0) AS amount, COALESCE(shell_12,0) AS shell_12, COALESCE(shell_45,0) AS shell_45, COALESCE(transport_amount,0) AS transport_amount
		FROM vendor_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON tbl_old_stock.vendor_id=vo.vendor_id and tbl_old_stock.organization_id=vo.organization_id
	WHERE vo.vendor_id=v.id and vo.organization_id=o.id and v.STATUS=1 and o.status=1
	GROUP BY vo.vendor_id, vo.organization_id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInStockManyDay` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInStockManyDay` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInStockManyDay`()
BEGIN
	DECLARE _counter INT;
	DECLARE _max_day, _yesterday DATE;
	
	SET _counter=1;
	SET _max_day=NULL;
	
	SELECT DATE_ADD(SYSDATE(), INTERVAL -1 DAY) INTO _yesterday;
	
	SELECT MAX(auto_date) INTO _max_day FROM auto WHERE auto_name='in_stock';
	
	IF _max_day IS NULL THEN
		SELECT DATE_ADD(SYSDATE(), INTERVAL -2 DAY) INTO _max_day;
	END IF;
	SELECT DATEDIFF(_yesterday,_max_day) INTO _counter;
	WHILE _counter>0 DO
		SELECT DATE_ADD(_max_day, INTERVAL 1 DAY) INTO _max_day;
		SET _counter=_counter-1;
		CALL insertInStockDay(DATE_FORMAT(_max_day,'%d/%m/%Y'));
	END WHILE;
	
	Insert Into auto (auto_date, auto_name) Values (_yesterday,'in_stock');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLoVo` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLoVo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoVo`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO lo_vo (CODE, created_date, quantity, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLoVoEmployeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLoVoEmployeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoVoEmployeeDetail`(IN _lo_vo_id INT, IN _employee_id INT, IN _note TEXT)
BEGIN
	INSERT INTO lo_vo_employee_detail(lo_vo_id, employee_id, note) 
	VALUES (_lo_vo_id, _employee_id, _note);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLpgImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLpgImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLpgImport`(IN _code VARCHAR(20), IN _vendor_id INT, in _kind int, IN _import_date VARCHAR(20)
	, IN _paper_quantity float, IN _actual_quantity float, IN _price double, in _vat double, in _invoice_amount double, IN _amount double
	, IN _paid double, IN _debt double, IN _rate double, in _account_id int, in _route_id int, IN _note TEXT, in _link_lpg_codes text
	, in _created_employee_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _import_vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	declare _link_lpg_ids text default '';
	
	SELECT STR_TO_DATE(_import_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	select id into _import_vendor_id from vendor where equal_organization_id=_organization_id limit 1;
	SELECT GROUP_CONCAT(id) into _link_lpg_ids FROM lpg_sale WHERE CONCAT('%,',_link_lpg_codes,',%') LIKE CONCAT('%,',CODE,',%');
	
	INSERT INTO lpg_import (CODE, vendor_id, kind, import_date, paper_quantity, actual_quantity, price, vat, invoice_amount, amount, paid, debt, rate, account_id, route_id, note, link_lpg_codes, link_lpg_ids, created_employee_id)
	VALUES (_code, _vendor_id, _kind, _date, _paper_quantity, _actual_quantity, _price, _vat, _invoice_amount, _amount, _paid, _debt, _rate, _account_id, _route_id, _note, _link_lpg_codes, _link_lpg_ids, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_import_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _import_vendor_id, _actual_quantity);
		ELSE
			UPDATE lpg_in_stock SET in_stock=in_stock + _actual_quantity WHERE id=_in_stock_id;
		END IF;
	
		if _kind=1 then
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLpgSale`(IN _code VARCHAR(20), IN _kind INT, IN _customer_id INT, IN _sale_date VARCHAR(20)
	, IN _quantity FLOAT, IN _price DOUBLE, IN _price_transport DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _account_id INT, IN _route_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_sale_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	SELECT id INTO _vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	INSERT INTO lpg_sale (CODE, kind, customer_id, sale_date, quantity, price, price_transport, vat, rate, amount, paid, debt, account_id, route_id, note, created_employee_id)
	VALUES (_code, _kind, _customer_id, _date, _quantity, _price, _price_transport, _vat, _rate, _amount, _paid, _debt, _account_id, _route_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		if _vendor_id <> 0 then
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, -_quantity);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		end if;
	
		IF _kind=1 THEN
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOldShell`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO old_shell (CODE, created_date, quantity, shell_id, note, created_employee_id)
	VALUES (_code, _date, _quantity, _shell_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOrganizationShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOrganizationShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOrganizationShellDetail`(IN _organization_id INT, IN _shell_id INT)
BEGIN
	INSERT INTO organization_shell(organization_id, shell_id) 
	VALUES (_organization_id, _shell_id);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPetroImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	select STR_TO_DATE(_created_date,'%d/%m/%Y') into _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO petro_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPetroImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPetroImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPetroImportDetail`(IN _petro_import_id INT, IN _petro_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20), in _store_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM petro_import AS f, employee as eo
	WHERE f.id=_petro_import_id AND f.created_employee_id=eo.id;
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- petro_in_stock
		SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id and store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO petro_in_stock(`day`, organization_id, petro_id, store_id, in_stock) VALUES (_date, _organization_id, _petro_id, _store_id, _quantity);
		ELSE
			UPDATE petro_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO petro_import_detail(petro_import_id, petro_id, quantity, price, amount) VALUES (_petro_import_id, _petro_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromotionMaterialImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO promotion_material_import (CODE, created_date, vendor_id, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPromotionMaterialImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPromotionMaterialImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromotionMaterialImportDetail`(IN _promotion_material_import_id INT, IN _promotion_material_id INT
	, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM promotion_material_import AS f, employee AS eo
	WHERE f.id=_promotion_material_import_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
		IF _in_stock_id=0 THEN
			INSERT INTO promotion_material_in_stock(`day`, organization_id, promotion_material_id, in_stock) VALUES (_date, _organization_id, _promotion_material_id, _quantity);
		ELSE
			UPDATE promotion_material_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO promotion_material_import_detail(import_id, promotion_material_id, quantity, price, amount) 
	VALUES (_promotion_material_import_id, _promotion_material_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSalary` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSalary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalary`(IN _code VARCHAR(20), IN _employee_id INT, IN _created_date VARCHAR(20)
	, IN _month_day INT, IN _basic_salary DOUBLE, OUT _id INT)
BEGIN
declare _real_salary, _total, _timesheet_total, _field_total double default 0;
	declare _off_day, _working_day int default 0;
	declare _date date;
	
	select STR_TO_DATE(_created_date,'%d/%m/%Y') into _date;
	
	select COALESCE(SUM(actual_off_day),0) into _off_day
	from employee_off
	where month(created_date)=month(_date) and year(created_date)=year(_date) and employee_id=_employee_id;
	
	set _working_day = _month_day - _off_day;
	
	insert into employee_salary (code, employee_id, created_date, basic_salary, real_salary, total, month_day, working_day)
	values (_code, _employee_id, _date, _basic_salary, basic_salary * _working_day / _month_day, basic_salary * _working_day / _month_day, _month_day, _working_day);
	
	SELECT LAST_INSERT_ID() INTO _id;
	
	insert into employee_salary_timesheet_detail (employee_salary_id, field_id, field_name, quantity, price, amount)
	select _id, t.field_id, t.field_name, sum(t.quantity), f.amount, SUM(t.quantity) * f.amount
	from timesheet t, salary_timesheet_field as f
	where t.employee_id=_employee_id and month(t.timesheet_date)=month(_date) and year(t.timesheet_date)=year(_date) and t.field_id=f.field_id
	group by t.employee_id, t.field_id;
	
	insert into employee_salary_field_detail (employee_salary_id, field_id, field_name, amount, note)
	select _id, f.id, f.name, s.amount, ''
	from employee_salary_field as s, dynamic_field as f
	where s.employee_id=_employee_id and s.field_id=f.id;
	
	select coalesce(sum(amount),0) into _timesheet_total from employee_salary_timesheet_detail where employee_salary_id=_id;
	SELECT COALESCE(SUM(amount),0) INTO _field_total FROM employee_salary_field_detail WHERE employee_salary_id=_id;
	
	update employee_salary set total=total+_timesheet_total+_field_total where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleAccessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleAccessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleAccessory`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO accessory_sale (CODE, created_date, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleAccessoryChangeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleAccessoryChangeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleAccessoryChangeDetail`(IN _accessory_sale_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO accessory_sale_change_detail(accessory_sale_id, accessory_id, quantity, price, amount) 
	VALUES (_accessory_sale_id, _accessory_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleAccessoryDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleAccessoryDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleAccessoryDetail`(IN _accessory_sale_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id	FROM accessory_sale AS f, employee AS eo WHERE f.id=_accessory_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
		IF _in_stock_id=0 THEN
			INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, -_quantity);
		ELSE
			UPDATE accessory_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO accessory_sale_detail(accessory_sale_id, accessory_id, quantity, price, amount) 
	VALUES (_accessory_sale_id, _accessory_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleGood`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _store_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO good_sale (CODE, created_date, customer_id, store_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _store_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleGoodDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleGoodDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleGoodDetail`(IN _good_sale_id INT, IN _good_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM good_sale AS f, employee AS eo WHERE f.id=_good_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- good_in_stock
		SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO good_in_stock(`day`, organization_id, good_id, store_id, in_stock) VALUES (_date, _organization_id, _good_id, _store_id, -_quantity);
		ELSE
			UPDATE good_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO good_sale_detail(good_sale_id, good_id, quantity, price, amount) 
	VALUES (_good_sale_id, _good_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleInner`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _employee_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO inner_sale (CODE, created_date, employee_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _employee_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	IF _employee_id<>0 THEN
		call insertEmployeeAdvance(CONCAT(_code,'_auto'), _employee_id, _created_date, _debt, _account_id, _note, _created_employee_id, _id, @auto_id);
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleInnerDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleInnerDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleInnerDetail`(IN _inner_sale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, s.id INTO _organization_id, _vendor_id, _shell
	FROM shell_vendor AS sv, shell AS s WHERE sv.id=_shell_id AND sv.shell_id=s.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO inner_sale_detail(inner_sale_id, shell_id, quantity, price, amount) VALUES (_inner_sale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalePetro`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), in _customer_id int, in _store_id int, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO petro_sale (CODE, created_date, customer_id, store_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _store_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSalePetroDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSalePetroDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalePetroDetail`(IN _petro_sale_id INT, IN _petro_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM petro_sale AS f, employee AS eo WHERE f.id=_petro_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- petro_in_stock
		SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id AND store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO petro_in_stock(`day`, organization_id, petro_id, store_id, in_stock) VALUES (_date, _organization_id, _petro_id, _store_id, -_quantity);
		ELSE
			UPDATE petro_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO petro_sale_detail(petro_sale_id, petro_id, quantity, price, amount) 
	VALUES (_petro_sale_id, _petro_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleShell`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	select STR_TO_DATE(_created_date,'%d/%m/%Y') into _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO shell_sale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleShellDetail`(IN _shell_sale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM shell_sale AS f, employee as eo
	WHERE f.id=_shell_sale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, -_quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO shell_sale_detail(shell_sale_id, shell_id, quantity, price, amount) VALUES (_shell_sale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellImport`(IN _code VARCHAR(20), IN _shell_id INT, IN _created_date VARCHAR(20), IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id Int, IN _note TEXT, in _created_employee_id int, in _vendor_id int, OUT _id INT)
BEGIN
	declare _shell_vendor_id, _organization_id, _is_shell_12, _is_shell_45 int default 0;
	declare _date_diff, _in_stock_id int default 0;
	declare _date date;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	INSERT INTO shell_import (CODE, shell_id, created_date, quantity, price, amount, account_id, note, created_employee_id, vendor_id)
	VALUES (_code, _shell_id, _date, _quantity, _price, _amount, _account_id, _note, _created_employee_id, _vendor_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	select id into _shell_vendor_id from shell_vendor where shell_id=_shell_id and vendor_id=_vendor_id and organization_id=_organization_id;
	
	if _shell_vendor_id=0 then
		insert into shell_vendor(organization_id, shell_id, vendor_id, quantity) values(_organization_id, _shell_id, _vendor_id, _quantity);
	else
		update shell_vendor set quantity=quantity+_quantity where id=_shell_vendor_id;
	end if;
	
	SELECT DATEDIFF(sysdate(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		select id into _in_stock_id from shell_in_stock where datediff(`day`,_date)=0 and organization_id=_organization_id and shell_id=_shell_id;
		if _in_stock_id=0 then
			insert into shell_in_stock(`day`, organization_id, shell_id, in_stock) values (_date, _organization_id, _shell_id, _quantity);
		else
			update shell_in_stock set in_stock=in_stock + _quantity where id=_in_stock_id;
		end if;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id and vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			IF _is_shell_12=1 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, _quantity, 0);
			ELSE
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, 0, _quantity);
			END IF;
		ELSE
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 + _quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 + _quantity WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		set _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturn`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _vehicle_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO shell_return (CODE, created_date, customer_id, vehicle_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _vehicle_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturnDetail`(IN _created_date VARCHAR(20), IN _shell_return_id INT, IN _shell_id INT
	, IN _quantity INT, IN _customer_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _is_shell_12, _is_shell_45 INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT eo.organization_id INTO _organization_id
	FROM shell_return AS f, employee AS eo
	WHERE f.id=_shell_return_id AND f.created_employee_id=eo.id;
	
	select 1 into _is_shell_12 from shell as s, shell_kind as sk where s.id=_shell_id and s.kind_id=sk.id and sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			if _is_shell_12=1 then
				INSERT INTO customer_in_stock(`day`, customer_id, shell_12, shell_45) VALUES (_date, _customer_id, -_quantity, 0);
			else
				INSERT INTO customer_in_stock(`day`, customer_id, shell_12, shell_45) VALUES (_date, _customer_id, 0, -_quantity);
			end if;
		ELSE
			IF _is_shell_12=1 THEN
				UPDATE customer_in_stock SET shell_12=shell_12 - _quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE customer_in_stock SET shell_45=shell_45 - _quantity WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO shell_return_detail(shell_return_id, shell_id, quantity) VALUES (_shell_return_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellReturnSupplier` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellReturnSupplier` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturnSupplier`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT, IN _vehicle_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO shell_return_supplier (CODE, created_date, vendor_id, vehicle_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _vehicle_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellReturnSupplierDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellReturnSupplierDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturnSupplierDetail`(IN _shell_return_supplier_id INT, IN _shell_id INT, IN _quantity INT
	, IN _created_date VARCHAR(20), IN _vendor_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _is_shell_12, _is_shell_45 INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM shell_return_supplier AS f, employee AS eo
	WHERE f.id=_shell_return_supplier_id AND f.created_employee_id=eo.id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, -_quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id and vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			IF _is_shell_12=1 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, -_quantity, 0);
			ELSE
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, 0, -_quantity);
			END IF;
		ELSE
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 - _quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 - _quantity WHERE id=_in_stock_id;
			END IF;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO shell_return_supplier_detail(shell_return_supplier_id, shell_id, quantity) VALUES (_shell_return_supplier_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShieldDecrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShieldDecrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShieldDecrease`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, IN _vendor_id INT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO shield_decrease (CODE, created_date, quantity, note, vendor_id, created_employee_id)
	VALUES (_code, _date, _quantity, _note, _vendor_id, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _quantity);
		ELSE
			UPDATE shield_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShieldImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, in _vendor_id int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO shield_import (CODE, created_date, quantity, note, vendor_id, created_employee_id)
	VALUES (_code, _date, _quantity, _note, _vendor_id, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _quantity);
		ELSE
			UPDATE shield_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransportService`(IN _code VARCHAR(20), IN _vendor_id INT, in _customer_id int, IN _transporter_id INT
	, IN _charge_for_vendor INT, IN _charge_for_customer INT, IN _created_date VARCHAR(20), IN _in_quantity double, IN _out_quantity double
	, IN _price DOUBLE, IN _price_diff DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _rate_diff DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _organization_vendor_id, _organization_transport_vendor_id
		, _money_organization_id, _vendor_vendor_id, _customer_customer_id INT DEFAULT 0;
	DECLARE _money_amount, _vendor_amount, _customer_amount double default 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	
	select equal_organization_id into _organization_vendor_id from vendor where id=_vendor_id;
	
	SELECT equal_organization_id INTO _organization_transport_vendor_id FROM vendor WHERE id=_transporter_id;
	
	if _organization_vendor_id<>_organization_id then
		set _organization_vendor_id=0;
	end if;
	
	IF _organization_transport_vendor_id<>_organization_id THEN
		SET _organization_transport_vendor_id=0;
	END IF;
	
	IF _charge_for_vendor=1 THEN	-- ben ban chiu
		IF _organization_vendor_id<>0 THEN	-- ben ban la minh
			IF _vendor_id<>_transporter_id THEN	-- minh khong phai la ben van chuyen
				set _money_organization_id = _organization_vendor_id;
				set _money_amount = -_paid;
				set _vendor_vendor_id = _transporter_id;
				set _vendor_amount = _debt;
			END IF;
		ELSE -- ben ban la cong ty khac
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_transport_vendor_id;
				SET _money_amount = _paid;
				SET _vendor_vendor_id = _vendor_id;
				SET _vendor_amount = -_debt;
			END IF;
		END IF;
	ELSEIF _charge_for_customer=1 THEN	-- ben mua chiu
		IF _customer_id=0 THEN	-- ben mua la minh
			IF _organization_transport_vendor_id=0 THEN	-- minh khong phai la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = _debt;
			END IF;
		ELSE
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = _paid;
				SET _customer_customer_id = _customer_id;
				SET _customer_amount = _debt;
			END IF;
		END IF;
	END IF;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		IF _money_organization_id<>0 THEN
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_money_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _money_organization_id, _account_id, _money_amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _money_amount WHERE id=_in_stock_id;
			END IF;
		END IF;
		
		if _vendor_vendor_id<>0 then
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_vendor_id, _vendor_amount);
			ELSE
				UPDATE vendor_in_stock SET transport_amount=transport_amount + _vendor_amount WHERE id=_in_stock_id;
			END IF;
		end if;
	
		if _customer_customer_id<>0 then
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, transport_amount) VALUES (_date, _customer_customer_id, _customer_amount);
			ELSE
				UPDATE customer_in_stock SET transport_amount=transport_amount + _customer_amount WHERE id=_in_stock_id;
			END IF;
		end if;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO transport_service (CODE, created_date, vendor_id, customer_id, transporter_id, charge_for_vendor, charge_for_customer, in_quantity
		, out_quantity, price, price_diff, rate, rate_diff, amount, paid, debt, account_id, note, created_employee_id, money_organization_id
		, money_amount, vendor_vendor_id, vendor_amount, customer_customer_id, customer_amount)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _customer_id, _transporter_id, _charge_for_vendor, _charge_for_customer, _in_quantity
		, _out_quantity, _price, _price_diff, _rate, _rate_diff, _amount, _paid, _debt, _account_id, _note, _created_employee_id, _money_organization_id
		, _money_amount, _vendor_vendor_id, _vendor_amount, _customer_customer_id, _customer_amount);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertTripFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertTripFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTripFee`(IN _code VARCHAR(20), IN _vehicle_id INT, IN _created_date VARCHAR(20), in _quantity int
	, in _price double, IN _amount DOUBLE, in _fee text, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO trip_fee (CODE, vehicle_id, created_date, quantity, price, amount, fee, note, created_employee_id)
	VALUES (_code, _vehicle_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _price, _amount, _fee, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleIn` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleIn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleIn`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vehicle_out_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO vehicle_in (CODE, created_date, vehicle_out_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vehicle_out_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInAccessoryDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInAccessoryDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInAccessoryDetail`(IN _vehicle_in_id INT, IN _created_date VARCHAR(20), IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM vehicle_in AS f, employee AS eo
	WHERE f.id=_vehicle_in_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- accessory_in_stock
		SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
		IF _in_stock_id=0 THEN
			INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, _quantity);
		ELSE
			UPDATE accessory_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO vehicle_in_accessory_detail(vehicle_in_id, accessory_id, quantity, price, amount) 
	VALUES (_vehicle_in_id, _accessory_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInDetail`(IN _vehicle_in_id INT, IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, sv.shell_id INTO _organization_id, _vendor_id, _shell
	FROM shell_vendor AS sv
	WHERE sv.id=_shell_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			SELECT _date, id, _quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO vehicle_in_detail(vehicle_in_id, shell_id, quantity, price, amount) VALUES (_vehicle_in_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInReturnShellDetail`(IN _vehicle_in_id INT, IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id
	FROM vehicle_in AS f, employee as eo
	WHERE f.id=_vehicle_in_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO vehicle_in_return_shell_detail(vehicle_in_id, shell_id, quantity) VALUES (_vehicle_in_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleOut` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleOut` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleOut`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vehicle_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO vehicle_out (CODE, created_date, vehicle_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vehicle_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleOutDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleOutDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleOutDetail`(IN _vehicle_out_id INT, IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT sv.organization_id, sv.vendor_id, sv.shell_id INTO _organization_id, _vendor_id, _shell
	FROM shell_vendor AS sv
	WHERE sv.id=_shell_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_gas_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_gas_in_stock AS ss, shell_vendor AS sv
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
			SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
		ELSE
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO vehicle_out_detail(vehicle_out_id, shell_id, quantity, price, amount) 
	VALUES (_vehicle_out_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleOutEmployeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleOutEmployeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleOutEmployeeDetail`(IN _vehicle_out_id INT, IN _employee_id INT, IN _note text)
BEGIN
	INSERT INTO vehicle_out_employee_detail(vehicle_out_id, employee_id, note) 
	VALUES (_vehicle_out_id, _employee_id, _note);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVendor`(in _name varchar(255), IN _address VARCHAR(255), IN _tax VARCHAR(50), IN _phone VARCHAR(50)
	, IN _fax VARCHAR(50), in _code varchar(20), in _organization_id int, in _status int, in _equal_organization_id int, in _has_stock int
	, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, IN _is_transport INT, out _id int)
BEGIN
	declare _vendor_organization_id int default 0;
	Insert Into vendor (`name`, address, tax, phone, fax, `code`, organization_id, `status`, equal_organization_id, has_stock, is_gas, is_petro, is_good, is_transport)
	values (_name, _address, _tax, _phone, _fax, _code, _organization_id, _status, _equal_organization_id, _has_stock, _is_gas, _is_petro, _is_good, _is_transport);
	SELECT LAST_INSERT_ID() INTO _id;
	
	select id into _vendor_organization_id from vendor_organization where vendor_id=_id and organization_id=_organization_id;
	if _vendor_organization_id=0 then
		insert into vendor_organization(vendor_id, organization_id) values(_id, _organization_id);
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVendorCustomer` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVendorCustomer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVendorCustomer`(IN _organization_id INT, IN _vendor_id INT, in _customer_id int, IN _id INT)
BEGIN
	DECLARE _old_id INT DEFAULT 0;
	DELETE FROM vendor_customer WHERE id=_id;
	
	SELECT id INTO _old_id FROM vendor_customer WHERE vendor_id=_vendor_id and customer_id=_customer_id AND organization_id=_organization_id;
	
	IF _old_id=0 THEN
		INSERT INTO vendor_customer(vendor_id, customer_id, organization_id)VALUES(_vendor_id, _customer_id,_organization_id);
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVendorOrganization` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVendorOrganization` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVendorOrganization`(in _organization_id int, in _vendor_id int, in _id int)
BEGIN
	declare _old_id int default 0;
	delete from vendor_organization where id=_id;
	
	SELECT id INTO _old_id FROM vendor_organization WHERE vendor_id=_vendor_id AND organization_id=_organization_id;
	
	IF _old_id=0 THEN
		INSERT INTO vendor_organization(vendor_id, organization_id)VALUES(_vendor_id,_organization_id);
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_cash_book` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_cash_book` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_cash_book`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, OUT _account_opening_stock DOUBLE, OUT _cash_opening_stock DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT mis.`day` INTO _pre_date FROM money_in_stock AS mis WHERE DATEDIFF(_from_date,mis.`day`)=1 LIMIT 1;
	
	SELECT mis.in_stock INTO _account_opening_stock
	FROM money_in_stock AS mis, account AS a
	WHERE DATE(mis.`day`)=_pre_date AND mis.account_id=a.id AND a.is_cash=0 AND _organization_ids LIKE CONCAT('%,',mis.organization_id,',%') LIMIT 1;
	
	SELECT mis.in_stock INTO _cash_opening_stock
	FROM money_in_stock AS mis, account AS a
	WHERE DATE(mis.`day`)=_pre_date AND mis.account_id=a.id AND a.is_cash=1 AND _organization_ids LIKE CONCAT('%,',mis.organization_id,',%') LIMIT 1;
	
	SELECT tbl.created_date, SUM(tbl.account_income_amount) AS account_income_amount, SUM(tbl.account_outcome_amount) AS account_outcome_amount, '' AS account_note
		, SUM(tbl.cash_income_amount) AS cash_income_amount, SUM(tbl.cash_outcome_amount) AS cash_outcome_amount, '' AS cash_note
	FROM 
	(
	-- thu
		SELECT w.created_date, IF(a.is_cash=0,w.paid,0) AS account_income_amount, 0 AS account_outcome_amount, '' AS account_note
			, IF(a.is_cash=1,w.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, '' AS cash_note
		FROM gas_wholesale AS w, account AS a
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT i.created_date, IF(a.is_cash=0,i.amount,0) AS account_income_amount, 0 AS account_outcome_amount, '' AS account_note
			, IF(a.is_cash=1,i.amount,0) AS cash_income_amount, 0 AS cash_outcome_amount, '' AS cash_note
		FROM income AS i, account AS a
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT s.sale_date, IF(a.is_cash=0,s.paid,0) AS account_income_amount, 0 AS account_outcome_amount, '' AS account_note
			, IF(a.is_cash=1,s.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, '' AS cash_note
		FROM lpg_sale AS s, account AS a
		WHERE DATE(s.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND s.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM wholesale_debt AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
	-- chi
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM accessory_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.advance_date AS created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.amount,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.amount,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM employee_advance AS o, account AS a
		WHERE DATE(o.advance_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.advance_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.amount,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.amount,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM employee_off_money AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.amount,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.amount,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM expense AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM gas_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM good_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.import_date AS created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM lpg_import AS o, account AS a
		WHERE DATE(o.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM petro_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM promotion_material_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM retail_debt AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.amount,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.amount,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM shell_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM vendor_debt AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
	) AS tbl
	GROUP BY tbl.created_date ORDER BY tbl.created_date;
END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT
	, OUT _shell_12_debt INT, OUT _shell_45_debt INT, OUT _amount_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.shell_12, cis.shell_45, cis.amount INTO _shell_12_debt, _shell_45_debt, _amount_debt
	FROM customer_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.customer_id=_customer_id LIMIT 1;
	
	SELECT ws.created_date, ws.total_pay, ws.paid, ws.note, ws.gas_return_amount
		, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t, SUM(tbl.shell_return_45) AS shell_return_45
		, SUM(tbl.price_12/tbl.price_12_count) AS price_12, SUM(tbl.price_45/tbl.price_45_count) AS price_45
	FROM gas_wholesale AS ws,
	(
	SELECT w.id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
		, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.price,0)) AS price_12, SUM(IF(shell_12.id IS NOT NULL, 1,0)) AS price_12_count
		, SUM(IF(shell_45.id IS NOT NULL, wdet.price,0)) AS price_45, SUM(IF(shell_45.id IS NOT NULL, 1,0)) AS price_45_count
	FROM gas_wholesale AS w, employee AS eo, gas_wholesale_detail AS wdet, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id AND w.customer_id=_customer_id 
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	UNION ALL
	SELECT w.id, 0 AS quantity_12, 0 AS quantity_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
		, SUM(IF(shell_12t.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12t
		, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
		, 0 AS price_12, 0 AS price_45, 0 AS price_12_count, 0 AS price_45_count
	FROM gas_wholesale AS w, employee AS eo, gas_wholesale_return_shell AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND w.customer_id=_customer_id
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	) AS tbl
	WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND tbl.id=ws.id
	GROUP BY ws.created_date
	UNION ALL
	SELECT wd.created_date, 0 AS total_pay, wd.paid, wd.note
		, 0 AS gas_return_amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS shell_return_12
		, 0 AS shell_return_12t, 0 AS shell_return_45, 0 AS price_12, 0 AS price_45
	FROM wholesale_debt AS wd, employee AS eo
	WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND wd.customer_id=_customer_id
		AND wd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY wd.created_date
	ORDER BY created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_gas` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_gas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_gas`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT
	, OUT _shell12_debt INT, OUT _shell45_debt INT, OUT _amount_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.shell_12, cis.shell_45, cis.amount INTO _shell12_debt, _shell45_debt, _amount_debt
	FROM vendor_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.vendor_id=_vendor_id LIMIT 1;
	
	SELECT tbl.created_date, sum(tbl.paid) as paid
		, SUM(tbl.amount_12) AS amount_12, SUM(tbl.amount_45) AS amount_45
		, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_45) AS shell_return_45
	FROM 
	(
	SELECT w.created_date, w.paid
		, SUM(IF(shell_12.id IS NOT NULL, wdet.amount,0)) AS amount_12, SUM(IF(shell_45.id IS NOT NULL, wdet.amount,0)) AS amount_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
		, 0 AS shell_return_12, 0 AS shell_return_45
	FROM gas_import AS w, employee AS eo, gas_import_detail AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_import_id AND w.vendor_id=_vendor_id 
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	UNION ALL
	SELECT w.created_date, 0 AS paid, 0 AS amount_12, 0 AS amount_45, 0 AS quantity_12, 0 AS quantity_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
		, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
	FROM shell_return_supplier AS w, employee AS eo, shell_return_supplier_detail AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.shell_return_supplier_id AND w.vendor_id=_vendor_id
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	) AS tbl
	GROUP BY tbl.created_date
	ORDER BY tbl.created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_good` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_good` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_good`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT, OUT _opening_stock INT)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.amount INTO _opening_stock
	FROM customer_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.customer_id=_customer_id LIMIT 1;
	
	SELECT w.created_date, g.code as goodCode, g.name as goodName, wdet.quantity, wdet.price, wdet.amount, w.paid
	FROM good_sale AS w, good_sale_detail AS wdet, employee AS eo, good as g
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.good_sale_id AND w.customer_id=_customer_id  and wdet.good_id=g.id
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	order by wdet.id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_lpg` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_lpg` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_lpg`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT, OUT _amount_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.amount INTO _amount_debt
	FROM customer_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.customer_id=_customer_id LIMIT 1;
	
	select * from(
		select ls.sale_date as created_date, '' as content, ls.quantity, ls.price, ls.price_transport, ls.vat, ls.rate, ls.amount, ls.paid, ls.debt, ls.note
		from lpg_sale as ls, employee as eo
		where DATE(ls.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			and ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and ls.customer_id=_customer_id
		union all
		select wd.created_date, '' as content, 0 as quantity, 0 as price, 0 as price_transport, 0 as vat, 0 as rate, 0 as amount, wd.paid, 0 as debt, wd.note
		from wholesale_debt as wd, employee AS eo
		where DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND wd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND wd.customer_id=_customer_id
	) as tbl order by created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_lpg_vendor_customer` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_lpg_vendor_customer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_lpg_vendor_customer`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_customer_id INT, OUT _opening_stock DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	DECLARE _vendor_id, _customer_id INT DEFAULT 0;
	DECLARE _vendor_debt, _customer_debt DOUBLE DEFAULT 0;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT vendor_id, customer_id INTO _vendor_id, _customer_id FROM vendor_customer WHERE id=_vendor_customer_id;
	
	SELECT `day` INTO _pre_date FROM customer_in_stock WHERE DATEDIFF(_from_date,`day`)=1 LIMIT 1;
	
	SELECT amount + transport_amount INTO _customer_debt
	FROM customer_in_stock WHERE DATE(`day`)=_pre_date AND customer_id=_customer_id LIMIT 1;
	
	SELECT amount + transport_amount INTO _vendor_debt
	FROM vendor_in_stock WHERE DATE(`day`)=_pre_date AND vendor_id=_vendor_id LIMIT 1;
	
	SET _opening_stock = _customer_debt + _vendor_debt;
	
	SELECT * FROM(
		SELECT ls.sale_date AS created_date, 'BAN' AS content_code, 'Bán hàng' AS content, ls.quantity AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity
			, ls.price, ls.rate, ls.amount, ls.paid, ls.debt, ls.note, 0 AS link_lpg_quantity
		FROM lpg_sale AS ls, employee AS eo
		WHERE DATE(ls.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ls.kind=1 AND ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND ls.customer_id=_customer_id
		UNION ALL
		SELECT ls.sale_date AS created_date, 'TRA' AS content_code, 'Trả hàng/Cho mượn hàng' AS content, ls.quantity AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity
			, ls.price, ls.rate, 0 AS amount, 0 AS paid, 0 AS debt, ls.note, 0 AS link_lpg_quantity
		FROM lpg_sale AS ls, employee AS eo
		WHERE DATE(ls.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ls.kind<>1 AND ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND ls.customer_id=_customer_id
		UNION ALL
		SELECT ls.import_date AS created_date, 'MUA' AS content_code, 'Mua hàng' AS content, -ls.paper_quantity AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity
			, ls.price, ls.rate, -ls.amount AS amount, -ls.paid AS paid, -ls.debt AS debt, ls.note, 0 AS link_lpg_quantity
		FROM lpg_import AS ls, employee AS eo
		WHERE DATE(ls.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ls.kind=1 AND ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND ls.vendor_id=_vendor_id
		UNION ALL
		SELECT ls.import_date AS created_date, 'MUON' AS content_code, 'Mượn hàng/Nhận trả hàng' AS content, -ls.paper_quantity AS in_quantity, 0 AS out_quantity
			, 0 AS transport_quantity, ls.price, ls.rate, 0 AS amount, 0 AS paid, 0 AS debt, ls.note
			, (SELECT SUM(quantity) FROM lpg_sale WHERE CONCAT(',',ls.link_lpg_ids,',') LIKE CONCAT('%,',id,',%')) AS link_lpg_quantity
		FROM lpg_import AS ls, employee AS eo
		WHERE DATE(ls.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ls.kind<>1 AND ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND ls.vendor_id=_vendor_id
		UNION ALL
		SELECT ls.created_date AS created_date, 'VAN' AS content_code, 'Vận chuyển' AS content, 0 AS in_quantity, 0 AS out_quantity, ls.in_quantity AS transport_quantity
			, ls.price, ls.rate, (ls.vendor_amount + ls.customer_amount) AS amount, ls.paid, ls.debt, ls.note, 0 AS link_lpg_quantity
		FROM transport_service AS ls
		WHERE DATE(ls.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND _organization_ids LIKE CONCAT('%,',ls.money_organization_id,',%') AND (ls.vendor_vendor_id=_vendor_id OR ls.customer_customer_id=_customer_id)
		UNION ALL
		SELECT ls.created_date AS created_date, 'DIEU' AS content_code, 'Điều chỉnh' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity
			, 0 AS price, 0 AS rate, -ls.amount AS amount, 0 AS paid, 0 AS debt, ls.note, 0 AS link_lpg_quantity
		FROM debt_adjustment AS ls, employee AS eo
		WHERE DATE(ls.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND (ls.vendor_id=_vendor_id OR ls.customer_id=_customer_id)
		UNION ALL
		SELECT wd.created_date, 'NO' AS content_code, 'Công nợ' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity, 0 AS price, 0 AS rate
			, 0 AS amount, wd.paid, 0 AS debt, wd.note, 0 AS link_lpg_quantity
		FROM wholesale_debt AS wd, employee AS eo
		WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND wd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND wd.customer_id=_customer_id
		UNION ALL
		SELECT wd.created_date, 'NO' AS content_code, 'Công nợ' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS transport_quantity, 0 AS price, 0 AS rate
			, 0 AS amount, -wd.paid as paid, 0 AS debt, wd.note, 0 AS link_lpg_quantity
		FROM vendor_debt AS wd, employee AS eo
		WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND wd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND wd.vendor_id=_vendor_id
	) AS tbl ORDER BY created_date
	;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_vendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_vendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_vendor`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT, OUT _opening_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	DECLARE _customer_id INT DEFAULT -1;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	SELECT customer_id INTO _customer_id FROM vendor_customer WHERE vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',organization_id,',%') LIMIT 1;
	
	SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT amount + transport_amount INTO _opening_debt FROM vendor_in_stock WHERE DATE(`day`)=_pre_date AND vendor_id=_vendor_id LIMIT 1;
	
	SELECT tbl.* FROM(
		SELECT w.import_date AS created_date, CONCAT('Nhập LPG ', w.CODE) AS content, w.paper_quantity as quantity, w.price, w.rate, w.amount, w.paid
		FROM lpg_import AS w, employee AS eo
		WHERE DATE(w.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.sale_date AS created_date, CONCAT('Bán LPG ', w.CODE) AS content, w.quantity, w.price, w.rate, -w.amount AS amount, -w.paid AS paid
		FROM lpg_sale AS w, employee AS eo
		WHERE DATE(w.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.customer_id=_customer_id
		UNION ALL
		SELECT w.created_date, CONCAT('Nhập gas ', w.CODE) AS content, 0 as quantity, 0 as price, w.rate, w.total AS amount, w.paid
		FROM gas_import AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Nhập xăng ', w.CODE) AS content, 0 AS quantity, 0 AS price, w.rate, w.total AS amount, w.paid
		FROM petro_import AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Nhập hàng hóa ', w.CODE) AS content, 0 AS quantity, 0 AS price, w.rate, w.total AS amount, w.paid
		FROM good_import AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Nhập phụ kiện ', w.CODE) AS content, 0 AS quantity, 0 AS price, 0 as rate, w.total AS amount, w.paid
		FROM accessory_import AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Nhập hàng khuyến mãi ', w.CODE) AS content, 0 AS quantity, 0 AS price, 0 as rate, w.total AS amount, w.paid
		FROM promotion_material_import AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Thanh toán công nợ NCC ', w.CODE) AS content, 0 AS quantity, 0 AS price, 0 as rate, 0 AS amount, w.paid
		FROM vendor_debt AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.vendor_id=_vendor_id
		UNION ALL
		SELECT w.created_date, CONCAT('Thanh toán công nợ KH ', w.CODE) AS content, 0 AS quantity, 0 AS price, 0 AS rate, 0 AS amount, -w.paid AS paid
		FROM wholesale_debt AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND w.customer_id=_customer_id
		UNION ALL
		SELECT w.created_date, CONCAT('Điều chỉnh công nợ ', w.CODE) AS content, 0 AS quantity, 0 AS price, 0 AS rate, w.amount, 0 AS paid
		FROM debt_adjustment AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
			AND (w.vendor_id=_vendor_id OR w.customer_id=_customer_id)
	) AS tbl
	where tbl.amount<>0 or tbl.paid<>0
	ORDER BY tbl.created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_gas_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_gas_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_gas_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, IN _employee_id INT, IN _accessory_kind_id INT, IN _session_id VARCHAR(255), OUT _employee_ids TEXT, OUT _accessory_kind_ids TEXT
	, OUT _commission_12 DOUBLE, OUT _commission_45 DOUBLE, OUT _commission_lovo DOUBLE)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT COALESCE(commission,0) INTO _commission_12 FROM shell_kind WHERE weight=12;
	
	SELECT COALESCE(commission,0) INTO _commission_45 FROM shell_kind WHERE weight=45;
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _commission_lovo FROM parameter WHERE `code`='lovo';
	
	IF _employee_id=0 THEN
		DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
		INSERT INTO temp_gas_commission(session_id, id, created_date, quantity_12, quantity_45, quantity_lovo, accessory_kind_id, quantity_accessory, commission_accessory, employee_ids, employee_count, vehicle_plate, kind)
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, COALESCE(tbl.quantity_12,0) AS quantity_12, COALESCE(tbl.quantity_45,0) AS quantity_45
			, 0 AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count, v.plate, 'out'
		FROM
		(
			SELECT w.vehicle_out_id
				, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12
				, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
			FROM gas_wholesale AS w, gas_wholesale_detail AS wdet, employee AS eo, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id
				AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY w.vehicle_out_id
		) AS tbl
		, vehicle_out_employee_detail AS ve, vehicle_out AS vo, vehicle AS v
		WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id AND vo.vehicle_id=v.id
		GROUP BY tbl.vehicle_out_id
		UNION ALL
		SELECT _session_id, lv.id, lv.created_date, 0 AS quantity_12, 0 AS quantity_45, lv.quantity AS quantity_lovo
			, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
			, GROUP_CONCAT(lve.employee_id) AS employee_ids, COUNT(lve.id) AS employee_count , '' AS plate, 'lovo'
		FROM lo_vo AS lv, lo_vo_employee_detail AS lve, employee AS eo
		WHERE DATE(lv.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(lv.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND lv.id=lve.lo_vo_id AND lv.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY lv.id
		UNION ALL
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
			, tbl.kind_id, tbl.quantity_accessory, tbl.commission AS commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count, v.plate, 'acc'
		FROM
		(
			SELECT v.vehicle_out_id, SUM(vadet.quantity) AS quantity_accessory, a.kind_id, ak.commission
			FROM vehicle_in AS v, vehicle_in_accessory_detail AS vadet, employee AS eo, accessory AS a, accessory_kind AS ak
			WHERE DATE(v.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(v.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND v.id=vadet.vehicle_in_id AND vadet.accessory_id=a.id AND a.kind_id=ak.id
				AND v.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY v.id, a.kind_id
		) AS tbl
		, vehicle_out_employee_detail AS ve, vehicle_out AS vo, vehicle AS v
		WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id AND vo.vehicle_id=v.id
		GROUP BY tbl.vehicle_out_id, tbl.kind_id
		;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT employee_ids),'') INTO _employee_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT accessory_kind_id),'') INTO _accessory_kind_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT created_date, vehicle_plate, 0 AS employee_id, SUM(quantity_12) AS quantity_12, SUM(quantity_45) AS quantity_45
			, SUM(quantity_lovo) AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory, 0 AS amount
		FROM temp_gas_commission
		WHERE session_id=_session_id 
		GROUP BY id ORDER BY created_date, id;
	ELSE
		IF _accessory_kind_id=0 THEN
			SELECT tbl.created_date, t.vehicle_plate, _employee_id AS employee_id, 0 AS quantity_12, 0 AS quantity_45
				, 0 AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
				, SUM((t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory)/t.employee_count) AS amount
			FROM (SELECT id, kind, created_date, session_id, accessory_kind_id FROM temp_gas_commission WHERE session_id=_session_id) AS tbl
			LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.id=tbl.id AND t.kind=tbl.kind AND t.accessory_kind_id=tbl.accessory_kind_id
			AND CONCAT("0,",t.employee_ids,",0") LIKE CONCAT('%,',_employee_id,',%')
			GROUP BY tbl.id ORDER BY tbl.created_date, tbl.id
			;
		ELSE
			SELECT tbl.created_date, t.vehicle_plate, 0 AS employee_id, 0 AS quantity_12, 0 AS quantity_45
				, 0 AS quantity_lovo, _accessory_kind_id AS accessory_kind_id, SUM(t.quantity_accessory) AS quantity_accessory, 0 AS commission_accessory
				, (t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory)/t.employee_count AS amount
			FROM (SELECT id, kind, created_date, session_id, accessory_kind_id FROM temp_gas_commission WHERE session_id=_session_id) AS tbl
			LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.id=tbl.id AND t.kind=tbl.kind AND t.accessory_kind_id=tbl.accessory_kind_id
			AND t.accessory_kind_id=_accessory_kind_id
			GROUP BY tbl.id ORDER BY tbl.created_date, tbl.id
			;
		END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_gas_employee_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_gas_employee_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_gas_employee_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, IN _session_id VARCHAR(255))
BEGIN
	DECLARE _from_date DATE;
	declare _commission_12, _commission_45, _commission_lovo double;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	select coalesce(commission,0) into _commission_12 from shell_kind where weight=12;
	
	SELECT COALESCE(commission,0) INTO _commission_45 FROM shell_kind WHERE weight=45;
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _commission_lovo FROM parameter WHERE `code`='lovo';
	
	DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
	INSERT INTO temp_gas_commission(session_id, id, created_date, quantity_12, quantity_45, quantity_lovo, accessory_kind_id, quantity_accessory, commission_accessory, employee_ids, employee_count)
	SELECT _session_id, tbl.vehicle_out_id, vo.created_date, COALESCE(tbl.quantity_12,0) AS quantity_12, COALESCE(tbl.quantity_45,0) AS quantity_45
		, 0 AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
		, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count 
	FROM
	(
		SELECT w.vehicle_out_id
			, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12
			, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
		FROM gas_wholesale AS w, gas_wholesale_detail AS wdet, employee AS eo, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id
			AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY w.vehicle_out_id
	) AS tbl
	, vehicle_out_employee_detail AS ve, vehicle_out AS vo
	WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id
	GROUP BY tbl.vehicle_out_id
	UNION ALL
	SELECT _session_id, lv.id, lv.created_date, 0 AS quantity_12, 0 AS quantity_45, lv.quantity AS quantity_lovo
		, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
		, GROUP_CONCAT(lve.employee_id) AS employee_ids, COUNT(lve.id) AS employee_count 
	FROM lo_vo AS lv, lo_vo_employee_detail AS lve, employee AS eo
	WHERE DATE(lv.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(lv.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND lv.id=lve.lo_vo_id AND lv.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY lv.id
	UNION ALL
	SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
		, tbl.kind_id, tbl.quantity_accessory, tbl.commission AS commission_accessory
		, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count 
	FROM
	(
		SELECT v.vehicle_out_id, SUM(vadet.quantity) AS quantity_accessory, a.kind_id, ak.commission
		FROM vehicle_in AS v, vehicle_in_accessory_detail AS vadet, employee AS eo, accessory AS a, accessory_kind AS ak
		WHERE DATE(v.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(v.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND v.id=vadet.vehicle_in_id AND vadet.accessory_id=a.id AND a.kind_id=ak.id
			AND v.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY v.id, a.kind_id
	) AS tbl
	, vehicle_out_employee_detail AS ve, vehicle_out AS vo
	WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id
	GROUP BY tbl.vehicle_out_id, tbl.kind_id
	;
	
		
	SELECT tbl_employee.id, tbl_employee.fullname as employee_name, SUM((t.quantity_12*_commission_12 + t.quantity_45*_commission_45 
		+ t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory)/t.employee_count) AS amount
	FROM (SELECT id, fullname FROM employee WHERE STATUS=1) AS tbl_employee
	LEFT JOIN temp_gas_commission AS t ON t.session_id=_session_id AND CONCAT("0,",t.employee_ids,",0") LIKE CONCAT('%,',tbl_employee.id,',%')
	GROUP BY tbl_employee.id
	HAVING amount>0
	;
	
	DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_lpg_import` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_lpg_import` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_import`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	select i.id as import_id, i.import_date, v.name as vendor_name, i.paper_quantity, i.actual_quantity, i.price, i.rate, i.amount, i.paid, i.note
	from lpg_import as i , vendor as v, employee AS e
	where DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.vendor_id=v.id AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') and v.status=1
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_lpg_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_lpg_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_sale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.sale_date, c.code as customer_code, c.NAME AS customer_name, s.quantity, s.price, s.price_transport, s.vat, s.rate, s.amount, s.paid, concat(a.number,' - ',a.bank) AS account
	FROM lpg_sale AS s, customer AS c, employee as eo, account as a
	WHERE DATE(s.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.customer_id=c.id AND s.created_employee_id=eo.id and _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND c.STATUS=1
		and s.account_id=a.id
	ORDER BY sale_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_lpg_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_lpg_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_stock`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT, OUT _gas_stock INT)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT COALESCE(SUM(ls.in_stock),0) INTO _gas_stock
	FROM lpg_in_stock AS ls
	WHERE DATEDIFF(_from_date,ls.`day`)=1 AND _organization_ids LIKE CONCAT('%,',organization_id,',%');
	
	SELECT created_date AS content, created_date, SUM(lpg_import) AS import_quantity, SUM(export_12_quantity) AS export_12_quantity
		, SUM(export_45_quantity) AS export_45_quantity, SUM(return_quantity) AS return_quantity, SUM(lpg_sale) AS export_quantity, '' AS note
	FROM
	(
	SELECT s.import_date AS created_date, SUM(s.actual_quantity) AS lpg_import, 0 AS export_12_quantity, 0 AS export_45_quantity, 0 return_quantity, 0 AS lpg_sale
	FROM lpg_import AS s, employee AS e
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	GROUP BY s.import_date
	UNION ALL
	SELECT s.sale_date AS created_date, 0 AS lpg_import, 0 AS export_12_quantity, 0 AS export_45_quantity, 0 return_quantity, SUM(s.quantity) AS lpg_sale
	FROM lpg_sale AS s, employee AS e
	WHERE DATE(s.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	GROUP BY s.sale_date
	UNION ALL
	SELECT pdet.created_date, 0 AS lpg_import, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS export_12_quantity
		, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS export_45_quantity, 0 return_quantity, 0 AS lpg_sale
	FROM fraction_gas AS pdet, fraction_gas_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND pdet.id=det.fraction_id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, det.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS lpg_import,  0 AS export_12_quantity, 0 AS export_45_quantity, SUM(pdet.gas_return) return_quantity, 0 AS lpg_sale
	FROM gas_wholesale AS pdet, employee AS eo, gas_return_vendor AS v
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND pdet.created_employee_id=eo.id AND eo.organization_id=v.organization_id
		AND _vendor_ids LIKE CONCAT('%,',v.vendor_id,',%')
	GROUP BY pdet.created_date
	)
	AS tbl
	WHERE created_date IS NOT NULL
	GROUP BY created_date
	ORDER BY created_date;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_lpg_stock_sum` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_lpg_stock_sum` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_stock_sum`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), in _organization_ids text
	, IN _vendor_ids TEXT, OUT _gas_12_stock int, OUT _gas_45_stock int, OUT _gas_stock int, out _final_stock int)
BEGIN
	declare _from_date date;
	
	select STR_TO_DATE(_start_date,'%d/%m/%Y') into _from_date;
	
	SELECT SUM(IF(shell_12.id IS NOT NULL, ss.in_stock,0)), SUM(IF(shell_45.id IS NOT NULL, ss.in_stock,0)) INTO _gas_12_stock, _gas_45_stock 
	FROM shell_gas_in_stock AS ss, shell_vendor as sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE ss.shell_vendor_id=sv.id and DATEDIFF(_from_date,ss.`day`)=1 
		and _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%') AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%');
	
	SELECT coalesce(sum(ls.in_stock),0) INTO _gas_stock
	from lpg_in_stock as ls
	where DATEDIFF(_from_date,ls.`day`)=1 AND _vendor_ids LIKE CONCAT('%,',ls.vendor_id,',%') AND _organization_ids LIKE CONCAT('%,',ls.organization_id,',%');
	
	select coalesce(sum(in_stock),0) into _final_stock
	FROM shield_in_stock as ss
	WHERE DATEDIFF(_from_date,`day`)=1 AND _vendor_ids LIKE CONCAT('%,',ss.vendor_id,',%') AND _organization_ids LIKE CONCAT('%,',ss.organization_id,',%');
	
	SELECT created_date AS content, created_date, SUM(fraction_12) AS fraction_12, SUM(fraction_45) AS fraction_45
		, SUM(vehicle_out_12) AS vehicle_out_12, SUM(vehicle_out_45) AS vehicle_out_45
		, SUM(vehicle_in_12) AS vehicle_in_12, SUM(vehicle_in_45) AS vehicle_in_45
		, SUM(sale_12) AS sale_12, SUM(sale_45) AS sale_45
		, SUM(shield_import) AS shield_import, SUM(shield_decrease) AS shield_decrease, sum(import_quantity) as import_quantity
	FROM
	(
	SELECT pdet.created_date, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS fraction_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM fraction_gas AS pdet, fraction_gas_detail AS det, shell_vendor as sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and pdet.id=det.fraction_id and det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_out_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM vehicle_out AS pdet, vehicle_out_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and det.vehicle_out_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_in_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM vehicle_in AS pdet, vehicle_in_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.vehicle_in_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	-- #########
	UNION ALL
	SELECT s.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, SUM(s.quantity) AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM shield_import AS s, employee as eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
		and s.created_employee_id=eo.id and _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.created_date, s.vendor_id
	UNION ALL
	SELECT s.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, SUM(s.quantity) AS shield_decrease, 0 AS import_quantity
	FROM shield_decrease AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
		and s.created_employee_id=eo.id and _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.created_date, s.vendor_id
	UNION ALL
	SELECT s.import_date as created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, sum(s.actual_quantity) AS import_quantity
	FROM lpg_import AS s, employee AS eo
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.import_date
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM inner_sale AS pdet, inner_sale_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.inner_sale_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	)
	AS tbl
	WHERE created_date IS NOT NULL
	GROUP BY created_date
	ORDER BY created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_lpg_stock_sum_organization` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_lpg_stock_sum_organization` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_stock_sum_organization`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, IN _vendor_id int, OUT _gas_12_stock INT, OUT _gas_45_stock INT, OUT _gas_stock INT, OUT _final_stock INT)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT SUM(IF(shell_12.id IS NOT NULL, ss.in_stock,0)), SUM(IF(shell_45.id IS NOT NULL, ss.in_stock,0)) INTO _gas_12_stock, _gas_45_stock 
	FROM shell_gas_in_stock AS ss, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE ss.shell_vendor_id=sv.id AND DATEDIFF(_from_date,ss.`day`)=1 AND sv.vendor_id=_vendor_id  AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%');
	
	SELECT COALESCE(ls.in_stock,0) INTO _gas_stock
	FROM lpg_in_stock AS ls
	WHERE DATEDIFF(_from_date,ls.`day`)=1 AND ls.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',ls.organization_id,',%');
	
	SELECT COALESCE(in_stock) INTO _final_stock
	FROM shield_in_stock AS ss
	WHERE DATEDIFF(_from_date,`day`)=1 AND ss.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',ss.organization_id,',%');
	
	SELECT created_date AS content, created_date, SUM(fraction_12) AS fraction_12, SUM(fraction_45) AS fraction_45
		, SUM(vehicle_out_12) AS vehicle_out_12, SUM(vehicle_out_45) AS vehicle_out_45
		, SUM(vehicle_in_12) AS vehicle_in_12, SUM(vehicle_in_45) AS vehicle_in_45
		, SUM(sale_12) AS sale_12, SUM(sale_45) AS sale_45
		, SUM(shield_import) AS shield_import, SUM(shield_decrease) AS shield_decrease, SUM(import_quantity) AS import_quantity
	FROM
	(
	SELECT pdet.created_date, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS fraction_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM fraction_gas AS pdet, fraction_gas_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND pdet.id=det.fraction_id AND det.shell_id=sv.id and sv.vendor_id=_vendor_id
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_out_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM vehicle_out AS pdet, vehicle_out_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.vehicle_out_id=pdet.id AND det.shell_id=sv.id and sv.vendor_id=_vendor_id
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_in_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM vehicle_in AS pdet, vehicle_in_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.vehicle_in_id=pdet.id AND det.shell_id=sv.id AND sv.vendor_id=_vendor_id
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	-- #########
	UNION ALL
	SELECT s.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, SUM(s.quantity) AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM shield_import AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.vendor_id=_vendor_id
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.created_date, s.vendor_id
	UNION ALL
	SELECT s.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, SUM(s.quantity) AS shield_decrease, 0 AS import_quantity
	FROM shield_decrease AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.vendor_id=_vendor_id
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.created_date, s.vendor_id
	UNION ALL
	SELECT s.import_date AS created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS sale_12, 0 AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, SUM(s.actual_quantity) AS import_quantity
	FROM lpg_import AS s, employee AS eo
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.vendor_id=_vendor_id
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.import_date
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
		, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
	FROM inner_sale AS pdet, inner_sale_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.inner_sale_id=pdet.id AND det.shell_id=sv.id AND sv.vendor_id=_vendor_id
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, sv.shell_id
	)
	AS tbl
	WHERE created_date IS NOT NULL
	GROUP BY created_date
	ORDER BY created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_petro_import` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_petro_import` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_petro_import`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT i.created_date, v.NAME AS vendor_name, p.name as petroName, s.name as storeName, idet.quantity, idet.price, idet.amount, i.paid, i.note
	FROM petro_import AS i, petro_import_detail as idet, petro as p, vendor AS v, employee AS e, store as s
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') AND v.STATUS=1
		and i.id=idet.petro_import_id and idet.petro_id=p.id and i.store_id=s.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_petro_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_petro_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_petro_sale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT p.created_date, c.CODE AS customerCode, c.NAME AS customerName, s.NAME AS storeName, pe.code AS petroCode, pdet.quantity, pdet.price, pdet.amount, p.paid, a.number AS account
	FROM petro_sale AS p, petro_sale_detail AS pdet, customer AS c, store AS s, petro AS pe, account AS a, employee as eo
	WHERE DATE(p.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(p.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND p.id=pdet.petro_sale_id AND p.customer_id=c.id AND p.store_id=s.id  AND pdet.petro_id=pe.id AND p.account_id=a.id
		AND c.STATUS=1 AND s.STATUS=1 AND pe.STATUS=1 and p.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_petro_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_petro_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_petro_stock`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _petro_id int
	, in _session_id varchar(255), out _petro_ids text)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	if _petro_id=0 then
		delete from temp_petro_stock where session_id=_session_id;
	
		insert into temp_petro_stock(session_id, created_date, petro_id, opening_stock, import_quantity, export_quantity)
		select _session_id, tbl.created_date, tbl.petro_id, coalesce(sum(opening_stock),0), sum(import_quantity), sum(export_quantity) from
		(
			select i.created_date, idet.petro_id, sum(idet.quantity) as import_quantity, 0 as export_quantity
			from petro_import as i, petro_import_detail as idet, employee as eo, petro as p
			where DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and i.id=idet.petro_import_id and i.created_employee_id=eo.id and idet.petro_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			group by i.created_date, idet.petro_id
			union all
			SELECT i.created_date, idet.petro_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
			FROM petro_sale AS i, petro_sale_detail AS idet, employee AS eo, petro AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_sale_id AND i.created_employee_id=eo.id AND idet.petro_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY i.created_date, idet.petro_id
		) as tbl
		left join
		(
			SELECT ps.`day` AS created_date, ps.petro_id, COALESCE(SUM(ps.in_stock),0) AS opening_stock
			FROM petro_in_stock AS ps
			WHERE DATEDIFF(_from_date,ps.`day`)=1 AND _organization_ids LIKE CONCAT('%,',ps.organization_id,',%')
			GROUP BY ps.`day`, ps.petro_id
		) as opening_tbl on tbl.petro_id=opening_tbl.petro_id
		group by tbl.created_date, tbl.petro_id;
	
		select COALESCE(GROUP_CONCAT(petro_id),'') into _petro_ids from temp_petro_stock where session_id=_session_id;
	
		select created_date, 0 as petro_id, 0 as opening_stock, 0 as import_quantity, 0 as export_quantity 
		from temp_petro_stock 
		where session_id=_session_id 
		group by created_date ORDER BY created_date;
	else
		SELECT tbl.created_date, t.petro_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (select created_date, session_id from temp_petro_stock where session_id=_session_id group by created_date) as tbl
		left join temp_petro_stock as t on t.session_id=tbl.session_id and t.created_date=tbl.created_date and t.petro_id=_petro_id
		ORDER BY tbl.created_date;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_petro_stock_store` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_petro_stock_store` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_petro_stock_store`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _store_id int
	, IN _petro_id INT, IN _session_id VARCHAR(255), OUT _petro_ids TEXT)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	IF _petro_id=0 THEN
		DELETE FROM temp_petro_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_petro_stock(session_id, created_date, petro_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.petro_id, COALESCE(SUM(opening_stock),0), SUM(import_quantity), SUM(export_quantity) FROM
		(
			SELECT i.created_date, idet.petro_id, SUM(idet.quantity) AS import_quantity, 0 AS export_quantity
			FROM petro_import AS i, petro_import_detail AS idet, employee AS eo, petro AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_import_id AND i.created_employee_id=eo.id AND idet.petro_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and i.store_id=_store_id
			GROUP BY i.created_date, idet.petro_id
			UNION ALL
			SELECT i.created_date, idet.petro_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
			FROM petro_sale AS i, petro_sale_detail AS idet, employee AS eo, petro AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_sale_id AND i.created_employee_id=eo.id AND i.store_id=_store_id AND idet.petro_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY i.created_date, idet.petro_id
		) AS tbl
		LEFT JOIN
		(
			SELECT ps.`day` AS created_date, ps.petro_id, COALESCE(SUM(ps.in_stock),0) AS opening_stock
			FROM petro_in_stock AS ps
			WHERE DATEDIFF(_from_date,ps.`day`)=1 AND _organization_ids LIKE CONCAT('%,',ps.organization_id,',%') AND ps.store_id=_store_id
			GROUP BY ps.`day`, ps.petro_id
		) AS opening_tbl ON tbl.petro_id=opening_tbl.petro_id
		GROUP BY tbl.created_date, tbl.petro_id;
	
		SELECT COALESCE(GROUP_CONCAT(petro_id),'') INTO _petro_ids FROM temp_petro_stock WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS petro_id, 0 AS opening_stock, 0 AS import_quantity, 0 AS export_quantity 
		FROM temp_petro_stock 
		WHERE session_id=_session_id 
		GROUP BY created_date ORDER BY created_date;
	ELSE
		SELECT tbl.created_date, t.petro_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (SELECT created_date, session_id FROM temp_petro_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_petro_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.petro_id=_petro_id
		ORDER BY tbl.created_date;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_sale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT)
BEGIN
	SELECT ws.created_date, c.code as customer_code, c.name as customer_name, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t
		, SUM(tbl.shell_return_45) AS shell_return_45, sum(tbl.price_12/tbl.price_12_count) AS price_12, sum(tbl.price_45/tbl.price_45_count) AS price_45
		, ws.paid, a.number as account, ws.note
	FROM gas_wholesale AS ws,
	(
	SELECT w.id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) as quantity_45
		, 0 as shell_return_12, 0 as shell_return_12t, 0 as shell_return_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.price,0)) AS price_12, SUM(IF(shell_12.id IS NOT NULL, 1,0)) AS price_12_count
		, SUM(IF(shell_45.id IS NOT NULL, wdet.price,0)) AS price_45, SUM(IF(shell_45.id IS NOT NULL, 1,0)) AS price_45_count
	FROM gas_wholesale AS w, gas_wholesale_detail as wdet, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
	GROUP BY w.id
	UNION ALL
	SELECT w.id, 0 AS quantity_12, 0 AS quantity_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
		, SUM(IF(shell_12t.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12t
		, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
		, 0 AS price_12, 0 AS price_45, 0 as price_12_count, 0 as price_45_count
	FROM gas_wholesale AS w, gas_wholesale_return_shell AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk, organization_shell AS os WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id=os.shell_id AND _organization_ids LIKE CONCAT('%,',os.organization_id,',%') ) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id 
	GROUP BY w.id
	) AS tbl, customer as c, account as a
	WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and tbl.id=ws.id AND ws.customer_id=c.id AND _organization_ids LIKE CONCAT('%,',c.organization_id,',%') AND ws.account_id=a.id
	group by ws.id
	ORDER BY ws.created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_sale_customer` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_sale_customer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_sale_customer`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT c.CODE AS customer_code, c.NAME AS customer_name, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl_return12.shell_return_12) AS shell_return_12, SUM(tbl_return45.shell_return_45) AS shell_return_45
		, SUM(tbl.total) AS amount, SUM(tbl.debt) AS debt
		, tbl_debt.shell_12 AS opening_debt_12, tbl_debt.shell_45 AS opening_debt_45, tbl_debt.amount AS opening_debt
	FROM customer AS c 
	LEFT JOIN
	(
	SELECT w.id, w.customer_id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
	, w.total, w.debt
	FROM gas_wholesale AS w, gas_wholesale_detail AS wdet
	LEFT JOIN shell_vendor AS sv ON wdet.shell_id=sv.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	LEFT JOIN gas_wholesale_return_shell AS return_shell_12 ON return_shell_12.gas_wholesale_id=wdet.gas_wholesale_id AND return_shell_12.shell_id=shell_12.id
	LEFT JOIN gas_wholesale_return_shell AS return_shell_45 ON return_shell_45.gas_wholesale_id=wdet.gas_wholesale_id AND return_shell_45.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
	GROUP BY w.id
	) AS tbl ON c.id=tbl.customer_id
	LEFT JOIN
	(
	SELECT customer_id, shell_12, shell_45, amount FROM customer_in_stock WHERE DATE(`day`)=_pre_date 
	) AS tbl_debt ON tbl_debt.customer_id=c.id
	LEFT JOIN
	(
	SELECT w.id, SUM(IF(shell_12.id IS NOT NULL, return_shell_12.quantity,0)) AS shell_return_12
	FROM gas_wholesale AS w
	LEFT JOIN gas_wholesale_return_shell AS return_shell_12 ON return_shell_12.gas_wholesale_id=w.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON return_shell_12.shell_id=shell_12.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	GROUP BY w.id
	) AS tbl_return12 ON tbl_return12.id=tbl.id
	LEFT JOIN
	(
	SELECT w.id, SUM(IF(shell_45.id IS NOT NULL, return_shell_45.quantity,0)) AS shell_return_45
	FROM gas_wholesale AS w
	LEFT JOIN gas_wholesale_return_shell AS return_shell_45 ON return_shell_45.gas_wholesale_id=w.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON return_shell_45.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	GROUP BY w.id
	) AS tbl_return45 ON tbl_return45.id=tbl.id
	WHERE  _organization_ids LIKE CONCAT('%,',c.organization_id,',%') AND c.STATUS=1
	GROUP BY c.id
	ORDER BY c.NAME;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_shell` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_shell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_shell`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	SELECT cis.`day` INTO _pre_date FROM shell_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	select shell_tbl.shell_vendor_id, shell_tbl.shell_name, opening_stock_tbl.in_stock as opening_stock, operation_tbl.created_date, operation_tbl.quantity
		, change_tbl.created_date as change_created_date, change_tbl.quantity as change_quantity
	from
	(
		select sv.id as shell_vendor_id, s.name as shell_name
		from shell_vendor as sv, shell as s, vendor as v
		where sv.shell_id=s.id and s.status=1 and sv.vendor_id=v.id and v.status=1 and _organization_ids LIKE CONCAT('%,',v.organization_id,',%')
	) as shell_tbl
	left join
	(
		select shell_vendor_id, sum(in_stock) as in_stock from
		(
			select gs.shell_vendor_id, gs.in_stock
			from shell_gas_in_stock as gs
			where DATE(gs.`day`)=_pre_date
			union all
			SELECT sv.id as shell_vendor_id, gs.in_stock
			FROM shell_in_stock AS gs, shell_vendor as sv
			WHERE DATE(gs.`day`)=_pre_date and gs.organization_id=sv.organization_id and gs.shell_id=sv.shell_id
		) as tbl group by shell_vendor_id
	) as opening_stock_tbl on shell_tbl.shell_vendor_id=opening_stock_tbl.shell_vendor_id
	left join
	(
		select shell_vendor_id, created_date, sum(quantity) as quantity from
		(
			SELECT f_det.shell_id as shell_vendor_id, f.created_date, SUM(f_det.quantity) AS quantity
			FROM fraction_gas_detail AS f_det, fraction_gas AS f
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.fraction_id=f.id
			GROUP BY f_det.shell_id, f.created_date
			UNION ALL
			SELECT f_det.shell_id as shell_vendor_id, f.created_date, SUM(f_det.quantity) AS quantity
			FROM gas_import_detail AS f_det, gas_import AS f
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and f_det.gas_import_id=f.id 
			GROUP BY f_det.shell_id, f.created_date
			UNION ALL
			SELECT i_det.shell_id as shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM gas_wholesale_detail AS i_det, gas_wholesale AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and i_det.gas_wholesale_id=i.id 
			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT i_det.shell_id as shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM vehicle_out_detail AS i_det, vehicle_out AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.vehicle_out_id=i.id
			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT i_det.shell_id as shell_vendor_id, i.created_date, SUM(i_det.quantity) AS quantity
			FROM vehicle_in_detail AS i_det, vehicle_in AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.vehicle_in_id=i.id
			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT f_det.shell_id as shell_vendor_id, f.created_date, -SUM(f_det.quantity) AS quantity
			FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.gas_export_wholesale_id=f.id
			GROUP BY f_det.shell_id, f.created_date
			UNION ALL
			SELECT i_det.shell_id as shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM inner_sale_detail AS i_det, inner_sale AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.inner_sale_id=i.id
			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, i.created_date, SUM(i_det.quantity) AS quantity
			FROM gas_wholesale_return_shell AS i_det, gas_wholesale AS i, employee AS eo, shell_vendor AS sv
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and i_det.gas_wholesale_id=i.id AND i.created_employee_id=eo.id and i_det.shell_id=sv.shell_id and eo.organization_id=sv.organization_id
			GROUP BY sv.id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, f.created_date,  SUM(f_det.quantity) AS quantity
			FROM vehicle_in_return_shell_detail AS f_det, vehicle_in AS f, employee AS eo, shell_vendor AS sv
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and f_det.vehicle_in_id=f.id AND f.created_employee_id=eo.id AND f_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, f.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, f.created_date,  SUM(f_det.quantity) AS quantity
			FROM gas_export_wholesale_shell_detail AS f_det, gas_export_wholesale AS f, employee AS eo, shell_vendor AS sv
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and f_det.gas_export_wholesale_id=f.id AND f.created_employee_id=eo.id AND f_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, f.created_date
		) as tbl group by shell_vendor_id, created_date
	) as operation_tbl on shell_tbl.shell_vendor_id=operation_tbl.shell_vendor_id
	LEFT JOIN
	(
		SELECT shell_vendor_id, created_date, SUM(quantity) AS quantity FROM
		(
			SELECT sv.id AS shell_vendor_id, i.created_date, COALESCE(SUM(i.quantity),0) AS quantity
			FROM shell_import AS i, employee AS eo, shell_vendor AS sv
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.created_employee_id=eo.id AND i.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM shell_sale_detail AS i_det, shell_sale AS i, employee AS eo, shell_vendor AS sv
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.shell_sale_id=i.id AND i.created_employee_id=eo.id AND i_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, i.created_date, SUM(i.quantity) AS quantity
			FROM old_shell AS i, employee AS eo, shell_vendor AS sv
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.created_employee_id=eo.id AND i.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, f.created_date, SUM(f_det.quantity) AS quantity
			FROM shell_return_detail AS f_det, shell_return AS f, shell_vendor AS sv
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.shell_return_id=f.id AND f_det.shell_id=sv.id
			GROUP BY sv.id, f.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, f.created_date, -SUM(f_det.quantity) AS quantity
			FROM shell_return_supplier_detail AS f_det, shell_return_supplier AS f, shell_vendor AS sv
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.shell_return_supplier_id=f.id AND f_det.shell_id=sv.id
			GROUP BY sv.id, f.created_date
		) AS tbl GROUP BY shell_vendor_id, created_date
	) AS change_tbl ON shell_tbl.shell_vendor_id=change_tbl.shell_vendor_id
	order by shell_tbl.shell_vendor_id, operation_tbl.created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_sum` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_sum` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_sum`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT
	, OUT _gas_12_stock int, OUT _gas_45_stock int)
BEGIN
	declare _from_date date;
	
	select STR_TO_DATE(_start_date,'%d/%m/%Y') into _from_date;
	
	SELECT SUM(IF(shell_12.id IS NOT NULL, ss.in_stock,0)), SUM(IF(shell_45.id IS NOT NULL, ss.in_stock,0)) INTO _gas_12_stock, _gas_45_stock 
	FROM shell_gas_in_stock AS ss, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE ss.shell_vendor_id=sv.id AND DATEDIFF(_from_date,ss.`day`)=1 
		and _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%') AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%');
	
	SELECT created_date AS content, created_date, SUM(fraction_12) AS fraction_12, SUM(fraction_45) AS fraction_45
		, SUM(vehicle_out_12) AS vehicle_out_12, SUM(vehicle_out_45) AS vehicle_out_45
		, SUM(vehicle_in_12) AS vehicle_in_12, SUM(vehicle_in_45) AS vehicle_in_45
		, SUM(shell_12_return) AS shell_12_return, SUM(shell_45_return) AS shell_45_return
	FROM
	(
	SELECT pdet.created_date, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS fraction_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS shell_12_return, 0 AS shell_45_return
	FROM fraction_gas AS pdet, fraction_gas_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and pdet.id=det.fraction_id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')	
	GROUP BY pdet.created_date, det.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_out_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, 0 AS shell_12_return, 0 AS shell_45_return
	FROM vehicle_out AS pdet, vehicle_out_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.vehicle_out_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, det.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS vehicle_in_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS vehicle_in_45
		, 0 AS shell_12_return, 0 AS shell_45_return
	FROM vehicle_in AS pdet, vehicle_in_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.vehicle_in_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, det.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS shell_12_return, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS shell_45_return
	FROM gas_wholesale AS pdet, employee AS eo, gas_wholesale_return_shell AS det
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON det.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON det.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND det.gas_wholesale_id=pdet.id and pdet.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY pdet.created_date, det.shell_id
	)
	AS tbl
	WHERE created_date IS NOT NULL
	GROUP BY created_date
	ORDER BY created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_transport_fee` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_transport_fee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_transport_fee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, out _p100_km float, out _p1000_kg float)
BEGIN
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _p100_km FROM parameter WHERE `code`='100km';
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _p1000_kg FROM parameter WHERE `code`='1000kggas';
	
	select i.import_date as created_date, r.name as route_name, r.distance, i.paper_quantity, i.actual_quantity, i.price, i.note, '' as store_name
	from lpg_import as i, route as r, employee as eo
	where DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.route_id=r.id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	union all
	select i.sale_date as create_date, r.name as route_name, r.distance, i.quantity as papre_quantity, i.quantity as actual_quantity, i.price, i.note, '' AS store_name
	from lpg_sale as i, route as r, employee AS eo
	where DATE(i.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.route_id=r.id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_transport_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_transport_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_transport_sale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _vendor_ids text)
BEGIN
	SELECT vo.id, vo.created_date, v.plate, vehicle_out_employee_tbl.employee_names
		, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t
		, SUM(tbl.shell_return_45) AS shell_return_45, gas_wholesale_tbl.total, gas_wholesale_tbl.paid
	FROM vehicle AS v, vehicle_out AS vo, employee AS eo,
	(
		SELECT vehicle_out_id, SUM(quantity_12) AS quantity_12, SUM(quantity_45) AS quantity_45
			, SUM(shell_return_12) AS shell_return_12, SUM(shell_return_12t) AS shell_return_12t, SUM(shell_return_45) AS shell_return_45 
		FROM(
			SELECT w.vehicle_out_id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12
				, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45, 0 AS shell_return_12, 0 AS shell_return_12t
				, 0 AS shell_return_45
			FROM gas_wholesale AS w, gas_wholesale_detail AS wdet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%') AND w.vehicle_out_id<>0
			GROUP BY w.vehicle_out_id
			UNION ALL
			SELECT w.vehicle_out_id, 0 AS quantity_12, 0 AS quantity_45
				, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
				, SUM(IF(shell_12t.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12t
				, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
			FROM gas_wholesale AS w, gas_wholesale_return_shell AS wdet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk, organization_shell AS os WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id=os.shell_id AND _organization_ids LIKE CONCAT('%,',os.organization_id,',%') ) AS shell_12 ON wdet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
			WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND w.id=wdet.gas_wholesale_id AND w.vehicle_out_id<>0
			GROUP BY w.vehicle_out_id
		) AS tbl GROUP BY vehicle_out_id ) AS tbl,
		(
			select tbl.vehicle_out_id, sum(tbl.total) as total, sum(tbl.paid) as paid from(
				SELECT vehicle_out_id, SUM(total) AS total, SUM(paid) AS paid FROM gas_wholesale
				WHERE DATE(created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
					AND vehicle_out_id<>0
				GROUP BY vehicle_out_id
				UNION ALL
				SELECT gw.vehicle_out_id, 0 AS total, SUM(wd.paid) AS paid FROM wholesale_debt AS wd, gas_wholesale AS gw
				WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
					and wd.gas_wholesale_id=gw.id AND gw.vehicle_out_id<>0
				GROUP BY gw.vehicle_out_id
			) as tbl group by tbl.vehicle_out_id 
	) AS gas_wholesale_tbl,
	(
		SELECT vo.id, GROUP_CONCAT(voede.fullname) AS employee_names
		FROM vehicle_out AS vo, vehicle_out_employee_detail AS voed, employee AS voede
		WHERE DATE(vo.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(vo.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND voed.vehicle_out_id=vo.id AND voed.employee_id=voede.id
		GROUP BY vo.id
	) AS vehicle_out_employee_tbl
	WHERE DATE(vo.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(vo.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND vo.vehicle_id=v.id
		AND tbl.vehicle_out_id=vo.id AND vo.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		and tbl.vehicle_out_id=gas_wholesale_tbl.vehicle_out_id
		AND vo.id=vehicle_out_employee_tbl.id
	GROUP BY vo.id
	ORDER BY vo.created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_transport_service` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_transport_service` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_transport_service`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT
	, IN _vendor_id INT, IN _customer_id INT, IN _transporter_id INT, in _organization_id_log int, OUT _amount_debt DOUBLE
	, OUT _customer_name varchar(255), OUT _customer_address VARCHAR(255), OUT _customer_tax VARCHAR(255), OUT _customer_phone VARCHAR(255), OUT _customer_fax VARCHAR(255))
BEGIN
	DECLARE _from_date, _pre_date DATE;
	declare _is_transported_by int default 0;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	if _transporter_id<>0 then
		SELECT EXISTS (SELECT id FROM vendor WHERE id=_transporter_id AND equal_organization_id=_organization_id_log) into _is_transported_by;
	end if;
	
	if _is_transported_by=1 then 	-- cong ty van chuyen
		IF _vendor_id<>0 THEN
			SELECT `name`, address, tax, phone, fax INTO _customer_name, _customer_address, _customer_tax, _customer_phone, _customer_fax 
			FROM vendor WHERE id=_vendor_id;
		
			SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
		
			SELECT cis.transport_amount INTO _amount_debt
			FROM vendor_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.vendor_id=_vendor_id LIMIT 1;
		
			SELECT t.created_date, '' AS customer, '' AS content, t.in_quantity, t.out_quantity, t.price, t.price_diff, t.rate, t.rate_diff, t.amount, t.paid, t.debt, t.note
			FROM transport_service AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.vendor_id=_vendor_id AND t.charge_for_vendor=1
			UNION ALL
			SELECT t.created_date,'' AS customer, '' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS price, 0 AS price_diff, 0 AS rate, 0 AS rate_diff, 0 AS amount, t.paid, 0 AS debt, t.note
			FROM vendor_debt AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.vendor_id=_vendor_id AND t.kind=2
			ORDER BY created_date
			;
		ELSEIF _customer_id<>0 THEN
			SELECT `name`, address, tax, phone, '' AS fax INTO _customer_name, _customer_address, _customer_tax, _customer_phone, _customer_fax 
			FROM customer WHERE id=_customer_id;
		
			SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
		
			SELECT cis.transport_amount INTO _amount_debt
			FROM customer_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.customer_id=_customer_id LIMIT 1;
			SELECT t.created_date, '' AS customer, '' AS content, t.in_quantity, t.out_quantity, t.price, t.price_diff, t.rate, t.rate_diff, t.amount, t.paid, t.debt, t.note
			FROM transport_service AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.customer_id=_customer_id AND t.charge_for_customer=1
			UNION ALL
			SELECT t.created_date,'' AS customer, '' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS price, 0 AS price_diff, 0 AS rate, 0 AS rate_diff, 0 AS amount, t.paid, 0 AS debt, t.note
			FROM vendor_debt AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.vendor_id=_vendor_id AND t.kind=2
			ORDER BY created_date
			;
		END IF;
	else 				-- cong ty khac van chuyen
		IF _transporter_id<>0 THEN
			SELECT `name`, address, tax, phone, fax INTO _customer_name, _customer_address, _customer_tax, _customer_phone, _customer_fax 
			FROM vendor WHERE id=_transporter_id;
		
			SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
		
			SELECT cis.transport_amount INTO _amount_debt
			FROM vendor_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.vendor_id=_transporter_id LIMIT 1;
		
			SELECT t.created_date, '' AS customer, '' AS content, t.in_quantity, t.out_quantity, t.price, t.price_diff, t.rate, t.rate_diff, t.amount, t.paid, t.debt, t.note
			FROM transport_service AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.transporter_id=_transporter_id AND t.charge_for_vendor=1
			UNION ALL
			SELECT t.created_date,'' AS customer, '' AS content, 0 AS in_quantity, 0 AS out_quantity, 0 AS price, 0 AS price_diff, 0 AS rate, 0 AS rate_diff, 0 AS amount, t.paid, 0 AS debt, t.note
			FROM vendor_debt AS t, employee AS eo
			WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND t.vendor_id=_transporter_id AND t.kind=2
			ORDER BY created_date
			;
		END IF;
	end if;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_vehicle_fee` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_vehicle_fee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_vehicle_fee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _vehicle_id int)
BEGIN
	select f.fee as content, sum(f.quantity) as quantity, avg(price) as price, group_concat(distinct f.note) as note
	from trip_fee as f, employee as eo
	where DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and f.vehicle_id=_vehicle_id AND f.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	group by f.fee
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_vendor_debt` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_vendor_debt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_vendor_debt`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT v.CODE AS vendor_code, v.NAME AS vendor_name, tbl_vendor_stock.amount AS opening_stock, SUM(i.amount) AS amount, SUM(i.paid) AS paid
	FROM vendor AS v, organization AS o, vendor_organization AS vo
	LEFT JOIN (
		SELECT vendor_id, organization_id, SUM(amount) AS amount
		FROM vendor_in_stock 
		WHERE DATEDIFF(_from_date,`day`)=1 AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
		GROUP BY vendor_id, organization_id
	) AS tbl_vendor_stock ON vo.vendor_id=tbl_vendor_stock.vendor_id AND vo.organization_id=tbl_vendor_stock.organization_id
	, lpg_import AS i, employee AS eo
	WHERE vo.vendor_id=v.id AND vo.organization_id=o.id AND v.STATUS=1 AND o.STATUS=1
		AND DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND vo.vendor_id=i.vendor_id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		AND eo.organization_id=vo.organization_id
	GROUP BY v.id	
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchAccessoryImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchAccessoryImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchAccessoryImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, v.NAME AS vendor_name
	FROM accessory_import AS i, vendor AS v, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.created_employee_id=eo.id and _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchContract` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchContract` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchContract`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT con.*, cus.NAME AS customer_name
	FROM contract AS con, customer AS cus, employee AS eo
	WHERE con.customer_id=cus.id AND con.created_employee_id=eo.id
		AND DATE(con.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(con.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchDebtAdjustment`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*, coalesce(if(a.vendor_id<>0, v.name,''),'') as vendorName, COALESCE(IF(a.customer_id<>0, c.NAME,''),'') AS customerName
	FROM employee AS eo, debt_adjustment AS a
		left join vendor as v on a.vendor_id=v.id
		left join customer as c on a.customer_id=c.id
	WHERE DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND a.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchDebtRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchDebtRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchDebtRetail`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*, e.NAME AS customer_name
	FROM retail_debt AS a, customer AS e, employee AS eo
	WHERE a.customer_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchDebtVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchDebtVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchDebtVendor`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*, e.name AS vendor_name
	FROM vendor_debt AS a, vendor AS e, employee AS eo
	WHERE a.vendor_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchDebtWholesale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*, e.NAME AS customer_name
	FROM wholesale_debt AS a, customer AS e, employee AS eo
	WHERE a.customer_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeAdvance`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids text)
BEGIN
	set _organization_ids = concat(',',_organization_ids,',');
	select a.id, a.code, a.advance_date, e.fullname as employee_name, a.amount, a.note
	from employee_advance as a, employee as e, employee as eo
	WHERE a.employee_id=e.id and a.created_employee_id=eo.id
		and DATE(a.advance_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.advance_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeOff` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeOff` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeOff`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT a.id, a.CODE, a.created_date, e.fullname AS employee_name, a.from_date, a.to_date, a.note
	FROM employee_off AS a, employee AS e, employee AS eo
	WHERE a.employee_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeOffIncrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeOffIncrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeOffIncrease`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT a.id, a.CODE, a.created_date, e.fullname AS employee_name, a.quantity, a.note
	FROM employee_off_increase AS a, employee AS e, employee AS eo
	WHERE a.employee_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeOffMoney` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeOffMoney` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeOffMoney`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT a.id, a.CODE, a.created_date, e.fullname AS employee_name, a.quantity, a.price, a.amount, a.note
	FROM employee_off_money AS a, employee AS e, employee AS eo
	WHERE a.employee_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeTimesheet` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeTimesheet` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeTimesheet`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT t.id, t.CODE, t.timesheet_date, e.fullname AS employee_name, t.quantity, t.note, d.name as field_name
	FROM timesheet AS t, employee AS e, dynamic_field as d, employee AS eo
	WHERE t.employee_id=e.id and t.field_id=d.id AND t.created_employee_id=eo.id
		AND DATE(t.timesheet_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.timesheet_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchExpense` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchExpense` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchExpense`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*
	FROM expense AS a, employee AS eo
	WHERE DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND a.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchExportWholesale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*, c.NAME AS customer_name
	FROM gas_export_wholesale AS s, customer AS c, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.customer_id=c.id AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchFixedAssetDepreciation` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchFixedAssetDepreciation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchFixedAssetDepreciation`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT d.*
	FROM fixed_asset_depreciation AS d
	WHERE DATE(d.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(d.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchFraction` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchFraction` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchFraction`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT f.id, f.CODE, f.created_date, f.note
	FROM fraction_gas as f, employee AS eo
	WHERE f.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		and DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGasImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, v.name as vendor_name
	FROM gas_import as i, vendor as v, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.vendor_id=v.id AND i.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGasPrice` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGasPrice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGasPrice`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT gp.*, c.NAME AS customer_name
	FROM gas_price_list AS gp, customer AS c
	WHERE ((DATE(gp.from_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(gp.from_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y'))
	OR (DATE(gp.to_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(gp.to_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')))
	AND gp.customer_id=c.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGasRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGasRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGasRetail`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT s.*, c.NAME AS customer_name
	FROM gas_retail AS s, customer AS c
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.customer_id=c.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGasReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGasReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGasReturn`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM gas_return AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGasWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGasWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGasWholesale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*, c.NAME AS customer_name
	FROM gas_wholesale AS s, customer AS c, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.customer_id=c.id AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchGoodImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchGoodImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGoodImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT i.*, v.NAME AS vendor_name, s.NAME AS store_name
	FROM good_import AS i, vendor AS v, store AS s
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.store_id=s.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchIncome`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*
	FROM income AS a, employee AS eo
	WHERE DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND a.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchLoVo` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchLoVo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchLoVo`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM lo_vo AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchLpgImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchLpgImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchLpgImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT i.id, i.CODE, v.name AS vendor_name, i.actual_quantity, i.price, i.amount, i.rate, i.note, i.import_date
	FROM lpg_import AS i, vendor as v, employee as e
	WHERE i.vendor_id=v.id 
		AND DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchLpgSale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT i.id, i.CODE, c.NAME AS customer_name, i.quantity, i.price, i.price_transport, i.amount, i.note
	FROM lpg_sale AS i, customer AS c, employee AS eo
	WHERE i.customer_id=c.id AND i.created_employee_id=eo.id
		AND DATE(i.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	UNION ALL
	SELECT i.id, i.CODE, c.NAME AS customer_name, i.quantity, i.price, i.price_transport, i.amount, i.note
	FROM lpg_sale AS i, customer AS c, vendor_customer AS vc, vendor AS v
	WHERE i.customer_id=c.id AND i.customer_id=vc.customer_id AND vc.vendor_id=v.id
		AND DATE(i.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',v.equal_organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchOldShell`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT t.*, v.name as shell_name
	FROM old_shell AS t, shell AS v, employee AS eo
	WHERE t.shell_id=v.id
		AND DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchPetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchPetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPetroImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT i.*, v.NAME AS vendor_name, s.NAME AS store_name
	FROM petro_import AS i, vendor AS v, store AS s
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.store_id=s.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchPromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchPromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPromotionMaterialImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, v.NAME AS vendor_name
	FROM promotion_material_import AS i, vendor AS v, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSalary` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSalary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSalary`(IN _start_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	declare _date date;
	
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	
	select STR_TO_DATE(_start_date,'%m/%Y') into _date;
	
	SELECT s.id, s.CODE, s.created_date, e.fullname AS employee_name, s.total
	FROM employee_salary AS s, employee AS e
	WHERE s.employee_id=e.id
		AND month(s.created_date) = month(_date) AND year(s.created_date) = year(_date)
		AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleAccessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleAccessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleAccessory`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT s.*
	FROM accessory_sale AS s
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleGood`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM good_sale AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleInner`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM inner_sale AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSalePetro`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM petro_sale AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleShell`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM shell_sale AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchShellImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.id, i.CODE, s.name as shell_name, i.created_date, i.quantity, i.price, i.note
	FROM shell_import AS i, shell AS s, employee AS eo
	WHERE i.shell_id=s.id AND i.created_employee_id=eo.id
		AND DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchShellReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchShellReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchShellReturn`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, v.NAME AS customer_name
	FROM shell_return AS i, customer AS v, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.customer_id=v.id AND i.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchShellReturnSupplier` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchShellReturnSupplier` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchShellReturnSupplier`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, v.NAME AS vendor_name
	FROM shell_return_supplier AS i, vendor AS v, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id  AND i.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchShieldDecrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchShieldDecrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchShieldDecrease`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT t.*, v.name as vendor_name
	FROM shield_decrease AS t, vendor as v, employee AS eo
	WHERE t.vendor_id=v.id and DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND v.STATUS=1
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchShieldImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT t.*, v.name as vendor_name
	FROM shield_import AS t, vendor as v, employee as eo
	WHERE t.vendor_id=v.id and DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		 AND t.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND v.STATUS=1
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchTransportService`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.id, i.CODE, v.NAME AS vendor_name, i.out_quantity, i.price, i.amount, i.paid, i.debt, i.note
	FROM transport_service AS i, vendor AS v, employee AS e
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') and i.vendor_id=v.id 
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchTripFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchTripFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchTripFee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	select t.id, t.code, v.plate, t.created_date, t.fee, t.amount, t.note
	from trip_fee as t, vehicle as v, employee as eo
	WHERE t.vehicle_id=v.id AND t.created_employee_id=eo.id
		and DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchVehicleIn` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchVehicleIn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchVehicleIn`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM vehicle_in AS s, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchVehicleOut` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchVehicleOut` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchVehicleOut`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*, v.plate as vehicle_plate
	FROM vehicle_out AS s, vehicle as v, employee AS eo
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and s.vehicle_id=v.id  AND s.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateAccessoryImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateAccessoryImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccessoryImport`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM accessory_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE accessory_import SET total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note 
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, vendor_id=_vendor_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateAccessoryImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateAccessoryImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccessoryImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _accessory_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.accessory_id, fdet.quantity
	INTO _old_date, _organization_id, _accessory_id, _old_quantity
	FROM accessory_import_detail as fdet, accessory_import AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.accessory_import_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			UPDATE accessory_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			IF _in_stock_id=0 THEN
				INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, _quantity);
			ELSE
				UPDATE accessory_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE accessory_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateContract` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateContract` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateContract`(IN _id INT, IN _customer_id INT, IN _shell_12_price DOUBLE
	, IN _shell_45_price DOUBLE, IN _credit_date INT, IN _credit_amount DOUBLE, IN _note TEXT)
BEGIN
	UPDATE contract SET customer_id=_customer_id
		, shell_12_price=_shell_12_price
		, shell_45_price=_shell_45_price
		, credit_date=_credit_date
		, credit_amount=_credit_amount
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtAdjustment`(IN _id INT, IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _vendor_id INT, IN _customer_id INT, in _kind int, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_vendor_id, _old_customer_id, _old_kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT s.created_date, eo.organization_id, s.amount, s.customer_id, s.vendor_id, s.kind
	INTO _old_date, _organization_id, _old_amount, _old_customer_id, _old_vendor_id, _old_kind
	FROM debt_adjustment AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_customer_id<>_customer_id OR _old_amount<>_amount or _old_kind<>_kind THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			if _old_vendor_id<>0 then
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
				if _old_kind=1 then
					UPDATE vendor_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
				else
					UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_amount WHERE id=_in_stock_id;
				end if;
			elseif _old_customer_id<>0 then
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
				IF _old_kind=1 THEN
					UPDATE customer_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
				else
					UPDATE customer_in_stock SET transport_amount=transport_amount - _old_amount WHERE id=_in_stock_id;
				end if;
			end if;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			IF _vendor_id<>0 THEN
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
				IF _in_stock_id=0 THEN
					IF _kind=1 THEN
						INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _amount);
					ELSE
						INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, _amount);
					END IF;
				ELSE
					IF _kind=1 THEN
						UPDATE vendor_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
					ELSE
						UPDATE vendor_in_stock SET transport_amount=transport_amount + _amount WHERE id=_in_stock_id;
					END IF;
				END IF;
			ELSEIF _customer_id<>0 THEN
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
				IF _in_stock_id=0 THEN
					IF _kind=1 THEN
						INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _amount);
					ELSE
						INSERT INTO customer_in_stock(`day`, customer_id, transport_amount) VALUES (_date, _customer_id, _amount);
					END IF;
				ELSE
					IF _kind=1 THEN
						UPDATE customer_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
					ELSE
						UPDATE customer_in_stock SET transport_amount=transport_amount + _amount WHERE id=_in_stock_id;
					END IF;
				END IF;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE debt_adjustment SET amount=_amount
		, vendor_id=_vendor_id
		, customer_id=_customer_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, kind=_kind
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtRetail`(iN _id INT, IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE retail_debt SET customer_id=_customer_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtVendor`(IN _id INT, IN _vendor_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE, IN _account_id INT, IN _note TEXT, IN _kind INT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id, _old_vendor_id, _old_kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT s.created_date, eo.organization_id, s.paid, s.account_id, s.vendor_id, s.kind
	INTO _old_date, _organization_id, _old_amount, _old_account_id, _old_vendor_id, _old_kind
	FROM vendor_debt AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_vendor_id<>_vendor_id or _old_account_id<>_account_id or _old_amount<>_paid or _old_kind<>_kind then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			IF _old_kind=1 THEN
				UPDATE vendor_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
			else
				UPDATE vendor_in_stock SET transport_amount=transport_amount + _old_amount WHERE id=_in_stock_id;
			end if;
	
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				IF _kind=1 THEN
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, -_paid);
				else
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, -_paid);
				end if;
			ELSE
				IF _kind=1 THEN
					UPDATE vendor_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
				ELSE
					UPDATE vendor_in_stock SET transport_amount=transport_amount - _paid WHERE id=_in_stock_id;
				END IF;
				
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE vendor_debt SET vendor_id=_vendor_id, paid=_paid, account_id=_account_id, note=_note, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y'), kind=_kind WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtWholesale`(IN _id INT, IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, in _kind int)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id, _old_customer_id, _old_kind INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
		
	SELECT s.created_date, eo.organization_id, s.paid, s.account_id, s.customer_id, s.kind
	INTO _old_date, _organization_id, _old_amount, _old_account_id, _old_customer_id, _old_kind
	FROM wholesale_debt AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_customer_id<>_customer_id OR _old_account_id<>_account_id OR _old_amount<>_paid or _old_kind<>_kind THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			IF _old_kind=1 THEN
				UPDATE customer_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
			ELSE
				UPDATE customer_in_stock SET transport_amount=transport_amount + _old_amount WHERE id=_in_stock_id;
			END IF;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				IF _kind=1 THEN
					INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, -_paid);
				ELSE
					INSERT INTO customer_in_stock(`day`, customer_id, transport_amount) VALUES (_date, _customer_id, -_paid);
				END IF;
			ELSE
				IF _kind=1 THEN
					UPDATE customer_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
				ELSE
					UPDATE customer_in_stock SET transport_amount=transport_amount - _paid WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE wholesale_debt SET customer_id=_customer_id
		, paid=_paid
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') 
		, kind=_kind
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeAdvance`(IN _id INT, IN _employee_id INT, in _advance_date VARCHAR(20), IN _amount DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	declare _old_amount double;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_advance_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id, s.amount, s.advance_date, s.account_id INTO _organization_id, _old_amount, _old_date, _old_account_id
	FROM employee_advance AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_amount<>_amount or _old_account_id<>_account_id then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _amount  WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	update employee_advance set employee_id=_employee_id
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, advance_date=STR_TO_DATE(_advance_date,'%d/%m/%Y') 
	where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeOff` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeOff` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOff`(IN _id INT, IN _employee_id INT, IN _from_date VARCHAR(20), IN _to_date VARCHAR(20)
	, IN _note TEXT, IN _actual_off_day INT)
BEGIN
	UPDATE employee_off SET employee_id=_employee_id
		, from_date=STR_TO_DATE(_from_date,'%d/%m/%Y')
		, to_date=STR_TO_DATE(_to_date,'%d/%m/%Y')
		, note=_note
		, actual_off_day=_actual_off_day
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeOffIncrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeOffIncrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOffIncrease`(IN _id INT, IN _employee_id INT, IN _quantity VARCHAR(20), IN _note TEXT)
BEGIN
	UPDATE employee_off_increase SET employee_id=_employee_id
		, quantity=_quantity
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeOffMoney` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeOffMoney` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOffMoney`(IN _id INT, IN _created_date VARCHAR(20), IN _employee_id INT, IN _quantity int, IN _price DOUBLE
	, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT s.created_date, eo.organization_id, s.amount, s.account_id
	INTO _old_date, _organization_id, _old_amount, _old_account_id
	FROM employee_off_money AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_amount<>_amount OR _old_account_id<>_account_id THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _amount  WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE employee_off_money SET employee_id=_employee_id
		, quantity=_quantity
		, price=_price
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') 
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeTimesheet` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeTimesheet` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeTimesheet`(IN _id INT, IN _employee_id INT, IN _timesheet_date VARCHAR(20), IN _field_id int
	, IN _quantity INT, IN _note TEXT)
BEGIN
	declare _field_name varchar(255) default '';
	select name into _field_name from dynamic_field where id=_field_id;
	UPDATE timesheet SET employee_id=_employee_id
		, timesheet_date=STR_TO_DATE(_timesheet_date,'%d/%m/%Y')
		, field_id=_field_id
		, field_name=_field_name
		, quantity=_quantity
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExpense` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExpense` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExpense`(IN _id INT, IN _created_date VARCHAR(20), IN _from_date VARCHAR(20), IN _to_date VARCHAR(20)
	, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _is_usually int, in _type int)
BEGIN
	declare _f_date, _t_date date;
	declare _y, _m int;
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
		
	SELECT s.created_date, eo.organization_id, s.amount, s.account_id
	INTO _old_date, _organization_id, _old_amount, _old_account_id
	FROM expense AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_account_id<>_account_id OR _old_amount<>_amount THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	set _f_date = STR_TO_DATE(_from_date,'%d/%m/%Y');
	SET _t_date = STR_TO_DATE(_to_date,'%d/%m/%Y');
	
	set _y = 12 * (year(_t_date) - year(_f_date));
	set _m = _y + month(_t_date) - month(_f_date);
	
	UPDATE expense SET from_date=_f_date
		, to_date=_t_date
		, month_count=_m
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, content=_content
		, is_usually=_is_usually
		, `type`=_type
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesale`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, in _customer_id int, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_account_id, _old_customer_id, _old_paid, _old_debt
	FROM gas_export_wholesale AS f, employee as eo
	WHERE f.id=_id and f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_paid<>_paid or _old_debt<>_debt THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE gas_export_wholesale SET total=_total
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, customer_id=_customer_id
		, note=_note 
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExportWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExportWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesaleDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id, fdet.quantity
	INTO _old_date, _organization_id, _vendor_id, _shell, _old_quantity
	FROM gas_export_wholesale_detail fdet, gas_export_wholesale AS f, shell_vendor AS sv, shell AS s
	WHERE fdet.id=_id and f.id=fdet.gas_export_wholesale_id AND sv.id=fdet.shell_id AND sv.shell_id=s.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id<>0 THEN
				UPDATE shell_gas_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			END IF;
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE gas_export_wholesale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExportWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExportWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesaleReturnShellDetail`(IN _id INT, IN _quantity INT, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _shell_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.shell_id, fdet.quantity INTO _old_date, _organization_id, _shell_id, _old_quantity
	FROM gas_export_wholesale_shell_detail fdet, gas_export_wholesale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.gas_export_wholesale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id<>0 THEN
				UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES(_date, _organization_id, _shell_id, _quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE gas_export_wholesale_shell_detail SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateFixedAssetDepreciation` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateFixedAssetDepreciation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFixedAssetDepreciation`(IN _id INT, IN _note TEXT)
BEGIN
	UPDATE fixed_asset_depreciation SET note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateFixedAssetDepreciationDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateFixedAssetDepreciationDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFixedAssetDepreciationDetail`(IN _id INT, IN _is_calculate INT)
BEGIN
	UPDATE fixed_asset_depreciation_detail SET is_calculate=_is_calculate WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateFraction` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateFraction` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFraction`(IN _id INT, IN _created_date VARCHAR(20), IN _note TEXT)
BEGIN
	UPDATE fraction_gas SET note=_note, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateFractionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateFractionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFractionDetail`(in _id int, IN _created_date VARCHAR(20), in _quantity int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _weight, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sk.weight, s.id, fdet.quantity 
	INTO _old_date, _organization_id, _vendor_id, _weight, _shell, _old_quantity
	FROM fraction_gas AS f, fraction_gas_detail as fdet, shell_vendor AS sv, shell AS s, shell_kind AS sk
	WHERE fdet.id=_id and fdet.fraction_id=f.id and fdet.shell_id=sv.id AND sv.shell_id=s.id AND s.kind_id=sk.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND vendor_id=_vendor_id;
			UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity * _weight WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND shell_id=_shell;
			UPDATE shell_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		
			SET _in_stock_id=0;
			-- shield_in_stock
			SELECT id INTO _in_stock_id FROM shield_in_stock  WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			UPDATE shield_in_stock SET in_stock=in_stock  + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, -_quantity*_weight);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock -_quantity*_weight WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell, -_quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, _quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- shield_in_stock
			SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, -_quantity);
			ELSE
				UPDATE shield_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	update fraction_gas_detail set quantity=_quantity where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasImport`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, f.account_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_vendor_id, _old_account_id, _old_paid, _old_debt
	FROM gas_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_paid<>_paid OR _old_debt<>_debt or _old_account_id<>_account_id or _old_vendor_id<>_vendor_id THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE gas_import SET vendor_id=_vendor_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, store_id=_store_id
		, rate=_rate
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), in _vendor_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _shell_id, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, fdet.shell_id, fdet.quantity
	INTO _old_date, _organization_id, _old_vendor_id, _shell_id, _old_quantity
	FROM gas_import_detail fdet, gas_import AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.gas_import_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity or _old_vendor_id<>_vendor_id THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_old_vendor_id AND sv.shell_id=_shell_id;
			UPDATE shell_gas_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				SELECT id INTO _in_stock_id
				FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell_id;
				IF _in_stock_id=0 THEN
					INSERT INTO shell_vendor(organization_id, shell_id, vendor_id, quantity) VALUES (_organization_id, _shell_id, _vendor_id, 0);
					SELECT LAST_INSERT_ID() INTO _in_stock_id;
				END IF;
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) VALUES (_date, _in_stock_id, _quantity);
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_old_vendor_id AND shell_id=_shell_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity - _old_quantity WHERE id=_in_stock_id;
	END IF;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity + _quantity WHERE id=_in_stock_id;
	END IF;
	
	UPDATE gas_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasPrice` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasPrice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasPrice`(IN _id INT, IN _from_date VARCHAR(20), IN _to_date VARCHAR(20), IN _price DOUBLE, IN _customer_id INT, IN _note TEXT)
BEGIN
	UPDATE gas_price_list SET from_date=STR_TO_DATE(_from_date,'%d/%m/%Y')
		, to_date=STR_TO_DATE(_to_date,'%d/%m/%Y')
		, price=_price	
		, customer_id=_customer_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasRetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasRetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasRetail`(IN _id INT, IN _customer_id INT, IN _vehicle_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE gas_retail SET customer_id=_customer_id
		, vehicle_id=_vehicle_id
		, total=_total
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasRetailDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasRetailDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasRetailDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE gas_retail_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasRetailPromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasRetailPromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasRetailPromotionMaterialDetail`(IN _id INT, IN _quantity INT)
BEGIN
	UPDATE gas_retail_promotion SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasRetailReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasRetailReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasRetailReturnShellDetail`(IN _id INT, IN _quantity INT)
BEGIN
	UPDATE gas_retail_return_shell SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasReturn`(IN _id INT, IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE gas_return SET total=_total
		, customer_id=_customer_id
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasReturnDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE gas_return_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesale`(IN _id INT, IN _created_date VARCHAR(20), IN _vehicle_out_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _gas_return INT, IN _gas_return_price DOUBLE
	, IN _gas_return_amount DOUBLE, IN _customer_id INT, IN _old_paid_debt DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _old_gas_return, _old_customer_id, _old_account_id, _old_wholesale_debt_id INT DEFAULT 0;
	declare _old_paid, _old_debt, _old_old_paid_debt double default 0;
	DECLARE _old_date, _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.gas_return, f.customer_id, f.account_id, f.paid, f.debt, f.paid_old_debt_amount
	INTO _old_date, _organization_id, _old_gas_return, _old_customer_id, _old_account_id, _old_paid, _old_debt, _old_old_paid_debt
	FROM gas_wholesale as f, employee AS eo 
	WHERE f.id=_id and f.created_employee_id=eo.id;
	
	SELECT vendor_id INTO _vendor_id FROM gas_return_vendor WHERE organization_id=_organization_id LIMIT 1;
	
	if _old_date<>_date or _old_gas_return<>_gas_return or _old_paid<>_paid or _old_debt<>_debt or _old_account_id<>_account_id or _old_customer_id<>_customer_id then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND vendor_id=_vendor_id;
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_gas_return WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND account_id=_old_account_id AND organization_id=_organization_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _gas_return);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock + _gas_return WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND account_id=_account_id AND organization_id=_organization_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES(_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES(_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE gas_wholesale SET vehicle_out_id=_vehicle_out_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, total=_total
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
		, gas_return=_gas_return
		, gas_return_price=_gas_return_price
		, gas_return_amount=_gas_return_amount
		, customer_id=_customer_id
		, paid_old_debt_amount=_old_paid_debt
	WHERE id=_id;
	IF _old_paid_debt<>_old_old_paid_debt THEN
		select id into _old_wholesale_debt_id from wholesale_debt where gas_wholesale_id=_id limit 1;
		if _old_wholesale_debt_id=0 then
			CALL insertDebtWholesale(CONCAT(_code,'_auto'), _customer_id, _created_date, _old_paid_debt, _account_id, '', _created_employee_id, 1, _id, @auto_id);
		else
			update wholesale_debt set paid=_old_paid_debt where id=_old_wholesale_debt_id;
		end if;
	END IF;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesaleDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id, fdet.quantity
	INTO _old_date, _organization_id, _vendor_id, _shell, _old_quantity
	FROM gas_wholesale_detail fdet, gas_wholesale AS f, shell_vendor AS sv, shell AS s
	WHERE fdet.id=_id and f.id=fdet.gas_wholesale_id AND sv.id=fdet.shell_id AND sv.shell_id=s.id;
	
	if _old_date<>_date or _old_quantity<>_quantity then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			UPDATE shell_gas_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE gas_wholesale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesaleFeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesaleFeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesaleFeeDetail`(IN _id INT, IN _amount INT, IN _note TEXT)
BEGIN
	update gas_wholesale_fee_detail set amount=_amount, note=_note where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesalePromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesalePromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesalePromotionMaterialDetail`(IN _id INT, IN _quantity INT, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _promotion_material_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT f.created_date, eo.organization_id, fdet.promotion_material_id, fdet.quantity INTO _old_date, _organization_id, _promotion_material_id, _old_quantity
	FROM gas_wholesale_promotion fdet, gas_wholesale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
		IF _in_stock_id<>0 THEN
			UPDATE promotion_material_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
	END WHILE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- promotion_material_in_stock
		SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
		IF _in_stock_id=0 THEN
			INSERT INTO promotion_material_in_stock(`day`, organization_id, promotion_material_id, in_stock) VALUES (_date, _organization_id, _promotion_material_id, -_quantity);
		ELSE
			UPDATE promotion_material_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE gas_wholesale_promotion SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesaleReturnShellDetail`(IN _id INT, IN _quantity INT, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _shell_id, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT f.created_date, eo.organization_id, fdet.shell_id, fdet.quantity INTO _old_date, _organization_id, _shell_id, _old_quantity
	FROM gas_wholesale_return_shell fdet, gas_wholesale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.gas_wholesale_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
	END WHILE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE gas_wholesale_return_shell SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGoodImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGoodImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoodImport`(IN _id INT, IN _created_date VARCHAR(20), IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _vendor_id INT, IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM good_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE good_import SET rate=_rate
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note
		, vendor_id=_vendor_id
		, store_id=_store_id 
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGoodImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGoodImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoodImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_store_id, _old_quantity, _good_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.store_id, fdet.quantity, fdet.good_id
	INTO _old_date, _organization_id, _old_store_id, _old_quantity, _good_id
	FROM good_import AS f, good_import_detail AS fdet, employee AS eo
	WHERE fdet.id=_id AND fdet.good_import_id=f.id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_store_id<>_store_id OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- good_in_stock
			SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_old_store_id;
			UPDATE good_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- good_in_stock
			SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO good_in_stock(`day`, organization_id, good_id, store_id, in_stock) VALUES (_date, _organization_id, _good_id, _store_id, _quantity);
			ELSE
				UPDATE good_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE good_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIncome`(IN _id INT, IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _type int)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
		
	SELECT s.created_date, eo.organization_id, s.amount, s.account_id
	INTO _old_date, _organization_id, _old_amount, _old_account_id
	FROM income AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_account_id<>_account_id or _old_amount<>_amount then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE income SET amount=_amount, account_id=_account_id, note=_note, content=_content, `type`=_type, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateLoVo` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateLoVo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLoVo`(IN _id INT, IN _quantity INT, IN _note TEXT)
BEGIN
	UPDATE lo_vo SET quantity=_quantity
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateLoVoEmployeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateLoVoEmployeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLoVoEmployeeDetail`(IN _id INT, IN _employee_id INT, IN _note TEXT)
BEGIN
	UPDATE lo_vo_employee_detail SET employee_id=_employee_id, note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateLpgImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateLpgImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLpgImport`(IN _id INT, IN _import_date VARCHAR(20), IN _vendor_id INT, in _kind int
	, IN _paper_quantity FLOAT, IN _actual_quantity FLOAT, IN _price DOUBLE, IN _vat DOUBLE, IN _invoice_amount DOUBLE, IN _amount DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT, IN _link_lpg_codes TEXT)
BEGIN
	DECLARE _organization_id, _old_vendor_id, _import_vendor_id, _date_diff, _in_stock_id
		, _old_quantity, _old_account_id, _old_kind INT DEFAULT 0;
	DECLARE _old_debt, _old_paid DOUBLE;
	DECLARE _date, _old_date DATE;
	DECLARE _link_lpg_ids TEXT DEFAULT '';
		
	SELECT STR_TO_DATE(_import_date,'%d/%m/%Y') INTO _date;
	SELECT GROUP_CONCAT(id) INTO _link_lpg_ids FROM lpg_sale WHERE CONCAT('%,',_link_lpg_codes,',%') LIKE CONCAT('%,',CODE,',%');
	
	SELECT i.import_date, eo.organization_id, i.vendor_id, i.actual_quantity, i.paid, i.debt, i.account_id, i.kind
	INTO _old_date, _organization_id, _old_vendor_id, _old_quantity, _old_paid, _old_debt, _old_account_id, _old_kind
	FROM lpg_import AS i, employee AS eo
	WHERE i.id=_id AND i.created_employee_id=eo.id;
	
	SELECT id INTO _import_vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_quantity<>_actual_quantity OR _old_account_id<>_account_id OR _old_debt<>_debt 
		or _old_paid<>_paid or _kind<>_old_kind THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND vendor_id=_import_vendor_id;
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			if _old_kind=1 then
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND vendor_id=_old_vendor_id;
				UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
				
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
				UPDATE money_in_stock SET in_stock=in_stock  + _old_paid WHERE id=_in_stock_id;
			end if;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_import_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _import_vendor_id, _actual_quantity);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock + _actual_quantity WHERE id=_in_stock_id;
			END IF;
		
			IF _kind=1 THEN
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
				IF _in_stock_id=0 THEN
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
				ELSE
					UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
				END IF;
			
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
				IF _in_stock_id=0 THEN
					INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_paid);
				ELSE
					UPDATE money_in_stock SET in_stock=in_stock - _paid WHERE id=_in_stock_id;
				END IF;
			end if;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE lpg_import SET vendor_id=_vendor_id
		, kind=_kind
		, import_date=STR_TO_DATE(_import_date,'%d/%m/%Y')
		, paper_quantity=_paper_quantity
		, actual_quantity=_actual_quantity
		, price=_price
		, vat=_vat
		, invoice_amount=_invoice_amount
		, amount=_amount
		, paid=_paid
		, debt=_debt
		, rate=_rate
		, account_id=_account_id
		, route_id=_route_id
		, note=_note
		, link_lpg_codes=_link_lpg_codes
		, link_lpg_ids=_link_lpg_ids
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLpgSale`(IN _id INT, IN _kind INT, IN _customer_id INT, IN _sale_date VARCHAR(20), IN _quantity FLOAT
	, IN _price DOUBLE, IN _price_transport DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_quantity, _old_account_id, _old_customer_id, _old_vendor_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE;
	DECLARE _date, _old_date DATE;
	SELECT STR_TO_DATE(_sale_date,'%d/%m/%Y') INTO _date;
	SELECT s.sale_date, eo.organization_id, s.quantity, s.paid, s.debt, s.account_id, s.customer_id
	INTO _old_date, _organization_id, _old_quantity, _old_paid, _old_debt, _old_account_id, _old_customer_id
	FROM lpg_sale as s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	SELECT id INTO _old_vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	IF _old_date<>_date OR _old_account_id<>_account_id or _old_customer_id<>_customer_id OR _old_quantity<>_quantity  OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			-- lpg_in_stock
			IF _old_vendor_id <> 0 THEN
				SET _in_stock_id=0;
				SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
				UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			end if;
	
			IF _kind=1 THEN
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
				UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
				UPDATE money_in_stock SET in_stock=in_stock  - _old_paid WHERE id=_in_stock_id;
			end if;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			IF _old_vendor_id <> 0 THEN
				SET _in_stock_id=0;
				-- lpg_in_stock
				SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
				IF _in_stock_id=0 THEN
					INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _old_vendor_id, -_quantity);
				ELSE
					UPDATE lpg_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			IF _kind=1 THEN
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
				IF _in_stock_id=0 THEN
					INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
				ELSE
					UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
				END IF;
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
				IF _in_stock_id=0 THEN
					INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
				ELSE
					UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
				END IF;
			end if;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	UPDATE lpg_sale SET customer_id=_customer_id
		, sale_date=STR_TO_DATE(_sale_date,'%d/%m/%Y')
		, quantity=_quantity
		, price=_price
		, price_transport=_price_transport
		, vat=_vat
		, rate=_rate
		, amount=_amount
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, route_id=_route_id
		, note=_note
		, kind=_kind
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOldShell`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _shell_id int, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_quantity, _old_shell_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
		
	SELECT s.created_date, eo.organization_id, s.quantity, s.shell_id
	INTO _old_date, _organization_id, _old_quantity, _old_shell_id
	FROM old_shell AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_shell_id<>_shell_id or _old_quantity<>_quantity then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_old_shell_id;
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE old_shell SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y'), quantity=_quantity, shell_id=_shell_id, note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePetroImport`(IN _id INT, IN _created_date VARCHAR(20), IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, in _vendor_id int, in _store_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	declare _old_paid, _old_debt double default 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM petro_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_vendor_id<>_vendor_id or _old_account_id<>_account_id or _old_debt<>_debt or _old_paid<>_paid then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE petro_import SET rate=_rate
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note 
		, vendor_id=_vendor_id
		, store_id=_store_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePetroImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePetroImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePetroImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), in _store_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_store_id, _old_quantity, _petro_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.store_id, fdet.quantity, fdet.petro_id
	INTO _old_date, _organization_id, _old_store_id, _old_quantity, _petro_id
	FROM petro_import AS f, petro_import_detail as fdet, employee AS eo
	WHERE fdet.id=_id and fdet.petro_import_id=f.id AND f.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_store_id<>_store_id or _old_quantity<>_quantity then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- petro_in_stock
			SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id AND store_id=_old_store_id;
			UPDATE petro_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- petro_in_stock
			SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO petro_in_stock(`day`, organization_id, petro_id, store_id, in_stock) VALUES (_date, _organization_id, _petro_id, _store_id, _quantity);
			ELSE
				UPDATE petro_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE petro_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePromotionMaterialImport`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM promotion_material_import AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE promotion_material_import SET total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note 
		, vendor_id=_vendor_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePromotionMaterialImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePromotionMaterialImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePromotionMaterialImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _promotion_material_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.promotion_material_id, fdet.quantity
	INTO _old_date, _organization_id, _promotion_material_id, _old_quantity
	FROM promotion_material_import_detail AS fdet, promotion_material_import AS f, employee AS eo
	WHERE fdet.id=_id AND f.id=fdet.import_id AND f.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_quantity<>_quantity then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- promotion_material_in_stock
			SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
			UPDATE promotion_material_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- promotion_material_in_stock
			SELECT id INTO _in_stock_id FROM promotion_material_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND promotion_material_id=_promotion_material_id;
			IF _in_stock_id=0 THEN
				INSERT INTO promotion_material_in_stock(`day`, organization_id, promotion_material_id, in_stock) VALUES (_date, _organization_id, _promotion_material_id, _quantity);
			ELSE
				UPDATE promotion_material_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE promotion_material_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSalary` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSalary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalary`(in _id int, in _total double)
BEGIN
	update employee_salary set total=_total where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSalaryField` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSalaryField` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalaryField`(in _id int, in _amount double, in _note text)
BEGIN
	update employee_salary_field_detail set amount=_amount, note=_note where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleAccessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleAccessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleAccessory`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.paid
	INTO _old_date, _organization_id, _old_account_id, _old_paid
	FROM accessory_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_account_id<>_account_id OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE accessory_sale SET total=_total
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleAccessoryChnageDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleAccessoryChnageDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleAccessoryChnageDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE accessory_sale_change_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleAccessoryDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleAccessoryDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleAccessoryDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _accessory_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.accessory_id, fdet.quantity
	INTO _old_date, _organization_id, _accessory_id, _old_quantity
	FROM accessory_sale_detail as fdet, accessory_sale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.accessory_sale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			UPDATE accessory_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			IF _in_stock_id=0 THEN
			INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, -_quantity);
		ELSE
			UPDATE accessory_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE accessory_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleGood`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _store_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_account_id, _old_customer_id, _old_paid, _old_debt
	FROM good_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_customer_id<>_customer_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE good_sale SET total=_total
		, customer_id=_customer_id
		, store_id=_store_id
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleGoodDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleGoodDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleGoodDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_store_id, _old_quantity, _good_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.store_id, fdet.good_id, fdet.quantity
	INTO _old_date, _organization_id, _old_store_id, _good_id, _old_quantity
	FROM good_sale_detail as fdet, good_sale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.good_sale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_store_id<>_store_id OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- good_in_stock
			SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_old_store_id;
			UPDATE good_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- good_in_stock
			SELECT id INTO _in_stock_id FROM good_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND good_id=_good_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO good_in_stock(`day`, organization_id, good_id, store_id, in_stock) VALUES (_date, _organization_id, _good_id, _store_id, -_quantity);
			ELSE
				UPDATE good_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	
	end if;
	
	UPDATE good_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleInner`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _employee_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_employee_advance_id, _created_employee_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id, f.created_date, f.account_id, f.paid, f.debt, f.created_employee_id
	INTO _organization_id, _old_date, _old_account_id, _old_paid, _old_debt, _created_employee_id
	FROM inner_sale AS f, employee AS eo 
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_account_id<>_account_id OR _old_paid<>_paid OR _old_debt<>_debt THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE inner_sale SET total=_total
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note 
		, employee_id=_employee_id
	WHERE id=_id;
	
	SELECT id INTO _old_employee_advance_id FROM employee_advance WHERE inner_sale_id=_id LIMIT 1;
	IF _old_employee_advance_id=0 THEN
		CALL insertEmployeeAdvance(CONCAT(_code,'_auto'), _employee_id, _created_date, _debt, _account_id, _note, _created_employee_id, _id, @auto_id);
	ELSE
		UPDATE employee_advance SET amount=_debt 
			, employee_id=_employee_id
			, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
			, account_id=_account_id
			, note=_note
		WHERE id=_old_employee_advance_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleInnerDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleInnerDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleInnerDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, s.id, fdet.quantity
	INTO _old_date, _organization_id, _vendor_id, _shell, _old_quantity
	FROM inner_sale_detail fdet, inner_sale AS f, shell_vendor AS sv, shell AS s
	WHERE fdet.id=_id AND f.id=fdet.inner_sale_id AND sv.id=fdet.shell_id AND sv.shell_id=s.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			UPDATE shell_gas_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE inner_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalePetro`(IN _id INT, IN _created_date VARCHAR(20), in _customer_id int, in _store_id int, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE default 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_account_id, _old_customer_id, _old_paid, _old_debt
	FROM petro_sale AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_customer_id<>_customer_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE petro_sale SET total=_total
		, customer_id=_customer_id
		, store_id=_store_id
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSalePetroDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSalePetroDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalePetroDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _created_date VARCHAR(20), IN _store_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_store_id, _old_quantity, _petro_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.store_id, fdet.petro_id, fdet.quantity
	INTO _old_date, _organization_id, _old_store_id, _petro_id, _old_quantity
	FROM petro_sale_detail as fdet, petro_sale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.petro_sale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_store_id<>_store_id OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- petro_in_stock
			SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id AND store_id=_old_store_id;
			UPDATE petro_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- petro_in_stock
			SELECT id INTO _in_stock_id FROM petro_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND petro_id=_petro_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO petro_in_stock(`day`, organization_id, petro_id, store_id, in_stock) VALUES (_date, _organization_id, _petro_id, _store_id, -_quantity);
			ELSE
				UPDATE petro_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE petro_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleShell`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, in _customer_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	declare _old_paid, _old_debt double default 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id, f.created_date, f.account_id, f.customer_id, f.paid, f.debt 
	INTO _organization_id, _old_date, _old_account_id, _old_customer_id, _old_paid, _old_debt
	FROM shell_sale as f, employee AS eo 
	WHERE f.id=_id and f.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_account_id<>_account_id or _old_customer_id<>_customer_id or _old_paid<>_paid or _old_debt<>_debt then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount - _old_debt WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _paid);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _paid WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _debt);
			ELSE
				UPDATE customer_in_stock SET amount=amount + _debt WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE shell_sale SET total=_total
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note 
		, customer_id=_customer_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleShellDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _shell_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.shell_id, fdet.quantity
	INTO _old_date, _organization_id, _shell_id, _old_quantity
	FROM shell_sale_detail fdet, shell_sale AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.shell_sale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			UPDATE shell_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, -_quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE shell_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellImport`(IN _id INT, IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id int, IN _note TEXT, in _vendor_id int)
BEGIN
	DECLARE _old_shell_id, _old_vendor_id, _is_shell_12, _is_shell_45, _date_diff, _in_stock_id, _old_quantity, _organization_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT i.shell_id, i.vendor_id, i.quantity, i.amount, i.account_id, eo.organization_id, i.created_date 
	INTO _old_shell_id, _old_vendor_id, _old_quantity, _old_amount, _old_account_id, _organization_id, _old_date
	FROM shell_import as i, employee as eo
	WHERE i.id=_id and i.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_shell_id<>_shell_id OR _old_quantity<>_quantity or _old_vendor_id<>_vendor_id or _old_account_id<>_account_id THEN
		SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_old_shell_id AND s.kind_id=sk.id AND sk.weight=12;
		SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_old_shell_id AND s.kind_id=sk.id AND sk.weight=45;
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_old_shell_id;
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 - _old_quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 - _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		set _is_shell_12=0;
		set _is_shell_45=0;
		SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
		SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				IF _is_shell_12=1 THEN
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, _quantity, 0);
				ELSE
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, 0, _quantity);
				END IF;
			ELSE
				IF _is_shell_12=1 THEN
					UPDATE vendor_in_stock SET shell_12=shell_12 + _quantity WHERE id=_in_stock_id;
				ELSE
					UPDATE vendor_in_stock SET shell_45=shell_45 + _quantity WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE shell_import SET shell_id=_shell_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, price=_price
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, vendor_id=_vendor_id
	WHERE id=_id;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE shell_id=_old_shell_id AND vendor_id=_old_vendor_id and organization_id=_organization_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity-_old_quantity WHERE id=_in_stock_id;
	END IF;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE shell_id=_shell_id AND vendor_id=_vendor_id AND organization_id=_organization_id;
	IF _in_stock_id=0 THEN
		INSERT INTO shell_vendor(organization_id, shell_id, vendor_id, quantity) VALUES(_organization_id, _shell_id, _vendor_id, _quantity);
	ELSE
		UPDATE shell_vendor SET quantity=quantity+_quantity WHERE id=_in_stock_id;
	END IF;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturn`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE shell_return SET customer_id=_customer_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, vehicle_id=_vehicle_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnDetail`(IN _id INT, IN _quantity INT, IN _created_date VARCHAR(20), in _customer_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _is_shell_12, _is_shell_45, _shell_id, _old_quantity, _old_customer_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.customer_id, fdet.shell_id, fdet.quantity
	INTO _old_date, _organization_id, _old_customer_id, _shell_id, _old_quantity
	FROM shell_return_detail as fdet, shell_return AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.shell_return_id AND f.created_employee_id=eo.id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	if _old_date<>_date or _old_quantity<>_quantity or _old_customer_id<>_customer_id then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND customer_id=_old_customer_id;
			IF _is_shell_12=1 THEN
				UPDATE customer_in_stock SET shell_12=shell_12 + _old_quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE customer_in_stock SET shell_45=shell_45 + _old_quantity WHERE id=_in_stock_id;
			END IF;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0  AND customer_id=_customer_id;
			IF _in_stock_id=0 THEN
				IF _is_shell_12=1 THEN
					INSERT INTO customer_in_stock(`day`, customer_id, shell_12, shell_45) VALUES (_date, _customer_id, -_quantity, 0);
				ELSE
					INSERT INTO customer_in_stock(`day`, customer_id, shell_12, shell_45) VALUES (_date, _customer_id, 0, -_quantity);
				END IF;
			ELSE
				IF _is_shell_12=1 THEN
					UPDATE customer_in_stock SET shell_12=shell_12 - _quantity WHERE id=_in_stock_id;
				ELSE
					UPDATE customer_in_stock SET shell_45=shell_45 - _quantity WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE shell_return_detail SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellReturnSupplier` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellReturnSupplier` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnSupplier`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE shell_return_supplier SET vendor_id=_vendor_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, vehicle_id=_vehicle_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellReturnSupplierDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellReturnSupplierDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnSupplierDetail`(IN _id INT, IN _quantity INT, IN _created_date VARCHAR(20), IN _vendor_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _is_shell_12, _is_shell_45, _shell_id, _old_quantity, _old_vendor_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, fdet.shell_id, fdet.quantity INTO _old_date, _organization_id, _old_vendor_id, _shell_id, _old_quantity
	FROM shell_return_supplier_detail fdet, shell_return_supplier AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.shell_return_supplier_id AND f.created_employee_id=eo.id;
	
	SELECT 1 INTO _is_shell_12 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=12;
	SELECT 1 INTO _is_shell_45 FROM shell AS s, shell_kind AS sk WHERE s.id=_shell_id AND s.kind_id=sk.id AND sk.weight=45;
	
	if _old_date<>_date or _old_quantity<>_quantity or _old_vendor_id<>_vendor_id then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			UPDATE shell_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			IF _is_shell_12=1 THEN
				UPDATE vendor_in_stock SET shell_12=shell_12 + _old_quantity WHERE id=_in_stock_id;
			ELSE
				UPDATE vendor_in_stock SET shell_45=shell_45 + _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_in_stock
			SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, -_quantity);
			ELSE
				UPDATE shell_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				IF _is_shell_12=1 THEN
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, -_quantity, 0);
				ELSE
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, shell_12, shell_45) VALUES (_date, _organization_id, _vendor_id, 0, -_quantity);
				END IF;
			ELSE
				IF _is_shell_12=1 THEN
					UPDATE vendor_in_stock SET shell_12=shell_12 - _quantity WHERE id=_in_stock_id;
				ELSE
					UPDATE vendor_in_stock SET shell_45=shell_45 - _quantity WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE shell_return_supplier_detail SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellVendorDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellVendorDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellVendorDetail`(IN _id INT, IN _vendor_id INT)
BEGIN
	update shell_vendor set vendor_id=_vendor_id where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShieldDecrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShieldDecrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShieldDecrease`(IN _id INT, IN _quantity INT, IN _note TEXT, IN _vendor_id INT)
BEGIN
	DECLARE _organization_id, _old_vendor_id, _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	DECLARE _date DATE;
		
	SELECT i.created_date, eo.organization_id, i.vendor_id, i.quantity
	INTO _date, _organization_id, _old_vendor_id, _old_quantity
	FROM shield_decrease AS i, employee AS eo
	WHERE i.id=_id AND i.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM shield_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_old_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE shield_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _quantity);
		ELSE
			UPDATE shield_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE shield_decrease SET quantity=_quantity, note=_note, vendor_id=_vendor_id WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShieldImport`(IN _id INT, IN _quantity INT, IN _note TEXT, in _vendor_id int)
BEGIN
	DECLARE _organization_id, _old_vendor_id, _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	DECLARE _date DATE;
		
	SELECT i.created_date, eo.organization_id, i.vendor_id, i.quantity
	INTO _date, _organization_id, _old_vendor_id, _old_quantity
	FROM shield_import AS i, employee AS eo
	WHERE i.id=_id AND i.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shield_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM shield_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_old_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE shield_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM shield_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shield_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _quantity);
		ELSE
			UPDATE shield_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE shield_import SET quantity=_quantity, note=_note, vendor_id=_vendor_id WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTransportService`(IN _id INT, IN _vendor_id INT, IN _customer_id VARCHAR(255), IN _transporter_id INT
	, IN _charge_for_vendor INT, IN _charge_for_customer INT, IN _created_date VARCHAR(20), IN _in_quantity double, IN _out_quantity double
	, IN _price DOUBLE, IN _price_diff DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _rate_diff DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_customer_id, _old_transporter_id, _old_account_id, _organization_vendor_id, _organization_transport_vendor_id INT DEFAULT 0;
	DECLARE _money_organization_id, _vendor_vendor_id, _customer_customer_id, _old_money_organization_id, _old_vendor_vendor_id, _old_customer_customer_id INT DEFAULT 0;
	DECLARE _money_amount, _vendor_amount, _customer_amount, _old_money_amount, _old_vendor_amount, _old_customer_amount DOUBLE DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.account_id, f.vendor_id, f.customer_id, f.transporter_id
		, f.money_organization_id, f.money_amount, f.vendor_vendor_id, f.vendor_amount, f.customer_customer_id, f.customer_amount
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_account_id, _old_vendor_id, _old_customer_id, _old_transporter_id
		, _old_money_organization_id, _old_money_amount, _old_vendor_vendor_id, _old_vendor_amount, _old_customer_customer_id, _old_customer_amount
	FROM transport_service AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT equal_organization_id INTO _organization_vendor_id FROM vendor WHERE id=_vendor_id;
	
	SELECT equal_organization_id INTO _organization_transport_vendor_id FROM vendor WHERE id=_transporter_id;
	
	IF _organization_vendor_id<>_organization_id THEN
		SET _organization_vendor_id=0;
	END IF;
	
	IF _organization_transport_vendor_id<>_organization_id THEN
		SET _organization_transport_vendor_id=0;
	END IF;
	
	IF _charge_for_vendor=1 THEN	-- ben ban chiu
		IF _organization_vendor_id<>0 THEN	-- ben ban la minh
			IF _vendor_id<>_transporter_id THEN	-- minh khong phai la ben van chuyen
				SET _money_organization_id = _organization_vendor_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = _debt;
			END IF;
		ELSE -- ben ban la cong ty khac
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_transport_vendor_id;
				SET _money_amount = _paid;
				SET _vendor_vendor_id = _vendor_id;
				SET _vendor_amount = -_debt;
			END IF;
		END IF;
	ELSEIF _charge_for_customer=1 THEN	-- ben mua chiu
		IF _customer_id=0 THEN	-- ben mua la minh
			IF _organization_transport_vendor_id=0 THEN	-- minh khong phai la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = _debt;
			END IF;
		ELSE
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = _paid;
				SET _customer_customer_id = _customer_id;
				SET _customer_amount = _debt;
			END IF;
		END IF;
	END IF;
	
	IF _old_date<>_date OR _old_money_organization_id<>_money_organization_id OR _old_money_amount<>_money_amount OR _old_vendor_vendor_id<>_vendor_vendor_id 
		or _old_vendor_amount<>_vendor_amount or _old_customer_customer_id<>_customer_customer_id or _old_customer_amount<>_customer_amount 
		OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			IF _old_money_organization_id<>0 THEN
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_old_money_organization_id AND account_id=_old_account_id;
				UPDATE money_in_stock SET in_stock=in_stock - _old_money_amount WHERE id=_in_stock_id;
			end if;
	
			if _old_vendor_vendor_id<>0 then
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_vendor_id;
				UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_vendor_amount WHERE id=_in_stock_id;
			end if;
	
			if _old_customer_customer_id<>0 then
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_customer_id;
				UPDATE customer_in_stock SET transport_amount=transport_amount - _old_customer_amount WHERE id=_in_stock_id;
			end if;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			IF _money_organization_id<>0 THEN
				SET _in_stock_id=0;
				-- money_in_stock
				SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_money_organization_id AND account_id=_account_id;
				IF _in_stock_id=0 THEN
					INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _money_organization_id, _account_id, _money_amount);
				ELSE
					UPDATE money_in_stock SET in_stock=in_stock + _money_amount WHERE id=_in_stock_id;
				END IF;
			end if;
			
			IF _vendor_vendor_id<>0 THEN
				SET _in_stock_id=0;
				-- vendor_in_stock
				SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_vendor_id;
				IF _in_stock_id=0 THEN
					INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_vendor_id, _vendor_amount);
				ELSE
					UPDATE vendor_in_stock SET transport_amount=transport_amount + _vendor_amount WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			IF _customer_customer_id<>0 THEN
				SET _in_stock_id=0;
				-- customer_in_stock
				SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_customer_id;
				IF _in_stock_id=0 THEN
					INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_customer_id, _customer_amount);
				ELSE
					UPDATE customer_in_stock SET transport_amount=transport_amount + _customer_amount WHERE id=_in_stock_id;
				END IF;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE transport_service SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, vendor_id=_vendor_id
		, customer_id=_customer_id
		, transporter_id=_transporter_id
		, charge_for_vendor=_charge_for_vendor
		, charge_for_customer=_charge_for_customer
		, in_quantity=_in_quantity
		, out_quantity=_out_quantity
		, price=_price
		, price_diff=_price_diff
		, price_diff=_price_diff
		, amount=_amount
		, paid=_paid
		, debt=_debt
		, rate=_rate
		, rate_diff=_rate_diff
		, account_id=_account_id
		, note=_note
		, money_organization_id=_money_organization_id
		, money_amount=_money_amount
		, vendor_vendor_id=_vendor_vendor_id
		, vendor_amount=_vendor_amount
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateTripFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateTripFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTripFee`(IN _id INT, IN _vehicle_id INT, IN _created_date VARCHAR(20), in _quantity int
	, in _price double, IN _amount DOUBLE, IN _fee text, IN _note TEXT)
BEGIN
	UPDATE trip_fee SET vehicle_id=_vehicle_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, price=_price	
		, amount=_amount
		, fee=_fee
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleIn` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleIn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleIn`(IN _id INT, IN _created_date VARCHAR(20), IN _vehicle_out_id INT, IN _note TEXT)
BEGIN
	UPDATE vehicle_in SET vehicle_out_id=_vehicle_out_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleInAccessoryDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleInAccessoryDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInAccessoryDetail`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _accessory_id, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.accessory_id, fdet.quantity INTO _old_date, _organization_id, _accessory_id, _old_quantity
	FROM vehicle_in_accessory_detail fdet, vehicle_in AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.vehicle_in_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			IF _in_stock_id<>0 THEN
				UPDATE accessory_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- accessory_in_stock
			SELECT id INTO _in_stock_id FROM accessory_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND accessory_id=_accessory_id;
			IF _in_stock_id=0 THEN
				INSERT INTO accessory_in_stock(`day`, organization_id, accessory_id, in_stock) VALUES (_date, _organization_id, _accessory_id, _quantity);
			ELSE
				UPDATE accessory_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE vehicle_in_accessory_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleInDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleInDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInDetail`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sv.shell_id, fdet.quantity INTO _old_date, _organization_id, _vendor_id, _shell, _old_quantity
	FROM vehicle_in_detail fdet, vehicle_in AS f, shell_vendor AS sv
	WHERE fdet.id=_id and f.id=fdet.vehicle_in_id AND sv.id=fdet.shell_id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id<>0 THEN
				UPDATE shell_gas_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, _quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE vehicle_in_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleInReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleInReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInReturnShellDetail`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _shell_id, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.shell_id, fdet.quantity INTO _old_date, _organization_id, _shell_id, _old_quantity
	FROM vehicle_in_return_shell_detail fdet, vehicle_in AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.vehicle_in_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
	END WHILE;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	end if;
	
	UPDATE vehicle_in_return_shell_detail SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleOut` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleOut` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleOut`(IN _id INT, IN _created_date VARCHAR(20), IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE vehicle_out SET vehicle_id=_vehicle_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleOutDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleOutDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleOutDetail`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _shell, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, sv.organization_id, sv.vendor_id, sv.shell_id, fdet.quantity INTO _old_date, _organization_id, _vendor_id, _shell, _old_quantity
	FROM vehicle_out_detail fdet, vehicle_out AS f, shell_vendor AS sv
	WHERE fdet.id=_id and f.id=fdet.vehicle_out_id AND sv.id=fdet.shell_id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_old_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id<>0 THEN
				UPDATE shell_gas_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- shell_gas_in_stock
			SELECT ss.id INTO _in_stock_id 
			FROM shell_gas_in_stock AS ss, shell_vendor AS sv
			WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.shell_vendor_id=sv.id AND sv.organization_id=_organization_id AND sv.vendor_id=_vendor_id AND sv.shell_id=_shell;
			IF _in_stock_id=0 THEN
				INSERT INTO shell_gas_in_stock(`day`, shell_vendor_id, in_stock) 
				SELECT _date, id, -_quantity FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=_shell;
			ELSE
				UPDATE shell_gas_in_stock SET in_stock=in_stock - _quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	end if;
	
	UPDATE vehicle_out_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleOutEmployeeDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleOutEmployeeDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleOutEmployeeDetail`(IN _id INT, IN _employee_id INT, IN _note text)
BEGIN
	UPDATE vehicle_out_employee_detail SET employee_id=_employee_id, note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVendor`(IN _name VARCHAR(255), IN _address VARCHAR(255), IN _tax VARCHAR(50), IN _phone VARCHAR(50)
	, IN _fax VARCHAR(50), IN _code VARCHAR(20), IN _organization_id INT, IN _status INT, IN _equal_organization_id INT, in _has_stock int
	, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, IN _is_transport INT, in _id INT)
BEGIN
	DECLARE _vendor_organization_id, _old_organization INT DEFAULT 0;
	
	select organization_id into _old_organization from vendor where id=_id;
		
	SELECT id INTO _vendor_organization_id FROM vendor_organization WHERE vendor_id=_id AND organization_id=_old_organization;
	
	IF _vendor_organization_id=0 THEN
		INSERT INTO vendor_organization(vendor_id, organization_id) VALUES(_id, _organization_id);
	else
		update vendor_organization set organization_id=_organization_id where id=_vendor_organization_id;
	END IF;
	update vendor set
		`name`=_name
		, address=_address
		, tax=_tax
		, phone=_phone
		, fax=_fax
		, `code`=_code
		, organization_id=_organization_id
		, `status`=_status
		, equal_organization_id=_equal_organization_id
		, has_stock=_has_stock
		, is_gas=_is_gas
		, is_petro=_is_petro
		, is_good=_is_good
		, is_transport=_is_transport
	where id=_id;
	
	update shell set `status`=_status where vendor_id=_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
