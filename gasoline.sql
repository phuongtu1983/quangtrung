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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auto` */

insert  into `auto`(`id`,`auto_date`,`auto_name`) values (49,'2019-01-24','in_stock'),(50,'2019-01-25','in_stock'),(51,'2019-01-26','in_stock'),(52,'2019-01-27','in_stock'),(53,'2019-01-31','in_stock'),(54,'2019-02-01','in_stock'),(55,'2019-02-04','in_stock'),(56,'2019-02-07','in_stock'),(57,'2019-02-12','in_stock');

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
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`code`,`name`,`organization_id`,`status`,`kind`,`address`,`phone`,`bank_account`,`tax`,`presenter`,`presenter_position`,`discount`,`is_gas`,`is_petro`,`is_good`) values (1,'TP','Công ty TNHH Gốm Tân Phát',1,1,2,'Lô số 164, Đường N1, Cụm công nghiệp Gốm sứ, Ấp 4, xã Tân Hạnh, Tp. Biên Hòa, Tỉnh Đồng Nai','0915. 87.36.37','','3603454432','Nguyễn Thị Thanh Thúy','Giám đốc','',1,0,0),(2,'LPGHH','Cửa hàng LPG Huy Hoàng',1,1,1,'Số 125/5 ấp Phú Tâm, xã Hòa Hiệp, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','0988789713','','123456789','Nguyễn Tiến Công','Giám đốc','CK1,HT5K',1,0,0),(9,'STXM','Cửa hàng Gas Sơn Trang',1,1,2,'Quốc lộ 55','2543777888','','','','','',1,0,0),(11,'TMPB','Cửa hàng LPG Tài Mai',1,1,2,'','','','','','','',0,0,0),(12,'ahtl','Ánh Hồng',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(13,'bbpt','Ba Bế',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(14,'bbl','Bảy Bàu Lâm',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(15,'bpb','Bắc Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(16,'hsbc','Hiền Soi Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(17,'mtlg','Mười Thuý',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(18,'thxm','Tấn Hùng',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(19,'tlpt','Thanh Liêm',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(20,'bcpb','Bé Cầu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(21,'chpb','Chí Hiếu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(22,'btpb','Bảy Thành',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(23,'bupb','Bưởi Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(24,'calg','Chị An',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(25,'capt','Carmelia Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(26,'qkxm','Quyền Kim',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(27,'ctsr','Chình Thức',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(28,'dhhb','Diệu Hiền',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(29,'dtbk','Duy Tuyên',1,1,2,'Bưng Kè, Xã Hoà Hiệp Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(30,'ddnth','Được Duy Nhất',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(31,'dpbc','Đại Phát',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(32,'gcbc','Gái Cường',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(33,'hbc','Hai Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(34,'hctl','Huyền Chương',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(35,'hdbk','Hoa Đào',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(36,'hhxm','Huy Hoàng Xuyên Mộc',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(37,'hhbk','Hà Hương Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(38,'hlbk','Hoàng Lịch Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(39,'hmsm','Hán Minh',1,1,2,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(40,'hphh','Hùng Phát',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(41,'hqpt','Hoàng Quân',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(42,'hvhb','Hoàn Vân',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(43,'kbcm','Khánh Bằng',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(44,'kclg','Kim Chi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(45,'ksbc','Kim Sương',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(46,'ktbr','Kim Trọng Bưng Riềng',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(47,'kthtl','Kim Thuý Hậu',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(48,'khhh','Kim Hoa',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(49,'lpb','Loan Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(50,'lbc','Linh Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(51,'lhbk','Lý Hải',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(52,'lpt','Liên Đội 3',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(53,'lspb','Lịch Sử',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(54,'lthh','Lài Thi',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(55,'ltsr','Long Tứ',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(56,'mcpb','Minh Châu Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(57,'mdbc','Mỹ Dung',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(58,'mdsr','Minh Điệp',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(59,'mdubc','Minh Đức',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(60,'mnbc','Mầm Non Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(61,'mtbl','Minh Tuấn',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(62,'mtlg','Minh Tú',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(63,'ndpb','Nguyễn Du',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(64,'ntbl','Nguyên Thảo',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(65,'nttt','Ngọc Tâm',1,1,2,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(66,'pd46','Phạm Đăng',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(67,'plbc','Phú Lộc',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(68,'pm46','Phúc Mai',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(69,'pt46','Phụng Tập',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(70,'ptsr','Phương Thảo Sông Ray',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(71,'phsm','Phú Hoàng',1,1,2,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(72,'pthsr','Pháp Thanh',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(73,'qhh','Quang Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(74,'qvpb','Quang Vinh',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(75,'shbl','Sỹ Hường',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(76,'shbc','Sáu Huế',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(77,'sbtr','Sanh Trại Gà',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(78,'stxm','Sơn Trang',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(79,'txm','Tùng Gas',1,1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(80,'thh','Tâm Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(81,'tmpb','Tài Mai',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(82,'tbtr','Thanh Trại Gà',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(83,'tdbc','Thành Dung',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(84,'tdpt','Thảo Đại',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(85,'hpt','Huyền Trại Gà',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(86,'tghb','Trường Giang',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(87,'tbk','Tiên Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(88,'t46','Truyền',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',0,0,0),(89,'tmbc','Thiên Mướp',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(90,'ttpb','Thanh Tuý',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(91,'tslg','Tiến Sơn',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(92,'ttpt','Trung Thuận',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(93,'ttbc','Trung Thu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(94,'ttlg','Trung Thành',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(95,'tth','Thanh Tân Thắng',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(96,'tttt','Thành Tâm',1,1,2,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(97,'athh','Ái Thu',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(98,'ttbc','Tuấn Thanh',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(99,'tpt','Thanh Gò Cà Phước Thuận',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(100,'tktl','Thuỳ Khuyên',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(101,'tbk','Thơ Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(102,'thpt','Thuý Hoàng Phước Tân',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(103,'thpt','Toan Hoa',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(104,'tptl','Thuý Phương',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(105,'ttl','Thị Tân Lâm',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(106,'unpb','Út Nuôi',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(107,'vb46','Văn Bé',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(108,'vqhh','Vũ Quang',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(109,'xdbc','Xuân Đông',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(110,'xhh','Xuân Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(111,'xttl','Xuân Tú',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(112,'mhbc','Minh Hùng',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(113,'ta46','Tuấn Anh 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(114,'tth','Thuý Cầu Kiều',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(115,'dpt','Hùng Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(116,'htbk','Hương Thơm',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(117,'mpb','Mai Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(118,'ttbg','Tình Thuỷ',1,1,2,'Xã Bình Giã, Huyện Châu Đức, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(119,'hhhtn','Hồng Huyên',1,1,2,'Xã Hàm Thuận Nam, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(120,'ptpt','Phương Thảo Phan Thiết',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(121,'hhh','Huệ Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(122,'dhh','Dũng Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(123,'mhhb','Mỹ Hạnh',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(124,'htdn','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh',1,1,2,'39/1 Khu phố 3, Phường Tam Hiệp, Tp. Biên Hoà, Tỉnh Đồng Nai','','','3600874037','','','',1,0,0),(125,'cnpt','Chi nhánh Phan Thiết',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(126,'dhh','Đoàn Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(127,'mcbc','Minh Châu Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(128,'bdqt','Bò Đốt Quang Trung',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(129,'gxbc','Giang Xuân Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(130,'vht','Vàng Hồ Tràm',1,1,2,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(131,'tbk','Thắng Bàu Ma Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(132,'qth','Quang Thắng Hải',1,1,2,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(133,'vpb','Vân Bà Tô',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(134,'blqt','Bán lẻ',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(135,'tbxt','Tình Bắc',1,1,2,'Xã Xuân Tây, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(136,'hpbk','Hiếu Phượng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(137,'hhcm','Huy Hoàng Cẩm Mỹ',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(138,'ktbc','Kiều Trang',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(139,'tbk','Trọng Cầu 5',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(140,'th10','Tạp Hoá 10',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(141,'hcbc','Huy Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(142,'qpbtr','Quốc Phong',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(143,'hcplg','Hùng Cường Phát',1,1,2,'Xã Long Giao, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(144,'tnbk','Tuyết Nhi',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(145,'mhxm','Minh Hiền',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(146,'dpxd','Dũng Phượng',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(147,'c46','Cường 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(148,'athtn','Gas An Toàn Hàm Thuận Nam',1,1,2,'Thôn Lập Đức, Xã Tân Lập, Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','','',1,0,0),(149,'dhh','Diễm Đội 2 Hoà Hội',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(150,'pnbk','Phúc Nguyên',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(151,'hhh','Hoa Đội 2',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(152,'spo','Công ty TNHH Supor Việt Nam',1,1,2,'Lô A-1-CN, KCN Mỹ Phước, phường Mỹ Phước, Thị Xã Bến Cát, Tỉnh Bình Dương','','','','','','',1,0,0),(153,'thsr','Thanh Hà',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(154,'sbk','Sơn Bưng Kè',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(155,'hhb','Hoà Hoà Bình',1,1,2,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(156,'nhbtr','Ngọc Huyền',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(157,'htbc','Huyền Trang',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(158,'ttlg','Thanh Tuấn Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(159,'hpbr','Hương Phong Hồ Cốc',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(160,'anbk','Ánh Nhi',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(161,'nhcm','Nở Hoài',1,1,2,'Xã Hoàn Quân, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(162,'thxm','Triệu Huy',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(163,'ybtr','Tạp hoá Yến',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(164,'hbr','Hà Bưng Riềng',1,1,2,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(165,'tha','Công ty TNHH Dầu Khí Thiên Hà',1,1,2,'95 Trịnh Đình Thảo, phường Phú Trung, quận Tân Phú, Tp. HCM','','','','','','',1,0,0),(166,'ltl','Loan Tân Lâm',1,1,2,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(167,'nvqt','Nhân Viên Quang Trung',1,1,2,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(168,'dpt','Dung Cây Điệp',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(169,'pppt','Phương Phát',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(170,'udpt','Uyên Đan',1,1,2,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','','',1,0,0),(171,'htcm','Hà Tuấn Cẩm Mỹ',1,1,2,'Xã Xuân Bảo, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(172,'ntlg','Ngọc Tân Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(173,'h46','Hoè Trại Gà 46',1,1,2,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(174,'vuc','Công ty TNHH Khí Hoá Lỏng Việt Úc',1,1,2,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(175,'alcm','Ánh Linh',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(176,'hbchau','Hải Bình Châu Xuyên Mộc',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(177,'thcm','Trí Hải',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(178,'mphh','Minh Phương',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(179,'qclg','Quang Châu',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(180,'hhh','Hồng Đội 5',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(181,'thh','Tuyết Đội 2',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(182,'athtb','Gas An Toàn Hàm Thuận Bắc',1,1,2,'Xã Hàm Thắng, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','','',1,0,0),(183,'ttbl','Thảo Toàn',1,1,2,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(184,'kacm','Kim Anh',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(185,'bpcm','Bảy Phước',1,1,2,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(186,'hhh','Hiền Đội 5',1,1,2,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(187,'bapb','Bình An',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(188,'bmpb','Bình Minh Phước Bửu',1,1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(189,'xhtb','Gas Xuân Hàm Thuận Bắc',1,1,2,'Thị trấn Phú Long, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','','',1,0,0),(190,'vcm','Gas Vui',1,1,2,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(191,'hbc','Ngọc Hà Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(192,'klhtn','Kim Liên',1,1,2,'Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','','',1,0,0),(193,'hlcm','Hải Linh',1,1,2,'Xã Lâm San, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','','',1,0,0),(194,'mtbc','Minh Trọng',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(195,'tlg','Tuấn Lagi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(196,'hpt','Cô Hương Phước Tân',1,1,2,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(197,'kthi','Kế Thi',1,1,2,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','','',1,0,0),(198,'dbc','Đoàn Bình Châu',1,1,2,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(199,'adung','Anh Dũng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(200,'hdung','Hoa Dũng',1,1,2,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','','',1,0,0),(201,'chue','Chị Huế Châu Đức',1,1,2,'','','','','','','',1,0,0),(202,'ttung','Thanh Tùng Châu Đức',1,1,2,'Châu Đức, Bà Rịa Vũng Tàu','','','','','','',1,0,0),(203,'bhoan','Bảo Hoan Châu Đức',1,1,2,'','','','','','','',1,0,0),(204,'hnghia','Hiếu Nghĩa',1,1,2,'','','','','','','',1,0,0);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_in_stock` */

insert  into `customer_in_stock`(`id`,`day`,`customer_id`,`shell_12`,`shell_45`,`amount`) values (19711,'2019-01-24',1,0,0,0),(19712,'2019-01-24',2,0,0,0),(19713,'2019-01-24',9,0,0,0),(19714,'2019-01-24',11,0,0,0),(19715,'2019-01-24',12,0,0,0),(19716,'2019-01-24',13,0,0,0),(19717,'2019-01-24',14,0,0,0),(19718,'2019-01-24',15,0,0,0),(19719,'2019-01-24',16,0,0,0),(19720,'2019-01-24',17,0,0,0),(19721,'2019-01-24',18,0,0,0),(19722,'2019-01-24',19,0,0,0),(19723,'2019-01-24',20,0,0,0),(19724,'2019-01-24',21,0,0,0),(19725,'2019-01-24',22,0,0,0),(19726,'2019-01-24',23,0,0,0),(19727,'2019-01-24',24,0,0,0),(19728,'2019-01-24',25,0,0,0),(19729,'2019-01-24',26,0,0,0),(19730,'2019-01-24',27,0,0,0),(19731,'2019-01-24',28,0,0,0),(19732,'2019-01-24',29,0,0,0),(19733,'2019-01-24',30,0,0,0),(19734,'2019-01-24',31,0,0,0),(19735,'2019-01-24',32,0,0,0),(19736,'2019-01-24',33,0,0,0),(19737,'2019-01-24',34,0,0,0),(19738,'2019-01-24',35,0,0,0),(19739,'2019-01-24',36,0,0,0),(19740,'2019-01-24',37,0,0,0),(19741,'2019-01-24',38,0,0,0),(19742,'2019-01-24',39,0,0,0),(19743,'2019-01-24',40,0,0,0),(19744,'2019-01-24',41,0,0,0),(19745,'2019-01-24',42,0,0,0),(19746,'2019-01-24',43,0,0,0),(19747,'2019-01-24',44,0,0,0),(19748,'2019-01-24',45,0,0,0),(19749,'2019-01-24',46,0,0,0),(19750,'2019-01-24',47,0,0,0),(19751,'2019-01-24',48,0,0,0),(19752,'2019-01-24',49,0,0,0),(19753,'2019-01-24',50,0,0,0),(19754,'2019-01-24',51,0,0,0),(19755,'2019-01-24',52,0,0,0),(19756,'2019-01-24',53,0,0,0),(19757,'2019-01-24',54,0,0,0),(19758,'2019-01-24',55,0,0,0),(19759,'2019-01-24',56,0,0,0),(19760,'2019-01-24',57,0,0,0),(19761,'2019-01-24',58,0,0,0),(19762,'2019-01-24',59,0,0,0),(19763,'2019-01-24',60,0,0,0),(19764,'2019-01-24',61,0,0,0),(19765,'2019-01-24',62,0,0,0),(19766,'2019-01-24',63,0,0,0),(19767,'2019-01-24',64,0,0,0),(19768,'2019-01-24',65,0,0,0),(19769,'2019-01-24',66,0,0,0),(19770,'2019-01-24',67,0,0,0),(19771,'2019-01-24',68,0,0,0),(19772,'2019-01-24',69,0,0,0),(19773,'2019-01-24',70,0,0,0),(19774,'2019-01-24',71,0,0,0),(19775,'2019-01-24',72,0,0,0),(19776,'2019-01-24',73,0,0,0),(19777,'2019-01-24',74,0,0,0),(19778,'2019-01-24',75,0,0,0),(19779,'2019-01-24',76,0,0,0),(19780,'2019-01-24',77,0,0,0),(19781,'2019-01-24',78,0,0,0),(19782,'2019-01-24',79,0,0,0),(19783,'2019-01-24',80,0,0,0),(19784,'2019-01-24',81,0,0,0),(19785,'2019-01-24',82,0,0,0),(19786,'2019-01-24',83,0,0,0),(19787,'2019-01-24',84,0,0,0),(19788,'2019-01-24',85,0,0,0),(19789,'2019-01-24',86,0,0,0),(19790,'2019-01-24',87,0,0,0),(19791,'2019-01-24',88,0,0,0),(19792,'2019-01-24',89,0,0,0),(19793,'2019-01-24',90,0,0,0),(19794,'2019-01-24',91,0,0,0),(19795,'2019-01-24',92,0,0,0),(19796,'2019-01-24',93,0,0,0),(19797,'2019-01-24',94,0,0,0),(19798,'2019-01-24',95,0,0,0),(19799,'2019-01-24',96,0,0,0),(19800,'2019-01-24',97,0,0,0),(19801,'2019-01-24',98,0,0,0),(19802,'2019-01-24',99,0,0,0),(19803,'2019-01-24',100,0,0,0),(19804,'2019-01-24',101,0,0,0),(19805,'2019-01-24',102,0,0,0),(19806,'2019-01-24',103,0,0,0),(19807,'2019-01-24',104,0,0,0),(19808,'2019-01-24',105,0,0,0),(19809,'2019-01-24',106,0,0,0),(19810,'2019-01-24',107,0,0,0),(19811,'2019-01-24',108,0,0,0),(19812,'2019-01-24',109,0,0,0),(19813,'2019-01-24',110,0,0,0),(19814,'2019-01-24',111,0,0,0),(19815,'2019-01-24',112,0,0,0),(19816,'2019-01-24',113,0,0,0),(19817,'2019-01-24',114,0,0,0),(19818,'2019-01-24',115,0,0,0),(19819,'2019-01-24',116,0,0,0),(19820,'2019-01-24',117,0,0,0),(19821,'2019-01-24',118,0,0,0),(19822,'2019-01-24',119,0,0,0),(19823,'2019-01-24',120,0,0,0),(19824,'2019-01-24',121,0,0,0),(19825,'2019-01-24',122,0,0,0),(19826,'2019-01-24',123,0,0,0),(19827,'2019-01-24',124,0,0,0),(19828,'2019-01-24',125,0,0,0),(19829,'2019-01-24',126,0,0,0),(19830,'2019-01-24',127,0,0,0),(19831,'2019-01-24',128,0,0,0),(19832,'2019-01-24',129,0,0,0),(19833,'2019-01-24',130,0,0,0),(19834,'2019-01-24',131,0,0,0),(19835,'2019-01-24',132,0,0,0),(19836,'2019-01-24',133,0,0,0),(19837,'2019-01-24',134,0,0,0),(19838,'2019-01-24',135,0,0,0),(19839,'2019-01-24',136,0,0,0),(19840,'2019-01-24',137,0,0,0),(19841,'2019-01-24',138,0,0,0),(19842,'2019-01-24',139,0,0,0),(19843,'2019-01-24',140,0,0,0),(19844,'2019-01-24',141,0,0,0),(19845,'2019-01-24',142,0,0,0),(19846,'2019-01-24',143,0,0,0),(19847,'2019-01-24',144,0,0,0),(19848,'2019-01-24',145,0,0,0),(19849,'2019-01-24',146,0,0,0),(19850,'2019-01-24',147,0,0,0),(19851,'2019-01-24',148,0,0,0),(19852,'2019-01-24',149,0,0,0),(19853,'2019-01-24',150,0,0,0),(19854,'2019-01-24',151,0,0,0),(19855,'2019-01-24',152,0,0,0),(19856,'2019-01-24',153,0,0,0),(19857,'2019-01-24',154,0,0,0),(19858,'2019-01-24',155,0,0,0),(19859,'2019-01-24',156,0,0,0),(19860,'2019-01-24',157,0,0,0),(19861,'2019-01-24',158,0,0,0),(19862,'2019-01-24',159,0,0,0),(19863,'2019-01-24',160,0,0,0),(19864,'2019-01-24',161,0,0,0),(19865,'2019-01-24',162,0,0,0),(19866,'2019-01-24',163,0,0,0),(19867,'2019-01-24',164,0,0,0),(19868,'2019-01-24',165,0,0,0),(19869,'2019-01-24',166,0,0,0),(19870,'2019-01-24',167,0,0,0),(19871,'2019-01-24',168,0,0,0),(19872,'2019-01-24',169,0,0,0),(19873,'2019-01-24',170,0,0,0),(19874,'2019-01-24',171,0,0,0),(19875,'2019-01-24',172,0,0,0),(19876,'2019-01-24',173,0,0,0),(19877,'2019-01-24',174,0,0,0),(19878,'2019-01-24',175,0,0,0),(19879,'2019-01-24',176,0,0,0),(19880,'2019-01-24',177,0,0,0),(19881,'2019-01-24',178,0,0,0),(19882,'2019-01-24',179,0,0,0),(19883,'2019-01-24',180,0,0,0),(19884,'2019-01-24',181,0,0,0),(19885,'2019-01-24',182,0,0,0),(19886,'2019-01-24',183,0,0,0),(19887,'2019-01-24',184,0,0,0),(19888,'2019-01-24',185,0,0,0),(19889,'2019-01-24',186,0,0,0),(19890,'2019-01-24',187,0,0,0),(19891,'2019-01-24',188,0,0,0),(19892,'2019-01-24',189,0,0,0),(19893,'2019-01-24',190,0,0,0),(19894,'2019-01-24',191,0,0,0),(19895,'2019-01-24',192,0,0,0),(19896,'2019-01-24',193,0,0,0),(19897,'2019-01-24',194,0,0,0),(19898,'2019-01-24',195,0,0,0),(19899,'2019-01-24',196,0,0,0),(19900,'2019-01-24',197,0,0,0),(19901,'2019-01-24',198,0,0,0),(19902,'2019-01-24',199,0,0,0),(19903,'2019-01-24',200,0,0,0),(19904,'2019-01-24',201,0,0,0),(19905,'2019-01-24',202,0,0,0),(19906,'2019-01-24',203,0,0,0),(19907,'2019-01-24',204,0,0,0),(19966,'2019-01-24',1,0,0,0),(19967,'2019-01-24',2,0,0,0),(19968,'2019-01-24',9,0,0,0),(19969,'2019-01-24',11,0,0,0),(19970,'2019-01-24',12,0,0,0),(19971,'2019-01-24',13,0,0,0),(19972,'2019-01-24',14,0,0,0),(19973,'2019-01-24',15,0,0,0),(19974,'2019-01-24',16,0,0,0),(19975,'2019-01-24',17,0,0,0),(19976,'2019-01-24',18,0,0,0),(19977,'2019-01-24',19,0,0,0),(19978,'2019-01-24',20,0,0,0),(19979,'2019-01-24',21,0,0,0),(19980,'2019-01-24',22,0,0,0),(19981,'2019-01-24',23,0,0,0),(19982,'2019-01-24',24,0,0,0),(19983,'2019-01-24',25,0,0,0),(19984,'2019-01-24',26,0,0,0),(19985,'2019-01-24',27,0,0,0),(19986,'2019-01-24',28,0,0,0),(19987,'2019-01-24',29,0,0,0),(19988,'2019-01-24',30,0,0,0),(19989,'2019-01-24',31,0,0,0),(19990,'2019-01-24',32,0,0,0),(19991,'2019-01-24',33,0,0,0),(19992,'2019-01-24',34,0,0,0),(19993,'2019-01-24',35,0,0,0),(19994,'2019-01-24',36,0,0,0),(19995,'2019-01-24',37,0,0,0),(19996,'2019-01-24',38,0,0,0),(19997,'2019-01-24',39,0,0,0),(19998,'2019-01-24',40,0,0,0),(19999,'2019-01-24',41,0,0,0),(20000,'2019-01-24',42,0,0,0),(20001,'2019-01-24',43,0,0,0),(20002,'2019-01-24',44,0,0,0),(20003,'2019-01-24',45,0,0,0),(20004,'2019-01-24',46,0,0,0),(20005,'2019-01-24',47,0,0,0),(20006,'2019-01-24',48,0,0,0),(20007,'2019-01-24',49,0,0,0),(20008,'2019-01-24',50,0,0,0),(20009,'2019-01-24',51,0,0,0),(20010,'2019-01-24',52,0,0,0),(20011,'2019-01-24',53,0,0,0),(20012,'2019-01-24',54,0,0,0),(20013,'2019-01-24',55,0,0,0),(20014,'2019-01-24',56,0,0,0),(20015,'2019-01-24',57,0,0,0),(20016,'2019-01-24',58,0,0,0),(20017,'2019-01-24',59,0,0,0),(20018,'2019-01-24',60,0,0,0),(20019,'2019-01-24',61,0,0,0),(20020,'2019-01-24',62,0,0,0),(20021,'2019-01-24',63,0,0,0),(20022,'2019-01-24',64,0,0,0),(20023,'2019-01-24',65,0,0,0),(20024,'2019-01-24',66,0,0,0),(20025,'2019-01-24',67,0,0,0),(20026,'2019-01-24',68,0,0,0),(20027,'2019-01-24',69,0,0,0),(20028,'2019-01-24',70,0,0,0),(20029,'2019-01-24',71,0,0,0),(20030,'2019-01-24',72,0,0,0),(20031,'2019-01-24',73,0,0,0),(20032,'2019-01-24',74,0,0,0),(20033,'2019-01-24',75,0,0,0),(20034,'2019-01-24',76,0,0,0),(20035,'2019-01-24',77,0,0,0),(20036,'2019-01-24',78,0,0,0),(20037,'2019-01-24',79,0,0,0),(20038,'2019-01-24',80,0,0,0),(20039,'2019-01-24',81,0,0,0),(20040,'2019-01-24',82,0,0,0),(20041,'2019-01-24',83,0,0,0),(20042,'2019-01-24',84,0,0,0),(20043,'2019-01-24',85,0,0,0),(20044,'2019-01-24',86,0,0,0),(20045,'2019-01-24',87,0,0,0),(20046,'2019-01-24',88,0,0,0),(20047,'2019-01-24',89,0,0,0),(20048,'2019-01-24',90,0,0,0),(20049,'2019-01-24',91,0,0,0),(20050,'2019-01-24',92,0,0,0),(20051,'2019-01-24',93,0,0,0),(20052,'2019-01-24',94,0,0,0),(20053,'2019-01-24',95,0,0,0),(20054,'2019-01-24',96,0,0,0),(20055,'2019-01-24',97,0,0,0),(20056,'2019-01-24',98,0,0,0),(20057,'2019-01-24',99,0,0,0),(20058,'2019-01-24',100,0,0,0),(20059,'2019-01-24',101,0,0,0),(20060,'2019-01-24',102,0,0,0),(20061,'2019-01-24',103,0,0,0),(20062,'2019-01-24',104,0,0,0),(20063,'2019-01-24',105,0,0,0),(20064,'2019-01-24',106,0,0,0),(20065,'2019-01-24',107,0,0,0),(20066,'2019-01-24',108,0,0,0),(20067,'2019-01-24',109,0,0,0),(20068,'2019-01-24',110,0,0,0),(20069,'2019-01-24',111,0,0,0),(20070,'2019-01-24',112,0,0,0),(20071,'2019-01-24',113,0,0,0),(20072,'2019-01-24',114,0,0,0),(20073,'2019-01-24',115,0,0,0),(20074,'2019-01-24',116,0,0,0),(20075,'2019-01-24',117,0,0,0),(20076,'2019-01-24',118,0,0,0),(20077,'2019-01-24',119,0,0,0),(20078,'2019-01-24',120,0,0,0),(20079,'2019-01-24',121,0,0,0),(20080,'2019-01-24',122,0,0,0),(20081,'2019-01-24',123,0,0,0),(20082,'2019-01-24',124,0,0,0),(20083,'2019-01-24',125,0,0,0),(20084,'2019-01-24',126,0,0,0),(20085,'2019-01-24',127,0,0,0),(20086,'2019-01-24',128,0,0,0),(20087,'2019-01-24',129,0,0,0),(20088,'2019-01-24',130,0,0,0),(20089,'2019-01-24',131,0,0,0),(20090,'2019-01-24',132,0,0,0),(20091,'2019-01-24',133,0,0,0),(20092,'2019-01-24',134,0,0,0),(20093,'2019-01-24',135,0,0,0),(20094,'2019-01-24',136,0,0,0),(20095,'2019-01-24',137,0,0,0),(20096,'2019-01-24',138,0,0,0),(20097,'2019-01-24',139,0,0,0),(20098,'2019-01-24',140,0,0,0),(20099,'2019-01-24',141,0,0,0),(20100,'2019-01-24',142,0,0,0),(20101,'2019-01-24',143,0,0,0),(20102,'2019-01-24',144,0,0,0),(20103,'2019-01-24',145,0,0,0),(20104,'2019-01-24',146,0,0,0),(20105,'2019-01-24',147,0,0,0),(20106,'2019-01-24',148,0,0,0),(20107,'2019-01-24',149,0,0,0),(20108,'2019-01-24',150,0,0,0),(20109,'2019-01-24',151,0,0,0),(20110,'2019-01-24',152,0,0,0),(20111,'2019-01-24',153,0,0,0),(20112,'2019-01-24',154,0,0,0),(20113,'2019-01-24',155,0,0,0),(20114,'2019-01-24',156,0,0,0),(20115,'2019-01-24',157,0,0,0),(20116,'2019-01-24',158,0,0,0),(20117,'2019-01-24',159,0,0,0),(20118,'2019-01-24',160,0,0,0),(20119,'2019-01-24',161,0,0,0),(20120,'2019-01-24',162,0,0,0),(20121,'2019-01-24',163,0,0,0),(20122,'2019-01-24',164,0,0,0),(20123,'2019-01-24',165,0,0,0),(20124,'2019-01-24',166,0,0,0),(20125,'2019-01-24',167,0,0,0),(20126,'2019-01-24',168,0,0,0),(20127,'2019-01-24',169,0,0,0),(20128,'2019-01-24',170,0,0,0),(20129,'2019-01-24',171,0,0,0),(20130,'2019-01-24',172,0,0,0),(20131,'2019-01-24',173,0,0,0),(20132,'2019-01-24',174,0,0,0),(20133,'2019-01-24',175,0,0,0),(20134,'2019-01-24',176,0,0,0),(20135,'2019-01-24',177,0,0,0),(20136,'2019-01-24',178,0,0,0),(20137,'2019-01-24',179,0,0,0),(20138,'2019-01-24',180,0,0,0),(20139,'2019-01-24',181,0,0,0),(20140,'2019-01-24',182,0,0,0),(20141,'2019-01-24',183,0,0,0),(20142,'2019-01-24',184,0,0,0),(20143,'2019-01-24',185,0,0,0),(20144,'2019-01-24',186,0,0,0),(20145,'2019-01-24',187,0,0,0),(20146,'2019-01-24',188,0,0,0),(20147,'2019-01-24',189,0,0,0),(20148,'2019-01-24',190,0,0,0),(20149,'2019-01-24',191,0,0,0),(20150,'2019-01-24',192,0,0,0),(20151,'2019-01-24',193,0,0,0),(20152,'2019-01-24',194,0,0,0),(20153,'2019-01-24',195,0,0,0),(20154,'2019-01-24',196,0,0,0),(20155,'2019-01-24',197,0,0,0),(20156,'2019-01-24',198,0,0,0),(20157,'2019-01-24',199,0,0,0),(20158,'2019-01-24',200,0,0,0),(20159,'2019-01-24',201,0,0,0),(20160,'2019-01-24',202,0,0,0),(20161,'2019-01-24',203,0,0,0),(20162,'2019-01-24',204,0,0,0),(20163,'2019-01-24',1,0,0,0),(20164,'2019-01-24',2,0,0,0),(20165,'2019-01-24',9,0,0,0),(20166,'2019-01-24',11,0,0,0),(20167,'2019-01-24',12,0,0,0),(20168,'2019-01-24',13,0,0,0),(20169,'2019-01-24',14,0,0,0),(20170,'2019-01-24',15,0,0,0),(20171,'2019-01-24',16,0,0,0),(20172,'2019-01-24',17,0,0,0),(20173,'2019-01-24',18,0,0,0),(20174,'2019-01-24',19,0,0,0),(20175,'2019-01-24',20,0,0,0),(20176,'2019-01-24',21,0,0,0),(20177,'2019-01-24',22,0,0,0),(20178,'2019-01-24',23,0,0,0),(20179,'2019-01-24',24,0,0,0),(20180,'2019-01-24',25,0,0,0),(20181,'2019-01-24',26,0,0,0),(20182,'2019-01-24',27,0,0,0),(20183,'2019-01-24',28,0,0,0),(20184,'2019-01-24',29,0,0,0),(20185,'2019-01-24',30,0,0,0),(20186,'2019-01-24',31,0,0,0),(20187,'2019-01-24',32,0,0,0),(20188,'2019-01-24',33,0,0,0),(20189,'2019-01-24',34,0,0,0),(20190,'2019-01-24',35,0,0,0),(20191,'2019-01-24',36,0,0,0),(20192,'2019-01-24',37,0,0,0),(20193,'2019-01-24',38,0,0,0),(20194,'2019-01-24',39,0,0,0),(20195,'2019-01-24',40,0,0,0),(20196,'2019-01-24',41,0,0,0),(20197,'2019-01-24',42,0,0,0),(20198,'2019-01-24',43,0,0,0),(20199,'2019-01-24',44,0,0,0),(20200,'2019-01-24',45,0,0,0),(20201,'2019-01-24',46,0,0,0),(20202,'2019-01-24',47,0,0,0),(20203,'2019-01-24',48,0,0,0),(20204,'2019-01-24',49,0,0,0),(20205,'2019-01-24',50,0,0,0),(20206,'2019-01-24',51,0,0,0),(20207,'2019-01-24',52,0,0,0),(20208,'2019-01-24',53,0,0,0),(20209,'2019-01-24',54,0,0,0),(20210,'2019-01-24',55,0,0,0),(20211,'2019-01-24',56,0,0,0),(20212,'2019-01-24',57,0,0,0),(20213,'2019-01-24',58,0,0,0),(20214,'2019-01-24',59,0,0,0),(20215,'2019-01-24',60,0,0,0),(20216,'2019-01-24',61,0,0,0),(20217,'2019-01-24',62,0,0,0),(20218,'2019-01-24',63,0,0,0),(20219,'2019-01-24',64,0,0,0),(20220,'2019-01-24',65,0,0,0),(20221,'2019-01-24',66,0,0,0),(20222,'2019-01-24',67,0,0,0),(20223,'2019-01-24',68,0,0,0),(20224,'2019-01-24',69,0,0,0),(20225,'2019-01-24',70,0,0,0),(20226,'2019-01-24',71,0,0,0),(20227,'2019-01-24',72,0,0,0),(20228,'2019-01-24',73,0,0,0),(20229,'2019-01-24',74,0,0,0),(20230,'2019-01-24',75,0,0,0),(20231,'2019-01-24',76,0,0,0),(20232,'2019-01-24',77,0,0,0),(20233,'2019-01-24',78,0,0,0),(20234,'2019-01-24',79,0,0,0),(20235,'2019-01-24',80,0,0,0),(20236,'2019-01-24',81,0,0,0),(20237,'2019-01-24',82,0,0,0),(20238,'2019-01-24',83,0,0,0),(20239,'2019-01-24',84,0,0,0),(20240,'2019-01-24',85,0,0,0),(20241,'2019-01-24',86,0,0,0),(20242,'2019-01-24',87,0,0,0),(20243,'2019-01-24',88,0,0,0),(20244,'2019-01-24',89,0,0,0),(20245,'2019-01-24',90,0,0,0),(20246,'2019-01-24',91,0,0,0),(20247,'2019-01-24',92,0,0,0),(20248,'2019-01-24',93,0,0,0),(20249,'2019-01-24',94,0,0,0),(20250,'2019-01-24',95,0,0,0),(20251,'2019-01-24',96,0,0,0),(20252,'2019-01-24',97,0,0,0),(20253,'2019-01-24',98,0,0,0),(20254,'2019-01-24',99,0,0,0),(20255,'2019-01-24',100,0,0,0),(20256,'2019-01-24',101,0,0,0),(20257,'2019-01-24',102,0,0,0),(20258,'2019-01-24',103,0,0,0),(20259,'2019-01-24',104,0,0,0),(20260,'2019-01-24',105,0,0,0),(20261,'2019-01-24',106,0,0,0),(20262,'2019-01-24',107,0,0,0),(20263,'2019-01-24',108,0,0,0),(20264,'2019-01-24',109,0,0,0),(20265,'2019-01-24',110,0,0,0),(20266,'2019-01-24',111,0,0,0),(20267,'2019-01-24',112,0,0,0),(20268,'2019-01-24',113,0,0,0),(20269,'2019-01-24',114,0,0,0),(20270,'2019-01-24',115,0,0,0),(20271,'2019-01-24',116,0,0,0),(20272,'2019-01-24',117,0,0,0),(20273,'2019-01-24',118,0,0,0),(20274,'2019-01-24',119,0,0,0),(20275,'2019-01-24',120,0,0,0),(20276,'2019-01-24',121,0,0,0),(20277,'2019-01-24',122,0,0,0),(20278,'2019-01-24',123,0,0,0),(20279,'2019-01-24',124,0,0,0),(20280,'2019-01-24',125,0,0,0),(20281,'2019-01-24',126,0,0,0),(20282,'2019-01-24',127,0,0,0),(20283,'2019-01-24',128,0,0,0),(20284,'2019-01-24',129,0,0,0),(20285,'2019-01-24',130,0,0,0),(20286,'2019-01-24',131,0,0,0),(20287,'2019-01-24',132,0,0,0),(20288,'2019-01-24',133,0,0,0),(20289,'2019-01-24',134,0,0,0),(20290,'2019-01-24',135,0,0,0),(20291,'2019-01-24',136,0,0,0),(20292,'2019-01-24',137,0,0,0),(20293,'2019-01-24',138,0,0,0),(20294,'2019-01-24',139,0,0,0),(20295,'2019-01-24',140,0,0,0),(20296,'2019-01-24',141,0,0,0),(20297,'2019-01-24',142,0,0,0),(20298,'2019-01-24',143,0,0,0),(20299,'2019-01-24',144,0,0,0),(20300,'2019-01-24',145,0,0,0),(20301,'2019-01-24',146,0,0,0),(20302,'2019-01-24',147,0,0,0),(20303,'2019-01-24',148,0,0,0),(20304,'2019-01-24',149,0,0,0),(20305,'2019-01-24',150,0,0,0),(20306,'2019-01-24',151,0,0,0),(20307,'2019-01-24',152,0,0,0),(20308,'2019-01-24',153,0,0,0),(20309,'2019-01-24',154,0,0,0),(20310,'2019-01-24',155,0,0,0),(20311,'2019-01-24',156,0,0,0),(20312,'2019-01-24',157,0,0,0),(20313,'2019-01-24',158,0,0,0),(20314,'2019-01-24',159,0,0,0),(20315,'2019-01-24',160,0,0,0),(20316,'2019-01-24',161,0,0,0),(20317,'2019-01-24',162,0,0,0),(20318,'2019-01-24',163,0,0,0),(20319,'2019-01-24',164,0,0,0),(20320,'2019-01-24',165,0,0,0),(20321,'2019-01-24',166,0,0,0),(20322,'2019-01-24',167,0,0,0),(20323,'2019-01-24',168,0,0,0),(20324,'2019-01-24',169,0,0,0),(20325,'2019-01-24',170,0,0,0),(20326,'2019-01-24',171,0,0,0),(20327,'2019-01-24',172,0,0,0),(20328,'2019-01-24',173,0,0,0),(20329,'2019-01-24',174,0,0,0),(20330,'2019-01-24',175,0,0,0),(20331,'2019-01-24',176,0,0,0),(20332,'2019-01-24',177,0,0,0),(20333,'2019-01-24',178,0,0,0),(20334,'2019-01-24',179,0,0,0),(20335,'2019-01-24',180,0,0,0),(20336,'2019-01-24',181,0,0,0),(20337,'2019-01-24',182,0,0,0),(20338,'2019-01-24',183,0,0,0),(20339,'2019-01-24',184,0,0,0),(20340,'2019-01-24',185,0,0,0),(20341,'2019-01-24',186,0,0,0),(20342,'2019-01-24',187,0,0,0),(20343,'2019-01-24',188,0,0,0),(20344,'2019-01-24',189,0,0,0),(20345,'2019-01-24',190,0,0,0),(20346,'2019-01-24',191,0,0,0),(20347,'2019-01-24',192,0,0,0),(20348,'2019-01-24',193,0,0,0),(20349,'2019-01-24',194,0,0,0),(20350,'2019-01-24',195,0,0,0),(20351,'2019-01-24',196,0,0,0),(20352,'2019-01-24',197,0,0,0),(20353,'2019-01-24',198,0,0,0),(20354,'2019-01-24',199,0,0,0),(20355,'2019-01-24',200,0,0,0),(20356,'2019-01-24',201,0,0,0),(20357,'2019-01-24',202,0,0,0),(20358,'2019-01-24',203,0,0,0),(20359,'2019-01-24',204,0,0,0),(20418,'2019-01-24',1,0,0,0),(20419,'2019-01-24',2,0,0,0),(20420,'2019-01-24',9,0,0,0),(20421,'2019-01-24',11,0,0,0),(20422,'2019-01-24',12,0,0,0),(20423,'2019-01-24',13,0,0,0),(20424,'2019-01-24',14,0,0,0),(20425,'2019-01-24',15,0,0,0),(20426,'2019-01-24',16,0,0,0),(20427,'2019-01-24',17,0,0,0),(20428,'2019-01-24',18,0,0,0),(20429,'2019-01-24',19,0,0,0),(20430,'2019-01-24',20,0,0,0),(20431,'2019-01-24',21,0,0,0),(20432,'2019-01-24',22,0,0,0),(20433,'2019-01-24',23,0,0,0),(20434,'2019-01-24',24,0,0,0),(20435,'2019-01-24',25,0,0,0),(20436,'2019-01-24',26,0,0,0),(20437,'2019-01-24',27,0,0,0),(20438,'2019-01-24',28,0,0,0),(20439,'2019-01-24',29,0,0,0),(20440,'2019-01-24',30,0,0,0),(20441,'2019-01-24',31,0,0,0),(20442,'2019-01-24',32,0,0,0),(20443,'2019-01-24',33,0,0,0),(20444,'2019-01-24',34,0,0,0),(20445,'2019-01-24',35,0,0,0),(20446,'2019-01-24',36,0,0,0),(20447,'2019-01-24',37,0,0,0),(20448,'2019-01-24',38,0,0,0),(20449,'2019-01-24',39,0,0,0),(20450,'2019-01-24',40,0,0,0),(20451,'2019-01-24',41,0,0,0),(20452,'2019-01-24',42,0,0,0),(20453,'2019-01-24',43,0,0,0),(20454,'2019-01-24',44,0,0,0),(20455,'2019-01-24',45,0,0,0),(20456,'2019-01-24',46,0,0,0),(20457,'2019-01-24',47,0,0,0),(20458,'2019-01-24',48,0,0,0),(20459,'2019-01-24',49,0,0,0),(20460,'2019-01-24',50,0,0,0),(20461,'2019-01-24',51,0,0,0),(20462,'2019-01-24',52,0,0,0),(20463,'2019-01-24',53,0,0,0),(20464,'2019-01-24',54,0,0,0),(20465,'2019-01-24',55,0,0,0),(20466,'2019-01-24',56,0,0,0),(20467,'2019-01-24',57,0,0,0),(20468,'2019-01-24',58,0,0,0),(20469,'2019-01-24',59,0,0,0),(20470,'2019-01-24',60,0,0,0),(20471,'2019-01-24',61,0,0,0),(20472,'2019-01-24',62,0,0,0),(20473,'2019-01-24',63,0,0,0),(20474,'2019-01-24',64,0,0,0),(20475,'2019-01-24',65,0,0,0),(20476,'2019-01-24',66,0,0,0),(20477,'2019-01-24',67,0,0,0),(20478,'2019-01-24',68,0,0,0),(20479,'2019-01-24',69,0,0,0),(20480,'2019-01-24',70,0,0,0),(20481,'2019-01-24',71,0,0,0),(20482,'2019-01-24',72,0,0,0),(20483,'2019-01-24',73,0,0,0),(20484,'2019-01-24',74,0,0,0),(20485,'2019-01-24',75,0,0,0),(20486,'2019-01-24',76,0,0,0),(20487,'2019-01-24',77,0,0,0),(20488,'2019-01-24',78,0,0,0),(20489,'2019-01-24',79,0,0,0),(20490,'2019-01-24',80,0,0,0),(20491,'2019-01-24',81,0,0,0),(20492,'2019-01-24',82,0,0,0),(20493,'2019-01-24',83,0,0,0),(20494,'2019-01-24',84,0,0,0),(20495,'2019-01-24',85,0,0,0),(20496,'2019-01-24',86,0,0,0),(20497,'2019-01-24',87,0,0,0),(20498,'2019-01-24',88,0,0,0),(20499,'2019-01-24',89,0,0,0),(20500,'2019-01-24',90,0,0,0),(20501,'2019-01-24',91,0,0,0),(20502,'2019-01-24',92,0,0,0),(20503,'2019-01-24',93,0,0,0),(20504,'2019-01-24',94,0,0,0),(20505,'2019-01-24',95,0,0,0),(20506,'2019-01-24',96,0,0,0),(20507,'2019-01-24',97,0,0,0),(20508,'2019-01-24',98,0,0,0),(20509,'2019-01-24',99,0,0,0),(20510,'2019-01-24',100,0,0,0),(20511,'2019-01-24',101,0,0,0),(20512,'2019-01-24',102,0,0,0),(20513,'2019-01-24',103,0,0,0),(20514,'2019-01-24',104,0,0,0),(20515,'2019-01-24',105,0,0,0),(20516,'2019-01-24',106,0,0,0),(20517,'2019-01-24',107,0,0,0),(20518,'2019-01-24',108,0,0,0),(20519,'2019-01-24',109,0,0,0),(20520,'2019-01-24',110,0,0,0),(20521,'2019-01-24',111,0,0,0),(20522,'2019-01-24',112,0,0,0),(20523,'2019-01-24',113,0,0,0),(20524,'2019-01-24',114,0,0,0),(20525,'2019-01-24',115,0,0,0),(20526,'2019-01-24',116,0,0,0),(20527,'2019-01-24',117,0,0,0),(20528,'2019-01-24',118,0,0,0),(20529,'2019-01-24',119,0,0,0),(20530,'2019-01-24',120,0,0,0),(20531,'2019-01-24',121,0,0,0),(20532,'2019-01-24',122,0,0,0),(20533,'2019-01-24',123,0,0,0),(20534,'2019-01-24',124,0,0,0),(20535,'2019-01-24',125,0,0,0),(20536,'2019-01-24',126,0,0,0),(20537,'2019-01-24',127,0,0,0),(20538,'2019-01-24',128,0,0,0),(20539,'2019-01-24',129,0,0,0),(20540,'2019-01-24',130,0,0,0),(20541,'2019-01-24',131,0,0,0),(20542,'2019-01-24',132,0,0,0),(20543,'2019-01-24',133,0,0,0),(20544,'2019-01-24',134,0,0,0),(20545,'2019-01-24',135,0,0,0),(20546,'2019-01-24',136,0,0,0),(20547,'2019-01-24',137,0,0,0),(20548,'2019-01-24',138,0,0,0),(20549,'2019-01-24',139,0,0,0),(20550,'2019-01-24',140,0,0,0),(20551,'2019-01-24',141,0,0,0),(20552,'2019-01-24',142,0,0,0),(20553,'2019-01-24',143,0,0,0),(20554,'2019-01-24',144,0,0,0),(20555,'2019-01-24',145,0,0,0),(20556,'2019-01-24',146,0,0,0),(20557,'2019-01-24',147,0,0,0),(20558,'2019-01-24',148,0,0,0),(20559,'2019-01-24',149,0,0,0),(20560,'2019-01-24',150,0,0,0),(20561,'2019-01-24',151,0,0,0),(20562,'2019-01-24',152,0,0,0),(20563,'2019-01-24',153,0,0,0),(20564,'2019-01-24',154,0,0,0),(20565,'2019-01-24',155,0,0,0),(20566,'2019-01-24',156,0,0,0),(20567,'2019-01-24',157,0,0,0),(20568,'2019-01-24',158,0,0,0),(20569,'2019-01-24',159,0,0,0),(20570,'2019-01-24',160,0,0,0),(20571,'2019-01-24',161,0,0,0),(20572,'2019-01-24',162,0,0,0),(20573,'2019-01-24',163,0,0,0),(20574,'2019-01-24',164,0,0,0),(20575,'2019-01-24',165,0,0,0),(20576,'2019-01-24',166,0,0,0),(20577,'2019-01-24',167,0,0,0),(20578,'2019-01-24',168,0,0,0),(20579,'2019-01-24',169,0,0,0),(20580,'2019-01-24',170,0,0,0),(20581,'2019-01-24',171,0,0,0),(20582,'2019-01-24',172,0,0,0),(20583,'2019-01-24',173,0,0,0),(20584,'2019-01-24',174,0,0,0),(20585,'2019-01-24',175,0,0,0),(20586,'2019-01-24',176,0,0,0),(20587,'2019-01-24',177,0,0,0),(20588,'2019-01-24',178,0,0,0),(20589,'2019-01-24',179,0,0,0),(20590,'2019-01-24',180,0,0,0),(20591,'2019-01-24',181,0,0,0),(20592,'2019-01-24',182,0,0,0),(20593,'2019-01-24',183,0,0,0),(20594,'2019-01-24',184,0,0,0),(20595,'2019-01-24',185,0,0,0),(20596,'2019-01-24',186,0,0,0),(20597,'2019-01-24',187,0,0,0),(20598,'2019-01-24',188,0,0,0),(20599,'2019-01-24',189,0,0,0),(20600,'2019-01-24',190,0,0,0),(20601,'2019-01-24',191,0,0,0),(20602,'2019-01-24',192,0,0,0),(20603,'2019-01-24',193,0,0,0),(20604,'2019-01-24',194,0,0,0),(20605,'2019-01-24',195,0,0,0),(20606,'2019-01-24',196,0,0,0),(20607,'2019-01-24',197,0,0,0),(20608,'2019-01-24',198,0,0,0),(20609,'2019-01-24',199,0,0,0),(20610,'2019-01-24',200,0,0,0),(20611,'2019-01-24',201,0,0,0),(20612,'2019-01-24',202,0,0,0),(20613,'2019-01-24',203,0,0,0),(20614,'2019-01-24',204,0,0,0),(20673,'2019-01-24',1,0,0,0),(20674,'2019-01-24',2,0,0,0),(20675,'2019-01-24',9,0,0,0),(20676,'2019-01-24',11,0,0,0),(20677,'2019-01-24',12,0,0,0),(20678,'2019-01-24',13,0,0,0),(20679,'2019-01-24',14,0,0,0),(20680,'2019-01-24',15,0,0,0),(20681,'2019-01-24',16,0,0,0),(20682,'2019-01-24',17,0,0,0),(20683,'2019-01-24',18,0,0,0),(20684,'2019-01-24',19,0,0,0),(20685,'2019-01-24',20,0,0,0),(20686,'2019-01-24',21,0,0,0),(20687,'2019-01-24',22,0,0,0),(20688,'2019-01-24',23,0,0,0),(20689,'2019-01-24',24,0,0,0),(20690,'2019-01-24',25,0,0,0),(20691,'2019-01-24',26,0,0,0),(20692,'2019-01-24',27,0,0,0),(20693,'2019-01-24',28,0,0,0),(20694,'2019-01-24',29,0,0,0),(20695,'2019-01-24',30,0,0,0),(20696,'2019-01-24',31,0,0,0),(20697,'2019-01-24',32,0,0,0),(20698,'2019-01-24',33,0,0,0),(20699,'2019-01-24',34,0,0,0),(20700,'2019-01-24',35,0,0,0),(20701,'2019-01-24',36,0,0,0),(20702,'2019-01-24',37,0,0,0),(20703,'2019-01-24',38,0,0,0),(20704,'2019-01-24',39,0,0,0),(20705,'2019-01-24',40,0,0,0),(20706,'2019-01-24',41,0,0,0),(20707,'2019-01-24',42,0,0,0),(20708,'2019-01-24',43,0,0,0),(20709,'2019-01-24',44,0,0,0),(20710,'2019-01-24',45,0,0,0),(20711,'2019-01-24',46,0,0,0),(20712,'2019-01-24',47,0,0,0),(20713,'2019-01-24',48,0,0,0),(20714,'2019-01-24',49,0,0,0),(20715,'2019-01-24',50,0,0,0),(20716,'2019-01-24',51,0,0,0),(20717,'2019-01-24',52,0,0,0),(20718,'2019-01-24',53,0,0,0),(20719,'2019-01-24',54,0,0,0),(20720,'2019-01-24',55,0,0,0),(20721,'2019-01-24',56,0,0,0),(20722,'2019-01-24',57,0,0,0),(20723,'2019-01-24',58,0,0,0),(20724,'2019-01-24',59,0,0,0),(20725,'2019-01-24',60,0,0,0),(20726,'2019-01-24',61,0,0,0),(20727,'2019-01-24',62,0,0,0),(20728,'2019-01-24',63,0,0,0),(20729,'2019-01-24',64,0,0,0),(20730,'2019-01-24',65,0,0,0),(20731,'2019-01-24',66,0,0,0),(20732,'2019-01-24',67,0,0,0),(20733,'2019-01-24',68,0,0,0),(20734,'2019-01-24',69,0,0,0),(20735,'2019-01-24',70,0,0,0),(20736,'2019-01-24',71,0,0,0),(20737,'2019-01-24',72,0,0,0),(20738,'2019-01-24',73,0,0,0),(20739,'2019-01-24',74,0,0,0),(20740,'2019-01-24',75,0,0,0),(20741,'2019-01-24',76,0,0,0),(20742,'2019-01-24',77,0,0,0),(20743,'2019-01-24',78,0,0,0),(20744,'2019-01-24',79,0,0,0),(20745,'2019-01-24',80,0,0,0),(20746,'2019-01-24',81,0,0,0),(20747,'2019-01-24',82,0,0,0),(20748,'2019-01-24',83,0,0,0),(20749,'2019-01-24',84,0,0,0),(20750,'2019-01-24',85,0,0,0),(20751,'2019-01-24',86,0,0,0),(20752,'2019-01-24',87,0,0,0),(20753,'2019-01-24',88,0,0,0),(20754,'2019-01-24',89,0,0,0),(20755,'2019-01-24',90,0,0,0),(20756,'2019-01-24',91,0,0,0),(20757,'2019-01-24',92,0,0,0),(20758,'2019-01-24',93,0,0,0),(20759,'2019-01-24',94,0,0,0),(20760,'2019-01-24',95,0,0,0),(20761,'2019-01-24',96,0,0,0),(20762,'2019-01-24',97,0,0,0),(20763,'2019-01-24',98,0,0,0),(20764,'2019-01-24',99,0,0,0),(20765,'2019-01-24',100,0,0,0),(20766,'2019-01-24',101,0,0,0),(20767,'2019-01-24',102,0,0,0),(20768,'2019-01-24',103,0,0,0),(20769,'2019-01-24',104,0,0,0),(20770,'2019-01-24',105,0,0,0),(20771,'2019-01-24',106,0,0,0),(20772,'2019-01-24',107,0,0,0),(20773,'2019-01-24',108,0,0,0),(20774,'2019-01-24',109,0,0,0),(20775,'2019-01-24',110,0,0,0),(20776,'2019-01-24',111,0,0,0),(20777,'2019-01-24',112,0,0,0),(20778,'2019-01-24',113,0,0,0),(20779,'2019-01-24',114,0,0,0),(20780,'2019-01-24',115,0,0,0),(20781,'2019-01-24',116,0,0,0),(20782,'2019-01-24',117,0,0,0),(20783,'2019-01-24',118,0,0,0),(20784,'2019-01-24',119,0,0,0),(20785,'2019-01-24',120,0,0,0),(20786,'2019-01-24',121,0,0,0),(20787,'2019-01-24',122,0,0,0),(20788,'2019-01-24',123,0,0,0),(20789,'2019-01-24',124,0,0,0),(20790,'2019-01-24',125,0,0,0),(20791,'2019-01-24',126,0,0,0),(20792,'2019-01-24',127,0,0,0),(20793,'2019-01-24',128,0,0,0),(20794,'2019-01-24',129,0,0,0),(20795,'2019-01-24',130,0,0,0),(20796,'2019-01-24',131,0,0,0),(20797,'2019-01-24',132,0,0,0),(20798,'2019-01-24',133,0,0,0),(20799,'2019-01-24',134,0,0,0),(20800,'2019-01-24',135,0,0,0),(20801,'2019-01-24',136,0,0,0),(20802,'2019-01-24',137,0,0,0),(20803,'2019-01-24',138,0,0,0),(20804,'2019-01-24',139,0,0,0),(20805,'2019-01-24',140,0,0,0),(20806,'2019-01-24',141,0,0,0),(20807,'2019-01-24',142,0,0,0),(20808,'2019-01-24',143,0,0,0),(20809,'2019-01-24',144,0,0,0),(20810,'2019-01-24',145,0,0,0),(20811,'2019-01-24',146,0,0,0),(20812,'2019-01-24',147,0,0,0),(20813,'2019-01-24',148,0,0,0),(20814,'2019-01-24',149,0,0,0),(20815,'2019-01-24',150,0,0,0),(20816,'2019-01-24',151,0,0,0),(20817,'2019-01-24',152,0,0,0),(20818,'2019-01-24',153,0,0,0),(20819,'2019-01-24',154,0,0,0),(20820,'2019-01-24',155,0,0,0),(20821,'2019-01-24',156,0,0,0),(20822,'2019-01-24',157,0,0,0),(20823,'2019-01-24',158,0,0,0),(20824,'2019-01-24',159,0,0,0),(20825,'2019-01-24',160,0,0,0),(20826,'2019-01-24',161,0,0,0),(20827,'2019-01-24',162,0,0,0),(20828,'2019-01-24',163,0,0,0),(20829,'2019-01-24',164,0,0,0),(20830,'2019-01-24',165,0,0,0),(20831,'2019-01-24',166,0,0,0),(20832,'2019-01-24',167,0,0,0),(20833,'2019-01-24',168,0,0,0),(20834,'2019-01-24',169,0,0,0),(20835,'2019-01-24',170,0,0,0),(20836,'2019-01-24',171,0,0,0),(20837,'2019-01-24',172,0,0,0),(20838,'2019-01-24',173,0,0,0),(20839,'2019-01-24',174,0,0,0),(20840,'2019-01-24',175,0,0,0),(20841,'2019-01-24',176,0,0,0),(20842,'2019-01-24',177,0,0,0),(20843,'2019-01-24',178,0,0,0),(20844,'2019-01-24',179,0,0,0),(20845,'2019-01-24',180,0,0,0),(20846,'2019-01-24',181,0,0,0),(20847,'2019-01-24',182,0,0,0),(20848,'2019-01-24',183,0,0,0),(20849,'2019-01-24',184,0,0,0),(20850,'2019-01-24',185,0,0,0),(20851,'2019-01-24',186,0,0,0),(20852,'2019-01-24',187,0,0,0),(20853,'2019-01-24',188,0,0,0),(20854,'2019-01-24',189,0,0,0),(20855,'2019-01-24',190,0,0,0),(20856,'2019-01-24',191,0,0,0),(20857,'2019-01-24',192,0,0,0),(20858,'2019-01-24',193,0,0,0),(20859,'2019-01-24',194,0,0,0),(20860,'2019-01-24',195,0,0,0),(20861,'2019-01-24',196,0,0,0),(20862,'2019-01-24',197,0,0,0),(20863,'2019-01-24',198,0,0,0),(20864,'2019-01-24',199,0,0,0),(20865,'2019-01-24',200,0,0,0),(20866,'2019-01-24',201,0,0,0),(20867,'2019-01-24',202,0,0,0),(20868,'2019-01-24',203,0,0,0),(20869,'2019-01-24',204,0,0,0),(20928,'2019-01-24',1,0,0,0),(20929,'2019-01-24',2,0,0,0),(20930,'2019-01-24',9,0,0,0),(20931,'2019-01-24',11,0,0,0),(20932,'2019-01-24',12,0,0,0),(20933,'2019-01-24',13,0,0,0),(20934,'2019-01-24',14,0,0,0),(20935,'2019-01-24',15,0,0,0),(20936,'2019-01-24',16,0,0,0),(20937,'2019-01-24',17,0,0,0),(20938,'2019-01-24',18,0,0,0),(20939,'2019-01-24',19,0,0,0),(20940,'2019-01-24',20,0,0,0),(20941,'2019-01-24',21,0,0,0),(20942,'2019-01-24',22,0,0,0),(20943,'2019-01-24',23,0,0,0),(20944,'2019-01-24',24,0,0,0),(20945,'2019-01-24',25,0,0,0),(20946,'2019-01-24',26,0,0,0),(20947,'2019-01-24',27,0,0,0),(20948,'2019-01-24',28,0,0,0),(20949,'2019-01-24',29,0,0,0),(20950,'2019-01-24',30,0,0,0),(20951,'2019-01-24',31,0,0,0),(20952,'2019-01-24',32,0,0,0),(20953,'2019-01-24',33,0,0,0),(20954,'2019-01-24',34,0,0,0),(20955,'2019-01-24',35,0,0,0),(20956,'2019-01-24',36,0,0,0),(20957,'2019-01-24',37,0,0,0),(20958,'2019-01-24',38,0,0,0),(20959,'2019-01-24',39,0,0,0),(20960,'2019-01-24',40,0,0,0),(20961,'2019-01-24',41,0,0,0),(20962,'2019-01-24',42,0,0,0),(20963,'2019-01-24',43,0,0,0),(20964,'2019-01-24',44,0,0,0),(20965,'2019-01-24',45,0,0,0),(20966,'2019-01-24',46,0,0,0),(20967,'2019-01-24',47,0,0,0),(20968,'2019-01-24',48,0,0,0),(20969,'2019-01-24',49,0,0,0),(20970,'2019-01-24',50,0,0,0),(20971,'2019-01-24',51,0,0,0),(20972,'2019-01-24',52,0,0,0),(20973,'2019-01-24',53,0,0,0),(20974,'2019-01-24',54,0,0,0),(20975,'2019-01-24',55,0,0,0),(20976,'2019-01-24',56,0,0,0),(20977,'2019-01-24',57,0,0,0),(20978,'2019-01-24',58,0,0,0),(20979,'2019-01-24',59,0,0,0),(20980,'2019-01-24',60,0,0,0),(20981,'2019-01-24',61,0,0,0),(20982,'2019-01-24',62,0,0,0),(20983,'2019-01-24',63,0,0,0),(20984,'2019-01-24',64,0,0,0),(20985,'2019-01-24',65,0,0,0),(20986,'2019-01-24',66,0,0,0),(20987,'2019-01-24',67,0,0,0),(20988,'2019-01-24',68,0,0,0),(20989,'2019-01-24',69,0,0,0),(20990,'2019-01-24',70,0,0,0),(20991,'2019-01-24',71,0,0,0),(20992,'2019-01-24',72,0,0,0),(20993,'2019-01-24',73,0,0,0),(20994,'2019-01-24',74,0,0,0),(20995,'2019-01-24',75,0,0,0),(20996,'2019-01-24',76,0,0,0),(20997,'2019-01-24',77,0,0,0),(20998,'2019-01-24',78,0,0,0),(20999,'2019-01-24',79,0,0,0),(21000,'2019-01-24',80,0,0,0),(21001,'2019-01-24',81,0,0,0),(21002,'2019-01-24',82,0,0,0),(21003,'2019-01-24',83,0,0,0),(21004,'2019-01-24',84,0,0,0),(21005,'2019-01-24',85,0,0,0),(21006,'2019-01-24',86,0,0,0),(21007,'2019-01-24',87,0,0,0),(21008,'2019-01-24',88,0,0,0),(21009,'2019-01-24',89,0,0,0),(21010,'2019-01-24',90,0,0,0),(21011,'2019-01-24',91,0,0,0),(21012,'2019-01-24',92,0,0,0),(21013,'2019-01-24',93,0,0,0),(21014,'2019-01-24',94,0,0,0),(21015,'2019-01-24',95,0,0,0),(21016,'2019-01-24',96,0,0,0),(21017,'2019-01-24',97,0,0,0),(21018,'2019-01-24',98,0,0,0),(21019,'2019-01-24',99,0,0,0),(21020,'2019-01-24',100,0,0,0),(21021,'2019-01-24',101,0,0,0),(21022,'2019-01-24',102,0,0,0),(21023,'2019-01-24',103,0,0,0),(21024,'2019-01-24',104,0,0,0),(21025,'2019-01-24',105,0,0,0),(21026,'2019-01-24',106,0,0,0),(21027,'2019-01-24',107,0,0,0),(21028,'2019-01-24',108,0,0,0),(21029,'2019-01-24',109,0,0,0),(21030,'2019-01-24',110,0,0,0),(21031,'2019-01-24',111,0,0,0),(21032,'2019-01-24',112,0,0,0),(21033,'2019-01-24',113,0,0,0),(21034,'2019-01-24',114,0,0,0),(21035,'2019-01-24',115,0,0,0),(21036,'2019-01-24',116,0,0,0),(21037,'2019-01-24',117,0,0,0),(21038,'2019-01-24',118,0,0,0),(21039,'2019-01-24',119,0,0,0),(21040,'2019-01-24',120,0,0,0),(21041,'2019-01-24',121,0,0,0),(21042,'2019-01-24',122,0,0,0),(21043,'2019-01-24',123,0,0,0),(21044,'2019-01-24',124,0,0,0),(21045,'2019-01-24',125,0,0,0),(21046,'2019-01-24',126,0,0,0),(21047,'2019-01-24',127,0,0,0),(21048,'2019-01-24',128,0,0,0),(21049,'2019-01-24',129,0,0,0),(21050,'2019-01-24',130,0,0,0),(21051,'2019-01-24',131,0,0,0),(21052,'2019-01-24',132,0,0,0),(21053,'2019-01-24',133,0,0,0),(21054,'2019-01-24',134,0,0,0),(21055,'2019-01-24',135,0,0,0),(21056,'2019-01-24',136,0,0,0),(21057,'2019-01-24',137,0,0,0),(21058,'2019-01-24',138,0,0,0),(21059,'2019-01-24',139,0,0,0),(21060,'2019-01-24',140,0,0,0),(21061,'2019-01-24',141,0,0,0),(21062,'2019-01-24',142,0,0,0),(21063,'2019-01-24',143,0,0,0),(21064,'2019-01-24',144,0,0,0),(21065,'2019-01-24',145,0,0,0),(21066,'2019-01-24',146,0,0,0),(21067,'2019-01-24',147,0,0,0),(21068,'2019-01-24',148,0,0,0),(21069,'2019-01-24',149,0,0,0),(21070,'2019-01-24',150,0,0,0),(21071,'2019-01-24',151,0,0,0),(21072,'2019-01-24',152,0,0,0),(21073,'2019-01-24',153,0,0,0),(21074,'2019-01-24',154,0,0,0),(21075,'2019-01-24',155,0,0,0),(21076,'2019-01-24',156,0,0,0),(21077,'2019-01-24',157,0,0,0),(21078,'2019-01-24',158,0,0,0),(21079,'2019-01-24',159,0,0,0),(21080,'2019-01-24',160,0,0,0),(21081,'2019-01-24',161,0,0,0),(21082,'2019-01-24',162,0,0,0),(21083,'2019-01-24',163,0,0,0),(21084,'2019-01-24',164,0,0,0),(21085,'2019-01-24',165,0,0,0),(21086,'2019-01-24',166,0,0,0),(21087,'2019-01-24',167,0,0,0),(21088,'2019-01-24',168,0,0,0),(21089,'2019-01-24',169,0,0,0),(21090,'2019-01-24',170,0,0,0),(21091,'2019-01-24',171,0,0,0),(21092,'2019-01-24',172,0,0,0),(21093,'2019-01-24',173,0,0,0),(21094,'2019-01-24',174,0,0,0),(21095,'2019-01-24',175,0,0,0),(21096,'2019-01-24',176,0,0,0),(21097,'2019-01-24',177,0,0,0),(21098,'2019-01-24',178,0,0,0),(21099,'2019-01-24',179,0,0,0),(21100,'2019-01-24',180,0,0,0),(21101,'2019-01-24',181,0,0,0),(21102,'2019-01-24',182,0,0,0),(21103,'2019-01-24',183,0,0,0),(21104,'2019-01-24',184,0,0,0),(21105,'2019-01-24',185,0,0,0),(21106,'2019-01-24',186,0,0,0),(21107,'2019-01-24',187,0,0,0),(21108,'2019-01-24',188,0,0,0),(21109,'2019-01-24',189,0,0,0),(21110,'2019-01-24',190,0,0,0),(21111,'2019-01-24',191,0,0,0),(21112,'2019-01-24',192,0,0,0),(21113,'2019-01-24',193,0,0,0),(21114,'2019-01-24',194,0,0,0),(21115,'2019-01-24',195,0,0,0),(21116,'2019-01-24',196,0,0,0),(21117,'2019-01-24',197,0,0,0),(21118,'2019-01-24',198,0,0,0),(21119,'2019-01-24',199,0,0,0),(21120,'2019-01-24',200,0,0,0),(21121,'2019-01-24',201,0,0,0),(21122,'2019-01-24',202,0,0,0),(21123,'2019-01-24',203,0,0,0),(21124,'2019-01-24',204,0,0,0),(21183,'2019-01-24',1,0,0,0),(21184,'2019-01-24',2,0,0,0),(21185,'2019-01-24',9,0,0,0),(21186,'2019-01-24',11,0,0,0),(21187,'2019-01-24',12,0,0,0),(21188,'2019-01-24',13,0,0,0),(21189,'2019-01-24',14,0,0,0),(21190,'2019-01-24',15,0,0,0),(21191,'2019-01-24',16,0,0,0),(21192,'2019-01-24',17,0,0,0),(21193,'2019-01-24',18,0,0,0),(21194,'2019-01-24',19,0,0,0),(21195,'2019-01-24',20,0,0,0),(21196,'2019-01-24',21,0,0,0),(21197,'2019-01-24',22,0,0,0),(21198,'2019-01-24',23,0,0,0),(21199,'2019-01-24',24,0,0,0),(21200,'2019-01-24',25,0,0,0),(21201,'2019-01-24',26,0,0,0),(21202,'2019-01-24',27,0,0,0),(21203,'2019-01-24',28,0,0,0),(21204,'2019-01-24',29,0,0,0),(21205,'2019-01-24',30,0,0,0),(21206,'2019-01-24',31,0,0,0),(21207,'2019-01-24',32,0,0,0),(21208,'2019-01-24',33,0,0,0),(21209,'2019-01-24',34,0,0,0),(21210,'2019-01-24',35,0,0,0),(21211,'2019-01-24',36,0,0,0),(21212,'2019-01-24',37,0,0,0),(21213,'2019-01-24',38,0,0,0),(21214,'2019-01-24',39,0,0,0),(21215,'2019-01-24',40,0,0,0),(21216,'2019-01-24',41,0,0,0),(21217,'2019-01-24',42,0,0,0),(21218,'2019-01-24',43,0,0,0),(21219,'2019-01-24',44,0,0,0),(21220,'2019-01-24',45,0,0,0),(21221,'2019-01-24',46,0,0,0),(21222,'2019-01-24',47,0,0,0),(21223,'2019-01-24',48,0,0,0),(21224,'2019-01-24',49,0,0,0),(21225,'2019-01-24',50,0,0,0),(21226,'2019-01-24',51,0,0,0),(21227,'2019-01-24',52,0,0,0),(21228,'2019-01-24',53,0,0,0),(21229,'2019-01-24',54,0,0,0),(21230,'2019-01-24',55,0,0,0),(21231,'2019-01-24',56,0,0,0),(21232,'2019-01-24',57,0,0,0),(21233,'2019-01-24',58,0,0,0),(21234,'2019-01-24',59,0,0,0),(21235,'2019-01-24',60,0,0,0),(21236,'2019-01-24',61,0,0,0),(21237,'2019-01-24',62,0,0,0),(21238,'2019-01-24',63,0,0,0),(21239,'2019-01-24',64,0,0,0),(21240,'2019-01-24',65,0,0,0),(21241,'2019-01-24',66,0,0,0),(21242,'2019-01-24',67,0,0,0),(21243,'2019-01-24',68,0,0,0),(21244,'2019-01-24',69,0,0,0),(21245,'2019-01-24',70,0,0,0),(21246,'2019-01-24',71,0,0,0),(21247,'2019-01-24',72,0,0,0),(21248,'2019-01-24',73,0,0,0),(21249,'2019-01-24',74,0,0,0),(21250,'2019-01-24',75,0,0,0),(21251,'2019-01-24',76,0,0,0),(21252,'2019-01-24',77,0,0,0),(21253,'2019-01-24',78,0,0,0),(21254,'2019-01-24',79,0,0,0),(21255,'2019-01-24',80,0,0,0),(21256,'2019-01-24',81,0,0,0),(21257,'2019-01-24',82,0,0,0),(21258,'2019-01-24',83,0,0,0),(21259,'2019-01-24',84,0,0,0),(21260,'2019-01-24',85,0,0,0),(21261,'2019-01-24',86,0,0,0),(21262,'2019-01-24',87,0,0,0),(21263,'2019-01-24',88,0,0,0),(21264,'2019-01-24',89,0,0,0),(21265,'2019-01-24',90,0,0,0),(21266,'2019-01-24',91,0,0,0),(21267,'2019-01-24',92,0,0,0),(21268,'2019-01-24',93,0,0,0),(21269,'2019-01-24',94,0,0,0),(21270,'2019-01-24',95,0,0,0),(21271,'2019-01-24',96,0,0,0),(21272,'2019-01-24',97,0,0,0),(21273,'2019-01-24',98,0,0,0),(21274,'2019-01-24',99,0,0,0),(21275,'2019-01-24',100,0,0,0),(21276,'2019-01-24',101,0,0,0),(21277,'2019-01-24',102,0,0,0),(21278,'2019-01-24',103,0,0,0),(21279,'2019-01-24',104,0,0,0),(21280,'2019-01-24',105,0,0,0),(21281,'2019-01-24',106,0,0,0),(21282,'2019-01-24',107,0,0,0),(21283,'2019-01-24',108,0,0,0),(21284,'2019-01-24',109,0,0,0),(21285,'2019-01-24',110,0,0,0),(21286,'2019-01-24',111,0,0,0),(21287,'2019-01-24',112,0,0,0),(21288,'2019-01-24',113,0,0,0),(21289,'2019-01-24',114,0,0,0),(21290,'2019-01-24',115,0,0,0),(21291,'2019-01-24',116,0,0,0),(21292,'2019-01-24',117,0,0,0),(21293,'2019-01-24',118,0,0,0),(21294,'2019-01-24',119,0,0,0),(21295,'2019-01-24',120,0,0,0),(21296,'2019-01-24',121,0,0,0),(21297,'2019-01-24',122,0,0,0),(21298,'2019-01-24',123,0,0,0),(21299,'2019-01-24',124,0,0,0),(21300,'2019-01-24',125,0,0,0),(21301,'2019-01-24',126,0,0,0),(21302,'2019-01-24',127,0,0,0),(21303,'2019-01-24',128,0,0,0),(21304,'2019-01-24',129,0,0,0),(21305,'2019-01-24',130,0,0,0),(21306,'2019-01-24',131,0,0,0),(21307,'2019-01-24',132,0,0,0),(21308,'2019-01-24',133,0,0,0),(21309,'2019-01-24',134,0,0,0),(21310,'2019-01-24',135,0,0,0),(21311,'2019-01-24',136,0,0,0),(21312,'2019-01-24',137,0,0,0),(21313,'2019-01-24',138,0,0,0),(21314,'2019-01-24',139,0,0,0),(21315,'2019-01-24',140,0,0,0),(21316,'2019-01-24',141,0,0,0),(21317,'2019-01-24',142,0,0,0),(21318,'2019-01-24',143,0,0,0),(21319,'2019-01-24',144,0,0,0),(21320,'2019-01-24',145,0,0,0),(21321,'2019-01-24',146,0,0,0),(21322,'2019-01-24',147,0,0,0),(21323,'2019-01-24',148,0,0,0),(21324,'2019-01-24',149,0,0,0),(21325,'2019-01-24',150,0,0,0),(21326,'2019-01-24',151,0,0,0),(21327,'2019-01-24',152,0,0,0),(21328,'2019-01-24',153,0,0,0),(21329,'2019-01-24',154,0,0,0),(21330,'2019-01-24',155,0,0,0),(21331,'2019-01-24',156,0,0,0),(21332,'2019-01-24',157,0,0,0),(21333,'2019-01-24',158,0,0,0),(21334,'2019-01-24',159,0,0,0),(21335,'2019-01-24',160,0,0,0),(21336,'2019-01-24',161,0,0,0),(21337,'2019-01-24',162,0,0,0),(21338,'2019-01-24',163,0,0,0),(21339,'2019-01-24',164,0,0,0),(21340,'2019-01-24',165,0,0,0),(21341,'2019-01-24',166,0,0,0),(21342,'2019-01-24',167,0,0,0),(21343,'2019-01-24',168,0,0,0),(21344,'2019-01-24',169,0,0,0),(21345,'2019-01-24',170,0,0,0),(21346,'2019-01-24',171,0,0,0),(21347,'2019-01-24',172,0,0,0),(21348,'2019-01-24',173,0,0,0),(21349,'2019-01-24',174,0,0,0),(21350,'2019-01-24',175,0,0,0),(21351,'2019-01-24',176,0,0,0),(21352,'2019-01-24',177,0,0,0),(21353,'2019-01-24',178,0,0,0),(21354,'2019-01-24',179,0,0,0),(21355,'2019-01-24',180,0,0,0),(21356,'2019-01-24',181,0,0,0),(21357,'2019-01-24',182,0,0,0),(21358,'2019-01-24',183,0,0,0),(21359,'2019-01-24',184,0,0,0),(21360,'2019-01-24',185,0,0,0),(21361,'2019-01-24',186,0,0,0),(21362,'2019-01-24',187,0,0,0),(21363,'2019-01-24',188,0,0,0),(21364,'2019-01-24',189,0,0,0),(21365,'2019-01-24',190,0,0,0),(21366,'2019-01-24',191,0,0,0),(21367,'2019-01-24',192,0,0,0),(21368,'2019-01-24',193,0,0,0),(21369,'2019-01-24',194,0,0,0),(21370,'2019-01-24',195,0,0,0),(21371,'2019-01-24',196,0,0,0),(21372,'2019-01-24',197,0,0,0),(21373,'2019-01-24',198,0,0,0),(21374,'2019-01-24',199,0,0,0),(21375,'2019-01-24',200,0,0,0),(21376,'2019-01-24',201,0,0,0),(21377,'2019-01-24',202,0,0,0),(21378,'2019-01-24',203,0,0,0),(21379,'2019-01-24',204,0,0,0),(21438,'2019-01-24',1,0,0,0),(21439,'2019-01-24',2,0,0,0),(21440,'2019-01-24',9,0,0,0),(21441,'2019-01-24',11,0,0,0),(21442,'2019-01-24',12,0,0,0),(21443,'2019-01-24',13,0,0,0),(21444,'2019-01-24',14,0,0,0),(21445,'2019-01-24',15,0,0,0),(21446,'2019-01-24',16,0,0,0),(21447,'2019-01-24',17,0,0,0),(21448,'2019-01-24',18,0,0,0),(21449,'2019-01-24',19,0,0,0),(21450,'2019-01-24',20,0,0,0),(21451,'2019-01-24',21,0,0,0),(21452,'2019-01-24',22,0,0,0),(21453,'2019-01-24',23,0,0,0),(21454,'2019-01-24',24,0,0,0),(21455,'2019-01-24',25,0,0,0),(21456,'2019-01-24',26,0,0,0),(21457,'2019-01-24',27,0,0,0),(21458,'2019-01-24',28,0,0,0),(21459,'2019-01-24',29,0,0,0),(21460,'2019-01-24',30,0,0,0),(21461,'2019-01-24',31,0,0,0),(21462,'2019-01-24',32,0,0,0),(21463,'2019-01-24',33,0,0,0),(21464,'2019-01-24',34,0,0,0),(21465,'2019-01-24',35,0,0,0),(21466,'2019-01-24',36,0,0,0),(21467,'2019-01-24',37,0,0,0),(21468,'2019-01-24',38,0,0,0),(21469,'2019-01-24',39,0,0,0),(21470,'2019-01-24',40,0,0,0),(21471,'2019-01-24',41,0,0,0),(21472,'2019-01-24',42,0,0,0),(21473,'2019-01-24',43,0,0,0),(21474,'2019-01-24',44,0,0,0),(21475,'2019-01-24',45,0,0,0),(21476,'2019-01-24',46,0,0,0),(21477,'2019-01-24',47,0,0,0),(21478,'2019-01-24',48,0,0,0),(21479,'2019-01-24',49,0,0,0),(21480,'2019-01-24',50,0,0,0),(21481,'2019-01-24',51,0,0,0),(21482,'2019-01-24',52,0,0,0),(21483,'2019-01-24',53,0,0,0),(21484,'2019-01-24',54,0,0,0),(21485,'2019-01-24',55,0,0,0),(21486,'2019-01-24',56,0,0,0),(21487,'2019-01-24',57,0,0,0),(21488,'2019-01-24',58,0,0,0),(21489,'2019-01-24',59,0,0,0),(21490,'2019-01-24',60,0,0,0),(21491,'2019-01-24',61,0,0,0),(21492,'2019-01-24',62,0,0,0),(21493,'2019-01-24',63,0,0,0),(21494,'2019-01-24',64,0,0,0),(21495,'2019-01-24',65,0,0,0),(21496,'2019-01-24',66,0,0,0),(21497,'2019-01-24',67,0,0,0),(21498,'2019-01-24',68,0,0,0),(21499,'2019-01-24',69,0,0,0),(21500,'2019-01-24',70,0,0,0),(21501,'2019-01-24',71,0,0,0),(21502,'2019-01-24',72,0,0,0),(21503,'2019-01-24',73,0,0,0),(21504,'2019-01-24',74,0,0,0),(21505,'2019-01-24',75,0,0,0),(21506,'2019-01-24',76,0,0,0),(21507,'2019-01-24',77,0,0,0),(21508,'2019-01-24',78,0,0,0),(21509,'2019-01-24',79,0,0,0),(21510,'2019-01-24',80,0,0,0),(21511,'2019-01-24',81,0,0,0),(21512,'2019-01-24',82,0,0,0),(21513,'2019-01-24',83,0,0,0),(21514,'2019-01-24',84,0,0,0),(21515,'2019-01-24',85,0,0,0),(21516,'2019-01-24',86,0,0,0),(21517,'2019-01-24',87,0,0,0),(21518,'2019-01-24',88,0,0,0),(21519,'2019-01-24',89,0,0,0),(21520,'2019-01-24',90,0,0,0),(21521,'2019-01-24',91,0,0,0),(21522,'2019-01-24',92,0,0,0),(21523,'2019-01-24',93,0,0,0),(21524,'2019-01-24',94,0,0,0),(21525,'2019-01-24',95,0,0,0),(21526,'2019-01-24',96,0,0,0),(21527,'2019-01-24',97,0,0,0),(21528,'2019-01-24',98,0,0,0),(21529,'2019-01-24',99,0,0,0),(21530,'2019-01-24',100,0,0,0),(21531,'2019-01-24',101,0,0,0),(21532,'2019-01-24',102,0,0,0),(21533,'2019-01-24',103,0,0,0),(21534,'2019-01-24',104,0,0,0),(21535,'2019-01-24',105,0,0,0),(21536,'2019-01-24',106,0,0,0),(21537,'2019-01-24',107,0,0,0),(21538,'2019-01-24',108,0,0,0),(21539,'2019-01-24',109,0,0,0),(21540,'2019-01-24',110,0,0,0),(21541,'2019-01-24',111,0,0,0),(21542,'2019-01-24',112,0,0,0),(21543,'2019-01-24',113,0,0,0),(21544,'2019-01-24',114,0,0,0),(21545,'2019-01-24',115,0,0,0),(21546,'2019-01-24',116,0,0,0),(21547,'2019-01-24',117,0,0,0),(21548,'2019-01-24',118,0,0,0),(21549,'2019-01-24',119,0,0,0),(21550,'2019-01-24',120,0,0,0),(21551,'2019-01-24',121,0,0,0),(21552,'2019-01-24',122,0,0,0),(21553,'2019-01-24',123,0,0,0),(21554,'2019-01-24',124,0,0,0),(21555,'2019-01-24',125,0,0,0),(21556,'2019-01-24',126,0,0,0),(21557,'2019-01-24',127,0,0,0),(21558,'2019-01-24',128,0,0,0),(21559,'2019-01-24',129,0,0,0),(21560,'2019-01-24',130,0,0,0),(21561,'2019-01-24',131,0,0,0),(21562,'2019-01-24',132,0,0,0),(21563,'2019-01-24',133,0,0,0),(21564,'2019-01-24',134,0,0,0),(21565,'2019-01-24',135,0,0,0),(21566,'2019-01-24',136,0,0,0),(21567,'2019-01-24',137,0,0,0),(21568,'2019-01-24',138,0,0,0),(21569,'2019-01-24',139,0,0,0),(21570,'2019-01-24',140,0,0,0),(21571,'2019-01-24',141,0,0,0),(21572,'2019-01-24',142,0,0,0),(21573,'2019-01-24',143,0,0,0),(21574,'2019-01-24',144,0,0,0),(21575,'2019-01-24',145,0,0,0),(21576,'2019-01-24',146,0,0,0),(21577,'2019-01-24',147,0,0,0),(21578,'2019-01-24',148,0,0,0),(21579,'2019-01-24',149,0,0,0),(21580,'2019-01-24',150,0,0,0),(21581,'2019-01-24',151,0,0,0),(21582,'2019-01-24',152,0,0,0),(21583,'2019-01-24',153,0,0,0),(21584,'2019-01-24',154,0,0,0),(21585,'2019-01-24',155,0,0,0),(21586,'2019-01-24',156,0,0,0),(21587,'2019-01-24',157,0,0,0),(21588,'2019-01-24',158,0,0,0),(21589,'2019-01-24',159,0,0,0),(21590,'2019-01-24',160,0,0,0),(21591,'2019-01-24',161,0,0,0),(21592,'2019-01-24',162,0,0,0),(21593,'2019-01-24',163,0,0,0),(21594,'2019-01-24',164,0,0,0),(21595,'2019-01-24',165,0,0,0),(21596,'2019-01-24',166,0,0,0),(21597,'2019-01-24',167,0,0,0),(21598,'2019-01-24',168,0,0,0),(21599,'2019-01-24',169,0,0,0),(21600,'2019-01-24',170,0,0,0),(21601,'2019-01-24',171,0,0,0),(21602,'2019-01-24',172,0,0,0),(21603,'2019-01-24',173,0,0,0),(21604,'2019-01-24',174,0,0,0),(21605,'2019-01-24',175,0,0,0),(21606,'2019-01-24',176,0,0,0),(21607,'2019-01-24',177,0,0,0),(21608,'2019-01-24',178,0,0,0),(21609,'2019-01-24',179,0,0,0),(21610,'2019-01-24',180,0,0,0),(21611,'2019-01-24',181,0,0,0),(21612,'2019-01-24',182,0,0,0),(21613,'2019-01-24',183,0,0,0),(21614,'2019-01-24',184,0,0,0),(21615,'2019-01-24',185,0,0,0),(21616,'2019-01-24',186,0,0,0),(21617,'2019-01-24',187,0,0,0),(21618,'2019-01-24',188,0,0,0),(21619,'2019-01-24',189,0,0,0),(21620,'2019-01-24',190,0,0,0),(21621,'2019-01-24',191,0,0,0),(21622,'2019-01-24',192,0,0,0),(21623,'2019-01-24',193,0,0,0),(21624,'2019-01-24',194,0,0,0),(21625,'2019-01-24',195,0,0,0),(21626,'2019-01-24',196,0,0,0),(21627,'2019-01-24',197,0,0,0),(21628,'2019-01-24',198,0,0,0),(21629,'2019-01-24',199,0,0,0),(21630,'2019-01-24',200,0,0,0),(21631,'2019-01-24',201,0,0,0),(21632,'2019-01-24',202,0,0,0),(21633,'2019-01-24',203,0,0,0),(21634,'2019-01-24',204,0,0,0),(21693,'2019-01-24',1,0,0,0),(21694,'2019-01-24',2,0,0,0),(21695,'2019-01-24',9,0,0,0),(21696,'2019-01-24',11,0,0,0),(21697,'2019-01-24',12,0,0,0),(21698,'2019-01-24',13,0,0,0),(21699,'2019-01-24',14,0,0,0),(21700,'2019-01-24',15,0,0,0),(21701,'2019-01-24',16,0,0,0),(21702,'2019-01-24',17,0,0,0),(21703,'2019-01-24',18,0,0,0),(21704,'2019-01-24',19,0,0,0),(21705,'2019-01-24',20,0,0,0),(21706,'2019-01-24',21,0,0,0),(21707,'2019-01-24',22,0,0,0),(21708,'2019-01-24',23,0,0,0),(21709,'2019-01-24',24,0,0,0),(21710,'2019-01-24',25,0,0,0),(21711,'2019-01-24',26,0,0,0),(21712,'2019-01-24',27,0,0,0),(21713,'2019-01-24',28,0,0,0),(21714,'2019-01-24',29,0,0,0),(21715,'2019-01-24',30,0,0,0),(21716,'2019-01-24',31,0,0,0),(21717,'2019-01-24',32,0,0,0),(21718,'2019-01-24',33,0,0,0),(21719,'2019-01-24',34,0,0,0),(21720,'2019-01-24',35,0,0,0),(21721,'2019-01-24',36,0,0,0),(21722,'2019-01-24',37,0,0,0),(21723,'2019-01-24',38,0,0,0),(21724,'2019-01-24',39,0,0,0),(21725,'2019-01-24',40,0,0,0),(21726,'2019-01-24',41,0,0,0),(21727,'2019-01-24',42,0,0,0),(21728,'2019-01-24',43,0,0,0),(21729,'2019-01-24',44,0,0,0),(21730,'2019-01-24',45,0,0,0),(21731,'2019-01-24',46,0,0,0),(21732,'2019-01-24',47,0,0,0),(21733,'2019-01-24',48,0,0,0),(21734,'2019-01-24',49,0,0,0),(21735,'2019-01-24',50,0,0,0),(21736,'2019-01-24',51,0,0,0),(21737,'2019-01-24',52,0,0,0),(21738,'2019-01-24',53,0,0,0),(21739,'2019-01-24',54,0,0,0),(21740,'2019-01-24',55,0,0,0),(21741,'2019-01-24',56,0,0,0),(21742,'2019-01-24',57,0,0,0),(21743,'2019-01-24',58,0,0,0),(21744,'2019-01-24',59,0,0,0),(21745,'2019-01-24',60,0,0,0),(21746,'2019-01-24',61,0,0,0),(21747,'2019-01-24',62,0,0,0),(21748,'2019-01-24',63,0,0,0),(21749,'2019-01-24',64,0,0,0),(21750,'2019-01-24',65,0,0,0),(21751,'2019-01-24',66,0,0,0),(21752,'2019-01-24',67,0,0,0),(21753,'2019-01-24',68,0,0,0),(21754,'2019-01-24',69,0,0,0),(21755,'2019-01-24',70,0,0,0),(21756,'2019-01-24',71,0,0,0),(21757,'2019-01-24',72,0,0,0),(21758,'2019-01-24',73,0,0,0),(21759,'2019-01-24',74,0,0,0),(21760,'2019-01-24',75,0,0,0),(21761,'2019-01-24',76,0,0,0),(21762,'2019-01-24',77,0,0,0),(21763,'2019-01-24',78,0,0,0),(21764,'2019-01-24',79,0,0,0),(21765,'2019-01-24',80,0,0,0),(21766,'2019-01-24',81,0,0,0),(21767,'2019-01-24',82,0,0,0),(21768,'2019-01-24',83,0,0,0),(21769,'2019-01-24',84,0,0,0),(21770,'2019-01-24',85,0,0,0),(21771,'2019-01-24',86,0,0,0),(21772,'2019-01-24',87,0,0,0),(21773,'2019-01-24',88,0,0,0),(21774,'2019-01-24',89,0,0,0),(21775,'2019-01-24',90,0,0,0),(21776,'2019-01-24',91,0,0,0),(21777,'2019-01-24',92,0,0,0),(21778,'2019-01-24',93,0,0,0),(21779,'2019-01-24',94,0,0,0),(21780,'2019-01-24',95,0,0,0),(21781,'2019-01-24',96,0,0,0),(21782,'2019-01-24',97,0,0,0),(21783,'2019-01-24',98,0,0,0),(21784,'2019-01-24',99,0,0,0),(21785,'2019-01-24',100,0,0,0),(21786,'2019-01-24',101,0,0,0),(21787,'2019-01-24',102,0,0,0),(21788,'2019-01-24',103,0,0,0),(21789,'2019-01-24',104,0,0,0),(21790,'2019-01-24',105,0,0,0),(21791,'2019-01-24',106,0,0,0),(21792,'2019-01-24',107,0,0,0),(21793,'2019-01-24',108,0,0,0),(21794,'2019-01-24',109,0,0,0),(21795,'2019-01-24',110,0,0,0),(21796,'2019-01-24',111,0,0,0),(21797,'2019-01-24',112,0,0,0),(21798,'2019-01-24',113,0,0,0),(21799,'2019-01-24',114,0,0,0),(21800,'2019-01-24',115,0,0,0),(21801,'2019-01-24',116,0,0,0),(21802,'2019-01-24',117,0,0,0),(21803,'2019-01-24',118,0,0,0),(21804,'2019-01-24',119,0,0,0),(21805,'2019-01-24',120,0,0,0),(21806,'2019-01-24',121,0,0,0),(21807,'2019-01-24',122,0,0,0),(21808,'2019-01-24',123,0,0,0),(21809,'2019-01-24',124,0,0,0),(21810,'2019-01-24',125,0,0,0),(21811,'2019-01-24',126,0,0,0),(21812,'2019-01-24',127,0,0,0),(21813,'2019-01-24',128,0,0,0),(21814,'2019-01-24',129,0,0,0),(21815,'2019-01-24',130,0,0,0),(21816,'2019-01-24',131,0,0,0),(21817,'2019-01-24',132,0,0,0),(21818,'2019-01-24',133,0,0,0),(21819,'2019-01-24',134,0,0,0),(21820,'2019-01-24',135,0,0,0),(21821,'2019-01-24',136,0,0,0),(21822,'2019-01-24',137,0,0,0),(21823,'2019-01-24',138,0,0,0),(21824,'2019-01-24',139,0,0,0),(21825,'2019-01-24',140,0,0,0),(21826,'2019-01-24',141,0,0,0),(21827,'2019-01-24',142,0,0,0),(21828,'2019-01-24',143,0,0,0),(21829,'2019-01-24',144,0,0,0),(21830,'2019-01-24',145,0,0,0),(21831,'2019-01-24',146,0,0,0),(21832,'2019-01-24',147,0,0,0),(21833,'2019-01-24',148,0,0,0),(21834,'2019-01-24',149,0,0,0),(21835,'2019-01-24',150,0,0,0),(21836,'2019-01-24',151,0,0,0),(21837,'2019-01-24',152,0,0,0),(21838,'2019-01-24',153,0,0,0),(21839,'2019-01-24',154,0,0,0),(21840,'2019-01-24',155,0,0,0),(21841,'2019-01-24',156,0,0,0),(21842,'2019-01-24',157,0,0,0),(21843,'2019-01-24',158,0,0,0),(21844,'2019-01-24',159,0,0,0),(21845,'2019-01-24',160,0,0,0),(21846,'2019-01-24',161,0,0,0),(21847,'2019-01-24',162,0,0,0),(21848,'2019-01-24',163,0,0,0),(21849,'2019-01-24',164,0,0,0),(21850,'2019-01-24',165,0,0,0),(21851,'2019-01-24',166,0,0,0),(21852,'2019-01-24',167,0,0,0),(21853,'2019-01-24',168,0,0,0),(21854,'2019-01-24',169,0,0,0),(21855,'2019-01-24',170,0,0,0),(21856,'2019-01-24',171,0,0,0),(21857,'2019-01-24',172,0,0,0),(21858,'2019-01-24',173,0,0,0),(21859,'2019-01-24',174,0,0,0),(21860,'2019-01-24',175,0,0,0),(21861,'2019-01-24',176,0,0,0),(21862,'2019-01-24',177,0,0,0),(21863,'2019-01-24',178,0,0,0),(21864,'2019-01-24',179,0,0,0),(21865,'2019-01-24',180,0,0,0),(21866,'2019-01-24',181,0,0,0),(21867,'2019-01-24',182,0,0,0),(21868,'2019-01-24',183,0,0,0),(21869,'2019-01-24',184,0,0,0),(21870,'2019-01-24',185,0,0,0),(21871,'2019-01-24',186,0,0,0),(21872,'2019-01-24',187,0,0,0),(21873,'2019-01-24',188,0,0,0),(21874,'2019-01-24',189,0,0,0),(21875,'2019-01-24',190,0,0,0),(21876,'2019-01-24',191,0,0,0),(21877,'2019-01-24',192,0,0,0),(21878,'2019-01-24',193,0,0,0),(21879,'2019-01-24',194,0,0,0),(21880,'2019-01-24',195,0,0,0),(21881,'2019-01-24',196,0,0,0),(21882,'2019-01-24',197,0,0,0),(21883,'2019-01-24',198,0,0,0),(21884,'2019-01-24',199,0,0,0),(21885,'2019-01-24',200,0,0,0),(21886,'2019-01-24',201,0,0,0),(21887,'2019-01-24',202,0,0,0),(21888,'2019-01-24',203,0,0,0),(21889,'2019-01-24',204,0,0,0),(21890,'2019-01-25',1,0,0,0),(21891,'2019-01-25',2,0,0,0),(21892,'2019-01-25',9,0,0,0),(21893,'2019-01-25',11,0,0,0),(21894,'2019-01-25',12,0,0,0),(21895,'2019-01-25',13,0,0,0),(21896,'2019-01-25',14,0,0,0),(21897,'2019-01-25',15,0,0,0),(21898,'2019-01-25',16,0,0,0),(21899,'2019-01-25',17,0,0,0),(21900,'2019-01-25',18,0,0,0),(21901,'2019-01-25',19,0,0,0),(21902,'2019-01-25',20,0,0,0),(21903,'2019-01-25',21,0,0,0),(21904,'2019-01-25',22,0,0,0),(21905,'2019-01-25',23,0,0,0),(21906,'2019-01-25',24,0,0,0),(21907,'2019-01-25',25,0,0,0),(21908,'2019-01-25',26,0,0,0),(21909,'2019-01-25',27,0,0,0),(21910,'2019-01-25',28,0,0,0),(21911,'2019-01-25',29,0,0,0),(21912,'2019-01-25',30,0,0,0),(21913,'2019-01-25',31,0,0,0),(21914,'2019-01-25',32,0,0,0),(21915,'2019-01-25',33,0,0,0),(21916,'2019-01-25',34,0,0,0),(21917,'2019-01-25',35,0,0,0),(21918,'2019-01-25',36,0,0,0),(21919,'2019-01-25',37,0,0,0),(21920,'2019-01-25',38,0,0,0),(21921,'2019-01-25',39,0,0,0),(21922,'2019-01-25',40,0,0,0),(21923,'2019-01-25',41,0,0,0),(21924,'2019-01-25',42,0,0,0),(21925,'2019-01-25',43,0,0,0),(21926,'2019-01-25',44,0,0,0),(21927,'2019-01-25',45,0,0,0),(21928,'2019-01-25',46,0,0,0),(21929,'2019-01-25',47,0,0,0),(21930,'2019-01-25',48,0,0,0),(21931,'2019-01-25',49,0,0,0),(21932,'2019-01-25',50,0,0,0),(21933,'2019-01-25',51,0,0,0),(21934,'2019-01-25',52,0,0,0),(21935,'2019-01-25',53,0,0,0),(21936,'2019-01-25',54,0,0,0),(21937,'2019-01-25',55,0,0,0),(21938,'2019-01-25',56,0,0,0),(21939,'2019-01-25',57,0,0,0),(21940,'2019-01-25',58,0,0,0),(21941,'2019-01-25',59,0,0,0),(21942,'2019-01-25',60,0,0,0),(21943,'2019-01-25',61,0,0,0),(21944,'2019-01-25',62,0,0,0),(21945,'2019-01-25',63,0,0,0),(21946,'2019-01-25',64,0,0,0),(21947,'2019-01-25',65,0,0,0),(21948,'2019-01-25',66,0,0,0),(21949,'2019-01-25',67,0,0,0),(21950,'2019-01-25',68,0,0,0),(21951,'2019-01-25',69,0,0,0),(21952,'2019-01-25',70,0,0,0),(21953,'2019-01-25',71,0,0,0),(21954,'2019-01-25',72,0,0,0),(21955,'2019-01-25',73,0,0,0),(21956,'2019-01-25',74,0,0,0),(21957,'2019-01-25',75,0,0,0),(21958,'2019-01-25',76,0,0,0),(21959,'2019-01-25',77,0,0,0),(21960,'2019-01-25',78,0,0,0),(21961,'2019-01-25',79,0,0,0),(21962,'2019-01-25',80,0,0,0),(21963,'2019-01-25',81,0,0,0),(21964,'2019-01-25',82,0,0,0),(21965,'2019-01-25',83,0,0,0),(21966,'2019-01-25',84,0,0,0),(21967,'2019-01-25',85,0,0,0),(21968,'2019-01-25',86,0,0,0),(21969,'2019-01-25',87,0,0,0),(21970,'2019-01-25',88,0,0,0),(21971,'2019-01-25',89,0,0,0),(21972,'2019-01-25',90,0,0,0),(21973,'2019-01-25',91,0,0,0),(21974,'2019-01-25',92,0,0,0),(21975,'2019-01-25',93,0,0,0),(21976,'2019-01-25',94,0,0,0),(21977,'2019-01-25',95,0,0,0),(21978,'2019-01-25',96,0,0,0),(21979,'2019-01-25',97,0,0,0),(21980,'2019-01-25',98,0,0,0),(21981,'2019-01-25',99,0,0,0),(21982,'2019-01-25',100,0,0,0),(21983,'2019-01-25',101,0,0,0),(21984,'2019-01-25',102,0,0,0),(21985,'2019-01-25',103,0,0,0),(21986,'2019-01-25',104,0,0,0),(21987,'2019-01-25',105,0,0,0),(21988,'2019-01-25',106,0,0,0),(21989,'2019-01-25',107,0,0,0),(21990,'2019-01-25',108,0,0,0),(21991,'2019-01-25',109,0,0,0),(21992,'2019-01-25',110,0,0,0),(21993,'2019-01-25',111,0,0,0),(21994,'2019-01-25',112,0,0,0),(21995,'2019-01-25',113,0,0,0),(21996,'2019-01-25',114,0,0,0),(21997,'2019-01-25',115,0,0,0),(21998,'2019-01-25',116,0,0,0),(21999,'2019-01-25',117,0,0,0),(22000,'2019-01-25',118,0,0,0),(22001,'2019-01-25',119,0,0,0),(22002,'2019-01-25',120,0,0,0),(22003,'2019-01-25',121,0,0,0),(22004,'2019-01-25',122,0,0,0),(22005,'2019-01-25',123,0,0,0),(22006,'2019-01-25',124,0,0,0),(22007,'2019-01-25',125,0,0,0),(22008,'2019-01-25',126,0,0,0),(22009,'2019-01-25',127,0,0,0),(22010,'2019-01-25',128,0,0,0),(22011,'2019-01-25',129,0,0,0),(22012,'2019-01-25',130,0,0,0),(22013,'2019-01-25',131,0,0,0),(22014,'2019-01-25',132,0,0,0),(22015,'2019-01-25',133,0,0,0),(22016,'2019-01-25',134,0,0,0),(22017,'2019-01-25',135,0,0,0),(22018,'2019-01-25',136,0,0,0),(22019,'2019-01-25',137,0,0,0),(22020,'2019-01-25',138,0,0,0),(22021,'2019-01-25',139,0,0,0),(22022,'2019-01-25',140,0,0,0),(22023,'2019-01-25',141,0,0,0),(22024,'2019-01-25',142,0,0,0),(22025,'2019-01-25',143,0,0,0),(22026,'2019-01-25',144,0,0,0),(22027,'2019-01-25',145,0,0,0),(22028,'2019-01-25',146,0,0,0),(22029,'2019-01-25',147,0,0,0),(22030,'2019-01-25',148,0,0,0),(22031,'2019-01-25',149,0,0,0),(22032,'2019-01-25',150,0,0,0),(22033,'2019-01-25',151,0,0,0),(22034,'2019-01-25',152,0,0,0),(22035,'2019-01-25',153,0,0,0),(22036,'2019-01-25',154,0,0,0),(22037,'2019-01-25',155,0,0,0),(22038,'2019-01-25',156,0,0,0),(22039,'2019-01-25',157,0,0,0),(22040,'2019-01-25',158,0,0,0),(22041,'2019-01-25',159,0,0,0),(22042,'2019-01-25',160,0,0,0),(22043,'2019-01-25',161,0,0,0),(22044,'2019-01-25',162,0,0,0),(22045,'2019-01-25',163,0,0,0),(22046,'2019-01-25',164,0,0,0),(22047,'2019-01-25',165,0,0,0),(22048,'2019-01-25',166,0,0,0),(22049,'2019-01-25',167,0,0,0),(22050,'2019-01-25',168,0,0,0),(22051,'2019-01-25',169,0,0,0),(22052,'2019-01-25',170,0,0,0),(22053,'2019-01-25',171,0,0,0),(22054,'2019-01-25',172,0,0,0),(22055,'2019-01-25',173,0,0,0),(22056,'2019-01-25',174,0,0,0),(22057,'2019-01-25',175,0,0,0),(22058,'2019-01-25',176,0,0,0),(22059,'2019-01-25',177,0,0,0),(22060,'2019-01-25',178,0,0,0),(22061,'2019-01-25',179,0,0,0),(22062,'2019-01-25',180,0,0,0),(22063,'2019-01-25',181,0,0,0),(22064,'2019-01-25',182,0,0,0),(22065,'2019-01-25',183,0,0,0),(22066,'2019-01-25',184,0,0,0),(22067,'2019-01-25',185,0,0,0),(22068,'2019-01-25',186,0,0,0),(22069,'2019-01-25',187,0,0,0),(22070,'2019-01-25',188,0,0,0),(22071,'2019-01-25',189,0,0,0),(22072,'2019-01-25',190,0,0,0),(22073,'2019-01-25',191,0,0,0),(22074,'2019-01-25',192,0,0,0),(22075,'2019-01-25',193,0,0,0),(22076,'2019-01-25',194,0,0,0),(22077,'2019-01-25',195,0,0,0),(22078,'2019-01-25',196,0,0,0),(22079,'2019-01-25',197,0,0,0),(22080,'2019-01-25',198,0,0,0),(22081,'2019-01-25',199,0,0,0),(22082,'2019-01-25',200,0,0,0),(22083,'2019-01-25',201,0,0,0),(22084,'2019-01-25',202,0,0,0),(22085,'2019-01-25',203,0,0,0),(22086,'2019-01-25',204,0,0,0),(22087,'2019-01-26',1,0,0,0),(22088,'2019-01-26',2,0,0,0),(22089,'2019-01-26',9,0,0,0),(22090,'2019-01-26',11,0,0,0),(22091,'2019-01-26',12,0,0,0),(22092,'2019-01-26',13,0,0,0),(22093,'2019-01-26',14,0,0,0),(22094,'2019-01-26',15,0,0,0),(22095,'2019-01-26',16,0,0,0),(22096,'2019-01-26',17,0,0,0),(22097,'2019-01-26',18,0,0,0),(22098,'2019-01-26',19,0,0,0),(22099,'2019-01-26',20,0,0,0),(22100,'2019-01-26',21,0,0,0),(22101,'2019-01-26',22,0,0,0),(22102,'2019-01-26',23,0,0,0),(22103,'2019-01-26',24,0,0,0),(22104,'2019-01-26',25,0,0,0),(22105,'2019-01-26',26,0,0,0),(22106,'2019-01-26',27,0,0,0),(22107,'2019-01-26',28,0,0,0),(22108,'2019-01-26',29,0,0,0),(22109,'2019-01-26',30,0,0,0),(22110,'2019-01-26',31,0,0,0),(22111,'2019-01-26',32,0,0,0),(22112,'2019-01-26',33,0,0,0),(22113,'2019-01-26',34,0,0,0),(22114,'2019-01-26',35,0,0,0),(22115,'2019-01-26',36,0,0,0),(22116,'2019-01-26',37,0,0,0),(22117,'2019-01-26',38,0,0,0),(22118,'2019-01-26',39,0,0,0),(22119,'2019-01-26',40,0,0,0),(22120,'2019-01-26',41,0,0,0),(22121,'2019-01-26',42,0,0,0),(22122,'2019-01-26',43,0,0,0),(22123,'2019-01-26',44,0,0,0),(22124,'2019-01-26',45,0,0,0),(22125,'2019-01-26',46,0,0,0),(22126,'2019-01-26',47,0,0,0),(22127,'2019-01-26',48,0,0,0),(22128,'2019-01-26',49,0,0,0),(22129,'2019-01-26',50,0,0,0),(22130,'2019-01-26',51,0,0,0),(22131,'2019-01-26',52,0,0,0),(22132,'2019-01-26',53,0,0,0),(22133,'2019-01-26',54,0,0,0),(22134,'2019-01-26',55,0,0,0),(22135,'2019-01-26',56,0,0,0),(22136,'2019-01-26',57,0,0,0),(22137,'2019-01-26',58,0,0,0),(22138,'2019-01-26',59,0,0,0),(22139,'2019-01-26',60,0,0,0),(22140,'2019-01-26',61,0,0,0),(22141,'2019-01-26',62,0,0,0),(22142,'2019-01-26',63,0,0,0),(22143,'2019-01-26',64,0,0,0),(22144,'2019-01-26',65,0,0,0),(22145,'2019-01-26',66,0,0,0),(22146,'2019-01-26',67,0,0,0),(22147,'2019-01-26',68,0,0,0),(22148,'2019-01-26',69,0,0,0),(22149,'2019-01-26',70,0,0,0),(22150,'2019-01-26',71,0,0,0),(22151,'2019-01-26',72,0,0,0),(22152,'2019-01-26',73,0,0,0),(22153,'2019-01-26',74,0,0,0),(22154,'2019-01-26',75,0,0,0),(22155,'2019-01-26',76,0,0,0),(22156,'2019-01-26',77,0,0,0),(22157,'2019-01-26',78,0,0,0),(22158,'2019-01-26',79,0,0,0),(22159,'2019-01-26',80,0,0,0),(22160,'2019-01-26',81,0,0,0),(22161,'2019-01-26',82,0,0,0),(22162,'2019-01-26',83,0,0,0),(22163,'2019-01-26',84,0,0,0),(22164,'2019-01-26',85,0,0,0),(22165,'2019-01-26',86,0,0,0),(22166,'2019-01-26',87,0,0,0),(22167,'2019-01-26',88,0,0,0),(22168,'2019-01-26',89,0,0,0),(22169,'2019-01-26',90,0,0,0),(22170,'2019-01-26',91,0,0,0),(22171,'2019-01-26',92,0,0,0),(22172,'2019-01-26',93,0,0,0),(22173,'2019-01-26',94,0,0,0),(22174,'2019-01-26',95,0,0,0),(22175,'2019-01-26',96,0,0,0),(22176,'2019-01-26',97,0,0,0),(22177,'2019-01-26',98,0,0,0),(22178,'2019-01-26',99,0,0,0),(22179,'2019-01-26',100,0,0,0),(22180,'2019-01-26',101,0,0,0),(22181,'2019-01-26',102,0,0,0),(22182,'2019-01-26',103,0,0,0),(22183,'2019-01-26',104,0,0,0),(22184,'2019-01-26',105,0,0,0),(22185,'2019-01-26',106,0,0,0),(22186,'2019-01-26',107,0,0,0),(22187,'2019-01-26',108,0,0,0),(22188,'2019-01-26',109,0,0,0),(22189,'2019-01-26',110,0,0,0),(22190,'2019-01-26',111,0,0,0),(22191,'2019-01-26',112,0,0,0),(22192,'2019-01-26',113,0,0,0),(22193,'2019-01-26',114,0,0,0),(22194,'2019-01-26',115,0,0,0),(22195,'2019-01-26',116,0,0,0),(22196,'2019-01-26',117,0,0,0),(22197,'2019-01-26',118,0,0,0),(22198,'2019-01-26',119,0,0,0),(22199,'2019-01-26',120,0,0,0),(22200,'2019-01-26',121,0,0,0),(22201,'2019-01-26',122,0,0,0),(22202,'2019-01-26',123,0,0,0),(22203,'2019-01-26',124,0,0,0),(22204,'2019-01-26',125,0,0,0),(22205,'2019-01-26',126,0,0,0),(22206,'2019-01-26',127,0,0,0),(22207,'2019-01-26',128,0,0,0),(22208,'2019-01-26',129,0,0,0),(22209,'2019-01-26',130,0,0,0),(22210,'2019-01-26',131,0,0,0),(22211,'2019-01-26',132,0,0,0),(22212,'2019-01-26',133,0,0,0),(22213,'2019-01-26',134,0,0,0),(22214,'2019-01-26',135,0,0,0),(22215,'2019-01-26',136,0,0,0),(22216,'2019-01-26',137,0,0,0),(22217,'2019-01-26',138,0,0,0),(22218,'2019-01-26',139,0,0,0),(22219,'2019-01-26',140,0,0,0),(22220,'2019-01-26',141,0,0,0),(22221,'2019-01-26',142,0,0,0),(22222,'2019-01-26',143,0,0,0),(22223,'2019-01-26',144,0,0,0),(22224,'2019-01-26',145,0,0,0),(22225,'2019-01-26',146,0,0,0),(22226,'2019-01-26',147,0,0,0),(22227,'2019-01-26',148,0,0,0),(22228,'2019-01-26',149,0,0,0),(22229,'2019-01-26',150,0,0,0),(22230,'2019-01-26',151,0,0,0),(22231,'2019-01-26',152,0,0,0),(22232,'2019-01-26',153,0,0,0),(22233,'2019-01-26',154,0,0,0),(22234,'2019-01-26',155,0,0,0),(22235,'2019-01-26',156,0,0,0),(22236,'2019-01-26',157,0,0,0),(22237,'2019-01-26',158,0,0,0),(22238,'2019-01-26',159,0,0,0),(22239,'2019-01-26',160,0,0,0),(22240,'2019-01-26',161,0,0,0),(22241,'2019-01-26',162,0,0,0),(22242,'2019-01-26',163,0,0,0),(22243,'2019-01-26',164,0,0,0),(22244,'2019-01-26',165,0,0,0),(22245,'2019-01-26',166,0,0,0),(22246,'2019-01-26',167,0,0,0),(22247,'2019-01-26',168,0,0,0),(22248,'2019-01-26',169,0,0,0),(22249,'2019-01-26',170,0,0,0),(22250,'2019-01-26',171,0,0,0),(22251,'2019-01-26',172,0,0,0),(22252,'2019-01-26',173,0,0,0),(22253,'2019-01-26',174,0,0,0),(22254,'2019-01-26',175,0,0,0),(22255,'2019-01-26',176,0,0,0),(22256,'2019-01-26',177,0,0,0),(22257,'2019-01-26',178,0,0,0),(22258,'2019-01-26',179,0,0,0),(22259,'2019-01-26',180,0,0,0),(22260,'2019-01-26',181,0,0,0),(22261,'2019-01-26',182,0,0,0),(22262,'2019-01-26',183,0,0,0),(22263,'2019-01-26',184,0,0,0),(22264,'2019-01-26',185,0,0,0),(22265,'2019-01-26',186,0,0,0),(22266,'2019-01-26',187,0,0,0),(22267,'2019-01-26',188,0,0,0),(22268,'2019-01-26',189,0,0,0),(22269,'2019-01-26',190,0,0,0),(22270,'2019-01-26',191,0,0,0),(22271,'2019-01-26',192,0,0,0),(22272,'2019-01-26',193,0,0,0),(22273,'2019-01-26',194,0,0,0),(22274,'2019-01-26',195,0,0,0),(22275,'2019-01-26',196,0,0,0),(22276,'2019-01-26',197,0,0,0),(22277,'2019-01-26',198,0,0,0),(22278,'2019-01-26',199,0,0,0),(22279,'2019-01-26',200,0,0,0),(22280,'2019-01-26',201,0,0,0),(22281,'2019-01-26',202,0,0,0),(22282,'2019-01-26',203,0,0,0),(22283,'2019-01-26',204,0,0,0),(22284,'2019-01-27',1,0,0,0),(22285,'2019-01-27',2,0,0,0),(22286,'2019-01-27',9,0,0,0),(22287,'2019-01-27',11,0,0,0),(22288,'2019-01-27',12,0,0,0),(22289,'2019-01-27',13,0,0,0),(22290,'2019-01-27',14,0,0,0),(22291,'2019-01-27',15,0,0,0),(22292,'2019-01-27',16,0,0,0),(22293,'2019-01-27',17,0,0,0),(22294,'2019-01-27',18,0,0,0),(22295,'2019-01-27',19,0,0,0),(22296,'2019-01-27',20,0,0,0),(22297,'2019-01-27',21,0,0,0),(22298,'2019-01-27',22,0,0,0),(22299,'2019-01-27',23,0,0,0),(22300,'2019-01-27',24,0,0,0),(22301,'2019-01-27',25,0,0,0),(22302,'2019-01-27',26,0,0,0),(22303,'2019-01-27',27,0,0,0),(22304,'2019-01-27',28,0,0,0),(22305,'2019-01-27',29,0,0,0),(22306,'2019-01-27',30,0,0,0),(22307,'2019-01-27',31,0,0,0),(22308,'2019-01-27',32,0,0,0),(22309,'2019-01-27',33,0,0,0),(22310,'2019-01-27',34,0,0,0),(22311,'2019-01-27',35,0,0,0),(22312,'2019-01-27',36,0,0,0),(22313,'2019-01-27',37,0,0,0),(22314,'2019-01-27',38,0,0,0),(22315,'2019-01-27',39,0,0,0),(22316,'2019-01-27',40,0,0,0),(22317,'2019-01-27',41,0,0,0),(22318,'2019-01-27',42,0,0,0),(22319,'2019-01-27',43,0,0,0),(22320,'2019-01-27',44,0,0,0),(22321,'2019-01-27',45,0,0,0),(22322,'2019-01-27',46,0,0,0),(22323,'2019-01-27',47,0,0,0),(22324,'2019-01-27',48,0,0,0),(22325,'2019-01-27',49,0,0,0),(22326,'2019-01-27',50,0,0,0),(22327,'2019-01-27',51,0,0,0),(22328,'2019-01-27',52,0,0,0),(22329,'2019-01-27',53,0,0,0),(22330,'2019-01-27',54,0,0,0),(22331,'2019-01-27',55,0,0,0),(22332,'2019-01-27',56,0,0,0),(22333,'2019-01-27',57,0,0,0),(22334,'2019-01-27',58,0,0,0),(22335,'2019-01-27',59,0,0,0),(22336,'2019-01-27',60,0,0,0),(22337,'2019-01-27',61,0,0,0),(22338,'2019-01-27',62,0,0,0),(22339,'2019-01-27',63,0,0,0),(22340,'2019-01-27',64,0,0,0),(22341,'2019-01-27',65,0,0,0),(22342,'2019-01-27',66,0,0,0),(22343,'2019-01-27',67,0,0,0),(22344,'2019-01-27',68,0,0,0),(22345,'2019-01-27',69,0,0,0),(22346,'2019-01-27',70,0,0,0),(22347,'2019-01-27',71,0,0,0),(22348,'2019-01-27',72,0,0,0),(22349,'2019-01-27',73,0,0,0),(22350,'2019-01-27',74,0,0,0),(22351,'2019-01-27',75,0,0,0),(22352,'2019-01-27',76,0,0,0),(22353,'2019-01-27',77,0,0,0),(22354,'2019-01-27',78,0,0,0),(22355,'2019-01-27',79,0,0,0),(22356,'2019-01-27',80,0,0,0),(22357,'2019-01-27',81,0,0,0),(22358,'2019-01-27',82,0,0,0),(22359,'2019-01-27',83,0,0,0),(22360,'2019-01-27',84,0,0,0),(22361,'2019-01-27',85,0,0,0),(22362,'2019-01-27',86,0,0,0),(22363,'2019-01-27',87,0,0,0),(22364,'2019-01-27',88,0,0,0),(22365,'2019-01-27',89,0,0,0),(22366,'2019-01-27',90,0,0,0),(22367,'2019-01-27',91,0,0,0),(22368,'2019-01-27',92,0,0,0),(22369,'2019-01-27',93,0,0,0),(22370,'2019-01-27',94,0,0,0),(22371,'2019-01-27',95,0,0,0),(22372,'2019-01-27',96,0,0,0),(22373,'2019-01-27',97,0,0,0),(22374,'2019-01-27',98,0,0,0),(22375,'2019-01-27',99,0,0,0),(22376,'2019-01-27',100,0,0,0),(22377,'2019-01-27',101,0,0,0),(22378,'2019-01-27',102,0,0,0),(22379,'2019-01-27',103,0,0,0),(22380,'2019-01-27',104,0,0,0),(22381,'2019-01-27',105,0,0,0),(22382,'2019-01-27',106,0,0,0),(22383,'2019-01-27',107,0,0,0),(22384,'2019-01-27',108,0,0,0),(22385,'2019-01-27',109,0,0,0),(22386,'2019-01-27',110,0,0,0),(22387,'2019-01-27',111,0,0,0),(22388,'2019-01-27',112,0,0,0),(22389,'2019-01-27',113,0,0,0),(22390,'2019-01-27',114,0,0,0),(22391,'2019-01-27',115,0,0,0),(22392,'2019-01-27',116,0,0,0),(22393,'2019-01-27',117,0,0,0),(22394,'2019-01-27',118,0,0,0),(22395,'2019-01-27',119,0,0,0),(22396,'2019-01-27',120,0,0,0),(22397,'2019-01-27',121,0,0,0),(22398,'2019-01-27',122,0,0,0),(22399,'2019-01-27',123,0,0,0),(22400,'2019-01-27',124,0,0,0),(22401,'2019-01-27',125,0,0,0),(22402,'2019-01-27',126,0,0,0),(22403,'2019-01-27',127,0,0,0),(22404,'2019-01-27',128,0,0,0),(22405,'2019-01-27',129,0,0,0),(22406,'2019-01-27',130,0,0,0),(22407,'2019-01-27',131,0,0,0),(22408,'2019-01-27',132,0,0,0),(22409,'2019-01-27',133,0,0,0),(22410,'2019-01-27',134,0,0,0),(22411,'2019-01-27',135,0,0,0),(22412,'2019-01-27',136,0,0,0),(22413,'2019-01-27',137,0,0,0),(22414,'2019-01-27',138,0,0,0),(22415,'2019-01-27',139,0,0,0),(22416,'2019-01-27',140,0,0,0),(22417,'2019-01-27',141,0,0,0),(22418,'2019-01-27',142,0,0,0),(22419,'2019-01-27',143,0,0,0),(22420,'2019-01-27',144,0,0,0),(22421,'2019-01-27',145,0,0,0),(22422,'2019-01-27',146,0,0,0),(22423,'2019-01-27',147,0,0,0),(22424,'2019-01-27',148,0,0,0),(22425,'2019-01-27',149,0,0,0),(22426,'2019-01-27',150,0,0,0),(22427,'2019-01-27',151,0,0,0),(22428,'2019-01-27',152,0,0,0),(22429,'2019-01-27',153,0,0,0),(22430,'2019-01-27',154,0,0,0),(22431,'2019-01-27',155,0,0,0),(22432,'2019-01-27',156,0,0,0),(22433,'2019-01-27',157,0,0,0),(22434,'2019-01-27',158,0,0,0),(22435,'2019-01-27',159,0,0,0),(22436,'2019-01-27',160,0,0,0),(22437,'2019-01-27',161,0,0,0),(22438,'2019-01-27',162,0,0,0),(22439,'2019-01-27',163,0,0,0),(22440,'2019-01-27',164,0,0,0),(22441,'2019-01-27',165,0,0,0),(22442,'2019-01-27',166,0,0,0),(22443,'2019-01-27',167,0,0,0),(22444,'2019-01-27',168,0,0,0),(22445,'2019-01-27',169,0,0,0),(22446,'2019-01-27',170,0,0,0),(22447,'2019-01-27',171,0,0,0),(22448,'2019-01-27',172,0,0,0),(22449,'2019-01-27',173,0,0,0),(22450,'2019-01-27',174,0,0,0),(22451,'2019-01-27',175,0,0,0),(22452,'2019-01-27',176,0,0,0),(22453,'2019-01-27',177,0,0,0),(22454,'2019-01-27',178,0,0,0),(22455,'2019-01-27',179,0,0,0),(22456,'2019-01-27',180,0,0,0),(22457,'2019-01-27',181,0,0,0),(22458,'2019-01-27',182,0,0,0),(22459,'2019-01-27',183,0,0,0),(22460,'2019-01-27',184,0,0,0),(22461,'2019-01-27',185,0,0,0),(22462,'2019-01-27',186,0,0,0),(22463,'2019-01-27',187,0,0,0),(22464,'2019-01-27',188,0,0,0),(22465,'2019-01-27',189,0,0,0),(22466,'2019-01-27',190,0,0,0),(22467,'2019-01-27',191,0,0,0),(22468,'2019-01-27',192,0,0,0),(22469,'2019-01-27',193,0,0,0),(22470,'2019-01-27',194,0,0,0),(22471,'2019-01-27',195,0,0,0),(22472,'2019-01-27',196,0,0,0),(22473,'2019-01-27',197,0,0,0),(22474,'2019-01-27',198,0,0,0),(22475,'2019-01-27',199,0,0,0),(22476,'2019-01-27',200,0,0,0),(22477,'2019-01-27',201,0,0,0),(22478,'2019-01-27',202,0,0,0),(22479,'2019-01-27',203,0,0,0),(22480,'2019-01-27',204,0,0,0),(22481,'2019-01-28',1,0,0,0),(22482,'2019-01-28',2,0,0,0),(22483,'2019-01-28',9,0,0,0),(22484,'2019-01-28',11,0,0,0),(22485,'2019-01-28',12,0,0,0),(22486,'2019-01-28',13,0,0,0),(22487,'2019-01-28',14,0,0,0),(22488,'2019-01-28',15,0,0,0),(22489,'2019-01-28',16,0,0,0),(22490,'2019-01-28',17,0,0,0),(22491,'2019-01-28',18,0,0,0),(22492,'2019-01-28',19,0,0,0),(22493,'2019-01-28',20,0,0,0),(22494,'2019-01-28',21,0,0,0),(22495,'2019-01-28',22,0,0,0),(22496,'2019-01-28',23,0,0,0),(22497,'2019-01-28',24,0,0,0),(22498,'2019-01-28',25,0,0,0),(22499,'2019-01-28',26,0,0,0),(22500,'2019-01-28',27,0,0,0),(22501,'2019-01-28',28,0,0,0),(22502,'2019-01-28',29,0,0,0),(22503,'2019-01-28',30,0,0,0),(22504,'2019-01-28',31,0,0,0),(22505,'2019-01-28',32,0,0,0),(22506,'2019-01-28',33,0,0,0),(22507,'2019-01-28',34,0,0,0),(22508,'2019-01-28',35,0,0,0),(22509,'2019-01-28',36,0,0,0),(22510,'2019-01-28',37,0,0,0),(22511,'2019-01-28',38,0,0,0),(22512,'2019-01-28',39,0,0,0),(22513,'2019-01-28',40,0,0,0),(22514,'2019-01-28',41,0,0,0),(22515,'2019-01-28',42,0,0,0),(22516,'2019-01-28',43,0,0,0),(22517,'2019-01-28',44,0,0,0),(22518,'2019-01-28',45,0,0,0),(22519,'2019-01-28',46,0,0,0),(22520,'2019-01-28',47,0,0,0),(22521,'2019-01-28',48,0,0,0),(22522,'2019-01-28',49,0,0,0),(22523,'2019-01-28',50,0,0,0),(22524,'2019-01-28',51,0,0,0),(22525,'2019-01-28',52,0,0,0),(22526,'2019-01-28',53,0,0,0),(22527,'2019-01-28',54,0,0,0),(22528,'2019-01-28',55,0,0,0),(22529,'2019-01-28',56,0,0,0),(22530,'2019-01-28',57,0,0,0),(22531,'2019-01-28',58,0,0,0),(22532,'2019-01-28',59,0,0,0),(22533,'2019-01-28',60,0,0,0),(22534,'2019-01-28',61,0,0,0),(22535,'2019-01-28',62,0,0,0),(22536,'2019-01-28',63,0,0,0),(22537,'2019-01-28',64,0,0,0),(22538,'2019-01-28',65,0,0,0),(22539,'2019-01-28',66,0,0,0),(22540,'2019-01-28',67,0,0,0),(22541,'2019-01-28',68,0,0,0),(22542,'2019-01-28',69,0,0,0),(22543,'2019-01-28',70,0,0,0),(22544,'2019-01-28',71,0,0,0),(22545,'2019-01-28',72,0,0,0),(22546,'2019-01-28',73,0,0,0),(22547,'2019-01-28',74,0,0,0),(22548,'2019-01-28',75,0,0,0),(22549,'2019-01-28',76,0,0,0),(22550,'2019-01-28',77,0,0,0),(22551,'2019-01-28',78,0,0,0),(22552,'2019-01-28',79,0,0,0),(22553,'2019-01-28',80,0,0,0),(22554,'2019-01-28',81,0,0,0),(22555,'2019-01-28',82,0,0,0),(22556,'2019-01-28',83,0,0,0),(22557,'2019-01-28',84,0,0,0),(22558,'2019-01-28',85,0,0,0),(22559,'2019-01-28',86,0,0,0),(22560,'2019-01-28',87,0,0,0),(22561,'2019-01-28',88,0,0,0),(22562,'2019-01-28',89,0,0,0),(22563,'2019-01-28',90,0,0,0),(22564,'2019-01-28',91,0,0,0),(22565,'2019-01-28',92,0,0,0),(22566,'2019-01-28',93,0,0,0),(22567,'2019-01-28',94,0,0,0),(22568,'2019-01-28',95,0,0,0),(22569,'2019-01-28',96,0,0,0),(22570,'2019-01-28',97,0,0,0),(22571,'2019-01-28',98,0,0,0),(22572,'2019-01-28',99,0,0,0),(22573,'2019-01-28',100,0,0,0),(22574,'2019-01-28',101,0,0,0),(22575,'2019-01-28',102,0,0,0),(22576,'2019-01-28',103,0,0,0),(22577,'2019-01-28',104,0,0,0),(22578,'2019-01-28',105,0,0,0),(22579,'2019-01-28',106,0,0,0),(22580,'2019-01-28',107,0,0,0),(22581,'2019-01-28',108,0,0,0),(22582,'2019-01-28',109,0,0,0),(22583,'2019-01-28',110,0,0,0),(22584,'2019-01-28',111,0,0,0),(22585,'2019-01-28',112,0,0,0),(22586,'2019-01-28',113,0,0,0),(22587,'2019-01-28',114,0,0,0),(22588,'2019-01-28',115,0,0,0),(22589,'2019-01-28',116,0,0,0),(22590,'2019-01-28',117,0,0,0),(22591,'2019-01-28',118,0,0,0),(22592,'2019-01-28',119,0,0,0),(22593,'2019-01-28',120,0,0,0),(22594,'2019-01-28',121,0,0,0),(22595,'2019-01-28',122,0,0,0),(22596,'2019-01-28',123,0,0,0),(22597,'2019-01-28',124,0,0,0),(22598,'2019-01-28',125,0,0,0),(22599,'2019-01-28',126,0,0,0),(22600,'2019-01-28',127,0,0,0),(22601,'2019-01-28',128,0,0,0),(22602,'2019-01-28',129,0,0,0),(22603,'2019-01-28',130,0,0,0),(22604,'2019-01-28',131,0,0,0),(22605,'2019-01-28',132,0,0,0),(22606,'2019-01-28',133,0,0,0),(22607,'2019-01-28',134,0,0,0),(22608,'2019-01-28',135,0,0,0),(22609,'2019-01-28',136,0,0,0),(22610,'2019-01-28',137,0,0,0),(22611,'2019-01-28',138,0,0,0),(22612,'2019-01-28',139,0,0,0),(22613,'2019-01-28',140,0,0,0),(22614,'2019-01-28',141,0,0,0),(22615,'2019-01-28',142,0,0,0),(22616,'2019-01-28',143,0,0,0),(22617,'2019-01-28',144,0,0,0),(22618,'2019-01-28',145,0,0,0),(22619,'2019-01-28',146,0,0,0),(22620,'2019-01-28',147,0,0,0),(22621,'2019-01-28',148,0,0,0),(22622,'2019-01-28',149,0,0,0),(22623,'2019-01-28',150,0,0,0),(22624,'2019-01-28',151,0,0,0),(22625,'2019-01-28',152,0,0,0),(22626,'2019-01-28',153,0,0,0),(22627,'2019-01-28',154,0,0,0),(22628,'2019-01-28',155,0,0,0),(22629,'2019-01-28',156,0,0,0),(22630,'2019-01-28',157,0,0,0),(22631,'2019-01-28',158,0,0,0),(22632,'2019-01-28',159,0,0,0),(22633,'2019-01-28',160,0,0,0),(22634,'2019-01-28',161,0,0,0),(22635,'2019-01-28',162,0,0,0),(22636,'2019-01-28',163,0,0,0),(22637,'2019-01-28',164,0,0,0),(22638,'2019-01-28',165,0,0,0),(22639,'2019-01-28',166,0,0,0),(22640,'2019-01-28',167,0,0,0),(22641,'2019-01-28',168,0,0,0),(22642,'2019-01-28',169,0,0,0),(22643,'2019-01-28',170,0,0,0),(22644,'2019-01-28',171,0,0,0),(22645,'2019-01-28',172,0,0,0),(22646,'2019-01-28',173,0,0,0),(22647,'2019-01-28',174,0,0,0),(22648,'2019-01-28',175,0,0,0),(22649,'2019-01-28',176,0,0,0),(22650,'2019-01-28',177,0,0,0),(22651,'2019-01-28',178,0,0,0),(22652,'2019-01-28',179,0,0,0),(22653,'2019-01-28',180,0,0,0),(22654,'2019-01-28',181,0,0,0),(22655,'2019-01-28',182,0,0,0),(22656,'2019-01-28',183,0,0,0),(22657,'2019-01-28',184,0,0,0),(22658,'2019-01-28',185,0,0,0),(22659,'2019-01-28',186,0,0,0),(22660,'2019-01-28',187,0,0,0),(22661,'2019-01-28',188,0,0,0),(22662,'2019-01-28',189,0,0,0),(22663,'2019-01-28',190,0,0,0),(22664,'2019-01-28',191,0,0,0),(22665,'2019-01-28',192,0,0,0),(22666,'2019-01-28',193,0,0,0),(22667,'2019-01-28',194,0,0,0),(22668,'2019-01-28',195,0,0,0),(22669,'2019-01-28',196,0,0,0),(22670,'2019-01-28',197,0,0,0),(22671,'2019-01-28',198,0,0,0),(22672,'2019-01-28',199,0,0,0),(22673,'2019-01-28',200,0,0,0),(22674,'2019-01-28',201,0,0,0),(22675,'2019-01-28',202,0,0,0),(22676,'2019-01-28',203,0,0,0),(22677,'2019-01-28',204,0,0,0),(22736,'2019-01-29',1,0,0,0),(22737,'2019-01-29',2,0,0,0),(22738,'2019-01-29',9,0,0,0),(22739,'2019-01-29',11,0,0,0),(22740,'2019-01-29',12,0,0,0),(22741,'2019-01-29',13,0,0,0),(22742,'2019-01-29',14,0,0,0),(22743,'2019-01-29',15,0,0,0),(22744,'2019-01-29',16,0,0,0),(22745,'2019-01-29',17,0,0,0),(22746,'2019-01-29',18,0,0,0),(22747,'2019-01-29',19,0,0,0),(22748,'2019-01-29',20,0,0,0),(22749,'2019-01-29',21,0,0,0),(22750,'2019-01-29',22,0,0,0),(22751,'2019-01-29',23,0,0,0),(22752,'2019-01-29',24,0,0,0),(22753,'2019-01-29',25,0,0,0),(22754,'2019-01-29',26,0,0,0),(22755,'2019-01-29',27,0,0,0),(22756,'2019-01-29',28,0,0,0),(22757,'2019-01-29',29,0,0,0),(22758,'2019-01-29',30,0,0,0),(22759,'2019-01-29',31,0,0,0),(22760,'2019-01-29',32,0,0,0),(22761,'2019-01-29',33,0,0,0),(22762,'2019-01-29',34,0,0,0),(22763,'2019-01-29',35,0,0,0),(22764,'2019-01-29',36,0,0,0),(22765,'2019-01-29',37,0,0,0),(22766,'2019-01-29',38,0,0,0),(22767,'2019-01-29',39,0,0,0),(22768,'2019-01-29',40,0,0,0),(22769,'2019-01-29',41,0,0,0),(22770,'2019-01-29',42,0,0,0),(22771,'2019-01-29',43,0,0,0),(22772,'2019-01-29',44,0,0,0),(22773,'2019-01-29',45,0,0,0),(22774,'2019-01-29',46,0,0,0),(22775,'2019-01-29',47,0,0,0),(22776,'2019-01-29',48,0,0,0),(22777,'2019-01-29',49,0,0,0),(22778,'2019-01-29',50,0,0,0),(22779,'2019-01-29',51,0,0,0),(22780,'2019-01-29',52,0,0,0),(22781,'2019-01-29',53,0,0,0),(22782,'2019-01-29',54,0,0,0),(22783,'2019-01-29',55,0,0,0),(22784,'2019-01-29',56,0,0,0),(22785,'2019-01-29',57,0,0,0),(22786,'2019-01-29',58,0,0,0),(22787,'2019-01-29',59,0,0,0),(22788,'2019-01-29',60,0,0,0),(22789,'2019-01-29',61,0,0,0),(22790,'2019-01-29',62,0,0,0),(22791,'2019-01-29',63,0,0,0),(22792,'2019-01-29',64,0,0,0),(22793,'2019-01-29',65,0,0,0),(22794,'2019-01-29',66,0,0,0),(22795,'2019-01-29',67,0,0,0),(22796,'2019-01-29',68,0,0,0),(22797,'2019-01-29',69,0,0,0),(22798,'2019-01-29',70,0,0,0),(22799,'2019-01-29',71,0,0,0),(22800,'2019-01-29',72,0,0,0),(22801,'2019-01-29',73,0,0,0),(22802,'2019-01-29',74,0,0,0),(22803,'2019-01-29',75,0,0,0),(22804,'2019-01-29',76,0,0,0),(22805,'2019-01-29',77,0,0,0),(22806,'2019-01-29',78,0,0,0),(22807,'2019-01-29',79,0,0,0),(22808,'2019-01-29',80,0,0,0),(22809,'2019-01-29',81,0,0,0),(22810,'2019-01-29',82,0,0,0),(22811,'2019-01-29',83,0,0,0),(22812,'2019-01-29',84,0,0,0),(22813,'2019-01-29',85,0,0,0),(22814,'2019-01-29',86,0,0,0),(22815,'2019-01-29',87,0,0,0),(22816,'2019-01-29',88,0,0,0),(22817,'2019-01-29',89,0,0,0),(22818,'2019-01-29',90,0,0,0),(22819,'2019-01-29',91,0,0,0),(22820,'2019-01-29',92,0,0,0),(22821,'2019-01-29',93,0,0,0),(22822,'2019-01-29',94,0,0,0),(22823,'2019-01-29',95,0,0,0),(22824,'2019-01-29',96,0,0,0),(22825,'2019-01-29',97,0,0,0),(22826,'2019-01-29',98,0,0,0),(22827,'2019-01-29',99,0,0,0),(22828,'2019-01-29',100,0,0,0),(22829,'2019-01-29',101,0,0,0),(22830,'2019-01-29',102,0,0,0),(22831,'2019-01-29',103,0,0,0),(22832,'2019-01-29',104,0,0,0),(22833,'2019-01-29',105,0,0,0),(22834,'2019-01-29',106,0,0,0),(22835,'2019-01-29',107,0,0,0),(22836,'2019-01-29',108,0,0,0),(22837,'2019-01-29',109,0,0,0),(22838,'2019-01-29',110,0,0,0),(22839,'2019-01-29',111,0,0,0),(22840,'2019-01-29',112,0,0,0),(22841,'2019-01-29',113,0,0,0),(22842,'2019-01-29',114,0,0,0),(22843,'2019-01-29',115,0,0,0),(22844,'2019-01-29',116,0,0,0),(22845,'2019-01-29',117,0,0,0),(22846,'2019-01-29',118,0,0,0),(22847,'2019-01-29',119,0,0,0),(22848,'2019-01-29',120,0,0,0),(22849,'2019-01-29',121,0,0,0),(22850,'2019-01-29',122,0,0,0),(22851,'2019-01-29',123,0,0,0),(22852,'2019-01-29',124,0,0,0),(22853,'2019-01-29',125,0,0,0),(22854,'2019-01-29',126,0,0,0),(22855,'2019-01-29',127,0,0,0),(22856,'2019-01-29',128,0,0,0),(22857,'2019-01-29',129,0,0,0),(22858,'2019-01-29',130,0,0,0),(22859,'2019-01-29',131,0,0,0),(22860,'2019-01-29',132,0,0,0),(22861,'2019-01-29',133,0,0,0),(22862,'2019-01-29',134,0,0,0),(22863,'2019-01-29',135,0,0,0),(22864,'2019-01-29',136,0,0,0),(22865,'2019-01-29',137,0,0,0),(22866,'2019-01-29',138,0,0,0),(22867,'2019-01-29',139,0,0,0),(22868,'2019-01-29',140,0,0,0),(22869,'2019-01-29',141,0,0,0),(22870,'2019-01-29',142,0,0,0),(22871,'2019-01-29',143,0,0,0),(22872,'2019-01-29',144,0,0,0),(22873,'2019-01-29',145,0,0,0),(22874,'2019-01-29',146,0,0,0),(22875,'2019-01-29',147,0,0,0),(22876,'2019-01-29',148,0,0,0),(22877,'2019-01-29',149,0,0,0),(22878,'2019-01-29',150,0,0,0),(22879,'2019-01-29',151,0,0,0),(22880,'2019-01-29',152,0,0,0),(22881,'2019-01-29',153,0,0,0),(22882,'2019-01-29',154,0,0,0),(22883,'2019-01-29',155,0,0,0),(22884,'2019-01-29',156,0,0,0),(22885,'2019-01-29',157,0,0,0),(22886,'2019-01-29',158,0,0,0),(22887,'2019-01-29',159,0,0,0),(22888,'2019-01-29',160,0,0,0),(22889,'2019-01-29',161,0,0,0),(22890,'2019-01-29',162,0,0,0),(22891,'2019-01-29',163,0,0,0),(22892,'2019-01-29',164,0,0,0),(22893,'2019-01-29',165,0,0,0),(22894,'2019-01-29',166,0,0,0),(22895,'2019-01-29',167,0,0,0),(22896,'2019-01-29',168,0,0,0),(22897,'2019-01-29',169,0,0,0),(22898,'2019-01-29',170,0,0,0),(22899,'2019-01-29',171,0,0,0),(22900,'2019-01-29',172,0,0,0),(22901,'2019-01-29',173,0,0,0),(22902,'2019-01-29',174,0,0,0),(22903,'2019-01-29',175,0,0,0),(22904,'2019-01-29',176,0,0,0),(22905,'2019-01-29',177,0,0,0),(22906,'2019-01-29',178,0,0,0),(22907,'2019-01-29',179,0,0,0),(22908,'2019-01-29',180,0,0,0),(22909,'2019-01-29',181,0,0,0),(22910,'2019-01-29',182,0,0,0),(22911,'2019-01-29',183,0,0,0),(22912,'2019-01-29',184,0,0,0),(22913,'2019-01-29',185,0,0,0),(22914,'2019-01-29',186,0,0,0),(22915,'2019-01-29',187,0,0,0),(22916,'2019-01-29',188,0,0,0),(22917,'2019-01-29',189,0,0,0),(22918,'2019-01-29',190,0,0,0),(22919,'2019-01-29',191,0,0,0),(22920,'2019-01-29',192,0,0,0),(22921,'2019-01-29',193,0,0,0),(22922,'2019-01-29',194,0,0,0),(22923,'2019-01-29',195,0,0,0),(22924,'2019-01-29',196,0,0,0),(22925,'2019-01-29',197,0,0,0),(22926,'2019-01-29',198,0,0,0),(22927,'2019-01-29',199,0,0,0),(22928,'2019-01-29',200,0,0,0),(22929,'2019-01-29',201,0,0,0),(22930,'2019-01-29',202,0,0,0),(22931,'2019-01-29',203,0,0,0),(22932,'2019-01-29',204,0,0,0),(22991,'2019-01-30',1,0,0,0),(22992,'2019-01-30',2,0,0,0),(22993,'2019-01-30',9,0,0,0),(22994,'2019-01-30',11,0,0,0),(22995,'2019-01-30',12,0,0,0),(22996,'2019-01-30',13,0,0,0),(22997,'2019-01-30',14,0,0,0),(22998,'2019-01-30',15,0,0,0),(22999,'2019-01-30',16,0,0,0),(23000,'2019-01-30',17,0,0,0),(23001,'2019-01-30',18,0,0,0),(23002,'2019-01-30',19,0,0,0),(23003,'2019-01-30',20,0,0,0),(23004,'2019-01-30',21,0,0,0),(23005,'2019-01-30',22,0,0,0),(23006,'2019-01-30',23,0,0,0),(23007,'2019-01-30',24,0,0,0),(23008,'2019-01-30',25,0,0,0),(23009,'2019-01-30',26,0,0,0),(23010,'2019-01-30',27,0,0,0),(23011,'2019-01-30',28,0,0,0),(23012,'2019-01-30',29,0,0,0),(23013,'2019-01-30',30,0,0,0),(23014,'2019-01-30',31,0,0,0),(23015,'2019-01-30',32,0,0,0),(23016,'2019-01-30',33,0,0,0),(23017,'2019-01-30',34,0,0,0),(23018,'2019-01-30',35,0,0,0),(23019,'2019-01-30',36,0,0,0),(23020,'2019-01-30',37,0,0,0),(23021,'2019-01-30',38,0,0,0),(23022,'2019-01-30',39,0,0,0),(23023,'2019-01-30',40,0,0,0),(23024,'2019-01-30',41,0,0,0),(23025,'2019-01-30',42,0,0,0),(23026,'2019-01-30',43,0,0,0),(23027,'2019-01-30',44,0,0,0),(23028,'2019-01-30',45,0,0,0),(23029,'2019-01-30',46,0,0,0),(23030,'2019-01-30',47,0,0,0),(23031,'2019-01-30',48,0,0,0),(23032,'2019-01-30',49,0,0,0),(23033,'2019-01-30',50,0,0,0),(23034,'2019-01-30',51,0,0,0),(23035,'2019-01-30',52,0,0,0),(23036,'2019-01-30',53,0,0,0),(23037,'2019-01-30',54,0,0,0),(23038,'2019-01-30',55,0,0,0),(23039,'2019-01-30',56,0,0,0),(23040,'2019-01-30',57,0,0,0),(23041,'2019-01-30',58,0,0,0),(23042,'2019-01-30',59,0,0,0),(23043,'2019-01-30',60,0,0,0),(23044,'2019-01-30',61,0,0,0),(23045,'2019-01-30',62,0,0,0),(23046,'2019-01-30',63,0,0,0),(23047,'2019-01-30',64,0,0,0),(23048,'2019-01-30',65,0,0,0),(23049,'2019-01-30',66,0,0,0),(23050,'2019-01-30',67,0,0,0),(23051,'2019-01-30',68,0,0,0),(23052,'2019-01-30',69,0,0,0),(23053,'2019-01-30',70,0,0,0),(23054,'2019-01-30',71,0,0,0),(23055,'2019-01-30',72,0,0,0),(23056,'2019-01-30',73,0,0,0),(23057,'2019-01-30',74,0,0,0),(23058,'2019-01-30',75,0,0,0),(23059,'2019-01-30',76,0,0,0),(23060,'2019-01-30',77,0,0,0),(23061,'2019-01-30',78,0,0,0),(23062,'2019-01-30',79,0,0,0),(23063,'2019-01-30',80,0,0,0),(23064,'2019-01-30',81,0,0,0),(23065,'2019-01-30',82,0,0,0),(23066,'2019-01-30',83,0,0,0),(23067,'2019-01-30',84,0,0,0),(23068,'2019-01-30',85,0,0,0),(23069,'2019-01-30',86,0,0,0),(23070,'2019-01-30',87,0,0,0),(23071,'2019-01-30',88,0,0,0),(23072,'2019-01-30',89,0,0,0),(23073,'2019-01-30',90,0,0,0),(23074,'2019-01-30',91,0,0,0),(23075,'2019-01-30',92,0,0,0),(23076,'2019-01-30',93,0,0,0),(23077,'2019-01-30',94,0,0,0),(23078,'2019-01-30',95,0,0,0),(23079,'2019-01-30',96,0,0,0),(23080,'2019-01-30',97,0,0,0),(23081,'2019-01-30',98,0,0,0),(23082,'2019-01-30',99,0,0,0),(23083,'2019-01-30',100,0,0,0),(23084,'2019-01-30',101,0,0,0),(23085,'2019-01-30',102,0,0,0),(23086,'2019-01-30',103,0,0,0),(23087,'2019-01-30',104,0,0,0),(23088,'2019-01-30',105,0,0,0),(23089,'2019-01-30',106,0,0,0),(23090,'2019-01-30',107,0,0,0),(23091,'2019-01-30',108,0,0,0),(23092,'2019-01-30',109,0,0,0),(23093,'2019-01-30',110,0,0,0),(23094,'2019-01-30',111,0,0,0),(23095,'2019-01-30',112,0,0,0),(23096,'2019-01-30',113,0,0,0),(23097,'2019-01-30',114,0,0,0),(23098,'2019-01-30',115,0,0,0),(23099,'2019-01-30',116,0,0,0),(23100,'2019-01-30',117,0,0,0),(23101,'2019-01-30',118,0,0,0),(23102,'2019-01-30',119,0,0,0),(23103,'2019-01-30',120,0,0,0),(23104,'2019-01-30',121,0,0,0),(23105,'2019-01-30',122,0,0,0),(23106,'2019-01-30',123,0,0,0),(23107,'2019-01-30',124,0,0,0),(23108,'2019-01-30',125,0,0,0),(23109,'2019-01-30',126,0,0,0),(23110,'2019-01-30',127,0,0,0),(23111,'2019-01-30',128,0,0,0),(23112,'2019-01-30',129,0,0,0),(23113,'2019-01-30',130,0,0,0),(23114,'2019-01-30',131,0,0,0),(23115,'2019-01-30',132,0,0,0),(23116,'2019-01-30',133,0,0,0),(23117,'2019-01-30',134,0,0,0),(23118,'2019-01-30',135,0,0,0),(23119,'2019-01-30',136,0,0,0),(23120,'2019-01-30',137,0,0,0),(23121,'2019-01-30',138,0,0,0),(23122,'2019-01-30',139,0,0,0),(23123,'2019-01-30',140,0,0,0),(23124,'2019-01-30',141,0,0,0),(23125,'2019-01-30',142,0,0,0),(23126,'2019-01-30',143,0,0,0),(23127,'2019-01-30',144,0,0,0),(23128,'2019-01-30',145,0,0,0),(23129,'2019-01-30',146,0,0,0),(23130,'2019-01-30',147,0,0,0),(23131,'2019-01-30',148,0,0,0),(23132,'2019-01-30',149,0,0,0),(23133,'2019-01-30',150,0,0,0),(23134,'2019-01-30',151,0,0,0),(23135,'2019-01-30',152,0,0,0),(23136,'2019-01-30',153,0,0,0),(23137,'2019-01-30',154,0,0,0),(23138,'2019-01-30',155,0,0,0),(23139,'2019-01-30',156,0,0,0),(23140,'2019-01-30',157,0,0,0),(23141,'2019-01-30',158,0,0,0),(23142,'2019-01-30',159,0,0,0),(23143,'2019-01-30',160,0,0,0),(23144,'2019-01-30',161,0,0,0),(23145,'2019-01-30',162,0,0,0),(23146,'2019-01-30',163,0,0,0),(23147,'2019-01-30',164,0,0,0),(23148,'2019-01-30',165,0,0,0),(23149,'2019-01-30',166,0,0,0),(23150,'2019-01-30',167,0,0,0),(23151,'2019-01-30',168,0,0,0),(23152,'2019-01-30',169,0,0,0),(23153,'2019-01-30',170,0,0,0),(23154,'2019-01-30',171,0,0,0),(23155,'2019-01-30',172,0,0,0),(23156,'2019-01-30',173,0,0,0),(23157,'2019-01-30',174,0,0,0),(23158,'2019-01-30',175,0,0,0),(23159,'2019-01-30',176,0,0,0),(23160,'2019-01-30',177,0,0,0),(23161,'2019-01-30',178,0,0,0),(23162,'2019-01-30',179,0,0,0),(23163,'2019-01-30',180,0,0,0),(23164,'2019-01-30',181,0,0,0),(23165,'2019-01-30',182,0,0,0),(23166,'2019-01-30',183,0,0,0),(23167,'2019-01-30',184,0,0,0),(23168,'2019-01-30',185,0,0,0),(23169,'2019-01-30',186,0,0,0),(23170,'2019-01-30',187,0,0,0),(23171,'2019-01-30',188,0,0,0),(23172,'2019-01-30',189,0,0,0),(23173,'2019-01-30',190,0,0,0),(23174,'2019-01-30',191,0,0,0),(23175,'2019-01-30',192,0,0,0),(23176,'2019-01-30',193,0,0,0),(23177,'2019-01-30',194,0,0,0),(23178,'2019-01-30',195,0,0,0),(23179,'2019-01-30',196,0,0,0),(23180,'2019-01-30',197,0,0,0),(23181,'2019-01-30',198,0,0,0),(23182,'2019-01-30',199,0,0,0),(23183,'2019-01-30',200,0,0,0),(23184,'2019-01-30',201,0,0,0),(23185,'2019-01-30',202,0,0,0),(23186,'2019-01-30',203,0,0,0),(23187,'2019-01-30',204,0,0,0),(23246,'2019-01-31',1,0,0,0),(23247,'2019-01-31',2,0,0,0),(23248,'2019-01-31',9,0,0,0),(23249,'2019-01-31',11,0,0,0),(23250,'2019-01-31',12,0,0,0),(23251,'2019-01-31',13,0,0,0),(23252,'2019-01-31',14,0,0,0),(23253,'2019-01-31',15,0,0,0),(23254,'2019-01-31',16,0,0,0),(23255,'2019-01-31',17,0,0,0),(23256,'2019-01-31',18,0,0,0),(23257,'2019-01-31',19,0,0,0),(23258,'2019-01-31',20,0,0,0),(23259,'2019-01-31',21,0,0,0),(23260,'2019-01-31',22,0,0,0),(23261,'2019-01-31',23,0,0,0),(23262,'2019-01-31',24,0,0,0),(23263,'2019-01-31',25,0,0,0),(23264,'2019-01-31',26,0,0,0),(23265,'2019-01-31',27,0,0,0),(23266,'2019-01-31',28,0,0,0),(23267,'2019-01-31',29,0,0,0),(23268,'2019-01-31',30,0,0,0),(23269,'2019-01-31',31,0,0,0),(23270,'2019-01-31',32,0,0,0),(23271,'2019-01-31',33,0,0,0),(23272,'2019-01-31',34,0,0,0),(23273,'2019-01-31',35,0,0,0),(23274,'2019-01-31',36,0,0,0),(23275,'2019-01-31',37,0,0,0),(23276,'2019-01-31',38,0,0,0),(23277,'2019-01-31',39,0,0,0),(23278,'2019-01-31',40,0,0,0),(23279,'2019-01-31',41,0,0,0),(23280,'2019-01-31',42,0,0,0),(23281,'2019-01-31',43,0,0,0),(23282,'2019-01-31',44,0,0,0),(23283,'2019-01-31',45,0,0,0),(23284,'2019-01-31',46,0,0,0),(23285,'2019-01-31',47,0,0,0),(23286,'2019-01-31',48,0,0,0),(23287,'2019-01-31',49,0,0,0),(23288,'2019-01-31',50,0,0,0),(23289,'2019-01-31',51,0,0,0),(23290,'2019-01-31',52,0,0,0),(23291,'2019-01-31',53,0,0,0),(23292,'2019-01-31',54,0,0,0),(23293,'2019-01-31',55,0,0,0),(23294,'2019-01-31',56,0,0,0),(23295,'2019-01-31',57,0,0,0),(23296,'2019-01-31',58,0,0,0),(23297,'2019-01-31',59,0,0,0),(23298,'2019-01-31',60,0,0,0),(23299,'2019-01-31',61,0,0,0),(23300,'2019-01-31',62,0,0,0),(23301,'2019-01-31',63,0,0,0),(23302,'2019-01-31',64,0,0,0),(23303,'2019-01-31',65,0,0,0),(23304,'2019-01-31',66,0,0,0),(23305,'2019-01-31',67,0,0,0),(23306,'2019-01-31',68,0,0,0),(23307,'2019-01-31',69,0,0,0),(23308,'2019-01-31',70,0,0,0),(23309,'2019-01-31',71,0,0,0),(23310,'2019-01-31',72,0,0,0),(23311,'2019-01-31',73,0,0,0),(23312,'2019-01-31',74,0,0,0),(23313,'2019-01-31',75,0,0,0),(23314,'2019-01-31',76,0,0,0),(23315,'2019-01-31',77,0,0,0),(23316,'2019-01-31',78,0,0,0),(23317,'2019-01-31',79,0,0,0),(23318,'2019-01-31',80,0,0,0),(23319,'2019-01-31',81,0,0,0),(23320,'2019-01-31',82,0,0,0),(23321,'2019-01-31',83,0,0,0),(23322,'2019-01-31',84,0,0,0),(23323,'2019-01-31',85,0,0,0),(23324,'2019-01-31',86,0,0,0),(23325,'2019-01-31',87,0,0,0),(23326,'2019-01-31',88,0,0,0),(23327,'2019-01-31',89,0,0,0),(23328,'2019-01-31',90,0,0,0),(23329,'2019-01-31',91,0,0,0),(23330,'2019-01-31',92,0,0,0),(23331,'2019-01-31',93,0,0,0),(23332,'2019-01-31',94,0,0,0),(23333,'2019-01-31',95,0,0,0),(23334,'2019-01-31',96,0,0,0),(23335,'2019-01-31',97,0,0,0),(23336,'2019-01-31',98,0,0,0),(23337,'2019-01-31',99,0,0,0),(23338,'2019-01-31',100,0,0,0),(23339,'2019-01-31',101,0,0,0),(23340,'2019-01-31',102,0,0,0),(23341,'2019-01-31',103,0,0,0),(23342,'2019-01-31',104,0,0,0),(23343,'2019-01-31',105,0,0,0),(23344,'2019-01-31',106,0,0,0),(23345,'2019-01-31',107,0,0,0),(23346,'2019-01-31',108,0,0,0),(23347,'2019-01-31',109,0,0,0),(23348,'2019-01-31',110,0,0,0),(23349,'2019-01-31',111,0,0,0),(23350,'2019-01-31',112,0,0,0),(23351,'2019-01-31',113,0,0,0),(23352,'2019-01-31',114,0,0,0),(23353,'2019-01-31',115,0,0,0),(23354,'2019-01-31',116,0,0,0),(23355,'2019-01-31',117,0,0,0),(23356,'2019-01-31',118,0,0,0),(23357,'2019-01-31',119,0,0,0),(23358,'2019-01-31',120,0,0,0),(23359,'2019-01-31',121,0,0,0),(23360,'2019-01-31',122,0,0,0),(23361,'2019-01-31',123,0,0,0),(23362,'2019-01-31',124,0,0,0),(23363,'2019-01-31',125,0,0,0),(23364,'2019-01-31',126,0,0,0),(23365,'2019-01-31',127,0,0,0),(23366,'2019-01-31',128,0,0,0),(23367,'2019-01-31',129,0,0,0),(23368,'2019-01-31',130,0,0,0),(23369,'2019-01-31',131,0,0,0),(23370,'2019-01-31',132,0,0,0),(23371,'2019-01-31',133,0,0,0),(23372,'2019-01-31',134,0,0,0),(23373,'2019-01-31',135,0,0,0),(23374,'2019-01-31',136,0,0,0),(23375,'2019-01-31',137,0,0,0),(23376,'2019-01-31',138,0,0,0),(23377,'2019-01-31',139,0,0,0),(23378,'2019-01-31',140,0,0,0),(23379,'2019-01-31',141,0,0,0),(23380,'2019-01-31',142,0,0,0),(23381,'2019-01-31',143,0,0,0),(23382,'2019-01-31',144,0,0,0),(23383,'2019-01-31',145,0,0,0),(23384,'2019-01-31',146,0,0,0),(23385,'2019-01-31',147,0,0,0),(23386,'2019-01-31',148,0,0,0),(23387,'2019-01-31',149,0,0,0),(23388,'2019-01-31',150,0,0,0),(23389,'2019-01-31',151,0,0,0),(23390,'2019-01-31',152,0,0,0),(23391,'2019-01-31',153,0,0,0),(23392,'2019-01-31',154,0,0,0),(23393,'2019-01-31',155,0,0,0),(23394,'2019-01-31',156,0,0,0),(23395,'2019-01-31',157,0,0,0),(23396,'2019-01-31',158,0,0,0),(23397,'2019-01-31',159,0,0,0),(23398,'2019-01-31',160,0,0,0),(23399,'2019-01-31',161,0,0,0),(23400,'2019-01-31',162,0,0,0),(23401,'2019-01-31',163,0,0,0),(23402,'2019-01-31',164,0,0,0),(23403,'2019-01-31',165,0,0,0),(23404,'2019-01-31',166,0,0,0),(23405,'2019-01-31',167,0,0,0),(23406,'2019-01-31',168,0,0,0),(23407,'2019-01-31',169,0,0,0),(23408,'2019-01-31',170,0,0,0),(23409,'2019-01-31',171,0,0,0),(23410,'2019-01-31',172,0,0,0),(23411,'2019-01-31',173,0,0,0),(23412,'2019-01-31',174,0,0,0),(23413,'2019-01-31',175,0,0,0),(23414,'2019-01-31',176,0,0,0),(23415,'2019-01-31',177,0,0,0),(23416,'2019-01-31',178,0,0,0),(23417,'2019-01-31',179,0,0,0),(23418,'2019-01-31',180,0,0,0),(23419,'2019-01-31',181,0,0,0),(23420,'2019-01-31',182,0,0,0),(23421,'2019-01-31',183,0,0,0),(23422,'2019-01-31',184,0,0,0),(23423,'2019-01-31',185,0,0,0),(23424,'2019-01-31',186,0,0,0),(23425,'2019-01-31',187,0,0,0),(23426,'2019-01-31',188,0,0,0),(23427,'2019-01-31',189,0,0,0),(23428,'2019-01-31',190,0,0,0),(23429,'2019-01-31',191,0,0,0),(23430,'2019-01-31',192,0,0,0),(23431,'2019-01-31',193,0,0,0),(23432,'2019-01-31',194,0,0,0),(23433,'2019-01-31',195,0,0,0),(23434,'2019-01-31',196,0,0,0),(23435,'2019-01-31',197,0,0,0),(23436,'2019-01-31',198,0,0,0),(23437,'2019-01-31',199,0,0,0),(23438,'2019-01-31',200,0,0,0),(23439,'2019-01-31',201,0,0,0),(23440,'2019-01-31',202,0,0,0),(23441,'2019-01-31',203,0,0,0),(23442,'2019-01-31',204,0,0,0),(23443,'2019-02-01',1,0,0,0),(23444,'2019-02-01',2,0,0,0),(23445,'2019-02-01',9,0,0,0),(23446,'2019-02-01',11,0,0,0),(23447,'2019-02-01',12,0,0,0),(23448,'2019-02-01',13,0,0,0),(23449,'2019-02-01',14,0,0,0),(23450,'2019-02-01',15,0,0,0),(23451,'2019-02-01',16,0,0,0),(23452,'2019-02-01',17,0,0,0),(23453,'2019-02-01',18,0,0,0),(23454,'2019-02-01',19,0,0,0),(23455,'2019-02-01',20,0,0,0),(23456,'2019-02-01',21,0,0,0),(23457,'2019-02-01',22,0,0,0),(23458,'2019-02-01',23,0,0,0),(23459,'2019-02-01',24,0,0,0),(23460,'2019-02-01',25,0,0,0),(23461,'2019-02-01',26,0,0,0),(23462,'2019-02-01',27,0,0,0),(23463,'2019-02-01',28,0,0,0),(23464,'2019-02-01',29,0,0,0),(23465,'2019-02-01',30,0,0,0),(23466,'2019-02-01',31,0,0,0),(23467,'2019-02-01',32,0,0,0),(23468,'2019-02-01',33,0,0,0),(23469,'2019-02-01',34,0,0,0),(23470,'2019-02-01',35,0,0,0),(23471,'2019-02-01',36,0,0,0),(23472,'2019-02-01',37,0,0,0),(23473,'2019-02-01',38,0,0,0),(23474,'2019-02-01',39,0,0,0),(23475,'2019-02-01',40,0,0,0),(23476,'2019-02-01',41,0,0,0),(23477,'2019-02-01',42,0,0,0),(23478,'2019-02-01',43,0,0,0),(23479,'2019-02-01',44,0,0,0),(23480,'2019-02-01',45,0,0,0),(23481,'2019-02-01',46,0,0,0),(23482,'2019-02-01',47,0,0,0),(23483,'2019-02-01',48,0,0,0),(23484,'2019-02-01',49,0,0,0),(23485,'2019-02-01',50,0,0,0),(23486,'2019-02-01',51,0,0,0),(23487,'2019-02-01',52,0,0,0),(23488,'2019-02-01',53,0,0,0),(23489,'2019-02-01',54,0,0,0),(23490,'2019-02-01',55,0,0,0),(23491,'2019-02-01',56,0,0,0),(23492,'2019-02-01',57,0,0,0),(23493,'2019-02-01',58,0,0,0),(23494,'2019-02-01',59,0,0,0),(23495,'2019-02-01',60,0,0,0),(23496,'2019-02-01',61,0,0,0),(23497,'2019-02-01',62,0,0,0),(23498,'2019-02-01',63,0,0,0),(23499,'2019-02-01',64,0,0,0),(23500,'2019-02-01',65,0,0,0),(23501,'2019-02-01',66,0,0,0),(23502,'2019-02-01',67,0,0,0),(23503,'2019-02-01',68,0,0,0),(23504,'2019-02-01',69,0,0,0),(23505,'2019-02-01',70,0,0,0),(23506,'2019-02-01',71,0,0,0),(23507,'2019-02-01',72,0,0,0),(23508,'2019-02-01',73,0,0,0),(23509,'2019-02-01',74,0,0,0),(23510,'2019-02-01',75,0,0,0),(23511,'2019-02-01',76,0,0,0),(23512,'2019-02-01',77,0,0,0),(23513,'2019-02-01',78,0,0,0),(23514,'2019-02-01',79,0,0,0),(23515,'2019-02-01',80,0,0,0),(23516,'2019-02-01',81,0,0,0),(23517,'2019-02-01',82,0,0,0),(23518,'2019-02-01',83,0,0,0),(23519,'2019-02-01',84,0,0,0),(23520,'2019-02-01',85,0,0,0),(23521,'2019-02-01',86,0,0,0),(23522,'2019-02-01',87,0,0,0),(23523,'2019-02-01',88,0,0,0),(23524,'2019-02-01',89,0,0,0),(23525,'2019-02-01',90,0,0,0),(23526,'2019-02-01',91,0,0,0),(23527,'2019-02-01',92,0,0,0),(23528,'2019-02-01',93,0,0,0),(23529,'2019-02-01',94,0,0,0),(23530,'2019-02-01',95,0,0,0),(23531,'2019-02-01',96,0,0,0),(23532,'2019-02-01',97,0,0,0),(23533,'2019-02-01',98,0,0,0),(23534,'2019-02-01',99,0,0,0),(23535,'2019-02-01',100,0,0,0),(23536,'2019-02-01',101,0,0,0),(23537,'2019-02-01',102,0,0,0),(23538,'2019-02-01',103,0,0,0),(23539,'2019-02-01',104,0,0,0),(23540,'2019-02-01',105,0,0,0),(23541,'2019-02-01',106,0,0,0),(23542,'2019-02-01',107,0,0,0),(23543,'2019-02-01',108,0,0,0),(23544,'2019-02-01',109,0,0,0),(23545,'2019-02-01',110,0,0,0),(23546,'2019-02-01',111,0,0,0),(23547,'2019-02-01',112,0,0,0),(23548,'2019-02-01',113,0,0,0),(23549,'2019-02-01',114,0,0,0),(23550,'2019-02-01',115,0,0,0),(23551,'2019-02-01',116,0,0,0),(23552,'2019-02-01',117,0,0,0),(23553,'2019-02-01',118,0,0,0),(23554,'2019-02-01',119,0,0,0),(23555,'2019-02-01',120,0,0,0),(23556,'2019-02-01',121,0,0,0),(23557,'2019-02-01',122,0,0,0),(23558,'2019-02-01',123,0,0,0),(23559,'2019-02-01',124,0,0,0),(23560,'2019-02-01',125,0,0,0),(23561,'2019-02-01',126,0,0,0),(23562,'2019-02-01',127,0,0,0),(23563,'2019-02-01',128,0,0,0),(23564,'2019-02-01',129,0,0,0),(23565,'2019-02-01',130,0,0,0),(23566,'2019-02-01',131,0,0,0),(23567,'2019-02-01',132,0,0,0),(23568,'2019-02-01',133,0,0,0),(23569,'2019-02-01',134,0,0,0),(23570,'2019-02-01',135,0,0,0),(23571,'2019-02-01',136,0,0,0),(23572,'2019-02-01',137,0,0,0),(23573,'2019-02-01',138,0,0,0),(23574,'2019-02-01',139,0,0,0),(23575,'2019-02-01',140,0,0,0),(23576,'2019-02-01',141,0,0,0),(23577,'2019-02-01',142,0,0,0),(23578,'2019-02-01',143,0,0,0),(23579,'2019-02-01',144,0,0,0),(23580,'2019-02-01',145,0,0,0),(23581,'2019-02-01',146,0,0,0),(23582,'2019-02-01',147,0,0,0),(23583,'2019-02-01',148,0,0,0),(23584,'2019-02-01',149,0,0,0),(23585,'2019-02-01',150,0,0,0),(23586,'2019-02-01',151,0,0,0),(23587,'2019-02-01',152,0,0,0),(23588,'2019-02-01',153,0,0,0),(23589,'2019-02-01',154,0,0,0),(23590,'2019-02-01',155,0,0,0),(23591,'2019-02-01',156,0,0,0),(23592,'2019-02-01',157,0,0,0),(23593,'2019-02-01',158,0,0,0),(23594,'2019-02-01',159,0,0,0),(23595,'2019-02-01',160,0,0,0),(23596,'2019-02-01',161,0,0,0),(23597,'2019-02-01',162,0,0,0),(23598,'2019-02-01',163,0,0,0),(23599,'2019-02-01',164,0,0,0),(23600,'2019-02-01',165,0,0,0),(23601,'2019-02-01',166,0,0,0),(23602,'2019-02-01',167,0,0,0),(23603,'2019-02-01',168,0,0,0),(23604,'2019-02-01',169,0,0,0),(23605,'2019-02-01',170,0,0,0),(23606,'2019-02-01',171,0,0,0),(23607,'2019-02-01',172,0,0,0),(23608,'2019-02-01',173,0,0,0),(23609,'2019-02-01',174,0,0,0),(23610,'2019-02-01',175,0,0,0),(23611,'2019-02-01',176,0,0,0),(23612,'2019-02-01',177,0,0,0),(23613,'2019-02-01',178,0,0,0),(23614,'2019-02-01',179,0,0,0),(23615,'2019-02-01',180,0,0,0),(23616,'2019-02-01',181,0,0,0),(23617,'2019-02-01',182,0,0,0),(23618,'2019-02-01',183,0,0,0),(23619,'2019-02-01',184,0,0,0),(23620,'2019-02-01',185,0,0,0),(23621,'2019-02-01',186,0,0,0),(23622,'2019-02-01',187,0,0,0),(23623,'2019-02-01',188,0,0,0),(23624,'2019-02-01',189,0,0,0),(23625,'2019-02-01',190,0,0,0),(23626,'2019-02-01',191,0,0,0),(23627,'2019-02-01',192,0,0,0),(23628,'2019-02-01',193,0,0,0),(23629,'2019-02-01',194,0,0,0),(23630,'2019-02-01',195,0,0,0),(23631,'2019-02-01',196,0,0,0),(23632,'2019-02-01',197,0,0,0),(23633,'2019-02-01',198,0,0,0),(23634,'2019-02-01',199,0,0,0),(23635,'2019-02-01',200,0,0,0),(23636,'2019-02-01',201,0,0,0),(23637,'2019-02-01',202,0,0,0),(23638,'2019-02-01',203,0,0,0),(23639,'2019-02-01',204,0,0,0),(23640,'2019-02-02',1,0,0,0),(23641,'2019-02-02',2,0,0,0),(23642,'2019-02-02',9,0,0,0),(23643,'2019-02-02',11,0,0,0),(23644,'2019-02-02',12,0,0,0),(23645,'2019-02-02',13,0,0,0),(23646,'2019-02-02',14,0,0,0),(23647,'2019-02-02',15,0,0,0),(23648,'2019-02-02',16,0,0,0),(23649,'2019-02-02',17,0,0,0),(23650,'2019-02-02',18,0,0,0),(23651,'2019-02-02',19,0,0,0),(23652,'2019-02-02',20,0,0,0),(23653,'2019-02-02',21,0,0,0),(23654,'2019-02-02',22,0,0,0),(23655,'2019-02-02',23,0,0,0),(23656,'2019-02-02',24,0,0,0),(23657,'2019-02-02',25,0,0,0),(23658,'2019-02-02',26,0,0,0),(23659,'2019-02-02',27,0,0,0),(23660,'2019-02-02',28,0,0,0),(23661,'2019-02-02',29,0,0,0),(23662,'2019-02-02',30,0,0,0),(23663,'2019-02-02',31,0,0,0),(23664,'2019-02-02',32,0,0,0),(23665,'2019-02-02',33,0,0,0),(23666,'2019-02-02',34,0,0,0),(23667,'2019-02-02',35,0,0,0),(23668,'2019-02-02',36,0,0,0),(23669,'2019-02-02',37,0,0,0),(23670,'2019-02-02',38,0,0,0),(23671,'2019-02-02',39,0,0,0),(23672,'2019-02-02',40,0,0,0),(23673,'2019-02-02',41,0,0,0),(23674,'2019-02-02',42,0,0,0),(23675,'2019-02-02',43,0,0,0),(23676,'2019-02-02',44,0,0,0),(23677,'2019-02-02',45,0,0,0),(23678,'2019-02-02',46,0,0,0),(23679,'2019-02-02',47,0,0,0),(23680,'2019-02-02',48,0,0,0),(23681,'2019-02-02',49,0,0,0),(23682,'2019-02-02',50,0,0,0),(23683,'2019-02-02',51,0,0,0),(23684,'2019-02-02',52,0,0,0),(23685,'2019-02-02',53,0,0,0),(23686,'2019-02-02',54,0,0,0),(23687,'2019-02-02',55,0,0,0),(23688,'2019-02-02',56,0,0,0),(23689,'2019-02-02',57,0,0,0),(23690,'2019-02-02',58,0,0,0),(23691,'2019-02-02',59,0,0,0),(23692,'2019-02-02',60,0,0,0),(23693,'2019-02-02',61,0,0,0),(23694,'2019-02-02',62,0,0,0),(23695,'2019-02-02',63,0,0,0),(23696,'2019-02-02',64,0,0,0),(23697,'2019-02-02',65,0,0,0),(23698,'2019-02-02',66,0,0,0),(23699,'2019-02-02',67,0,0,0),(23700,'2019-02-02',68,0,0,0),(23701,'2019-02-02',69,0,0,0),(23702,'2019-02-02',70,0,0,0),(23703,'2019-02-02',71,0,0,0),(23704,'2019-02-02',72,0,0,0),(23705,'2019-02-02',73,0,0,0),(23706,'2019-02-02',74,0,0,0),(23707,'2019-02-02',75,0,0,0),(23708,'2019-02-02',76,0,0,0),(23709,'2019-02-02',77,0,0,0),(23710,'2019-02-02',78,0,0,0),(23711,'2019-02-02',79,0,0,0),(23712,'2019-02-02',80,0,0,0),(23713,'2019-02-02',81,0,0,0),(23714,'2019-02-02',82,0,0,0),(23715,'2019-02-02',83,0,0,0),(23716,'2019-02-02',84,0,0,0),(23717,'2019-02-02',85,0,0,0),(23718,'2019-02-02',86,0,0,0),(23719,'2019-02-02',87,0,0,0),(23720,'2019-02-02',88,0,0,0),(23721,'2019-02-02',89,0,0,0),(23722,'2019-02-02',90,0,0,0),(23723,'2019-02-02',91,0,0,0),(23724,'2019-02-02',92,0,0,0),(23725,'2019-02-02',93,0,0,0),(23726,'2019-02-02',94,0,0,0),(23727,'2019-02-02',95,0,0,0),(23728,'2019-02-02',96,0,0,0),(23729,'2019-02-02',97,0,0,0),(23730,'2019-02-02',98,0,0,0),(23731,'2019-02-02',99,0,0,0),(23732,'2019-02-02',100,0,0,0),(23733,'2019-02-02',101,0,0,0),(23734,'2019-02-02',102,0,0,0),(23735,'2019-02-02',103,0,0,0),(23736,'2019-02-02',104,0,0,0),(23737,'2019-02-02',105,0,0,0),(23738,'2019-02-02',106,0,0,0),(23739,'2019-02-02',107,0,0,0),(23740,'2019-02-02',108,0,0,0),(23741,'2019-02-02',109,0,0,0),(23742,'2019-02-02',110,0,0,0),(23743,'2019-02-02',111,0,0,0),(23744,'2019-02-02',112,0,0,0),(23745,'2019-02-02',113,0,0,0),(23746,'2019-02-02',114,0,0,0),(23747,'2019-02-02',115,0,0,0),(23748,'2019-02-02',116,0,0,0),(23749,'2019-02-02',117,0,0,0),(23750,'2019-02-02',118,0,0,0),(23751,'2019-02-02',119,0,0,0),(23752,'2019-02-02',120,0,0,0),(23753,'2019-02-02',121,0,0,0),(23754,'2019-02-02',122,0,0,0),(23755,'2019-02-02',123,0,0,0),(23756,'2019-02-02',124,0,0,0),(23757,'2019-02-02',125,0,0,0),(23758,'2019-02-02',126,0,0,0),(23759,'2019-02-02',127,0,0,0),(23760,'2019-02-02',128,0,0,0),(23761,'2019-02-02',129,0,0,0),(23762,'2019-02-02',130,0,0,0),(23763,'2019-02-02',131,0,0,0),(23764,'2019-02-02',132,0,0,0),(23765,'2019-02-02',133,0,0,0),(23766,'2019-02-02',134,0,0,0),(23767,'2019-02-02',135,0,0,0),(23768,'2019-02-02',136,0,0,0),(23769,'2019-02-02',137,0,0,0),(23770,'2019-02-02',138,0,0,0),(23771,'2019-02-02',139,0,0,0),(23772,'2019-02-02',140,0,0,0),(23773,'2019-02-02',141,0,0,0),(23774,'2019-02-02',142,0,0,0),(23775,'2019-02-02',143,0,0,0),(23776,'2019-02-02',144,0,0,0),(23777,'2019-02-02',145,0,0,0),(23778,'2019-02-02',146,0,0,0),(23779,'2019-02-02',147,0,0,0),(23780,'2019-02-02',148,0,0,0),(23781,'2019-02-02',149,0,0,0),(23782,'2019-02-02',150,0,0,0),(23783,'2019-02-02',151,0,0,0),(23784,'2019-02-02',152,0,0,0),(23785,'2019-02-02',153,0,0,0),(23786,'2019-02-02',154,0,0,0),(23787,'2019-02-02',155,0,0,0),(23788,'2019-02-02',156,0,0,0),(23789,'2019-02-02',157,0,0,0),(23790,'2019-02-02',158,0,0,0),(23791,'2019-02-02',159,0,0,0),(23792,'2019-02-02',160,0,0,0),(23793,'2019-02-02',161,0,0,0),(23794,'2019-02-02',162,0,0,0),(23795,'2019-02-02',163,0,0,0),(23796,'2019-02-02',164,0,0,0),(23797,'2019-02-02',165,0,0,0),(23798,'2019-02-02',166,0,0,0),(23799,'2019-02-02',167,0,0,0),(23800,'2019-02-02',168,0,0,0),(23801,'2019-02-02',169,0,0,0),(23802,'2019-02-02',170,0,0,0),(23803,'2019-02-02',171,0,0,0),(23804,'2019-02-02',172,0,0,0),(23805,'2019-02-02',173,0,0,0),(23806,'2019-02-02',174,0,0,0),(23807,'2019-02-02',175,0,0,0),(23808,'2019-02-02',176,0,0,0),(23809,'2019-02-02',177,0,0,0),(23810,'2019-02-02',178,0,0,0),(23811,'2019-02-02',179,0,0,0),(23812,'2019-02-02',180,0,0,0),(23813,'2019-02-02',181,0,0,0),(23814,'2019-02-02',182,0,0,0),(23815,'2019-02-02',183,0,0,0),(23816,'2019-02-02',184,0,0,0),(23817,'2019-02-02',185,0,0,0),(23818,'2019-02-02',186,0,0,0),(23819,'2019-02-02',187,0,0,0),(23820,'2019-02-02',188,0,0,0),(23821,'2019-02-02',189,0,0,0),(23822,'2019-02-02',190,0,0,0),(23823,'2019-02-02',191,0,0,0),(23824,'2019-02-02',192,0,0,0),(23825,'2019-02-02',193,0,0,0),(23826,'2019-02-02',194,0,0,0),(23827,'2019-02-02',195,0,0,0),(23828,'2019-02-02',196,0,0,0),(23829,'2019-02-02',197,0,0,0),(23830,'2019-02-02',198,0,0,0),(23831,'2019-02-02',199,0,0,0),(23832,'2019-02-02',200,0,0,0),(23833,'2019-02-02',201,0,0,0),(23834,'2019-02-02',202,0,0,0),(23835,'2019-02-02',203,0,0,0),(23836,'2019-02-02',204,0,0,0),(23895,'2019-02-03',1,0,0,0),(23896,'2019-02-03',2,0,0,0),(23897,'2019-02-03',9,0,0,0),(23898,'2019-02-03',11,0,0,0),(23899,'2019-02-03',12,0,0,0),(23900,'2019-02-03',13,0,0,0),(23901,'2019-02-03',14,0,0,0),(23902,'2019-02-03',15,0,0,0),(23903,'2019-02-03',16,0,0,0),(23904,'2019-02-03',17,0,0,0),(23905,'2019-02-03',18,0,0,0),(23906,'2019-02-03',19,0,0,0),(23907,'2019-02-03',20,0,0,0),(23908,'2019-02-03',21,0,0,0),(23909,'2019-02-03',22,0,0,0),(23910,'2019-02-03',23,0,0,0),(23911,'2019-02-03',24,0,0,0),(23912,'2019-02-03',25,0,0,0),(23913,'2019-02-03',26,0,0,0),(23914,'2019-02-03',27,0,0,0),(23915,'2019-02-03',28,0,0,0),(23916,'2019-02-03',29,0,0,0),(23917,'2019-02-03',30,0,0,0),(23918,'2019-02-03',31,0,0,0),(23919,'2019-02-03',32,0,0,0),(23920,'2019-02-03',33,0,0,0),(23921,'2019-02-03',34,0,0,0),(23922,'2019-02-03',35,0,0,0),(23923,'2019-02-03',36,0,0,0),(23924,'2019-02-03',37,0,0,0),(23925,'2019-02-03',38,0,0,0),(23926,'2019-02-03',39,0,0,0),(23927,'2019-02-03',40,0,0,0),(23928,'2019-02-03',41,0,0,0),(23929,'2019-02-03',42,0,0,0),(23930,'2019-02-03',43,0,0,0),(23931,'2019-02-03',44,0,0,0),(23932,'2019-02-03',45,0,0,0),(23933,'2019-02-03',46,0,0,0),(23934,'2019-02-03',47,0,0,0),(23935,'2019-02-03',48,0,0,0),(23936,'2019-02-03',49,0,0,0),(23937,'2019-02-03',50,0,0,0),(23938,'2019-02-03',51,0,0,0),(23939,'2019-02-03',52,0,0,0),(23940,'2019-02-03',53,0,0,0),(23941,'2019-02-03',54,0,0,0),(23942,'2019-02-03',55,0,0,0),(23943,'2019-02-03',56,0,0,0),(23944,'2019-02-03',57,0,0,0),(23945,'2019-02-03',58,0,0,0),(23946,'2019-02-03',59,0,0,0),(23947,'2019-02-03',60,0,0,0),(23948,'2019-02-03',61,0,0,0),(23949,'2019-02-03',62,0,0,0),(23950,'2019-02-03',63,0,0,0),(23951,'2019-02-03',64,0,0,0),(23952,'2019-02-03',65,0,0,0),(23953,'2019-02-03',66,0,0,0),(23954,'2019-02-03',67,0,0,0),(23955,'2019-02-03',68,0,0,0),(23956,'2019-02-03',69,0,0,0),(23957,'2019-02-03',70,0,0,0),(23958,'2019-02-03',71,0,0,0),(23959,'2019-02-03',72,0,0,0),(23960,'2019-02-03',73,0,0,0),(23961,'2019-02-03',74,0,0,0),(23962,'2019-02-03',75,0,0,0),(23963,'2019-02-03',76,0,0,0),(23964,'2019-02-03',77,0,0,0),(23965,'2019-02-03',78,0,0,0),(23966,'2019-02-03',79,0,0,0),(23967,'2019-02-03',80,0,0,0),(23968,'2019-02-03',81,0,0,0),(23969,'2019-02-03',82,0,0,0),(23970,'2019-02-03',83,0,0,0),(23971,'2019-02-03',84,0,0,0),(23972,'2019-02-03',85,0,0,0),(23973,'2019-02-03',86,0,0,0),(23974,'2019-02-03',87,0,0,0),(23975,'2019-02-03',88,0,0,0),(23976,'2019-02-03',89,0,0,0),(23977,'2019-02-03',90,0,0,0),(23978,'2019-02-03',91,0,0,0),(23979,'2019-02-03',92,0,0,0),(23980,'2019-02-03',93,0,0,0),(23981,'2019-02-03',94,0,0,0),(23982,'2019-02-03',95,0,0,0),(23983,'2019-02-03',96,0,0,0),(23984,'2019-02-03',97,0,0,0),(23985,'2019-02-03',98,0,0,0),(23986,'2019-02-03',99,0,0,0),(23987,'2019-02-03',100,0,0,0),(23988,'2019-02-03',101,0,0,0),(23989,'2019-02-03',102,0,0,0),(23990,'2019-02-03',103,0,0,0),(23991,'2019-02-03',104,0,0,0),(23992,'2019-02-03',105,0,0,0),(23993,'2019-02-03',106,0,0,0),(23994,'2019-02-03',107,0,0,0),(23995,'2019-02-03',108,0,0,0),(23996,'2019-02-03',109,0,0,0),(23997,'2019-02-03',110,0,0,0),(23998,'2019-02-03',111,0,0,0),(23999,'2019-02-03',112,0,0,0),(24000,'2019-02-03',113,0,0,0),(24001,'2019-02-03',114,0,0,0),(24002,'2019-02-03',115,0,0,0),(24003,'2019-02-03',116,0,0,0),(24004,'2019-02-03',117,0,0,0),(24005,'2019-02-03',118,0,0,0),(24006,'2019-02-03',119,0,0,0),(24007,'2019-02-03',120,0,0,0),(24008,'2019-02-03',121,0,0,0),(24009,'2019-02-03',122,0,0,0),(24010,'2019-02-03',123,0,0,0),(24011,'2019-02-03',124,0,0,0),(24012,'2019-02-03',125,0,0,0),(24013,'2019-02-03',126,0,0,0),(24014,'2019-02-03',127,0,0,0),(24015,'2019-02-03',128,0,0,0),(24016,'2019-02-03',129,0,0,0),(24017,'2019-02-03',130,0,0,0),(24018,'2019-02-03',131,0,0,0),(24019,'2019-02-03',132,0,0,0),(24020,'2019-02-03',133,0,0,0),(24021,'2019-02-03',134,0,0,0),(24022,'2019-02-03',135,0,0,0),(24023,'2019-02-03',136,0,0,0),(24024,'2019-02-03',137,0,0,0),(24025,'2019-02-03',138,0,0,0),(24026,'2019-02-03',139,0,0,0),(24027,'2019-02-03',140,0,0,0),(24028,'2019-02-03',141,0,0,0),(24029,'2019-02-03',142,0,0,0),(24030,'2019-02-03',143,0,0,0),(24031,'2019-02-03',144,0,0,0),(24032,'2019-02-03',145,0,0,0),(24033,'2019-02-03',146,0,0,0),(24034,'2019-02-03',147,0,0,0),(24035,'2019-02-03',148,0,0,0),(24036,'2019-02-03',149,0,0,0),(24037,'2019-02-03',150,0,0,0),(24038,'2019-02-03',151,0,0,0),(24039,'2019-02-03',152,0,0,0),(24040,'2019-02-03',153,0,0,0),(24041,'2019-02-03',154,0,0,0),(24042,'2019-02-03',155,0,0,0),(24043,'2019-02-03',156,0,0,0),(24044,'2019-02-03',157,0,0,0),(24045,'2019-02-03',158,0,0,0),(24046,'2019-02-03',159,0,0,0),(24047,'2019-02-03',160,0,0,0),(24048,'2019-02-03',161,0,0,0),(24049,'2019-02-03',162,0,0,0),(24050,'2019-02-03',163,0,0,0),(24051,'2019-02-03',164,0,0,0),(24052,'2019-02-03',165,0,0,0),(24053,'2019-02-03',166,0,0,0),(24054,'2019-02-03',167,0,0,0),(24055,'2019-02-03',168,0,0,0),(24056,'2019-02-03',169,0,0,0),(24057,'2019-02-03',170,0,0,0),(24058,'2019-02-03',171,0,0,0),(24059,'2019-02-03',172,0,0,0),(24060,'2019-02-03',173,0,0,0),(24061,'2019-02-03',174,0,0,0),(24062,'2019-02-03',175,0,0,0),(24063,'2019-02-03',176,0,0,0),(24064,'2019-02-03',177,0,0,0),(24065,'2019-02-03',178,0,0,0),(24066,'2019-02-03',179,0,0,0),(24067,'2019-02-03',180,0,0,0),(24068,'2019-02-03',181,0,0,0),(24069,'2019-02-03',182,0,0,0),(24070,'2019-02-03',183,0,0,0),(24071,'2019-02-03',184,0,0,0),(24072,'2019-02-03',185,0,0,0),(24073,'2019-02-03',186,0,0,0),(24074,'2019-02-03',187,0,0,0),(24075,'2019-02-03',188,0,0,0),(24076,'2019-02-03',189,0,0,0),(24077,'2019-02-03',190,0,0,0),(24078,'2019-02-03',191,0,0,0),(24079,'2019-02-03',192,0,0,0),(24080,'2019-02-03',193,0,0,0),(24081,'2019-02-03',194,0,0,0),(24082,'2019-02-03',195,0,0,0),(24083,'2019-02-03',196,0,0,0),(24084,'2019-02-03',197,0,0,0),(24085,'2019-02-03',198,0,0,0),(24086,'2019-02-03',199,0,0,0),(24087,'2019-02-03',200,0,0,0),(24088,'2019-02-03',201,0,0,0),(24089,'2019-02-03',202,0,0,0),(24090,'2019-02-03',203,0,0,0),(24091,'2019-02-03',204,0,0,0),(24150,'2019-02-04',1,0,0,0),(24151,'2019-02-04',2,0,0,0),(24152,'2019-02-04',9,0,0,0),(24153,'2019-02-04',11,0,0,0),(24154,'2019-02-04',12,0,0,0),(24155,'2019-02-04',13,0,0,0),(24156,'2019-02-04',14,0,0,0),(24157,'2019-02-04',15,0,0,0),(24158,'2019-02-04',16,0,0,0),(24159,'2019-02-04',17,0,0,0),(24160,'2019-02-04',18,0,0,0),(24161,'2019-02-04',19,0,0,0),(24162,'2019-02-04',20,0,0,0),(24163,'2019-02-04',21,0,0,0),(24164,'2019-02-04',22,0,0,0),(24165,'2019-02-04',23,0,0,0),(24166,'2019-02-04',24,0,0,0),(24167,'2019-02-04',25,0,0,0),(24168,'2019-02-04',26,0,0,0),(24169,'2019-02-04',27,0,0,0),(24170,'2019-02-04',28,0,0,0),(24171,'2019-02-04',29,0,0,0),(24172,'2019-02-04',30,0,0,0),(24173,'2019-02-04',31,0,0,0),(24174,'2019-02-04',32,0,0,0),(24175,'2019-02-04',33,0,0,0),(24176,'2019-02-04',34,0,0,0),(24177,'2019-02-04',35,0,0,0),(24178,'2019-02-04',36,0,0,0),(24179,'2019-02-04',37,0,0,0),(24180,'2019-02-04',38,0,0,0),(24181,'2019-02-04',39,0,0,0),(24182,'2019-02-04',40,0,0,0),(24183,'2019-02-04',41,0,0,0),(24184,'2019-02-04',42,0,0,0),(24185,'2019-02-04',43,0,0,0),(24186,'2019-02-04',44,0,0,0),(24187,'2019-02-04',45,0,0,0),(24188,'2019-02-04',46,0,0,0),(24189,'2019-02-04',47,0,0,0),(24190,'2019-02-04',48,0,0,0),(24191,'2019-02-04',49,0,0,0),(24192,'2019-02-04',50,0,0,0),(24193,'2019-02-04',51,0,0,0),(24194,'2019-02-04',52,0,0,0),(24195,'2019-02-04',53,0,0,0),(24196,'2019-02-04',54,0,0,0),(24197,'2019-02-04',55,0,0,0),(24198,'2019-02-04',56,0,0,0),(24199,'2019-02-04',57,0,0,0),(24200,'2019-02-04',58,0,0,0),(24201,'2019-02-04',59,0,0,0),(24202,'2019-02-04',60,0,0,0),(24203,'2019-02-04',61,0,0,0),(24204,'2019-02-04',62,0,0,0),(24205,'2019-02-04',63,0,0,0),(24206,'2019-02-04',64,0,0,0),(24207,'2019-02-04',65,0,0,0),(24208,'2019-02-04',66,0,0,0),(24209,'2019-02-04',67,0,0,0),(24210,'2019-02-04',68,0,0,0),(24211,'2019-02-04',69,0,0,0),(24212,'2019-02-04',70,0,0,0),(24213,'2019-02-04',71,0,0,0),(24214,'2019-02-04',72,0,0,0),(24215,'2019-02-04',73,0,0,0),(24216,'2019-02-04',74,0,0,0),(24217,'2019-02-04',75,0,0,0),(24218,'2019-02-04',76,0,0,0),(24219,'2019-02-04',77,0,0,0),(24220,'2019-02-04',78,0,0,0),(24221,'2019-02-04',79,0,0,0),(24222,'2019-02-04',80,0,0,0),(24223,'2019-02-04',81,0,0,0),(24224,'2019-02-04',82,0,0,0),(24225,'2019-02-04',83,0,0,0),(24226,'2019-02-04',84,0,0,0),(24227,'2019-02-04',85,0,0,0),(24228,'2019-02-04',86,0,0,0),(24229,'2019-02-04',87,0,0,0),(24230,'2019-02-04',88,0,0,0),(24231,'2019-02-04',89,0,0,0),(24232,'2019-02-04',90,0,0,0),(24233,'2019-02-04',91,0,0,0),(24234,'2019-02-04',92,0,0,0),(24235,'2019-02-04',93,0,0,0),(24236,'2019-02-04',94,0,0,0),(24237,'2019-02-04',95,0,0,0),(24238,'2019-02-04',96,0,0,0),(24239,'2019-02-04',97,0,0,0),(24240,'2019-02-04',98,0,0,0),(24241,'2019-02-04',99,0,0,0),(24242,'2019-02-04',100,0,0,0),(24243,'2019-02-04',101,0,0,0),(24244,'2019-02-04',102,0,0,0),(24245,'2019-02-04',103,0,0,0),(24246,'2019-02-04',104,0,0,0),(24247,'2019-02-04',105,0,0,0),(24248,'2019-02-04',106,0,0,0),(24249,'2019-02-04',107,0,0,0),(24250,'2019-02-04',108,0,0,0),(24251,'2019-02-04',109,0,0,0),(24252,'2019-02-04',110,0,0,0),(24253,'2019-02-04',111,0,0,0),(24254,'2019-02-04',112,0,0,0),(24255,'2019-02-04',113,0,0,0),(24256,'2019-02-04',114,0,0,0),(24257,'2019-02-04',115,0,0,0),(24258,'2019-02-04',116,0,0,0),(24259,'2019-02-04',117,0,0,0),(24260,'2019-02-04',118,0,0,0),(24261,'2019-02-04',119,0,0,0),(24262,'2019-02-04',120,0,0,0),(24263,'2019-02-04',121,0,0,0),(24264,'2019-02-04',122,0,0,0),(24265,'2019-02-04',123,0,0,0),(24266,'2019-02-04',124,0,0,0),(24267,'2019-02-04',125,0,0,0),(24268,'2019-02-04',126,0,0,0),(24269,'2019-02-04',127,0,0,0),(24270,'2019-02-04',128,0,0,0),(24271,'2019-02-04',129,0,0,0),(24272,'2019-02-04',130,0,0,0),(24273,'2019-02-04',131,0,0,0),(24274,'2019-02-04',132,0,0,0),(24275,'2019-02-04',133,0,0,0),(24276,'2019-02-04',134,0,0,0),(24277,'2019-02-04',135,0,0,0),(24278,'2019-02-04',136,0,0,0),(24279,'2019-02-04',137,0,0,0),(24280,'2019-02-04',138,0,0,0),(24281,'2019-02-04',139,0,0,0),(24282,'2019-02-04',140,0,0,0),(24283,'2019-02-04',141,0,0,0),(24284,'2019-02-04',142,0,0,0),(24285,'2019-02-04',143,0,0,0),(24286,'2019-02-04',144,0,0,0),(24287,'2019-02-04',145,0,0,0),(24288,'2019-02-04',146,0,0,0),(24289,'2019-02-04',147,0,0,0),(24290,'2019-02-04',148,0,0,0),(24291,'2019-02-04',149,0,0,0),(24292,'2019-02-04',150,0,0,0),(24293,'2019-02-04',151,0,0,0),(24294,'2019-02-04',152,0,0,0),(24295,'2019-02-04',153,0,0,0),(24296,'2019-02-04',154,0,0,0),(24297,'2019-02-04',155,0,0,0),(24298,'2019-02-04',156,0,0,0),(24299,'2019-02-04',157,0,0,0),(24300,'2019-02-04',158,0,0,0),(24301,'2019-02-04',159,0,0,0),(24302,'2019-02-04',160,0,0,0),(24303,'2019-02-04',161,0,0,0),(24304,'2019-02-04',162,0,0,0),(24305,'2019-02-04',163,0,0,0),(24306,'2019-02-04',164,0,0,0),(24307,'2019-02-04',165,0,0,0),(24308,'2019-02-04',166,0,0,0),(24309,'2019-02-04',167,0,0,0),(24310,'2019-02-04',168,0,0,0),(24311,'2019-02-04',169,0,0,0),(24312,'2019-02-04',170,0,0,0),(24313,'2019-02-04',171,0,0,0),(24314,'2019-02-04',172,0,0,0),(24315,'2019-02-04',173,0,0,0),(24316,'2019-02-04',174,0,0,0),(24317,'2019-02-04',175,0,0,0),(24318,'2019-02-04',176,0,0,0),(24319,'2019-02-04',177,0,0,0),(24320,'2019-02-04',178,0,0,0),(24321,'2019-02-04',179,0,0,0),(24322,'2019-02-04',180,0,0,0),(24323,'2019-02-04',181,0,0,0),(24324,'2019-02-04',182,0,0,0),(24325,'2019-02-04',183,0,0,0),(24326,'2019-02-04',184,0,0,0),(24327,'2019-02-04',185,0,0,0),(24328,'2019-02-04',186,0,0,0),(24329,'2019-02-04',187,0,0,0),(24330,'2019-02-04',188,0,0,0),(24331,'2019-02-04',189,0,0,0),(24332,'2019-02-04',190,0,0,0),(24333,'2019-02-04',191,0,0,0),(24334,'2019-02-04',192,0,0,0),(24335,'2019-02-04',193,0,0,0),(24336,'2019-02-04',194,0,0,0),(24337,'2019-02-04',195,0,0,0),(24338,'2019-02-04',196,0,0,0),(24339,'2019-02-04',197,0,0,0),(24340,'2019-02-04',198,0,0,0),(24341,'2019-02-04',199,0,0,0),(24342,'2019-02-04',200,0,0,0),(24343,'2019-02-04',201,0,0,0),(24344,'2019-02-04',202,0,0,0),(24345,'2019-02-04',203,0,0,0),(24346,'2019-02-04',204,0,0,0),(24347,'2019-02-05',1,0,0,0),(24348,'2019-02-05',2,0,0,0),(24349,'2019-02-05',9,0,0,0),(24350,'2019-02-05',11,0,0,0),(24351,'2019-02-05',12,0,0,0),(24352,'2019-02-05',13,0,0,0),(24353,'2019-02-05',14,0,0,0),(24354,'2019-02-05',15,0,0,0),(24355,'2019-02-05',16,0,0,0),(24356,'2019-02-05',17,0,0,0),(24357,'2019-02-05',18,0,0,0),(24358,'2019-02-05',19,0,0,0),(24359,'2019-02-05',20,0,0,0),(24360,'2019-02-05',21,0,0,0),(24361,'2019-02-05',22,0,0,0),(24362,'2019-02-05',23,0,0,0),(24363,'2019-02-05',24,0,0,0),(24364,'2019-02-05',25,0,0,0),(24365,'2019-02-05',26,0,0,0),(24366,'2019-02-05',27,0,0,0),(24367,'2019-02-05',28,0,0,0),(24368,'2019-02-05',29,0,0,0),(24369,'2019-02-05',30,0,0,0),(24370,'2019-02-05',31,0,0,0),(24371,'2019-02-05',32,0,0,0),(24372,'2019-02-05',33,0,0,0),(24373,'2019-02-05',34,0,0,0),(24374,'2019-02-05',35,0,0,0),(24375,'2019-02-05',36,0,0,0),(24376,'2019-02-05',37,0,0,0),(24377,'2019-02-05',38,0,0,0),(24378,'2019-02-05',39,0,0,0),(24379,'2019-02-05',40,0,0,0),(24380,'2019-02-05',41,0,0,0),(24381,'2019-02-05',42,0,0,0),(24382,'2019-02-05',43,0,0,0),(24383,'2019-02-05',44,0,0,0),(24384,'2019-02-05',45,0,0,0),(24385,'2019-02-05',46,0,0,0),(24386,'2019-02-05',47,0,0,0),(24387,'2019-02-05',48,0,0,0),(24388,'2019-02-05',49,0,0,0),(24389,'2019-02-05',50,0,0,0),(24390,'2019-02-05',51,0,0,0),(24391,'2019-02-05',52,0,0,0),(24392,'2019-02-05',53,0,0,0),(24393,'2019-02-05',54,0,0,0),(24394,'2019-02-05',55,0,0,0),(24395,'2019-02-05',56,0,0,0),(24396,'2019-02-05',57,0,0,0),(24397,'2019-02-05',58,0,0,0),(24398,'2019-02-05',59,0,0,0),(24399,'2019-02-05',60,0,0,0),(24400,'2019-02-05',61,0,0,0),(24401,'2019-02-05',62,0,0,0),(24402,'2019-02-05',63,0,0,0),(24403,'2019-02-05',64,0,0,0),(24404,'2019-02-05',65,0,0,0),(24405,'2019-02-05',66,0,0,0),(24406,'2019-02-05',67,0,0,0),(24407,'2019-02-05',68,0,0,0),(24408,'2019-02-05',69,0,0,0),(24409,'2019-02-05',70,0,0,0),(24410,'2019-02-05',71,0,0,0),(24411,'2019-02-05',72,0,0,0),(24412,'2019-02-05',73,0,0,0),(24413,'2019-02-05',74,0,0,0),(24414,'2019-02-05',75,0,0,0),(24415,'2019-02-05',76,0,0,0),(24416,'2019-02-05',77,0,0,0),(24417,'2019-02-05',78,0,0,0),(24418,'2019-02-05',79,0,0,0),(24419,'2019-02-05',80,0,0,0),(24420,'2019-02-05',81,0,0,0),(24421,'2019-02-05',82,0,0,0),(24422,'2019-02-05',83,0,0,0),(24423,'2019-02-05',84,0,0,0),(24424,'2019-02-05',85,0,0,0),(24425,'2019-02-05',86,0,0,0),(24426,'2019-02-05',87,0,0,0),(24427,'2019-02-05',88,0,0,0),(24428,'2019-02-05',89,0,0,0),(24429,'2019-02-05',90,0,0,0),(24430,'2019-02-05',91,0,0,0),(24431,'2019-02-05',92,0,0,0),(24432,'2019-02-05',93,0,0,0),(24433,'2019-02-05',94,0,0,0),(24434,'2019-02-05',95,0,0,0),(24435,'2019-02-05',96,0,0,0),(24436,'2019-02-05',97,0,0,0),(24437,'2019-02-05',98,0,0,0),(24438,'2019-02-05',99,0,0,0),(24439,'2019-02-05',100,0,0,0),(24440,'2019-02-05',101,0,0,0),(24441,'2019-02-05',102,0,0,0),(24442,'2019-02-05',103,0,0,0),(24443,'2019-02-05',104,0,0,0),(24444,'2019-02-05',105,0,0,0),(24445,'2019-02-05',106,0,0,0),(24446,'2019-02-05',107,0,0,0),(24447,'2019-02-05',108,0,0,0),(24448,'2019-02-05',109,0,0,0),(24449,'2019-02-05',110,0,0,0),(24450,'2019-02-05',111,0,0,0),(24451,'2019-02-05',112,0,0,0),(24452,'2019-02-05',113,0,0,0),(24453,'2019-02-05',114,0,0,0),(24454,'2019-02-05',115,0,0,0),(24455,'2019-02-05',116,0,0,0),(24456,'2019-02-05',117,0,0,0),(24457,'2019-02-05',118,0,0,0),(24458,'2019-02-05',119,0,0,0),(24459,'2019-02-05',120,0,0,0),(24460,'2019-02-05',121,0,0,0),(24461,'2019-02-05',122,0,0,0),(24462,'2019-02-05',123,0,0,0),(24463,'2019-02-05',124,0,0,0),(24464,'2019-02-05',125,0,0,0),(24465,'2019-02-05',126,0,0,0),(24466,'2019-02-05',127,0,0,0),(24467,'2019-02-05',128,0,0,0),(24468,'2019-02-05',129,0,0,0),(24469,'2019-02-05',130,0,0,0),(24470,'2019-02-05',131,0,0,0),(24471,'2019-02-05',132,0,0,0),(24472,'2019-02-05',133,0,0,0),(24473,'2019-02-05',134,0,0,0),(24474,'2019-02-05',135,0,0,0),(24475,'2019-02-05',136,0,0,0),(24476,'2019-02-05',137,0,0,0),(24477,'2019-02-05',138,0,0,0),(24478,'2019-02-05',139,0,0,0),(24479,'2019-02-05',140,0,0,0),(24480,'2019-02-05',141,0,0,0),(24481,'2019-02-05',142,0,0,0),(24482,'2019-02-05',143,0,0,0),(24483,'2019-02-05',144,0,0,0),(24484,'2019-02-05',145,0,0,0),(24485,'2019-02-05',146,0,0,0),(24486,'2019-02-05',147,0,0,0),(24487,'2019-02-05',148,0,0,0),(24488,'2019-02-05',149,0,0,0),(24489,'2019-02-05',150,0,0,0),(24490,'2019-02-05',151,0,0,0),(24491,'2019-02-05',152,0,0,0),(24492,'2019-02-05',153,0,0,0),(24493,'2019-02-05',154,0,0,0),(24494,'2019-02-05',155,0,0,0),(24495,'2019-02-05',156,0,0,0),(24496,'2019-02-05',157,0,0,0),(24497,'2019-02-05',158,0,0,0),(24498,'2019-02-05',159,0,0,0),(24499,'2019-02-05',160,0,0,0),(24500,'2019-02-05',161,0,0,0),(24501,'2019-02-05',162,0,0,0),(24502,'2019-02-05',163,0,0,0),(24503,'2019-02-05',164,0,0,0),(24504,'2019-02-05',165,0,0,0),(24505,'2019-02-05',166,0,0,0),(24506,'2019-02-05',167,0,0,0),(24507,'2019-02-05',168,0,0,0),(24508,'2019-02-05',169,0,0,0),(24509,'2019-02-05',170,0,0,0),(24510,'2019-02-05',171,0,0,0),(24511,'2019-02-05',172,0,0,0),(24512,'2019-02-05',173,0,0,0),(24513,'2019-02-05',174,0,0,0),(24514,'2019-02-05',175,0,0,0),(24515,'2019-02-05',176,0,0,0),(24516,'2019-02-05',177,0,0,0),(24517,'2019-02-05',178,0,0,0),(24518,'2019-02-05',179,0,0,0),(24519,'2019-02-05',180,0,0,0),(24520,'2019-02-05',181,0,0,0),(24521,'2019-02-05',182,0,0,0),(24522,'2019-02-05',183,0,0,0),(24523,'2019-02-05',184,0,0,0),(24524,'2019-02-05',185,0,0,0),(24525,'2019-02-05',186,0,0,0),(24526,'2019-02-05',187,0,0,0),(24527,'2019-02-05',188,0,0,0),(24528,'2019-02-05',189,0,0,0),(24529,'2019-02-05',190,0,0,0),(24530,'2019-02-05',191,0,0,0),(24531,'2019-02-05',192,0,0,0),(24532,'2019-02-05',193,0,0,0),(24533,'2019-02-05',194,0,0,0),(24534,'2019-02-05',195,0,0,0),(24535,'2019-02-05',196,0,0,0),(24536,'2019-02-05',197,0,0,0),(24537,'2019-02-05',198,0,0,0),(24538,'2019-02-05',199,0,0,0),(24539,'2019-02-05',200,0,0,0),(24540,'2019-02-05',201,0,0,0),(24541,'2019-02-05',202,0,0,0),(24542,'2019-02-05',203,0,0,0),(24543,'2019-02-05',204,0,0,0),(24602,'2019-02-06',1,0,0,0),(24603,'2019-02-06',2,0,0,0),(24604,'2019-02-06',9,0,0,0),(24605,'2019-02-06',11,0,0,0),(24606,'2019-02-06',12,0,0,0),(24607,'2019-02-06',13,0,0,0),(24608,'2019-02-06',14,0,0,0),(24609,'2019-02-06',15,0,0,0),(24610,'2019-02-06',16,0,0,0),(24611,'2019-02-06',17,0,0,0),(24612,'2019-02-06',18,0,0,0),(24613,'2019-02-06',19,0,0,0),(24614,'2019-02-06',20,0,0,0),(24615,'2019-02-06',21,0,0,0),(24616,'2019-02-06',22,0,0,0),(24617,'2019-02-06',23,0,0,0),(24618,'2019-02-06',24,0,0,0),(24619,'2019-02-06',25,0,0,0),(24620,'2019-02-06',26,0,0,0),(24621,'2019-02-06',27,0,0,0),(24622,'2019-02-06',28,0,0,0),(24623,'2019-02-06',29,0,0,0),(24624,'2019-02-06',30,0,0,0),(24625,'2019-02-06',31,0,0,0),(24626,'2019-02-06',32,0,0,0),(24627,'2019-02-06',33,0,0,0),(24628,'2019-02-06',34,0,0,0),(24629,'2019-02-06',35,0,0,0),(24630,'2019-02-06',36,0,0,0),(24631,'2019-02-06',37,0,0,0),(24632,'2019-02-06',38,0,0,0),(24633,'2019-02-06',39,0,0,0),(24634,'2019-02-06',40,0,0,0),(24635,'2019-02-06',41,0,0,0),(24636,'2019-02-06',42,0,0,0),(24637,'2019-02-06',43,0,0,0),(24638,'2019-02-06',44,0,0,0),(24639,'2019-02-06',45,0,0,0),(24640,'2019-02-06',46,0,0,0),(24641,'2019-02-06',47,0,0,0),(24642,'2019-02-06',48,0,0,0),(24643,'2019-02-06',49,0,0,0),(24644,'2019-02-06',50,0,0,0),(24645,'2019-02-06',51,0,0,0),(24646,'2019-02-06',52,0,0,0),(24647,'2019-02-06',53,0,0,0),(24648,'2019-02-06',54,0,0,0),(24649,'2019-02-06',55,0,0,0),(24650,'2019-02-06',56,0,0,0),(24651,'2019-02-06',57,0,0,0),(24652,'2019-02-06',58,0,0,0),(24653,'2019-02-06',59,0,0,0),(24654,'2019-02-06',60,0,0,0),(24655,'2019-02-06',61,0,0,0),(24656,'2019-02-06',62,0,0,0),(24657,'2019-02-06',63,0,0,0),(24658,'2019-02-06',64,0,0,0),(24659,'2019-02-06',65,0,0,0),(24660,'2019-02-06',66,0,0,0),(24661,'2019-02-06',67,0,0,0),(24662,'2019-02-06',68,0,0,0),(24663,'2019-02-06',69,0,0,0),(24664,'2019-02-06',70,0,0,0),(24665,'2019-02-06',71,0,0,0),(24666,'2019-02-06',72,0,0,0),(24667,'2019-02-06',73,0,0,0),(24668,'2019-02-06',74,0,0,0),(24669,'2019-02-06',75,0,0,0),(24670,'2019-02-06',76,0,0,0),(24671,'2019-02-06',77,0,0,0),(24672,'2019-02-06',78,0,0,0),(24673,'2019-02-06',79,0,0,0),(24674,'2019-02-06',80,0,0,0),(24675,'2019-02-06',81,0,0,0),(24676,'2019-02-06',82,0,0,0),(24677,'2019-02-06',83,0,0,0),(24678,'2019-02-06',84,0,0,0),(24679,'2019-02-06',85,0,0,0),(24680,'2019-02-06',86,0,0,0),(24681,'2019-02-06',87,0,0,0),(24682,'2019-02-06',88,0,0,0),(24683,'2019-02-06',89,0,0,0),(24684,'2019-02-06',90,0,0,0),(24685,'2019-02-06',91,0,0,0),(24686,'2019-02-06',92,0,0,0),(24687,'2019-02-06',93,0,0,0),(24688,'2019-02-06',94,0,0,0),(24689,'2019-02-06',95,0,0,0),(24690,'2019-02-06',96,0,0,0),(24691,'2019-02-06',97,0,0,0),(24692,'2019-02-06',98,0,0,0),(24693,'2019-02-06',99,0,0,0),(24694,'2019-02-06',100,0,0,0),(24695,'2019-02-06',101,0,0,0),(24696,'2019-02-06',102,0,0,0),(24697,'2019-02-06',103,0,0,0),(24698,'2019-02-06',104,0,0,0),(24699,'2019-02-06',105,0,0,0),(24700,'2019-02-06',106,0,0,0),(24701,'2019-02-06',107,0,0,0),(24702,'2019-02-06',108,0,0,0),(24703,'2019-02-06',109,0,0,0),(24704,'2019-02-06',110,0,0,0),(24705,'2019-02-06',111,0,0,0),(24706,'2019-02-06',112,0,0,0),(24707,'2019-02-06',113,0,0,0),(24708,'2019-02-06',114,0,0,0),(24709,'2019-02-06',115,0,0,0),(24710,'2019-02-06',116,0,0,0),(24711,'2019-02-06',117,0,0,0),(24712,'2019-02-06',118,0,0,0),(24713,'2019-02-06',119,0,0,0),(24714,'2019-02-06',120,0,0,0),(24715,'2019-02-06',121,0,0,0),(24716,'2019-02-06',122,0,0,0),(24717,'2019-02-06',123,0,0,0),(24718,'2019-02-06',124,0,0,0),(24719,'2019-02-06',125,0,0,0),(24720,'2019-02-06',126,0,0,0),(24721,'2019-02-06',127,0,0,0),(24722,'2019-02-06',128,0,0,0),(24723,'2019-02-06',129,0,0,0),(24724,'2019-02-06',130,0,0,0),(24725,'2019-02-06',131,0,0,0),(24726,'2019-02-06',132,0,0,0),(24727,'2019-02-06',133,0,0,0),(24728,'2019-02-06',134,0,0,0),(24729,'2019-02-06',135,0,0,0),(24730,'2019-02-06',136,0,0,0),(24731,'2019-02-06',137,0,0,0),(24732,'2019-02-06',138,0,0,0),(24733,'2019-02-06',139,0,0,0),(24734,'2019-02-06',140,0,0,0),(24735,'2019-02-06',141,0,0,0),(24736,'2019-02-06',142,0,0,0),(24737,'2019-02-06',143,0,0,0),(24738,'2019-02-06',144,0,0,0),(24739,'2019-02-06',145,0,0,0),(24740,'2019-02-06',146,0,0,0),(24741,'2019-02-06',147,0,0,0),(24742,'2019-02-06',148,0,0,0),(24743,'2019-02-06',149,0,0,0),(24744,'2019-02-06',150,0,0,0),(24745,'2019-02-06',151,0,0,0),(24746,'2019-02-06',152,0,0,0),(24747,'2019-02-06',153,0,0,0),(24748,'2019-02-06',154,0,0,0),(24749,'2019-02-06',155,0,0,0),(24750,'2019-02-06',156,0,0,0),(24751,'2019-02-06',157,0,0,0),(24752,'2019-02-06',158,0,0,0),(24753,'2019-02-06',159,0,0,0),(24754,'2019-02-06',160,0,0,0),(24755,'2019-02-06',161,0,0,0),(24756,'2019-02-06',162,0,0,0),(24757,'2019-02-06',163,0,0,0),(24758,'2019-02-06',164,0,0,0),(24759,'2019-02-06',165,0,0,0),(24760,'2019-02-06',166,0,0,0),(24761,'2019-02-06',167,0,0,0),(24762,'2019-02-06',168,0,0,0),(24763,'2019-02-06',169,0,0,0),(24764,'2019-02-06',170,0,0,0),(24765,'2019-02-06',171,0,0,0),(24766,'2019-02-06',172,0,0,0),(24767,'2019-02-06',173,0,0,0),(24768,'2019-02-06',174,0,0,0),(24769,'2019-02-06',175,0,0,0),(24770,'2019-02-06',176,0,0,0),(24771,'2019-02-06',177,0,0,0),(24772,'2019-02-06',178,0,0,0),(24773,'2019-02-06',179,0,0,0),(24774,'2019-02-06',180,0,0,0),(24775,'2019-02-06',181,0,0,0),(24776,'2019-02-06',182,0,0,0),(24777,'2019-02-06',183,0,0,0),(24778,'2019-02-06',184,0,0,0),(24779,'2019-02-06',185,0,0,0),(24780,'2019-02-06',186,0,0,0),(24781,'2019-02-06',187,0,0,0),(24782,'2019-02-06',188,0,0,0),(24783,'2019-02-06',189,0,0,0),(24784,'2019-02-06',190,0,0,0),(24785,'2019-02-06',191,0,0,0),(24786,'2019-02-06',192,0,0,0),(24787,'2019-02-06',193,0,0,0),(24788,'2019-02-06',194,0,0,0),(24789,'2019-02-06',195,0,0,0),(24790,'2019-02-06',196,0,0,0),(24791,'2019-02-06',197,0,0,0),(24792,'2019-02-06',198,0,0,0),(24793,'2019-02-06',199,0,0,0),(24794,'2019-02-06',200,0,0,0),(24795,'2019-02-06',201,0,0,0),(24796,'2019-02-06',202,0,0,0),(24797,'2019-02-06',203,0,0,0),(24798,'2019-02-06',204,0,0,0),(24857,'2019-02-07',1,0,0,0),(24858,'2019-02-07',2,0,0,0),(24859,'2019-02-07',9,0,0,0),(24860,'2019-02-07',11,0,0,0),(24861,'2019-02-07',12,0,0,0),(24862,'2019-02-07',13,0,0,0),(24863,'2019-02-07',14,0,0,0),(24864,'2019-02-07',15,0,0,0),(24865,'2019-02-07',16,0,0,0),(24866,'2019-02-07',17,0,0,0),(24867,'2019-02-07',18,0,0,0),(24868,'2019-02-07',19,0,0,0),(24869,'2019-02-07',20,0,0,0),(24870,'2019-02-07',21,0,0,0),(24871,'2019-02-07',22,0,0,0),(24872,'2019-02-07',23,0,0,0),(24873,'2019-02-07',24,0,0,0),(24874,'2019-02-07',25,0,0,0),(24875,'2019-02-07',26,0,0,0),(24876,'2019-02-07',27,0,0,0),(24877,'2019-02-07',28,0,0,0),(24878,'2019-02-07',29,0,0,0),(24879,'2019-02-07',30,0,0,0),(24880,'2019-02-07',31,0,0,0),(24881,'2019-02-07',32,0,0,0),(24882,'2019-02-07',33,0,0,0),(24883,'2019-02-07',34,0,0,0),(24884,'2019-02-07',35,0,0,0),(24885,'2019-02-07',36,0,0,0),(24886,'2019-02-07',37,0,0,0),(24887,'2019-02-07',38,0,0,0),(24888,'2019-02-07',39,0,0,0),(24889,'2019-02-07',40,0,0,0),(24890,'2019-02-07',41,0,0,0),(24891,'2019-02-07',42,0,0,0),(24892,'2019-02-07',43,0,0,0),(24893,'2019-02-07',44,0,0,0),(24894,'2019-02-07',45,0,0,0),(24895,'2019-02-07',46,0,0,0),(24896,'2019-02-07',47,0,0,0),(24897,'2019-02-07',48,0,0,0),(24898,'2019-02-07',49,0,0,0),(24899,'2019-02-07',50,0,0,0),(24900,'2019-02-07',51,0,0,0),(24901,'2019-02-07',52,0,0,0),(24902,'2019-02-07',53,0,0,0),(24903,'2019-02-07',54,0,0,0),(24904,'2019-02-07',55,0,0,0),(24905,'2019-02-07',56,0,0,0),(24906,'2019-02-07',57,0,0,0),(24907,'2019-02-07',58,0,0,0),(24908,'2019-02-07',59,0,0,0),(24909,'2019-02-07',60,0,0,0),(24910,'2019-02-07',61,0,0,0),(24911,'2019-02-07',62,0,0,0),(24912,'2019-02-07',63,0,0,0),(24913,'2019-02-07',64,0,0,0),(24914,'2019-02-07',65,0,0,0),(24915,'2019-02-07',66,0,0,0),(24916,'2019-02-07',67,0,0,0),(24917,'2019-02-07',68,0,0,0),(24918,'2019-02-07',69,0,0,0),(24919,'2019-02-07',70,0,0,0),(24920,'2019-02-07',71,0,0,0),(24921,'2019-02-07',72,0,0,0),(24922,'2019-02-07',73,0,0,0),(24923,'2019-02-07',74,0,0,0),(24924,'2019-02-07',75,0,0,0),(24925,'2019-02-07',76,0,0,0),(24926,'2019-02-07',77,0,0,0),(24927,'2019-02-07',78,0,0,0),(24928,'2019-02-07',79,0,0,0),(24929,'2019-02-07',80,0,0,0),(24930,'2019-02-07',81,0,0,0),(24931,'2019-02-07',82,0,0,0),(24932,'2019-02-07',83,0,0,0),(24933,'2019-02-07',84,0,0,0),(24934,'2019-02-07',85,0,0,0),(24935,'2019-02-07',86,0,0,0),(24936,'2019-02-07',87,0,0,0),(24937,'2019-02-07',88,0,0,0),(24938,'2019-02-07',89,0,0,0),(24939,'2019-02-07',90,0,0,0),(24940,'2019-02-07',91,0,0,0),(24941,'2019-02-07',92,0,0,0),(24942,'2019-02-07',93,0,0,0),(24943,'2019-02-07',94,0,0,0),(24944,'2019-02-07',95,0,0,0),(24945,'2019-02-07',96,0,0,0),(24946,'2019-02-07',97,0,0,0),(24947,'2019-02-07',98,0,0,0),(24948,'2019-02-07',99,0,0,0),(24949,'2019-02-07',100,0,0,0),(24950,'2019-02-07',101,0,0,0),(24951,'2019-02-07',102,0,0,0),(24952,'2019-02-07',103,0,0,0),(24953,'2019-02-07',104,0,0,0),(24954,'2019-02-07',105,0,0,0),(24955,'2019-02-07',106,0,0,0),(24956,'2019-02-07',107,0,0,0),(24957,'2019-02-07',108,0,0,0),(24958,'2019-02-07',109,0,0,0),(24959,'2019-02-07',110,0,0,0),(24960,'2019-02-07',111,0,0,0),(24961,'2019-02-07',112,0,0,0),(24962,'2019-02-07',113,0,0,0),(24963,'2019-02-07',114,0,0,0),(24964,'2019-02-07',115,0,0,0),(24965,'2019-02-07',116,0,0,0),(24966,'2019-02-07',117,0,0,0),(24967,'2019-02-07',118,0,0,0),(24968,'2019-02-07',119,0,0,0),(24969,'2019-02-07',120,0,0,0),(24970,'2019-02-07',121,0,0,0),(24971,'2019-02-07',122,0,0,0),(24972,'2019-02-07',123,0,0,0),(24973,'2019-02-07',124,0,0,0),(24974,'2019-02-07',125,0,0,0),(24975,'2019-02-07',126,0,0,0),(24976,'2019-02-07',127,0,0,0),(24977,'2019-02-07',128,0,0,0),(24978,'2019-02-07',129,0,0,0),(24979,'2019-02-07',130,0,0,0),(24980,'2019-02-07',131,0,0,0),(24981,'2019-02-07',132,0,0,0),(24982,'2019-02-07',133,0,0,0),(24983,'2019-02-07',134,0,0,0),(24984,'2019-02-07',135,0,0,0),(24985,'2019-02-07',136,0,0,0),(24986,'2019-02-07',137,0,0,0),(24987,'2019-02-07',138,0,0,0),(24988,'2019-02-07',139,0,0,0),(24989,'2019-02-07',140,0,0,0),(24990,'2019-02-07',141,0,0,0),(24991,'2019-02-07',142,0,0,0),(24992,'2019-02-07',143,0,0,0),(24993,'2019-02-07',144,0,0,0),(24994,'2019-02-07',145,0,0,0),(24995,'2019-02-07',146,0,0,0),(24996,'2019-02-07',147,0,0,0),(24997,'2019-02-07',148,0,0,0),(24998,'2019-02-07',149,0,0,0),(24999,'2019-02-07',150,0,0,0),(25000,'2019-02-07',151,0,0,0),(25001,'2019-02-07',152,0,0,0),(25002,'2019-02-07',153,0,0,0),(25003,'2019-02-07',154,0,0,0),(25004,'2019-02-07',155,0,0,0),(25005,'2019-02-07',156,0,0,0),(25006,'2019-02-07',157,0,0,0),(25007,'2019-02-07',158,0,0,0),(25008,'2019-02-07',159,0,0,0),(25009,'2019-02-07',160,0,0,0),(25010,'2019-02-07',161,0,0,0),(25011,'2019-02-07',162,0,0,0),(25012,'2019-02-07',163,0,0,0),(25013,'2019-02-07',164,0,0,0),(25014,'2019-02-07',165,0,0,0),(25015,'2019-02-07',166,0,0,0),(25016,'2019-02-07',167,0,0,0),(25017,'2019-02-07',168,0,0,0),(25018,'2019-02-07',169,0,0,0),(25019,'2019-02-07',170,0,0,0),(25020,'2019-02-07',171,0,0,0),(25021,'2019-02-07',172,0,0,0),(25022,'2019-02-07',173,0,0,0),(25023,'2019-02-07',174,0,0,0),(25024,'2019-02-07',175,0,0,0),(25025,'2019-02-07',176,0,0,0),(25026,'2019-02-07',177,0,0,0),(25027,'2019-02-07',178,0,0,0),(25028,'2019-02-07',179,0,0,0),(25029,'2019-02-07',180,0,0,0),(25030,'2019-02-07',181,0,0,0),(25031,'2019-02-07',182,0,0,0),(25032,'2019-02-07',183,0,0,0),(25033,'2019-02-07',184,0,0,0),(25034,'2019-02-07',185,0,0,0),(25035,'2019-02-07',186,0,0,0),(25036,'2019-02-07',187,0,0,0),(25037,'2019-02-07',188,0,0,0),(25038,'2019-02-07',189,0,0,0),(25039,'2019-02-07',190,0,0,0),(25040,'2019-02-07',191,0,0,0),(25041,'2019-02-07',192,0,0,0),(25042,'2019-02-07',193,0,0,0),(25043,'2019-02-07',194,0,0,0),(25044,'2019-02-07',195,0,0,0),(25045,'2019-02-07',196,0,0,0),(25046,'2019-02-07',197,0,0,0),(25047,'2019-02-07',198,0,0,0),(25048,'2019-02-07',199,0,0,0),(25049,'2019-02-07',200,0,0,0),(25050,'2019-02-07',201,0,0,0),(25051,'2019-02-07',202,0,0,0),(25052,'2019-02-07',203,0,0,0),(25053,'2019-02-07',204,0,0,0),(25054,'2019-02-08',1,0,0,0),(25055,'2019-02-08',2,0,0,0),(25056,'2019-02-08',9,0,0,0),(25057,'2019-02-08',11,0,0,0),(25058,'2019-02-08',12,0,0,0),(25059,'2019-02-08',13,0,0,0),(25060,'2019-02-08',14,0,0,0),(25061,'2019-02-08',15,0,0,0),(25062,'2019-02-08',16,0,0,0),(25063,'2019-02-08',17,0,0,0),(25064,'2019-02-08',18,0,0,0),(25065,'2019-02-08',19,0,0,0),(25066,'2019-02-08',20,0,0,0),(25067,'2019-02-08',21,0,0,0),(25068,'2019-02-08',22,0,0,0),(25069,'2019-02-08',23,0,0,0),(25070,'2019-02-08',24,0,0,0),(25071,'2019-02-08',25,0,0,0),(25072,'2019-02-08',26,0,0,0),(25073,'2019-02-08',27,0,0,0),(25074,'2019-02-08',28,0,0,0),(25075,'2019-02-08',29,0,0,0),(25076,'2019-02-08',30,0,0,0),(25077,'2019-02-08',31,0,0,0),(25078,'2019-02-08',32,0,0,0),(25079,'2019-02-08',33,0,0,0),(25080,'2019-02-08',34,0,0,0),(25081,'2019-02-08',35,0,0,0),(25082,'2019-02-08',36,0,0,0),(25083,'2019-02-08',37,0,0,0),(25084,'2019-02-08',38,0,0,0),(25085,'2019-02-08',39,0,0,0),(25086,'2019-02-08',40,0,0,0),(25087,'2019-02-08',41,0,0,0),(25088,'2019-02-08',42,0,0,0),(25089,'2019-02-08',43,0,0,0),(25090,'2019-02-08',44,0,0,0),(25091,'2019-02-08',45,0,0,0),(25092,'2019-02-08',46,0,0,0),(25093,'2019-02-08',47,0,0,0),(25094,'2019-02-08',48,0,0,0),(25095,'2019-02-08',49,0,0,0),(25096,'2019-02-08',50,0,0,0),(25097,'2019-02-08',51,0,0,0),(25098,'2019-02-08',52,0,0,0),(25099,'2019-02-08',53,0,0,0),(25100,'2019-02-08',54,0,0,0),(25101,'2019-02-08',55,0,0,0),(25102,'2019-02-08',56,0,0,0),(25103,'2019-02-08',57,0,0,0),(25104,'2019-02-08',58,0,0,0),(25105,'2019-02-08',59,0,0,0),(25106,'2019-02-08',60,0,0,0),(25107,'2019-02-08',61,0,0,0),(25108,'2019-02-08',62,0,0,0),(25109,'2019-02-08',63,0,0,0),(25110,'2019-02-08',64,0,0,0),(25111,'2019-02-08',65,0,0,0),(25112,'2019-02-08',66,0,0,0),(25113,'2019-02-08',67,0,0,0),(25114,'2019-02-08',68,0,0,0),(25115,'2019-02-08',69,0,0,0),(25116,'2019-02-08',70,0,0,0),(25117,'2019-02-08',71,0,0,0),(25118,'2019-02-08',72,0,0,0),(25119,'2019-02-08',73,0,0,0),(25120,'2019-02-08',74,0,0,0),(25121,'2019-02-08',75,0,0,0),(25122,'2019-02-08',76,0,0,0),(25123,'2019-02-08',77,0,0,0),(25124,'2019-02-08',78,0,0,0),(25125,'2019-02-08',79,0,0,0),(25126,'2019-02-08',80,0,0,0),(25127,'2019-02-08',81,0,0,0),(25128,'2019-02-08',82,0,0,0),(25129,'2019-02-08',83,0,0,0),(25130,'2019-02-08',84,0,0,0),(25131,'2019-02-08',85,0,0,0),(25132,'2019-02-08',86,0,0,0),(25133,'2019-02-08',87,0,0,0),(25134,'2019-02-08',88,0,0,0),(25135,'2019-02-08',89,0,0,0),(25136,'2019-02-08',90,0,0,0),(25137,'2019-02-08',91,0,0,0),(25138,'2019-02-08',92,0,0,0),(25139,'2019-02-08',93,0,0,0),(25140,'2019-02-08',94,0,0,0),(25141,'2019-02-08',95,0,0,0),(25142,'2019-02-08',96,0,0,0),(25143,'2019-02-08',97,0,0,0),(25144,'2019-02-08',98,0,0,0),(25145,'2019-02-08',99,0,0,0),(25146,'2019-02-08',100,0,0,0),(25147,'2019-02-08',101,0,0,0),(25148,'2019-02-08',102,0,0,0),(25149,'2019-02-08',103,0,0,0),(25150,'2019-02-08',104,0,0,0),(25151,'2019-02-08',105,0,0,0),(25152,'2019-02-08',106,0,0,0),(25153,'2019-02-08',107,0,0,0),(25154,'2019-02-08',108,0,0,0),(25155,'2019-02-08',109,0,0,0),(25156,'2019-02-08',110,0,0,0),(25157,'2019-02-08',111,0,0,0),(25158,'2019-02-08',112,0,0,0),(25159,'2019-02-08',113,0,0,0),(25160,'2019-02-08',114,0,0,0),(25161,'2019-02-08',115,0,0,0),(25162,'2019-02-08',116,0,0,0),(25163,'2019-02-08',117,0,0,0),(25164,'2019-02-08',118,0,0,0),(25165,'2019-02-08',119,0,0,0),(25166,'2019-02-08',120,0,0,0),(25167,'2019-02-08',121,0,0,0),(25168,'2019-02-08',122,0,0,0),(25169,'2019-02-08',123,0,0,0),(25170,'2019-02-08',124,0,0,0),(25171,'2019-02-08',125,0,0,0),(25172,'2019-02-08',126,0,0,0),(25173,'2019-02-08',127,0,0,0),(25174,'2019-02-08',128,0,0,0),(25175,'2019-02-08',129,0,0,0),(25176,'2019-02-08',130,0,0,0),(25177,'2019-02-08',131,0,0,0),(25178,'2019-02-08',132,0,0,0),(25179,'2019-02-08',133,0,0,0),(25180,'2019-02-08',134,0,0,0),(25181,'2019-02-08',135,0,0,0),(25182,'2019-02-08',136,0,0,0),(25183,'2019-02-08',137,0,0,0),(25184,'2019-02-08',138,0,0,0),(25185,'2019-02-08',139,0,0,0),(25186,'2019-02-08',140,0,0,0),(25187,'2019-02-08',141,0,0,0),(25188,'2019-02-08',142,0,0,0),(25189,'2019-02-08',143,0,0,0),(25190,'2019-02-08',144,0,0,0),(25191,'2019-02-08',145,0,0,0),(25192,'2019-02-08',146,0,0,0),(25193,'2019-02-08',147,0,0,0),(25194,'2019-02-08',148,0,0,0),(25195,'2019-02-08',149,0,0,0),(25196,'2019-02-08',150,0,0,0),(25197,'2019-02-08',151,0,0,0),(25198,'2019-02-08',152,0,0,0),(25199,'2019-02-08',153,0,0,0),(25200,'2019-02-08',154,0,0,0),(25201,'2019-02-08',155,0,0,0),(25202,'2019-02-08',156,0,0,0),(25203,'2019-02-08',157,0,0,0),(25204,'2019-02-08',158,0,0,0),(25205,'2019-02-08',159,0,0,0),(25206,'2019-02-08',160,0,0,0),(25207,'2019-02-08',161,0,0,0),(25208,'2019-02-08',162,0,0,0),(25209,'2019-02-08',163,0,0,0),(25210,'2019-02-08',164,0,0,0),(25211,'2019-02-08',165,0,0,0),(25212,'2019-02-08',166,0,0,0),(25213,'2019-02-08',167,0,0,0),(25214,'2019-02-08',168,0,0,0),(25215,'2019-02-08',169,0,0,0),(25216,'2019-02-08',170,0,0,0),(25217,'2019-02-08',171,0,0,0),(25218,'2019-02-08',172,0,0,0),(25219,'2019-02-08',173,0,0,0),(25220,'2019-02-08',174,0,0,0),(25221,'2019-02-08',175,0,0,0),(25222,'2019-02-08',176,0,0,0),(25223,'2019-02-08',177,0,0,0),(25224,'2019-02-08',178,0,0,0),(25225,'2019-02-08',179,0,0,0),(25226,'2019-02-08',180,0,0,0),(25227,'2019-02-08',181,0,0,0),(25228,'2019-02-08',182,0,0,0),(25229,'2019-02-08',183,0,0,0),(25230,'2019-02-08',184,0,0,0),(25231,'2019-02-08',185,0,0,0),(25232,'2019-02-08',186,0,0,0),(25233,'2019-02-08',187,0,0,0),(25234,'2019-02-08',188,0,0,0),(25235,'2019-02-08',189,0,0,0),(25236,'2019-02-08',190,0,0,0),(25237,'2019-02-08',191,0,0,0),(25238,'2019-02-08',192,0,0,0),(25239,'2019-02-08',193,0,0,0),(25240,'2019-02-08',194,0,0,0),(25241,'2019-02-08',195,0,0,0),(25242,'2019-02-08',196,0,0,0),(25243,'2019-02-08',197,0,0,0),(25244,'2019-02-08',198,0,0,0),(25245,'2019-02-08',199,0,0,0),(25246,'2019-02-08',200,0,0,0),(25247,'2019-02-08',201,0,0,0),(25248,'2019-02-08',202,0,0,0),(25249,'2019-02-08',203,0,0,0),(25250,'2019-02-08',204,0,0,0),(25309,'2019-02-09',1,0,0,0),(25310,'2019-02-09',2,0,0,0),(25311,'2019-02-09',9,0,0,0),(25312,'2019-02-09',11,0,0,0),(25313,'2019-02-09',12,0,0,0),(25314,'2019-02-09',13,0,0,0),(25315,'2019-02-09',14,0,0,0),(25316,'2019-02-09',15,0,0,0),(25317,'2019-02-09',16,0,0,0),(25318,'2019-02-09',17,0,0,0),(25319,'2019-02-09',18,0,0,0),(25320,'2019-02-09',19,0,0,0),(25321,'2019-02-09',20,0,0,0),(25322,'2019-02-09',21,0,0,0),(25323,'2019-02-09',22,0,0,0),(25324,'2019-02-09',23,0,0,0),(25325,'2019-02-09',24,0,0,0),(25326,'2019-02-09',25,0,0,0),(25327,'2019-02-09',26,0,0,0),(25328,'2019-02-09',27,0,0,0),(25329,'2019-02-09',28,0,0,0),(25330,'2019-02-09',29,0,0,0),(25331,'2019-02-09',30,0,0,0),(25332,'2019-02-09',31,0,0,0),(25333,'2019-02-09',32,0,0,0),(25334,'2019-02-09',33,0,0,0),(25335,'2019-02-09',34,0,0,0),(25336,'2019-02-09',35,0,0,0),(25337,'2019-02-09',36,0,0,0),(25338,'2019-02-09',37,0,0,0),(25339,'2019-02-09',38,0,0,0),(25340,'2019-02-09',39,0,0,0),(25341,'2019-02-09',40,0,0,0),(25342,'2019-02-09',41,0,0,0),(25343,'2019-02-09',42,0,0,0),(25344,'2019-02-09',43,0,0,0),(25345,'2019-02-09',44,0,0,0),(25346,'2019-02-09',45,0,0,0),(25347,'2019-02-09',46,0,0,0),(25348,'2019-02-09',47,0,0,0),(25349,'2019-02-09',48,0,0,0),(25350,'2019-02-09',49,0,0,0),(25351,'2019-02-09',50,0,0,0),(25352,'2019-02-09',51,0,0,0),(25353,'2019-02-09',52,0,0,0),(25354,'2019-02-09',53,0,0,0),(25355,'2019-02-09',54,0,0,0),(25356,'2019-02-09',55,0,0,0),(25357,'2019-02-09',56,0,0,0),(25358,'2019-02-09',57,0,0,0),(25359,'2019-02-09',58,0,0,0),(25360,'2019-02-09',59,0,0,0),(25361,'2019-02-09',60,0,0,0),(25362,'2019-02-09',61,0,0,0),(25363,'2019-02-09',62,0,0,0),(25364,'2019-02-09',63,0,0,0),(25365,'2019-02-09',64,0,0,0),(25366,'2019-02-09',65,0,0,0),(25367,'2019-02-09',66,0,0,0),(25368,'2019-02-09',67,0,0,0),(25369,'2019-02-09',68,0,0,0),(25370,'2019-02-09',69,0,0,0),(25371,'2019-02-09',70,0,0,0),(25372,'2019-02-09',71,0,0,0),(25373,'2019-02-09',72,0,0,0),(25374,'2019-02-09',73,0,0,0),(25375,'2019-02-09',74,0,0,0),(25376,'2019-02-09',75,0,0,0),(25377,'2019-02-09',76,0,0,0),(25378,'2019-02-09',77,0,0,0),(25379,'2019-02-09',78,0,0,0),(25380,'2019-02-09',79,0,0,0),(25381,'2019-02-09',80,0,0,0),(25382,'2019-02-09',81,0,0,0),(25383,'2019-02-09',82,0,0,0),(25384,'2019-02-09',83,0,0,0),(25385,'2019-02-09',84,0,0,0),(25386,'2019-02-09',85,0,0,0),(25387,'2019-02-09',86,0,0,0),(25388,'2019-02-09',87,0,0,0),(25389,'2019-02-09',88,0,0,0),(25390,'2019-02-09',89,0,0,0),(25391,'2019-02-09',90,0,0,0),(25392,'2019-02-09',91,0,0,0),(25393,'2019-02-09',92,0,0,0),(25394,'2019-02-09',93,0,0,0),(25395,'2019-02-09',94,0,0,0),(25396,'2019-02-09',95,0,0,0),(25397,'2019-02-09',96,0,0,0),(25398,'2019-02-09',97,0,0,0),(25399,'2019-02-09',98,0,0,0),(25400,'2019-02-09',99,0,0,0),(25401,'2019-02-09',100,0,0,0),(25402,'2019-02-09',101,0,0,0),(25403,'2019-02-09',102,0,0,0),(25404,'2019-02-09',103,0,0,0),(25405,'2019-02-09',104,0,0,0),(25406,'2019-02-09',105,0,0,0),(25407,'2019-02-09',106,0,0,0),(25408,'2019-02-09',107,0,0,0),(25409,'2019-02-09',108,0,0,0),(25410,'2019-02-09',109,0,0,0),(25411,'2019-02-09',110,0,0,0),(25412,'2019-02-09',111,0,0,0),(25413,'2019-02-09',112,0,0,0),(25414,'2019-02-09',113,0,0,0),(25415,'2019-02-09',114,0,0,0),(25416,'2019-02-09',115,0,0,0),(25417,'2019-02-09',116,0,0,0),(25418,'2019-02-09',117,0,0,0),(25419,'2019-02-09',118,0,0,0),(25420,'2019-02-09',119,0,0,0),(25421,'2019-02-09',120,0,0,0),(25422,'2019-02-09',121,0,0,0),(25423,'2019-02-09',122,0,0,0),(25424,'2019-02-09',123,0,0,0),(25425,'2019-02-09',124,0,0,0),(25426,'2019-02-09',125,0,0,0),(25427,'2019-02-09',126,0,0,0),(25428,'2019-02-09',127,0,0,0),(25429,'2019-02-09',128,0,0,0),(25430,'2019-02-09',129,0,0,0),(25431,'2019-02-09',130,0,0,0),(25432,'2019-02-09',131,0,0,0),(25433,'2019-02-09',132,0,0,0),(25434,'2019-02-09',133,0,0,0),(25435,'2019-02-09',134,0,0,0),(25436,'2019-02-09',135,0,0,0),(25437,'2019-02-09',136,0,0,0),(25438,'2019-02-09',137,0,0,0),(25439,'2019-02-09',138,0,0,0),(25440,'2019-02-09',139,0,0,0),(25441,'2019-02-09',140,0,0,0),(25442,'2019-02-09',141,0,0,0),(25443,'2019-02-09',142,0,0,0),(25444,'2019-02-09',143,0,0,0),(25445,'2019-02-09',144,0,0,0),(25446,'2019-02-09',145,0,0,0),(25447,'2019-02-09',146,0,0,0),(25448,'2019-02-09',147,0,0,0),(25449,'2019-02-09',148,0,0,0),(25450,'2019-02-09',149,0,0,0),(25451,'2019-02-09',150,0,0,0),(25452,'2019-02-09',151,0,0,0),(25453,'2019-02-09',152,0,0,0),(25454,'2019-02-09',153,0,0,0),(25455,'2019-02-09',154,0,0,0),(25456,'2019-02-09',155,0,0,0),(25457,'2019-02-09',156,0,0,0),(25458,'2019-02-09',157,0,0,0),(25459,'2019-02-09',158,0,0,0),(25460,'2019-02-09',159,0,0,0),(25461,'2019-02-09',160,0,0,0),(25462,'2019-02-09',161,0,0,0),(25463,'2019-02-09',162,0,0,0),(25464,'2019-02-09',163,0,0,0),(25465,'2019-02-09',164,0,0,0),(25466,'2019-02-09',165,0,0,0),(25467,'2019-02-09',166,0,0,0),(25468,'2019-02-09',167,0,0,0),(25469,'2019-02-09',168,0,0,0),(25470,'2019-02-09',169,0,0,0),(25471,'2019-02-09',170,0,0,0),(25472,'2019-02-09',171,0,0,0),(25473,'2019-02-09',172,0,0,0),(25474,'2019-02-09',173,0,0,0),(25475,'2019-02-09',174,0,0,0),(25476,'2019-02-09',175,0,0,0),(25477,'2019-02-09',176,0,0,0),(25478,'2019-02-09',177,0,0,0),(25479,'2019-02-09',178,0,0,0),(25480,'2019-02-09',179,0,0,0),(25481,'2019-02-09',180,0,0,0),(25482,'2019-02-09',181,0,0,0),(25483,'2019-02-09',182,0,0,0),(25484,'2019-02-09',183,0,0,0),(25485,'2019-02-09',184,0,0,0),(25486,'2019-02-09',185,0,0,0),(25487,'2019-02-09',186,0,0,0),(25488,'2019-02-09',187,0,0,0),(25489,'2019-02-09',188,0,0,0),(25490,'2019-02-09',189,0,0,0),(25491,'2019-02-09',190,0,0,0),(25492,'2019-02-09',191,0,0,0),(25493,'2019-02-09',192,0,0,0),(25494,'2019-02-09',193,0,0,0),(25495,'2019-02-09',194,0,0,0),(25496,'2019-02-09',195,0,0,0),(25497,'2019-02-09',196,0,0,0),(25498,'2019-02-09',197,0,0,0),(25499,'2019-02-09',198,0,0,0),(25500,'2019-02-09',199,0,0,0),(25501,'2019-02-09',200,0,0,0),(25502,'2019-02-09',201,0,0,0),(25503,'2019-02-09',202,0,0,0),(25504,'2019-02-09',203,0,0,0),(25505,'2019-02-09',204,0,0,0),(25564,'2019-02-10',1,0,0,0),(25565,'2019-02-10',2,0,0,0),(25566,'2019-02-10',9,0,0,0),(25567,'2019-02-10',11,0,0,0),(25568,'2019-02-10',12,0,0,0),(25569,'2019-02-10',13,0,0,0),(25570,'2019-02-10',14,0,0,0),(25571,'2019-02-10',15,0,0,0),(25572,'2019-02-10',16,0,0,0),(25573,'2019-02-10',17,0,0,0),(25574,'2019-02-10',18,0,0,0),(25575,'2019-02-10',19,0,0,0),(25576,'2019-02-10',20,0,0,0),(25577,'2019-02-10',21,0,0,0),(25578,'2019-02-10',22,0,0,0),(25579,'2019-02-10',23,0,0,0),(25580,'2019-02-10',24,0,0,0),(25581,'2019-02-10',25,0,0,0),(25582,'2019-02-10',26,0,0,0),(25583,'2019-02-10',27,0,0,0),(25584,'2019-02-10',28,0,0,0),(25585,'2019-02-10',29,0,0,0),(25586,'2019-02-10',30,0,0,0),(25587,'2019-02-10',31,0,0,0),(25588,'2019-02-10',32,0,0,0),(25589,'2019-02-10',33,0,0,0),(25590,'2019-02-10',34,0,0,0),(25591,'2019-02-10',35,0,0,0),(25592,'2019-02-10',36,0,0,0),(25593,'2019-02-10',37,0,0,0),(25594,'2019-02-10',38,0,0,0),(25595,'2019-02-10',39,0,0,0),(25596,'2019-02-10',40,0,0,0),(25597,'2019-02-10',41,0,0,0),(25598,'2019-02-10',42,0,0,0),(25599,'2019-02-10',43,0,0,0),(25600,'2019-02-10',44,0,0,0),(25601,'2019-02-10',45,0,0,0),(25602,'2019-02-10',46,0,0,0),(25603,'2019-02-10',47,0,0,0),(25604,'2019-02-10',48,0,0,0),(25605,'2019-02-10',49,0,0,0),(25606,'2019-02-10',50,0,0,0),(25607,'2019-02-10',51,0,0,0),(25608,'2019-02-10',52,0,0,0),(25609,'2019-02-10',53,0,0,0),(25610,'2019-02-10',54,0,0,0),(25611,'2019-02-10',55,0,0,0),(25612,'2019-02-10',56,0,0,0),(25613,'2019-02-10',57,0,0,0),(25614,'2019-02-10',58,0,0,0),(25615,'2019-02-10',59,0,0,0),(25616,'2019-02-10',60,0,0,0),(25617,'2019-02-10',61,0,0,0),(25618,'2019-02-10',62,0,0,0),(25619,'2019-02-10',63,0,0,0),(25620,'2019-02-10',64,0,0,0),(25621,'2019-02-10',65,0,0,0),(25622,'2019-02-10',66,0,0,0),(25623,'2019-02-10',67,0,0,0),(25624,'2019-02-10',68,0,0,0),(25625,'2019-02-10',69,0,0,0),(25626,'2019-02-10',70,0,0,0),(25627,'2019-02-10',71,0,0,0),(25628,'2019-02-10',72,0,0,0),(25629,'2019-02-10',73,0,0,0),(25630,'2019-02-10',74,0,0,0),(25631,'2019-02-10',75,0,0,0),(25632,'2019-02-10',76,0,0,0),(25633,'2019-02-10',77,0,0,0),(25634,'2019-02-10',78,0,0,0),(25635,'2019-02-10',79,0,0,0),(25636,'2019-02-10',80,0,0,0),(25637,'2019-02-10',81,0,0,0),(25638,'2019-02-10',82,0,0,0),(25639,'2019-02-10',83,0,0,0),(25640,'2019-02-10',84,0,0,0),(25641,'2019-02-10',85,0,0,0),(25642,'2019-02-10',86,0,0,0),(25643,'2019-02-10',87,0,0,0),(25644,'2019-02-10',88,0,0,0),(25645,'2019-02-10',89,0,0,0),(25646,'2019-02-10',90,0,0,0),(25647,'2019-02-10',91,0,0,0),(25648,'2019-02-10',92,0,0,0),(25649,'2019-02-10',93,0,0,0),(25650,'2019-02-10',94,0,0,0),(25651,'2019-02-10',95,0,0,0),(25652,'2019-02-10',96,0,0,0),(25653,'2019-02-10',97,0,0,0),(25654,'2019-02-10',98,0,0,0),(25655,'2019-02-10',99,0,0,0),(25656,'2019-02-10',100,0,0,0),(25657,'2019-02-10',101,0,0,0),(25658,'2019-02-10',102,0,0,0),(25659,'2019-02-10',103,0,0,0),(25660,'2019-02-10',104,0,0,0),(25661,'2019-02-10',105,0,0,0),(25662,'2019-02-10',106,0,0,0),(25663,'2019-02-10',107,0,0,0),(25664,'2019-02-10',108,0,0,0),(25665,'2019-02-10',109,0,0,0),(25666,'2019-02-10',110,0,0,0),(25667,'2019-02-10',111,0,0,0),(25668,'2019-02-10',112,0,0,0),(25669,'2019-02-10',113,0,0,0),(25670,'2019-02-10',114,0,0,0),(25671,'2019-02-10',115,0,0,0),(25672,'2019-02-10',116,0,0,0),(25673,'2019-02-10',117,0,0,0),(25674,'2019-02-10',118,0,0,0),(25675,'2019-02-10',119,0,0,0),(25676,'2019-02-10',120,0,0,0),(25677,'2019-02-10',121,0,0,0),(25678,'2019-02-10',122,0,0,0),(25679,'2019-02-10',123,0,0,0),(25680,'2019-02-10',124,0,0,0),(25681,'2019-02-10',125,0,0,0),(25682,'2019-02-10',126,0,0,0),(25683,'2019-02-10',127,0,0,0),(25684,'2019-02-10',128,0,0,0),(25685,'2019-02-10',129,0,0,0),(25686,'2019-02-10',130,0,0,0),(25687,'2019-02-10',131,0,0,0),(25688,'2019-02-10',132,0,0,0),(25689,'2019-02-10',133,0,0,0),(25690,'2019-02-10',134,0,0,0),(25691,'2019-02-10',135,0,0,0),(25692,'2019-02-10',136,0,0,0),(25693,'2019-02-10',137,0,0,0),(25694,'2019-02-10',138,0,0,0),(25695,'2019-02-10',139,0,0,0),(25696,'2019-02-10',140,0,0,0),(25697,'2019-02-10',141,0,0,0),(25698,'2019-02-10',142,0,0,0),(25699,'2019-02-10',143,0,0,0),(25700,'2019-02-10',144,0,0,0),(25701,'2019-02-10',145,0,0,0),(25702,'2019-02-10',146,0,0,0),(25703,'2019-02-10',147,0,0,0),(25704,'2019-02-10',148,0,0,0),(25705,'2019-02-10',149,0,0,0),(25706,'2019-02-10',150,0,0,0),(25707,'2019-02-10',151,0,0,0),(25708,'2019-02-10',152,0,0,0),(25709,'2019-02-10',153,0,0,0),(25710,'2019-02-10',154,0,0,0),(25711,'2019-02-10',155,0,0,0),(25712,'2019-02-10',156,0,0,0),(25713,'2019-02-10',157,0,0,0),(25714,'2019-02-10',158,0,0,0),(25715,'2019-02-10',159,0,0,0),(25716,'2019-02-10',160,0,0,0),(25717,'2019-02-10',161,0,0,0),(25718,'2019-02-10',162,0,0,0),(25719,'2019-02-10',163,0,0,0),(25720,'2019-02-10',164,0,0,0),(25721,'2019-02-10',165,0,0,0),(25722,'2019-02-10',166,0,0,0),(25723,'2019-02-10',167,0,0,0),(25724,'2019-02-10',168,0,0,0),(25725,'2019-02-10',169,0,0,0),(25726,'2019-02-10',170,0,0,0),(25727,'2019-02-10',171,0,0,0),(25728,'2019-02-10',172,0,0,0),(25729,'2019-02-10',173,0,0,0),(25730,'2019-02-10',174,0,0,0),(25731,'2019-02-10',175,0,0,0),(25732,'2019-02-10',176,0,0,0),(25733,'2019-02-10',177,0,0,0),(25734,'2019-02-10',178,0,0,0),(25735,'2019-02-10',179,0,0,0),(25736,'2019-02-10',180,0,0,0),(25737,'2019-02-10',181,0,0,0),(25738,'2019-02-10',182,0,0,0),(25739,'2019-02-10',183,0,0,0),(25740,'2019-02-10',184,0,0,0),(25741,'2019-02-10',185,0,0,0),(25742,'2019-02-10',186,0,0,0),(25743,'2019-02-10',187,0,0,0),(25744,'2019-02-10',188,0,0,0),(25745,'2019-02-10',189,0,0,0),(25746,'2019-02-10',190,0,0,0),(25747,'2019-02-10',191,0,0,0),(25748,'2019-02-10',192,0,0,0),(25749,'2019-02-10',193,0,0,0),(25750,'2019-02-10',194,0,0,0),(25751,'2019-02-10',195,0,0,0),(25752,'2019-02-10',196,0,0,0),(25753,'2019-02-10',197,0,0,0),(25754,'2019-02-10',198,0,0,0),(25755,'2019-02-10',199,0,0,0),(25756,'2019-02-10',200,0,0,0),(25757,'2019-02-10',201,0,0,0),(25758,'2019-02-10',202,0,0,0),(25759,'2019-02-10',203,0,0,0),(25760,'2019-02-10',204,0,0,0),(25819,'2019-02-11',1,0,0,0),(25820,'2019-02-11',2,0,0,0),(25821,'2019-02-11',9,0,0,0),(25822,'2019-02-11',11,0,0,0),(25823,'2019-02-11',12,0,0,0),(25824,'2019-02-11',13,0,0,0),(25825,'2019-02-11',14,0,0,0),(25826,'2019-02-11',15,0,0,0),(25827,'2019-02-11',16,0,0,0),(25828,'2019-02-11',17,0,0,0),(25829,'2019-02-11',18,0,0,0),(25830,'2019-02-11',19,0,0,0),(25831,'2019-02-11',20,0,0,0),(25832,'2019-02-11',21,0,0,0),(25833,'2019-02-11',22,0,0,0),(25834,'2019-02-11',23,0,0,0),(25835,'2019-02-11',24,0,0,0),(25836,'2019-02-11',25,0,0,0),(25837,'2019-02-11',26,0,0,0),(25838,'2019-02-11',27,0,0,0),(25839,'2019-02-11',28,0,0,0),(25840,'2019-02-11',29,0,0,0),(25841,'2019-02-11',30,0,0,0),(25842,'2019-02-11',31,0,0,0),(25843,'2019-02-11',32,0,0,0),(25844,'2019-02-11',33,0,0,0),(25845,'2019-02-11',34,0,0,0),(25846,'2019-02-11',35,0,0,0),(25847,'2019-02-11',36,0,0,0),(25848,'2019-02-11',37,0,0,0),(25849,'2019-02-11',38,0,0,0),(25850,'2019-02-11',39,0,0,0),(25851,'2019-02-11',40,0,0,0),(25852,'2019-02-11',41,0,0,0),(25853,'2019-02-11',42,0,0,0),(25854,'2019-02-11',43,0,0,0),(25855,'2019-02-11',44,0,0,0),(25856,'2019-02-11',45,0,0,0),(25857,'2019-02-11',46,0,0,0),(25858,'2019-02-11',47,0,0,0),(25859,'2019-02-11',48,0,0,0),(25860,'2019-02-11',49,0,0,0),(25861,'2019-02-11',50,0,0,0),(25862,'2019-02-11',51,0,0,0),(25863,'2019-02-11',52,0,0,0),(25864,'2019-02-11',53,0,0,0),(25865,'2019-02-11',54,0,0,0),(25866,'2019-02-11',55,0,0,0),(25867,'2019-02-11',56,0,0,0),(25868,'2019-02-11',57,0,0,0),(25869,'2019-02-11',58,0,0,0),(25870,'2019-02-11',59,0,0,0),(25871,'2019-02-11',60,0,0,0),(25872,'2019-02-11',61,0,0,0),(25873,'2019-02-11',62,0,0,0),(25874,'2019-02-11',63,0,0,0),(25875,'2019-02-11',64,0,0,0),(25876,'2019-02-11',65,0,0,0),(25877,'2019-02-11',66,0,0,0),(25878,'2019-02-11',67,0,0,0),(25879,'2019-02-11',68,0,0,0),(25880,'2019-02-11',69,0,0,0),(25881,'2019-02-11',70,0,0,0),(25882,'2019-02-11',71,0,0,0),(25883,'2019-02-11',72,0,0,0),(25884,'2019-02-11',73,0,0,0),(25885,'2019-02-11',74,0,0,0),(25886,'2019-02-11',75,0,0,0),(25887,'2019-02-11',76,0,0,0),(25888,'2019-02-11',77,0,0,0),(25889,'2019-02-11',78,0,0,0),(25890,'2019-02-11',79,0,0,0),(25891,'2019-02-11',80,0,0,0),(25892,'2019-02-11',81,0,0,0),(25893,'2019-02-11',82,0,0,0),(25894,'2019-02-11',83,0,0,0),(25895,'2019-02-11',84,0,0,0),(25896,'2019-02-11',85,0,0,0),(25897,'2019-02-11',86,0,0,0),(25898,'2019-02-11',87,0,0,0),(25899,'2019-02-11',88,0,0,0),(25900,'2019-02-11',89,0,0,0),(25901,'2019-02-11',90,0,0,0),(25902,'2019-02-11',91,0,0,0),(25903,'2019-02-11',92,0,0,0),(25904,'2019-02-11',93,0,0,0),(25905,'2019-02-11',94,0,0,0),(25906,'2019-02-11',95,0,0,0),(25907,'2019-02-11',96,0,0,0),(25908,'2019-02-11',97,0,0,0),(25909,'2019-02-11',98,0,0,0),(25910,'2019-02-11',99,0,0,0),(25911,'2019-02-11',100,0,0,0),(25912,'2019-02-11',101,0,0,0),(25913,'2019-02-11',102,0,0,0),(25914,'2019-02-11',103,0,0,0),(25915,'2019-02-11',104,0,0,0),(25916,'2019-02-11',105,0,0,0),(25917,'2019-02-11',106,0,0,0),(25918,'2019-02-11',107,0,0,0),(25919,'2019-02-11',108,0,0,0),(25920,'2019-02-11',109,0,0,0),(25921,'2019-02-11',110,0,0,0),(25922,'2019-02-11',111,0,0,0),(25923,'2019-02-11',112,0,0,0),(25924,'2019-02-11',113,0,0,0),(25925,'2019-02-11',114,0,0,0),(25926,'2019-02-11',115,0,0,0),(25927,'2019-02-11',116,0,0,0),(25928,'2019-02-11',117,0,0,0),(25929,'2019-02-11',118,0,0,0),(25930,'2019-02-11',119,0,0,0),(25931,'2019-02-11',120,0,0,0),(25932,'2019-02-11',121,0,0,0),(25933,'2019-02-11',122,0,0,0),(25934,'2019-02-11',123,0,0,0),(25935,'2019-02-11',124,0,0,0),(25936,'2019-02-11',125,0,0,0),(25937,'2019-02-11',126,0,0,0),(25938,'2019-02-11',127,0,0,0),(25939,'2019-02-11',128,0,0,0),(25940,'2019-02-11',129,0,0,0),(25941,'2019-02-11',130,0,0,0),(25942,'2019-02-11',131,0,0,0),(25943,'2019-02-11',132,0,0,0),(25944,'2019-02-11',133,0,0,0),(25945,'2019-02-11',134,0,0,0),(25946,'2019-02-11',135,0,0,0),(25947,'2019-02-11',136,0,0,0),(25948,'2019-02-11',137,0,0,0),(25949,'2019-02-11',138,0,0,0),(25950,'2019-02-11',139,0,0,0),(25951,'2019-02-11',140,0,0,0),(25952,'2019-02-11',141,0,0,0),(25953,'2019-02-11',142,0,0,0),(25954,'2019-02-11',143,0,0,0),(25955,'2019-02-11',144,0,0,0),(25956,'2019-02-11',145,0,0,0),(25957,'2019-02-11',146,0,0,0),(25958,'2019-02-11',147,0,0,0),(25959,'2019-02-11',148,0,0,0),(25960,'2019-02-11',149,0,0,0),(25961,'2019-02-11',150,0,0,0),(25962,'2019-02-11',151,0,0,0),(25963,'2019-02-11',152,0,0,0),(25964,'2019-02-11',153,0,0,0),(25965,'2019-02-11',154,0,0,0),(25966,'2019-02-11',155,0,0,0),(25967,'2019-02-11',156,0,0,0),(25968,'2019-02-11',157,0,0,0),(25969,'2019-02-11',158,0,0,0),(25970,'2019-02-11',159,0,0,0),(25971,'2019-02-11',160,0,0,0),(25972,'2019-02-11',161,0,0,0),(25973,'2019-02-11',162,0,0,0),(25974,'2019-02-11',163,0,0,0),(25975,'2019-02-11',164,0,0,0),(25976,'2019-02-11',165,0,0,0),(25977,'2019-02-11',166,0,0,0),(25978,'2019-02-11',167,0,0,0),(25979,'2019-02-11',168,0,0,0),(25980,'2019-02-11',169,0,0,0),(25981,'2019-02-11',170,0,0,0),(25982,'2019-02-11',171,0,0,0),(25983,'2019-02-11',172,0,0,0),(25984,'2019-02-11',173,0,0,0),(25985,'2019-02-11',174,0,0,0),(25986,'2019-02-11',175,0,0,0),(25987,'2019-02-11',176,0,0,0),(25988,'2019-02-11',177,0,0,0),(25989,'2019-02-11',178,0,0,0),(25990,'2019-02-11',179,0,0,0),(25991,'2019-02-11',180,0,0,0),(25992,'2019-02-11',181,0,0,0),(25993,'2019-02-11',182,0,0,0),(25994,'2019-02-11',183,0,0,0),(25995,'2019-02-11',184,0,0,0),(25996,'2019-02-11',185,0,0,0),(25997,'2019-02-11',186,0,0,0),(25998,'2019-02-11',187,0,0,0),(25999,'2019-02-11',188,0,0,0),(26000,'2019-02-11',189,0,0,0),(26001,'2019-02-11',190,0,0,0),(26002,'2019-02-11',191,0,0,0),(26003,'2019-02-11',192,0,0,0),(26004,'2019-02-11',193,0,0,0),(26005,'2019-02-11',194,0,0,0),(26006,'2019-02-11',195,0,0,0),(26007,'2019-02-11',196,0,0,0),(26008,'2019-02-11',197,0,0,0),(26009,'2019-02-11',198,0,0,0),(26010,'2019-02-11',199,0,0,0),(26011,'2019-02-11',200,0,0,0),(26012,'2019-02-11',201,0,0,0),(26013,'2019-02-11',202,0,0,0),(26014,'2019-02-11',203,0,0,0),(26015,'2019-02-11',204,0,0,0),(26074,'2019-02-12',1,0,0,0),(26075,'2019-02-12',2,0,0,0),(26076,'2019-02-12',9,0,0,0),(26077,'2019-02-12',11,0,0,0),(26078,'2019-02-12',12,0,0,0),(26079,'2019-02-12',13,0,0,0),(26080,'2019-02-12',14,0,0,0),(26081,'2019-02-12',15,0,0,0),(26082,'2019-02-12',16,0,0,0),(26083,'2019-02-12',17,0,0,0),(26084,'2019-02-12',18,0,0,0),(26085,'2019-02-12',19,0,0,0),(26086,'2019-02-12',20,0,0,0),(26087,'2019-02-12',21,0,0,0),(26088,'2019-02-12',22,0,0,0),(26089,'2019-02-12',23,0,0,0),(26090,'2019-02-12',24,0,0,0),(26091,'2019-02-12',25,0,0,0),(26092,'2019-02-12',26,0,0,0),(26093,'2019-02-12',27,0,0,0),(26094,'2019-02-12',28,0,0,0),(26095,'2019-02-12',29,0,0,0),(26096,'2019-02-12',30,0,0,0),(26097,'2019-02-12',31,0,0,0),(26098,'2019-02-12',32,0,0,0),(26099,'2019-02-12',33,0,0,0),(26100,'2019-02-12',34,0,0,0),(26101,'2019-02-12',35,0,0,0),(26102,'2019-02-12',36,0,0,0),(26103,'2019-02-12',37,0,0,0),(26104,'2019-02-12',38,0,0,0),(26105,'2019-02-12',39,0,0,0),(26106,'2019-02-12',40,0,0,0),(26107,'2019-02-12',41,0,0,0),(26108,'2019-02-12',42,0,0,0),(26109,'2019-02-12',43,0,0,0),(26110,'2019-02-12',44,0,0,0),(26111,'2019-02-12',45,0,0,0),(26112,'2019-02-12',46,0,0,0),(26113,'2019-02-12',47,0,0,0),(26114,'2019-02-12',48,0,0,0),(26115,'2019-02-12',49,0,0,0),(26116,'2019-02-12',50,0,0,0),(26117,'2019-02-12',51,0,0,0),(26118,'2019-02-12',52,0,0,0),(26119,'2019-02-12',53,0,0,0),(26120,'2019-02-12',54,0,0,0),(26121,'2019-02-12',55,0,0,0),(26122,'2019-02-12',56,0,0,0),(26123,'2019-02-12',57,0,0,0),(26124,'2019-02-12',58,0,0,0),(26125,'2019-02-12',59,0,0,0),(26126,'2019-02-12',60,0,0,0),(26127,'2019-02-12',61,0,0,0),(26128,'2019-02-12',62,0,0,0),(26129,'2019-02-12',63,0,0,0),(26130,'2019-02-12',64,0,0,0),(26131,'2019-02-12',65,0,0,0),(26132,'2019-02-12',66,0,0,0),(26133,'2019-02-12',67,0,0,0),(26134,'2019-02-12',68,0,0,0),(26135,'2019-02-12',69,0,0,0),(26136,'2019-02-12',70,0,0,0),(26137,'2019-02-12',71,0,0,0),(26138,'2019-02-12',72,0,0,0),(26139,'2019-02-12',73,0,0,0),(26140,'2019-02-12',74,0,0,0),(26141,'2019-02-12',75,0,0,0),(26142,'2019-02-12',76,0,0,0),(26143,'2019-02-12',77,0,0,0),(26144,'2019-02-12',78,0,0,0),(26145,'2019-02-12',79,0,0,0),(26146,'2019-02-12',80,0,0,0),(26147,'2019-02-12',81,0,0,0),(26148,'2019-02-12',82,0,0,0),(26149,'2019-02-12',83,0,0,0),(26150,'2019-02-12',84,0,0,0),(26151,'2019-02-12',85,0,0,0),(26152,'2019-02-12',86,0,0,0),(26153,'2019-02-12',87,0,0,0),(26154,'2019-02-12',88,0,0,0),(26155,'2019-02-12',89,0,0,0),(26156,'2019-02-12',90,0,0,0),(26157,'2019-02-12',91,0,0,0),(26158,'2019-02-12',92,0,0,0),(26159,'2019-02-12',93,0,0,0),(26160,'2019-02-12',94,0,0,0),(26161,'2019-02-12',95,0,0,0),(26162,'2019-02-12',96,0,0,0),(26163,'2019-02-12',97,0,0,0),(26164,'2019-02-12',98,0,0,0),(26165,'2019-02-12',99,0,0,0),(26166,'2019-02-12',100,0,0,0),(26167,'2019-02-12',101,0,0,0),(26168,'2019-02-12',102,0,0,0),(26169,'2019-02-12',103,0,0,0),(26170,'2019-02-12',104,0,0,0),(26171,'2019-02-12',105,0,0,0),(26172,'2019-02-12',106,0,0,0),(26173,'2019-02-12',107,0,0,0),(26174,'2019-02-12',108,0,0,0),(26175,'2019-02-12',109,0,0,0),(26176,'2019-02-12',110,0,0,0),(26177,'2019-02-12',111,0,0,0),(26178,'2019-02-12',112,0,0,0),(26179,'2019-02-12',113,0,0,0),(26180,'2019-02-12',114,0,0,0),(26181,'2019-02-12',115,0,0,0),(26182,'2019-02-12',116,0,0,0),(26183,'2019-02-12',117,0,0,0),(26184,'2019-02-12',118,0,0,0),(26185,'2019-02-12',119,0,0,0),(26186,'2019-02-12',120,0,0,0),(26187,'2019-02-12',121,0,0,0),(26188,'2019-02-12',122,0,0,0),(26189,'2019-02-12',123,0,0,0),(26190,'2019-02-12',124,0,0,0),(26191,'2019-02-12',125,0,0,0),(26192,'2019-02-12',126,0,0,0),(26193,'2019-02-12',127,0,0,0),(26194,'2019-02-12',128,0,0,0),(26195,'2019-02-12',129,0,0,0),(26196,'2019-02-12',130,0,0,0),(26197,'2019-02-12',131,0,0,0),(26198,'2019-02-12',132,0,0,0),(26199,'2019-02-12',133,0,0,0),(26200,'2019-02-12',134,0,0,0),(26201,'2019-02-12',135,0,0,0),(26202,'2019-02-12',136,0,0,0),(26203,'2019-02-12',137,0,0,0),(26204,'2019-02-12',138,0,0,0),(26205,'2019-02-12',139,0,0,0),(26206,'2019-02-12',140,0,0,0),(26207,'2019-02-12',141,0,0,0),(26208,'2019-02-12',142,0,0,0),(26209,'2019-02-12',143,0,0,0),(26210,'2019-02-12',144,0,0,0),(26211,'2019-02-12',145,0,0,0),(26212,'2019-02-12',146,0,0,0),(26213,'2019-02-12',147,0,0,0),(26214,'2019-02-12',148,0,0,0),(26215,'2019-02-12',149,0,0,0),(26216,'2019-02-12',150,0,0,0),(26217,'2019-02-12',151,0,0,0),(26218,'2019-02-12',152,0,0,0),(26219,'2019-02-12',153,0,0,0),(26220,'2019-02-12',154,0,0,0),(26221,'2019-02-12',155,0,0,0),(26222,'2019-02-12',156,0,0,0),(26223,'2019-02-12',157,0,0,0),(26224,'2019-02-12',158,0,0,0),(26225,'2019-02-12',159,0,0,0),(26226,'2019-02-12',160,0,0,0),(26227,'2019-02-12',161,0,0,0),(26228,'2019-02-12',162,0,0,0),(26229,'2019-02-12',163,0,0,0),(26230,'2019-02-12',164,0,0,0),(26231,'2019-02-12',165,0,0,0),(26232,'2019-02-12',166,0,0,0),(26233,'2019-02-12',167,0,0,0),(26234,'2019-02-12',168,0,0,0),(26235,'2019-02-12',169,0,0,0),(26236,'2019-02-12',170,0,0,0),(26237,'2019-02-12',171,0,0,0),(26238,'2019-02-12',172,0,0,0),(26239,'2019-02-12',173,0,0,0),(26240,'2019-02-12',174,0,0,0),(26241,'2019-02-12',175,0,0,0),(26242,'2019-02-12',176,0,0,0),(26243,'2019-02-12',177,0,0,0),(26244,'2019-02-12',178,0,0,0),(26245,'2019-02-12',179,0,0,0),(26246,'2019-02-12',180,0,0,0),(26247,'2019-02-12',181,0,0,0),(26248,'2019-02-12',182,0,0,0),(26249,'2019-02-12',183,0,0,0),(26250,'2019-02-12',184,0,0,0),(26251,'2019-02-12',185,0,0,0),(26252,'2019-02-12',186,0,0,0),(26253,'2019-02-12',187,0,0,0),(26254,'2019-02-12',188,0,0,0),(26255,'2019-02-12',189,0,0,0),(26256,'2019-02-12',190,0,0,0),(26257,'2019-02-12',191,0,0,0),(26258,'2019-02-12',192,0,0,0),(26259,'2019-02-12',193,0,0,0),(26260,'2019-02-12',194,0,0,0),(26261,'2019-02-12',195,0,0,0),(26262,'2019-02-12',196,0,0,0),(26263,'2019-02-12',197,0,0,0),(26264,'2019-02-12',198,0,0,0),(26265,'2019-02-12',199,0,0,0),(26266,'2019-02-12',200,0,0,0),(26267,'2019-02-12',201,0,0,0),(26268,'2019-02-12',202,0,0,0),(26269,'2019-02-12',203,0,0,0),(26270,'2019-02-12',204,0,0,0);

/*Table structure for table `debug` */

DROP TABLE IF EXISTS `debug`;

CREATE TABLE `debug` (
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `debug` */

insert  into `debug`(`note`) values ('1'),('22'),('12'),('14'),('23'),('14'),('10270'),('2019-01-24'),('1'),('1'),('22'),('12'),('10270');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_advance` */

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
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale` */

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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_detail` */

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
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_in_stock` */

insert  into `good_in_stock`(`id`,`day`,`good_id`,`organization_id`,`store_id`,`in_stock`) values (244,'2019-01-24',1,1,7,0),(245,'2019-01-24',2,1,7,0),(246,'2019-01-24',3,1,7,0),(247,'2019-01-24',1,1,7,0),(248,'2019-01-24',2,1,7,0),(249,'2019-01-24',3,1,7,0),(250,'2019-01-24',1,1,7,0),(251,'2019-01-24',2,1,7,0),(252,'2019-01-24',3,1,7,0),(253,'2019-01-24',1,1,7,0),(254,'2019-01-24',2,1,7,0),(255,'2019-01-24',3,1,7,0),(256,'2019-01-24',1,1,7,0),(257,'2019-01-24',2,1,7,0),(258,'2019-01-24',3,1,7,0),(259,'2019-01-24',1,1,7,0),(260,'2019-01-24',2,1,7,0),(261,'2019-01-24',3,1,7,0),(262,'2019-01-24',1,1,7,0),(263,'2019-01-24',2,1,7,0),(264,'2019-01-24',3,1,7,0),(265,'2019-01-24',1,1,7,0),(266,'2019-01-24',2,1,7,0),(267,'2019-01-24',3,1,7,0),(268,'2019-01-24',1,1,7,0),(269,'2019-01-24',2,1,7,0),(270,'2019-01-24',3,1,7,0),(271,'2019-01-25',1,1,7,0),(272,'2019-01-25',2,1,7,0),(273,'2019-01-25',3,1,7,0),(274,'2019-01-26',1,1,7,0),(275,'2019-01-26',2,1,7,0),(276,'2019-01-26',3,1,7,0),(277,'2019-01-27',1,1,7,0),(278,'2019-01-27',2,1,7,0),(279,'2019-01-27',3,1,7,0),(280,'2019-01-28',1,1,7,0),(281,'2019-01-28',2,1,7,0),(282,'2019-01-28',3,1,7,0),(283,'2019-01-29',1,1,7,0),(284,'2019-01-29',2,1,7,0),(285,'2019-01-29',3,1,7,0),(286,'2019-01-30',1,1,7,0),(287,'2019-01-30',2,1,7,0),(288,'2019-01-30',3,1,7,0),(289,'2019-01-31',1,1,7,0),(290,'2019-01-31',2,1,7,0),(291,'2019-01-31',3,1,7,0),(292,'2019-02-01',1,1,7,0),(293,'2019-02-01',2,1,7,0),(294,'2019-02-01',3,1,7,0),(295,'2019-02-02',1,1,7,0),(296,'2019-02-02',2,1,7,0),(297,'2019-02-02',3,1,7,0),(298,'2019-02-03',1,1,7,0),(299,'2019-02-03',2,1,7,0),(300,'2019-02-03',3,1,7,0),(301,'2019-02-04',1,1,7,0),(302,'2019-02-04',2,1,7,0),(303,'2019-02-04',3,1,7,0),(304,'2019-02-05',1,1,7,0),(305,'2019-02-05',2,1,7,0),(306,'2019-02-05',3,1,7,0),(307,'2019-02-06',1,1,7,0),(308,'2019-02-06',2,1,7,0),(309,'2019-02-06',3,1,7,0),(310,'2019-02-07',1,1,7,0),(311,'2019-02-07',2,1,7,0),(312,'2019-02-07',3,1,7,0),(313,'2019-02-08',1,1,7,0),(314,'2019-02-08',2,1,7,0),(315,'2019-02-08',3,1,7,0),(316,'2019-02-09',1,1,7,0),(317,'2019-02-09',2,1,7,0),(318,'2019-02-09',3,1,7,0),(319,'2019-02-10',1,1,7,0),(320,'2019-02-10',2,1,7,0),(321,'2019-02-10',3,1,7,0),(322,'2019-02-11',1,1,7,0),(323,'2019-02-11',2,1,7,0),(324,'2019-02-11',3,1,7,0),(325,'2019-02-12',1,1,7,0),(326,'2019-02-12',2,1,7,0),(327,'2019-02-12',3,1,7,0);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_import` */

insert  into `lpg_import`(`id`,`code`,`import_date`,`vendor_id`,`kind`,`paper_quantity`,`actual_quantity`,`price`,`vat`,`invoice_amount`,`amount`,`paid`,`debt`,`rate`,`note`,`account_id`,`route_id`,`created_employee_id`) values (34,'20190125-LI-0001','2019-01-24',15,1,10340,10270,10000,10,3389100000,3389100000,0,3389100000,30000,'',7,0,42),(47,'20190126-LI-0001','2019-01-25',23,2,10270,10270,1000,20,36972000,36972000,0,36972000,3000,'',5,9,17);

/*Table structure for table `lpg_in_stock` */

DROP TABLE IF EXISTS `lpg_in_stock`;

CREATE TABLE `lpg_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_in_stock` */

insert  into `lpg_in_stock`(`id`,`organization_id`,`vendor_id`,`day`,`in_stock`) values (10,1,15,'2019-01-24',0),(11,1,16,'2019-01-24',0),(12,1,22,'2019-01-24',0),(13,14,15,'2019-01-24',0),(14,14,23,'2019-01-24',10270),(15,1,23,'2019-01-24',0),(16,1,15,'2019-01-25',0),(17,1,16,'2019-01-25',0),(18,1,22,'2019-01-25',10270),(19,14,15,'2019-01-25',0),(20,14,23,'2019-01-25',0),(21,1,23,'2019-01-25',0),(22,1,15,'2019-01-26',0),(23,1,16,'2019-01-26',0),(24,1,22,'2019-01-26',10270),(25,14,15,'2019-01-26',0),(26,14,23,'2019-01-26',0),(27,1,23,'2019-01-26',0),(28,1,15,'2019-01-27',0),(29,1,16,'2019-01-27',0),(30,1,22,'2019-01-27',10270),(31,14,15,'2019-01-27',0),(32,14,23,'2019-01-27',0),(33,1,23,'2019-01-27',0),(34,1,15,'2019-01-28',0),(35,1,16,'2019-01-28',0),(36,1,22,'2019-01-28',10270),(37,14,15,'2019-01-28',0),(38,14,23,'2019-01-28',0),(39,1,23,'2019-01-28',0),(41,1,15,'2019-01-29',0),(42,1,16,'2019-01-29',0),(43,1,22,'2019-01-29',10270),(44,14,15,'2019-01-29',0),(45,14,23,'2019-01-29',0),(46,1,23,'2019-01-29',0),(48,1,15,'2019-01-30',0),(49,1,16,'2019-01-30',0),(50,1,22,'2019-01-30',10270),(51,14,15,'2019-01-30',0),(52,14,23,'2019-01-30',0),(53,1,23,'2019-01-30',0),(55,1,15,'2019-01-31',0),(56,1,16,'2019-01-31',0),(57,1,22,'2019-01-31',10270),(58,14,15,'2019-01-31',0),(59,14,23,'2019-01-31',0),(60,1,23,'2019-01-31',0),(61,1,15,'2019-02-01',0),(62,1,16,'2019-02-01',0),(63,1,22,'2019-02-01',10270),(64,14,15,'2019-02-01',0),(65,14,23,'2019-02-01',0),(66,1,23,'2019-02-01',0),(67,1,15,'2019-02-02',0),(68,1,16,'2019-02-02',0),(69,1,22,'2019-02-02',10270),(70,14,15,'2019-02-02',0),(71,14,23,'2019-02-02',0),(72,1,23,'2019-02-02',0),(74,1,15,'2019-02-03',0),(75,1,16,'2019-02-03',0),(76,1,22,'2019-02-03',10270),(77,14,15,'2019-02-03',0),(78,14,23,'2019-02-03',0),(79,1,23,'2019-02-03',0),(81,1,15,'2019-02-04',0),(82,1,16,'2019-02-04',0),(83,1,22,'2019-02-04',10270),(84,14,15,'2019-02-04',0),(85,14,23,'2019-02-04',0),(86,1,23,'2019-02-04',0),(87,1,15,'2019-02-05',0),(88,1,16,'2019-02-05',0),(89,1,22,'2019-02-05',10270),(90,14,15,'2019-02-05',0),(91,14,23,'2019-02-05',0),(92,1,23,'2019-02-05',0),(94,1,15,'2019-02-06',0),(95,1,16,'2019-02-06',0),(96,1,22,'2019-02-06',10270),(97,14,15,'2019-02-06',0),(98,14,23,'2019-02-06',0),(99,1,23,'2019-02-06',0),(101,1,15,'2019-02-07',0),(102,1,16,'2019-02-07',0),(103,1,22,'2019-02-07',10270),(104,14,15,'2019-02-07',0),(105,14,23,'2019-02-07',0),(106,1,23,'2019-02-07',0),(107,1,15,'2019-02-08',0),(108,1,16,'2019-02-08',0),(109,1,22,'2019-02-08',10270),(110,14,15,'2019-02-08',0),(111,14,23,'2019-02-08',0),(112,1,23,'2019-02-08',0),(114,1,15,'2019-02-09',0),(115,1,16,'2019-02-09',0),(116,1,22,'2019-02-09',10270),(117,14,15,'2019-02-09',0),(118,14,23,'2019-02-09',0),(119,1,23,'2019-02-09',0),(121,1,15,'2019-02-10',0),(122,1,16,'2019-02-10',0),(123,1,22,'2019-02-10',10270),(124,14,15,'2019-02-10',0),(125,14,23,'2019-02-10',0),(126,1,23,'2019-02-10',0),(128,1,15,'2019-02-11',0),(129,1,16,'2019-02-11',0),(130,1,22,'2019-02-11',10270),(131,14,15,'2019-02-11',0),(132,14,23,'2019-02-11',0),(133,1,23,'2019-02-11',0),(135,1,15,'2019-02-12',0),(136,1,16,'2019-02-12',0),(137,1,22,'2019-02-12',10270),(138,14,15,'2019-02-12',0),(139,14,23,'2019-02-12',0),(140,1,23,'2019-02-12',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `money_in_stock` */

insert  into `money_in_stock`(`id`,`day`,`account_id`,`organization_id`,`in_stock`) values (7,'2019-01-24',4,1,0),(8,'2019-01-24',5,1,0),(9,'2019-01-24',7,14,0),(10,'2019-01-24',8,14,0),(11,'2019-01-24',9,1,0),(12,'2019-01-24',10,1,0),(13,'2019-01-25',4,1,0),(14,'2019-01-25',5,1,0),(15,'2019-01-25',7,14,0),(16,'2019-01-25',8,14,0),(17,'2019-01-25',9,1,0),(18,'2019-01-25',10,1,0),(19,'2019-01-26',4,1,0),(20,'2019-01-26',5,1,0),(21,'2019-01-26',7,14,0),(22,'2019-01-26',8,14,0),(23,'2019-01-26',9,1,0),(24,'2019-01-26',10,1,0),(25,'2019-01-27',4,1,0),(26,'2019-01-27',5,1,0),(27,'2019-01-27',7,14,0),(28,'2019-01-27',8,14,0),(29,'2019-01-27',9,1,0),(30,'2019-01-27',10,1,0),(31,'2019-01-28',4,1,0),(32,'2019-01-28',5,1,0),(33,'2019-01-28',7,14,0),(34,'2019-01-28',8,14,0),(35,'2019-01-28',9,1,0),(36,'2019-01-28',10,1,0),(38,'2019-01-29',4,1,0),(39,'2019-01-29',5,1,0),(40,'2019-01-29',7,14,0),(41,'2019-01-29',8,14,0),(42,'2019-01-29',9,1,0),(43,'2019-01-29',10,1,0),(45,'2019-01-30',4,1,0),(46,'2019-01-30',5,1,0),(47,'2019-01-30',7,14,0),(48,'2019-01-30',8,14,0),(49,'2019-01-30',9,1,0),(50,'2019-01-30',10,1,0),(52,'2019-01-31',4,1,0),(53,'2019-01-31',5,1,0),(54,'2019-01-31',7,14,0),(55,'2019-01-31',8,14,0),(56,'2019-01-31',9,1,0),(57,'2019-01-31',10,1,0),(58,'2019-02-01',4,1,0),(59,'2019-02-01',5,1,0),(60,'2019-02-01',7,14,0),(61,'2019-02-01',8,14,0),(62,'2019-02-01',9,1,0),(63,'2019-02-01',10,1,0),(64,'2019-02-02',4,1,0),(65,'2019-02-02',5,1,0),(66,'2019-02-02',7,14,0),(67,'2019-02-02',8,14,0),(68,'2019-02-02',9,1,0),(69,'2019-02-02',10,1,0),(71,'2019-02-03',4,1,0),(72,'2019-02-03',5,1,0),(73,'2019-02-03',7,14,0),(74,'2019-02-03',8,14,0),(75,'2019-02-03',9,1,0),(76,'2019-02-03',10,1,0),(78,'2019-02-04',4,1,0),(79,'2019-02-04',5,1,0),(80,'2019-02-04',7,14,0),(81,'2019-02-04',8,14,0),(82,'2019-02-04',9,1,0),(83,'2019-02-04',10,1,0),(84,'2019-02-05',4,1,0),(85,'2019-02-05',5,1,0),(86,'2019-02-05',7,14,0),(87,'2019-02-05',8,14,0),(88,'2019-02-05',9,1,0),(89,'2019-02-05',10,1,0),(91,'2019-02-06',4,1,0),(92,'2019-02-06',5,1,0),(93,'2019-02-06',7,14,0),(94,'2019-02-06',8,14,0),(95,'2019-02-06',9,1,0),(96,'2019-02-06',10,1,0),(98,'2019-02-07',4,1,0),(99,'2019-02-07',5,1,0),(100,'2019-02-07',7,14,0),(101,'2019-02-07',8,14,0),(102,'2019-02-07',9,1,0),(103,'2019-02-07',10,1,0),(104,'2019-02-08',4,1,0),(105,'2019-02-08',5,1,0),(106,'2019-02-08',7,14,0),(107,'2019-02-08',8,14,0),(108,'2019-02-08',9,1,0),(109,'2019-02-08',10,1,0),(111,'2019-02-09',4,1,0),(112,'2019-02-09',5,1,0),(113,'2019-02-09',7,14,0),(114,'2019-02-09',8,14,0),(115,'2019-02-09',9,1,0),(116,'2019-02-09',10,1,0),(118,'2019-02-10',4,1,0),(119,'2019-02-10',5,1,0),(120,'2019-02-10',7,14,0),(121,'2019-02-10',8,14,0),(122,'2019-02-10',9,1,0),(123,'2019-02-10',10,1,0),(125,'2019-02-11',4,1,0),(126,'2019-02-11',5,1,0),(127,'2019-02-11',7,14,0),(128,'2019-02-11',8,14,0),(129,'2019-02-11',9,1,0),(130,'2019-02-11',10,1,0),(132,'2019-02-12',4,1,0),(133,'2019-02-12',5,1,0),(134,'2019-02-12',7,14,0),(135,'2019-02-12',8,14,0),(136,'2019-02-12',9,1,0),(137,'2019-02-12',10,1,0);

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

insert  into `permission_detail`(`id`,`permission_id`,`operation`,`function`) values (17,8,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(16,8,1,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(18,8,3,'1,5,8,4,13,14,53,54,15,20,22,23,51,52,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(19,8,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(20,8,6,'56'),(35,11,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(36,11,6,'56,57,89,81,62,63,69,64,65,88,92,66,67,68,79,80,71,72,73,74,78,84,85,87,91'),(34,11,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(33,11,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(32,11,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(31,11,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(37,12,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(38,12,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(39,12,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(40,12,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(41,12,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(42,12,6,'56,57,89,81,62,63,69,64,65,88,92,66,67,68,79,80,71,72,73,74,78,84,85,87,91');

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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_in_stock` */

insert  into `petro_in_stock`(`id`,`day`,`petro_id`,`organization_id`,`store_id`,`in_stock`) values (226,'2019-01-24',6,1,4,0),(227,'2019-01-24',6,1,6,0),(229,'2019-01-24',6,1,4,0),(230,'2019-01-24',6,1,6,0),(231,'2019-01-24',6,1,4,0),(232,'2019-01-24',6,1,6,0),(234,'2019-01-24',6,1,4,0),(235,'2019-01-24',6,1,6,0),(237,'2019-01-24',6,1,4,0),(238,'2019-01-24',6,1,6,0),(240,'2019-01-24',6,1,4,0),(241,'2019-01-24',6,1,6,0),(243,'2019-01-24',6,1,4,0),(244,'2019-01-24',6,1,6,0),(246,'2019-01-24',6,1,4,0),(247,'2019-01-24',6,1,6,0),(249,'2019-01-24',6,1,4,0),(250,'2019-01-24',6,1,6,0),(251,'2019-01-25',6,1,4,0),(252,'2019-01-25',6,1,6,0),(253,'2019-01-26',6,1,4,0),(254,'2019-01-26',6,1,6,0),(255,'2019-01-27',6,1,4,0),(256,'2019-01-27',6,1,6,0),(257,'2019-01-28',6,1,4,0),(258,'2019-01-28',6,1,6,0),(260,'2019-01-29',6,1,4,0),(261,'2019-01-29',6,1,6,0),(263,'2019-01-30',6,1,4,0),(264,'2019-01-30',6,1,6,0),(266,'2019-01-31',6,1,4,0),(267,'2019-01-31',6,1,6,0),(268,'2019-02-01',6,1,4,0),(269,'2019-02-01',6,1,6,0),(270,'2019-02-02',6,1,4,0),(271,'2019-02-02',6,1,6,0),(273,'2019-02-03',6,1,4,0),(274,'2019-02-03',6,1,6,0),(276,'2019-02-04',6,1,4,0),(277,'2019-02-04',6,1,6,0),(278,'2019-02-05',6,1,4,0),(279,'2019-02-05',6,1,6,0),(281,'2019-02-06',6,1,4,0),(282,'2019-02-06',6,1,6,0),(284,'2019-02-07',6,1,4,0),(285,'2019-02-07',6,1,6,0),(286,'2019-02-08',6,1,4,0),(287,'2019-02-08',6,1,6,0),(289,'2019-02-09',6,1,4,0),(290,'2019-02-09',6,1,6,0),(292,'2019-02-10',6,1,4,0),(293,'2019-02-10',6,1,6,0),(295,'2019-02-11',6,1,4,0),(296,'2019-02-11',6,1,6,0),(298,'2019-02-12',6,1,4,0),(299,'2019-02-12',6,1,6,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_in_stock` */

insert  into `promotion_material_in_stock`(`id`,`day`,`promotion_material_id`,`organization_id`,`in_stock`) values (514,'2019-01-24',3,1,0),(515,'2019-01-24',4,1,0),(516,'2019-01-24',3,14,0),(517,'2019-01-24',4,14,0),(521,'2019-01-24',3,1,0),(522,'2019-01-24',4,1,0),(523,'2019-01-24',3,14,0),(524,'2019-01-24',4,14,0),(525,'2019-01-24',3,1,0),(526,'2019-01-24',4,1,0),(527,'2019-01-24',3,14,0),(528,'2019-01-24',4,14,0),(532,'2019-01-24',3,1,0),(533,'2019-01-24',4,1,0),(534,'2019-01-24',3,14,0),(535,'2019-01-24',4,14,0),(539,'2019-01-24',3,1,0),(540,'2019-01-24',4,1,0),(541,'2019-01-24',3,14,0),(542,'2019-01-24',4,14,0),(546,'2019-01-24',3,1,0),(547,'2019-01-24',4,1,0),(548,'2019-01-24',3,14,0),(549,'2019-01-24',4,14,0),(553,'2019-01-24',3,1,0),(554,'2019-01-24',4,1,0),(555,'2019-01-24',3,14,0),(556,'2019-01-24',4,14,0),(560,'2019-01-24',3,1,0),(561,'2019-01-24',4,1,0),(562,'2019-01-24',3,14,0),(563,'2019-01-24',4,14,0),(567,'2019-01-24',3,1,0),(568,'2019-01-24',4,1,0),(569,'2019-01-24',3,14,0),(570,'2019-01-24',4,14,0),(571,'2019-01-25',3,1,0),(572,'2019-01-25',4,1,0),(573,'2019-01-25',3,14,0),(574,'2019-01-25',4,14,0),(575,'2019-01-26',3,1,0),(576,'2019-01-26',4,1,0),(577,'2019-01-26',3,14,0),(578,'2019-01-26',4,14,0),(579,'2019-01-27',3,1,0),(580,'2019-01-27',4,1,0),(581,'2019-01-27',3,14,0),(582,'2019-01-27',4,14,0),(583,'2019-01-28',3,1,0),(584,'2019-01-28',4,1,0),(585,'2019-01-28',3,14,0),(586,'2019-01-28',4,14,0),(590,'2019-01-29',3,1,0),(591,'2019-01-29',4,1,0),(592,'2019-01-29',3,14,0),(593,'2019-01-29',4,14,0),(597,'2019-01-30',3,1,0),(598,'2019-01-30',4,1,0),(599,'2019-01-30',3,14,0),(600,'2019-01-30',4,14,0),(604,'2019-01-31',3,1,0),(605,'2019-01-31',4,1,0),(606,'2019-01-31',3,14,0),(607,'2019-01-31',4,14,0),(608,'2019-02-01',3,1,0),(609,'2019-02-01',4,1,0),(610,'2019-02-01',3,14,0),(611,'2019-02-01',4,14,0),(612,'2019-02-02',3,1,0),(613,'2019-02-02',4,1,0),(614,'2019-02-02',3,14,0),(615,'2019-02-02',4,14,0),(619,'2019-02-03',3,1,0),(620,'2019-02-03',4,1,0),(621,'2019-02-03',3,14,0),(622,'2019-02-03',4,14,0),(626,'2019-02-04',3,1,0),(627,'2019-02-04',4,1,0),(628,'2019-02-04',3,14,0),(629,'2019-02-04',4,14,0),(630,'2019-02-05',3,1,0),(631,'2019-02-05',4,1,0),(632,'2019-02-05',3,14,0),(633,'2019-02-05',4,14,0),(637,'2019-02-06',3,1,0),(638,'2019-02-06',4,1,0),(639,'2019-02-06',3,14,0),(640,'2019-02-06',4,14,0),(644,'2019-02-07',3,1,0),(645,'2019-02-07',4,1,0),(646,'2019-02-07',3,14,0),(647,'2019-02-07',4,14,0),(648,'2019-02-08',3,1,0),(649,'2019-02-08',4,1,0),(650,'2019-02-08',3,14,0),(651,'2019-02-08',4,14,0),(655,'2019-02-09',3,1,0),(656,'2019-02-09',4,1,0),(657,'2019-02-09',3,14,0),(658,'2019-02-09',4,14,0),(662,'2019-02-10',3,1,0),(663,'2019-02-10',4,1,0),(664,'2019-02-10',3,14,0),(665,'2019-02-10',4,14,0),(669,'2019-02-11',3,1,0),(670,'2019-02-11',4,1,0),(671,'2019-02-11',3,14,0),(672,'2019-02-11',4,14,0),(676,'2019-02-12',3,1,0),(677,'2019-02-12',4,1,0),(678,'2019-02-12',3,14,0),(679,'2019-02-12',4,14,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_gas_in_stock` */

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_import` */

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
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_in_stock` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_vendor` */

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
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_in_stock` */

insert  into `shield_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`in_stock`) values (561,'2019-01-24',15,1,0),(562,'2019-01-24',16,1,0),(563,'2019-01-24',22,1,0),(564,'2019-01-24',23,1,0),(565,'2019-01-24',15,14,0),(566,'2019-01-24',23,14,0),(568,'2019-01-24',15,1,0),(569,'2019-01-24',16,1,0),(570,'2019-01-24',22,1,0),(571,'2019-01-24',23,1,0),(572,'2019-01-24',15,14,0),(573,'2019-01-24',23,14,0),(574,'2019-01-24',15,1,0),(575,'2019-01-24',16,1,0),(576,'2019-01-24',22,1,0),(577,'2019-01-24',23,1,0),(578,'2019-01-24',15,14,0),(579,'2019-01-24',23,14,0),(581,'2019-01-24',15,1,0),(582,'2019-01-24',16,1,0),(583,'2019-01-24',22,1,0),(584,'2019-01-24',23,1,0),(585,'2019-01-24',15,14,0),(586,'2019-01-24',23,14,0),(588,'2019-01-24',15,1,0),(589,'2019-01-24',16,1,0),(590,'2019-01-24',22,1,0),(591,'2019-01-24',23,1,0),(592,'2019-01-24',15,14,0),(593,'2019-01-24',23,14,0),(595,'2019-01-24',15,1,0),(596,'2019-01-24',16,1,0),(597,'2019-01-24',22,1,0),(598,'2019-01-24',23,1,0),(599,'2019-01-24',15,14,0),(600,'2019-01-24',23,14,0),(602,'2019-01-24',15,1,0),(603,'2019-01-24',16,1,0),(604,'2019-01-24',22,1,0),(605,'2019-01-24',23,1,0),(606,'2019-01-24',15,14,0),(607,'2019-01-24',23,14,0),(609,'2019-01-24',15,1,0),(610,'2019-01-24',16,1,0),(611,'2019-01-24',22,1,0),(612,'2019-01-24',23,1,0),(613,'2019-01-24',15,14,0),(614,'2019-01-24',23,14,0),(616,'2019-01-24',15,1,0),(617,'2019-01-24',16,1,0),(618,'2019-01-24',22,1,0),(619,'2019-01-24',23,1,0),(620,'2019-01-24',15,14,0),(621,'2019-01-24',23,14,0),(622,'2019-01-25',15,1,0),(623,'2019-01-25',16,1,0),(624,'2019-01-25',22,1,0),(625,'2019-01-25',23,1,0),(626,'2019-01-25',15,14,0),(627,'2019-01-25',23,14,0),(628,'2019-01-26',15,1,0),(629,'2019-01-26',16,1,0),(630,'2019-01-26',22,1,0),(631,'2019-01-26',23,1,0),(632,'2019-01-26',15,14,0),(633,'2019-01-26',23,14,0),(634,'2019-01-27',15,1,0),(635,'2019-01-27',16,1,0),(636,'2019-01-27',22,1,0),(637,'2019-01-27',23,1,0),(638,'2019-01-27',15,14,0),(639,'2019-01-27',23,14,0),(640,'2019-01-28',15,1,0),(641,'2019-01-28',16,1,0),(642,'2019-01-28',22,1,0),(643,'2019-01-28',23,1,0),(644,'2019-01-28',15,14,0),(645,'2019-01-28',23,14,0),(647,'2019-01-29',15,1,0),(648,'2019-01-29',16,1,0),(649,'2019-01-29',22,1,0),(650,'2019-01-29',23,1,0),(651,'2019-01-29',15,14,0),(652,'2019-01-29',23,14,0),(654,'2019-01-30',15,1,0),(655,'2019-01-30',16,1,0),(656,'2019-01-30',22,1,0),(657,'2019-01-30',23,1,0),(658,'2019-01-30',15,14,0),(659,'2019-01-30',23,14,0),(661,'2019-01-31',15,1,0),(662,'2019-01-31',16,1,0),(663,'2019-01-31',22,1,0),(664,'2019-01-31',23,1,0),(665,'2019-01-31',15,14,0),(666,'2019-01-31',23,14,0),(667,'2019-02-01',15,1,0),(668,'2019-02-01',16,1,0),(669,'2019-02-01',22,1,0),(670,'2019-02-01',23,1,0),(671,'2019-02-01',15,14,0),(672,'2019-02-01',23,14,0),(673,'2019-02-02',15,1,0),(674,'2019-02-02',16,1,0),(675,'2019-02-02',22,1,0),(676,'2019-02-02',23,1,0),(677,'2019-02-02',15,14,0),(678,'2019-02-02',23,14,0),(680,'2019-02-03',15,1,0),(681,'2019-02-03',16,1,0),(682,'2019-02-03',22,1,0),(683,'2019-02-03',23,1,0),(684,'2019-02-03',15,14,0),(685,'2019-02-03',23,14,0),(687,'2019-02-04',15,1,0),(688,'2019-02-04',16,1,0),(689,'2019-02-04',22,1,0),(690,'2019-02-04',23,1,0),(691,'2019-02-04',15,14,0),(692,'2019-02-04',23,14,0),(693,'2019-02-05',15,1,0),(694,'2019-02-05',16,1,0),(695,'2019-02-05',22,1,0),(696,'2019-02-05',23,1,0),(697,'2019-02-05',15,14,0),(698,'2019-02-05',23,14,0),(700,'2019-02-06',15,1,0),(701,'2019-02-06',16,1,0),(702,'2019-02-06',22,1,0),(703,'2019-02-06',23,1,0),(704,'2019-02-06',15,14,0),(705,'2019-02-06',23,14,0),(707,'2019-02-07',15,1,0),(708,'2019-02-07',16,1,0),(709,'2019-02-07',22,1,0),(710,'2019-02-07',23,1,0),(711,'2019-02-07',15,14,0),(712,'2019-02-07',23,14,0),(713,'2019-02-08',15,1,0),(714,'2019-02-08',16,1,0),(715,'2019-02-08',22,1,0),(716,'2019-02-08',23,1,0),(717,'2019-02-08',15,14,0),(718,'2019-02-08',23,14,0),(720,'2019-02-09',15,1,0),(721,'2019-02-09',16,1,0),(722,'2019-02-09',22,1,0),(723,'2019-02-09',23,1,0),(724,'2019-02-09',15,14,0),(725,'2019-02-09',23,14,0),(727,'2019-02-10',15,1,0),(728,'2019-02-10',16,1,0),(729,'2019-02-10',22,1,0),(730,'2019-02-10',23,1,0),(731,'2019-02-10',15,14,0),(732,'2019-02-10',23,14,0),(734,'2019-02-11',15,1,0),(735,'2019-02-11',16,1,0),(736,'2019-02-11',22,1,0),(737,'2019-02-11',23,1,0),(738,'2019-02-11',15,14,0),(739,'2019-02-11',23,14,0),(741,'2019-02-12',15,1,0),(742,'2019-02-12',16,1,0),(743,'2019-02-12',22,1,0),(744,'2019-02-12',23,1,0),(745,'2019-02-12',15,14,0),(746,'2019-02-12',23,14,0);

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
  `customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_quantity` double DEFAULT NULL,
  `out_quantity` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transport_service` */

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

insert  into `user`(`id`,`employee_id`,`username`,`password`,`menu`,`status`) values (1,1,'tu','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Xuất xe về\"><item id=\"vehicleinlist\" text=\"Danh sách xuất xe về\"/><item id=\"vehicleinadd\" text=\"Thêm xuất xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán sỉ gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán sỉ gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán sỉ gas\"/></item><item id=\"gasretails\" complex=\"true\" text=\"Bán lẻ gas\"><item id=\"gasretaillist\" text=\"Danh sách phiếu bán lẻ gas\"/><item id=\"gasretailadd\" text=\"Thêm phiếu bán lẻ gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"gasreturns\" complex=\"true\" text=\"Trả gas\"><item id=\"gasreturnlist\" text=\"Danh sách trả gas\"/><item id=\"gasreturnadd\" text=\"Thêm trả gas\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"petroimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtretails\" complex=\"true\" text=\"Công nợ bán lẻ\"><item id=\"debtretaillist\" text=\"Danh sách công nợ bán lẻ\"/><item id=\"debtretailadd\" text=\"Thêm công nợ bán lẻ\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ bán sỉ\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ bán sỉ\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ bán sỉ\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(11,17,'hungpk','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(12,18,'ntb','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(13,20,'hungcp','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(14,42,'trinh','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1);

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in` */

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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_detail` */

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out` */

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
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_detail` */

/*Table structure for table `vehicle_out_employee_detail` */

DROP TABLE IF EXISTS `vehicle_out_employee_detail`;

CREATE TABLE `vehicle_out_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_employee_detail` */

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`code`,`name`,`address`,`tax`,`phone`,`fax`,`organization_id`,`status`,`equal_organization_id`,`has_stock`,`is_gas`,`is_petro`,`is_good`) values (23,'HUNGTHINH','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh','','','','',14,1,14,1,1,0,0),(16,'KDK','Công ty kinh doanh sản phẩm khí',NULL,NULL,NULL,NULL,1,1,-1,1,1,0,0),(15,'THIENHA','Công ty TNHH Dầu Khí Thiên Hà',NULL,NULL,NULL,NULL,1,1,-1,1,1,0,0),(18,'TCP','Công Ty TNHH Thanh Châu Phát',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0),(19,'PVO MD','Công ty cổ phần xăng dầu dầu khí Vũng Tàu',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0),(20,'NIWA','NIWA',NULL,NULL,NULL,NULL,1,1,-1,0,0,0,1),(21,'HGA','Công Ty TNHH Hưng Gia Anh',NULL,NULL,NULL,NULL,1,1,-1,0,1,0,0),(22,'QuangTrung','Công ty TNHH Quang Trung',NULL,NULL,NULL,NULL,1,1,1,1,1,0,0);

/*Table structure for table `vendor_customer` */

DROP TABLE IF EXISTS `vendor_customer`;

CREATE TABLE `vendor_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_customer` */

insert  into `vendor_customer`(`id`,`organization_id`,`vendor_id`,`customer_id`) values (3,0,15,165);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_in_stock` */

insert  into `vendor_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`amount`,`shell_12`,`shell_45`,`transport_amount`) values (10,'2019-01-24',15,1,0,0,0,0),(11,'2019-01-24',15,14,3389100000,0,0,0),(12,'2019-01-24',16,1,0,0,0,0),(13,'2019-01-24',18,1,0,0,0,0),(14,'2019-01-24',19,1,0,0,0,0),(15,'2019-01-24',20,1,0,0,0,0),(16,'2019-01-24',21,1,0,0,0,0),(17,'2019-01-24',22,1,0,0,0,0),(18,'2019-01-24',23,1,0,0,0,0),(19,'2019-01-24',23,14,0,0,0,0),(20,'2019-01-25',15,1,0,0,0,0),(21,'2019-01-25',15,14,3389100000,0,0,0),(22,'2019-01-25',16,1,0,0,0,0),(23,'2019-01-25',18,1,0,0,0,0),(24,'2019-01-25',19,1,0,0,0,0),(25,'2019-01-25',20,1,0,0,0,0),(26,'2019-01-25',21,1,0,0,0,0),(27,'2019-01-25',22,1,0,0,0,0),(28,'2019-01-25',23,1,36972000,0,0,0),(29,'2019-01-25',23,14,0,0,0,0),(30,'2019-01-26',15,1,0,0,0,0),(31,'2019-01-26',15,14,3389100000,0,0,0),(32,'2019-01-26',16,1,0,0,0,0),(33,'2019-01-26',18,1,0,0,0,0),(34,'2019-01-26',19,1,0,0,0,0),(35,'2019-01-26',20,1,0,0,0,0),(36,'2019-01-26',21,1,0,0,0,0),(37,'2019-01-26',22,1,0,0,0,0),(38,'2019-01-26',23,1,36972000,0,0,0),(39,'2019-01-26',23,14,0,0,0,0),(40,'2019-01-27',15,1,0,0,0,0),(41,'2019-01-27',15,14,3389100000,0,0,0),(42,'2019-01-27',16,1,0,0,0,0),(43,'2019-01-27',18,1,0,0,0,0),(44,'2019-01-27',19,1,0,0,0,0),(45,'2019-01-27',20,1,0,0,0,0),(46,'2019-01-27',21,1,0,0,0,0),(47,'2019-01-27',22,1,0,0,0,0),(48,'2019-01-27',23,1,36972000,0,0,0),(49,'2019-01-27',23,14,0,0,0,0),(50,'2019-01-28',15,1,0,0,0,0),(51,'2019-01-28',15,14,3389100000,0,0,0),(52,'2019-01-28',16,1,0,0,0,0),(53,'2019-01-28',18,1,0,0,0,0),(54,'2019-01-28',19,1,0,0,0,0),(55,'2019-01-28',20,1,0,0,0,0),(56,'2019-01-28',21,1,0,0,0,0),(57,'2019-01-28',22,1,0,0,0,0),(58,'2019-01-28',23,1,36972000,0,0,0),(59,'2019-01-28',23,14,0,0,0,0),(65,'2019-01-29',15,1,0,0,0,0),(66,'2019-01-29',15,14,3389100000,0,0,0),(67,'2019-01-29',16,1,0,0,0,0),(68,'2019-01-29',18,1,0,0,0,0),(69,'2019-01-29',19,1,0,0,0,0),(70,'2019-01-29',20,1,0,0,0,0),(71,'2019-01-29',21,1,0,0,0,0),(72,'2019-01-29',22,1,0,0,0,0),(73,'2019-01-29',23,1,36972000,0,0,0),(74,'2019-01-29',23,14,0,0,0,0),(80,'2019-01-30',15,1,0,0,0,0),(81,'2019-01-30',15,14,3389100000,0,0,0),(82,'2019-01-30',16,1,0,0,0,0),(83,'2019-01-30',18,1,0,0,0,0),(84,'2019-01-30',19,1,0,0,0,0),(85,'2019-01-30',20,1,0,0,0,0),(86,'2019-01-30',21,1,0,0,0,0),(87,'2019-01-30',22,1,0,0,0,0),(88,'2019-01-30',23,1,36972000,0,0,0),(89,'2019-01-30',23,14,0,0,0,0),(95,'2019-01-31',15,1,0,0,0,0),(96,'2019-01-31',15,14,3389100000,0,0,0),(97,'2019-01-31',16,1,0,0,0,0),(98,'2019-01-31',18,1,0,0,0,0),(99,'2019-01-31',19,1,0,0,0,0),(100,'2019-01-31',20,1,0,0,0,0),(101,'2019-01-31',21,1,0,0,0,0),(102,'2019-01-31',22,1,0,0,0,0),(103,'2019-01-31',23,1,36972000,0,0,0),(104,'2019-01-31',23,14,0,0,0,0),(105,'2019-02-01',15,1,0,0,0,0),(106,'2019-02-01',15,14,3389100000,0,0,0),(107,'2019-02-01',16,1,0,0,0,0),(108,'2019-02-01',18,1,0,0,0,0),(109,'2019-02-01',19,1,0,0,0,0),(110,'2019-02-01',20,1,0,0,0,0),(111,'2019-02-01',21,1,0,0,0,0),(112,'2019-02-01',22,1,0,0,0,0),(113,'2019-02-01',23,1,36972000,0,0,0),(114,'2019-02-01',23,14,0,0,0,0),(115,'2019-02-02',15,1,0,0,0,0),(116,'2019-02-02',15,14,3389100000,0,0,0),(117,'2019-02-02',16,1,0,0,0,0),(118,'2019-02-02',18,1,0,0,0,0),(119,'2019-02-02',19,1,0,0,0,0),(120,'2019-02-02',20,1,0,0,0,0),(121,'2019-02-02',21,1,0,0,0,0),(122,'2019-02-02',22,1,0,0,0,0),(123,'2019-02-02',23,1,36972000,0,0,0),(124,'2019-02-02',23,14,0,0,0,0),(130,'2019-02-03',15,1,0,0,0,0),(131,'2019-02-03',15,14,3389100000,0,0,0),(132,'2019-02-03',16,1,0,0,0,0),(133,'2019-02-03',18,1,0,0,0,0),(134,'2019-02-03',19,1,0,0,0,0),(135,'2019-02-03',20,1,0,0,0,0),(136,'2019-02-03',21,1,0,0,0,0),(137,'2019-02-03',22,1,0,0,0,0),(138,'2019-02-03',23,1,36972000,0,0,0),(139,'2019-02-03',23,14,0,0,0,0),(145,'2019-02-04',15,1,0,0,0,0),(146,'2019-02-04',15,14,3389100000,0,0,0),(147,'2019-02-04',16,1,0,0,0,0),(148,'2019-02-04',18,1,0,0,0,0),(149,'2019-02-04',19,1,0,0,0,0),(150,'2019-02-04',20,1,0,0,0,0),(151,'2019-02-04',21,1,0,0,0,0),(152,'2019-02-04',22,1,0,0,0,0),(153,'2019-02-04',23,1,36972000,0,0,0),(154,'2019-02-04',23,14,0,0,0,0),(155,'2019-02-05',15,1,0,0,0,0),(156,'2019-02-05',15,14,3389100000,0,0,0),(157,'2019-02-05',16,1,0,0,0,0),(158,'2019-02-05',18,1,0,0,0,0),(159,'2019-02-05',19,1,0,0,0,0),(160,'2019-02-05',20,1,0,0,0,0),(161,'2019-02-05',21,1,0,0,0,0),(162,'2019-02-05',22,1,0,0,0,0),(163,'2019-02-05',23,1,36972000,0,0,0),(164,'2019-02-05',23,14,0,0,0,0),(170,'2019-02-06',15,1,0,0,0,0),(171,'2019-02-06',15,14,3389100000,0,0,0),(172,'2019-02-06',16,1,0,0,0,0),(173,'2019-02-06',18,1,0,0,0,0),(174,'2019-02-06',19,1,0,0,0,0),(175,'2019-02-06',20,1,0,0,0,0),(176,'2019-02-06',21,1,0,0,0,0),(177,'2019-02-06',22,1,0,0,0,0),(178,'2019-02-06',23,1,36972000,0,0,0),(179,'2019-02-06',23,14,0,0,0,0),(185,'2019-02-07',15,1,0,0,0,0),(186,'2019-02-07',15,14,3389100000,0,0,0),(187,'2019-02-07',16,1,0,0,0,0),(188,'2019-02-07',18,1,0,0,0,0),(189,'2019-02-07',19,1,0,0,0,0),(190,'2019-02-07',20,1,0,0,0,0),(191,'2019-02-07',21,1,0,0,0,0),(192,'2019-02-07',22,1,0,0,0,0),(193,'2019-02-07',23,1,36972000,0,0,0),(194,'2019-02-07',23,14,0,0,0,0),(195,'2019-02-08',15,1,0,0,0,0),(196,'2019-02-08',15,14,3389100000,0,0,0),(197,'2019-02-08',16,1,0,0,0,0),(198,'2019-02-08',18,1,0,0,0,0),(199,'2019-02-08',19,1,0,0,0,0),(200,'2019-02-08',20,1,0,0,0,0),(201,'2019-02-08',21,1,0,0,0,0),(202,'2019-02-08',22,1,0,0,0,0),(203,'2019-02-08',23,1,36972000,0,0,0),(204,'2019-02-08',23,14,0,0,0,0),(210,'2019-02-09',15,1,0,0,0,0),(211,'2019-02-09',15,14,3389100000,0,0,0),(212,'2019-02-09',16,1,0,0,0,0),(213,'2019-02-09',18,1,0,0,0,0),(214,'2019-02-09',19,1,0,0,0,0),(215,'2019-02-09',20,1,0,0,0,0),(216,'2019-02-09',21,1,0,0,0,0),(217,'2019-02-09',22,1,0,0,0,0),(218,'2019-02-09',23,1,36972000,0,0,0),(219,'2019-02-09',23,14,0,0,0,0),(225,'2019-02-10',15,1,0,0,0,0),(226,'2019-02-10',15,14,3389100000,0,0,0),(227,'2019-02-10',16,1,0,0,0,0),(228,'2019-02-10',18,1,0,0,0,0),(229,'2019-02-10',19,1,0,0,0,0),(230,'2019-02-10',20,1,0,0,0,0),(231,'2019-02-10',21,1,0,0,0,0),(232,'2019-02-10',22,1,0,0,0,0),(233,'2019-02-10',23,1,36972000,0,0,0),(234,'2019-02-10',23,14,0,0,0,0),(240,'2019-02-11',15,1,0,0,0,0),(241,'2019-02-11',15,14,3389100000,0,0,0),(242,'2019-02-11',16,1,0,0,0,0),(243,'2019-02-11',18,1,0,0,0,0),(244,'2019-02-11',19,1,0,0,0,0),(245,'2019-02-11',20,1,0,0,0,0),(246,'2019-02-11',21,1,0,0,0,0),(247,'2019-02-11',22,1,0,0,0,0),(248,'2019-02-11',23,1,36972000,0,0,0),(249,'2019-02-11',23,14,0,0,0,0),(255,'2019-02-12',15,1,0,0,0,0),(256,'2019-02-12',15,14,3389100000,0,0,0),(257,'2019-02-12',16,1,0,0,0,0),(258,'2019-02-12',18,1,0,0,0,0),(259,'2019-02-12',19,1,0,0,0,0),(260,'2019-02-12',20,1,0,0,0,0),(261,'2019-02-12',21,1,0,0,0,0),(262,'2019-02-12',22,1,0,0,0,0),(263,'2019-02-12',23,1,36972000,0,0,0),(264,'2019-02-12',23,14,0,0,0,0);

/*Table structure for table `vendor_organization` */

DROP TABLE IF EXISTS `vendor_organization`;

CREATE TABLE `vendor_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_organization` */

insert  into `vendor_organization`(`id`,`vendor_id`,`organization_id`) values (11,15,1),(12,16,1),(16,18,1),(17,19,1),(18,20,1),(19,21,1),(20,22,1),(21,15,14),(22,23,14),(23,23,1);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

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
	DECLARE _date_diff, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT created_date, paid, account_id INTO _date, _old_amount, _old_account_id
	FROM wholesale_debt WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM customer_in_stock AS ss, wholesale_debt AS s
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id=s.customer_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE customer_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
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
	DECLARE _date_diff, _in_stock_id, _old_quantity, _organization_id, _import_vendor_id, _import_organization_id, _vendor_id, _kind INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE;
	DECLARE _date DATE;
	
	SELECT i.import_date, i.actual_quantity, i.paid, i.debt, eo.organization_id, i.vendor_id, i.kind
	INTO _date, _old_quantity, _old_paid, _old_debt, _organization_id, _vendor_id, _kind
	FROM lpg_import as i, employee AS eo WHERE eo.id=i.created_employee_id and i.id=_id;
	
	SELECT id INTO _import_vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	SELECT equal_organization_id INTO _import_organization_id FROM vendor WHERE id=_vendor_id LIMIT 1;
	
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
	
		SET _in_stock_id=0;
		IF _import_organization_id > 0 THEN
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_import_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _import_organization_id, _vendor_id, _old_quantity);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
			END IF;
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
		SELECT ss.id INTO _in_stock_id FROM lpg_in_stock AS ss WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		END IF;
	
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
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM transport_service AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
		UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_debt WHERE id=_in_stock_id;
			
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		UPDATE money_in_stock SET in_stock=in_stock - _old_paid WHERE id=_in_stock_id;
		
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
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO wholesale_debt (CODE, customer_id, created_date, paid, account_id, note, created_employee_id)
	VALUES (_code, _customer_id, _date, _paid, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, -_paid);
		ELSE
			UPDATE customer_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
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
	, in _account_id int, in _note text, in _created_employee_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_advance_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	insert into employee_advance (code, employee_id, advance_date, amount, account_id, note, created_employee_id)
	values (_code, _employee_id, _date, _amount, _account_id, _note, _created_employee_id);
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
	, in _gas_return int, in _gas_return_price double, in _gas_return_amount double, IN _created_employee_id INT, OUT _id INT)
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
	
	INSERT INTO gas_wholesale (CODE, created_date, customer_id, vehicle_out_id, total, paid, debt, discount, total_pay, account_id, note, gas_return, gas_return_price, gas_return_amount, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _vehicle_out_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _gas_return, _gas_return_price, _gas_return_amount, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
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
		SELECT i.vendor_id, eo.organization_id, 0 AS debt, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS transport_debt
		FROM transport_service AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
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
	, IN _paid double, IN _debt double, IN _rate double, in _account_id int, in _route_id int, IN _note TEXT, in _created_employee_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _import_vendor_id, _import_organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_import_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	select id into _import_vendor_id from vendor where equal_organization_id=_organization_id limit 1;
	SELECT equal_organization_id INTO _import_organization_id FROM vendor WHERE id=_vendor_id LIMIT 1;
	
	INSERT INTO lpg_import (CODE, vendor_id, kind, import_date, paper_quantity, actual_quantity, price, vat, invoice_amount, amount, paid, debt, rate, account_id, route_id, note, created_employee_id)
	VALUES (_code, _vendor_id, _kind, _date, _paper_quantity, _actual_quantity, _price, _vat, _invoice_amount, _amount, _paid, _debt, _rate, _account_id, _route_id, _note, _created_employee_id);
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
	
		SET _in_stock_id=0;
		if _import_organization_id > 0 then
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_import_organization_id AND vendor_id=_vendor_id;
			IF _in_stock_id=0 THEN
				INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _import_organization_id, _vendor_id, -_actual_quantity);
			ELSE
				UPDATE lpg_in_stock SET in_stock=in_stock - _actual_quantity WHERE id=_in_stock_id;
			END IF;
		end if;
	
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
	, IN _quantity FLOAT, IN _price DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _account_id INT, IN _route_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_sale_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	SELECT id INTO _vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	INSERT INTO lpg_sale (CODE, kind, customer_id, sale_date, quantity, price, vat, rate, amount, paid, debt, account_id, route_id, note, created_employee_id)
	VALUES (_code, _kind, _customer_id, _date, _quantity, _price, _vat, _rate, _amount, _paid, _debt, _account_id, _route_id, _note, _created_employee_id);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransportService`(IN _code VARCHAR(20), IN _vendor_id INT, in _customer varchar(255)
	, IN _created_date VARCHAR(20), IN _in_quantity double, IN _out_quantity double, IN _price DOUBLE, IN _amount DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
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
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, _debt);
		ELSE
			UPDATE vendor_in_stock SET transport_amount=transport_amount + _debt WHERE id=_in_stock_id;
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
	
	INSERT INTO transport_service (CODE, vendor_id, customer, created_date, in_quantity, out_quantity, price, amount, paid, debt, rate, account_id, note, created_employee_id)
	VALUES (_code, _vendor_id, _customer, STR_TO_DATE(_created_date,'%d/%m/%Y'), _in_quantity, _out_quantity, _price, _amount, _paid, _debt, _rate, _account_id, _note, _created_employee_id);
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
	, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, out _id int)
BEGIN
	declare _vendor_organization_id int default 0;
	Insert Into vendor (`name`, address, tax, phone, fax, `code`, organization_id, `status`, equal_organization_id, has_stock, is_gas, is_petro, is_good)
	values (_name, _address, _tax, _phone, _fax, _code, _organization_id, _status, _equal_organization_id, _has_stock, _is_gas, _is_petro, _is_good);
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
		select ls.sale_date as created_date, '' as content, ls.quantity, ls.price, ls.rate, ls.amount, ls.paid, ls.debt, ls.note
		from lpg_sale as ls, employee as eo
		where DATE(ls.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ls.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			and ls.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and ls.customer_id=_customer_id
		union all
		select wd.created_date, '' as content, 0 as quantity, 0 as price, 0 as rate, 0 as amount, wd.paid, 0 as debt, wd.note
		from wholesale_debt as wd, employee AS eo
		where DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND wd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND wd.customer_id=_customer_id
	) as tbl order by created_date
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_vendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_vendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_vendor`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT, OUT _opening_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT amount INTO _opening_debt FROM vendor_in_stock WHERE DATE(`day`)=_pre_date AND vendor_id=_vendor_id LIMIT 1;
	
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
	FROM gas_wholesale AS w, employee AS eo, gas_wholesale_detail AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND w.customer_id=_customer_id 
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
	ORDER BY ws.created_date;
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
	SELECT s.sale_date, c.code as customer_code, c.NAME AS customer_name, s.quantity, s.price, s.vat, s.rate, s.amount, s.paid, concat(a.number,' - ',a.bank) AS account
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lpg_stock`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT, OUT _gas_stock int)
BEGIN
	declare _from_date date;
	
	select STR_TO_DATE(_start_date,'%d/%m/%Y') into _from_date;
	
	SELECT COALESCE(sum(ls.in_stock),0) INTO _gas_stock
	FROM lpg_in_stock AS ls
	WHERE DATEDIFF(_from_date,ls.`day`)=1 and _organization_ids LIKE CONCAT('%,',organization_id,',%');
	
	SELECT created_date AS content, created_date, SUM(lpg_import) AS import_quantity, SUM(export_12_quantity) AS export_12_quantity
		, SUM(export_45_quantity) AS export_45_quantity, SUM(return_quantity) AS return_quantity, '' as note
	FROM
	(
	SELECT s.import_date as created_date, SUM(s.actual_quantity) AS lpg_import, 0 as export_12_quantity, 0 as export_45_quantity, 0 return_quantity
	FROM lpg_import AS s, employee as e
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	GROUP BY s.import_date, s.vendor_id
	union all
	SELECT pdet.created_date, 0 AS lpg_import, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) as export_12_quantity
		, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS export_45_quantity, 0 return_quantity
	FROM fraction_gas AS pdet, fraction_gas_detail AS det, shell_vendor AS sv
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and pdet.id=det.fraction_id and det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
	GROUP BY pdet.created_date, det.shell_id
	UNION ALL
	SELECT pdet.created_date, 0 AS lpg_import,  0 AS export_12_quantity, 0 AS export_45_quantity, SUM(pdet.gas_return) return_quantity
	FROM gas_wholesale AS pdet, employee AS eo, gas_return_vendor as v
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and pdet.created_employee_id=eo.id and eo.organization_id=v.organization_id
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
		, SUM(shield_import) AS shield_import, SUM(shield_decrease) AS shield_decrease, sum(import_quantity) as import_quantity
	FROM
	(
	SELECT pdet.created_date, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS fraction_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
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
		, 0 AS shield_import, 0 AS shield_decrease, sum(s.actual_quantity) AS import_quantity
	FROM lpg_import AS s, employee AS eo
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.import_date
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
		, SUM(shield_import) AS shield_import, SUM(shield_decrease) AS shield_decrease, SUM(import_quantity) AS import_quantity
	FROM
	(
	SELECT pdet.created_date, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS fraction_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS fraction_45
		, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		, 0 AS vehicle_in_12, 0 AS vehicle_in_45
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
		, 0 AS shield_import, 0 AS shield_decrease, SUM(s.actual_quantity) AS import_quantity
	FROM lpg_import AS s, employee AS eo
	WHERE DATE(s.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.vendor_id=_vendor_id
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY s.import_date
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
	SELECT vo.id, vo.created_date, v.plate, group_concat(voede.fullname) as employee_names
		, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t
		, SUM(tbl.shell_return_45) AS shell_return_45, gas_wholesale_tbl.total, gas_wholesale_tbl.total_pay
	FROM vehicle AS v, vehicle_out AS vo, employee AS eo, vehicle_out_employee_detail AS voed, employee AS voede,
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
			SELECT vehicle_out_id, SUM(total) AS total, SUM(total_pay) AS total_pay FROM gas_wholesale
			WHERE DATE(created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
				AND vehicle_out_id<>0
			GROUP BY vehicle_out_id
	) AS gas_wholesale_tbl
	WHERE DATE(vo.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(vo.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND vo.vehicle_id=v.id AND vo.id=voed.vehicle_out_id AND voed.employee_id=voede.id
		AND tbl.vehicle_out_id=vo.id AND vo.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		and tbl.vehicle_out_id=gas_wholesale_tbl.vehicle_out_id
	GROUP BY vo.id
	ORDER BY vo.created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_transport_service` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_transport_service` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_transport_service`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT, OUT _amount_debt DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM vendor_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.transport_amount INTO _amount_debt
	FROM vendor_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.vendor_id=_vendor_id LIMIT 1;
	
	select t.created_date, t.customer, '' as content, t.in_quantity, t.out_quantity, t.price, t.rate, t.amount, t.paid, t.debt, t.note
	from transport_service as t, employee as eo
	where DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		and t.vendor_id=_vendor_id
	union all
	SELECT t.created_date, '' as customer, '' AS content, 0 as in_quantity, 0 as out_quantity, 0 as price, 0 as rate, 0 as amount, t.paid, 0 as debt, t.note
	FROM vendor_debt AS t, employee AS eo
	WHERE DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND t.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		AND t.vendor_id=_vendor_id and t.kind=2
	order by created_date
	;
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
	
	SELECT v.code as vendor_code, v.name as vendor_name, tbl_vendor_stock.amount as opening_stock, sum(i.amount) as amount, sum(i.paid) as paid
	FROM vendor as v, organization as o, vendor_organization as vo
	left join (
		select vendor_id, organization_id, sum(amount) as amount
		from vendor_in_stock 
		where DATEDIFF(_from_date,`day`)=1 AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
		group by vendor_id, organization_id
	) as tbl_vendor_stock on vo.vendor_id=tbl_vendor_stock.vendor_id and vo.organization_id=tbl_vendor_stock.organization_id
	, lpg_import as i, employee as eo
	WHERE vo.vendor_id=v.id and vo.organization_id=o.id and v.status=1 and o.status=1
		and DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and vo.vendor_id=i.vendor_id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		and eo.organization_id=vo.organization_id
		
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
	SELECT i.id, i.CODE, v.name AS vendor_name, i.actual_quantity, i.price, i.amount, i.rate, i.note
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
	SELECT i.id, i.CODE, c.NAME AS customer_name, i.quantity, i.price, i.amount, i.note
	FROM lpg_sale AS i, customer AS c, employee AS eo
	WHERE i.customer_id=c.id AND i.created_employee_id=eo.id
		AND DATE(i.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
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
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id, _old_vendor_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT s.created_date, eo.organization_id, s.paid, s.account_id, s.vendor_id
	INTO _old_date, _organization_id, _old_amount, _old_account_id, _old_vendor_id
	FROM vendor_debt AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	if _old_date<>_date or _old_vendor_id<>_vendor_id or _old_account_id<>_account_id or _old_amount<>_paid then
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			IF _kind=1 THEN
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
				UPDATE vendor_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtWholesale`(IN _id INT, IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
		
	SELECT s.created_date, eo.organization_id, s.paid, s.account_id, s.customer_id
	INTO _old_date, _organization_id, _old_amount, _old_account_id, _old_customer_id
	FROM wholesale_debt AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_customer_id<>_customer_id OR _old_account_id<>_account_id OR _old_amount<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- customer_in_stock
			SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND customer_id=_old_customer_id;
			UPDATE customer_in_stock SET amount=amount + _old_amount WHERE id=_in_stock_id;
			
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
				INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, -_paid);
			ELSE
				UPDATE customer_in_stock SET amount=amount - _paid WHERE id=_in_stock_id;
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
	
	UPDATE wholesale_debt SET customer_id=_customer_id, paid=_paid, account_id=_account_id, note=_note, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') WHERE id=_id;
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
	, IN _gas_return_amount DOUBLE, IN _customer_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id, _old_gas_return, _old_customer_id, _old_account_id INT DEFAULT 0;
	declare _old_paid, _old_debt double default 0;
	DECLARE _old_date, _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.gas_return, f.customer_id, f.account_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_gas_return, _old_customer_id, _old_account_id, _old_paid, _old_debt
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
	WHERE id=_id;
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
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT)
BEGIN
	DECLARE _organization_id, _old_vendor_id, _old_import_organization_id, _import_organization_id, _import_vendor_id, _date_diff, _in_stock_id
		, _old_quantity, _old_account_id, _old_kind INT DEFAULT 0;
	DECLARE _old_debt, _old_paid DOUBLE;
	DECLARE _date, _old_date DATE;
		
	SELECT STR_TO_DATE(_import_date,'%d/%m/%Y') INTO _date;
	
	SELECT i.import_date, eo.organization_id, i.vendor_id, i.actual_quantity, i.paid, i.debt, i.account_id, i.kind
	INTO _old_date, _organization_id, _old_vendor_id, _old_quantity, _old_paid, _old_debt, _old_account_id, _old_kind
	FROM lpg_import AS i, employee AS eo
	WHERE i.id=_id AND i.created_employee_id=eo.id;
	
	SELECT id INTO _import_vendor_id FROM vendor WHERE equal_organization_id=_organization_id LIMIT 1;
	
	SELECT equal_organization_id INTO _import_organization_id FROM vendor WHERE id=_vendor_id LIMIT 1;
	SELECT equal_organization_id INTO _old_import_organization_id FROM vendor WHERE id=_old_vendor_id LIMIT 1;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_quantity<>_actual_quantity OR _old_account_id<>_account_id OR _old_debt<>_debt 
		or _old_paid<>_paid or _kind<>_old_kind THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- lpg_in_stock
			SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id= _organization_id AND vendor_id=_import_vendor_id;
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
			SET _in_stock_id=0;
			IF _old_import_organization_id > 0 THEN
				SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_old_import_organization_id AND vendor_id=_old_vendor_id;
				IF _in_stock_id=0 THEN
					INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _old_import_organization_id, _old_vendor_id, _old_quantity);
				ELSE
					UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
				END IF;
			END IF;
			
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
	
			SET _in_stock_id=0;
			IF _import_organization_id > 0 THEN
				SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_import_organization_id AND vendor_id=_vendor_id;
				IF _in_stock_id=0 THEN
					INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _import_organization_id, _vendor_id, -_actual_quantity);
				ELSE
					UPDATE lpg_in_stock SET in_stock=in_stock - _actual_quantity WHERE id=_in_stock_id;
				END IF;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTransportService`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _customer VARCHAR(255)
	, IN _in_quantity double, IN _out_quantity double, IN _price DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM transport_service AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_vendor_id<>_vendor_id OR _old_account_id<>_account_id OR _old_debt<>_debt OR _old_paid<>_paid THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- vendor_in_stock
			SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND vendor_id=_old_vendor_id;
			UPDATE vendor_in_stock SET transport_amount=transport_amount - _old_debt WHERE id=_in_stock_id;
			
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
				INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, transport_amount) VALUES (_date, _organization_id, _vendor_id, _debt);
			ELSE
				UPDATE vendor_in_stock SET transport_amount=transport_amount + _debt WHERE id=_in_stock_id;
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
	
	UPDATE transport_service SET vendor_id=_vendor_id
		, customer=_customer
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, in_quantity=_in_quantity
		, out_quantity=_out_quantity
		, price=_price
		, amount=_amount
		, paid=_paid
		, debt=_debt
		, rate=_rate
		, account_id=_account_id
		, note=_note
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
	, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, in _id INT)
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
	where id=_id;
	
	update shell set `status`=_status where vendor_id=_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
