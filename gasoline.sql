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

/*Table structure for table `agency` */

DROP TABLE IF EXISTS `agency`;

CREATE TABLE `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency` */

insert  into `agency`(`id`,`name`,`address`,`phone`,`note`,`status`) values (7,'Anh Thái','','','',1);

/*Table structure for table `agency_commission` */

DROP TABLE IF EXISTS `agency_commission`;

CREATE TABLE `agency_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `commission_from` float DEFAULT NULL,
  `commission_to` float DEFAULT NULL,
  `commission` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency_commission` */

insert  into `agency_commission`(`id`,`agency_id`,`commission_from`,`commission_to`,`commission`) values (5,7,0,20,25),(6,7,20,100,0);

/*Table structure for table `agency_customer` */

DROP TABLE IF EXISTS `agency_customer`;

CREATE TABLE `agency_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency_customer` */

insert  into `agency_customer`(`id`,`agency_id`,`customer_id`) values (7,7,206),(8,7,207);

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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auto` */

insert  into `auto`(`id`,`auto_date`,`auto_name`) values (173,'2019-05-17','in_stock');

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `borrow` */

insert  into `borrow`(`id`,`code`,`created_date`,`created_employee_id`,`employee_id`,`total`,`account_id`,`note`) values (7,'20190404-BO-0001','2019-04-04',17,23,1000000,5,'');

/*Table structure for table `borrow_detail` */

DROP TABLE IF EXISTS `borrow_detail`;

CREATE TABLE `borrow_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrow_id` int(11) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `borrow_detail` */

insert  into `borrow_detail`(`id`,`borrow_id`,`pay_date`,`amount`) values (16,7,'2019-02-00',200000),(18,7,'2019-04-00',500000),(19,7,'2019-05-00',300000);

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
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account` text COLLATE utf8_unicode_ci,
  `tax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presenter_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_gas` int(1) DEFAULT '0',
  `is_petro` int(1) DEFAULT '0',
  `is_good` int(1) DEFAULT '0',
  `is_oil` int(1) DEFAULT '0',
  `commission_percentage` float DEFAULT NULL,
  `commission_kind` int(1) DEFAULT '1' COMMENT '1:chiet khau tren bill, 2:chiet khau truc tiep tren gia ban',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`code`,`name`,`organization_id`,`status`,`address`,`phone`,`bank_account`,`tax`,`presenter`,`presenter_position`,`is_gas`,`is_petro`,`is_good`,`is_oil`,`commission_percentage`,`commission_kind`) values (1,'TP','Công ty TNHH Gốm Tân Phát',1,1,'Lô số 164, Đường N1, Cụm công nghiệp Gốm sứ, Ấp 4, xã Tân Hạnh, Tp. Biên Hòa, Tỉnh Đồng Nai','0915. 87.36.37','','3603454432','Nguyễn Thị Thanh Thúy','Giám đốc',1,0,0,0,NULL,1),(2,'LPGHH','Cửa hàng LPG Huy Hoàng',1,1,'Số 125/5 ấp Phú Tâm, xã Hòa Hiệp, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','0988789713','','123456789','Nguyễn Tiến Công','Giám đốc',1,0,0,0,NULL,1),(9,'STXM','Cửa hàng Gas Sơn Trang',1,1,'Quốc lộ 55','2543777888','','','','',1,0,0,0,NULL,1),(11,'TMPB','Cửa hàng LPG Tài Mai',1,1,'','','','','','',0,0,0,0,NULL,1),(12,'ahtl','Ánh Hồng',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(13,'bbpt','Ba Bế',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(14,'bbl','Bảy Bàu Lâm',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(15,'bpb','Bắc Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(16,'hsbc','Hiền Soi Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(17,'mtlg','Mười Thuý',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(18,'thxm','Tấn Hùng',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(19,'tlpt','Thanh Liêm',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(20,'bcpb','Bé Cầu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(21,'chpb','Chí Hiếu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(22,'btpb','Bảy Thành',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(23,'bupb','Bưởi Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(24,'calg','Chị An',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(25,'capt','Carmelia Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(26,'qkxm','Quyền Kim',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(27,'ctsr','Chình Thức',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(28,'dhhb','Diệu Hiền',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(29,'dtbk','Duy Tuyên',1,1,'Bưng Kè, Xã Hoà Hiệp Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(30,'ddnth','Được Duy Nhất',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(31,'dpbc','Đại Phát',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(32,'gcbc','Gái Cường',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(33,'hbc','Hai Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(34,'hctl','Huyền Chương',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(35,'hdbk','Hoa Đào',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(36,'hhxm','Huy Hoàng Xuyên Mộc',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(37,'hhbk','Hà Hương Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(38,'hlbk','Hoàng Lịch Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(39,'hmsm','Hán Minh',1,1,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(40,'hphh','Hùng Phát',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(41,'hqpt','Hoàng Quân',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(42,'hvhb','Hoàn Vân',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(43,'kbcm','Khánh Bằng',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(44,'kclg','Kim Chi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(45,'ksbc','Kim Sương',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(46,'ktbr','Kim Trọng Bưng Riềng',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(47,'kthtl','Kim Thuý Hậu',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(48,'khhh','Kim Hoa',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(49,'lpb','Loan Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(50,'lbc','Linh Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(51,'lhbk','Lý Hải',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(52,'lpt','Liên Đội 3',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(53,'lspb','Lịch Sử',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(54,'lthh','Lài Thi',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(55,'ltsr','Long Tứ',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(56,'mcpb','Minh Châu Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(57,'mdbc','Mỹ Dung',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(58,'mdsr','Minh Điệp',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(59,'mdubc','Minh Đức',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(60,'mnbc','Mầm Non Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(61,'mtbl','Minh Tuấn',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(62,'mtlg','Minh Tú',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(63,'ndpb','Nguyễn Du',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(64,'ntbl','Nguyên Thảo',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(65,'nttt','Ngọc Tâm',1,1,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(66,'pd46','Phạm Đăng',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(67,'plbc','Phú Lộc',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(68,'pm46','Phúc Mai',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(69,'pt46','Phụng Tập',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(70,'ptsr','Phương Thảo Sông Ray',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(71,'phsm','Phú Hoàng',1,1,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(72,'pthsr','Pháp Thanh',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(73,'qhh','Quang Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(74,'qvpb','Quang Vinh',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(75,'shbl','Sỹ Hường',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(76,'shbc','Sáu Huế',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(77,'sbtr','Sanh Trại Gà',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(78,'stxm','Sơn Trang',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(79,'txm','Tùng Gas',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(80,'thh','Tâm Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(81,'tmpb','Tài Mai',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(82,'tbtr','Thanh Trại Gà',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(83,'tdbc','Thành Dung',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(84,'tdpt','Thảo Đại',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(85,'hpt','Huyền Trại Gà',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(86,'tghb','Trường Giang',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(87,'tbk','Tiên Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(88,'t46','Truyền',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',0,0,0,0,NULL,1),(89,'tmbc','Thiên Mướp',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(90,'ttpb','Thanh Tuý',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(91,'tslg','Tiến Sơn',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(92,'ttpt','Trung Thuận',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(93,'ttbc','Trung Thu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(94,'ttlg','Trung Thành',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(95,'tth','Thanh Tân Thắng',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(96,'tttt','Thành Tâm',1,1,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(97,'athh','Ái Thu',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(98,'ttbc','Tuấn Thanh',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(99,'tpt','Thanh Gò Cà Phước Thuận',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(100,'tktl','Thuỳ Khuyên',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(101,'tbk','Thơ Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(102,'thpt','Thuý Hoàng Phước Tân',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(103,'thpt','Toan Hoa',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(104,'tptl','Thuý Phương',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(105,'ttl','Thị Tân Lâm',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(106,'unpb','Út Nuôi',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(107,'vb46','Văn Bé',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(108,'vqhh','Vũ Quang',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(109,'xdbc','Xuân Đông',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(110,'xhh','Xuân Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(111,'xttl','Xuân Tú',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(112,'mhbc','Minh Hùng',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(113,'ta46','Tuấn Anh 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(114,'tth','Thuý Cầu Kiều',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(115,'dpt','Hùng Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(116,'htbk','Hương Thơm',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(117,'mpb','Mai Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(118,'ttbg','Tình Thuỷ',1,1,'Xã Bình Giã, Huyện Châu Đức, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(119,'hhhtn','Hồng Huyên',1,1,'Xã Hàm Thuận Nam, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(120,'ptpt','Phương Thảo Phan Thiết',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(121,'hhh','Huệ Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(122,'dhh','Dũng Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(123,'mhhb','Mỹ Hạnh',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(124,'htdn','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh',1,1,'39/1 Khu phố 3, Phường Tam Hiệp, Tp. Biên Hoà, Tỉnh Đồng Nai','','','3600874037','','',1,0,0,0,NULL,1),(125,'cnpt','Chi nhánh Phan Thiết',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(126,'dhh','Đoàn Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(127,'mcbc','Minh Châu Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(128,'bdqt','Bò Đốt Quang Trung',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(129,'gxbc','Giang Xuân Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(130,'vht','Vàng Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(131,'tbk','Thắng Bàu Ma Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(132,'qth','Quang Thắng Hải',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(133,'vpb','Vân Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(134,'blqt','Bán lẻ',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(135,'tbxt','Tình Bắc',1,1,'Xã Xuân Tây, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(136,'hpbk','Hiếu Phượng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(137,'hhcm','Huy Hoàng Cẩm Mỹ',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(138,'ktbc','Kiều Trang',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(139,'tbk','Trọng Cầu 5',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(140,'th10','Tạp Hoá 10',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(141,'hcbc','Huy Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(142,'qpbtr','Quốc Phong',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(143,'hcplg','Hùng Cường Phát',1,1,'Xã Long Giao, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(144,'tnbk','Tuyết Nhi',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(145,'mhxm','Minh Hiền',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(146,'dpxd','Dũng Phượng',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(147,'c46','Cường 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(148,'athtn','Gas An Toàn Hàm Thuận Nam',1,1,'Thôn Lập Đức, Xã Tân Lập, Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(149,'dhh','Diễm Đội 2 Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(150,'pnbk','Phúc Nguyên',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(151,'hhh','Hoa Đội 2',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(152,'spo','Công ty TNHH Supor Việt Nam',1,1,'Lô A-1-CN, KCN Mỹ Phước, phường Mỹ Phước, Thị Xã Bến Cát, Tỉnh Bình Dương','','','','','',1,0,0,0,NULL,1),(153,'thsr','Thanh Hà',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(154,'sbk','Sơn Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(155,'hhb','Hoà Hoà Bình',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(156,'nhbtr','Ngọc Huyền',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(157,'htbc','Huyền Trang',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(158,'ttlg','Thanh Tuấn Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(159,'hpbr','Hương Phong Hồ Cốc',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(160,'anbk','Ánh Nhi',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(161,'nhcm','Nở Hoài',1,1,'Xã Hoàn Quân, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(162,'thxm','Triệu Huy',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(163,'ybtr','Tạp hoá Yến',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(164,'hbr','Hà Bưng Riềng',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(165,'tha','Công ty TNHH Dầu Khí Thiên Hà',1,1,'95 Trịnh Đình Thảo, phường Phú Trung, quận Tân Phú, Tp. HCM','','','','','',1,0,0,0,NULL,1),(166,'ltl','Loan Tân Lâm',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(167,'nvqt','Nhân Viên Quang Trung',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(168,'dpt','Dung Cây Điệp',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(169,'pppt','Phương Phát',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(170,'udpt','Uyên Đan',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(171,'htcm','Hà Tuấn Cẩm Mỹ',1,1,'Xã Xuân Bảo, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(172,'ntlg','Ngọc Tân Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(173,'h46','Hoè Trại Gà 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(174,'vuc','Công ty TNHH Khí Hoá Lỏng Việt Úc',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(175,'alcm','Ánh Linh',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(176,'hbchau','Hải Bình Châu Xuyên Mộc',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(177,'thcm','Trí Hải',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(178,'mphh','Minh Phương',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(179,'qclg','Quang Châu',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(180,'hhh','Hồng Đội 5',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(181,'thh','Tuyết Đội 2',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(182,'athtb','Gas An Toàn Hàm Thuận Bắc',1,1,'Xã Hàm Thắng, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(183,'ttbl','Thảo Toàn',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(184,'kacm','Kim Anh',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(185,'bpcm','Bảy Phước',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(186,'hhh','Hiền Đội 5',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(187,'bapb','Bình An',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(188,'bmpb','Bình Minh Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(189,'xhtb','Gas Xuân Hàm Thuận Bắc',1,1,'Thị trấn Phú Long, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(190,'vcm','Gas Vui',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(191,'hbc','Ngọc Hà Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(192,'klhtn','Kim Liên',1,1,'Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(193,'hlcm','Hải Linh',1,1,'Xã Lâm San, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1),(194,'mtbc','Minh Trọng',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(195,'tlg','Tuấn Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(196,'hpt','Cô Hương Phước Tân',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(197,'kthi','Kế Thi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1),(198,'dbc','Đoàn Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(199,'adung','Anh Dũng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(200,'hdung','Hoa Dũng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(201,'chue','Chị Huế Châu Đức',1,1,'','','','','','',1,0,0,0,NULL,1),(202,'ttung','Thanh Tùng Châu Đức',1,1,'Châu Đức, Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1),(203,'bhoan','Bảo Hoan Châu Đức',1,1,'','','','','','',1,0,0,0,NULL,1),(204,'hnghia','Hiếu Nghĩa',1,1,'','','','','','',1,0,0,0,NULL,1),(205,'QT','Công ty TNHH Quang Trung',14,1,'','','','','','',1,0,0,0,NULL,1),(206,'11','22',1,1,'88','33','77','44','55','66',0,0,0,1,15,1),(207,'33','33',1,1,'','','','','','',0,0,0,1,25,1);

/*Table structure for table `customer_discount_detail` */

DROP TABLE IF EXISTS `customer_discount_detail`;

CREATE TABLE `customer_discount_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_discount_detail` */

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
) ENGINE=InnoDB AUTO_INCREMENT=57264 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_in_stock` */

insert  into `customer_in_stock`(`id`,`day`,`customer_id`,`shell_12`,`shell_45`,`amount`,`transport_amount`) values (57009,'2019-05-17',1,0,0,0,0),(57010,'2019-05-17',2,0,0,0,0),(57011,'2019-05-17',9,0,0,0,0),(57012,'2019-05-17',11,0,0,0,0),(57013,'2019-05-17',12,0,0,0,0),(57014,'2019-05-17',13,0,0,0,0),(57015,'2019-05-17',14,0,0,0,0),(57016,'2019-05-17',15,0,0,0,0),(57017,'2019-05-17',16,0,0,0,0),(57018,'2019-05-17',17,0,0,0,0),(57019,'2019-05-17',18,0,0,0,0),(57020,'2019-05-17',19,0,0,0,0),(57021,'2019-05-17',20,0,0,0,0),(57022,'2019-05-17',21,0,0,0,0),(57023,'2019-05-17',22,0,0,0,0),(57024,'2019-05-17',23,0,0,0,0),(57025,'2019-05-17',24,0,0,0,0),(57026,'2019-05-17',25,0,0,0,0),(57027,'2019-05-17',26,0,0,0,0),(57028,'2019-05-17',27,0,0,0,0),(57029,'2019-05-17',28,0,0,0,0),(57030,'2019-05-17',29,0,0,0,0),(57031,'2019-05-17',30,0,0,0,0),(57032,'2019-05-17',31,0,0,0,0),(57033,'2019-05-17',32,0,0,0,0),(57034,'2019-05-17',33,0,0,0,0),(57035,'2019-05-17',34,0,0,0,0),(57036,'2019-05-17',35,0,0,0,0),(57037,'2019-05-17',36,0,0,0,0),(57038,'2019-05-17',37,0,0,0,0),(57039,'2019-05-17',38,0,0,0,0),(57040,'2019-05-17',39,0,0,0,0),(57041,'2019-05-17',40,0,0,0,0),(57042,'2019-05-17',41,0,0,0,0),(57043,'2019-05-17',42,0,0,0,0),(57044,'2019-05-17',43,0,0,0,0),(57045,'2019-05-17',44,0,0,0,0),(57046,'2019-05-17',45,0,0,0,0),(57047,'2019-05-17',46,0,0,0,0),(57048,'2019-05-17',47,0,0,0,0),(57049,'2019-05-17',48,0,0,0,0),(57050,'2019-05-17',49,0,0,0,0),(57051,'2019-05-17',50,0,0,0,0),(57052,'2019-05-17',51,0,0,0,0),(57053,'2019-05-17',52,0,0,0,0),(57054,'2019-05-17',53,0,0,0,0),(57055,'2019-05-17',54,0,0,0,0),(57056,'2019-05-17',55,0,0,0,0),(57057,'2019-05-17',56,0,0,0,0),(57058,'2019-05-17',57,0,0,0,0),(57059,'2019-05-17',58,0,0,0,0),(57060,'2019-05-17',59,0,0,0,0),(57061,'2019-05-17',60,0,0,0,0),(57062,'2019-05-17',61,0,0,0,0),(57063,'2019-05-17',62,0,0,0,0),(57064,'2019-05-17',63,0,0,0,0),(57065,'2019-05-17',64,0,0,0,0),(57066,'2019-05-17',65,0,0,0,0),(57067,'2019-05-17',66,0,0,0,0),(57068,'2019-05-17',67,0,0,0,0),(57069,'2019-05-17',68,0,0,0,0),(57070,'2019-05-17',69,0,0,0,0),(57071,'2019-05-17',70,0,0,0,0),(57072,'2019-05-17',71,0,0,0,0),(57073,'2019-05-17',72,0,0,0,0),(57074,'2019-05-17',73,0,0,0,0),(57075,'2019-05-17',74,0,0,0,0),(57076,'2019-05-17',75,0,0,0,0),(57077,'2019-05-17',76,0,0,0,0),(57078,'2019-05-17',77,0,0,0,0),(57079,'2019-05-17',78,0,0,0,0),(57080,'2019-05-17',79,0,0,0,0),(57081,'2019-05-17',80,0,0,0,0),(57082,'2019-05-17',81,0,0,0,0),(57083,'2019-05-17',82,0,0,0,0),(57084,'2019-05-17',83,0,0,0,0),(57085,'2019-05-17',84,0,0,0,0),(57086,'2019-05-17',85,0,0,0,0),(57087,'2019-05-17',86,0,0,0,0),(57088,'2019-05-17',87,0,0,0,0),(57089,'2019-05-17',88,0,0,0,0),(57090,'2019-05-17',89,0,0,0,0),(57091,'2019-05-17',90,0,0,0,0),(57092,'2019-05-17',91,0,0,0,0),(57093,'2019-05-17',92,0,0,0,0),(57094,'2019-05-17',93,0,0,0,0),(57095,'2019-05-17',94,0,0,0,0),(57096,'2019-05-17',95,0,0,0,0),(57097,'2019-05-17',96,0,0,0,0),(57098,'2019-05-17',97,0,0,0,0),(57099,'2019-05-17',98,0,0,0,0),(57100,'2019-05-17',99,0,0,0,0),(57101,'2019-05-17',100,0,0,0,0),(57102,'2019-05-17',101,0,0,0,0),(57103,'2019-05-17',102,0,0,0,0),(57104,'2019-05-17',103,0,0,0,0),(57105,'2019-05-17',104,0,0,0,0),(57106,'2019-05-17',105,0,0,0,0),(57107,'2019-05-17',106,0,0,0,0),(57108,'2019-05-17',107,0,0,0,0),(57109,'2019-05-17',108,0,0,-10000,0),(57110,'2019-05-17',109,0,0,0,0),(57111,'2019-05-17',110,0,0,0,0),(57112,'2019-05-17',111,0,0,0,0),(57113,'2019-05-17',112,0,0,0,0),(57114,'2019-05-17',113,0,0,0,0),(57115,'2019-05-17',114,0,0,0,0),(57116,'2019-05-17',115,0,0,0,0),(57117,'2019-05-17',116,0,0,0,0),(57118,'2019-05-17',117,0,0,0,0),(57119,'2019-05-17',118,0,0,0,0),(57120,'2019-05-17',119,0,0,0,0),(57121,'2019-05-17',120,0,0,0,0),(57122,'2019-05-17',121,0,0,0,0),(57123,'2019-05-17',122,0,0,0,0),(57124,'2019-05-17',123,0,0,0,0),(57125,'2019-05-17',124,0,0,0,0),(57126,'2019-05-17',125,0,0,0,0),(57127,'2019-05-17',126,0,0,0,0),(57128,'2019-05-17',127,0,0,0,0),(57129,'2019-05-17',128,0,0,0,0),(57130,'2019-05-17',129,0,0,0,0),(57131,'2019-05-17',130,0,0,-6000,0),(57132,'2019-05-17',131,0,0,0,0),(57133,'2019-05-17',132,0,0,0,0),(57134,'2019-05-17',133,0,0,0,0),(57135,'2019-05-17',134,0,0,0,0),(57136,'2019-05-17',135,0,0,0,0),(57137,'2019-05-17',136,0,0,0,0),(57138,'2019-05-17',137,0,0,0,0),(57139,'2019-05-17',138,0,0,0,0),(57140,'2019-05-17',139,0,0,0,0),(57141,'2019-05-17',140,0,0,0,0),(57142,'2019-05-17',141,0,0,0,0),(57143,'2019-05-17',142,0,0,0,0),(57144,'2019-05-17',143,0,0,0,0),(57145,'2019-05-17',144,0,0,0,0),(57146,'2019-05-17',145,0,0,0,0),(57147,'2019-05-17',146,0,0,0,0),(57148,'2019-05-17',147,0,0,0,0),(57149,'2019-05-17',148,0,0,0,0),(57150,'2019-05-17',149,0,0,0,0),(57151,'2019-05-17',150,0,0,0,0),(57152,'2019-05-17',151,0,0,0,0),(57153,'2019-05-17',152,0,0,0,0),(57154,'2019-05-17',153,0,0,0,0),(57155,'2019-05-17',154,0,0,0,0),(57156,'2019-05-17',155,0,0,0,0),(57157,'2019-05-17',156,0,0,0,0),(57158,'2019-05-17',157,0,0,0,0),(57159,'2019-05-17',158,0,0,0,0),(57160,'2019-05-17',159,0,0,0,0),(57161,'2019-05-17',160,0,0,0,0),(57162,'2019-05-17',161,0,0,0,0),(57163,'2019-05-17',162,0,0,0,0),(57164,'2019-05-17',163,0,0,0,0),(57165,'2019-05-17',164,0,0,0,0),(57166,'2019-05-17',165,0,0,0,0),(57167,'2019-05-17',166,0,0,0,0),(57168,'2019-05-17',167,0,0,0,0),(57169,'2019-05-17',168,0,0,0,0),(57170,'2019-05-17',169,0,0,0,0),(57171,'2019-05-17',170,0,0,0,0),(57172,'2019-05-17',171,0,0,0,0),(57173,'2019-05-17',172,0,0,0,0),(57174,'2019-05-17',173,0,0,0,0),(57175,'2019-05-17',174,0,0,0,0),(57176,'2019-05-17',175,0,0,0,0),(57177,'2019-05-17',176,0,0,0,0),(57178,'2019-05-17',177,0,0,0,0),(57179,'2019-05-17',178,0,0,0,0),(57180,'2019-05-17',179,0,0,0,0),(57181,'2019-05-17',180,0,0,0,0),(57182,'2019-05-17',181,0,0,0,0),(57183,'2019-05-17',182,0,0,0,0),(57184,'2019-05-17',183,0,0,0,0),(57185,'2019-05-17',184,0,0,0,0),(57186,'2019-05-17',185,0,0,0,0),(57187,'2019-05-17',186,0,0,0,0),(57188,'2019-05-17',187,0,0,0,0),(57189,'2019-05-17',188,0,0,0,0),(57190,'2019-05-17',189,0,0,0,0),(57191,'2019-05-17',190,0,0,0,0),(57192,'2019-05-17',191,0,0,0,0),(57193,'2019-05-17',192,0,0,0,0),(57194,'2019-05-17',193,0,0,0,0),(57195,'2019-05-17',194,0,0,0,0),(57196,'2019-05-17',195,0,0,0,0),(57197,'2019-05-17',196,0,0,0,0),(57198,'2019-05-17',197,0,0,0,0),(57199,'2019-05-17',198,0,0,0,0),(57200,'2019-05-17',199,0,0,0,0),(57201,'2019-05-17',200,0,0,0,0),(57202,'2019-05-17',201,0,0,0,0),(57203,'2019-05-17',202,0,0,0,0),(57204,'2019-05-17',203,0,0,0,0),(57205,'2019-05-17',204,0,0,0,0),(57206,'2019-05-17',205,0,0,0,0),(57207,'2019-05-17',206,0,0,0,0),(57208,'2019-05-17',207,0,0,8580880,0);

/*Table structure for table `dayoff` */

DROP TABLE IF EXISTS `dayoff`;

CREATE TABLE `dayoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dayoff` */

insert  into `dayoff`(`id`,`name`,`organization_id`,`note`) values (2,'Tết dương lịch',1,''),(3,'Đi làm 29 tết',1,''),(4,'Giổ tỗ Hùng Vương',1,'');

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

insert  into `debug`(`note`) values ('1'),('1'),('9'),('44'),('60'),('1'),('2'),('8'),('42'),('20'),('1'),('3'),('10'),('45'),('30');

/*Table structure for table `discount_oil` */

DROP TABLE IF EXISTS `discount_oil`;

CREATE TABLE `discount_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `discount_oil` */

insert  into `discount_oil`(`id`,`code`,`name`,`note`) values (2,NULL,'CK1','Chiết khấu 1'),(3,NULL,'Ht5k','Hỗ trợ 5k'),(4,NULL,'CK2','Chiết khấu 2');

/*Table structure for table `discount_oil_detail` */

DROP TABLE IF EXISTS `discount_oil_detail`;

CREATE TABLE `discount_oil_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `discount_oil_detail` */

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field` */

insert  into `dynamic_field`(`id`,`code`,`name`,`organization_id`,`table_name`,`can_edit`,`free_value_id`) values (1,'DAYOFFINYEAR','Số ngày phép trong năm',1,'employee',0,1),(2,'SATURDAY','Làm ngày thứ 7',1,'employee',0,2),(3,'SENIALLOW','Thưởng thâm niên (%)',1,'employee',0,3),(4,'DAYOFFINYEAR','Số ngày phép trong năm',14,'employee',0,4),(5,'SATURDAY','Làm ngày thứ 7',14,'employee',0,5),(6,'SENIALLOW','Thưởng thâm niên (%)',14,'employee',0,6),(7,'TDHV','Trình độ học vấn',1,'employee',1,0),(12,'PC','Phụ cấp',1,'salary',1,0),(13,'TN','Trách nhiệm',1,'salary',1,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_value` */

insert  into `dynamic_field_value`(`id`,`field_id`,`parent_id`,`value`) values (1,1,17,'12'),(2,2,17,'1'),(3,3,17,'2'),(4,7,17,'Cao Đẳng'),(5,4,18,'13'),(6,5,18,'0.5'),(7,6,18,'1'),(8,1,19,'12'),(9,2,19,'1'),(10,3,19,'2'),(11,7,19,''),(12,1,20,'12'),(13,2,20,'1'),(14,3,20,'2'),(15,7,20,''),(16,1,20,'12'),(17,2,20,'1'),(18,3,20,'2'),(19,7,20,''),(20,1,21,'12'),(21,2,21,'1'),(22,3,21,'2'),(23,7,21,''),(24,1,21,'12'),(25,2,21,'1'),(26,3,21,'2'),(27,7,21,''),(28,1,21,'12'),(29,2,21,'1'),(30,3,21,'2'),(31,7,21,''),(32,1,18,'12'),(33,2,18,'1'),(34,3,18,'2'),(35,7,18,''),(36,1,0,'12'),(37,2,0,'1'),(38,3,0,'2'),(39,7,0,''),(40,1,23,'12'),(41,2,23,'1'),(42,3,23,'2'),(43,7,23,''),(44,1,23,'12'),(45,2,23,'1'),(46,3,23,'2'),(47,7,23,''),(48,1,24,'12'),(49,2,24,'1'),(50,3,24,'2'),(51,7,24,''),(52,1,25,'12'),(53,2,25,'1'),(54,3,25,'2'),(55,7,25,''),(56,1,26,'12'),(57,2,26,'1'),(58,3,26,'2'),(59,7,26,''),(60,1,32,'12'),(61,2,32,'1'),(62,3,32,'2'),(63,7,32,''),(64,4,42,'13'),(65,5,42,'0.5'),(66,6,42,'1'),(67,1,33,'12'),(68,2,33,'1'),(69,3,33,'2'),(70,7,33,'');

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
  `start_date` date DEFAULT NULL,
  `salary_bhxh` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`id`,`idcard`,`fullname`,`email`,`salary`,`organization_id`,`birthday`,`status`,`start_date`,`salary_bhxh`) values (1,NULL,'Admin','admin@gmail.com',0,-1,'2018-08-23',1,NULL,NULL),(19,'171192314','Cao Thị Minh','c@gmail.com',0,1,NULL,1,NULL,NULL),(18,NULL,'Lê Ngọc Phước','ntb@gmail.com',2000000,14,'1980-01-15',1,'2000-01-01',NULL),(17,'045082000026','Phan Khắc Hùng','hungpk.quangtrung@gmail.com',7300000,1,'1982-11-17',1,'2014-01-01',NULL),(20,'273075081','Cao Phi Hùng','hungtat@gmail.com',5300000,1,'1982-01-23',1,'2014-01-01',NULL),(21,'171347560','Cao Thị Sáng','',4800000,1,'1968-01-13',1,NULL,NULL),(23,'172430427','Phạm Văn Sơn','a@a.com',5800000,1,'1981-09-17',1,'2014-01-01',NULL),(24,'273399388','Đoàn Xuân Vũ','',0,1,'1990-03-10',1,NULL,NULL),(25,'273463776','Lê Ngọc Phước','',5300000,1,'1984-03-16',1,NULL,NULL),(26,'273571217','Nguyễn Minh Trung','',4800000,1,'1994-10-09',1,NULL,NULL),(27,'273577993','Mai Văn Thừa','',4800000,1,'1994-01-16',1,NULL,NULL),(28,'273140291','Nguyễn Hữu Quốc Hưng','',5300000,1,'1984-07-08',1,NULL,NULL),(29,'171075650','Cao Văn Kính','',4800000,1,'1963-10-26',1,NULL,NULL),(30,'273437479','Lê Hoàng Phước','',4800000,1,'1990-03-20',1,NULL,NULL),(31,'07708400063','Cao Huy Hoàng','',0,1,'1984-10-28',1,NULL,NULL),(32,'04008200037','Đặng Quang Thắng Bảy','',6300000,1,'1982-02-23',2,NULL,NULL),(33,'273508376','Trần Thanh Nam','',4800000,1,'1992-10-19',1,NULL,3800000),(34,'273651458','Nguyễn Thanh Hiền','',4800000,1,'1993-12-16',1,NULL,NULL),(35,'273288034','Lê Thị Khánh Linh','',5300000,1,'1988-07-04',1,NULL,NULL),(36,'273211619','Nguyễn Đức Tuấn','',5300000,1,'1988-02-15',1,NULL,NULL),(37,'02418400067','Hoàng Thị Lan Thuý','',3307000,1,'1984-09-22',1,NULL,NULL),(38,'162712864','Nguyễn Tiến Lãng','',6300000,1,'1985-11-06',1,NULL,NULL),(39,'273048894','Nguyễn Thanh Dũng','',5300000,1,'1969-03-15',1,NULL,NULL),(40,'273148634','Tạ Thị Kim Lộc','',5300000,1,'1985-01-02',1,NULL,NULL),(41,'273651568','Phạm Ngọc Phước Phi','',4800000,1,'1994-07-20',1,NULL,NULL),(42,'12345679','Nguyễn Phương Trình','',0,14,NULL,1,NULL,NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_advance` */

insert  into `employee_advance`(`id`,`code`,`employee_id`,`advance_date`,`amount`,`account_id`,`note`,`created_employee_id`,`inner_sale_id`) values (8,'20190330-SI-0002_aut',17,'2019-03-29',100000,5,'a',17,7),(10,'20190404-EA-0001',23,'2019-04-03',600000,5,'',17,0);

/*Table structure for table `employee_off` */

DROP TABLE IF EXISTS `employee_off`;

CREATE TABLE `employee_off` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `actual_off_day` float DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_off` */

insert  into `employee_off`(`id`,`code`,`created_date`,`employee_id`,`from_date`,`to_date`,`actual_off_day`,`note`,`created_employee_id`) values (1,'20190401-EA-0001','2019-03-22',17,'2019-03-23','2019-03-23',1,'',17),(2,'20190401-EA-0002','2019-03-26',17,'2019-03-26','2019-03-29',3,'',17),(4,'20190402-EA-0001','2019-04-02',40,'2019-04-02','2019-04-02',0.5,'',17);

/*Table structure for table `employee_off_increase` */

DROP TABLE IF EXISTS `employee_off_increase`;

CREATE TABLE `employee_off_increase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `dayoff_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_off_increase` */

insert  into `employee_off_increase`(`id`,`code`,`created_date`,`employee_id`,`dayoff_id`,`quantity`,`note`,`created_employee_id`) values (1,'20190330-EI-0001','2019-03-30',40,4,2,'',17),(2,'20190330-EI-0002','2019-03-30',23,4,2,'',17),(3,'20190330-EI-0003','2019-03-30',41,4,2,'',17),(4,'20190330-EI-0004','2019-03-30',38,4,2,'',17),(5,'20190401-EI-0001','2019-03-29',17,4,1,'',17),(6,'20190401-EI-0002','2019-03-21',17,2,2,'',17);

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

/*Table structure for table `employee_oil_commission` */

DROP TABLE IF EXISTS `employee_oil_commission`;

CREATE TABLE `employee_oil_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_oil_commission` */

insert  into `employee_oil_commission`(`id`,`name`,`amount`,`note`) values (2,'3,000',3000,''),(3,'5,000',5000,'');

/*Table structure for table `employee_other_bonus` */

DROP TABLE IF EXISTS `employee_other_bonus`;

CREATE TABLE `employee_other_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `other_bonus_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_other_bonus` */

insert  into `employee_other_bonus`(`id`,`code`,`created_date`,`employee_id`,`other_bonus_id`,`amount`,`note`,`created_employee_id`) values (2,'20190331-EI-0001','2019-03-30',17,4,1000000,'a',17);

/*Table structure for table `employee_panelty` */

DROP TABLE IF EXISTS `employee_panelty`;

CREATE TABLE `employee_panelty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `panelty_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_panelty` */

insert  into `employee_panelty`(`id`,`code`,`created_date`,`employee_id`,`panelty_id`,`amount`,`note`,`created_employee_id`) values (2,'20190331-EI-0001','2019-03-28',17,2,400000,'b',17);

/*Table structure for table `employee_route_fee` */

DROP TABLE IF EXISTS `employee_route_fee`;

CREATE TABLE `employee_route_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `in_quantity` double DEFAULT NULL,
  `out_quantity` double DEFAULT NULL,
  `param_100km` int(3) DEFAULT NULL,
  `param_1000kg` int(3) DEFAULT NULL,
  `total_quantity` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `store` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_route_fee` */

insert  into `employee_route_fee`(`id`,`code`,`created_date`,`created_employee_id`,`employee_id`,`vehicle_id`,`route_id`,`in_quantity`,`out_quantity`,`param_100km`,`param_1000kg`,`total_quantity`,`price`,`amount`,`store`,`note`) values (3,'20190402-ER-0001','2019-04-23',17,23,6,4,11730,11740,28,1,51,14900,759900,'',''),(4,'20190403-ER-0001','2019-04-03',17,23,6,3,12060,11910,28,1,43,14900,640700,'','VC Vimexco');

/*Table structure for table `employee_salary` */

DROP TABLE IF EXISTS `employee_salary`;

CREATE TABLE `employee_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary_month` int(2) DEFAULT NULL,
  `salary_year` int(5) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `real_salary` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `month_day` int(2) DEFAULT NULL,
  `working_day` int(2) DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `advance` double DEFAULT NULL,
  `bhxh` double DEFAULT NULL,
  `actual_received` double DEFAULT NULL,
  `panelty` double DEFAULT NULL,
  `seniority` double DEFAULT NULL COMMENT 'tien tham nien',
  `field_amount` double DEFAULT NULL,
  `timesheet_amount` double DEFAULT NULL,
  `trip_allowance` double DEFAULT NULL COMMENT 'phu cap duong di',
  `oil_salary` double DEFAULT NULL COMMENT 'dau khoan',
  `trip_oil` double DEFAULT NULL COMMENT 'ung dau',
  `trip_fee` double DEFAULT NULL COMMENT 'chi phi xe',
  `borrow` double DEFAULT NULL COMMENT 'muon luong',
  `borrow_rest` double DEFAULT NULL COMMENT 'muon luong con lai',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary` */

insert  into `employee_salary`(`id`,`code`,`salary_month`,`salary_year`,`employee_id`,`created_date`,`basic_salary`,`real_salary`,`total`,`month_day`,`working_day`,`commission`,`bonus`,`advance`,`bhxh`,`actual_received`,`panelty`,`seniority`,`field_amount`,`timesheet_amount`,`trip_allowance`,`oil_salary`,`trip_oil`,`trip_fee`,`borrow`,`borrow_rest`) values (82,'20190404-ES-0001',4,2019,1,'2019-04-03',0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(83,'20190404-ES-0002',4,2019,19,'2019-04-03',0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(84,'20190404-ES-0003',4,2019,18,'2019-04-03',2000000,2000000,2360000,3,3,0,0,0,0,2360000,0,360000,0,0,0,0,0,0,0,0),(85,'20190404-ES-0004',4,2019,17,'2019-04-03',7300000,7300000,7592000,3,3,0,0,0,0,7592000,0,292000,0,0,0,0,0,0,0,0),(86,'20190404-ES-0005',4,2019,20,'2019-04-03',5300000,5300000,5512000,3,3,0,0,0,0,5512000,0,212000,0,0,0,0,0,0,0,0),(87,'20190404-ES-0006',4,2019,21,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(88,'20190404-ES-0007',4,2019,23,'2019-04-03',5800000,5800000,8569471,3,3,0,0,600000,0,983471,0,232000,1000000,0,140000,1397471,9046000,2560000,500000,300000),(89,'20190404-ES-0008',4,2019,24,'2019-04-03',0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(90,'20190404-ES-0009',4,2019,25,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(91,'20190404-ES-0010',4,2019,26,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(92,'20190404-ES-0011',4,2019,27,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(93,'20190404-ES-0012',4,2019,28,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(94,'20190404-ES-0013',4,2019,29,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(95,'20190404-ES-0014',4,2019,30,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(96,'20190404-ES-0015',4,2019,31,'2019-04-03',0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(97,'20190404-ES-0016',4,2019,32,'2019-04-03',6300000,6300000,6300000,3,3,0,0,0,0,6300000,0,0,0,0,0,0,0,0,0,0),(98,'20190404-ES-0017',4,2019,33,'2019-04-03',4800000,4800000,5800000,3,3,0,0,0,399000,5401000,0,0,1000000,0,0,0,0,0,0,0),(99,'20190404-ES-0018',4,2019,34,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(100,'20190404-ES-0019',4,2019,35,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(101,'20190404-ES-0020',4,2019,36,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(102,'20190404-ES-0021',4,2019,37,'2019-04-03',3307000,3307000,3307000,3,3,0,0,0,0,3307000,0,0,0,0,0,0,0,0,0,0),(103,'20190404-ES-0022',4,2019,38,'2019-04-03',6300000,6300000,6300000,3,3,0,0,0,0,6300000,0,0,0,0,0,0,0,0,0,0),(104,'20190404-ES-0023',4,2019,39,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(105,'20190404-ES-0024',4,2019,40,'2019-04-03',5300000,5300000,5300000,3,3,0,0,0,0,5300000,0,0,0,0,0,0,0,0,0,0),(106,'20190404-ES-0025',4,2019,41,'2019-04-03',4800000,4800000,4800000,3,3,0,0,0,0,4800000,0,0,0,0,0,0,0,0,0,0),(107,'20190404-ES-0026',4,2019,42,'2019-04-03',0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*Table structure for table `employee_salary_field` */

DROP TABLE IF EXISTS `employee_salary_field`;

CREATE TABLE `employee_salary_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_field` */

insert  into `employee_salary_field`(`id`,`employee_id`,`field_id`,`amount`) values (1,33,12,500000),(2,33,13,500000),(3,23,12,300000),(4,23,13,700000);

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_field_detail` */

insert  into `employee_salary_field_detail`(`id`,`employee_salary_id`,`field_id`,`field_name`,`amount`,`note`) values (17,88,12,'Phụ cấp',300000,''),(18,88,13,'Trách nhiệm',700000,''),(19,98,12,'Phụ cấp',500000,''),(20,98,13,'Trách nhiệm',500000,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_detail` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_fee_detail` */

insert  into `gas_wholesale_fee_detail`(`id`,`gas_wholesale_id`,`fee_id`,`kind`,`amount`,`note`) values (1,53,1,1,2000,'a');

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
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_in_stock` */

insert  into `good_in_stock`(`id`,`day`,`good_id`,`organization_id`,`store_id`,`in_stock`) values (751,'2019-05-17',1,1,7,0),(752,'2019-05-17',2,1,7,0),(753,'2019-05-17',3,1,7,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_in_stock` */

insert  into `lpg_in_stock`(`id`,`organization_id`,`vendor_id`,`day`,`in_stock`) values (1235,1,15,'2019-05-17',0),(1236,1,16,'2019-05-17',0),(1237,1,22,'2019-05-17',0),(1238,14,15,'2019-05-17',0),(1239,14,23,'2019-05-17',0),(1240,1,23,'2019-05-17',0),(1241,14,22,'2019-05-17',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `money_in_stock` */

insert  into `money_in_stock`(`id`,`day`,`account_id`,`organization_id`,`in_stock`) values (1185,'2019-05-17',4,1,0),(1186,'2019-05-17',5,1,-1633100),(1187,'2019-05-17',7,14,0),(1188,'2019-05-17',8,14,0),(1189,'2019-05-17',9,1,0),(1190,'2019-05-17',10,1,0);

/*Table structure for table `oil` */

DROP TABLE IF EXISTS `oil`;

CREATE TABLE `oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `weight_unit_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `employee_commission_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  `organization_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil` */

insert  into `oil`(`id`,`code`,`name`,`vendor_id`,`group_id`,`weight_unit_id`,`weight`,`base_unit_id`,`sale_unit_id`,`employee_commission_id`,`status`,`organization_id`,`price`) values (1,'NW74','NIWA 15W-40 - 4L PT',20,1,5,4,4,6,2,1,1,100000),(2,'NW82','NIWA OIL DIESEL 15W-40 - 18L PT',20,2,5,18,10,10,3,1,1,200000),(3,'NW83','NIWA OIL DIESEL 15W-40 - 200L PT',20,2,5,200,12,9,3,1,1,300000);

/*Table structure for table `oil_group` */

DROP TABLE IF EXISTS `oil_group`;

CREATE TABLE `oil_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa,1:dang hoat dong',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_group` */

insert  into `oil_group`(`id`,`name`,`note`,`status`) values (1,'Dầu động cơ','',1),(2,'Niwa Oil','',1);

/*Table structure for table `oil_import` */

DROP TABLE IF EXISTS `oil_import`;

CREATE TABLE `oil_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `total_before_commission` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_import` */

insert  into `oil_import`(`id`,`code`,`created_date`,`vendor_id`,`store_id`,`commission`,`rate`,`total_before_commission`,`total`,`paid`,`debt`,`account_id`,`note`,`created_employee_id`) values (1,'20190518-OI-0001','2019-05-17',20,8,43,0,140000000,79800000,0,79800000,5,'',17);

/*Table structure for table `oil_import_detail` */

DROP TABLE IF EXISTS `oil_import_detail`;

CREATE TABLE `oil_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_import_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_import_detail` */

insert  into `oil_import_detail`(`id`,`oil_import_id`,`oil_id`,`unit_id`,`quantity`,`price`,`amount`,`note`) values (1,1,1,6,100,100000,10000000,NULL),(2,1,2,10,200,200000,40000000,NULL),(3,1,3,9,300,300000,90000000,NULL);

/*Table structure for table `oil_in_stock` */

DROP TABLE IF EXISTS `oil_in_stock`;

CREATE TABLE `oil_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_in_stock` */

insert  into `oil_in_stock`(`id`,`day`,`oil_id`,`organization_id`,`store_id`,`in_stock`) values (41,'2019-05-17',1,1,8,600),(42,'2019-05-17',2,1,8,178),(43,'2019-05-17',3,1,8,300),(44,'2019-05-17',1,1,9,-66),(45,'2019-05-17',3,1,10,-33);

/*Table structure for table `oil_sale` */

DROP TABLE IF EXISTS `oil_sale`;

CREATE TABLE `oil_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `commission` float DEFAULT '0' COMMENT 'ty le chiet khau',
  `commission_kind` int(11) DEFAULT '1' COMMENT '1:chiet khau tren hoa don, 2:chiet khau truc tiep tren gia ban',
  `commission_amount` double DEFAULT '0' COMMENT 'chiet khau theo khach hang',
  `gap_agency_amount` double DEFAULT '0' COMMENT 'tong tien chenh lech cua dai ly',
  `gap_customer_amount` double DEFAULT '0' COMMENT 'tong tien chenh lech cua khach hang',
  `total_before_commission` double DEFAULT '0' COMMENT 'tong tien truoc chiet khau',
  `total` double DEFAULT '0' COMMENT 'tong tien sau chiet khau',
  `discount` double DEFAULT '0',
  `total_pay` double DEFAULT '0',
  `paid` double DEFAULT '0',
  `debt` double DEFAULT '0',
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale` */

insert  into `oil_sale`(`id`,`code`,`created_date`,`customer_id`,`commission`,`commission_kind`,`commission_amount`,`gap_agency_amount`,`gap_customer_amount`,`total_before_commission`,`total`,`discount`,`total_pay`,`paid`,`debt`,`account_id`,`note`,`created_employee_id`) values (8,'20190518-SO-0001','2019-05-17',207,25,1,262720,600,600,0,780080,0,780080,0,780080,5,'',17),(9,'20190518-SO-0002','2019-05-17',207,25,1,2627200,600,600,0,7800800,0,7800800,0,7800800,5,'',17);

/*Table structure for table `oil_sale_detail` */

DROP TABLE IF EXISTS `oil_sale_detail`;

CREATE TABLE `oil_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_sale_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price_before_commission` double DEFAULT '0',
  `commission_price` float DEFAULT '0' COMMENT 'chiet khau truc tiep tren gia',
  `price` double DEFAULT '0',
  `first_amount` double DEFAULT '0',
  `commission` float DEFAULT '0' COMMENT 'chiet khau tren tung mat hang',
  `gap_agency_amount` double DEFAULT '0' COMMENT 'tien chenh lech cua dai ly',
  `gap_customer_amount` double DEFAULT '0' COMMENT 'tien chenh lech cua khach hang',
  `amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale_detail` */

insert  into `oil_sale_detail`(`id`,`oil_sale_id`,`oil_id`,`unit_id`,`store_id`,`quantity`,`price_before_commission`,`commission_price`,`price`,`first_amount`,`commission`,`gap_agency_amount`,`gap_customer_amount`,`amount`) values (20,8,1,6,9,1,100000,10,90200,90200,10,100,100,81180),(21,8,2,10,8,2,200000,20,160400,320800,20,200,200,256640),(22,8,3,9,10,3,300000,30,210600,631800,30,300,300,442260),(23,9,1,6,9,10,100000,10,90200,902000,10,100,100,811800),(24,9,2,10,8,20,200000,20,160400,3208000,20,200,200,2566400),(25,9,3,9,10,30,300000,30,210600,6318000,30,300,300,4422600);

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

/*Table structure for table `other_bonus` */

DROP TABLE IF EXISTS `other_bonus`;

CREATE TABLE `other_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `other_bonus` */

insert  into `other_bonus`(`id`,`name`,`organization_id`,`note`) values (2,'Lương tháng 13',1,''),(3,'Thưởng thêm',1,''),(4,'Tết dương lịch',1,'');

/*Table structure for table `panelty` */

DROP TABLE IF EXISTS `panelty`;

CREATE TABLE `panelty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `panelty` */

insert  into `panelty`(`id`,`name`,`organization_id`,`note`) values (2,'Điện thoại',1,''),(3,'Phạt',1,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `parameter` */

insert  into `parameter`(`id`,`code`,`name`,`value`,`note`,`is_show`) values (3,'startdate','Ngày bắt đầu sử dụng','01/01/2018',NULL,0),(2,'mailbeforeday','Số ngày nhắc mail trước sinh nhật','3',NULL,1),(4,'insurancepersonal','Bảo hiểm xã hội - Nhân viên đóng (%)','10.5',NULL,1),(5,'insurancecompany','Bảo hiểm xã hội - Công ty đóng (%)','17',NULL,1),(6,'seniallowday','Số ngày nhắc mail trước khi thay đổi thâm niên','2',NULL,1),(7,'lovo','Lò vỏ','150000',NULL,1),(8,'100km','Số lít dầu cho 100 km','28',NULL,1),(9,'1000kggas','Số lít dầu cho 1000 kg gas','1',NULL,1),(10,'dayoffperyear','Số ngày nghỉ phép trong năm','12',NULL,1);

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

insert  into `permission_detail`(`id`,`permission_id`,`operation`,`function`) values (17,8,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(16,8,1,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(18,8,3,'1,5,8,4,13,14,53,54,15,20,22,23,51,52,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(19,8,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(20,8,6,'56'),(35,11,8,'20,109,52,101,102,26,27,59,28,30,31,32,33,37,117,118,76,77,34,36,95,38,39,40,42,43,44,45,46,48,49,50,60,61,93'),(36,11,6,'56,57,89,81,62,63,69,64,65,88,86,94,92,66,67,68,79,80,97,71,72,73,74,78,84,85,87,91,103,104,105,107,119,120,121,122,123,124'),(34,11,4,'1,5,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,118,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(33,11,3,'1,5,8,4,13,98,99,100,14,53,54,15,58,70,20,109,22,23,51,52,101,102,110,116,25,108,106,26,27,59,28,29,30,31,32,33,37,117,118,76,77,34,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(32,11,2,'1,5,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,118,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(31,11,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,118,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61,93'),(37,12,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(38,12,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(39,12,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(40,12,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(41,12,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(42,12,6,'56,57,89,81,62,63,69,64,65,88,92,66,67,68,79,80,71,72,73,74,78,84,85,87,91');

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
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_in_stock` */

insert  into `petro_in_stock`(`id`,`day`,`petro_id`,`organization_id`,`store_id`,`in_stock`) values (658,'2019-05-17',6,1,4,0),(659,'2019-05-17',6,1,6,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1479 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_in_stock` */

insert  into `promotion_material_in_stock`(`id`,`day`,`promotion_material_id`,`organization_id`,`in_stock`) values (1472,'2019-05-17',3,1,0),(1473,'2019-05-17',4,1,0),(1474,'2019-05-17',3,14,0),(1475,'2019-05-17',4,14,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_gas_in_stock` */

insert  into `shell_gas_in_stock`(`id`,`day`,`shell_vendor_id`,`in_stock`) values (3125,'2019-05-17',6,-524),(3126,'2019-05-17',8,0),(3127,'2019-05-17',9,0),(3128,'2019-05-17',10,0),(3129,'2019-05-17',5,-210),(3130,'2019-05-17',7,-6),(3131,'2019-05-17',11,0),(3132,'2019-05-17',12,0),(3133,'2019-05-17',13,0),(3134,'2019-05-17',14,0),(3135,'2019-05-17',15,0),(3136,'2019-05-17',16,0),(3137,'2019-05-17',17,0),(3138,'2019-05-17',18,0),(3139,'2019-05-17',19,0),(3140,'2019-05-17',20,0),(3141,'2019-05-17',21,0),(3142,'2019-05-17',22,0),(3143,'2019-05-17',23,0),(3144,'2019-05-17',24,0),(3145,'2019-05-17',25,0),(3146,'2019-05-17',26,0),(3147,'2019-05-17',27,0),(3148,'2019-05-17',28,0),(3149,'2019-05-17',29,0),(3150,'2019-05-17',30,0),(3151,'2019-05-17',31,0),(3152,'2019-05-17',32,0),(3153,'2019-05-17',33,0),(3154,'2019-05-17',34,0),(3155,'2019-05-17',35,0),(3156,'2019-05-17',36,0),(3157,'2019-05-17',37,0),(3158,'2019-05-17',38,0),(3159,'2019-05-17',39,0),(3160,'2019-05-17',40,0),(3161,'2019-05-17',41,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=2324 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_in_stock` */

insert  into `shell_in_stock`(`id`,`day`,`organization_id`,`shell_id`,`in_stock`) values (2287,'2019-05-17',1,1,0),(2288,'2019-05-17',1,2,0),(2289,'2019-05-17',1,3,0),(2290,'2019-05-17',1,8,0),(2291,'2019-05-17',1,9,0),(2292,'2019-05-17',1,10,0),(2293,'2019-05-17',1,11,0),(2294,'2019-05-17',1,12,0),(2295,'2019-05-17',1,13,0),(2296,'2019-05-17',1,14,0),(2297,'2019-05-17',1,15,0),(2298,'2019-05-17',1,16,0),(2299,'2019-05-17',1,17,0),(2300,'2019-05-17',1,18,0),(2301,'2019-05-17',1,19,0),(2302,'2019-05-17',1,20,0),(2303,'2019-05-17',1,21,0),(2304,'2019-05-17',1,22,0),(2305,'2019-05-17',1,23,0),(2306,'2019-05-17',1,24,0),(2307,'2019-05-17',1,25,0),(2308,'2019-05-17',1,26,0),(2309,'2019-05-17',1,27,0),(2310,'2019-05-17',1,28,0),(2311,'2019-05-17',1,29,0),(2312,'2019-05-17',1,30,0),(2313,'2019-05-17',1,31,0),(2314,'2019-05-17',1,32,0),(2315,'2019-05-17',1,33,0),(2316,'2019-05-17',1,34,0),(2317,'2019-05-17',1,35,0),(2318,'2019-05-17',1,36,0),(2319,'2019-05-17',1,37,0),(2320,'2019-05-17',1,38,0),(2321,'2019-05-17',1,39,0),(2322,'2019-05-17',1,40,0),(2323,'2019-05-17',1,41,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_vendor` */

insert  into `shell_vendor`(`id`,`organization_id`,`shell_id`,`vendor_id`,`quantity`) values (5,1,9,22,100),(6,1,1,22,200),(7,1,10,22,300),(8,1,2,22,400),(9,1,3,22,0),(10,1,8,22,0),(11,1,11,22,0),(12,1,12,22,0),(13,1,13,22,0),(14,1,14,22,0),(15,1,15,22,0),(16,1,16,22,0),(17,1,17,22,0),(18,1,18,22,0),(19,1,19,22,0),(20,1,20,22,0),(21,1,21,22,0),(22,1,22,22,0),(23,1,23,22,0),(24,1,24,22,0),(25,1,25,22,0),(26,1,26,22,0),(27,1,27,22,0),(28,1,28,22,0),(29,1,29,22,0),(30,1,30,22,0),(31,1,31,22,0),(32,1,32,22,0),(33,1,33,22,0),(34,1,34,22,0),(35,1,35,22,0),(36,1,36,22,0),(37,1,37,22,0),(38,1,38,22,0),(39,1,39,22,0),(40,1,40,22,0),(41,1,41,22,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1693 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_in_stock` */

insert  into `shield_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`in_stock`) values (1686,'2019-05-17',15,1,0),(1687,'2019-05-17',16,1,0),(1688,'2019-05-17',22,1,0),(1689,'2019-05-17',23,1,0),(1690,'2019-05-17',15,14,0),(1691,'2019-05-17',22,14,0),(1692,'2019-05-17',23,14,0);

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
  `is_oil` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `store` */

insert  into `store`(`id`,`code`,`name`,`organization_id`,`status`,`is_petro`,`is_good`,`is_oil`) values (6,'QTK2','Kho cửa hàng Thái Bảo',1,1,1,0,0),(4,'QTK1','Trạm chiết nạp khí hoá lỏng LPG Quang Trung',1,1,1,0,0),(7,'KTG','Kho trạm gas',1,1,0,1,0),(8,'KDQT','Kho dầu Quang Trung',1,1,0,0,1),(9,'KDHT','Kho dầu Hưng Thịnh',1,1,0,0,1),(10,'KT','Kho trả hàng',1,1,0,0,1);

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

insert  into `temp_gas_commission`(`session_id`,`id`,`created_date`,`quantity_12`,`quantity_45`,`quantity_lovo`,`accessory_kind_id`,`quantity_accessory`,`commission_accessory`,`employee_ids`,`employee_count`,`vehicle_plate`,`kind`) values ('17_1554022148869',36,'2019-03-22',30,0,0,0,0,0,'41,17,40',3,'72C-06625','out');

/*Table structure for table `temp_oil_stock` */

DROP TABLE IF EXISTS `temp_oil_stock`;

CREATE TABLE `temp_oil_stock` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `import_quantity` int(11) DEFAULT NULL,
  `export_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `temp_oil_stock` */

insert  into `temp_oil_stock`(`session_id`,`created_date`,`oil_id`,`opening_stock`,`import_quantity`,`export_quantity`) values ('17_1557595099767','2019-05-10',1,0,0,110),('17_1557595099767','2019-05-10',2,0,0,40),('17_1557595099767','2019-05-10',3,0,0,30),('17_1557595099767','2019-05-11',1,0,10,0),('17_1557595099767','2019-05-11',2,0,20,0),('17_1557595099767','2019-05-11',3,0,30,0);

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
  `employee_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `fee` text COLLATE utf8_unicode_ci,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_fee` */

insert  into `trip_fee`(`id`,`code`,`employee_id`,`vehicle_id`,`created_date`,`fee`,`quantity`,`price`,`amount`,`note`,`created_employee_id`) values (3,'20190402-EA-0001',23,6,'2019-04-01','Cước đường bộ 40000',28,40000,1120000,'',17),(4,'20190403-EA-0001',23,6,'2019-04-03','Cước đường bộ 60000',24,60000,1440000,'',17);

/*Table structure for table `trip_oil` */

DROP TABLE IF EXISTS `trip_oil`;

CREATE TABLE `trip_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_oil` */

insert  into `trip_oil`(`id`,`code`,`employee_id`,`vehicle_id`,`created_date`,`quantity`,`price`,`amount`,`note`,`created_employee_id`) values (2,'20190404-TO-0001',23,6,'2019-04-01',540,14900,8046000,'a',17),(3,'20190404-TO-0002',23,6,'2019-04-02',100,10000,1000000,'b',17);

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit` */

insert  into `unit`(`id`,`name`,`status`) values (6,'Thùng',1),(5,'Lít',1),(4,'Bình',1),(7,'Cái',1),(8,'Bộ',1),(9,'Kg',1),(10,'Xô',1),(11,'Phuy',1),(12,'Can',1);

/*Table structure for table `unit_rate` */

DROP TABLE IF EXISTS `unit_rate`;

CREATE TABLE `unit_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_unit_id` int(11) DEFAULT NULL,
  `parent_unit_id` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit_rate` */

insert  into `unit_rate`(`id`,`base_unit_id`,`parent_unit_id`,`rate`) values (1,4,6,6);

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

insert  into `user`(`id`,`employee_id`,`username`,`password`,`menu`,`status`) values (1,1,'tu','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Xuất xe về\"><item id=\"vehicleinlist\" text=\"Danh sách xuất xe về\"/><item id=\"vehicleinadd\" text=\"Thêm xuất xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán sỉ gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán sỉ gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán sỉ gas\"/></item><item id=\"gasretails\" complex=\"true\" text=\"Bán lẻ gas\"><item id=\"gasretaillist\" text=\"Danh sách phiếu bán lẻ gas\"/><item id=\"gasretailadd\" text=\"Thêm phiếu bán lẻ gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"gasreturns\" complex=\"true\" text=\"Trả gas\"><item id=\"gasreturnlist\" text=\"Danh sách trả gas\"/><item id=\"gasreturnadd\" text=\"Thêm trả gas\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"petroimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtretails\" complex=\"true\" text=\"Công nợ bán lẻ\"><item id=\"debtretaillist\" text=\"Danh sách công nợ bán lẻ\"/><item id=\"debtretailadd\" text=\"Thêm công nợ bán lẻ\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ bán sỉ\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ bán sỉ\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ bán sỉ\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(11,17,'hungpk','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item><item id=\"dayoffs\" complex=\"true\" text=\"Ngày nghỉ bù\"><item id=\"dayofflist\" text=\"Danh sách ngày nghỉ bù\"/><item id=\"dayoffadd\" text=\"Thêm ngày nghỉ bù\"/></item><item id=\"otherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"otherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"otherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"paneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"paneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"paneltyadd\" text=\"Thêm khoản chi khác\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"oil\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"unitrates\" complex=\"true\" text=\"Qui đổi đơn vị tính\"><item id=\"unitratelist\" text=\"Danh sách qui đổi đơn vị tính\"/><item id=\"unitrateadd\" text=\"Thêm qui đổi đơn vị tính\"/></item><item id=\"agencys\" complex=\"true\" text=\"Đại lý\"><item id=\"agencylist\" text=\"Danh sách đại lý\"/><item id=\"agencyadd\" text=\"Thêm đại lý\"/></item><item id=\"oilgroups\" complex=\"true\" text=\"Nhóm dầu nhớt\"><item id=\"oilgrouplist\" text=\"Danh sách nhóm dầu nhớt\"/><item id=\"oilgroupadd\" text=\"Thêm nhóm dầu nhớt\"/></item><item id=\"oils\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"oillist\" text=\"Danh sách dầu nhớt\"/><item id=\"oiladd\" text=\"Thêm dầu nhớt\"/></item><item id=\"employeeoilcommissions\" complex=\"true\" text=\"Loại chiết khấu bán dầu nhớt\"><item id=\"employeeoilcommissionlist\" text=\"Danh sách loại chiết khấu bán dầu nhớt\"/><item id=\"employeeoilcommissionadd\" text=\"Thêm loại chiết khấu bán dầu nhớt\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Giảm giá\"><item id=\"discountlist\" text=\"Danh sách giảm giá\"/><item id=\"discountadd\" text=\"Thêm giảm giá\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"borrows\" complex=\"true\" text=\"Mượn lương\"><item id=\"borrowlist\" text=\"Danh sách phiếu mượn lương\"/><item id=\"borrowadd\" text=\"Thêm phiếu mượn lương\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"employeeotherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"employeeotherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"employeeotherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"employeepaneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"employeepaneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"employeepaneltyadd\" text=\"Thêm khoản chi khác\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"tripoils\" complex=\"true\" text=\"Ứng dầu\"><item id=\"tripoillist\" text=\"Danh sách ứng dầu\"/><item id=\"tripoiladd\" text=\"Thêm ứng dầu\"/></item><item id=\"employeeroutefees\" complex=\"true\" text=\"Chi phí nhân viên vận chuyển\"><item id=\"employeeroutefeelist\" text=\"Danh sách chi phí nhân viên vận chuyển\"/><item id=\"employeeroutefeeadd\" text=\"Thêm chi phí nhân viên vận chuyển\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"oilimports\" complex=\"true\" text=\"Nhập dầu nhớt\"><item id=\"oilimportlist\" text=\"Danh sách phiếu nhập dầu nhớt\"/><item id=\"oilimportadd\" text=\"Thêm phiếu nhập dầu nhớt\"/></item><item id=\"saleoils\" complex=\"true\" text=\"Bán dầu nhớt\"><item id=\"saleoillist\" text=\"Danh sách phiếu bán dầu nhớt\"/><item id=\"saleoiladd\" text=\"Thêm phiếu bán dầu nhớt\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reportoil\" complex=\"true\" text=\"Báo cáo dầu nhớt\"><item id=\"reportoilimport\" text=\"Báo cáo nhập dầu nhớt\"/><item id=\"reportoilstock\" text=\"Báo cáo nhập xuất tồn dầu nhớt\"/><item id=\"reportoilstocksum\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt\"/><item id=\"reportoilsale\" text=\"Báo cáo bán hàng dầu nhớt\"/><item id=\"reportoilcompare\" text=\"Đối chiếu dầu nhớt\"/><item id=\"reportoilcommissionagency\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item><item id=\"reportaccountant\" complex=\"true\" text=\"Báo cáo kế toán\"><item id=\"reportemployeesalary\" text=\"Bảng thanh toán lương\"/><item id=\"reportemployeeoff\" text=\"Bảng theo dõi ngày nghỉ phép\"/><item id=\"reportemployeeworking\" text=\"Bảng theo dõi thời gian công tác\"/><item id=\"reportemployeevehiclesalary\" text=\"Bảng lương nhân viên vận chuyển\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(12,18,'ntb','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(13,20,'hungcp','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item><item id=\"dayoffs\" complex=\"true\" text=\"Ngày nghỉ bù\"><item id=\"dayofflist\" text=\"Danh sách ngày nghỉ bù\"/><item id=\"dayoffadd\" text=\"Thêm ngày nghỉ bù\"/></item><item id=\"otherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"otherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"otherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"paneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"paneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"paneltyadd\" text=\"Thêm khoản chi khác\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"oil\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"unitrates\" complex=\"true\" text=\"Qui đổi đơn vị tính\"><item id=\"unitratelist\" text=\"Danh sách qui đổi đơn vị tính\"/><item id=\"unitrateadd\" text=\"Thêm qui đổi đơn vị tính\"/></item><item id=\"agencys\" complex=\"true\" text=\"Đại lý\"><item id=\"agencylist\" text=\"Danh sách đại lý\"/><item id=\"agencyadd\" text=\"Thêm đại lý\"/></item><item id=\"oilgroups\" complex=\"true\" text=\"Nhóm dầu nhớt\"><item id=\"oilgrouplist\" text=\"Danh sách nhóm dầu nhớt\"/><item id=\"oilgroupadd\" text=\"Thêm nhóm dầu nhớt\"/></item><item id=\"oils\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"oillist\" text=\"Danh sách dầu nhớt\"/><item id=\"oiladd\" text=\"Thêm dầu nhớt\"/></item><item id=\"employeeoilcommissions\" complex=\"true\" text=\"Loại chiết khấu bán dầu nhớt\"><item id=\"employeeoilcommissionlist\" text=\"Danh sách loại chiết khấu bán dầu nhớt\"/><item id=\"employeeoilcommissionadd\" text=\"Thêm loại chiết khấu bán dầu nhớt\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Giảm giá\"><item id=\"discountlist\" text=\"Danh sách giảm giá\"/><item id=\"discountadd\" text=\"Thêm giảm giá\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"borrows\" complex=\"true\" text=\"Mượn lương\"><item id=\"borrowlist\" text=\"Danh sách phiếu mượn lương\"/><item id=\"borrowadd\" text=\"Thêm phiếu mượn lương\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"employeeotherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"employeeotherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"employeeotherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"employeepaneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"employeepaneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"employeepaneltyadd\" text=\"Thêm khoản chi khác\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"tripoils\" complex=\"true\" text=\"Ứng dầu\"><item id=\"tripoillist\" text=\"Danh sách ứng dầu\"/><item id=\"tripoiladd\" text=\"Thêm ứng dầu\"/></item><item id=\"employeeroutefees\" complex=\"true\" text=\"Chi phí nhân viên vận chuyển\"><item id=\"employeeroutefeelist\" text=\"Danh sách chi phí nhân viên vận chuyển\"/><item id=\"employeeroutefeeadd\" text=\"Thêm chi phí nhân viên vận chuyển\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"oilimports\" complex=\"true\" text=\"Nhập dầu nhớt\"><item id=\"oilimportlist\" text=\"Danh sách phiếu nhập dầu nhớt\"/><item id=\"oilimportadd\" text=\"Thêm phiếu nhập dầu nhớt\"/></item><item id=\"saleoils\" complex=\"true\" text=\"Bán dầu nhớt\"><item id=\"saleoillist\" text=\"Danh sách phiếu bán dầu nhớt\"/><item id=\"saleoiladd\" text=\"Thêm phiếu bán dầu nhớt\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reportoil\" complex=\"true\" text=\"Báo cáo dầu nhớt\"><item id=\"reportoilimport\" text=\"Báo cáo nhập dầu nhớt\"/><item id=\"reportoilstock\" text=\"Báo cáo nhập xuất tồn dầu nhớt\"/><item id=\"reportoilstocksum\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt\"/><item id=\"reportoilsale\" text=\"Báo cáo bán hàng dầu nhớt\"/><item id=\"reportoilcompare\" text=\"Đối chiếu dầu nhớt\"/><item id=\"reportoilcommissionagency\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item><item id=\"reportaccountant\" complex=\"true\" text=\"Báo cáo kế toán\"><item id=\"reportemployeesalary\" text=\"Bảng thanh toán lương\"/><item id=\"reportemployeeoff\" text=\"Bảng theo dõi ngày nghỉ phép\"/><item id=\"reportemployeeworking\" text=\"Bảng theo dõi thời gian công tác\"/><item id=\"reportemployeevehiclesalary\" text=\"Bảng lương nhân viên vận chuyển\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(14,42,'trinh','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1);

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `allowance` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle` */

insert  into `vehicle`(`id`,`plate`,`note`,`allowance`) values (6,'72C-06534','Xe tải chở Gas 72C-06534',70000),(5,'72C-07468','Xe bồn chở Gas 72C-07468',NULL),(7,'72C-09728','Xe tải chở Gas 72C-09728',NULL),(8,'72C-06784','Xe tải chở Gas 72C-06784',NULL),(9,'72C-13179','Xe xitec chở xăng dầu 20.000L 72C-13179',NULL),(10,'72C-06625','Xe xitec chở xăng dầu 16.000L 72C-06625',NULL),(11,'51C-98349','Xe bán tải 51C-98349',NULL);

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
  `is_oil` int(1) DEFAULT '0',
  `commision_on_import` float DEFAULT '0',
  `max_debt` double DEFAULT '0' COMMENT 'cong no toi da cho phep',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`code`,`name`,`address`,`tax`,`phone`,`fax`,`organization_id`,`status`,`equal_organization_id`,`has_stock`,`is_gas`,`is_petro`,`is_good`,`is_transport`,`is_oil`,`commision_on_import`,`max_debt`) values (23,'HUNGTHINH','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh','','','','',14,1,14,1,1,0,0,0,0,0,0),(16,'KDK','Công ty kinh doanh sản phẩm khí','address','tax','phone','fax',1,1,-1,1,1,0,0,0,0,0,0),(15,'THIENHA','Công ty TNHH Dầu Khí Thiên Hà','','','','',1,1,-1,1,1,0,0,1,0,0,0),(18,'TCP','Công Ty TNHH Thanh Châu Phát',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0,0,0,0),(19,'PVO MD','Công ty cổ phần xăng dầu dầu khí Vũng Tàu',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0,0,0,0),(20,'NIWA','NIWA','','','','',1,1,-1,0,0,0,1,0,1,43,2000000000),(21,'HGA','Công Ty TNHH Hưng Gia Anh',NULL,NULL,NULL,NULL,1,1,-1,0,1,0,0,0,0,0,0),(22,'QuangTrung','Công ty TNHH Quang Trung','','','','',1,1,1,1,1,0,0,1,0,0,0),(25,'PN','Phúc Nguyên','','','','',1,1,-1,0,0,0,0,1,0,0,0),(26,'MK','Mekong','','','','',1,1,1,0,0,0,0,0,1,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_in_stock` */

insert  into `vendor_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`amount`,`shell_12`,`shell_45`,`transport_amount`) values (2172,'2019-05-17',15,1,0,0,0,0),(2173,'2019-05-17',15,14,0,0,0,0),(2174,'2019-05-17',16,1,0,0,0,0),(2175,'2019-05-17',18,1,0,0,0,0),(2176,'2019-05-17',19,1,0,0,0,0),(2177,'2019-05-17',20,1,79800000,0,0,0),(2178,'2019-05-17',21,1,0,0,0,0),(2179,'2019-05-17',22,1,0,0,0,0),(2180,'2019-05-17',22,14,0,0,0,0),(2181,'2019-05-17',23,1,0,0,0,0),(2182,'2019-05-17',23,14,0,0,0,0),(2183,'2019-05-17',25,1,0,0,0,-14985000),(2184,'2019-05-17',26,1,0,0,0,0);

/*Table structure for table `vendor_organization` */

DROP TABLE IF EXISTS `vendor_organization`;

CREATE TABLE `vendor_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_organization` */

insert  into `vendor_organization`(`id`,`vendor_id`,`organization_id`) values (11,15,1),(12,16,1),(16,18,1),(17,19,1),(18,20,1),(19,21,1),(20,22,1),(21,15,14),(22,23,14),(24,23,1),(25,22,14),(26,24,1),(27,25,1),(28,26,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

insert  into `wholesale_debt`(`id`,`code`,`created_date`,`content`,`customer_id`,`paid`,`account_id`,`note`,`created_employee_id`,`kind`,`gas_wholesale_id`) values (4,'20190326-GS-0001_aut','2019-03-25',NULL,108,10000,5,'',17,1,50),(6,'20190330-GS-0002_aut','2019-03-29',NULL,130,6000,5,'',17,1,52);

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

/* Trigger structure for table `oil_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteOilImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteOilImportDetail` AFTER DELETE ON `oil_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _base_unit_id, _rate_quantity, _store_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.store_id INTO _date, _organization_id, _store_id
	FROM oil_import AS f, employee AS eo
	WHERE f.id=OLD.oil_import_id AND f.created_employee_id=eo.id;
	
	SELECT base_unit_id INTO _base_unit_id FROM oil WHERE id=OLD.oil_id;
	
	IF _base_unit_id<>OLD.unit_id THEN
		SELECT rate INTO _rate_quantity FROM unit_rate WHERE parent_unit_id=OLD.unit_id AND base_unit_id=_base_unit_id;
		IF _rate_quantity=0 THEN
			SET _rate_quantity = old.quantity;
		ELSE
			SET _rate_quantity = _rate_quantity * OLD.quantity;
		END IF;
	ELSE
		SET _rate_quantity=OLD.quantity;
	END IF;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- oil_in_stock
		SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=OLD.oil_id and store_id=_store_id;
		UPDATE oil_in_stock SET in_stock=in_stock - _rate_quantity WHERE id=_in_stock_id;
		
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
    END */$$


DELIMITER ;

/* Trigger structure for table `oil_sale_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteSaleOilDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteSaleOilDetail` AFTER DELETE ON `oil_sale_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id INTO _date, _organization_id
	FROM oil_sale AS f, employee AS eo
	WHERE f.id=OLD.oil_sale_id AND f.created_employee_id=eo.id;
	
	SELECT base_unit_id INTO _base_unit_id FROM oil WHERE id=OLD.oil_id;
	
	IF _base_unit_id<>OLD.unit_id THEN
		SELECT rate INTO _rate_quantity FROM unit_rate WHERE parent_unit_id=OLD.unit_id AND base_unit_id=_base_unit_id;
		IF _rate_quantity=0 THEN
			SET _rate_quantity = OLD.quantity;
		ELSE
			SET _rate_quantity = _rate_quantity * OLD.quantity;
		END IF;
	ELSE
		SET _rate_quantity=OLD.quantity;
	END IF;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- oil_in_stock
		SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=OLD.oil_id and store_id=old.store_id;
		UPDATE oil_in_stock SET in_stock=in_stock + _rate_quantity WHERE id=_in_stock_id;
		
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

/* Procedure structure for procedure `clear_oil_stock_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `clear_oil_stock_report` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clear_oil_stock_report`(IN _session_id VARCHAR(255))
BEGIN
	DELETE FROM temp_oil_stock WHERE session_id=_session_id;
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

/* Procedure structure for procedure `deleteBorrow` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteBorrow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBorrow`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id INT DEFAULT 0;
	DECLARE _total DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.total INTO _date, _organization_id, _account_id, _total
	FROM borrow AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _total WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	DELETE FROM borrow_detail WHERE borrow_id=_id;
	DELETE FROM borrow WHERE id=_id;
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

/* Procedure structure for procedure `deleteEmployeeRouteFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteEmployeeRouteFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmployeeRouteFee`(in _id int)
BEGIN
	delete from employee_route_fee where id=_id;
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
	delete from wholesale_debt where gas_wholesale_id=_id;
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

/* Procedure structure for procedure `deleteOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOilImport`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM oil_import AS f, employee AS eo
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
	
	DELETE FROM oil_import_detail WHERE oil_import_id=_id;
	DELETE FROM oil_import WHERE id=_id;
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
	delete from employee_advance where inner_sale_id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleOil`(IN _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _account_id, _customer_id INT DEFAULT 0;
	DECLARE _paid, _debt DOUBLE DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt INTO _date, _organization_id, _account_id, _customer_id, _paid, _debt
	FROM oil_sale AS f, employee AS eo
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
	
	DELETE FROM oil_sale_detail WHERE oil_sale_id=_id;
	DELETE FROM oil_sale WHERE id=_id;
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

/* Procedure structure for procedure `getOtherFieldForEmployeeVehicleSalaryReport` */

/*!50003 DROP PROCEDURE IF EXISTS  `getOtherFieldForEmployeeVehicleSalaryReport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getOtherFieldForEmployeeVehicleSalaryReport`(in _employee_id int, in _month int, in _year int
	, out _trip_allowance double, out _borrow double, out _borrow_rest double)
BEGIN
	
	select coalesce(sum(v.allowance),0) into _trip_allowance 
	from employee_route_fee as f, vehicle as v
	where f.vehicle_id=v.id AND f.employee_id=_employee_id and month(f.created_date)=_month and year(f.created_date)=_year;
	
	select coalesce(sum(bdet.amount),0) into _borrow
	from borrow as b, borrow_detail as bdet
	where b.id=bdet.borrow_id and b.employee_id=_employee_id AND MONTH(bdet.pay_date)=_month AND YEAR(bdet.pay_date)=_year;
	
	SELECT COALESCE(SUM(bdet.amount),0) INTO _borrow_rest
	FROM borrow AS b, borrow_detail AS bdet
	WHERE b.id=bdet.borrow_id AND b.employee_id=_employee_id AND (YEAR(bdet.pay_date)>_year or (YEAR(bdet.pay_date)=_year and MONTH(bdet.pay_date)>_month));
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

/* Procedure structure for procedure `insertAgencyCommissionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAgencyCommissionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAgencyCommissionDetail`(in _agency_id int, in _commission_from float, in _commission_to float, in _commission float)
BEGIN
	INSERT INTO agency_commission(agency_id, commission_from, commission_to, commission)
	VALUES (_agency_id, _commission_from, _commission_to, _commission);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertAgencyCustomerDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAgencyCustomerDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAgencyCustomerDetail`(IN _agency_id INT, IN _customer_id INT)
BEGIN
	INSERT INTO agency_customer(agency_id, customer_id)
	values (_agency_id, _customer_id);
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

/* Procedure structure for procedure `insertBorrow` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertBorrow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBorrow`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _employee_id int, IN _total DOUBLE, IN _account_id INT, IN _note TEXT
	, IN _created_employee_id INT, OUT _id INT)
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
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _total);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _total WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO borrow (CODE, created_date, employee_id, total, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _employee_id, _total, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertBorrowDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertBorrowDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBorrowDetail`(IN _borrow_id INT, IN _pay_date varchar(20), IN _amount DOUBLE)
BEGIN
	insert into borrow_detail(borrow_id, pay_date, amount) values(_borrow_id, STR_TO_DATE(_pay_date,'%m/%Y'), _amount);
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
	, IN _to_date VARCHAR(20), in _note text, in _actual_off_day float, IN _created_employee_id INT, OUT _id INT)
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
	, IN _quantity int, IN _note TEXT, IN _created_employee_id INT, in _dayoff_id int, OUT _id INT)
BEGIN
	INSERT INTO employee_off_increase (CODE, employee_id, created_date, quantity, note, created_employee_id, dayoff_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _note, _created_employee_id, _dayoff_id);
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

/* Procedure structure for procedure `insertEmployeeOtherBonus` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeOtherBonus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeOtherBonus`(IN _code VARCHAR(20), IN _employee_id INT, IN _created_date VARCHAR(20)
	, IN _amount double, IN _note TEXT, IN _created_employee_id INT, IN _other_bonus_id INT, OUT _id INT)
BEGIN
	INSERT INTO employee_other_bonus (CODE, employee_id, created_date, amount, note, created_employee_id, other_bonus_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _amount, _note, _created_employee_id, _other_bonus_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeePanelty` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeePanelty` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeePanelty`(IN _code VARCHAR(20), IN _employee_id INT, IN _created_date VARCHAR(20)
	, IN _amount DOUBLE, IN _note TEXT, IN _created_employee_id INT, IN _panelty_id INT, OUT _id INT)
BEGIN
	INSERT INTO employee_panelty (CODE, employee_id, created_date, amount, note, created_employee_id, panelty_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _amount, _note, _created_employee_id, _panelty_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeRouteFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeRouteFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeRouteFee`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _employee_id INT, IN _vehicle_id INT, IN _route_id INT
	, IN _in_quantity int, IN _out_quantity INT, IN _price DOUBLE, IN _store TEXT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	declare _total_quantity, _param100km, _param1000kg, _distance int default 0;
	declare _amount double default 0;
	
	select `value` into _param100km from parameter where code='100km';
	SELECT `value` INTO _param1000kg FROM parameter WHERE CODE='1000kggas';
	select distance into _distance from route where id=_route_id;
	
	set _total_quantity = _distance * _param100km / 100 + _in_quantity * _param1000kg / 1000;
	set _amount = _total_quantity * _price;
	
	INSERT INTO employee_route_fee (CODE, created_date, created_employee_id, employee_id, vehicle_id, route_id, in_quantity, out_quantity, param_100km, param_1000kg
		, total_quantity, price, amount, store, note)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _created_employee_id, _employee_id, _vehicle_id, _route_id, _in_quantity, _out_quantity, _param100km
		, _param1000kg, _total_quantity, _price, _amount, _store, _note);
	SELECT LAST_INSERT_ID() INTO _id;
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
	SELECT `day` INTO _date FROM oil_in_stock ORDER BY id DESC LIMIT 1;
	IF _date IS NULL THEN
		SET _date=_start_date;
	END IF;
	
	DELETE FROM oil_in_stock WHERE DATE(`day`) > _date AND DATE(`day`) <= _current_date;
	
	SET _pre_date=NULL;
	SELECT `day` INTO _pre_date FROM oil_in_stock ORDER BY id DESC LIMIT 1;
	IF _pre_date IS NULL THEN
		SET _pre_date=_start_date;
	END IF;
	
	INSERT INTO oil_in_stock(DAY, oil_id, store_id, organization_id, in_stock)
	SELECT _current_date, s.id, st.id, s.organization_id, COALESCE(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM oil AS s
	left join store as st on s.organization_id=st.organization_id
	LEFT JOIN (
		SELECT oil_id, store_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM oil_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON s.id=tbl_old_stock.oil_id and st.id=tbl_old_stock.store_id
	LEFT JOIN (
		SELECT i_det.oil_id, i.store_id, SUM(i_det.quantity) AS in_stock
		FROM oil_import_detail AS i_det, oil_import AS i
		WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.oil_id, i.store_id
		UNION ALL
		SELECT i_det.oil_id, i_det.store_id, -SUM(i_det.quantity) AS in_stock
		FROM oil_sale_detail AS i_det, oil_sale AS i
		WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.oil_id, i_det.store_id
	) AS tbl ON tbl.oil_id=s.id and tbl.store_id=st.id
	WHERE s.STATUS=1 and st.status=1 and st.is_oil=1 GROUP BY s.id;
	
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
		UNION ALL
		SELECT i.account_id, -SUM(i.total) AS in_stock
		FROM borrow AS i
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

/* Procedure structure for procedure `insertOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _store_id INT, IN _vendor_id INT
	, in _commission float, IN _rate DOUBLE, in _total_before_commission double, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT
	, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
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
	
	INSERT INTO oil_import (CODE, created_date, store_id, vendor_id, commission, rate, total_before_commission, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _store_id, _vendor_id, _commission, _rate, _total_before_commission, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOilImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilImportDetail`(IN _oil_import_id INT, IN _oil_id INT, in _unit_id int, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _base_unit_id, _rate_quantity, _store_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id, f.store_id INTO _organization_id, _store_id 
	FROM oil_import AS f, employee AS eo 
	WHERE f.id=_oil_import_id AND f.created_employee_id=eo.id;
	select base_unit_id into _base_unit_id from oil where id=_oil_id;
	
	if _base_unit_id<>_unit_id then
		select rate into _rate_quantity from unit_rate where parent_unit_id=_unit_id and base_unit_id=_base_unit_id;
		if _rate_quantity=0 then
			set _rate_quantity = _quantity;
		else
			set _rate_quantity = _rate_quantity * _quantity;
		end if;
	else
		set _rate_quantity=_quantity;
	end if;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- oil_in_stock
		SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id and store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO oil_in_stock(`day`, organization_id, oil_id, store_id, in_stock) VALUES (_date, _organization_id, _oil_id, _store_id, _rate_quantity);
		ELSE
			UPDATE oil_in_stock SET in_stock=in_stock + _rate_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO oil_import_detail(oil_import_id, oil_id, unit_id, quantity, price, amount) VALUES (_oil_import_id, _oil_id, _unit_id, _quantity, _price, _amount);
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
	, IN _month_day INT, IN _basic_salary DOUBLE, IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _session_id VARCHAR(255)
	, OUT _id INT)
BEGIN
	declare _real_salary, _total, _timesheet_total, _field_total, _commission_total, _bonus_total, _advance_total, _bhxh_total, _panelty_total
		, _seniority_total, _commission_12, _commission_45, _commission_lovo, _bhxh_salary, _trip_allowance, _borrow, _borrow_rest
		, _oil_salary, _trip_oil, _trip_fee, _param_100km, _param_1000kg double default 0;
	declare _off_day, _working_day, _total_day_off, _this_month_off_day, _salary_month, _salary_year int default 0;
	declare _date, _employee_start_date, _current_date date;
	
	select coalesce(commission,0) into _commission_12 from shell_kind where weight=12;
	
	SELECT COALESCE(commission,0) INTO _commission_45 FROM shell_kind WHERE weight=45;
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _commission_lovo FROM parameter WHERE `code`='lovo';
	SELECT `value` INTO _param_100km FROM parameter WHERE CODE='100km';
	SELECT `value` INTO _param_1000kg FROM parameter WHERE CODE='1000kggas';
	
	select sysdate() into _current_date;
	
	select STR_TO_DATE(_created_date,'%d/%m/%Y') into _date;
	
	select month(_date), year(_date) into _salary_month, _salary_year;
	
	select `value` into _total_day_off from parameter where code='dayoffperyear';
	
	SELECT COALESCE(SUM(quantity),0) INTO _off_day
	FROM employee_off_increase
	WHERE YEAR(created_date)=_salary_year AND employee_id=_employee_id;
	
	SET _total_day_off = _total_day_off + _off_day;
	
	SET _off_day = 0;
	
	select COALESCE(SUM(actual_off_day),0) into _off_day
	from employee_off
	where year(created_date)=_salary_year and employee_id=_employee_id;
	
	SELECT COALESCE(SUM(actual_off_day),0) INTO _this_month_off_day
	FROM employee_off
	WHERE month(created_date)=_salary_month and YEAR(created_date)=_salary_year AND employee_id=_employee_id;
	
	SET _total_day_off = _total_day_off - _off_day;
	
	if _total_day_off < 0 then
		if _this_month_off_day > _total_day_off * -1 then -- thang truoc con 1 it, thang nay nghi nhieu hon so do
			set _working_day = _working_day - (_this_month_off_day + _total_day_off);
		elseIF _this_month_off_day = _total_day_off * -1 THEN -- thang truoc vua het
			SET _working_day = _working_day - _this_month_off_day;
		else -- thang truoc nghi hon so ngay nghi qui dinh
			SET _working_day = _working_day - _this_month_off_day;
		end if;
	else
		SET _working_day = _month_day;
	end if;
	
	call getOtherFieldForEmployeeVehicleSalaryReport(_employee_id, _salary_month, _salary_year, _trip_allowance, _borrow, _borrow_rest);
	
	SELECT coalesce(sum((r.distance * _param_100km / 100 + i.in_quantity * _param_1000kg / 1000) * i.price),0) into _oil_salary
	FROM employee_route_fee AS i, route AS r
	WHERE i.route_id=r.id AND i.employee_id=_employee_id
		AND DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y');
	
	SELECT coalesce(sum(t.amount),0) into _trip_fee
	FROM trip_fee AS t
	WHERE t.employee_id=_employee_id 
		AND DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y');
	
	SELECT coalesce(sum(t.amount),0) INTO _trip_oil
	FROM trip_oil AS t
	WHERE t.employee_id=_employee_id
		AND DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y');
	
	insert into employee_salary (code, employee_id, created_date, basic_salary, real_salary, total, month_day, working_day, salary_month, salary_year,
		trip_allowance, oil_salary, trip_oil, trip_fee, borrow, borrow_rest)
	values (_code, _employee_id, _date, _basic_salary, basic_salary * _working_day / _month_day, 0, _month_day, _working_day, _salary_month, _salary_year
		, _trip_allowance,_oil_salary, _trip_oil, _trip_fee, _borrow, _borrow_rest);
	
	SELECT LAST_INSERT_ID() INTO _id;
	
	insert into employee_salary_timesheet_detail (employee_salary_id, field_id, field_name, quantity, price, amount)
	select _id, t.field_id, t.field_name, sum(t.quantity), f.amount, SUM(t.quantity) * f.amount
	from timesheet t, salary_timesheet_field as f
	where t.employee_id=_employee_id and month(t.timesheet_date)=_salary_month and year(t.timesheet_date)=_salary_year and t.field_id=f.field_id
	group by t.employee_id, t.field_id;
	
	insert into employee_salary_field_detail (employee_salary_id, field_id, field_name, amount, note)
	select _id, f.id, f.name, s.amount, ''
	from employee_salary_field as s, dynamic_field as f
	where s.employee_id=_employee_id and s.field_id=f.id;
	
	select coalesce(sum(amount),0) into _timesheet_total from employee_salary_timesheet_detail where employee_salary_id=_id;
	SELECT COALESCE(SUM(amount),0) INTO _field_total FROM employee_salary_field_detail WHERE employee_salary_id=_id;
	
	DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
	call report_gas_employee_commission(_start_date,_end_date,_organization_ids,_session_id,0);
	
	SELECT COALESCE(SUM((t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory)/t.employee_count),0) into _commission_total
	FROM temp_gas_commission AS t where t.session_id=_session_id AND CONCAT("0,",t.employee_ids,",0") LIKE CONCAT('%,',_employee_id,',%')
	;
	
	DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
	SELECT IF(start_date IS NULL,SYSDATE(),start_date), coalesce(salary_bhxh,0) INTO _employee_start_date, _bhxh_salary FROM employee WHERE id=_employee_id;
	
	SELECT ((12 - MONTH(_employee_start_date) + (YEAR(_current_date) - YEAR(_employee_start_date) - 1) * 12 + MONTH(_current_date)) / 12) div 2 INTO _seniority_total;
	set _seniority_total = _basic_salary * 0.02 * _seniority_total;
	select COALESCE(sum(amount),0) into _bonus_total
	from employee_other_bonus
	where MONTH(created_date)=_salary_month AND YEAR(created_date)=_salary_year AND employee_id=_employee_id;
	
	SELECT COALESCE(SUM(amount),0) INTO _advance_total
	FROM employee_advance
	WHERE MONTH(advance_date)=_salary_month AND YEAR(advance_date)=_salary_year AND employee_id=_employee_id;
	
	SELECT COALESCE(SUM(amount),0) INTO _panelty_total
	FROM employee_panelty
	WHERE MONTH(created_date)=_salary_month AND YEAR(created_date)=_salary_year AND employee_id=_employee_id;
	
	SELECT `value` * _bhxh_salary / 100 INTO _bhxh_total
	FROM parameter
	WHERE code='insurancepersonal';
	
	update employee_salary set total=basic_salary * _working_day / _month_day +_timesheet_total+_field_total + _commission_total + _bonus_total 
			+ _seniority_total + oil_salary + trip_allowance
		, commission=_commission_total
		, bonus=_bonus_total
		, advance=_advance_total
		, bhxh=_bhxh_total
		, panelty=_panelty_total
		, seniority=_seniority_total
		, field_amount=_field_total
		, timesheet_amount=_timesheet_total
		, actual_received = basic_salary * _working_day / _month_day + _timesheet_total + _field_total + _commission_total + _bonus_total 
			+ _seniority_total + oil_salary + trip_allowance + trip_fee - trip_oil - borrow - _advance_total - _bhxh_total - _panelty_total
	where id=_id;
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
		call insertEmployeeAdvance(CONCAT(_code,'_auto'), _employee_id, _created_date, _debt, _account_id, '', _created_employee_id, _id, @auto_id);
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

/* Procedure structure for procedure `insertSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOil`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, in _commission float, in _commission_kind int
	, in _commission_amount double, in _gap_agency_amount DOUBLE, in _gap_customer_amount DOUBLE, in _total_before_commission DOUBLE
	, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
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
	
	INSERT INTO oil_sale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id, commission, commission_kind, commission_amount, gap_agency_amount, gap_customer_amount, total_before_commission)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id, _commission, _commission_kind, _commission_amount, _gap_agency_amount, _gap_customer_amount, _total_before_commission);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleOilDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOilDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOilDetail`(IN _oil_sale_id INT, IN _oil_id INT, IN _unit_id INT, IN _store_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, in _price_before_commission double, in _commssion_price float, in _first_amount double, in _commission float
	, in _gap_agency_amount double, in _gap_customer_amount double, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT eo.organization_id INTO _organization_id FROM oil_sale AS f, employee AS eo WHERE f.id=_oil_sale_id AND f.created_employee_id=eo.id;
	SELECT base_unit_id INTO _base_unit_id FROM oil WHERE id=_oil_id;
	
	IF _base_unit_id<>_unit_id THEN
		SELECT rate INTO _rate_quantity FROM unit_rate WHERE parent_unit_id=_unit_id AND base_unit_id=_base_unit_id;
		IF _rate_quantity=0 THEN
			SET _rate_quantity = _quantity;
		ELSE
			SET _rate_quantity = _rate_quantity * _quantity;
		END IF;
	ELSE
		SET _rate_quantity=_quantity;
	END IF;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- oil_in_stock
		SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id and store_id=_store_id;
		IF _in_stock_id=0 THEN
			INSERT INTO oil_in_stock(`day`, organization_id, oil_id, store_id, in_stock) VALUES (_date, _organization_id, _oil_id, _store_id, -_rate_quantity);
		ELSE
			UPDATE oil_in_stock SET in_stock=in_stock - _rate_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	INSERT INTO oil_sale_detail(oil_sale_id, oil_id, unit_id, store_id, quantity, price, amount, price_before_commission, commission_price, first_amount, commission, gap_agency_amount, gap_customer_amount) 
	VALUES (_oil_sale_id, _oil_id, _unit_id, _store_id, _quantity, _price, _amount, _price_before_commission, _commssion_price, _first_amount, _commission, _gap_agency_amount, _gap_customer_amount);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTripFee`(IN _code VARCHAR(20), IN _employee_id INT, IN _vehicle_id INT, IN _created_date VARCHAR(20)
	, in _quantity int, in _price double, IN _amount DOUBLE, in _fee text, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO trip_fee (CODE, employee_id, vehicle_id, created_date, quantity, price, amount, fee, note, created_employee_id)
	VALUES (_code, _employee_id, _vehicle_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _price, _amount, _fee, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertTripOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertTripOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTripOil`(IN _code VARCHAR(20), IN _employee_id INT, IN _vehicle_id INT, IN _created_date VARCHAR(20)
	, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO trip_oil (CODE, employee_id, vehicle_id, created_date, quantity, price, amount, note, created_employee_id)
	VALUES (_code, _employee_id, _vehicle_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _price, _amount, _note, _created_employee_id);
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
	, IN _fax VARCHAR(50), in _code varchar(20), in _organization_id int, in _status int, in _equal_organization_id int, in _commision_on_import float
	, in _max_debt double, in _has_stock int, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, IN _is_transport INT, IN _is_oil INT, out _id int)
BEGIN
	declare _vendor_organization_id int default 0;
	Insert Into vendor (`name`, address, tax, phone, fax, `code`, organization_id, `status`, equal_organization_id, has_stock, is_gas, is_petro, is_good, is_transport, is_oil, commision_on_import, max_debt)
	values (_name, _address, _tax, _phone, _fax, _code, _organization_id, _status, _equal_organization_id, _has_stock, _is_gas, _is_petro, _is_good, _is_transport, _is_oil, _commision_on_import, _max_debt);
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

/* Procedure structure for procedure `report_compare_agency_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_agency_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_agency_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _agency_id INT)
BEGIN
	SELECT c.code as customer_code, c.name as customer_name, o.code as oil_code, o.name as oil_name, u.name as unit_name, osdet.quantity, osdet.price, osdet.amount
		, os.paid, os.debt, (osdet.first_amount * if(aco.commission is null,100,aco.commission) / 100 + osdet.gap_agency_amount) as commission
	FROM oil_sale as os, oil as o, unit as u, customer as c, employee AS eo, agency_customer as ac, oil_sale_detail AS osdet
	left join agency_commission as aco on aco.agency_id=_agency_id and osdet.commission >= commission_from AND osdet.commission < commission_to
	WHERE DATE(os.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(os.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND os.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		and os.customer_id=c.id AND os.customer_id=ac.customer_id and ac.agency_id=_agency_id
		and os.id=osdet.oil_sale_id and osdet.oil_id=o.id and osdet.unit_id=u.id
	;
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

/* Procedure structure for procedure `report_employee_off` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_employee_off` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_employee_off`(IN _year int, IN _organization_ids TEXT)
BEGIN
	declare _total float default 0;
	select `value` into _total from parameter where code='dayoffperyear';
	
	SELECT employee_tbl.id, employee_tbl.fullname as employee_name, _total as total, coalesce(employee_off_increase_total_tbl.dayoff_quantity,0) as dayoff_quantity_total
		, coalesce(employee_off_increase_tbl.dayoff_id,0) as dayoff_id, coalesce(employee_off_increase_tbl.dayoff_quantity,0) as dayoff_quantity, coalesce(employee_off_increase_tbl.dayoff_name,'') as dayoff_name
		, if(employee_off_tbl.off_month='01',COALESCE(employee_off_tbl.quantity,0),0) AS month_01
		, IF(employee_off_tbl.off_month='02',COALESCE(employee_off_tbl.quantity,0),0) AS month_02
		, IF(employee_off_tbl.off_month='03',COALESCE(employee_off_tbl.quantity,0),0) AS month_03
		, IF(employee_off_tbl.off_month='04',COALESCE(employee_off_tbl.quantity,0),0) AS month_04
		, IF(employee_off_tbl.off_month='05',COALESCE(employee_off_tbl.quantity,0),0) AS month_05
		, IF(employee_off_tbl.off_month='06',COALESCE(employee_off_tbl.quantity,0),0) AS month_06
		, IF(employee_off_tbl.off_month='07',COALESCE(employee_off_tbl.quantity,0),0) AS month_07
		, IF(employee_off_tbl.off_month='08',COALESCE(employee_off_tbl.quantity,0),0) AS month_08
		, IF(employee_off_tbl.off_month='09',COALESCE(employee_off_tbl.quantity,0),0) AS month_09
		, IF(employee_off_tbl.off_month='10',COALESCE(employee_off_tbl.quantity,0),0) AS month_10
		, IF(employee_off_tbl.off_month='11',COALESCE(employee_off_tbl.quantity,0),0) AS month_11
		, IF(employee_off_tbl.off_month='12',COALESCE(employee_off_tbl.quantity,0),0) AS month_12
	FROM
	(
		SELECT e.id, e.fullname
		FROM employee as e
		WHERE e.STATUS=1 AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	) AS employee_tbl
	LEFT JOIN
	(
		SELECT employee_id, DATE_FORMAT(created_date, '%m') AS off_month, SUM(quantity) AS quantity FROM
		(
			SELECT eo.employee_id, eo.created_date , eo.actual_off_day as quantity
			FROM employee_off AS eo
			WHERE year(eo.created_date) >= _year and YEAR(eo.created_date) <= _year
		) AS tbl GROUP BY employee_id, year(created_date), month(created_date)
	) AS employee_off_tbl ON employee_off_tbl.employee_id=employee_tbl.id
	LEFT JOIN
	(
		SELECT employee_id, SUM(quantity) AS dayoff_quantity, dayoff_id, dayoff_name FROM
		(
			SELECT ei.employee_id, ei.quantity, o.id as dayoff_id, o.name as dayoff_name
			FROM employee_off_increase AS ei, dayoff as o
			WHERE YEAR(ei.created_date) >= _year AND YEAR(ei.created_date) <= _year
				and ei.dayoff_id=o.id
		) AS tbl GROUP BY employee_id, dayoff_id
	) AS employee_off_increase_tbl ON employee_off_increase_tbl.employee_id=employee_tbl.id
	LEFT JOIN
	(
		SELECT employee_id, SUM(quantity) AS dayoff_quantity FROM
		(
			SELECT ei.employee_id, ei.quantity
			FROM employee_off_increase AS ei
			WHERE YEAR(ei.created_date) >= _year AND YEAR(ei.created_date) <= _year
		) AS tbl GROUP BY employee_id
	) AS employee_off_increase_total_tbl ON employee_off_increase_total_tbl.employee_id=employee_tbl.id
	order by employee_tbl.fullname, employee_off_increase_tbl.dayoff_name
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_employee_route_fee` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_employee_route_fee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_employee_route_fee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), in _employee_id int)
BEGIN
	declare _param_100km, _param_1000kg double default 0;
	select `value` into _param_100km from parameter where code='100km';
	SELECT `value` INTO _param_1000kg FROM parameter WHERE CODE='1000kggas';
	
	SELECT i.CODE, i.created_date, r.NAME AS route_name, r.distance, i.in_quantity, i.out_quantity, i.total_quantity, i.price, i.amount, i.note, i.store
		, _param_100km as param_100km, _param_1000kg as param_1000kg
	FROM employee_route_fee AS i, route AS r
	WHERE i.route_id=r.id AND i.employee_id=_employee_id
		AND DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_employee_salary` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_employee_salary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_employee_salary`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT e.fullname as employee_name, sum(i.working_day) as working_day, sum(i.basic_salary) as basic_salary, sum(i.real_salary) as real_salary
		, sum(i.field_amount + i.timesheet_amount) as salary_field, sum(i.commission) as commission, sum(i.bonus) as bonus, sum(i.total) as total
		, sum(i.advance) as advance, sum(i.bhxh) as bhxh, sum(i.actual_received) as actual_received, sum(i.panelty) as panelty
	FROM employee_salary AS i, employee AS e
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') and e.status=1
	group by e.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_employee_working_time` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_employee_working_time` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_employee_working_time`(IN _organization_ids TEXT)
BEGIN
	SELECT e.fullname as employee_name, coalesce(e.start_date,'') as start_date, e.salary * 0.02 AS seniority
		, (12 - MONTH(e.start_date) + (YEAR(sysdate()) - YEAR(e.start_date) - 1) * 12 + MONTH(sysdate())) / 12 as year_count
		, ((12 - MONTH(e.start_date) + (YEAR(sysdate()) - YEAR(e.start_date) - 1) * 12 + MONTH(sysdate())) / 12) DIV 2 as enought2
		, ((12 - MONTH(e.start_date) + (YEAR(sysdate()) - YEAR(e.start_date) - 1) * 12 + MONTH(sysdate())) / 12) mod 2 AS not_enought2
	FROM employee AS e
	WHERE e.STATUS=1 AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
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
	, IN _session_id VARCHAR(255), in _need_delete int)
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
	
	if _need_delete=1 then
		DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	end if;
	
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

/* Procedure structure for procedure `report_oil_compare` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_compare` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_compare`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT
	, OUT _amount_debt DOUBLE, out _customer_commission float)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.amount INTO _amount_debt
	FROM customer_in_stock AS cis WHERE DATE(cis.`day`)=_pre_date AND cis.customer_id=_customer_id LIMIT 1;
	
	select commission_percentage into _customer_commission from customer where id=_customer_id;
	
	SELECT os.created_date, o.code as oil_code, o.name as oil_name, osdet.quantity, osdet.price, osdet.amount, os.paid
		, (osdet.first_amount * osdet.commission / 100) as commission
	FROM oil_sale as os, oil_sale_detail as osdet, employee AS eo, oil as o
	WHERE DATE(os.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(os.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND os.customer_id=_customer_id AND os.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		AND os.id=osdet.oil_sale_id and osdet.oil_id=o.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_import` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_import` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_import`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.created_date, v.NAME AS vendor_name, p.NAME AS oilName, idet.quantity, idet.price, idet.amount, i.paid, i.note, s.name as storeName
	FROM oil_import AS i, oil_import_detail AS idet, oil AS p, vendor AS v, employee AS e, store as s
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') AND v.STATUS=1
		AND i.id=idet.oil_import_id AND idet.oil_id=p.id and i.store_id=s.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_sale`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT p.created_date, c.CODE AS customerCode, c.NAME AS customerName, pe.CODE AS oilCode, pdet.quantity, pdet.price
		, pdet.first_amount * pdet.commission / 100 as commission, pdet.amount, p.paid, a.number AS account, s.name as storeName
	FROM oil_sale AS p, oil_sale_detail AS pdet, customer AS c, oil AS pe, account AS a, employee AS eo, store as s
	WHERE DATE(p.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(p.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND p.id=pdet.oil_sale_id AND p.customer_id=c.id AND pdet.oil_id=pe.id AND p.account_id=a.id
		AND c.STATUS=1 AND pe.STATUS=1 AND p.created_employee_id=eo.id
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and pdet.store_id=s.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_stock`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _oil_id int
	, in _session_id varchar(255), out _oil_ids text)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	IF _oil_id=0 THEN
		DELETE FROM temp_oil_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_oil_stock(session_id, created_date, oil_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.oil_id, COALESCE(SUM(opening_stock),0), SUM(import_quantity), SUM(export_quantity) FROM
		(
			SELECT i.created_date, idet.oil_id, SUM(idet.quantity) AS import_quantity, 0 AS export_quantity
			FROM oil_import AS i, oil_import_detail AS idet, employee AS eo, oil AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.oil_import_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY i.created_date, idet.oil_id
			UNION ALL
			SELECT i.created_date, idet.oil_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
			FROM oil_sale AS i, oil_sale_detail AS idet, employee AS eo, oil AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.oil_sale_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY i.created_date, idet.oil_id
		) AS tbl
		LEFT JOIN
		(
			SELECT ps.`day` AS created_date, ps.oil_id, COALESCE(SUM(ps.in_stock),0) AS opening_stock
			FROM oil_in_stock AS ps
			WHERE DATEDIFF(_from_date,ps.`day`)=1 AND _organization_ids LIKE CONCAT('%,',ps.organization_id,',%')
			GROUP BY ps.`day`, ps.oil_id
		) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
		GROUP BY tbl.created_date, tbl.oil_id;
	
		SELECT COALESCE(GROUP_CONCAT(oil_id),'') INTO _oil_ids FROM temp_oil_stock WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS oil_id, 0 AS opening_stock, 0 AS import_quantity, 0 AS export_quantity 
		FROM temp_oil_stock 
		WHERE session_id=_session_id 
		GROUP BY created_date ORDER BY created_date;
	ELSE
		SELECT tbl.created_date, t.oil_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id
		ORDER BY tbl.created_date;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_stock_store` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_stock_store` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_stock_store`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _store_id INT
	, IN _oil_id INT, IN _session_id VARCHAR(255), OUT _oil_ids TEXT)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	IF _oil_id=0 THEN
		DELETE FROM temp_oil_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_oil_stock(session_id, created_date, oil_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.oil_id, COALESCE(SUM(opening_stock),0), SUM(import_quantity), SUM(export_quantity) FROM
		(
			SELECT i.created_date, idet.oil_id, SUM(idet.quantity) AS import_quantity, 0 AS export_quantity
			FROM oil_import AS i, oil_import_detail AS idet, employee AS eo, oil AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.oil_import_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and i.store_id=_store_id
			GROUP BY i.created_date, idet.oil_id
			UNION ALL
			SELECT i.created_date, idet.oil_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
			FROM oil_sale AS i, oil_sale_detail AS idet, employee AS eo, oil AS p
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.oil_sale_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') and idet.store_id=_store_id
			GROUP BY i.created_date, idet.oil_id
		) AS tbl
		LEFT JOIN
		(
			SELECT ps.`day` AS created_date, ps.oil_id, COALESCE(SUM(ps.in_stock),0) AS opening_stock
			FROM oil_in_stock AS ps
			WHERE DATEDIFF(_from_date,ps.`day`)=1 AND _organization_ids LIKE CONCAT('%,',ps.organization_id,',%') and ps.store_id=_store_id
			GROUP BY ps.`day`, ps.oil_id
		) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
		GROUP BY tbl.created_date, tbl.oil_id;
	
		SELECT COALESCE(GROUP_CONCAT(oil_id),'') INTO _oil_ids FROM temp_oil_stock WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS oil_id, 0 AS opening_stock, 0 AS import_quantity, 0 AS export_quantity 
		FROM temp_oil_stock 
		WHERE session_id=_session_id 
		GROUP BY created_date ORDER BY created_date;
	ELSE
		SELECT tbl.created_date, t.oil_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id
		ORDER BY tbl.created_date;
	END IF;
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

/* Procedure structure for procedure `report_sale_oil` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_sale_oil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_sale_oil`(in _sale_oil_id int)
BEGIN
	select o.code as oil_code, o.name as oil_name, u.name as unit_name, det.quantity, det.price, det.amount
	from oil_sale_detail as det, oil as o, unit as u
	where det.oil_sale_id=_sale_oil_id AND det.oil_id=o.id and det.unit_id=u.id
	;
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
	
	SELECT shell_tbl.shell_vendor_id, shell_tbl.shell_name, opening_stock_tbl.in_stock AS opening_stock, operation_tbl.created_date, operation_tbl.quantity
		, change_tbl.created_date AS change_created_date, change_tbl.quantity AS change_quantity
	FROM
	(
		SELECT sv.id AS shell_vendor_id, s.NAME AS shell_name
		FROM shell_vendor AS sv, shell AS s, vendor AS v
		WHERE sv.shell_id=s.id AND s.STATUS=1 AND sv.vendor_id=v.id AND v.STATUS=1 AND _organization_ids LIKE CONCAT('%,',v.organization_id,',%')
	) AS shell_tbl
	LEFT JOIN
	(
		SELECT shell_vendor_id, SUM(in_stock) AS in_stock FROM
		(
			SELECT gs.shell_vendor_id, gs.in_stock
			FROM shell_gas_in_stock AS gs
			WHERE DATE(gs.`day`)=_pre_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, gs.in_stock
			FROM shell_in_stock AS gs, shell_vendor AS sv
			WHERE DATE(gs.`day`)=_pre_date AND gs.organization_id=sv.organization_id AND gs.shell_id=sv.shell_id
		) AS tbl GROUP BY shell_vendor_id
	) AS opening_stock_tbl ON shell_tbl.shell_vendor_id=opening_stock_tbl.shell_vendor_id
	LEFT JOIN
	(
		SELECT shell_vendor_id, created_date, SUM(quantity) AS quantity FROM
		(
--			SELECT f_det.shell_id as shell_vendor_id, f.created_date, SUM(f_det.quantity) AS quantity
--			FROM fraction_gas_detail AS f_det, fraction_gas AS f
--			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
--				AND f_det.fraction_id=f.id
--			GROUP BY f_det.shell_id, f.created_date
--			UNION ALL
--			SELECT f_det.shell_id as shell_vendor_id, f.created_date, SUM(f_det.quantity) AS quantity
--			FROM gas_import_detail AS f_det, gas_import AS f
--			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
--				and f_det.gas_import_id=f.id 
--			GROUP BY f_det.shell_id, f.created_date
--			UNION ALL
			SELECT i_det.shell_id AS shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM gas_wholesale_detail AS i_det, gas_wholesale AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.gas_wholesale_id=i.id 
			GROUP BY i_det.shell_id, i.created_date
--			UNION ALL
--			SELECT i_det.shell_id as shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
--			FROM vehicle_out_detail AS i_det, vehicle_out AS i
--			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
--				AND i_det.vehicle_out_id=i.id
--			GROUP BY i_det.shell_id, i.created_date
--			UNION ALL
--			SELECT i_det.shell_id as shell_vendor_id, i.created_date, SUM(i_det.quantity) AS quantity
--			FROM vehicle_in_detail AS i_det, vehicle_in AS i
--			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
--				AND i_det.vehicle_in_id=i.id
--			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT f_det.shell_id AS shell_vendor_id, f.created_date, -SUM(f_det.quantity) AS quantity
			FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.gas_export_wholesale_id=f.id
			GROUP BY f_det.shell_id, f.created_date
			UNION ALL
			SELECT i_det.shell_id AS shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM inner_sale_detail AS i_det, inner_sale AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.inner_sale_id=i.id
			GROUP BY i_det.shell_id, i.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, i.created_date, SUM(i_det.quantity) AS quantity
			FROM gas_wholesale_return_shell AS i_det, gas_wholesale AS i, employee AS eo, shell_vendor AS sv
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.gas_wholesale_id=i.id AND i.created_employee_id=eo.id AND i_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, i.created_date
--			UNION ALL
--			SELECT sv.id AS shell_vendor_id, f.created_date,  SUM(f_det.quantity) AS quantity
--			FROM vehicle_in_return_shell_detail AS f_det, vehicle_in AS f, employee AS eo, shell_vendor AS sv
--			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
--				and f_det.vehicle_in_id=f.id AND f.created_employee_id=eo.id AND f_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
--			GROUP BY sv.id, f.created_date
			UNION ALL
			SELECT sv.id AS shell_vendor_id, f.created_date,  SUM(f_det.quantity) AS quantity
			FROM gas_export_wholesale_shell_detail AS f_det, gas_export_wholesale AS f, employee AS eo, shell_vendor AS sv
			WHERE DATE(f.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(f.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND f_det.gas_export_wholesale_id=f.id AND f.created_employee_id=eo.id AND f_det.shell_id=sv.shell_id AND eo.organization_id=sv.organization_id
			GROUP BY sv.id, f.created_date
		) AS tbl GROUP BY shell_vendor_id, created_date
	) AS operation_tbl ON shell_tbl.shell_vendor_id=operation_tbl.shell_vendor_id
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
	ORDER BY shell_tbl.shell_vendor_id, operation_tbl.created_date
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

/* Procedure structure for procedure `report_trip_fee` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_trip_fee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_trip_fee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _employee_id INT)
BEGIN
	SELECT t.fee, t.quantity, t.price, t.amount, t.note
	FROM trip_fee AS t
	WHERE t.employee_id=_employee_id 
		AND DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_trip_oil` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_trip_oil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_trip_oil`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _employee_id int)
BEGIN
	SELECT t.created_date, t.quantity, t.price, t.amount, t.note
	FROM trip_oil AS t
	WHERE t.employee_id=_employee_id
		AND DATE(t.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(t.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
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

/* Procedure structure for procedure `searchBorrow` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchBorrow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchBorrow`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.id, i.code, i.created_date, e.fullname as employee_name, i.total, i.note
	FROM borrow AS i, employee as e, employee AS eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.employee_id=e.id AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
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
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
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

/* Procedure structure for procedure `searchEmployeeOtherBonus` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeOtherBonus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeOtherBonus`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT a.id, a.CODE, a.created_date, e.fullname AS employee_name, a.amount, a.note
	FROM employee_other_bonus AS a, employee AS e, employee AS eo
	WHERE a.employee_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeePanelty` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeePanelty` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeePanelty`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	SELECT a.id, a.CODE, a.created_date, e.fullname AS employee_name, a.amount, a.note
	FROM employee_panelty AS a, employee AS e, employee AS eo
	WHERE a.employee_id=e.id AND a.created_employee_id=eo.id
		AND DATE(a.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(a.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchEmployeeRouteFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchEmployeeRouteFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchEmployeeRouteFee`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.id, i.CODE, i.created_date, r.NAME AS route_name, r.distance, i.in_quantity, i.out_quantity, i.total_quantity, i.price, i.amount, i.note
	FROM employee_route_fee AS i, route as r, employee AS eo
	WHERE i.route_id=r.id AND i.created_employee_id=eo.id
		AND DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
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

/* Procedure structure for procedure `searchOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchOilImport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20))
BEGIN
	SELECT i.*, v.NAME AS vendor_name
	FROM oil_import AS i, vendor AS v
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.vendor_id=v.id
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

/* Procedure structure for procedure `searchSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleOil`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM oil_sale AS s, employee AS eo
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

/* Procedure structure for procedure `searchTripOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchTripOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchTripOil`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	select t.id, t.code, v.plate, t.created_date, t.amount, t.note
	from trip_oil as t, vehicle as v, employee as eo
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

/* Procedure structure for procedure `updateAgencyCommissionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateAgencyCommissionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAgencyCommissionDetail`(IN _id INT, IN _commission_from FLOAT, IN _commission_to FLOAT, IN _commission FLOAT)
BEGIN
	UPDATE agency_commission SET commission_from=_commission_from, commission_to=_commission_to, commission=_commission WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateAgencyCustomerDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateAgencyCustomerDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAgencyCustomerDetail`(IN _id INT, IN _commission_from FLOAT, IN _commission_to FLOAT, IN _commission FLOAT)
BEGIN
	UPDATE agency_customer_commission SET commission_from=_commission_from, commission_to=_commission_to, commission=_commission WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateBorrow` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateBorrow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateBorrow`(IN _id INT, IN _created_date VARCHAR(20), IN _employee_id INT, IN _total DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_total DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.total
	INTO _old_date, _organization_id, _old_account_id, _old_total
	FROM borrow AS f, employee AS eo
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_total<>_total OR _old_account_id<>_account_id THEN
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_old_date)=0  AND organization_id=_organization_id AND account_id=_old_account_id;
			UPDATE money_in_stock SET in_stock=in_stock - _old_total WHERE id=_in_stock_id;
			
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
		
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- money_in_stock
			SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
			IF _in_stock_id=0 THEN
				INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _total);
			ELSE
				UPDATE money_in_stock SET in_stock=in_stock + _total WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE borrow SET employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, total=_total
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateBorrowDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateBorrowDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateBorrowDetail`(IN _id INT, IN _pay_date VARCHAR(20), IN _amount DOUBLE)
BEGIN
	update borrow_detail set pay_date=STR_TO_DATE(_pay_date,'%m/%Y'), amount=_amount where id=_id;
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
	, IN _note TEXT, IN _actual_off_day float)
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOffIncrease`(IN _id INT, IN _created_date VARCHAR(20), IN _employee_id INT, IN _quantity int, IN _note TEXT, IN _dayoff_id INT)
BEGIN
	UPDATE employee_off_increase SET employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, note=_note
		, dayoff_id=_dayoff_id
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

/* Procedure structure for procedure `updateEmployeeOtherBonus` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeOtherBonus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOtherBonus`(IN _id INT, in _created_date varchar(20), IN _employee_id INT, IN _amount double, IN _note TEXT, IN _other_bonus_id INT)
BEGIN
	UPDATE employee_other_bonus SET employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, amount=_amount
		, note=_note
		, other_bonus_id=_other_bonus_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeePanelty` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeePanelty` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeePanelty`(IN _id INT, IN _created_date VARCHAR(20), IN _employee_id INT, IN _amount DOUBLE, IN _note TEXT, IN _panelty_id INT)
BEGIN
	UPDATE employee_panelty SET employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, amount=_amount
		, note=_note
		, panelty_id=_panelty_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeRouteFee` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeRouteFee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeRouteFee`(in _id int, IN _created_date VARCHAR(20), IN _employee_id INT, IN _vehicle_id INT, IN _route_id INT
	, IN _in_quantity int, IN _out_quantity INT, IN _price DOUBLE, IN _store TEXT, IN _note TEXT)
BEGIN
	DECLARE _total_quantity, _param100km, _param1000kg, _distance INT DEFAULT 0;
	DECLARE _amount DOUBLE DEFAULT 0;
	
	SELECT `value` INTO _param100km FROM parameter WHERE CODE='100km';
	SELECT `value` INTO _param1000kg FROM parameter WHERE CODE='1000kggas';
	SELECT distance INTO _distance FROM route WHERE id=_route_id;
	
	SET _total_quantity = _distance * _param100km / 100 + _in_quantity * _param1000kg / 1000;
	SET _amount = _total_quantity * _price;
	
	update employee_route_fee set created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, employee_id=_employee_id
		, vehicle_id=_vehicle_id
		, route_id=_route_id
		, in_quantity=_in_quantity
		, out_quantity=_out_quantity
		, param_100km=_param100km
		, param_1000kg=_param1000kg
		, total_quantity=_total_quantity
		, price=_price
		, amount=_amount
		, store=_store
		, note=_note
	where id=_id;
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
	IF _old_paid_debt<>_old_old_paid_debt or _old_paid_debt<>0 or _old_old_paid_debt<>0 THEN
		select id into _old_wholesale_debt_id from wholesale_debt where gas_wholesale_id=_id limit 1;
		if _old_wholesale_debt_id=0 then
			CALL insertDebtWholesale(CONCAT(_code,'_auto'), _customer_id, _created_date, _old_paid_debt, _account_id, '', _created_employee_id, 1, _id, @auto_id);
		else
			update wholesale_debt set paid=_old_paid_debt 
				, customer_id=_customer_id
				, paid=_old_paid_debt
				, account_id=_account_id
			where id=_old_wholesale_debt_id;
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

/* Procedure structure for procedure `updateOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilImport`(IN _id INT, IN _created_date VARCHAR(20), IN _commission FLOAT, IN _rate DOUBLE
	, IN _total_before_commission DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _store_id INT, IN _vendor_id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.paid, f.debt, f.vendor_id, f.account_id
	INTO _old_date, _organization_id, _old_paid, _old_debt, _old_vendor_id, _old_account_id
	FROM oil_import AS f, employee AS eo
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
	
	UPDATE oil_import SET rate=_rate
		, total_before_commission=_total_before_commission
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note
		, store_id=_store_id
		, vendor_id=_vendor_id
		, commission=_commission
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOilImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOilImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE, IN _created_date VARCHAR(20), in _store_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _oil_id, _unit_id, _base_unit_id, _rate_quantity, _old_rate_quantity, _old_store_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.quantity, fdet.oil_id, fdet.unit_id, f.store_id
	INTO _old_date, _organization_id, _old_quantity, _oil_id, _unit_id, _old_store_id
	FROM oil_import AS f, oil_import_detail AS fdet, employee AS eo
	WHERE fdet.id=_id AND fdet.oil_import_id=f.id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT base_unit_id INTO _base_unit_id FROM oil WHERE id=_oil_id;
		IF _base_unit_id<>_unit_id THEN
			SELECT rate INTO _rate_quantity FROM unit_rate WHERE parent_unit_id=_unit_id AND base_unit_id=_base_unit_id;
			IF _rate_quantity=0 THEN
				SET _rate_quantity = _quantity;
				SET _old_rate_quantity = _old_quantity;
			ELSE
				SET _old_rate_quantity = _rate_quantity * _old_quantity;
				SET _rate_quantity = _rate_quantity * _quantity;
			END IF;
		ELSE
			SET _rate_quantity=_quantity;
			SET _old_rate_quantity=_old_quantity;
		END IF;
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- oil_in_stock
			SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id and store_id=_old_store_id;
			UPDATE oil_in_stock SET in_stock=in_stock - _old_rate_quantity WHERE id=_in_stock_id;
	
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- oil_in_stock
			SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO oil_in_stock(`day`, organization_id, oil_id, store_id, in_stock) VALUES (_date, _organization_id, _oil_id, _store_id, _rate_quantity);
			ELSE
				UPDATE oil_in_stock SET in_stock=in_stock + _rate_quantity WHERE id=_in_stock_id;
			END IF;
		
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	END IF;
	
	UPDATE oil_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
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
			, advance_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
			, account_id=_account_id
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

/* Procedure structure for procedure `updateSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOil`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _commission FLOAT, IN _commission_kind INT
	, IN _commission_amount DOUBLE, IN _gap_agency_amount DOUBLE, IN _gap_customer_amount DOUBLE, IN _total_before_commission DOUBLE, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_paid, _old_debt DOUBLE DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, f.account_id, f.customer_id, f.paid, f.debt
	INTO _old_date, _organization_id, _old_account_id, _old_customer_id, _old_paid, _old_debt
	FROM oil_sale AS f, employee AS eo
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
	
	UPDATE oil_sale SET total=_total
		, customer_id=_customer_id
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, commission=_commission
		, commission_kind=_commission_kind
		, commission_amount=_commission_amount
		, gap_agency_amount=_gap_agency_amount
		, gap_customer_amount=_gap_customer_amount
		, total_before_commission=_total_before_commission
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleOilDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOilDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOilDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _price_before_commission DOUBLE, IN _commssion_price FLOAT, IN _first_amount DOUBLE, IN _commission FLOAT, IN _gap_agency_amount DOUBLE
	, IN _gap_customer_amount DOUBLE, IN _created_date VARCHAR(20))
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_quantity, _oil_id, _unit_id, _base_unit_id, _rate_quantity, _old_rate_quantity, _store_id INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
	SELECT f.created_date, eo.organization_id, fdet.oil_id, fdet.quantity, fdet.unit_id, fdet.store_id
	INTO _old_date, _organization_id, _oil_id, _old_quantity, _unit_id, _store_id
	FROM oil_sale_detail AS fdet, oil_sale AS f, employee AS eo
	WHERE fdet.id=_id AND f.id=fdet.oil_sale_id AND f.created_employee_id=eo.id;
	
	IF _old_date<>_date OR _old_quantity<>_quantity THEN
		SELECT base_unit_id INTO _base_unit_id FROM oil WHERE id=_oil_id;
		IF _base_unit_id<>_unit_id THEN
			SELECT rate INTO _rate_quantity FROM unit_rate WHERE parent_unit_id=_unit_id AND base_unit_id=_base_unit_id;
			IF _rate_quantity=0 THEN
				SET _rate_quantity = _quantity;
				SET _old_rate_quantity = _old_quantity;
			ELSE
				SET _old_rate_quantity = _rate_quantity * _old_quantity;
				SET _rate_quantity = _rate_quantity * _quantity;
			END IF;
		ELSE
			SET _rate_quantity=_quantity;
			SET _old_rate_quantity=_old_quantity;
		END IF;
		SELECT DATEDIFF(SYSDATE(),_old_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- oil_in_stock
			SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_old_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id and store_id=_store_id;
			UPDATE oil_in_stock SET in_stock=in_stock + _old_rate_quantity WHERE id=_in_stock_id;
	
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_old_date, INTERVAL 1 DAY) INTO _old_date;
		END WHILE;
	
		SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
		WHILE _date_diff>0 DO
			SET _in_stock_id=0;
			-- oil_in_stock
			SELECT id INTO _in_stock_id FROM oil_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND oil_id=_oil_id AND store_id=_store_id;
			IF _in_stock_id=0 THEN
				INSERT INTO oil_in_stock(`day`, organization_id, oil_id, store_id, in_stock) VALUES (_date, _organization_id, _oil_id, _store_id, -_rate_quantity);
			ELSE
				UPDATE oil_in_stock SET in_stock=in_stock - _rate_quantity WHERE id=_in_stock_id;
			END IF;
			SET _date_diff=_date_diff-1;
			SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
		END WHILE;
	
	END IF;
	
	UPDATE oil_sale_detail SET quantity=_quantity
		, price=_price
		, amount=_amount 
		, price_before_commission=_price_before_commission 
		, commission_price=_commssion_price 
		, first_amount=_first_amount 
		, commission=_commission 
		, gap_agency_amount=_gap_agency_amount 
		, gap_customer_amount=_gap_customer_amount 
	WHERE id=_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTripFee`(IN _id INT, IN _employee_id INT, IN _vehicle_id INT, IN _created_date VARCHAR(20), in _quantity int
	, in _price double, IN _amount DOUBLE, IN _fee text, IN _note TEXT)
BEGIN
	UPDATE trip_fee SET vehicle_id=_vehicle_id
		, employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, price=_price	
		, amount=_amount
		, fee=_fee
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateTripOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateTripOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTripOil`(IN _id INT, IN _employee_id INT, IN _vehicle_id INT, IN _created_date VARCHAR(20), IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _note TEXT)
BEGIN
	UPDATE trip_oil SET vehicle_id=_vehicle_id
		, employee_id=_employee_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, price=_price	
		, amount=_amount
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
	, IN _fax VARCHAR(50), IN _code VARCHAR(20), IN _organization_id INT, IN _status INT, IN _equal_organization_id INT, IN _commision_on_import FLOAT
	, IN _max_debt DOUBLE, in _has_stock int, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, IN _is_transport INT, IN _is_oil INT, in _id INT)
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
		, is_oil=_is_oil
		, commision_on_import=_commision_on_import
		, max_debt=_max_debt
	where id=_id;
	
	update shell set `status`=_status where vendor_id=_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
