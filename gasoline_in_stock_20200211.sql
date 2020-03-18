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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

insert  into `account`(`id`,`number`,`holder`,`bank`,`branch`,`organization_id`,`note`,`is_cash`) values (5,'Tiền mặt','Cao Huy Hoàng','Quang Trung','Quang Trung',1,'',1),(4,'6002201001366','Công ty TNHH Quang Trung','Agribank','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0),(7,'Tiền mặt','Hiệp Hương','Hiệp Hương','Hiệp Hương',14,'',1),(8,'34567890','Hiệp Hương','Sacombank','Gò Vấp, TP.HCM',14,'',0),(9,'050014822604','Công ty TNHH Quang Trung','Ngân hàng TMCP Sài Gòn Thương Tín (Sacombank)','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0),(10,'112002659273','Công ty TNHH Quang Trung','Ngân hàng TMCP Công Thương Việt Nam (Viettin)','Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu',1,'',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency` */

insert  into `agency`(`id`,`name`,`address`,`phone`,`note`,`status`) values (1,'Anh Thái','','','',1),(2,'THAI','','','',1);

/*Table structure for table `agency_commission` */

DROP TABLE IF EXISTS `agency_commission`;

CREATE TABLE `agency_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `commission_from` float DEFAULT NULL,
  `commission_to` float DEFAULT NULL,
  `commission` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency_commission` */

insert  into `agency_commission`(`id`,`agency_id`,`commission_from`,`commission_to`,`commission`) values (1,1,0,20,25),(2,1,20,100,27.5);

/*Table structure for table `agency_customer` */

DROP TABLE IF EXISTS `agency_customer`;

CREATE TABLE `agency_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agency_customer` */

insert  into `agency_customer`(`id`,`agency_id`,`customer_id`) values (9,1,228),(10,1,230),(11,1,229),(12,1,234),(13,1,322);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auto` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `borrow` */

/*Table structure for table `borrow_detail` */

DROP TABLE IF EXISTS `borrow_detail`;

CREATE TABLE `borrow_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrow_id` int(11) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `borrow_detail` */

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
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`code`,`name`,`organization_id`,`status`,`address`,`phone`,`bank_account`,`tax`,`presenter`,`presenter_position`,`is_gas`,`is_petro`,`is_good`,`is_oil`,`commission_percentage`,`commission_kind`,`note`) values (1,'TP','Công ty TNHH Gốm Tân Phát',1,1,'Lô số 164, Đường N1, Cụm công nghiệp Gốm sứ, Ấp 4, xã Tân Hạnh, Tp. Biên Hòa, Tỉnh Đồng Nai','0915. 87.36.37','','3603454432','Nguyễn Thị Thanh Thúy','Giám đốc',1,0,0,0,NULL,1,NULL),(2,'LPGHH','Cửa hàng LPG Huy Hoàng',1,1,'Số 125/5 ấp Phú Tâm, xã Hòa Hiệp, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','0988789713','','123456789','Nguyễn Tiến Công','Giám đốc',1,0,0,0,NULL,1,NULL),(9,'STXM','Cửa hàng Gas Sơn Trang',1,1,'Quốc lộ 55','2543777888','','','','',1,0,0,0,NULL,1,NULL),(11,'TMPB','Cửa hàng LPG Tài Mai',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(12,'ahtl','Ánh Hồng',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(13,'bbpt','Ba Bế',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(14,'bbl','Bảy Bàu Lâm',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(15,'bpb','Bắc Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(16,'hsbc','Hiền Soi Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(17,'mtlg','Mười Thúy',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(18,'thxm','Tấn Hùng',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(19,'tlpt','Thanh Liêm',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(20,'bcpb','Bé Cầu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(21,'chpb','Chí Hiếu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(22,'btpb','Bảy Thành',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(23,'bupb','Bưởi Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(24,'calg','Chị An',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(25,'capt','Carmelia Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(26,'qkxm','Quyền Kim',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(27,'ctsr','Chính Thức',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(28,'dhhb','Diệu Hiền',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(29,'dtbk','Duy Tuyên',1,1,'Bưng Kè, Xã Hoà Hiệp Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(30,'ddnth','Được Duy Nhất',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(31,'dpbc','Đại Phát',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(32,'gcbc','Gái Cường',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(33,'hbc','Hai Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(34,'hctl','Huyền Chương',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(35,'hdbk','Hoa Đào',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(36,'hhxm','Huy Hoàng Xuyên Mộc',1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(37,'hhbk','Hà Hương Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(38,'hlbk','Hoàng Lịch Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(39,'hmsm','Hán Minh',1,1,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(40,'hphh','Hùng Phát',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(41,'hqpt','Hoàng Quân',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(42,'hvhb','Hoàn Vân',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(43,'kbcm','Khánh Bằng',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(44,'kclg','Kim Chi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(45,'ksbc','Kim Sương',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(46,'ktbr','Kim Trọng Bưng Riềng',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(47,'kthtl','Kim Thúy Hậu',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(48,'khhh','Kim Hoa',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(49,'lpb','Loan Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(50,'lbc','Linh Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(51,'lhbk','Lý Hải',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(52,'lpt','Liên Đội 3',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(53,'lspb','Lịch Sử',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(54,'lthh','Lài Thi',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(55,'ltsr','Long Tứ',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(56,'mcpb','Minh Châu Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(57,'mdbc','Mỹ Dung',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(58,'mdsr','Minh Điệp',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(59,'mdubc','Minh Đức',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(60,'mnbc','Mầm Non Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(61,'mtbl','Minh Tuấn',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(62,'mtlg','Minh Tú',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(63,'ndpb','Nguyễn Du',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(64,'ntbl','Nguyên Thảo',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(65,'nttt','Ngọc Tâm',1,1,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(66,'pd46','Phạm Đăng',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(67,'plbc','Phú Lộc',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(68,'pm46','Phúc Mai',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(69,'pt46','Phụng Tập',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(70,'ptsr','Phương Thảo Sông Ray',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(71,'phsm','Phú Hoàng',1,1,'Xã Sơn Mỹ, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(72,'pthsr','Pháp Thanh',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(73,'qhh','Quang Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(74,'qvpb','Quang Vinh',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(75,'shbl','Sỹ Hường',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(76,'sqbc','Sáu Quế',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(77,'sbtr','Sanh Trại Gà',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(78,'stxm','Sơn Trang',1,2,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(79,'txm','Tùng Gas',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(80,'thh','Tâm Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(81,'tmpb','Tài Mai',1,2,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(82,'tbtr','Thanh Trại Gà',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(83,'tdbc','Thành Dung',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(84,'tdpt','Thảo Đại',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(85,'hpt','Huyền Trại Gà',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(86,'tghb','Trường Giang',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(87,'tbk','Tiên Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(88,'t46','Truyền',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(89,'tmbc','Thiên Mướp',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(90,'ttpb','Thanh Túy',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(91,'tslg','Tiến Sơn',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(92,'ttpt','Trung Thuận',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(93,'ttbc','Trung Thu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(94,'ttlg','Trung Thành',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(95,'tth','Thanh Tân Thắng',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(96,'tttt','Thành Tâm',1,1,'Xã Tân Thắng, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(97,'athh','Ái Thu',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(98,'ttbc','Tuấn Thanh',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(99,'tpt','Thanh Gò Cà Phước Thuận',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(100,'tktl','Thùy Khuyên',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(101,'tbk','Thơ Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(102,'thpt','Thúy Hoàng Phước Tân',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(103,'thpt','Toan Hoa',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(104,'tptl','Thúy Phương',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(105,'ttl','Thị Tân Lâm',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(106,'unpb','Út Nuôi',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(107,'vb46','Văn Bé',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(108,'vqhh','Vũ Quang',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(109,'xdbc','Xuân Đông',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(110,'xhh','Xuân Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(111,'xttl','Xuân Tú',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(112,'mhbc','Minh Hùng',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(113,'ta46','Tuấn Anh 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(114,'tth','Thúy Cầu Kiều',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(115,'dpt','Hùng Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(116,'htbk','Hương Thơm',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(117,'mpb','Mai Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(118,'ttbg','Tình Thủy',1,1,'Xã Bình Giã, Huyện Châu Đức, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(119,'hhhtn','Hồng Huyên',1,1,'Xã Hàm Thuận Nam, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(120,'ptpt','Phương Thảo Phan Thiết',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(121,'hhh','Huệ Hoà Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(122,'dhh','Dũng Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(123,'mhhb','Mỹ Hạnh',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(124,'htdn','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh',1,1,'39/1 Khu phố 3, Phường Tam Hiệp, Tp. Biên Hoà, Tỉnh Đồng Nai','','','3600874037','','',1,0,0,1,43,1,''),(125,'cnpt','Chi nhánh Phan Thiết',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(126,'dhh','Đoàn Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(127,'mcbc','Minh Châu Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(128,'bdqt','Bò Đốt Quang Trung',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(129,'gxbc','Giang Xuân Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(130,'vht','Vàng Hồ Tràm',1,1,'Xã Phước Thuận, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(131,'tbk','Thắng Bàu Ma Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(132,'qth','Quang Tân Thắng',1,1,'Xã Thắng Hải, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(133,'vpb','Vân Bà Tô',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(134,'blqt','Bán lẻ',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(135,'tbxt','Tình Bắc',1,1,'Xã Xuân Tây, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(136,'hpbk','Hiếu Phượng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(137,'hhcm','Huy Hoàng Cẩm Mỹ',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(138,'ktbc','Kiều Trang',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(139,'tbk','Trọng Cầu 5',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(140,'th10','Tạp Hóa 10',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(141,'hcbc','Huy Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(142,'qpbtr','Quốc Phong',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(143,'hcplg','Hùng Cường Phát',1,1,'Xã Long Giao, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(144,'tnbk','Tuyết Nhi',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(145,'mhxm','Minh Hiền',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(146,'dpxd','Dũng Phượng',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(147,'c46','Cường 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(148,'athtn','Gas An Toàn',1,1,'Thôn Lập Đức, Xã Tân Lập, Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(149,'dhh','Diễm Đội 2 Hòa Hội',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(150,'pnbk','Phúc Nguyên',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(151,'hhh','Hoa Đội 2',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(152,'spo','Công ty TNHH Supor Việt Nam',1,1,'Lô A-1-CN, KCN Mỹ Phước, phường Mỹ Phước, Thị Xã Bến Cát, Tỉnh Bình Dương','','','','','',1,0,0,0,NULL,1,NULL),(153,'thsr','Thanh Hà',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(154,'sbk','Sơn Bưng Kè',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(155,'hhb','Hòa Hòa Bình',1,1,'Xã Hoà Bình, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','0946721173','','','','',1,0,0,0,0,1,''),(156,'nhbtr','Ngọc Huyền',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(157,'htbc','Huyền Trang',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(158,'ttlg','Thanh Tuấn Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(159,'hpbr','Hương Phong Hồ Cốc',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(160,'anbk','Ánh Nhi',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(161,'nhcm','Nỡ Hoài',1,1,'Xã Hoàn Quân, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,0,1,''),(162,'thxm','Triệu Huy',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(163,'ybtr','Tạp hóa Yến',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,0,1,''),(164,'hbr','Hà Bưng Riềng',1,1,'Xã Bưng Riềng, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(165,'tha','Công ty TNHH Dầu Khí Thiên Hà',1,1,'95 Trịnh Đình Thảo, phường Phú Trung, quận Tân Phú, Tp. HCM','','','','','',1,0,0,0,NULL,1,NULL),(166,'ltl','Loan Tân Lâm',1,1,'Xã Tân Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(167,'nvqt','Nhân Viên Quang Trung',1,1,'Xã Bông Trang, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(168,'dpt','Dung Cây Điệp',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(169,'pppt','Phương Phát',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(170,'udpt','Uyên Đan',1,1,'Thành phố Phan Thiết, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(171,'htcm','Hà Tuấn Cẩm Mỹ',1,1,'Xã Xuân Bảo, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(172,'ntlg','Ngọc Tân Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(173,'h46','Hòe Trại Gà 46',1,1,'Ngã Tư 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(174,'vuc','Công ty TNHH Khí Hoá Lỏng Việt Úc',1,1,'Xã Sông Ray, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(175,'alcm','Ánh Linh',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(176,'hbchau','Hải Bình Châu Xuyên Mộc',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(177,'thcm','Trí Hải',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(178,'mphh','Minh Phương',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(179,'qclg','Quang Châu',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(180,'hhh','Hồng Đội 5',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(181,'thh','Tuyết Đội 2',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(182,'athtb','An Toàn Phan Thiết',1,1,'Lô 58/B1- KDC Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(183,'ttbl','Thảo Toàn',1,1,'Xã Bàu Lâm, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(184,'kacm','Kim Anh',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(185,'bpcm','Bảy Phước',1,1,'Xã Xuân Mỹ, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(186,'hhh','Hiền Đội 5',1,1,'Xã Hoà Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(187,'bapb','Bình An',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(188,'bmpb','Bình Minh Phước Bửu',1,1,'Thị trấn Phước Bửu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(189,'xhtb','Gas Xuân Hàm Thuận Bắc',1,1,'211/2 Thị trấn Phú Long, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận','','','','','',1,0,0,0,0,1,''),(190,'vcm','Gas Vui',1,1,'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(191,'hbc','Ngọc Hà Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(192,'klhtn','Kim Liên',1,1,'Huyện Hàm Thuận Nam, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(193,'hlcm','Hải Linh',1,1,'Xã Lâm San, Huyện Cẩm Mỹ, Tỉnh Đồng Nai','','','','','',1,0,0,0,NULL,1,NULL),(194,'mtbc','Minh Trọng',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(195,'tlg','Tuấn Lagi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(196,'hpt','Cô Hương Phước Tân',1,1,'Xã Phước Tân, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(197,'kthi','Kế Thi',1,1,'Thị Xã Lagi, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(198,'dbc','Đoàn Bình Châu',1,1,'Xã Bình Châu, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(199,'adung','Anh Dũng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(200,'hdung','Hoa Dũng',1,1,'Bưng Kè, Xã Hoà Hiệp, Huyện Xuyên Mộc, Tỉnh Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(201,'chue','Chị Huế Châu Đức',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(202,'ttung','Thanh Tùng Châu Đức',1,1,'Châu Đức, Bà Rịa Vũng Tàu','','','','','',1,0,0,0,NULL,1,NULL),(203,'bhoan','Bảo Hoan Châu Đức',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(204,'hnghia','Hiếu Nghĩa',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(205,'QT','Quang Trung',14,1,'','','','','','',1,0,0,0,NULL,1,NULL),(206,'gman1','Quán Gia Mẫn Xuyên Mộc',1,1,'Xã Xuyên Mộc, Huyện Xuyên Mộc, Tỉnh BRVT','','','','','',1,0,0,0,NULL,1,NULL),(207,'ploi','Phúc Lợi',1,1,'Ngã ba 46, Huyện Hàm Tân, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(208,'luc','Lực Gas Xà Bang Châu Đức',1,1,'Xã Xà Bang, Huyện Châu Đức, Tỉnh BRVT','','','','','',1,0,0,0,NULL,1,NULL),(209,'dloc','Đại Lộc Châu Đức',1,1,'Huyện Châu Đức, Tỉnh BRVT','','','','','',1,0,0,0,NULL,1,NULL),(210,'bdanh','Bảo Danh',1,1,'Chợ Tân Nghĩa, Tỉnh Bình Thuận','','','','','',1,0,0,0,NULL,1,NULL),(211,'mtam','Minh Tâm',1,1,'Bình Giã, Châu Đức, BRVT','','','','','',1,0,0,0,NULL,1,NULL),(212,'kdung','Kim Dung',1,1,'Kim Long, Châu Đức, BRVT','','','','','',1,0,0,0,NULL,1,NULL),(213,'hthanh','Hai Thành',1,1,'Xã Xà Bang, Huyện Châu Đức, Tỉnh BRVT','','','','','',1,0,0,0,NULL,1,NULL),(214,'snga','Sơn Nga',1,1,'Cù Bị, Châu Đức, BRVT','','','','','',1,0,0,0,NULL,1,NULL),(215,'cbich','Cô Bích',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(216,'quhh','Quốc Hoà Hội',1,1,'Hoà Hội, Xuyên Mộc, BRVT','','','','','',1,0,0,0,NULL,1,NULL),(217,'ctrinh','Cô Trinh Châu Đức',1,1,'Giáo Xứ Xuân Trường, Huyện Châu Đức, Tỉnh BRVT','0937765767','','','','',1,0,0,0,NULL,1,NULL),(218,'VIMEXCO','Công ty CP Thương Mại va Dịch Vụ Dầu Khí Vũng Tàu',1,1,'','','','','','',1,0,1,0,NULL,1,NULL),(219,'NVP','Nam Việt Phát',1,1,'','','','','','',1,0,0,0,NULL,1,NULL),(220,'dy','Dũng Yến',1,1,'xã Lâm San, Huyện Cẩm Mỹ , Tỉnh Đồng Nai','0984400778','','','','',1,0,0,0,NULL,1,NULL),(221,'vxuyen','Văn Xuyến',1,1,'lagi , bình thuận','0985266743','','','','',1,0,0,0,0,1,''),(222,'xthi','Xuân Thi Châu Đức',1,1,'Tổ 4 Sơn Thuận, Xã Xuân Sơn, H Châu Đức, Tỉnh BRVT','0334555408','','','','',1,0,0,0,NULL,1,NULL),(223,'tphat','Thành Phát Châu Đức',1,1,'ngãi giao,châu đức','0988665377','','','','',1,0,0,0,NULL,1,NULL),(224,'mquoc','Minh Quốc Châu Đức',1,1,'','0643917418','','','','',1,0,0,0,NULL,1,NULL),(225,'gtri','Gas Trí',1,1,'HTN,bình thuận','0387744380','','','','',1,0,0,0,NULL,1,NULL),(226,'ATh','Công Ty An Thuận',1,1,'','','','','','',1,1,1,0,NULL,1,NULL),(227,'H thanh','công ty gốm Hoàn Thành',1,1,'','','','','','',1,0,1,0,NULL,1,NULL),(228,'PN','Vật liệu xây dựng Phương Nam',1,1,'','','','','','',0,0,0,1,20,1,NULL),(229,'thai-dongtam','Công ty Xây lắp Đồng Tâm',1,1,'08, Nguyễn Văn Trỗi,Tân An, Lagi, BT','0987 114 745','','','','',0,0,1,1,20,1,NULL),(230,'thai-ctcongcong','Công ty Công trình công cộng Tx. Lagi',1,1,'585 Thống Nhất, Tân An, Lagi, BT','0396 770 690','','','','',0,0,1,1,20,1,NULL),(232,'CMINH','Chung Minh',1,1,'','','','','','',1,0,0,0,0,1,''),(233,'nb','Xuất nội bộ',1,1,'','','','','','',1,0,0,1,0,1,''),(234,'thai-chai','Đại Lý Chị Hai',1,1,'Võ Thị Sáu, Bình Tân, lagi, Bình Thuận (đối diện số 28 Võ thị Sáu)','0979 758 678','','','','',0,0,0,1,15,1,''),(235,'cxbungke','Cây Xăng Bưng Kè',1,1,'Bưng kè, XM, BRVT','0382509332','','','Bác Hạnh','',0,0,0,1,28,1,''),(236,'niwahotro','Niwa hỗ trợ lấy hàng',1,1,'Lô H6, Đường sỗ, KCN Hải Sơn (GD3+4), X. Đức Hòa Hạ, H. Đức Hòa, Long An','0963 344 123 Thư','','','','',0,0,0,1,0,1,''),(237,'hoangdung','Xe máy Hoàng Dũng',1,1,'Rửa xe bờ hồ, Bato','0933346085','','','','',0,0,0,1,0,1,'1 thùng tặng 3 bình'),(238,'baohieu','Gara xe Lê Bảo Hiếu',1,1,'Bato (Sau bưu điện)','0888429489','','','','',0,0,0,1,10,1,''),(239,'a.khuong','Gara xe Anh Khương',1,1,'Bờ hồ, Bato','0989623825','','','','',0,0,0,1,10,1,''),(240,'thanhdanh','Đại lý Thành Danh',1,1,'Bình Châu','0917752119','','','c Bắc','',0,0,0,1,10,1,''),(241,'trunghieu','Gara Trung Hiếu',1,1,'Bình Châu','0398833398','','','','',0,0,0,1,10,1,''),(242,'thienphat','Đại lý Thiện Phát',1,1,'Hàm Tân, Bình Châu','0979543434','','','','',0,0,0,1,20,1,''),(243,'nhanvien','Xuất bán Nhân viên',1,1,'Quang Trung','','','','','',0,0,0,1,10,1,''),(244,'chxdqt','Cửa hàng xăng dầu Quang Trung',1,1,'Bình Châu','025433871166','','','','',1,0,0,1,0,1,''),(245,'quangthach','Sửa xe Quang Thạch',1,1,'Ấp Bình Minh, Bình Châu(gần nhà hàng Hoa Ngọc)','0367420202','','','','',0,0,0,1,0,1,'xe máy 3 tặng 1'),(246,'na','Sửa xe Na',1,1,'241, đường 27/4, Phước Bửu','0976005177','','','','',0,0,0,1,10,1,''),(247,'oto1','Gara ô tô số 1',1,1,'QL55,Phước Bửu, XM, BRVT','0395732113','','','a. Phương','',0,0,0,1,10,1,''),(248,'haicau','Cứu hộ ô tô Hai Cầu',1,1,'46/4 Ấp 1, Xã Bưng Riềng, Xm, BRVT','0933696363','','','','',0,0,0,1,10,1,''),(249,'bacthinh','Bác Thịnh',1,1,'115/1 Ấp Láng Găng, Bình Châu (Nhà máy nước đá đối diện Biên Phòng)','0918543619','','','','',0,0,0,1,20,1,'hổ trợ giảm 100k/ xô'),(250,'anhchien','Anh Chiến',1,1,'Trạm điều hành xe bus - bến xe bình châu','0975344399','','','','',0,0,0,1,10,1,''),(251,'thaithuy','Đại Lý Thái Thúy',1,1,'Bình Hòa, Bình Châu','0385370549','','','','',0,0,0,1,20,1,'hổ trợ giảm 100k/ xô'),(252,'ahong','Gara máy nông nghiệp A Hồng',1,1,'Bato, XM','0987003406','','','','',0,0,0,1,10,1,''),(253,'adung','Tiệm rữa xe thay nhớt Anh Dũng',1,1,'Bông Trang (Đối diện trường mầm non Bông Trang)','0908397810','','','','',0,0,0,1,10,1,''),(254,'hoadiep','Gara Hoa Điệp',1,1,'78 Trương Công Định,Tp. Vũng Tàu','0937614704','','','','',0,0,0,1,20,1,''),(255,'hoanghai','Sửa xe Hoàng Hải',1,1,'Bùng binh BV XM','0948384627','','','','',0,0,0,1,0,1,'xe máy 3 tặng 1'),(256,'bienphongBC','Đồn Biên Phòng Bình Châu',1,1,'Bình Châu','0974999488','','','','',0,0,0,1,28,1,''),(257,'lac','Gara xe Lạc',1,1,'Ấp Thèo Lèo, Bình Châu','02543707269','','','','',0,0,0,1,20,1,''),(258,'hoanganh','Rửa xe Hoàng Anh',1,1,'Hòa Hiệp, XM','0962064139','','','Anh Nam','',0,0,0,1,28,1,''),(259,'tienvu','Gara Tiến Vũ',1,1,'Ấp Nhân Trung, XM','0972833557','','','','',0,0,0,1,20,1,''),(260,'chinhtam','Cửa hàng Chính Tâm',1,1,'Bình Châu, XM','972018067','','','','',0,0,0,1,20,1,''),(261,'hieu','Anh Hiếu',1,1,'70 Phan Đình Phùng, Phước Lộc, lagi, BT','0903318812','','','','',0,0,0,1,25,1,''),(262,'anhnhi','Gara Anh Nhi',1,1,'Cầu 3 Hòa Hội, XM','0387005677','','','','',0,0,0,1,15,1,''),(263,'adong','Gara anh Đông',1,1,'Bato, XM','0906628528','','','','',0,0,0,1,15,1,''),(264,'anga','Tiệm sửa xe Ngà',1,1,'Bông Trang(gần Hotel Hoàng Thanh Thủy)','0933850299','','','','',0,0,0,1,0,1,'xe máy 3 tặng 1'),(265,'thachbl','Rử xe Thạch',1,1,'Ấp 4, Suối Lê, Tân Lâm','0367484748','','','','',0,0,0,1,10,1,'10 tặng 1'),(266,'dungbl','Rữa xe Anh Dũng',1,1,'Ấp 1 Bàu Lâm','0386833739','','','','',0,0,0,1,0,1,'xe máy 3 tặng 1'),(267,'dai','Điện cơ Đại',1,1,'08, Bến Chương Dương, Kp1, Phước Lộc,Lagi, BT','01227172544','','','','',0,0,0,1,25,1,''),(268,'quangvinh','Gara Quang Vinh',1,1,'Đường Trần Phú, KP. Láng sim, Phước Bửu','0886067639','','','','',0,0,0,1,15,1,''),(269,'thai-minhtam','VLXD Minh Tâm',1,1,'Sơn Mỹ,Hàm Tân, BT','0966870937','','','','',0,0,0,1,15,1,''),(270,'thai-linhquan','Đoàn xe Linh Quân',1,1,'166 QL55, Lagi, BT','0379970248','','','','',0,0,0,1,15,1,''),(271,'thai-atuan','Gara Anh Tuấn',1,1,'Lê Thánh Tôn, Tân Tiến,Lagi (Qua đường vào dinh thầy Thím 200m bên trái)','','','','','',0,0,0,1,15,1,''),(272,'hungthinh','công ty TNHH KHL Hưng Thịnh',1,2,'','','','','','',0,0,0,0,38,1,''),(273,'thai-phucloctho','VLXD Phúc Lộc Thọ',1,1,'100,Nguyễn Chí Thanh,Tân Bình,Lagi','097748818','','','','',0,0,0,1,15,1,''),(274,'thai-atien','VLXD Trí Vân',1,1,'95 Nguyễn Trãi,Bình Tân,Lagi','0918591272','','','','',0,0,0,1,0,1,''),(275,'thai-nhonngoc','Nhà xe Nhơn Ngọc',1,1,'Chợ Thanh Lịch,LaGi','0903131410','','','','',0,0,0,1,10,1,''),(276,'thai-thanhxuan','VLXD Thanh Xuân',1,1,'75,CMT8,Tân Bình,LaGi','0918790101','','','','',0,0,0,1,0,1,''),(277,'thai-atiet','Anh Tiết',1,1,'Đường Nguyễn Du,LaGI,BT','0908502843','','','','',0,0,0,1,0,1,''),(278,'thai-anhthai','Anh Thái',1,1,'51,QL55,LaGi,BT','0978104106','','','','',0,0,0,1,0,1,''),(279,'thai-akhiet','Nhà xe Anh Khiết',1,1,'283 Thống Nhất,Lagi,BT','0919742229','','','','',0,0,0,1,0,1,''),(280,'thai-tuyethuong','Cây xăng dầu Tuyết Phương',1,1,'Cảng cá Lagi  BT','0654606089','','','','',0,0,0,1,0,1,''),(281,'thai-ahao','Nhà xe A Hảo',1,1,'LaGi BT','0907348392','','','','',0,0,0,1,0,1,''),(282,'thai-huyhoang','Gara Huy Hoàng',1,1,'274 Ngô Quyền, Tân An ,LaGi','0908658864','','','','',0,0,0,1,0,1,''),(283,'thai-alua','Anh Lua',1,1,'96 Thống Nhất,LaGi','0902522140','','','','',0,0,0,1,0,1,''),(284,'thai-phuongnam','VLXD Phương Nam',1,1,'QL55,Thôn 1,Sơn Mỹ,LaGi','0938644167','','','','',0,0,0,1,0,1,''),(285,'thai-hungloan','DNTN Tiệm vàng Kim Hùng Loan',1,1,'155 Lê Thánh Tôn,Tân Hải,Lagi','0984285050','','','','',0,0,0,0,0,1,''),(286,'thai-thanhtoan','Công ty xây dựng Thanh Toàn',1,1,'NGô Quyền ,Lagi,BT','0902914066','','','','',0,0,0,1,0,1,''),(287,'hoanghai ptan','Hoàng Hải',1,1,'Thạnh Sơn 2B,Phước Tân','0973781751','','','','',0,0,0,1,0,1,''),(288,'thai-nghiabinh','VLXD Nghĩa Bình',1,1,'Nguyễn Minh Châu,Hiệp Phú,Tân Tiến,LaGi,BT','0984168628','','','','',0,0,0,1,0,1,''),(289,'antoan','Đại lý Gas An Toàn',1,2,'','0937523492','','','','',0,0,0,0,0,1,'Lo6/b1,kDC bến lội,Lại An,Hàm Thắng,Hàm Thuận Bắc,Bình Thuận'),(290,'hainam','Rửa xe Hải Nam',1,1,'Số 11,Phạm Văn Đồng,XM','0933413241','','','','',0,0,0,1,0,1,''),(291,'thai-caothanh','VLXD Cao Thanh',1,1,'04 Nguyễn Trãi,KP5,Bình Tân,TX.Lagi,BT','','','','','',0,0,0,1,0,1,''),(292,'thai-cuutruong','Cửa hàng VLXD Cửu Trường',1,1,'','0908123648','','','','',0,0,0,0,0,1,''),(293,'acuong','A Cường',1,1,'Hẻm Lotte ,đại lộ Hùng Vương,Tp.Phan Thiết','0961152501','','','','',0,0,0,1,0,1,''),(294,'songkinh','Rửa xe thay nhớt Sông Kinh',1,1,'Phước Bửu,XM,BRVT','0969541342','','','','',0,0,0,1,0,1,''),(295,'thai-vuatramcuonganh','Công ty TNHH Hửu Tiến',1,1,'Đường số 9,Sơn Mỹ,Hàm Tân','0901 292 828','','','','',0,0,0,1,0,1,''),(296,'anhsinh','Anh Sinh',1,1,'58 Lý Thái Tổ,Tân Tiến,Lagi','0976 686 445','','','','',0,0,0,1,0,1,''),(297,'cxduchanh','Cây xăng Đức Hạnh',1,1,'Đường D9T,xã Đức Hạnh,H.Đức Linh,T Bình Thuận','090 161 8648','','','','',0,0,0,1,0,1,''),(298,'tuanhien','Cửa hàng Tuấn Hiền',1,1,'Ấp 3 ,Bưng Riềng','0937 137 623','','','','',0,0,0,1,0,1,''),(299,'anhvu','Sửa xe Anh Vũ',1,1,'Sông Kinh','0901262 867','','','','',0,0,0,1,0,1,''),(300,'anhhai','Anh Hải',1,1,'Số 149 ,đường 27/4 Phước Bửu,XM','0907 445 044','','','','',0,0,0,1,0,1,''),(301,'anhlam','Anh Lâm',1,1,'Ấp 3,Bưng Riềng','093370227','','','','',0,0,0,1,0,1,''),(302,'thai-binhan','VLXD Bình An',1,1,'156 Nguyễn Chí Thanh,LaGi,BT','0987 919 884','','','','',0,0,0,1,0,1,''),(303,'nypt','Như Ý',1,1,'Xã Phước Tân, Xuyên Mộc, BRVT','0987512267','','','','',1,0,0,0,0,1,''),(304,'dvan','Duy Vân',1,1,'','','','','','',1,0,0,0,0,1,''),(305,'aqcd','Anh Quyền',1,1,'Xuân Sơn, Châu Đức, BRVT','0355554080','','','','',1,0,0,0,0,1,''),(306,'opt','Oanh Phước Tân (Gái Trung)',1,1,'Tân Lâm, Xuyên Mộc, BRVT','0976037799','','','','',1,0,0,0,0,1,''),(307,'ctdp','Công ty TNHH Dầu Khí Đại Phát',1,1,'Biên Hòa, Đồng Nai','','','','','',1,0,0,0,0,1,''),(308,'ktbt','Cơm chay Khai Tâm',1,1,'Bà tô, Xuyên Mộc, BRVT','','','','','',1,0,0,0,0,1,''),(309,'ctxm','Cơm Tâm Xuyên Mộc',1,1,'Xuyên Mộc, BRVT','0913027737','','','','',1,0,0,0,0,1,''),(310,'gllg','Gas Liêm',1,1,'Lagi, Bình Thuận','0977163071','','','','',1,0,0,0,0,1,''),(311,'nhkl','Nam Hùng',1,1,'Kim Long, Châu Đức','0774924698','','','','',1,0,0,0,0,1,''),(312,'dnhh','Dung Ngọc',1,1,'Hòa Hiệp, Xuyên Mộc','0398768121','','','','',1,0,0,0,0,1,''),(313,'gixm','Giang Trại gà',1,1,'Láng Dài, XM, BRVT','','','','','',1,0,0,0,0,1,''),(314,'hhh','Cô Hằng Hòa Hội',1,1,'Hòa Hội,Xm, BRVT','','','','','',1,0,0,0,0,1,''),(315,'hlxm','Nhà hàng Hoài Lan',1,1,'Xuyên Mộc, BRVT','06235650190','','','','',1,0,0,0,0,1,''),(316,'Thachbl','Rửa xe Thạch',1,1,'Ấp 4, Suối Lê, Tân Lâm','0166 7484748','','','','',0,0,0,1,0,1,''),(317,'antoan','Đại lý Gas An Toàn',1,1,'Lô 58/B1,KDC Bến Lội,Lại An,,Hàm Thắng,Hàm Thuận Bắc,Bình Thuận','0937523492','','','','',0,0,0,1,0,1,''),(318,'thai-aty','Gara Anh Tý',1,1,'','0987919884','','','','',0,0,0,0,0,1,''),(319,'phuoc','Phước',1,1,'','','','','','',1,0,0,0,0,1,''),(320,'qđpt','Quang Đô',1,1,'Suối Rao, Phước tân','0983083378','','','','',1,0,0,0,0,1,''),(321,'manh','Mai Anh',1,1,'Bình Châu, Xuyên Mộc, BRVT','0907337288','','','Song','',1,0,0,0,0,1,''),(322,'thai-anhphu','Nhà xe Kim Châu',1,1,'Chợ Tân thắng, xã Tân Thắng,Lagi,BT','0935348377','','','Anh Phú','',0,0,0,1,20,1,'');

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
) ENGINE=InnoDB AUTO_INCREMENT=1536 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_in_stock` */

insert  into `customer_in_stock`(`id`,`day`,`customer_id`,`shell_12`,`shell_45`,`amount`,`transport_amount`) values (1,'2019-10-21',205,0,0,0,0),(2,'2019-10-21',293,0,0,18054720,0),(3,'2019-10-21',97,5,0,700000,0),(4,'2019-10-21',182,29,18,0,0),(5,'2019-10-21',250,0,0,2142000,0),(6,'2019-10-21',199,3,0,2841000,0),(7,'2019-10-21',300,0,0,1732500,0),(8,'2019-10-21',261,0,0,0,0),(9,'2019-10-21',12,0,0,0,0),(10,'2019-10-21',301,0,0,899100,0),(11,'2019-10-21',175,10,0,1000000,0),(12,'2019-10-21',283,0,0,0,0),(13,'2019-10-21',160,0,0,0,0),(14,'2019-10-21',305,10,0,0,0),(15,'2019-10-21',296,0,0,0,0),(16,'2019-10-21',278,0,0,88534825,0),(17,'2019-10-21',277,0,0,0,0),(18,'2019-10-21',13,0,0,0,0),(19,'2019-10-21',15,22,4,580000,0),(20,'2019-10-21',249,0,0,0,0),(21,'2019-10-21',134,0,0,0,0),(22,'2019-10-21',210,10,0,0,0),(23,'2019-10-21',203,5,0,0,0),(24,'2019-10-21',14,0,0,0,0),(25,'2019-10-21',185,0,0,0,0),(26,'2019-10-21',22,5,0,7020000,0),(27,'2019-10-21',20,0,0,0,0),(28,'2019-10-21',187,10,0,0,0),(29,'2019-10-21',188,5,0,0,0),(30,'2019-10-21',128,0,0,0,0),(31,'2019-10-21',23,10,0,0,0),(32,'2019-10-21',25,0,0,0,0),(33,'2019-10-21',235,0,0,24982176,0),(34,'2019-10-21',280,0,0,4379000,0),(35,'2019-10-21',297,0,0,0,0),(36,'2019-10-21',24,20,0,0,0),(37,'2019-10-21',21,0,0,0,0),(38,'2019-10-21',201,0,8,0,0),(39,'2019-10-21',125,248,312,0,0),(40,'2019-10-21',27,5,0,0,0),(41,'2019-10-21',232,10,16,5726000,0),(42,'2019-10-21',215,0,0,0,0),(43,'2019-10-21',314,5,0,0,0),(44,'2019-10-21',196,5,0,0,0),(45,'2019-10-21',217,10,0,0,0),(46,'2019-10-21',308,0,5,0,0),(47,'2019-10-21',309,0,1,0,0),(48,'2019-10-21',226,0,0,0,0),(49,'2019-10-21',230,0,0,31225750,0),(50,'2019-10-21',218,0,0,0,0),(51,'2019-10-21',227,0,0,0,0),(52,'2019-10-21',307,0,0,68085038,0),(53,'2019-10-21',165,0,0,0,0),(54,'2019-10-21',1,0,0,0,0),(55,'2019-10-21',295,0,0,0,0),(56,'2019-10-21',124,0,0,-2253643566,0),(57,'2019-10-21',174,0,0,0,0),(58,'2019-10-21',152,0,0,1404320461,0),(59,'2019-10-21',286,0,0,0,0),(60,'2019-10-21',229,0,0,195068500,0),(61,'2019-10-21',260,0,0,2811000,0),(62,'2019-10-21',9,0,4,4900000,0),(63,'2019-10-21',2,0,0,0,0),(64,'2019-10-21',11,29,17,12731000,0),(65,'2019-10-21',298,0,0,0,0),(66,'2019-10-21',292,0,0,0,0),(67,'2019-10-21',244,0,0,0,0),(68,'2019-10-21',147,10,0,0,0),(69,'2019-10-21',248,0,0,1105200,0),(70,'2019-10-21',149,8,0,0,0),(71,'2019-10-21',28,39,13,18897000,0),(72,'2019-10-21',285,0,0,11550600,0),(73,'2019-10-21',168,0,0,0,0),(74,'2019-10-21',122,0,0,0,0),(75,'2019-10-21',312,0,3,0,0),(76,'2019-10-21',146,48,0,4020000,0),(77,'2019-10-21',220,0,0,0,0),(78,'2019-10-21',29,80,9,3000000,0),(79,'2019-10-21',304,10,0,0,0),(80,'2019-10-21',209,0,0,0,0),(81,'2019-10-21',234,0,0,31725000,0),(82,'2019-10-21',251,0,0,8664000,0),(83,'2019-10-21',240,0,0,993600,0),(84,'2019-10-21',242,0,1,0,0),(85,'2019-10-21',31,0,0,0,0),(86,'2019-10-21',267,0,0,0,0),(87,'2019-10-21',198,19,0,0,0),(88,'2019-10-21',126,0,0,0,0),(89,'2019-10-21',270,0,0,0,0),(90,'2019-10-21',256,0,0,0,0),(91,'2019-10-21',30,0,0,0,0),(92,'2019-10-21',32,0,0,0,0),(93,'2019-10-21',263,0,0,0,0),(94,'2019-10-21',262,0,0,26104600,0),(95,'2019-10-21',271,0,0,7254000,0),(96,'2019-10-21',254,0,0,0,0),(97,'2019-10-21',282,0,0,2827500,0),(98,'2019-10-21',252,0,0,0,0),(99,'2019-10-21',247,0,0,7149600,0),(100,'2019-10-21',268,0,0,10355380,0),(101,'2019-10-21',259,0,0,2490000,0),(102,'2019-10-21',241,0,0,2574000,0),(103,'2019-10-21',239,0,0,22556700,0),(104,'2019-10-21',257,0,0,9254790,0),(105,'2019-10-21',238,0,0,4865400,0),(106,'2019-10-21',148,0,0,0,0),(107,'2019-10-21',310,50,8,5670000,0),(108,'2019-10-21',225,5,0,0,0),(109,'2019-10-21',190,0,0,0,0),(110,'2019-10-21',189,5,0,0,0),(111,'2019-10-21',313,5,20,0,0),(112,'2019-10-21',129,10,0,0,0),(113,'2019-10-21',164,0,0,687000,0),(114,'2019-10-21',37,0,0,0,0),(115,'2019-10-21',171,68,4,26000000,0),(116,'2019-10-21',33,0,0,0,0),(117,'2019-10-21',176,0,0,0,0),(118,'2019-10-21',193,0,0,0,0),(119,'2019-10-21',213,100,10,7080000,0),(120,'2019-10-21',39,0,0,0,0),(121,'2019-10-21',186,4,0,0,0),(122,'2019-10-21',16,5,0,0,0),(123,'2019-10-21',204,0,0,220000,0),(124,'2019-10-21',136,5,0,0,0),(125,'2019-10-21',200,10,0,0,0),(126,'2019-10-21',35,34,0,17316000,0),(127,'2019-10-21',151,0,0,0,0),(128,'2019-10-21',155,0,0,0,0),(129,'2019-10-21',42,30,0,3981000,0),(130,'2019-10-21',287,0,0,0,0),(131,'2019-10-21',38,0,0,0,0),(132,'2019-10-21',41,40,5,0,0),(133,'2019-10-21',173,0,0,0,0),(134,'2019-10-21',180,4,0,0,0),(135,'2019-10-21',119,26,18,0,0),(136,'2019-10-21',121,0,0,0,0),(137,'2019-10-21',143,0,0,0,0),(138,'2019-10-21',115,10,0,0,0),(139,'2019-10-21',40,3,0,0,0),(140,'2019-10-21',159,0,0,0,0),(141,'2019-10-21',116,0,0,0,0),(142,'2019-10-21',141,0,4,0,0),(143,'2019-10-21',137,0,0,0,0),(144,'2019-10-21',34,10,0,0,0),(145,'2019-10-21',85,0,9,19812000,0),(146,'2019-10-21',157,0,0,0,0),(147,'2019-10-21',197,0,0,0,0),(148,'2019-10-21',43,23,0,0,0),(149,'2019-10-21',138,0,0,0,0),(150,'2019-10-21',184,0,0,0,0),(151,'2019-10-21',44,60,17,2577000,0),(152,'2019-10-21',212,20,7,0,0),(153,'2019-10-21',48,0,0,0,0),(154,'2019-10-21',192,0,0,0,0),(155,'2019-10-21',45,0,0,0,0),(156,'2019-10-21',47,20,2,8000000,0),(157,'2019-10-21',46,40,9,0,0),(158,'2019-10-21',54,8,0,0,0),(159,'2019-10-21',53,10,0,0,0),(160,'2019-10-21',52,13,1,1130000,0),(161,'2019-10-21',50,44,31,13780000,0),(162,'2019-10-21',49,10,2,0,0),(163,'2019-10-21',166,0,0,0,0),(164,'2019-10-21',55,25,0,0,0),(165,'2019-10-21',208,0,0,0,0),(166,'2019-10-21',51,0,0,0,0),(167,'2019-10-21',117,1,0,0,0),(168,'2019-10-21',60,3,0,0,0),(169,'2019-10-21',127,0,0,100000,0),(170,'2019-10-21',56,0,5,0,0),(171,'2019-10-21',58,16,5,0,0),(172,'2019-10-21',59,10,0,3367000,0),(173,'2019-10-21',145,15,0,0,0),(174,'2019-10-21',112,13,0,0,0),(175,'2019-10-21',178,15,0,0,0),(176,'2019-10-21',224,10,0,0,0),(177,'2019-10-21',211,40,6,24116000,0),(178,'2019-10-21',194,20,0,5720000,0),(179,'2019-10-21',62,0,0,0,0),(180,'2019-10-21',61,18,1,3344000,0),(181,'2019-10-21',17,8,0,1774000,0),(182,'2019-10-21',57,4,0,0,0),(183,'2019-10-21',123,0,0,3557000,0),(184,'2019-10-21',311,20,0,0,0),(185,'2019-10-21',219,0,0,0,0),(186,'2019-10-21',191,0,0,0,0),(187,'2019-10-21',156,0,0,0,0),(188,'2019-10-21',65,10,2,3823000,0),(189,'2019-10-21',172,5,0,0,0),(190,'2019-10-21',63,0,0,0,0),(191,'2019-10-21',64,0,0,0,0),(192,'2019-10-21',281,0,0,0,0),(193,'2019-10-21',279,0,0,0,0),(194,'2019-10-21',275,0,0,0,0),(195,'2019-10-21',167,0,0,0,0),(196,'2019-10-21',303,10,0,0,0),(197,'2019-10-21',236,0,0,0,0),(198,'2019-10-21',161,20,6,0,0),(199,'2019-10-21',306,7,0,0,0),(200,'2019-10-21',66,20,4,0,0),(201,'2019-10-21',72,0,0,0,0),(202,'2019-10-21',71,25,0,0,0),(203,'2019-10-21',67,0,0,0,0),(204,'2019-10-21',207,0,0,0,0),(205,'2019-10-21',68,0,0,0,0),(206,'2019-10-21',150,0,0,0,0),(207,'2019-10-21',69,0,0,0,0),(208,'2019-10-21',169,0,7,9240000,0),(209,'2019-10-21',120,100,8,0,0),(210,'2019-10-21',70,10,0,0,0),(211,'2019-10-21',206,14,0,4160000,0),(212,'2019-10-21',179,17,2,0,0),(213,'2019-10-21',73,3,0,0,0),(214,'2019-10-21',132,20,0,0,0),(215,'2019-10-21',74,10,0,0,0),(216,'2019-10-21',216,0,0,0,0),(217,'2019-10-21',142,38,24,1621000,0),(218,'2019-10-21',26,1,0,9029000,0),(219,'2019-10-21',265,0,0,0,0),(220,'2019-10-21',266,0,0,1757320,0),(221,'2019-10-21',290,0,0,4615500,0),(222,'2019-10-21',258,0,0,49096750,0),(223,'2019-10-21',294,0,0,7267500,0),(224,'2019-10-21',77,0,2,1000000,0),(225,'2019-10-21',76,0,0,0,0),(226,'2019-10-21',154,3,1,0,0),(227,'2019-10-21',214,20,0,0,0),(228,'2019-10-21',299,0,0,735000,0),(229,'2019-10-21',255,0,0,3021500,0),(230,'2019-10-21',246,0,0,1281600,0),(231,'2019-10-21',245,0,0,0,0),(232,'2019-10-21',75,10,3,0,0),(233,'2019-10-21',80,0,0,0,0),(234,'2019-10-21',18,19,0,4809000,0),(235,'2019-10-21',140,0,0,0,0),(236,'2019-10-21',163,0,0,0,0),(237,'2019-10-21',131,5,0,0,0),(238,'2019-10-21',83,10,4,0,0),(239,'2019-10-21',99,0,0,0,0),(240,'2019-10-21',153,0,0,0,0),(241,'2019-10-21',19,15,0,512000,0),(242,'2019-10-21',223,20,11,0,0),(243,'2019-10-21',96,25,2,1954000,0),(244,'2019-10-21',95,40,3,0,0),(245,'2019-10-21',82,0,19,11208000,0),(246,'2019-10-21',158,40,70,10000000,0),(247,'2019-10-21',202,30,1,3945000,0),(248,'2019-10-21',90,44,0,9477000,0),(249,'2019-10-21',84,5,8,0,0),(250,'2019-10-21',183,10,0,916000,0),(251,'2019-10-21',105,1,0,0,0),(252,'2019-10-21',89,6,0,6085000,0),(253,'2019-10-21',101,5,0,0,0),(254,'2019-10-21',114,5,0,2284000,0),(255,'2019-10-21',102,4,0,0,0),(256,'2019-10-21',100,0,0,0,0),(257,'2019-10-21',104,0,0,0,0),(258,'2019-10-21',253,0,0,1751300,0),(259,'2019-10-21',264,0,0,0,0),(260,'2019-10-21',87,11,0,0,0),(261,'2019-10-21',91,7,18,4932000,0),(262,'2019-10-21',135,0,22,0,0),(263,'2019-10-21',118,0,3,0,0),(264,'2019-10-21',103,16,3,2188000,0),(265,'2019-10-21',177,0,0,0,0),(266,'2019-10-21',162,20,0,0,0),(267,'2019-10-21',139,20,0,1000000,0),(268,'2019-10-21',94,0,0,0,0),(269,'2019-10-21',93,16,0,9416000,0),(270,'2019-10-21',92,0,0,0,0),(271,'2019-10-21',86,0,0,660000,0),(272,'2019-10-21',88,40,19,0,0),(273,'2019-10-21',113,40,2,5000000,0),(274,'2019-10-21',195,0,0,0,0),(275,'2019-10-21',98,16,0,2000000,0),(276,'2019-10-21',79,0,0,0,0),(277,'2019-10-21',181,10,0,0,0),(278,'2019-10-21',144,8,0,0,0),(279,'2019-10-21',106,90,0,19540000,0),(280,'2019-10-21',170,0,0,0,0),(281,'2019-10-21',133,20,0,0,0),(282,'2019-10-21',107,0,3,0,0),(283,'2019-10-21',221,0,0,0,0),(284,'2019-10-21',130,5,0,0,0),(285,'2019-10-21',228,0,0,0,0),(286,'2019-10-21',302,0,0,1120500,0),(287,'2019-10-21',291,0,0,2040000,0),(288,'2019-10-21',269,0,0,0,0),(289,'2019-10-21',288,0,0,0,0),(290,'2019-10-21',273,0,0,0,0),(291,'2019-10-21',284,0,0,20735000,0),(292,'2019-10-21',276,0,0,25372500,0),(293,'2019-10-21',274,0,0,0,0),(294,'2019-10-21',108,1,0,0,0),(295,'2019-10-21',237,0,0,0,0),(296,'2019-10-21',109,27,0,4343000,0),(297,'2019-10-21',110,5,0,0,0),(298,'2019-10-21',222,30,0,652000,0),(299,'2019-10-21',111,20,0,2000000,0),(300,'2019-10-21',243,0,0,0,0),(301,'2019-10-21',233,0,0,0,0),(302,'2019-10-21',315,0,0,0,0),(303,'2019-10-21',316,0,0,1068660,0),(304,'2019-10-21',317,0,0,1441425,0),(305,'2019-10-21',318,0,0,9903500,0),(306,'2019-10-31',205,0,0,0,0),(307,'2019-10-31',293,0,0,18054720,0),(308,'2019-10-31',97,5,0,1616000,0),(309,'2019-10-31',182,29,19,0,0),(310,'2019-10-31',250,0,0,2142000,0),(311,'2019-10-31',199,3,0,2841000,0),(312,'2019-10-31',300,0,0,1732500,0),(313,'2019-10-31',261,0,0,0,0),(314,'2019-10-31',12,0,0,0,0),(315,'2019-10-31',301,0,0,899100,0),(316,'2019-10-31',175,10,0,1000000,0),(317,'2019-10-31',283,0,0,0,0),(318,'2019-10-31',160,0,0,0,0),(319,'2019-10-31',305,10,0,0,0),(320,'2019-10-31',296,0,0,0,0),(321,'2019-10-31',278,0,0,88534825,0),(322,'2019-10-31',277,0,0,0,0),(323,'2019-10-31',13,0,0,0,0),(324,'2019-10-31',15,22,4,580000,0),(325,'2019-10-31',249,0,0,0,0),(326,'2019-10-31',134,0,0,0,0),(327,'2019-10-31',210,8,0,0,0),(328,'2019-10-31',203,5,0,0,0),(329,'2019-10-31',14,0,0,0,0),(330,'2019-10-31',185,0,0,0,0),(331,'2019-10-31',22,5,0,7020000,0),(332,'2019-10-31',20,0,0,0,0),(333,'2019-10-31',187,10,0,0,0),(334,'2019-10-31',188,5,0,0,0),(335,'2019-10-31',128,0,0,0,0),(336,'2019-10-31',23,10,0,0,0),(337,'2019-10-31',25,0,0,0,0),(338,'2019-10-31',235,0,0,24982176,0),(339,'2019-10-31',280,0,0,4379000,0),(340,'2019-10-31',297,0,0,0,0),(341,'2019-10-31',24,20,0,0,0),(342,'2019-10-31',21,0,0,0,0),(343,'2019-10-31',201,0,8,0,0),(344,'2019-10-31',125,248,308,0,0),(345,'2019-10-31',27,5,0,0,0),(346,'2019-10-31',232,10,16,10726000,0),(347,'2019-10-31',215,0,0,0,0),(348,'2019-10-31',314,5,0,0,0),(349,'2019-10-31',196,5,0,0,0),(350,'2019-10-31',217,10,0,0,0),(351,'2019-10-31',308,0,5,0,0),(352,'2019-10-31',309,0,1,0,0),(353,'2019-10-31',226,0,0,0,0),(354,'2019-10-31',230,0,0,31225750,0),(355,'2019-10-31',218,0,0,0,0),(356,'2019-10-31',227,0,0,0,0),(357,'2019-10-31',307,0,0,68085038,0),(358,'2019-10-31',165,0,0,0,0),(359,'2019-10-31',1,0,0,0,0),(360,'2019-10-31',295,0,0,0,0),(361,'2019-10-31',124,0,0,-1946676105,0),(362,'2019-10-31',174,0,0,0,0),(363,'2019-10-31',152,0,0,1759764319,0),(364,'2019-10-31',286,0,0,0,0),(365,'2019-10-31',229,0,0,195068500,0),(366,'2019-10-31',260,0,0,2811000,0),(367,'2019-10-31',9,0,4,4900000,0),(368,'2019-10-31',2,0,0,0,0),(369,'2019-10-31',11,29,17,12731000,0),(370,'2019-10-31',298,0,0,0,0),(371,'2019-10-31',292,0,0,0,0),(372,'2019-10-31',244,0,0,0,0),(373,'2019-10-31',147,10,0,0,0),(374,'2019-10-31',248,0,0,1105200,0),(375,'2019-10-31',149,8,0,0,0),(376,'2019-10-31',28,39,13,18897000,0),(377,'2019-10-31',285,0,0,11550600,0),(378,'2019-10-31',168,0,0,0,0),(379,'2019-10-31',122,0,0,0,0),(380,'2019-10-31',312,0,3,0,0),(381,'2019-10-31',146,48,0,8460000,0),(382,'2019-10-31',220,0,0,0,0),(383,'2019-10-31',29,80,9,3000000,0),(384,'2019-10-31',304,10,0,0,0),(385,'2019-10-31',209,0,0,0,0),(386,'2019-10-31',234,0,0,31725000,0),(387,'2019-10-31',317,0,0,1441425,0),(388,'2019-10-31',251,0,0,8664000,0),(389,'2019-10-31',240,0,0,993600,0),(390,'2019-10-31',242,0,1,0,0),(391,'2019-10-31',31,0,0,0,0),(392,'2019-10-31',267,0,0,0,0),(393,'2019-10-31',198,19,0,0,0),(394,'2019-10-31',126,0,0,0,0),(395,'2019-10-31',270,0,0,0,0),(396,'2019-10-31',256,0,0,0,0),(397,'2019-10-31',30,0,0,0,0),(398,'2019-10-31',32,0,0,0,0),(399,'2019-10-31',263,0,0,0,0),(400,'2019-10-31',262,0,0,26104600,0),(401,'2019-10-31',271,0,0,7254000,0),(402,'2019-10-31',318,0,0,9903500,0),(403,'2019-10-31',254,0,0,0,0),(404,'2019-10-31',282,0,0,2827500,0),(405,'2019-10-31',252,0,0,0,0),(406,'2019-10-31',247,0,0,7149600,0),(407,'2019-10-31',268,0,0,10355380,0),(408,'2019-10-31',259,0,0,2490000,0),(409,'2019-10-31',241,0,0,2574000,0),(410,'2019-10-31',239,0,0,22556700,0),(411,'2019-10-31',257,0,0,9254790,0),(412,'2019-10-31',238,0,0,4865400,0),(413,'2019-10-31',148,0,0,0,0),(414,'2019-10-31',310,50,10,5670000,0),(415,'2019-10-31',225,5,0,0,0),(416,'2019-10-31',190,0,0,0,0),(417,'2019-10-31',189,5,0,0,0),(418,'2019-10-31',313,5,16,3820000,0),(419,'2019-10-31',129,10,0,0,0),(420,'2019-10-31',164,0,0,0,0),(421,'2019-10-31',37,0,0,0,0),(422,'2019-10-31',171,68,4,18000000,0),(423,'2019-10-31',33,0,0,0,0),(424,'2019-10-31',176,0,0,0,0),(425,'2019-10-31',193,0,0,0,0),(426,'2019-10-31',213,100,10,11590000,0),(427,'2019-10-31',39,0,0,0,0),(428,'2019-10-31',186,4,0,0,0),(429,'2019-10-31',16,5,0,0,0),(430,'2019-10-31',204,0,0,220000,0),(431,'2019-10-31',136,5,0,0,0),(432,'2019-10-31',200,10,0,0,0),(433,'2019-10-31',35,34,0,0,0),(434,'2019-10-31',151,0,0,0,0),(435,'2019-10-31',155,0,0,0,0),(436,'2019-10-31',42,30,0,2149000,0),(437,'2019-10-31',287,0,0,0,0),(438,'2019-10-31',38,0,0,0,0),(439,'2019-10-31',41,40,5,0,0),(440,'2019-10-31',173,0,0,0,0),(441,'2019-10-31',180,4,0,0,0),(442,'2019-10-31',119,26,18,0,0),(443,'2019-10-31',121,0,0,0,0),(444,'2019-10-31',143,0,0,0,0),(445,'2019-10-31',115,10,0,0,0),(446,'2019-10-31',40,3,0,0,0),(447,'2019-10-31',159,0,0,0,0),(448,'2019-10-31',116,0,0,916000,0),(449,'2019-10-31',141,0,4,0,0),(450,'2019-10-31',137,0,0,0,0),(451,'2019-10-31',34,10,0,0,0),(452,'2019-10-31',85,0,9,19812000,0),(453,'2019-10-31',157,0,0,0,0),(454,'2019-10-31',197,0,0,0,0),(455,'2019-10-31',43,104,0,0,0),(456,'2019-10-31',138,0,0,0,0),(457,'2019-10-31',184,0,0,0,0),(458,'2019-10-31',44,60,16,0,0),(459,'2019-10-31',212,20,7,0,0),(460,'2019-10-31',48,0,0,0,0),(461,'2019-10-31',192,0,0,0,0),(462,'2019-10-31',45,0,0,0,0),(463,'2019-10-31',47,20,2,8000000,0),(464,'2019-10-31',46,40,9,0,0),(465,'2019-10-31',54,8,0,0,0),(466,'2019-10-31',53,11,-1,0,0),(467,'2019-10-31',52,13,1,0,0),(468,'2019-10-31',50,44,25,13780000,0),(469,'2019-10-31',49,10,2,0,0),(470,'2019-10-31',166,0,0,0,0),(471,'2019-10-31',55,25,0,0,0),(472,'2019-10-31',208,0,0,0,0),(473,'2019-10-31',51,0,0,0,0),(474,'2019-10-31',117,1,0,0,0),(475,'2019-10-31',60,3,0,5700000,0),(476,'2019-10-31',127,0,0,100000,0),(477,'2019-10-31',56,0,5,0,0),(478,'2019-10-31',58,16,5,0,0),(479,'2019-10-31',59,10,0,3367000,0),(480,'2019-10-31',145,15,0,0,0),(481,'2019-10-31',112,13,0,0,0),(482,'2019-10-31',178,15,0,0,0),(483,'2019-10-31',224,10,0,0,0),(484,'2019-10-31',211,40,6,24116000,0),(485,'2019-10-31',194,20,0,5720000,0),(486,'2019-10-31',62,0,0,0,0),(487,'2019-10-31',61,18,1,3344000,0),(488,'2019-10-31',17,8,0,1774000,0),(489,'2019-10-31',57,4,0,0,0),(490,'2019-10-31',123,0,0,1496000,0),(491,'2019-10-31',311,20,0,0,0),(492,'2019-10-31',219,0,0,0,0),(493,'2019-10-31',191,0,0,0,0),(494,'2019-10-31',156,0,0,0,0),(495,'2019-10-31',65,10,2,3823000,0),(496,'2019-10-31',172,5,0,0,0),(497,'2019-10-31',63,0,0,0,0),(498,'2019-10-31',64,0,0,0,0),(499,'2019-10-31',315,0,0,0,0),(500,'2019-10-31',281,0,0,0,0),(501,'2019-10-31',279,0,0,0,0),(502,'2019-10-31',275,0,0,0,0),(503,'2019-10-31',167,0,0,0,0),(504,'2019-10-31',303,10,0,0,0),(505,'2019-10-31',236,0,0,0,0),(506,'2019-10-31',161,20,11,2000000,0),(507,'2019-10-31',306,7,0,0,0),(508,'2019-10-31',66,20,4,0,0),(509,'2019-10-31',72,0,0,0,0),(510,'2019-10-31',71,25,0,0,0),(511,'2019-10-31',67,0,0,0,0),(512,'2019-10-31',207,0,0,0,0),(513,'2019-10-31',68,0,0,0,0),(514,'2019-10-31',150,0,0,0,0),(515,'2019-10-31',69,0,0,0,0),(516,'2019-10-31',319,0,0,0,0),(517,'2019-10-31',169,0,7,13475000,0),(518,'2019-10-31',120,100,8,0,0),(519,'2019-10-31',70,10,0,0,0),(520,'2019-10-31',206,14,2,4160000,0),(521,'2019-10-31',179,17,2,0,0),(522,'2019-10-31',320,20,0,0,0),(523,'2019-10-31',73,3,0,0,0),(524,'2019-10-31',132,20,0,0,0),(525,'2019-10-31',74,10,0,0,0),(526,'2019-10-31',216,0,0,0,0),(527,'2019-10-31',142,38,24,1621000,0),(528,'2019-10-31',26,1,0,9029000,0),(529,'2019-10-31',265,0,0,0,0),(530,'2019-10-31',266,0,0,1757320,0),(531,'2019-10-31',290,0,0,4615500,0),(532,'2019-10-31',258,0,0,49096750,0),(533,'2019-10-31',316,0,0,1068660,0),(534,'2019-10-31',294,0,0,7267500,0),(535,'2019-10-31',77,0,7,6646000,0),(536,'2019-10-31',76,0,0,0,0),(537,'2019-10-31',154,3,1,0,0),(538,'2019-10-31',214,20,0,0,0),(539,'2019-10-31',299,0,0,735000,0),(540,'2019-10-31',255,0,0,3021500,0),(541,'2019-10-31',246,0,0,1281600,0),(542,'2019-10-31',245,0,0,0,0),(543,'2019-10-31',75,10,3,0,0),(544,'2019-10-31',80,0,0,0,0),(545,'2019-10-31',18,19,0,0,0),(546,'2019-10-31',140,0,0,0,0),(547,'2019-10-31',163,0,0,0,0),(548,'2019-10-31',131,5,0,0,0),(549,'2019-10-31',83,10,4,0,0),(550,'2019-10-31',99,0,0,0,0),(551,'2019-10-31',153,0,0,0,0),(552,'2019-10-31',19,15,0,512000,0),(553,'2019-10-31',223,20,11,0,0),(554,'2019-10-31',96,25,2,1954000,0),(555,'2019-10-31',95,40,3,0,0),(556,'2019-10-31',82,0,19,11208000,0),(557,'2019-10-31',158,40,70,9500000,0),(558,'2019-10-31',202,30,1,3945000,0),(559,'2019-10-31',90,44,0,9477000,0),(560,'2019-10-31',84,5,7,0,0),(561,'2019-10-31',183,10,0,0,0),(562,'2019-10-31',105,1,0,0,0),(563,'2019-10-31',89,6,0,6085000,0),(564,'2019-10-31',101,5,0,0,0),(565,'2019-10-31',114,5,0,1380000,0),(566,'2019-10-31',102,4,0,0,0),(567,'2019-10-31',100,0,0,0,0),(568,'2019-10-31',104,0,0,0,0),(569,'2019-10-31',253,0,0,1751300,0),(570,'2019-10-31',264,0,0,0,0),(571,'2019-10-31',87,11,0,0,0),(572,'2019-10-31',91,7,17,4932000,0),(573,'2019-10-31',135,0,22,0,0),(574,'2019-10-31',118,0,3,0,0),(575,'2019-10-31',103,16,3,5071000,0),(576,'2019-10-31',177,0,0,0,0),(577,'2019-10-31',162,20,0,0,0),(578,'2019-10-31',139,20,0,1000000,0),(579,'2019-10-31',94,0,0,0,0),(580,'2019-10-31',93,16,0,8042000,0),(581,'2019-10-31',92,0,0,0,0),(582,'2019-10-31',86,0,0,660000,0),(583,'2019-10-31',88,40,19,0,0),(584,'2019-10-31',113,40,3,5000000,0),(585,'2019-10-31',195,0,0,0,0),(586,'2019-10-31',98,16,0,2000000,0),(587,'2019-10-31',79,0,0,0,0),(588,'2019-10-31',181,10,0,0,0),(589,'2019-10-31',144,5,0,0,0),(590,'2019-10-31',106,70,0,15060000,0),(591,'2019-10-31',170,0,0,0,0),(592,'2019-10-31',133,20,0,0,0),(593,'2019-10-31',107,0,3,2925000,0),(594,'2019-10-31',221,0,0,0,0),(595,'2019-10-31',130,5,0,0,0),(596,'2019-10-31',228,0,0,0,0),(597,'2019-10-31',302,0,0,1120500,0),(598,'2019-10-31',291,0,0,2040000,0),(599,'2019-10-31',269,0,0,0,0),(600,'2019-10-31',288,0,0,0,0),(601,'2019-10-31',273,0,0,0,0),(602,'2019-10-31',284,0,0,20735000,0),(603,'2019-10-31',276,0,0,25372500,0),(604,'2019-10-31',274,0,0,0,0),(605,'2019-10-31',108,1,0,0,0),(606,'2019-10-31',237,0,0,0,0),(607,'2019-10-31',109,27,0,1366000,0),(608,'2019-10-31',110,5,0,0,0),(609,'2019-10-31',222,30,0,652000,0),(610,'2019-10-31',111,20,0,2000000,0),(611,'2019-10-31',243,0,0,0,0),(612,'2019-10-31',233,0,0,0,0),(613,'2019-11-01',205,0,0,0,0),(614,'2019-11-01',293,0,0,36109440,0),(615,'2019-11-01',97,10,0,3232000,0),(616,'2019-11-01',182,58,38,0,0),(617,'2019-11-01',250,0,0,4284000,0),(618,'2019-11-01',199,6,0,5682000,0),(619,'2019-11-01',300,0,0,3465000,0),(620,'2019-11-01',261,0,0,0,0),(621,'2019-11-01',12,0,0,0,0),(622,'2019-11-01',301,0,0,1798200,0),(623,'2019-11-01',175,20,0,2000000,0),(624,'2019-11-01',283,0,0,0,0),(625,'2019-11-01',160,0,0,0,0),(626,'2019-11-01',305,20,0,0,0),(627,'2019-11-01',296,0,0,0,0),(628,'2019-11-01',278,0,0,177069650,0),(629,'2019-11-01',277,0,0,0,0),(630,'2019-11-01',13,0,0,0,0),(631,'2019-11-01',15,44,8,1160000,0),(632,'2019-11-01',249,0,0,0,0),(633,'2019-11-01',134,0,0,0,0),(634,'2019-11-01',210,16,0,0,0),(635,'2019-11-01',203,-70,0,-17280000,0),(636,'2019-11-01',14,0,0,0,0),(637,'2019-11-01',185,0,0,0,0),(638,'2019-11-01',22,10,0,14040000,0),(639,'2019-11-01',20,0,0,0,0),(640,'2019-11-01',187,20,0,0,0),(641,'2019-11-01',188,10,0,0,0),(642,'2019-11-01',128,0,0,0,0),(643,'2019-11-01',23,20,0,0,0),(644,'2019-11-01',25,0,0,0,0),(645,'2019-11-01',235,0,0,49964352,0),(646,'2019-11-01',280,0,0,8758000,0),(647,'2019-11-01',297,0,0,0,0),(648,'2019-11-01',24,40,0,0,0),(649,'2019-11-01',21,0,0,0,0),(650,'2019-11-01',201,0,16,0,0),(651,'2019-11-01',125,496,614,0,0),(652,'2019-11-01',27,10,0,0,0),(653,'2019-11-01',232,20,32,21452000,0),(654,'2019-11-01',215,0,0,0,0),(655,'2019-11-01',314,10,0,0,0),(656,'2019-11-01',196,10,0,0,0),(657,'2019-11-01',217,20,0,0,0),(658,'2019-11-01',308,0,10,0,0),(659,'2019-11-01',309,0,2,0,0),(660,'2019-11-01',226,0,0,0,0),(661,'2019-11-01',230,0,0,62451500,0),(662,'2019-11-01',218,0,0,0,0),(663,'2019-11-01',227,0,0,0,0),(664,'2019-11-01',307,0,0,136170076,0),(665,'2019-11-01',165,0,0,0,0),(666,'2019-11-01',1,0,0,0,0),(667,'2019-11-01',295,0,0,0,0),(668,'2019-11-01',124,0,0,-3893352210,0),(669,'2019-11-01',174,0,0,0,0),(670,'2019-11-01',152,0,0,3519528638,0),(671,'2019-11-01',286,0,0,0,0),(672,'2019-11-01',229,0,0,390137000,0),(673,'2019-11-01',260,0,0,5622000,0),(674,'2019-11-01',9,0,8,9800000,0),(675,'2019-11-01',2,0,0,0,0),(676,'2019-11-01',11,58,34,25462000,0),(677,'2019-11-01',298,0,0,0,0),(678,'2019-11-01',292,0,0,0,0),(679,'2019-11-01',244,0,0,0,0),(680,'2019-11-01',147,20,0,0,0),(681,'2019-11-01',248,0,0,2210400,0),(682,'2019-11-01',149,16,0,0,0),(683,'2019-11-01',28,78,26,37794000,0),(684,'2019-11-01',285,0,0,23101200,0),(685,'2019-11-01',168,0,0,0,0),(686,'2019-11-01',122,0,0,0,0),(687,'2019-11-01',312,0,6,0,0),(688,'2019-11-01',146,96,0,16920000,0),(689,'2019-11-01',220,0,0,0,0),(690,'2019-11-01',29,160,18,6000000,0),(691,'2019-11-01',304,20,0,0,0),(692,'2019-11-01',209,0,0,0,0),(693,'2019-11-01',234,0,0,63450000,0),(694,'2019-11-01',317,0,0,2882850,0),(695,'2019-11-01',251,0,0,17328000,0),(696,'2019-11-01',240,0,0,1987200,0),(697,'2019-11-01',242,0,2,0,0),(698,'2019-11-01',31,0,0,0,0),(699,'2019-11-01',267,0,0,0,0),(700,'2019-11-01',198,38,0,0,0),(701,'2019-11-01',126,0,0,0,0),(702,'2019-11-01',270,0,0,0,0),(703,'2019-11-01',256,0,0,0,0),(704,'2019-11-01',30,0,0,0,0),(705,'2019-11-01',32,0,0,0,0),(706,'2019-11-01',263,0,0,0,0),(707,'2019-11-01',262,0,0,52209200,0),(708,'2019-11-01',271,0,0,14508000,0),(709,'2019-11-01',318,0,0,19807000,0),(710,'2019-11-01',254,0,0,0,0),(711,'2019-11-01',282,0,0,5655000,0),(712,'2019-11-01',252,0,0,0,0),(713,'2019-11-01',247,0,0,14299200,0),(714,'2019-11-01',268,0,0,20710760,0),(715,'2019-11-01',259,0,0,4980000,0),(716,'2019-11-01',241,0,0,5148000,0),(717,'2019-11-01',239,0,0,45113400,0),(718,'2019-11-01',257,0,0,18509580,0),(719,'2019-11-01',238,0,0,9730800,0),(720,'2019-11-01',148,0,0,0,0),(721,'2019-11-01',310,100,20,11340000,0),(722,'2019-11-01',225,10,0,0,0),(723,'2019-11-01',190,0,0,0,0),(724,'2019-11-01',189,10,0,0,0),(725,'2019-11-01',313,10,32,7640000,0),(726,'2019-11-01',129,20,0,0,0),(727,'2019-11-01',164,0,0,0,0),(728,'2019-11-01',37,0,0,0,0),(729,'2019-11-01',171,136,8,36000000,0),(730,'2019-11-01',33,0,0,0,0),(731,'2019-11-01',176,0,0,0,0),(732,'2019-11-01',193,0,0,0,0),(733,'2019-11-01',213,200,20,23180000,0),(734,'2019-11-01',39,0,0,0,0),(735,'2019-11-01',186,8,0,0,0),(736,'2019-11-01',16,10,0,0,0),(737,'2019-11-01',204,0,0,440000,0),(738,'2019-11-01',136,10,0,0,0),(739,'2019-11-01',200,20,0,0,0),(740,'2019-11-01',35,68,0,0,0),(741,'2019-11-01',151,0,0,0,0),(742,'2019-11-01',155,0,0,0,0),(743,'2019-11-01',42,60,0,4298000,0),(744,'2019-11-01',287,0,0,0,0),(745,'2019-11-01',38,0,0,0,0),(746,'2019-11-01',41,80,10,0,0),(747,'2019-11-01',173,0,0,0,0),(748,'2019-11-01',180,8,0,0,0),(749,'2019-11-01',119,52,36,0,0),(750,'2019-11-01',121,0,0,0,0),(751,'2019-11-01',143,0,0,0,0),(752,'2019-11-01',115,20,0,0,0),(753,'2019-11-01',40,6,0,0,0),(754,'2019-11-01',159,0,0,0,0),(755,'2019-11-01',116,0,0,1832000,0),(756,'2019-11-01',141,0,8,0,0),(757,'2019-11-01',137,0,0,0,0),(758,'2019-11-01',34,20,0,0,0),(759,'2019-11-01',85,0,18,39624000,0),(760,'2019-11-01',157,0,0,0,0),(761,'2019-11-01',197,0,0,0,0),(762,'2019-11-01',43,208,0,0,0),(763,'2019-11-01',138,0,0,0,0),(764,'2019-11-01',184,0,0,0,0),(765,'2019-11-01',44,120,32,0,0),(766,'2019-11-01',212,40,14,0,0),(767,'2019-11-01',48,0,0,0,0),(768,'2019-11-01',192,0,0,0,0),(769,'2019-11-01',45,0,0,0,0),(770,'2019-11-01',47,40,4,16000000,0),(771,'2019-11-01',46,80,18,0,0),(772,'2019-11-01',54,16,0,0,0),(773,'2019-11-01',53,22,-2,0,0),(774,'2019-11-01',52,26,2,1808000,0),(775,'2019-11-01',50,88,50,27560000,0),(776,'2019-11-01',49,20,4,0,0),(777,'2019-11-01',166,0,0,0,0),(778,'2019-11-01',55,50,0,0,0),(779,'2019-11-01',208,0,0,0,0),(780,'2019-11-01',51,0,0,0,0),(781,'2019-11-01',117,2,0,0,0),(782,'2019-11-01',60,6,0,11400000,0),(783,'2019-11-01',127,0,0,200000,0),(784,'2019-11-01',56,0,10,0,0),(785,'2019-11-01',58,32,10,0,0),(786,'2019-11-01',59,20,0,6734000,0),(787,'2019-11-01',145,30,0,0,0),(788,'2019-11-01',112,26,0,0,0),(789,'2019-11-01',178,30,0,0,0),(790,'2019-11-01',224,20,0,0,0),(791,'2019-11-01',211,80,12,48232000,0),(792,'2019-11-01',194,40,0,11440000,0),(793,'2019-11-01',62,0,0,0,0),(794,'2019-11-01',61,36,2,6688000,0),(795,'2019-11-01',17,16,0,3548000,0),(796,'2019-11-01',57,8,0,0,0),(797,'2019-11-01',123,0,0,2992000,0),(798,'2019-11-01',311,40,0,0,0),(799,'2019-11-01',219,0,0,0,0),(800,'2019-11-01',191,0,0,0,0),(801,'2019-11-01',156,0,0,0,0),(802,'2019-11-01',65,20,4,7646000,0),(803,'2019-11-01',172,10,0,0,0),(804,'2019-11-01',63,0,0,0,0),(805,'2019-11-01',64,0,0,0,0),(806,'2019-11-01',315,0,0,0,0),(807,'2019-11-01',281,0,0,0,0),(808,'2019-11-01',279,0,0,0,0),(809,'2019-11-01',275,0,0,0,0),(810,'2019-11-01',167,0,0,0,0),(811,'2019-11-01',303,20,0,0,0),(812,'2019-11-01',236,0,0,0,0),(813,'2019-11-01',161,40,22,4000000,0),(814,'2019-11-01',306,14,0,0,0),(815,'2019-11-01',66,40,8,0,0),(816,'2019-11-01',72,0,0,0,0),(817,'2019-11-01',71,50,0,0,0),(818,'2019-11-01',67,0,0,0,0),(819,'2019-11-01',207,0,0,0,0),(820,'2019-11-01',68,0,0,0,0),(821,'2019-11-01',150,0,0,0,0),(822,'2019-11-01',69,0,0,0,0),(823,'2019-11-01',319,0,0,0,0),(824,'2019-11-01',169,0,14,26950000,0),(825,'2019-11-01',120,200,16,0,0),(826,'2019-11-01',70,20,0,0,0),(827,'2019-11-01',206,28,4,8320000,0),(828,'2019-11-01',179,34,4,0,0),(829,'2019-11-01',320,40,0,0,0),(830,'2019-11-01',73,6,0,0,0),(831,'2019-11-01',132,40,0,0,0),(832,'2019-11-01',74,20,0,0,0),(833,'2019-11-01',216,0,0,0,0),(834,'2019-11-01',142,76,48,3242000,0),(835,'2019-11-01',26,2,0,18058000,0),(836,'2019-11-01',265,0,0,0,0),(837,'2019-11-01',266,0,0,3514640,0),(838,'2019-11-01',290,0,0,9231000,0),(839,'2019-11-01',258,0,0,98193500,0),(840,'2019-11-01',316,0,0,2137320,0),(841,'2019-11-01',294,0,0,14535000,0),(842,'2019-11-01',77,0,14,13292000,0),(843,'2019-11-01',76,0,0,0,0),(844,'2019-11-01',154,6,2,0,0),(845,'2019-11-01',214,40,0,0,0),(846,'2019-11-01',299,0,0,1470000,0),(847,'2019-11-01',255,0,0,6043000,0),(848,'2019-11-01',246,0,0,2563200,0),(849,'2019-11-01',245,0,0,0,0),(850,'2019-11-01',75,20,6,0,0),(851,'2019-11-01',80,0,0,0,0),(852,'2019-11-01',18,38,0,0,0),(853,'2019-11-01',140,0,0,0,0),(854,'2019-11-01',163,0,0,0,0),(855,'2019-11-01',131,10,0,0,0),(856,'2019-11-01',83,20,8,0,0),(857,'2019-11-01',99,0,0,0,0),(858,'2019-11-01',153,0,0,0,0),(859,'2019-11-01',19,30,0,1024000,0),(860,'2019-11-01',223,40,22,0,0),(861,'2019-11-01',96,50,4,3908000,0),(862,'2019-11-01',95,80,6,0,0),(863,'2019-11-01',82,0,38,22416000,0),(864,'2019-11-01',158,80,140,19000000,0),(865,'2019-11-01',202,60,2,7890000,0),(866,'2019-11-01',90,88,0,18954000,0),(867,'2019-11-01',84,10,14,0,0),(868,'2019-11-01',183,20,0,0,0),(869,'2019-11-01',105,2,0,0,0),(870,'2019-11-01',89,12,0,12170000,0),(871,'2019-11-01',101,10,0,0,0),(872,'2019-11-01',114,10,0,2760000,0),(873,'2019-11-01',102,8,0,0,0),(874,'2019-11-01',100,0,0,0,0),(875,'2019-11-01',104,0,0,0,0),(876,'2019-11-01',253,0,0,3502600,0),(877,'2019-11-01',264,0,0,0,0),(878,'2019-11-01',87,22,0,0,0),(879,'2019-11-01',91,14,34,9864000,0),(880,'2019-11-01',135,0,44,0,0),(881,'2019-11-01',118,0,6,0,0),(882,'2019-11-01',103,32,6,7259000,0),(883,'2019-11-01',177,0,0,0,0),(884,'2019-11-01',162,40,0,0,0),(885,'2019-11-01',139,40,0,2000000,0),(886,'2019-11-01',94,0,0,0,0),(887,'2019-11-01',93,32,0,16084000,0),(888,'2019-11-01',92,0,0,0,0),(889,'2019-11-01',86,0,0,1320000,0),(890,'2019-11-01',88,80,38,0,0),(891,'2019-11-01',113,80,6,10000000,0),(892,'2019-11-01',195,0,0,0,0),(893,'2019-11-01',98,32,0,4000000,0),(894,'2019-11-01',79,0,0,0,0),(895,'2019-11-01',181,20,0,0,0),(896,'2019-11-01',144,10,0,0,0),(897,'2019-11-01',106,140,0,30120000,0),(898,'2019-11-01',170,0,0,0,0),(899,'2019-11-01',133,40,0,0,0),(900,'2019-11-01',107,0,6,5850000,0),(901,'2019-11-01',221,0,0,0,0),(902,'2019-11-01',130,10,0,0,0),(903,'2019-11-01',228,0,0,0,0),(904,'2019-11-01',302,0,0,2241000,0),(905,'2019-11-01',291,0,0,4080000,0),(906,'2019-11-01',269,0,0,0,0),(907,'2019-11-01',288,0,0,0,0),(908,'2019-11-01',273,0,0,0,0),(909,'2019-11-01',284,0,0,41470000,0),(910,'2019-11-01',276,0,0,50745000,0),(911,'2019-11-01',274,0,0,0,0),(912,'2019-11-01',108,2,0,0,0),(913,'2019-11-01',237,0,0,0,0),(914,'2019-11-01',109,54,0,2732000,0),(915,'2019-11-01',110,10,0,0,0),(916,'2019-11-01',222,60,0,1304000,0),(917,'2019-11-01',111,40,0,4000000,0),(918,'2019-11-01',243,0,0,0,0),(919,'2019-11-01',233,0,0,0,0),(920,'2019-11-25',205,0,0,0,0),(921,'2019-11-25',293,0,0,0,0),(922,'2019-11-25',97,5,0,1200000,0),(923,'2019-11-25',182,29,19,4198000,0),(924,'2019-11-25',250,0,0,0,0),(925,'2019-11-25',199,3,0,2841000,0),(926,'2019-11-25',300,0,0,0,0),(927,'2019-11-25',261,0,0,0,0),(928,'2019-11-25',12,0,0,0,0),(929,'2019-11-25',301,0,0,0,0),(930,'2019-11-25',175,10,0,1000000,0),(931,'2019-11-25',283,0,0,0,0),(932,'2019-11-25',160,0,0,0,0),(933,'2019-11-25',305,10,0,0,0),(934,'2019-11-25',296,0,0,0,0),(935,'2019-11-25',278,0,0,0,0),(936,'2019-11-25',277,0,0,0,0),(937,'2019-11-25',13,0,0,0,0),(938,'2019-11-25',15,22,4,580000,0),(939,'2019-11-25',249,0,0,0,0),(940,'2019-11-25',134,0,0,0,0),(941,'2019-11-25',210,5,0,0,0),(942,'2019-11-25',203,0,5,0,0),(943,'2019-11-25',14,0,0,0,0),(944,'2019-11-25',185,0,0,0,0),(945,'2019-11-25',22,5,0,7020000,0),(946,'2019-11-25',20,0,0,0,0),(947,'2019-11-25',187,10,0,0,0),(948,'2019-11-25',188,5,0,0,0),(949,'2019-11-25',128,0,0,0,0),(950,'2019-11-25',23,10,0,0,0),(951,'2019-11-25',25,0,0,0,0),(952,'2019-11-25',235,0,0,0,0),(953,'2019-11-25',280,0,0,0,0),(954,'2019-11-25',297,0,0,0,0),(955,'2019-11-25',24,7,0,0,0),(956,'2019-11-25',21,0,0,0,0),(957,'2019-11-25',201,0,6,0,0),(958,'2019-11-25',125,244,321,0,0),(959,'2019-11-25',27,5,0,0,0),(960,'2019-11-25',232,10,16,5726000,0),(961,'2019-11-25',215,0,0,0,0),(962,'2019-11-25',314,5,0,0,0),(963,'2019-11-25',196,5,0,0,0),(964,'2019-11-25',217,10,0,0,0),(965,'2019-11-25',308,0,5,0,0),(966,'2019-11-25',309,0,1,0,0),(967,'2019-11-25',226,0,0,0,0),(968,'2019-11-25',230,0,0,0,0),(969,'2019-11-25',218,0,0,0,0),(970,'2019-11-25',227,0,0,0,0),(971,'2019-11-25',307,0,0,0,0),(972,'2019-11-25',165,0,0,0,0),(973,'2019-11-25',1,0,0,0,0),(974,'2019-11-25',295,0,0,0,0),(975,'2019-11-25',124,0,0,-1251234872,0),(976,'2019-11-25',174,0,0,0,0),(977,'2019-11-25',152,0,0,1425980671,0),(978,'2019-11-25',286,0,0,0,0),(979,'2019-11-25',229,0,0,0,0),(980,'2019-11-25',260,0,0,0,0),(981,'2019-11-25',9,0,4,4900000,0),(982,'2019-11-25',2,0,0,0,0),(983,'2019-11-25',11,29,17,12727000,0),(984,'2019-11-25',298,0,0,0,0),(985,'2019-11-25',292,0,0,0,0),(986,'2019-11-25',244,0,0,0,0),(987,'2019-11-25',147,10,0,0,0),(988,'2019-11-25',248,0,0,0,0),(989,'2019-11-25',149,8,0,0,0),(990,'2019-11-25',28,39,13,18110000,0),(991,'2019-11-25',285,0,0,0,0),(992,'2019-11-25',168,0,0,0,0),(993,'2019-11-25',122,0,0,0,0),(994,'2019-11-25',312,0,3,0,0),(995,'2019-11-25',146,48,0,4020000,0),(996,'2019-11-25',220,0,0,0,0),(997,'2019-11-25',29,71,11,3000000,0),(998,'2019-11-25',304,10,0,0,0),(999,'2019-11-25',209,0,0,0,0),(1000,'2019-11-25',234,0,0,0,0),(1001,'2019-11-25',317,0,0,0,0),(1002,'2019-11-25',251,0,0,0,0),(1003,'2019-11-25',240,0,0,0,0),(1004,'2019-11-25',242,0,1,0,0),(1005,'2019-11-25',31,0,0,0,0),(1006,'2019-11-25',267,0,0,0,0),(1007,'2019-11-25',198,15,0,0,0),(1008,'2019-11-25',126,0,0,0,0),(1009,'2019-11-25',270,0,0,0,0),(1010,'2019-11-25',256,0,0,0,0),(1011,'2019-11-25',30,0,0,0,0),(1012,'2019-11-25',32,0,0,0,0),(1013,'2019-11-25',263,0,0,0,0),(1014,'2019-11-25',262,0,0,0,0),(1015,'2019-11-25',271,0,0,0,0),(1016,'2019-11-25',318,0,0,0,0),(1017,'2019-11-25',254,0,0,0,0),(1018,'2019-11-25',282,0,0,0,0),(1019,'2019-11-25',252,0,0,0,0),(1020,'2019-11-25',247,0,0,0,0),(1021,'2019-11-25',268,0,0,0,0),(1022,'2019-11-25',259,0,0,0,0),(1023,'2019-11-25',241,0,0,0,0),(1024,'2019-11-25',239,0,0,0,0),(1025,'2019-11-25',257,0,0,0,0),(1026,'2019-11-25',238,0,0,0,0),(1027,'2019-11-25',148,0,0,0,0),(1028,'2019-11-25',310,50,11,5670000,0),(1029,'2019-11-25',225,5,0,0,0),(1030,'2019-11-25',190,0,0,0,0),(1031,'2019-11-25',189,5,0,0,0),(1032,'2019-11-25',313,5,16,3820000,0),(1033,'2019-11-25',129,10,0,0,0),(1034,'2019-11-25',164,0,0,0,0),(1035,'2019-11-25',37,0,0,0,0),(1036,'2019-11-25',171,68,4,14000000,0),(1037,'2019-11-25',33,0,0,0,0),(1038,'2019-11-25',176,0,0,0,0),(1039,'2019-11-25',193,0,0,0,0),(1040,'2019-11-25',213,100,10,11590000,0),(1041,'2019-11-25',39,0,0,0,0),(1042,'2019-11-25',186,4,0,0,0),(1043,'2019-11-25',16,5,0,0,0),(1044,'2019-11-25',204,20,4,0,0),(1045,'2019-11-25',136,5,0,0,0),(1046,'2019-11-25',200,10,0,0,0),(1047,'2019-11-25',35,34,0,13463000,0),(1048,'2019-11-25',151,0,0,0,0),(1049,'2019-11-25',155,0,0,0,0),(1050,'2019-11-25',42,30,0,2149000,0),(1051,'2019-11-25',287,0,0,0,0),(1052,'2019-11-25',38,0,0,0,0),(1053,'2019-11-25',41,40,6,30000,0),(1054,'2019-11-25',173,0,0,0,0),(1055,'2019-11-25',180,4,0,0,0),(1056,'2019-11-25',119,26,18,0,0),(1057,'2019-11-25',121,0,0,0,0),(1058,'2019-11-25',143,0,0,0,0),(1059,'2019-11-25',115,10,0,0,0),(1060,'2019-11-25',40,3,0,0,0),(1061,'2019-11-25',159,0,0,0,0),(1062,'2019-11-25',116,0,0,0,0),(1063,'2019-11-25',141,0,4,0,0),(1064,'2019-11-25',137,0,0,0,0),(1065,'2019-11-25',34,10,0,0,0),(1066,'2019-11-25',85,0,11,0,0),(1067,'2019-11-25',157,0,0,0,0),(1068,'2019-11-25',197,0,0,0,0),(1069,'2019-11-25',43,71,0,0,0),(1070,'2019-11-25',138,0,0,0,0),(1071,'2019-11-25',184,0,0,0,0),(1072,'2019-11-25',44,60,15,0,0),(1073,'2019-11-25',212,20,7,1040000,0),(1074,'2019-11-25',48,0,0,0,0),(1075,'2019-11-25',192,0,0,0,0),(1076,'2019-11-25',45,0,0,0,0),(1077,'2019-11-25',47,20,2,8000000,0),(1078,'2019-11-25',46,40,7,0,0),(1079,'2019-11-25',54,8,0,4408000,0),(1080,'2019-11-25',53,10,0,0,0),(1081,'2019-11-25',52,13,1,0,0),(1082,'2019-11-25',50,46,24,13780000,0),(1083,'2019-11-25',49,10,2,0,0),(1084,'2019-11-25',166,0,0,0,0),(1085,'2019-11-25',55,25,0,0,0),(1086,'2019-11-25',208,0,0,0,0),(1087,'2019-11-25',51,0,0,0,0),(1088,'2019-11-25',117,1,0,0,0),(1089,'2019-11-25',60,0,3,0,0),(1090,'2019-11-25',127,0,5,100000,0),(1091,'2019-11-25',56,0,0,0,0),(1092,'2019-11-25',58,16,5,0,0),(1093,'2019-11-25',59,10,0,3367000,0),(1094,'2019-11-25',145,15,0,1308000,0),(1095,'2019-11-25',112,13,0,0,0),(1096,'2019-11-25',178,16,0,0,0),(1097,'2019-11-25',224,10,0,0,0),(1098,'2019-11-25',211,40,6,24116000,0),(1099,'2019-11-25',194,20,0,5720000,0),(1100,'2019-11-25',62,0,0,0,0),(1101,'2019-11-25',61,18,1,3344000,0),(1102,'2019-11-25',17,8,0,1774000,0),(1103,'2019-11-25',57,4,0,0,0),(1104,'2019-11-25',123,0,0,1496000,0),(1105,'2019-11-25',311,20,0,0,0),(1106,'2019-11-25',219,0,0,0,0),(1107,'2019-11-25',191,0,0,0,0),(1108,'2019-11-25',156,0,0,0,0),(1109,'2019-11-25',65,10,2,3823000,0),(1110,'2019-11-25',172,5,0,0,0),(1111,'2019-11-25',63,0,0,0,0),(1112,'2019-11-25',64,0,0,0,0),(1113,'2019-11-25',315,0,4,0,0),(1114,'2019-11-25',281,0,0,0,0),(1115,'2019-11-25',279,0,0,0,0),(1116,'2019-11-25',275,0,0,0,0),(1117,'2019-11-25',167,0,0,0,0),(1118,'2019-11-25',303,10,0,0,0),(1119,'2019-11-25',236,0,0,0,0),(1120,'2019-11-25',161,20,6,0,0),(1121,'2019-11-25',306,7,0,0,0),(1122,'2019-11-25',66,20,4,0,0),(1123,'2019-11-25',72,0,0,0,0),(1124,'2019-11-25',71,25,0,0,0),(1125,'2019-11-25',67,0,0,0,0),(1126,'2019-11-25',207,0,0,0,0),(1127,'2019-11-25',68,0,0,0,0),(1128,'2019-11-25',150,0,0,0,0),(1129,'2019-11-25',69,0,0,0,0),(1130,'2019-11-25',319,0,0,0,0),(1131,'2019-11-25',169,0,7,9240000,0),(1132,'2019-11-25',120,100,8,0,0),(1133,'2019-11-25',70,10,0,0,0),(1134,'2019-11-25',206,14,3,4160000,0),(1135,'2019-11-25',179,17,2,0,0),(1136,'2019-11-25',320,20,0,0,0),(1137,'2019-11-25',73,3,0,0,0),(1138,'2019-11-25',132,20,0,0,0),(1139,'2019-11-25',74,10,0,0,0),(1140,'2019-11-25',216,0,0,0,0),(1141,'2019-11-25',142,38,22,1000000,0),(1142,'2019-11-25',26,0,2,9029000,0),(1143,'2019-11-25',265,0,0,0,0),(1144,'2019-11-25',266,0,0,0,0),(1145,'2019-11-25',290,0,0,0,0),(1146,'2019-11-25',258,0,0,0,0),(1147,'2019-11-25',316,0,0,0,0),(1148,'2019-11-25',294,0,0,0,0),(1149,'2019-11-25',77,0,7,6646000,0),(1150,'2019-11-25',76,0,0,0,0),(1151,'2019-11-25',154,3,1,0,0),(1152,'2019-11-25',214,20,0,0,0),(1153,'2019-11-25',299,0,0,0,0),(1154,'2019-11-25',255,0,0,0,0),(1155,'2019-11-25',246,0,0,0,0),(1156,'2019-11-25',245,0,0,0,0),(1157,'2019-11-25',75,10,3,0,0),(1158,'2019-11-25',80,0,0,0,0),(1159,'2019-11-25',18,19,0,0,0),(1160,'2019-11-25',140,0,0,0,0),(1161,'2019-11-25',163,0,0,0,0),(1162,'2019-11-25',131,5,0,0,0),(1163,'2019-11-25',83,10,4,0,0),(1164,'2019-11-25',99,0,0,0,0),(1165,'2019-11-25',153,0,0,0,0),(1166,'2019-11-25',19,15,0,512000,0),(1167,'2019-11-25',223,20,11,0,0),(1168,'2019-11-25',96,25,2,810,0),(1169,'2019-11-25',95,40,2,0,0),(1170,'2019-11-25',82,0,19,0,0),(1171,'2019-11-25',158,40,75,9500000,0),(1172,'2019-11-25',202,30,1,3945000,0),(1173,'2019-11-25',90,44,0,9477000,0),(1174,'2019-11-25',84,5,7,0,0),(1175,'2019-11-25',183,10,0,0,0),(1176,'2019-11-25',105,1,0,0,0),(1177,'2019-11-25',89,6,0,6085000,0),(1178,'2019-11-25',101,5,0,0,0),(1179,'2019-11-25',114,5,0,2754000,0),(1180,'2019-11-25',102,4,0,0,0),(1181,'2019-11-25',100,0,0,0,0),(1182,'2019-11-25',104,0,0,0,0),(1183,'2019-11-25',253,0,0,0,0),(1184,'2019-11-25',264,0,0,0,0),(1185,'2019-11-25',87,0,0,0,0),(1186,'2019-11-25',91,7,16,5764000,0),(1187,'2019-11-25',135,0,23,0,0),(1188,'2019-11-25',118,0,3,0,0),(1189,'2019-11-25',103,16,3,2188000,0),(1190,'2019-11-25',177,0,0,0,0),(1191,'2019-11-25',162,20,0,0,0),(1192,'2019-11-25',139,20,0,1000000,0),(1193,'2019-11-25',94,0,0,0,0),(1194,'2019-11-25',93,16,0,9434000,0),(1195,'2019-11-25',92,0,0,0,0),(1196,'2019-11-25',86,0,0,660000,0),(1197,'2019-11-25',88,40,19,0,0),(1198,'2019-11-25',113,40,3,23368000,0),(1199,'2019-11-25',195,0,0,0,0),(1200,'2019-11-25',98,16,0,2000000,0),(1201,'2019-11-25',79,0,0,0,0),(1202,'2019-11-25',181,10,0,0,0),(1203,'2019-11-25',144,5,0,0,0),(1204,'2019-11-25',106,90,0,19600000,0),(1205,'2019-11-25',170,0,0,0,0),(1206,'2019-11-25',133,20,0,0,0),(1207,'2019-11-25',107,0,3,0,0),(1208,'2019-11-25',221,0,0,0,0),(1209,'2019-11-25',130,5,0,0,0),(1210,'2019-11-25',228,0,0,0,0),(1211,'2019-11-25',302,0,0,0,0),(1212,'2019-11-25',291,0,0,0,0),(1213,'2019-11-25',269,0,0,0,0),(1214,'2019-11-25',288,0,0,0,0),(1215,'2019-11-25',273,0,0,0,0),(1216,'2019-11-25',284,0,0,0,0),(1217,'2019-11-25',276,0,0,0,0),(1218,'2019-11-25',274,0,0,0,0),(1219,'2019-11-25',108,1,0,0,0),(1220,'2019-11-25',237,0,0,0,0),(1221,'2019-11-25',109,27,0,1366000,0),(1222,'2019-11-25',110,5,0,0,0),(1223,'2019-11-25',222,30,0,0,0),(1224,'2019-11-25',111,20,0,2000000,0),(1225,'2019-11-25',243,0,0,0,0),(1226,'2019-11-25',233,0,0,0,0),(1227,'2019-11-26',205,0,0,0,0),(1228,'2019-11-26',293,0,0,18054720,0),(1229,'2019-11-26',97,5,0,1200000,0),(1230,'2019-11-26',182,29,19,4198000,0),(1231,'2019-11-26',250,0,0,2142000,0),(1232,'2019-11-26',199,3,0,2841000,0),(1233,'2019-11-26',300,0,0,1732500,0),(1234,'2019-11-26',261,0,0,0,0),(1235,'2019-11-26',12,0,0,0,0),(1236,'2019-11-26',301,0,0,899100,0),(1237,'2019-11-26',175,10,0,1000000,0),(1238,'2019-11-26',283,0,0,0,0),(1239,'2019-11-26',160,0,0,0,0),(1240,'2019-11-26',305,10,0,48,0),(1241,'2019-11-26',296,0,0,0,0),(1242,'2019-11-26',278,0,0,88534825,0),(1243,'2019-11-26',277,0,0,0,0),(1244,'2019-11-26',13,0,0,0,0),(1245,'2019-11-26',15,22,4,580000,0),(1246,'2019-11-26',249,0,0,0,0),(1247,'2019-11-26',134,0,0,0,0),(1248,'2019-11-26',210,5,0,0,0),(1249,'2019-11-26',203,0,5,0,0),(1250,'2019-11-26',14,0,0,0,0),(1251,'2019-11-26',185,0,0,0,0),(1252,'2019-11-26',22,5,0,7020000,0),(1253,'2019-11-26',20,0,0,0,0),(1254,'2019-11-26',187,10,0,0,0),(1255,'2019-11-26',188,5,0,0,0),(1256,'2019-11-26',128,0,0,0,0),(1257,'2019-11-26',23,10,0,0,0),(1258,'2019-11-26',25,0,0,0,0),(1259,'2019-11-26',235,0,0,24982176,0),(1260,'2019-11-26',280,0,0,4379000,0),(1261,'2019-11-26',297,0,0,0,0),(1262,'2019-11-26',24,7,0,0,0),(1263,'2019-11-26',21,0,0,0,0),(1264,'2019-11-26',201,0,6,0,0),(1265,'2019-11-26',125,244,321,0,0),(1266,'2019-11-26',27,5,0,0,0),(1267,'2019-11-26',232,10,16,5726000,0),(1268,'2019-11-26',215,0,0,0,0),(1269,'2019-11-26',314,5,0,0,0),(1270,'2019-11-26',196,5,0,0,0),(1271,'2019-11-26',217,10,0,0,0),(1272,'2019-11-26',308,0,5,0,0),(1273,'2019-11-26',309,0,1,0,0),(1274,'2019-11-26',226,0,0,0,0),(1275,'2019-11-26',230,0,0,19850500,0),(1276,'2019-11-26',218,0,0,0,0),(1277,'2019-11-26',227,0,0,0,0),(1278,'2019-11-26',307,0,0,0,0),(1279,'2019-11-26',165,0,0,0,0),(1280,'2019-11-26',1,0,0,0,0),(1281,'2019-11-26',295,0,0,0,0),(1282,'2019-11-26',124,0,0,-1251234872,0),(1283,'2019-11-26',174,0,0,0,0),(1284,'2019-11-26',152,0,0,717495685,0),(1285,'2019-11-26',286,0,0,0,0),(1286,'2019-11-26',229,0,0,137470250,0),(1287,'2019-11-26',260,0,0,2811000,0),(1288,'2019-11-26',9,0,4,4900000,0),(1289,'2019-11-26',2,0,0,0,0),(1290,'2019-11-26',11,29,17,12727000,0),(1291,'2019-11-26',298,0,0,0,0),(1292,'2019-11-26',292,0,0,0,0),(1293,'2019-11-26',244,0,0,0,0),(1294,'2019-11-26',147,10,0,0,0),(1295,'2019-11-26',248,0,0,1105200,0),(1296,'2019-11-26',149,8,0,0,0),(1297,'2019-11-26',28,39,13,18110000,0),(1298,'2019-11-26',285,0,0,11550600,0),(1299,'2019-11-26',168,0,0,0,0),(1300,'2019-11-26',122,0,0,0,0),(1301,'2019-11-26',312,0,3,0,0),(1302,'2019-11-26',146,48,0,4020000,0),(1303,'2019-11-26',220,0,0,0,0),(1304,'2019-11-26',29,71,11,3000000,0),(1305,'2019-11-26',304,10,0,0,0),(1306,'2019-11-26',209,0,0,0,0),(1307,'2019-11-26',234,0,0,31725000,0),(1308,'2019-11-26',317,0,0,1441425,0),(1309,'2019-11-26',251,0,0,8664000,0),(1310,'2019-11-26',240,0,0,993600,0),(1311,'2019-11-26',242,0,1,0,0),(1312,'2019-11-26',31,0,0,0,0),(1313,'2019-11-26',267,0,0,0,0),(1314,'2019-11-26',198,15,0,0,0),(1315,'2019-11-26',126,0,0,0,0),(1316,'2019-11-26',270,0,0,0,0),(1317,'2019-11-26',256,0,0,0,0),(1318,'2019-11-26',30,0,0,0,0),(1319,'2019-11-26',32,0,0,0,0),(1320,'2019-11-26',263,0,0,0,0),(1321,'2019-11-26',262,0,0,26104600,0),(1322,'2019-11-26',271,0,0,18421500,0),(1323,'2019-11-26',318,0,0,9903500,0),(1324,'2019-11-26',254,0,0,0,0),(1325,'2019-11-26',282,0,0,2827500,0),(1326,'2019-11-26',252,0,0,0,0),(1327,'2019-11-26',247,0,0,7149600,0),(1328,'2019-11-26',268,0,0,10355380,0),(1329,'2019-11-26',259,0,0,2490000,0),(1330,'2019-11-26',241,0,0,2574000,0),(1331,'2019-11-26',239,0,0,22556700,0),(1332,'2019-11-26',257,0,0,9254790,0),(1333,'2019-11-26',238,0,0,4865400,0),(1334,'2019-11-26',148,0,0,0,0),(1335,'2019-11-26',310,50,11,5670000,0),(1336,'2019-11-26',225,5,0,0,0),(1337,'2019-11-26',190,0,0,0,0),(1338,'2019-11-26',189,5,0,0,0),(1339,'2019-11-26',313,5,16,3820000,0),(1340,'2019-11-26',129,10,0,0,0),(1341,'2019-11-26',164,0,0,0,0),(1342,'2019-11-26',37,0,0,0,0),(1343,'2019-11-26',171,68,4,14000000,0),(1344,'2019-11-26',33,0,0,0,0),(1345,'2019-11-26',176,0,0,0,0),(1346,'2019-11-26',193,0,0,0,0),(1347,'2019-11-26',213,100,10,11590000,0),(1348,'2019-11-26',39,0,0,0,0),(1349,'2019-11-26',186,4,0,0,0),(1350,'2019-11-26',16,5,0,0,0),(1351,'2019-11-26',204,20,4,0,0),(1352,'2019-11-26',136,5,0,0,0),(1353,'2019-11-26',200,10,0,0,0),(1354,'2019-11-26',35,34,0,13463000,0),(1355,'2019-11-26',151,0,0,0,0),(1356,'2019-11-26',155,0,0,0,0),(1357,'2019-11-26',42,30,0,2149000,0),(1358,'2019-11-26',287,0,0,0,0),(1359,'2019-11-26',38,0,0,0,0),(1360,'2019-11-26',41,40,6,30000,0),(1361,'2019-11-26',173,0,0,0,0),(1362,'2019-11-26',180,4,0,0,0),(1363,'2019-11-26',119,26,18,0,0),(1364,'2019-11-26',121,0,0,0,0),(1365,'2019-11-26',143,0,0,0,0),(1366,'2019-11-26',115,10,0,0,0),(1367,'2019-11-26',40,3,0,0,0),(1368,'2019-11-26',159,0,0,0,0),(1369,'2019-11-26',116,0,0,0,0),(1370,'2019-11-26',141,0,4,0,0),(1371,'2019-11-26',137,0,0,0,0),(1372,'2019-11-26',34,10,0,0,0),(1373,'2019-11-26',85,0,11,0,0),(1374,'2019-11-26',157,0,0,0,0),(1375,'2019-11-26',197,0,0,0,0),(1376,'2019-11-26',43,71,0,0,0),(1377,'2019-11-26',138,0,0,0,0),(1378,'2019-11-26',184,0,0,0,0),(1379,'2019-11-26',44,60,15,0,0),(1380,'2019-11-26',212,20,7,1040000,0),(1381,'2019-11-26',48,0,0,0,0),(1382,'2019-11-26',192,0,0,0,0),(1383,'2019-11-26',45,0,0,0,0),(1384,'2019-11-26',47,20,2,8000000,0),(1385,'2019-11-26',46,40,7,0,0),(1386,'2019-11-26',54,8,0,4408000,0),(1387,'2019-11-26',53,10,0,0,0),(1388,'2019-11-26',52,13,1,0,0),(1389,'2019-11-26',50,46,24,13780000,0),(1390,'2019-11-26',49,10,2,0,0),(1391,'2019-11-26',166,0,0,0,0),(1392,'2019-11-26',55,25,0,0,0),(1393,'2019-11-26',208,0,0,0,0),(1394,'2019-11-26',51,0,0,0,0),(1395,'2019-11-26',321,0,0,0,0),(1396,'2019-11-26',117,1,0,0,0),(1397,'2019-11-26',60,0,3,0,0),(1398,'2019-11-26',127,0,5,100000,0),(1399,'2019-11-26',56,0,0,0,0),(1400,'2019-11-26',58,16,5,0,0),(1401,'2019-11-26',59,10,0,3367000,0),(1402,'2019-11-26',145,15,0,1308000,0),(1403,'2019-11-26',112,13,0,0,0),(1404,'2019-11-26',178,16,0,0,0),(1405,'2019-11-26',224,10,0,0,0),(1406,'2019-11-26',211,40,6,24116000,0),(1407,'2019-11-26',194,20,0,5720000,0),(1408,'2019-11-26',62,0,0,0,0),(1409,'2019-11-26',61,18,1,3344000,0),(1410,'2019-11-26',17,8,0,1774000,0),(1411,'2019-11-26',57,4,0,0,0),(1412,'2019-11-26',123,0,0,1496000,0),(1413,'2019-11-26',311,20,0,0,0),(1414,'2019-11-26',219,0,0,0,0),(1415,'2019-11-26',191,0,0,0,0),(1416,'2019-11-26',156,0,0,0,0),(1417,'2019-11-26',65,10,2,3823000,0),(1418,'2019-11-26',172,5,0,0,0),(1419,'2019-11-26',63,0,0,0,0),(1420,'2019-11-26',64,0,0,0,0),(1421,'2019-11-26',315,0,4,0,0),(1422,'2019-11-26',281,0,0,0,0),(1423,'2019-11-26',279,0,0,0,0),(1424,'2019-11-26',322,0,0,10331250,0),(1425,'2019-11-26',275,0,0,0,0),(1426,'2019-11-26',167,0,0,0,0),(1427,'2019-11-26',303,10,0,0,0),(1428,'2019-11-26',236,0,0,0,0),(1429,'2019-11-26',161,20,6,0,0),(1430,'2019-11-26',306,7,0,0,0),(1431,'2019-11-26',66,20,4,0,0),(1432,'2019-11-26',72,0,0,0,0),(1433,'2019-11-26',71,25,0,0,0),(1434,'2019-11-26',67,0,0,0,0),(1435,'2019-11-26',207,0,0,0,0),(1436,'2019-11-26',68,0,0,0,0),(1437,'2019-11-26',150,0,0,0,0),(1438,'2019-11-26',69,0,0,0,0),(1439,'2019-11-26',319,0,0,0,0),(1440,'2019-11-26',169,0,7,9240000,0),(1441,'2019-11-26',120,100,8,0,0),(1442,'2019-11-26',70,10,0,0,0),(1443,'2019-11-26',206,14,3,4160000,0),(1444,'2019-11-26',179,17,2,0,0),(1445,'2019-11-26',320,20,0,0,0),(1446,'2019-11-26',73,3,0,0,0),(1447,'2019-11-26',132,20,0,0,0),(1448,'2019-11-26',74,10,0,0,0),(1449,'2019-11-26',216,0,0,0,0),(1450,'2019-11-26',142,38,22,1000000,0),(1451,'2019-11-26',26,0,2,9029000,0),(1452,'2019-11-26',265,0,0,0,0),(1453,'2019-11-26',266,0,0,1757320,0),(1454,'2019-11-26',290,0,0,4615500,0),(1455,'2019-11-26',258,0,0,49096750,0),(1456,'2019-11-26',316,0,0,1068660,0),(1457,'2019-11-26',294,0,0,7267500,0),(1458,'2019-11-26',77,0,7,6646000,0),(1459,'2019-11-26',76,0,0,0,0),(1460,'2019-11-26',154,3,1,0,0),(1461,'2019-11-26',214,20,0,0,0),(1462,'2019-11-26',299,0,0,735000,0),(1463,'2019-11-26',255,0,0,3021500,0),(1464,'2019-11-26',246,0,0,1281600,0),(1465,'2019-11-26',245,0,0,0,0),(1466,'2019-11-26',75,10,3,0,0),(1467,'2019-11-26',80,0,0,0,0),(1468,'2019-11-26',18,19,0,0,0),(1469,'2019-11-26',140,0,0,0,0),(1470,'2019-11-26',163,0,0,0,0),(1471,'2019-11-26',131,5,0,0,0),(1472,'2019-11-26',83,10,4,0,0),(1473,'2019-11-26',99,0,0,0,0),(1474,'2019-11-26',153,0,0,0,0),(1475,'2019-11-26',19,15,0,512000,0),(1476,'2019-11-26',223,20,11,0,0),(1477,'2019-11-26',96,25,2,810,0),(1478,'2019-11-26',95,40,2,0,0),(1479,'2019-11-26',82,0,19,0,0),(1480,'2019-11-26',158,40,75,9500000,0),(1481,'2019-11-26',202,30,1,3945000,0),(1482,'2019-11-26',90,44,0,9477000,0),(1483,'2019-11-26',84,5,7,0,0),(1484,'2019-11-26',183,10,0,0,0),(1485,'2019-11-26',105,1,0,0,0),(1486,'2019-11-26',89,6,0,6085000,0),(1487,'2019-11-26',101,5,0,0,0),(1488,'2019-11-26',114,5,0,2754000,0),(1489,'2019-11-26',102,4,0,0,0),(1490,'2019-11-26',100,0,0,0,0),(1491,'2019-11-26',104,0,0,0,0),(1492,'2019-11-26',253,0,0,5735300,0),(1493,'2019-11-26',264,0,0,0,0),(1494,'2019-11-26',87,0,0,0,0),(1495,'2019-11-26',91,7,16,5764000,0),(1496,'2019-11-26',135,0,23,0,0),(1497,'2019-11-26',118,0,3,0,0),(1498,'2019-11-26',103,16,3,2188000,0),(1499,'2019-11-26',177,0,0,0,0),(1500,'2019-11-26',162,20,0,0,0),(1501,'2019-11-26',139,20,0,1000000,0),(1502,'2019-11-26',94,0,0,0,0),(1503,'2019-11-26',93,16,0,9434000,0),(1504,'2019-11-26',92,0,0,0,0),(1505,'2019-11-26',86,0,0,660000,0),(1506,'2019-11-26',88,40,19,0,0),(1507,'2019-11-26',113,40,3,23368000,0),(1508,'2019-11-26',195,0,0,0,0),(1509,'2019-11-26',98,16,0,2000000,0),(1510,'2019-11-26',79,0,0,0,0),(1511,'2019-11-26',181,10,0,0,0),(1512,'2019-11-26',144,5,0,0,0),(1513,'2019-11-26',106,90,0,19600000,0),(1514,'2019-11-26',170,0,0,0,0),(1515,'2019-11-26',133,20,0,0,0),(1516,'2019-11-26',107,0,3,0,0),(1517,'2019-11-26',221,0,0,0,0),(1518,'2019-11-26',130,5,0,0,0),(1519,'2019-11-26',228,0,0,0,0),(1520,'2019-11-26',302,0,0,1120500,0),(1521,'2019-11-26',291,0,0,2040000,0),(1522,'2019-11-26',269,0,0,0,0),(1523,'2019-11-26',288,0,0,0,0),(1524,'2019-11-26',273,0,0,0,0),(1525,'2019-11-26',284,0,0,46570000,0),(1526,'2019-11-26',276,0,0,25372500,0),(1527,'2019-11-26',274,0,0,0,0),(1528,'2019-11-26',108,1,0,0,0),(1529,'2019-11-26',237,0,0,0,0),(1530,'2019-11-26',109,27,0,1366000,0),(1531,'2019-11-26',110,5,0,0,0),(1532,'2019-11-26',222,30,0,0,0),(1533,'2019-11-26',111,20,0,2000000,0),(1534,'2019-11-26',243,0,0,0,0),(1535,'2019-11-26',233,0,0,0,0);

/*Table structure for table `dayoff` */

DROP TABLE IF EXISTS `dayoff`;

CREATE TABLE `dayoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dayoff` */

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

/*Table structure for table `discount_oil` */

DROP TABLE IF EXISTS `discount_oil`;

CREATE TABLE `discount_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `discount_oil` */

/*Table structure for table `discount_oil_detail` */

DROP TABLE IF EXISTS `discount_oil_detail`;

CREATE TABLE `discount_oil_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `commission_from` double DEFAULT NULL,
  `commission_to` double DEFAULT NULL,
  `commission` double DEFAULT NULL,
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
  `start_date` date DEFAULT NULL,
  `salary_bhxh` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`id`,`idcard`,`fullname`,`email`,`salary`,`organization_id`,`birthday`,`status`,`start_date`,`salary_bhxh`) values (1,NULL,'Admin','admin@gmail.com',0,-1,'2018-08-23',1,NULL,NULL),(19,'171192314','Cao Thị Minh','c@gmail.com',5300000,1,NULL,1,NULL,NULL),(18,NULL,'Lê Ngọc Phước','ntb@gmail.com',2000000,14,'1980-01-15',1,'2000-01-01',NULL),(17,'045082000026','Phan Khắc Hùng','hungpk.quangtrung@gmail.com',10500000,1,'1982-11-17',1,'2014-01-01',NULL),(20,'273075081','Cao Phi Hùng','hungtat@gmail.com',5500000,1,'1982-01-23',1,'2014-01-01',NULL),(21,'171347560','Cao Thị Sáng','',5300000,1,'1968-01-13',1,NULL,NULL),(23,'172430427','Phạm Văn Sơn','a@a.com',5800000,1,'1981-09-17',1,NULL,NULL),(24,'273399388','Đoàn Xuân Vũ','',5800000,1,'1990-03-10',1,NULL,NULL),(25,'273463776','Lê Ngọc Phước','',5800000,1,'1984-03-16',1,NULL,NULL),(26,'273571217','Nguyễn Minh Trung','',5300000,1,'1994-10-09',1,NULL,NULL),(27,'273577993','Mai Văn Thừa','',5300000,1,'1994-01-16',1,NULL,NULL),(28,'273140291','Nguyễn Hữu Quốc Hưng','',5800000,1,'1984-07-08',1,NULL,NULL),(29,'171075650','Cao Văn Kính','',6500000,1,'1963-10-26',1,NULL,NULL),(30,'273437479','Lê Hoàng Phước','',5300000,1,'1990-03-20',1,NULL,NULL),(31,'07708400063','Cao Huy Hoàng','',7500000,1,'1984-10-28',1,NULL,NULL),(32,'04008200037','Đặng Quang Thắng Bảy','',6300000,1,'1982-02-23',2,NULL,NULL),(33,'273508376','Trần Thanh Nam','',5300000,1,'1992-10-19',1,NULL,NULL),(34,'273651458','Nguyễn Thanh Hiền','',5300000,1,'1993-12-16',1,NULL,NULL),(35,'273288034','Lê Thị Khánh Linh','',5800000,1,'1988-07-04',1,NULL,NULL),(36,'273211619','Nguyễn Đức Tuấn','',5800000,1,'1988-02-15',1,NULL,NULL),(37,'02418400067','Hoàng Thị Lan Thuý','',3307000,1,'1984-09-22',1,NULL,NULL),(38,'162712864','Nguyễn Tiến Lãng','',6800000,1,'1985-11-06',1,NULL,NULL),(39,'273048894','Nguyễn Thanh Dũng','',5800000,1,'1969-03-15',1,NULL,NULL),(40,'273148634','Tạ Thị Kim Lộc','',5800000,1,'1985-01-02',1,NULL,NULL),(41,'273651568','Phạm Ngọc Phước Phi','',5300000,1,'1994-07-20',1,NULL,NULL),(42,'1122334455','Nguyễn Phương Tú','',0,14,NULL,1,NULL,NULL),(43,'171192370','Lưu Trần Hải','',5800000,1,NULL,1,NULL,NULL),(44,'273172536','Đặng Thanh Huân','',6800000,1,NULL,1,NULL,NULL),(45,'271941356','Ngô Bá Tài','',6800000,1,NULL,1,NULL,NULL),(46,'123456','Trần Minh Kha','',0,1,NULL,1,NULL,NULL),(47,'564','Anh Vũ','',0,1,NULL,1,NULL,0),(48,'789','Anh Hiền','',0,1,NULL,1,NULL,0),(49,'247897541','Nguyễn Đình Huy','',0,1,NULL,1,NULL,0),(50,'578942165','Lê Văn Châu','',0,1,NULL,1,NULL,0),(51,'1245791','Đặng Văn Quý','',0,1,NULL,1,NULL,0),(52,'2478945762','Nguyễn Ngọc Ánh','',0,1,NULL,1,NULL,0);

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
  `actual_off_day` float DEFAULT '0',
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
  `dayoff_id` int(11) DEFAULT NULL,
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

/*Table structure for table `employee_oil_commission` */

DROP TABLE IF EXISTS `employee_oil_commission`;

CREATE TABLE `employee_oil_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_oil_commission` */

insert  into `employee_oil_commission`(`id`,`name`,`amount`,`note`) values (1,'CK3000',3000,''),(2,'CK1500',1500,'');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_other_bonus` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_panelty` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_route_fee` */

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fraction_gas` */

insert  into `fraction_gas`(`id`,`code`,`created_date`,`created_employee_id`,`note`) values (6,'20191023-FG-0001','2019-10-22',35,''),(7,'20191024-FG-0001','2019-10-23',35,''),(8,'20191025-FG-0001','2019-10-24',35,''),(9,'20191026-FG-0001','2019-10-25',35,''),(10,'20191028-FG-0001','2019-10-26',35,''),(11,'20191029-FG-0001','2019-10-26',35,''),(12,'20191030-FG-0001','2019-10-29',35,''),(13,'20191031-FG-0001','2019-10-30',35,''),(14,'20191101-FG-0001','2019-10-31',35,''),(15,'20191126-FG-0001','2019-11-25',35,'');

/*Table structure for table `fraction_gas_detail` */

DROP TABLE IF EXISTS `fraction_gas_detail`;

CREATE TABLE `fraction_gas_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraction_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fraction_gas_detail` */

insert  into `fraction_gas_detail`(`id`,`fraction_id`,`shell_id`,`quantity`) values (1,6,1,'647'),(2,6,4,'4'),(3,7,1,'504'),(4,7,4,'42'),(5,8,1,'559'),(6,8,4,'11'),(7,9,1,'516'),(8,9,4,'28'),(9,10,1,'564'),(10,10,4,'2'),(11,11,1,'602'),(12,11,4,'46'),(13,12,1,'913'),(14,12,4,'17'),(15,13,1,'671'),(16,13,4,'68'),(17,14,1,'816'),(18,15,1,'572'),(19,15,4,'38');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import` */

/*Table structure for table `gas_import_detail` */

DROP TABLE IF EXISTS `gas_import_detail`;

CREATE TABLE `gas_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_import_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL COMMENT 'shell_id in shell_vendor',
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return_vendor` */

insert  into `gas_return_vendor`(`id`,`vendor_id`,`organization_id`) values (1,22,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale` */

insert  into `gas_wholesale`(`id`,`code`,`created_date`,`customer_id`,`total`,`discount`,`total_pay`,`paid`,`debt`,`account_id`,`vehicle_out_id`,`note`,`gas_return`,`gas_return_price`,`gas_return_amount`,`paid_old_debt_amount`,`created_employee_id`) values (1,'20191023-GS-0001','2019-10-22',202,1236000,0,1236000,1236000,0,5,9,'',0,18000,0,0,35),(2,'20191023-GS-0002','2019-10-22',204,4120000,0,4120000,4120000,0,5,9,'',0,18000,0,0,35),(3,'20191023-GS-0003','2019-10-22',203,14420000,0,14420000,14420000,0,5,9,'',0,18000,0,0,35),(4,'20191023-GS-0004','2019-10-22',224,2160000,0,2160000,2160000,0,5,9,'',0,18000,0,0,35),(5,'20191023-GS-0005','2019-10-22',213,4510000,0,4510000,0,4510000,5,9,'',0,17083,0,0,35),(6,'20191023-GS-0006','2019-10-22',211,11275000,0,11275000,11275000,0,5,9,'',0,17083,0,0,35),(7,'20191023-GS-0007','2019-10-22',18,3664000,0,3664000,3664000,0,5,9,'',0,19083,0,4809000,35),(8,'20191023-GS-0008','2019-10-22',9,2240000,0,2240000,2240000,0,5,7,'',0,18667,0,0,35),(9,'20191023-GS-0009','2019-10-22',11,4862000,0,4752000,4752000,0,5,7,'',6,18333,110000,0,35),(10,'20191023-GS-0010','2019-10-22',23,2170000,0,2170000,2170000,0,5,7,'',0,18083,0,0,35),(11,'20191023-GS-0011','2019-10-22',15,4523000,0,4523000,4523000,0,5,7,'',0,19083,0,0,35),(12,'20191023-GS-0012','2019-10-22',21,1953000,0,1953000,1953000,0,5,7,'',0,18083,0,0,35),(13,'20191023-GS-0013','2019-10-22',41,5840000,0,5785000,5785000,0,5,7,'',3,18333,55000,0,35),(14,'20191023-GS-0014','2019-10-22',115,5038000,0,5038000,5038000,0,5,7,'',0,19083,0,0,35),(15,'20191023-GS-0015','2019-10-22',56,3149000,0,3149000,3149000,0,5,7,'',0,19083,0,0,35),(16,'20191023-GS-0016','2019-10-22',103,5038000,0,5038000,5038000,0,5,7,'',0,19083,0,0,35),(17,'20191023-GS-0017','2019-10-22',84,3206000,0,3206000,3206000,0,5,7,'',0,19083,0,0,35),(18,'20191023-GS-0018','2019-10-22',52,1582000,0,1582000,1582000,0,5,7,'',0,18833,0,1130000,35),(19,'20191023-GS-0019','2019-10-22',111,1145000,0,1145000,1145000,0,5,7,'',0,19083,0,0,35),(20,'20191023-GS-0020','2019-10-22',104,687000,0,687000,687000,0,5,7,'',0,19083,0,0,35),(21,'20191023-GS-0021','2019-10-22',47,1344000,0,1344000,1344000,0,5,7,'',0,18667,0,0,35),(22,'20191023-GS-0022','2019-10-22',28,4237000,0,4237000,4237000,0,5,7,'',0,18833,0,0,35),(23,'20191023-GS-0023','2019-10-22',42,2519000,0,2519000,2519000,0,5,7,'',0,19083,0,1832000,35),(24,'20191023-GS-0024','2019-10-22',168,1145000,0,1145000,1145000,0,5,7,'',0,19083,0,0,35),(25,'20191023-GS-0025','2019-10-22',117,672000,0,672000,672000,0,5,7,'',0,18667,0,0,35),(26,'20191023-GS-0026','2019-10-22',106,10528000,0,10528000,10528000,0,5,7,'',0,18667,0,4480000,35),(27,'20191023-GS-0027','2019-10-22',133,3136000,0,3136000,3136000,0,5,7,'',0,18667,0,0,35),(28,'20191023-GS-0028','2019-10-22',53,1832000,0,1832000,1832000,0,5,7,'',0,19083,0,0,35),(29,'20191023-GS-0029','2019-10-22',142,7083000,0,6973000,6973000,0,5,7,'',6,18333,110000,0,35),(30,'20191023-GS-0030','2019-10-22',167,442000,0,442000,442000,0,5,7,'anh Phước',0,18417,0,0,35),(31,'20191023-GS-0031','2019-10-22',169,0,0,0,0,0,5,8,'',0,0,0,0,35),(32,'20191023-GS-0032','2019-10-22',125,0,0,0,0,0,5,8,'',164,0,0,0,35),(33,'20191023-GS-0033','2019-10-22',182,5858000,0,5858000,0,5858000,5,8,'',0,17917,0,0,35),(35,'20191024-GS-0001','2019-10-23',232,8945000,0,8945000,6945000,2000000,5,10,'',0,16750,0,0,35),(36,'20191024-GS-0002','2019-10-23',135,5375000,0,5375000,5375000,0,5,10,'',0,17917,0,0,35),(37,'20191024-GS-0003','2019-10-23',171,6541000,0,6541000,6541000,0,5,10,'',0,17583,0,8000000,35),(38,'20191024-GS-0004','2019-10-23',43,15050000,0,15050000,15050000,0,5,10,'',0,17917,0,0,35),(39,'20191024-GS-0005','2019-10-23',58,1576000,0,1576000,1576000,0,5,10,'',0,18511,0,0,35),(40,'20191024-GS-0006','2019-10-23',72,3330000,0,3330000,1530000,1800000,5,10,'',0,18500,0,0,35),(41,'20191024-GS-0007','2019-10-23',109,1832000,0,1832000,1832000,0,5,12,'',0,19083,0,2977000,35),(42,'20191024-GS-0008','2019-10-23',59,1374000,0,1374000,1374000,0,5,12,'',0,19083,0,0,35),(43,'20191024-GS-0009','2019-10-23',98,1603000,0,1603000,1603000,0,5,12,'',0,19083,0,0,35),(44,'20191024-GS-0010','2019-10-23',89,1603000,0,1603000,1603000,0,5,12,'',0,19083,0,0,35),(45,'20191024-GS-0011','2019-10-23',194,3435000,0,3435000,3435000,0,5,12,'',0,19083,0,0,35),(46,'20191024-GS-0012','2019-10-23',50,3206000,0,2750000,2750000,0,5,12,'',24,19000,456000,0,35),(47,'20191024-GS-0013','2019-10-23',35,6882000,0,6882000,6882000,0,5,12,'',0,18500,0,0,35),(48,'20191024-GS-0014','2019-10-23',29,6216000,0,6216000,6216000,0,5,12,'',0,18500,0,0,35),(49,'20191024-GS-0015','2019-10-23',139,2290000,0,2290000,2290000,0,5,12,'',0,19083,0,0,35),(50,'20191024-GS-0016','2019-10-23',97,1832000,0,1832000,1832000,0,5,12,'',0,19083,0,0,35),(51,'20191024-GS-0017','2019-10-23',73,1374000,0,1374000,1374000,0,5,12,'',0,19083,0,0,35),(52,'20191024-GS-0018','2019-10-23',48,458000,0,458000,458000,0,5,12,'',0,19083,0,0,35),(53,'20191024-GS-0019','2019-10-23',178,458000,0,458000,458000,0,5,12,'',0,19083,0,0,35),(54,'20191024-GS-0020','2019-10-23',144,2061000,0,2061000,2061000,0,5,12,'',0,19083,0,0,35),(55,'20191024-GS-0021','2019-10-23',26,2210000,0,2210000,2210000,0,5,12,'',0,18417,0,0,35),(56,'20191024-GS-0022','2019-10-23',57,3436000,0,3436000,0,3436000,5,12,'',0,19089,0,0,35),(57,'20191024-GS-0023','2019-10-23',65,2034000,0,2034000,2034000,0,5,11,'',0,18833,0,0,35),(58,'20191024-GS-0024','2019-10-23',132,2260000,0,2260000,2260000,0,5,11,'',0,18833,0,0,35),(59,'20191024-GS-0025','2019-10-23',95,5198000,0,5198000,5198000,0,5,11,'',0,18833,0,0,35),(60,'20191024-GS-0026','2019-10-23',113,6630000,0,6630000,6630000,0,5,11,'',0,18417,0,0,35),(61,'20191024-GS-0027','2019-10-23',88,7593000,0,7593000,7593000,0,5,11,'',0,18750,0,0,35),(62,'20191024-GS-0028','2019-10-23',66,1350000,0,1350000,1350000,0,5,11,'',0,18750,0,0,35),(63,'20191024-GS-0029','2019-10-23',147,4050000,0,4050000,4050000,0,5,11,'',0,18750,0,0,35),(64,'20191024-GS-0030','2019-10-23',69,1575000,0,1575000,1575000,0,5,11,'',0,18750,0,0,35),(65,'20191024-GS-0031','2019-10-23',107,4218000,0,4218000,4218000,0,5,11,'',0,18750,0,0,35),(66,'20191024-GS-0032','2019-10-23',310,6300000,0,6300000,6300000,0,5,11,'',0,17500,0,0,35),(67,'20191024-GS-0033','2019-10-23',91,1575000,0,1575000,1575000,0,5,11,'',0,18750,0,0,35),(68,'20191024-GS-0034','2019-10-23',44,843000,0,843000,0,843000,5,11,'',0,18733,0,0,35),(69,'20191024-GS-0035','2019-10-23',158,4460000,0,4154000,4154000,0,5,11,'',17,18000,306000,500000,35),(70,'20191024-GS-0036','2019-10-23',96,1808000,0,1808000,1808000,0,5,11,'',0,18833,0,0,35),(71,'20191025-GS-0001','2019-10-24',222,6180000,0,6180000,6180000,0,5,14,'',0,18000,0,0,35),(72,'20191025-GS-0002','2019-10-24',213,2870000,0,2870000,2870000,0,5,14,'',0,17083,0,0,35),(73,'20191025-GS-0003','2019-10-24',212,1845000,0,1845000,1845000,0,5,14,'',0,17083,0,0,35),(74,'20191025-GS-0004','2019-10-24',202,5562000,0,5562000,5562000,0,5,14,'',0,18000,0,0,35),(75,'20191025-GS-0005','2019-10-24',211,5980000,0,5980000,5980000,0,5,14,'',0,17083,0,0,35),(76,'20191025-GS-0006','2019-10-24',9,2240000,0,2240000,2240000,0,5,13,'',0,18667,0,0,35),(77,'20191025-GS-0007','2019-10-24',11,6465000,0,6005000,6005000,0,5,13,'',25,18400,460000,0,35),(78,'20191025-GS-0008','2019-10-24',53,1374000,0,1374000,1374000,0,5,13,'',0,19083,0,0,35),(79,'20191025-GS-0009','2019-10-24',23,651000,0,651000,651000,0,5,13,'',0,18083,0,0,35),(80,'20191025-GS-0010','2019-10-24',41,2977000,0,2977000,2977000,0,5,13,'',0,19083,0,0,35),(81,'20191025-GS-0011','2019-10-24',115,2748000,0,2748000,2748000,0,5,13,'',0,19083,0,0,35),(82,'20191025-GS-0012','2019-10-24',84,1832000,0,1832000,1832000,0,5,13,'',0,19083,0,0,35),(83,'20191025-GS-0013','2019-10-24',42,2977000,0,2977000,2977000,0,5,13,'',0,19083,0,0,35),(84,'20191025-GS-0014','2019-10-24',75,4011000,0,3996000,3996000,0,5,13,'',1,15000,15000,0,35),(85,'20191025-GS-0015','2019-10-24',47,672000,0,672000,672000,0,5,13,'',0,18667,0,0,35),(86,'20191025-GS-0016','2019-10-24',183,0,0,0,0,0,5,13,'',0,0,0,916000,35),(87,'20191025-GS-0017','2019-10-24',28,4746000,0,4746000,4746000,0,5,13,'',0,18833,0,0,35),(88,'20191026-GS-0001','2019-10-24',123,1603000,0,1603000,1603000,0,5,13,'',0,19083,0,2061000,35),(89,'20191026-GS-0002','2019-10-24',168,1374000,0,1374000,1374000,0,5,13,'',0,19083,0,0,35),(90,'20191026-GS-0003','2019-10-24',103,1603000,0,1603000,1603000,0,5,13,'',0,19083,0,0,35),(91,'20191026-GS-0004','2019-10-24',22,1736000,0,1736000,1736000,0,5,13,'',0,18083,0,0,35),(92,'20191026-GS-0005','2019-10-24',15,2061000,0,2061000,2061000,0,5,13,'',0,19083,0,0,35),(93,'20191026-GS-0006','2019-10-24',117,672000,0,672000,672000,0,5,13,'',0,18667,0,0,35),(94,'20191026-GS-0007','2019-10-24',106,9408000,0,9408000,9408000,0,5,13,'',0,18667,0,0,35),(95,'20191026-GS-0008','2019-10-24',21,868000,0,868000,868000,0,5,13,'',0,18083,0,0,35),(96,'20191026-GS-0009','2019-10-24',142,3094000,0,3094000,3094000,0,5,13,'',0,18417,0,0,35),(97,'20191026-GS-0010','2019-10-24',18,458000,0,458000,458000,0,5,13,'',0,19083,0,0,35),(98,'20191026-GS-0011','2019-10-24',77,5646000,0,5646000,0,5646000,5,13,'',0,20911,0,0,35),(99,'20191026-GS-0012','2019-10-24',119,10592000,0,10592000,10592000,0,5,15,'',0,18583,0,0,35),(100,'20191026-GS-0013','2019-10-24',125,0,0,0,0,0,5,15,'',50,0,0,0,35),(101,'20191026-GS-0014','2019-10-24',129,2938000,0,2938000,2938000,0,5,15,'',0,18833,0,0,35),(102,'20191026-GS-0015','2019-10-25',171,7385000,0,7385000,3385000,4000000,5,16,'',0,17583,0,0,35),(103,'20191026-GS-0016','2019-10-25',161,6300000,0,6300000,6300000,0,5,16,'',0,17500,0,0,35),(104,'20191026-GS-0017','2019-10-25',145,1290000,0,1290000,0,1290000,5,16,'',0,17917,0,0,35),(105,'20191026-GS-0018','2019-10-25',43,17200000,0,17200000,17200000,0,5,16,'',0,17917,0,0,35),(106,'20191026-GS-0019','2019-10-25',58,888000,0,888000,888000,0,5,16,'',0,18500,0,0,35),(107,'20191026-GS-0020','2019-10-25',135,6450000,0,6450000,6450000,0,5,16,'',0,17917,0,0,35),(108,'20191026-GS-0021','2019-10-25',162,1470000,0,1470000,1470000,0,5,16,'',0,17500,0,0,35),(109,'20191026-GS-0022','2019-10-25',16,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(110,'20191026-GS-0023','2019-10-25',109,1374000,0,1374000,1374000,0,5,18,'',0,19083,0,0,35),(111,'20191026-GS-0024','2019-10-25',93,2061000,0,2061000,2061000,0,5,18,'',0,19083,0,1374000,35),(112,'20191026-GS-0025','2019-10-25',83,2061000,0,2061000,2061000,0,5,18,'',0,19083,0,0,35),(113,'20191026-GS-0026','2019-10-25',198,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(114,'20191026-GS-0027','2019-10-25',98,1374000,0,1374000,1374000,0,5,18,'',0,19083,0,0,35),(115,'20191026-GS-0028','2019-10-25',89,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(116,'20191026-GS-0029','2019-10-25',50,5652000,0,5652000,5652000,0,5,18,'',0,19083,0,0,35),(117,'20191026-GS-0030','2019-10-25',46,3390000,0,3390000,3390000,0,5,18,'',0,18833,0,0,35),(118,'20191026-GS-0031','2019-10-25',206,2290000,0,2290000,2290000,0,5,18,'',0,19083,0,0,35),(119,'20191026-GS-0032','2019-10-25',35,16650000,0,16038000,16038000,0,5,18,'',34,18000,612000,0,35),(120,'20191026-GS-0033','2019-10-25',312,4440000,0,4440000,4440000,0,5,18,'',0,18500,0,0,35),(121,'20191026-GS-0034','2019-10-25',29,5772000,0,5772000,5772000,0,5,18,'',0,18500,0,0,35),(122,'20191026-GS-0035','2019-10-25',51,916000,0,916000,916000,0,5,18,'',0,19083,0,0,35),(123,'20191026-GS-0036','2019-10-25',116,1832000,0,1832000,1832000,0,5,18,'',0,19083,0,0,35),(124,'20191026-GS-0037','2019-10-25',37,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(125,'20191026-GS-0038','2019-10-25',136,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(126,'20191026-GS-0039','2019-10-25',154,2290000,0,2290000,2290000,0,5,18,'',0,19083,0,0,35),(127,'20191026-GS-0040','2019-10-25',139,1603000,0,1603000,1603000,0,5,18,'',0,19083,0,0,35),(128,'20191026-GS-0041','2019-10-25',54,2748000,0,2748000,2748000,0,5,18,'',0,19083,0,0,35),(129,'20191026-GS-0042','2019-10-25',97,916000,0,916000,0,916000,5,18,'',0,19083,0,0,35),(130,'20191026-GS-0043','2019-10-25',122,687000,0,687000,687000,0,5,18,'',0,19083,0,0,35),(131,'20191026-GS-0044','2019-10-25',48,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(132,'20191026-GS-0045','2019-10-25',26,2210000,0,2210000,2210000,0,5,18,'',0,18417,0,0,35),(133,'20191026-GS-0046','2019-10-25',73,1145000,0,1145000,1145000,0,5,18,'',0,19083,0,0,35),(134,'20191026-GS-0047','2019-10-25',65,2429000,0,2429000,2429000,0,5,17,'',0,18833,0,0,35),(135,'20191026-GS-0048','2019-10-25',96,2938000,0,2938000,2938000,0,5,17,'',0,18833,0,0,35),(136,'20191026-GS-0049','2019-10-25',95,3842000,0,3842000,3842000,0,5,17,'',0,18833,0,0,35),(137,'20191026-GS-0050','2019-10-25',24,1350000,0,1350000,1350000,0,5,17,'',0,18750,0,0,35),(138,'20191026-GS-0051','2019-10-25',113,15635000,0,15635000,0,15635000,5,17,'',0,18417,0,0,35),(139,'20191026-GS-0052','2019-10-25',88,3375000,0,3375000,3375000,0,5,17,'',0,18750,0,0,35),(140,'20191026-GS-0053','2019-10-25',66,1800000,0,1800000,0,1800000,5,17,'',0,18750,0,0,35),(141,'20191026-GS-0054','2019-10-25',69,1575000,0,1575000,1575000,0,5,17,'',0,18750,0,0,35),(142,'20191026-GS-0055','2019-10-25',107,2250000,0,2250000,2250000,0,5,17,'',0,18750,0,0,35),(143,'20191026-GS-0056','2019-10-25',91,2643000,0,2643000,2643000,0,5,17,'',0,18750,0,0,35),(144,'20191026-GS-0057','2019-10-25',310,8400000,0,8400000,8400000,0,5,17,'',0,17500,0,0,35),(145,'20191026-GS-0058','2019-10-25',44,3600000,0,3600000,3600000,0,5,17,'',0,18750,0,3420000,35),(146,'20191026-GS-0059','2019-10-25',158,6689000,0,6689000,6689000,0,5,17,'',0,18583,0,0,35),(147,'20191026-GS-0060','2019-10-25',17,675000,0,675000,675000,0,5,17,'',0,18750,0,0,35),(148,'20191026-GS-0061','2019-10-25',114,904000,0,904000,904000,0,5,17,'',0,18833,0,904000,35),(149,'20191026-GS-0062','2019-10-25',210,0,0,0,0,0,5,17,'',0,0,0,0,35),(150,'20191028-GS-0001','2019-10-26',313,9410000,0,9410000,0,9410000,5,20,'',0,20911,0,0,35),(227,'20191029-GS-0047','2019-10-26',134,221000,0,221000,221000,0,5,22,'',0,18417,0,0,35),(152,'20191028-GS-0003','2019-10-26',202,1854000,0,1854000,1854000,0,5,21,'',0,18000,0,0,35),(153,'20191028-GS-0004','2019-10-26',204,4120000,0,4120000,4120000,0,5,21,'',0,18000,0,0,35),(154,'20191028-GS-0005','2019-10-26',211,6048000,0,6048000,6048000,0,5,21,'',0,17083,0,0,35),(155,'20191028-GS-0006','2019-10-26',223,2106000,0,2106000,2106000,0,5,21,'',0,18000,0,0,35),(156,'20191028-GS-0007','2019-10-26',311,4944000,0,4944000,4944000,0,5,21,'',0,17167,0,0,35),(157,'20191028-GS-0008','2019-10-26',213,3075000,0,3075000,3075000,0,5,21,'',0,17083,0,0,35),(158,'20191028-GS-0009','2019-10-26',9,2240000,0,2240000,2240000,0,5,19,'',0,18667,0,0,35),(159,'20191028-GS-0010','2019-10-26',11,3094000,0,3094000,3094000,0,5,19,'',0,18417,0,0,35),(160,'20191028-GS-0011','2019-10-26',23,1736000,0,1736000,1736000,0,5,19,'',0,18083,0,0,35),(161,'20191028-GS-0012','2019-10-26',41,1145000,0,1145000,1145000,0,5,19,'',0,19083,0,0,35),(162,'20191028-GS-0013','2019-10-26',115,3893000,0,3893000,3893000,0,5,19,'',0,19083,0,0,35),(163,'20191028-GS-0014','2019-10-26',56,2290000,0,2290000,2290000,0,5,19,'',0,19083,0,0,35),(164,'20191028-GS-0015','2019-10-26',103,2061000,0,2061000,0,2061000,5,19,'',0,19083,0,0,35),(165,'20191028-GS-0016','2019-10-26',84,2462000,0,2462000,2462000,0,5,19,'',0,19083,0,0,35),(166,'20191028-GS-0017','2019-10-26',52,678000,0,678000,678000,0,5,19,'',0,18833,0,0,35),(167,'20191028-GS-0018','2019-10-26',34,3435000,0,3435000,3435000,0,5,19,'',0,19083,0,0,35),(168,'20191028-GS-0019','2019-10-26',104,916000,0,916000,916000,0,5,19,'',0,19083,0,0,35),(169,'20191028-GS-0020','2019-10-26',47,896000,0,896000,896000,0,5,19,'',0,18667,0,0,35),(170,'20191028-GS-0021','2019-10-26',28,5650000,0,5650000,5650000,0,5,19,'',0,18833,0,0,35),(171,'20191028-GS-0022','2019-10-26',42,4580000,0,4580000,0,4580000,5,19,'',0,19083,0,0,35),(172,'20191028-GS-0023','2019-10-26',168,1603000,0,1603000,1603000,0,5,19,'',0,19083,0,0,35),(173,'20191028-GS-0024','2019-10-26',215,1145000,0,1145000,0,1145000,5,19,'',0,19083,0,0,35),(174,'20191028-GS-0025','2019-10-26',15,1546000,0,1546000,1546000,0,5,19,'',0,19083,0,0,35),(175,'20191028-GS-0026','2019-10-26',21,1085000,0,1085000,1085000,0,5,19,'',0,18083,0,0,35),(176,'20191028-GS-0027','2019-10-26',106,14784000,0,14784000,10304000,4480000,5,19,'',0,18667,0,0,35),(177,'20191028-GS-0028','2019-10-26',53,1832000,0,1832000,1832000,0,5,19,'',0,19083,0,0,35),(178,'20191028-GS-0029','2019-10-26',18,3664000,0,3664000,3664000,0,5,19,'',0,19083,0,0,35),(179,'20191028-GS-0030','2019-10-26',319,442000,0,442000,442000,0,5,19,'',0,18417,0,0,35),(180,'20191028-GS-0031','2019-10-26',142,3315000,0,3315000,3315000,0,5,19,'',0,18417,0,0,35),(181,'20191029-GS-0001','2019-10-28',190,1110000,0,1110000,1110000,0,5,23,'',0,18500,0,0,35),(182,'20191029-GS-0002','2019-10-28',175,2190000,0,2190000,2190000,0,5,23,'',0,18250,0,0,35),(183,'20191029-GS-0003','2019-10-28',135,10750000,0,10750000,10750000,0,5,23,'',0,17917,0,0,35),(184,'20191029-GS-0004','2019-10-28',171,10761000,0,10761000,10761000,0,5,23,'',0,17583,0,4000000,35),(185,'20191029-GS-0005','2019-10-28',145,1935000,0,1935000,1935000,0,5,23,'',0,17917,0,1290000,35),(186,'20191029-GS-0006','2019-10-28',162,840000,0,840000,840000,0,5,23,'',0,17500,0,0,35),(187,'20191029-GS-0007','2019-10-28',161,10240000,0,10240000,8240000,2000000,5,23,'',0,17500,0,0,35),(188,'20191029-GS-0008','2019-10-28',43,17200000,0,17200000,17200000,0,5,23,'',0,17917,0,0,35),(189,'20191029-GS-0009','2019-10-28',58,2220000,0,2220000,2220000,0,5,23,'',0,18500,0,0,35),(190,'20191029-GS-0010','2019-10-28',28,4520000,0,4520000,4520000,0,5,23,'',0,18833,0,0,35),(191,'20191029-GS-0011','2019-10-28',164,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,687000,35),(192,'20191029-GS-0012','2019-10-28',16,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(193,'20191029-GS-0013','2019-10-28',109,3893000,0,3893000,3893000,0,5,25,'',0,19083,0,0,35),(194,'20191029-GS-0014','2019-10-28',93,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(195,'20191029-GS-0015','2019-10-28',150,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(196,'20191029-GS-0016','2019-10-28',83,2748000,0,2748000,2748000,0,5,25,'',0,19083,0,0,35),(197,'20191029-GS-0017','2019-10-28',59,2061000,0,2061000,2061000,0,5,25,'',0,19083,0,0,35),(198,'20191029-GS-0018','2019-10-28',198,1603000,0,1603000,1603000,0,5,25,'',0,19083,0,0,35),(199,'20191029-GS-0019','2019-10-28',176,1832000,0,1832000,1832000,0,5,25,'',0,19083,0,0,35),(200,'20191029-GS-0020','2019-10-28',98,2232000,0,2232000,2232000,0,5,25,'',0,19083,0,0,35),(201,'20191029-GS-0021','2019-10-28',46,4294000,0,4294000,4294000,0,5,25,'',0,18833,0,0,35),(202,'20191029-GS-0022','2019-10-28',50,6110000,0,6015000,5081000,934000,5,25,'',5,19000,95000,0,35),(203,'20191029-GS-0023','2019-10-28',35,11322000,0,11156000,11156000,0,5,25,'',9,18444,166000,0,35),(204,'20191029-GS-0024','2019-10-28',312,4440000,0,4440000,4440000,0,5,25,'',0,18500,0,0,35),(205,'20191029-GS-0025','2019-10-28',29,8436000,0,8436000,8436000,0,5,25,'',0,18500,0,0,35),(206,'20191029-GS-0026','2019-10-28',51,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(207,'20191029-GS-0027','2019-10-28',116,916000,0,916000,0,916000,5,25,'',0,19083,0,0,35),(208,'20191029-GS-0028','2019-10-28',101,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(209,'20191029-GS-0029','2019-10-28',136,1145000,0,1145000,1145000,0,5,25,'',0,19083,0,0,35),(210,'20191029-GS-0030','2019-10-28',73,687000,0,687000,687000,0,5,25,'',0,19083,0,0,35),(211,'20191029-GS-0031','2019-10-28',121,687000,0,687000,687000,0,5,25,'',0,19083,0,0,35),(212,'20191029-GS-0032','2019-10-28',97,1832000,0,1832000,1832000,0,5,25,'',0,19083,0,0,35),(213,'20191029-GS-0033','2019-10-28',26,3038000,0,3038000,3038000,0,5,25,'',0,18417,0,0,35),(214,'20191029-GS-0034','2019-10-28',65,1808000,0,1808000,1808000,0,5,24,'',0,18833,0,0,35),(215,'20191029-GS-0035','2019-10-28',96,2034000,0,2034000,2034000,0,5,24,'',0,18833,0,0,35),(216,'20191029-GS-0036','2019-10-28',132,2260000,0,2260000,2260000,0,5,24,'',0,18833,0,0,35),(217,'20191029-GS-0037','2019-10-28',95,6780000,0,6780000,6780000,0,5,24,'',0,18833,0,0,35),(218,'20191029-GS-0038','2019-10-28',113,6630000,0,6630000,6630000,0,5,24,'',0,18417,0,15635000,35),(219,'20191029-GS-0039','2019-10-28',66,2700000,0,2700000,2700000,0,5,24,'',0,18750,0,1800000,35),(220,'20191029-GS-0040','2019-10-28',69,2250000,0,2250000,2250000,0,5,24,'',0,18750,0,0,35),(221,'20191029-GS-0041','2019-10-28',88,11250000,0,11250000,11250000,0,5,24,'',0,18750,0,0,35),(222,'20191029-GS-0042','2019-10-28',107,7311000,0,7311000,7311000,0,5,24,'',0,18750,0,0,35),(223,'20191029-GS-0043','2019-10-28',310,6510000,0,6510000,6510000,0,5,24,'',0,17500,0,0,35),(224,'20191029-GS-0044','2019-10-28',44,5061000,0,4539000,4539000,0,5,24,'',29,18000,522000,0,35),(225,'20191029-GS-0045','2019-10-28',158,9476000,0,9278000,9278000,0,5,24,'',11,18000,198000,0,35),(226,'20191029-GS-0046','2019-10-28',134,221000,0,221000,221000,0,5,26,'',0,18417,0,0,35),(228,'20191030-GS-0001','2019-10-29',128,0,0,0,0,0,5,31,'',15,0,0,0,35),(229,'20191030-GS-0002','2019-10-29',319,221000,0,221000,221000,0,5,31,'',0,18417,0,0,35),(230,'20191030-GS-0003','2019-10-29',9,2240000,0,2240000,2240000,0,5,28,'',0,18667,0,0,35),(231,'20191030-GS-0004','2019-10-29',11,3315000,0,3315000,3315000,0,5,28,'',0,18417,0,0,35),(232,'20191030-GS-0005','2019-10-29',23,2170000,0,2170000,2170000,0,5,28,'',0,18083,0,0,35),(233,'20191030-GS-0006','2019-10-29',41,2748000,0,2748000,2748000,0,5,28,'',0,19083,0,0,35),(234,'20191030-GS-0007','2019-10-29',115,2290000,0,2290000,2290000,0,5,28,'',0,19083,0,0,35),(235,'20191030-GS-0008','2019-10-29',84,2061000,0,2061000,2061000,0,5,28,'',0,19083,0,0,35),(236,'20191030-GS-0009','2019-10-29',34,2748000,0,2748000,2748000,0,5,28,'',0,19083,0,0,35),(237,'20191030-GS-0010','2019-10-29',104,1374000,0,1374000,1374000,0,5,28,'',0,19083,0,0,35),(238,'20191030-GS-0011','2019-10-29',183,687000,0,687000,687000,0,5,28,'',0,19083,0,0,35),(239,'20191030-GS-0012','2019-10-29',28,5424000,0,5424000,5424000,0,5,28,'',0,18833,0,0,35),(240,'20191030-GS-0013','2019-10-29',42,2519000,0,2519000,2519000,0,5,28,'',0,19083,0,4580000,35),(241,'20191030-GS-0014','2019-10-29',215,916000,0,916000,916000,0,5,28,'',0,19083,0,1145000,35),(242,'20191030-GS-0015','2019-10-29',168,1603000,0,1603000,1603000,0,5,28,'',0,19083,0,0,35),(243,'20191030-GS-0016','2019-10-29',103,4122000,0,4122000,3300000,822000,5,28,'',0,19083,0,0,35),(244,'20191030-GS-0017','2019-10-29',15,1603000,0,1603000,1603000,0,5,28,'',0,19083,0,0,35),(245,'20191030-GS-0018','2019-10-29',21,1519000,0,1519000,1519000,0,5,28,'',0,18083,0,0,35),(246,'20191030-GS-0019','2019-10-29',117,672000,0,672000,672000,0,5,28,'',0,18667,0,0,35),(247,'20191030-GS-0020','2019-10-29',106,11200000,0,11200000,11200000,0,5,28,'',0,18667,0,4480000,35),(248,'20191030-GS-0021','2019-10-29',22,1736000,0,1736000,1736000,0,5,28,'',0,18083,0,0,35),(249,'20191030-GS-0022','2019-10-29',53,2748000,0,2748000,2748000,0,5,28,'',0,19083,0,0,35),(250,'20191030-GS-0023','2019-10-29',133,2240000,0,2240000,2240000,0,5,28,'',0,18667,0,0,35),(251,'20191030-GS-0024','2019-10-29',57,0,0,0,0,0,5,28,'',0,0,0,3436000,35),(252,'20191030-GS-0025','2019-10-29',142,4129000,0,4129000,4129000,0,5,28,'',0,18417,0,0,35),(253,'20191030-GS-0026','2019-10-29',206,1716000,0,1716000,1716000,0,5,29,'',0,19067,0,0,35),(254,'20191030-GS-0027','2019-10-29',222,8446000,0,8446000,8446000,0,5,29,'',0,18000,0,0,35),(255,'20191030-GS-0028','2019-10-29',211,7175000,0,7175000,7175000,0,5,29,'',0,17083,0,0,35),(256,'20191030-GS-0029','2019-10-29',213,5740000,0,5740000,5740000,0,5,29,'',0,17083,0,0,35),(257,'20191030-GS-0030','2019-10-29',224,1296000,0,1296000,1296000,0,5,29,'',0,18000,0,0,35),(258,'20191030-GS-0031','2019-10-29',311,3708000,0,3708000,3708000,0,5,29,'',0,17167,0,0,35),(259,'20191030-GS-0032','2019-10-29',212,2050000,0,2050000,2050000,0,5,29,'',0,17083,0,0,35),(260,'20191030-GS-0033','2019-10-29',202,3090000,0,3090000,3090000,0,5,29,'',0,18000,0,0,35),(261,'20191030-GS-0034','2019-10-29',320,11124000,0,11124000,11124000,0,5,29,'',0,18000,0,0,35),(262,'20191030-GS-0035','2019-10-29',119,23136000,0,23136000,23136000,0,5,27,'',0,18583,0,0,35),(263,'20191030-GS-0036','2019-10-29',120,11960000,0,11960000,11960000,0,5,30,'',0,17333,0,0,35),(264,'20191030-GS-0037','2019-10-29',169,12597000,0,12597000,8362000,4235000,5,30,'',0,18833,0,0,35),(265,'20191030-GS-0038','2019-10-29',182,8330000,0,7854000,7854000,0,5,30,'',28,17000,476000,5858000,35),(266,'20191030-GS-0039','2019-10-29',125,0,0,0,0,0,5,30,'',80,0,0,0,35),(267,'20191031-GS-0001','2019-10-30',319,221000,0,221000,221000,0,5,32,'',0,18417,0,0,35),(268,'20191031-GS-0002','2019-10-30',313,9410000,0,9410000,9410000,0,5,33,'',0,20911,0,5590000,35),(269,'20191031-GS-0003','2019-10-30',16,1603000,0,1603000,1603000,0,9,36,'',0,19083,0,0,35),(270,'20191031-GS-0004','2019-10-30',59,458000,0,458000,458000,0,5,36,'',0,19083,0,0,35),(271,'20191031-GS-0005','2019-10-30',89,1603000,0,1603000,1603000,0,5,36,'',0,19083,0,0,35),(272,'20191031-GS-0006','2019-10-30',60,5700000,0,5700000,0,5700000,5,36,'',0,25333,0,0,35),(273,'20191031-GS-0007','2019-10-30',109,2977000,0,2977000,2977000,0,5,36,'',0,19083,0,0,35),(274,'20191031-GS-0008','2019-10-30',50,1603000,0,1603000,1603000,0,5,36,'',0,19083,0,934000,35),(275,'20191031-GS-0009','2019-10-30',312,18148000,0,18148000,18148000,0,5,36,'',0,18500,0,0,35),(276,'20191031-GS-0010','2019-10-30',29,8214000,0,8214000,8214000,0,5,36,'',0,18500,0,0,35),(277,'20191031-GS-0011','2019-10-30',154,916000,0,916000,916000,0,5,36,'',0,19083,0,0,35),(278,'20191031-GS-0012','2019-10-30',35,11766000,0,11766000,11766000,0,5,36,'',0,18500,0,17316000,35),(279,'20191031-GS-0013','2019-10-30',139,4122000,0,4122000,4122000,0,5,36,'',0,19083,0,0,35),(280,'20191031-GS-0014','2019-10-30',216,687000,0,687000,687000,0,5,36,'',0,19083,0,0,35),(281,'20191031-GS-0015','2019-10-30',97,916000,0,916000,916000,0,5,36,'',0,19083,0,0,35),(282,'20191031-GS-0016','2019-10-30',26,2210000,0,2210000,2210000,0,5,36,'',0,18417,0,0,35),(283,'20191031-GS-0017','2019-10-30',65,1582000,0,1582000,1582000,0,5,35,'',0,18833,0,0,35),(284,'20191031-GS-0018','2019-10-30',96,3842000,0,3842000,3842000,0,5,35,'',0,18833,0,0,35),(285,'20191031-GS-0019','2019-10-30',132,4520000,0,4520000,4520000,0,5,35,'',0,18833,0,0,35),(286,'20191031-GS-0020','2019-10-30',95,4520000,0,4520000,4520000,0,5,35,'',0,18833,0,0,35),(287,'20191031-GS-0021','2019-10-30',113,13260000,0,13260000,13260000,0,5,35,'',0,18417,0,0,35),(288,'20191031-GS-0022','2019-10-30',88,5175000,0,5175000,5175000,0,5,35,'',0,18750,0,0,35),(289,'20191031-GS-0023','2019-10-30',66,1350000,0,1350000,1350000,0,5,35,'',0,18750,0,0,35),(290,'20191031-GS-0024','2019-10-30',147,4050000,0,4050000,4050000,0,5,35,'',0,18750,0,0,35),(291,'20191031-GS-0025','2019-10-30',69,4500000,0,4500000,4500000,0,5,35,'',0,18750,0,0,35),(292,'20191031-GS-0026','2019-10-30',107,2925000,0,2925000,0,2925000,5,35,'',0,18750,0,0,35),(293,'20191031-GS-0027','2019-10-30',310,8398000,0,8398000,8398000,0,5,35,'',0,17500,0,0,35),(294,'20191031-GS-0028','2019-10-30',91,3936000,0,3936000,3936000,0,5,35,'',0,18750,0,0,35),(295,'20191031-GS-0029','2019-10-30',44,2925000,0,2925000,2925000,0,5,35,'',0,18750,0,0,35),(296,'20191031-GS-0030','2019-10-30',17,2250000,0,2250000,2250000,0,5,35,'',0,18750,0,0,35),(297,'20191031-GS-0031','2019-10-30',158,2508000,0,1968000,1968000,0,5,35,'',30,18000,540000,0,35),(298,'20191031-GS-0032','2019-10-30',71,1800000,0,1800000,1800000,0,5,35,'',0,18750,0,0,35),(299,'20191031-GS-0033','2019-10-30',146,4440000,0,4440000,0,4440000,5,34,'',0,18500,0,0,35),(300,'20191031-GS-0034','2019-10-30',232,11810000,0,11810000,8810000,3000000,5,34,'',0,16750,0,0,35),(301,'20191031-GS-0035','2019-10-30',220,5129000,0,5129000,5129000,0,5,34,'',0,18583,0,0,35),(302,'20191031-GS-0036','2019-10-30',135,10750000,0,10750000,10750000,0,5,34,'',0,17917,0,0,35),(303,'20191031-GS-0037','2019-10-30',171,12871000,0,12871000,12871000,0,5,34,'',0,17583,0,0,35),(304,'20191031-GS-0038','2019-10-30',72,888000,0,888000,888000,0,5,34,'',0,18500,0,1800000,35),(305,'20191031-GS-0039','2019-10-30',58,1998000,0,1998000,1998000,0,5,34,'',0,18500,0,0,35),(306,'20191031-GS-0040','2019-10-30',43,29025000,0,29025000,29025000,0,5,34,'',0,17917,0,0,35),(307,'20191102-GS-0001','2019-10-31',204,4532000,0,4532000,4532000,0,5,39,'',0,18000,0,0,35),(308,'20191102-GS-0002','2019-10-31',222,4120000,0,4120000,4120000,0,5,39,'',0,18000,0,0,35),(309,'20191102-GS-0003','2019-10-31',211,4647000,0,4647000,4647000,0,5,39,'',0,17083,0,0,35),(310,'20191102-GS-0004','2019-10-31',311,1648000,0,1648000,1648000,0,5,39,'',0,17167,0,0,35),(311,'20191102-GS-0005','2019-10-31',213,3485000,0,3485000,3485000,0,5,39,'',0,17083,0,0,35),(312,'20191102-GS-0006','2019-10-31',203,16298000,0,16298000,16298000,0,5,39,'',0,18000,0,17280000,35),(313,'20191102-GS-0007','2019-10-31',202,3090000,0,3090000,3090000,0,5,39,'',0,18000,0,0,35),(314,'20191102-GS-0008','2019-10-31',9,2016000,0,2016000,2016000,0,5,38,'',0,18667,0,0,35),(315,'20191102-GS-0009','2019-10-31',11,5858000,0,5748000,5748000,0,5,38,'',6,18333,110000,0,35),(316,'20191102-GS-0010','2019-10-31',133,3136000,0,3136000,3136000,0,5,38,'',0,18667,0,0,35),(317,'20191102-GS-0011','2019-10-31',23,2170000,0,2170000,2170000,0,5,38,'',0,18083,0,0,35),(318,'20191102-GS-0012','2019-10-31',41,2290000,0,2290000,2290000,0,5,38,'',0,19083,0,0,35),(319,'20191102-GS-0013','2019-10-31',115,4122000,0,4122000,4122000,0,5,38,'',0,19083,0,0,35),(320,'20191102-GS-0014','2019-10-31',56,4294000,0,4294000,4294000,0,5,38,'',0,19083,0,0,35),(321,'20191102-GS-0015','2019-10-31',84,2691000,0,2691000,2691000,0,5,38,'',0,19083,0,0,35),(322,'20191102-GS-0016','2019-10-31',52,1808000,0,1808000,0,1808000,5,38,'',0,18833,0,0,35),(323,'20191102-GS-0017','2019-10-31',42,2290000,0,2290000,2290000,0,5,38,'',0,19083,0,0,35),(324,'20191102-GS-0018','2019-10-31',75,4972000,0,4972000,4972000,0,5,38,'',0,18833,0,0,35),(325,'20191102-GS-0019','2019-10-31',111,1145000,0,1145000,1145000,0,5,38,'',0,19083,0,0,35),(326,'20191102-GS-0020','2019-10-31',47,1344000,0,1344000,1344000,0,5,38,'',0,18667,0,0,35),(327,'20191102-GS-0021','2019-10-31',28,4068000,0,4068000,4068000,0,5,38,'',0,18833,0,0,35),(328,'20191102-GS-0022','2019-10-31',168,1374000,0,1374000,1374000,0,5,38,'',0,19083,0,0,35),(329,'20191102-GS-0023','2019-10-31',103,1374000,0,1374000,1374000,0,5,38,'',0,19083,0,2883000,35),(330,'20191102-GS-0024','2019-10-31',21,1302000,0,1302000,1302000,0,5,38,'',0,18083,0,0,35),(331,'20191102-GS-0025','2019-10-31',106,12992000,0,12922000,12922000,0,5,38,'',4,17500,70000,0,35),(332,'20191102-GS-0026','2019-10-31',49,3255000,0,3255000,3255000,0,5,38,'',0,18083,0,0,35),(333,'20191102-GS-0027','2019-10-31',22,1519000,0,1519000,1519000,0,5,38,'',0,18083,0,0,35),(334,'20191102-GS-0028','2019-10-31',53,2519000,0,2519000,2519000,0,5,38,'',0,19083,0,0,35),(335,'20191102-GS-0029','2019-10-31',18,2519000,0,2519000,2519000,0,5,38,'',0,19083,0,0,35),(342,'20191102-GS-0036','2019-10-31',119,32334000,0,32334000,32334000,0,5,40,'',0,18583,0,0,35),(337,'20191102-GS-0031','2019-10-31',142,4873000,0,4803000,4803000,0,5,38,'',4,17500,70000,0,35),(338,'20191102-GS-0032','2019-10-31',158,4460000,0,4460000,4460000,0,5,40,'',0,18583,0,0,35),(339,'20191102-GS-0033','2019-10-31',225,2899000,0,2899000,2899000,0,5,40,'',0,18583,0,0,35),(340,'20191102-GS-0034','2019-10-31',125,0,0,0,0,0,5,40,'',72,0,0,0,35),(341,'20191102-GS-0035','2019-10-31',179,3390000,0,3390000,3390000,0,5,40,'',0,18833,0,0,35),(343,'20191126-GS-0001','2019-11-25',128,0,0,0,0,0,5,44,'',10,0,0,0,35),(344,'20191126-GS-0002','2019-11-25',42,2320000,0,2320000,2320000,0,5,41,'',0,19333,0,0,35),(345,'20191126-GS-0003','2019-11-25',28,3435000,0,3435000,3435000,0,5,41,'',0,19083,0,0,35),(346,'20191126-GS-0004','2019-11-25',145,654000,0,654000,654000,0,5,41,'',0,18167,0,1308000,35),(347,'20191126-GS-0005','2019-11-25',43,17440000,0,17440000,17440000,0,5,41,'',0,18167,0,0,35),(348,'20191126-GS-0006','2019-11-25',58,1800000,0,1800000,1800000,0,5,41,'',0,18750,0,0,35),(349,'20191126-GS-0007','2019-11-25',135,12644000,0,12644000,12644000,0,5,41,'',0,18167,0,0,35),(350,'20191126-GS-0008','2019-11-25',171,9630000,0,9630000,9630000,0,5,41,'',0,17833,0,0,35),(351,'20191126-GS-0009','2019-11-25',161,5538000,0,5538000,5538000,0,5,41,'',0,17750,0,0,35),(352,'20191126-GS-0010','2019-11-25',162,1491000,0,1491000,1491000,0,5,41,'',0,17750,0,0,35),(353,'20191126-GS-0011','2019-11-25',146,4500000,0,4500000,4500000,0,5,41,'',0,18750,0,0,35),(354,'20191126-GS-0012','2019-11-25',55,1145000,0,1145000,1145000,0,5,41,'',0,19083,0,0,35),(355,'20191126-GS-0013','2019-11-25',16,464000,0,464000,464000,0,5,43,'',0,19333,0,0,35),(356,'20191126-GS-0014','2019-11-25',109,2320000,0,2320000,2320000,0,5,43,'',0,19333,0,0,35),(357,'20191126-GS-0015','2019-11-25',83,1624000,0,1624000,1624000,0,5,43,'',0,19333,0,0,35),(358,'20191126-GS-0016','2019-11-25',59,1624000,0,1624000,1624000,0,5,43,'',0,19333,0,0,35),(359,'20191126-GS-0017','2019-11-25',98,1856000,0,1856000,1856000,0,5,43,'',0,19333,0,0,35),(360,'20191126-GS-0018','2019-11-25',46,4580000,0,4580000,4580000,0,5,43,'',0,19083,0,0,35),(361,'20191126-GS-0019','2019-11-25',97,1392000,0,1392000,1392000,0,5,43,'',0,19333,0,500000,35),(362,'20191126-GS-0020','2019-11-25',178,696000,0,696000,696000,0,5,43,'',0,19333,0,0,35),(363,'20191126-GS-0021','2019-11-25',35,10125000,0,10125000,10125000,0,5,43,'',0,18750,0,0,35),(364,'20191126-GS-0022','2019-11-25',312,4500000,0,4500000,4500000,0,5,43,'',0,18750,0,0,35),(365,'20191126-GS-0023','2019-11-25',29,13275000,0,13275000,13275000,0,5,43,'',0,18750,0,0,35),(366,'20191126-GS-0024','2019-11-25',116,928000,0,928000,928000,0,5,43,'',0,19333,0,0,35),(367,'20191126-GS-0025','2019-11-25',37,1278000,0,1278000,1278000,0,5,43,'',0,19333,0,0,35),(368,'20191126-GS-0026','2019-11-25',136,1160000,0,1160000,1160000,0,5,43,'',0,19333,0,0,35),(369,'20191126-GS-0027','2019-11-25',154,696000,0,696000,696000,0,5,43,'',0,19333,0,0,35),(370,'20191126-GS-0028','2019-11-25',139,2552000,0,2552000,2552000,0,5,43,'',0,19333,0,0,35),(371,'20191126-GS-0029','2019-11-25',54,464000,0,464000,464000,0,5,43,'',0,19333,0,4408000,35),(372,'20191126-GS-0030','2019-11-25',164,1392000,0,1392000,1392000,0,5,43,'',0,19333,0,0,35),(373,'20191126-GS-0031','2019-11-25',73,1160000,0,1160000,1160000,0,5,43,'',0,19333,0,0,35),(374,'20191126-GS-0032','2019-11-25',48,696000,0,696000,696000,0,5,43,'',0,19333,0,0,35),(375,'20191126-GS-0033','2019-11-25',26,3920000,0,3596000,3596000,0,5,43,'',18,18000,324000,0,35),(376,'20191126-GS-0034','2019-11-25',50,5104000,0,5104000,5104000,0,5,43,'',0,19333,0,0,35),(377,'20191126-GS-0035','2019-11-25',142,1120000,0,1120000,1120000,0,5,43,'',0,18667,0,0,35),(378,'20191126-GS-0036','2019-11-25',65,2519000,0,2519000,2519000,0,5,42,'',0,19083,0,0,35),(379,'20191126-GS-0037','2019-11-25',96,4351000,0,4351000,4351000,0,5,42,'',0,19083,0,0,35),(380,'20191126-GS-0038','2019-11-25',95,6641000,0,6641000,6641000,0,5,42,'',0,19083,0,0,35),(381,'20191126-GS-0039','2019-11-25',113,8960000,0,8960000,8960000,0,5,42,'',0,18667,0,0,35),(382,'20191126-GS-0040','2019-11-25',88,6840000,0,6840000,6840000,0,5,42,'',0,19000,0,0,35),(383,'20191126-GS-0041','2019-11-25',66,2280000,0,2280000,2280000,0,5,42,'',0,19000,0,0,35),(384,'20191126-GS-0042','2019-11-25',69,3420000,0,3420000,3420000,0,5,42,'',0,19000,0,0,35),(385,'20191126-GS-0043','2019-11-25',107,5016000,0,5016000,0,5016000,5,42,'',0,19000,0,0,35),(386,'20191126-GS-0044','2019-11-25',310,7668000,0,7668000,7668000,0,5,42,'',0,17750,0,0,35),(387,'20191126-GS-0045','2019-11-25',91,2280000,0,2280000,2280000,0,5,42,'',0,19000,0,1300000,35),(388,'20191126-GS-0046','2019-11-25',44,2964000,0,2964000,2964000,0,5,42,'',0,19000,0,0,35),(389,'20191126-GS-0047','2019-11-25',158,8698000,0,7888000,7888000,0,5,42,'',45,18000,810000,0,35),(390,'20191126-GS-0048','2019-11-25',129,2290000,0,2290000,2290000,0,5,42,'',0,19083,0,0,35),(391,'20191126-GS-0049','2019-11-25',17,2052000,0,2052000,2052000,0,5,42,'',0,19000,0,0,35);

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
) ENGINE=MyISAM AUTO_INCREMENT=437 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_detail` */

insert  into `gas_wholesale_detail`(`id`,`gas_wholesale_id`,`shell_id`,`quantity`,`price`,`amount`) values (1,1,1,6,216000,1296000),(2,2,1,20,216000,4320000),(3,3,1,70,216000,15120000),(4,4,1,10,216000,2160000),(5,5,1,22,205000,4510000),(6,6,1,55,205000,11275000),(7,7,1,16,229000,3664000),(8,8,1,10,224000,2240000),(9,9,1,22,221000,4862000),(10,10,1,10,217000,2170000),(11,11,1,16,229000,3664000),(12,11,4,1,859000,859000),(13,12,1,9,217000,1953000),(14,13,1,18,229000,4122000),(15,13,4,2,859000,1718000),(16,14,1,22,229000,5038000),(17,15,1,10,229000,2290000),(18,15,4,1,859000,859000),(19,16,1,22,229000,5038000),(20,17,1,14,229000,3206000),(21,18,1,7,226000,1582000),(22,19,1,5,229000,1145000),(23,20,1,3,229000,687000),(24,21,1,6,224000,1344000),(25,22,1,15,226000,3390000),(26,22,4,1,847000,847000),(27,23,1,11,229000,2519000),(28,24,1,5,229000,1145000),(29,25,1,3,224000,672000),(30,26,1,47,224000,10528000),(31,27,1,14,224000,3136000),(32,28,1,8,229000,1832000),(33,29,1,21,221000,4641000),(34,29,4,3,814000,2442000),(35,30,1,2,221000,442000),(36,32,1,7,0,0),(37,32,4,28,0,0),(38,33,1,20,215000,4300000),(39,33,4,2,806000,1612000),(41,35,1,37,201000,7437000),(42,35,4,2,754000,1508000),(43,36,1,25,215000,5375000),(44,37,1,31,211000,6541000),(45,38,1,70,215000,15050000),(46,39,4,2,833000,1666000),(47,40,1,15,222000,3330000),(48,41,1,8,229000,1832000),(49,42,1,6,229000,1374000),(50,43,1,7,229000,1603000),(51,44,1,7,229000,1603000),(52,45,1,15,229000,3435000),(53,46,1,14,229000,3206000),(54,47,1,31,222000,6882000),(55,48,1,28,222000,6216000),(56,49,1,10,229000,2290000),(57,50,1,8,229000,1832000),(58,51,1,6,229000,1374000),(59,52,1,2,229000,458000),(60,53,1,2,229000,458000),(61,54,1,9,229000,2061000),(62,55,1,10,221000,2210000),(63,56,4,4,859000,3436000),(64,57,1,9,226000,2034000),(65,58,1,10,226000,2260000),(66,59,1,23,226000,5198000),(67,60,1,30,221000,6630000),(68,61,1,30,225000,6750000),(69,61,4,1,843000,843000),(70,62,1,6,225000,1350000),(71,63,1,18,225000,4050000),(72,64,1,7,225000,1575000),(73,65,1,15,225000,3375000),(74,65,4,1,843000,843000),(75,66,1,30,210000,6300000),(76,67,1,7,225000,1575000),(77,68,4,1,843000,843000),(78,69,1,20,223000,4460000),(79,70,1,8,226000,1808000),(80,71,1,30,216000,6480000),(81,72,1,14,205000,2870000),(82,73,1,9,205000,1845000),(83,74,1,27,216000,5832000),(84,75,1,30,205000,6150000),(85,76,1,10,224000,2240000),(86,77,1,18,221000,3978000),(87,77,4,3,829000,2487000),(88,78,1,6,229000,1374000),(89,79,1,3,217000,651000),(90,80,1,13,229000,2977000),(91,81,1,12,229000,2748000),(92,82,1,8,229000,1832000),(93,83,1,13,229000,2977000),(94,84,1,14,226000,3164000),(95,84,4,1,847000,847000),(96,85,1,3,224000,672000),(97,87,1,21,226000,4746000),(98,88,1,7,229000,1603000),(99,89,1,6,229000,1374000),(100,90,1,7,229000,1603000),(101,91,1,8,217000,1736000),(102,92,1,9,229000,2061000),(103,93,1,3,224000,672000),(104,94,1,42,224000,9408000),(105,95,1,4,217000,868000),(106,96,1,14,221000,3094000),(107,97,1,2,229000,458000),(108,98,4,6,941000,5646000),(109,99,1,40,223000,8920000),(110,99,4,2,836000,1672000),(111,100,4,30,0,0),(112,101,1,13,226000,2938000),(113,102,1,35,211000,7385000),(114,103,1,30,210000,6300000),(115,104,1,6,215000,1290000),(116,105,1,80,215000,17200000),(117,106,1,4,222000,888000),(118,107,1,30,215000,6450000),(119,108,1,7,210000,1470000),(120,109,1,5,229000,1145000),(121,110,1,6,229000,1374000),(122,111,1,9,229000,2061000),(123,112,1,9,229000,2061000),(124,113,1,5,229000,1145000),(125,114,1,6,229000,1374000),(126,115,1,5,229000,1145000),(127,116,1,21,229000,4809000),(128,116,4,1,843000,843000),(129,117,1,15,226000,3390000),(130,118,1,10,229000,2290000),(131,119,1,75,222000,16650000),(132,120,1,20,222000,4440000),(133,121,1,26,222000,5772000),(134,122,1,4,229000,916000),(135,123,1,8,229000,1832000),(136,124,1,5,229000,1145000),(137,125,1,5,229000,1145000),(138,126,1,10,229000,2290000),(139,127,1,7,229000,1603000),(140,128,1,12,229000,2748000),(141,129,1,4,229000,916000),(142,130,1,3,229000,687000),(143,131,1,5,229000,1145000),(144,132,1,10,221000,2210000),(145,133,1,5,229000,1145000),(146,134,1,7,226000,1582000),(147,134,4,1,847000,847000),(148,135,1,13,226000,2938000),(149,136,1,17,226000,3842000),(150,137,1,6,225000,1350000),(151,138,1,67,221000,14807000),(152,138,4,1,828000,828000),(153,139,1,15,225000,3375000),(154,140,1,8,225000,1800000),(155,141,1,7,225000,1575000),(156,142,1,10,225000,2250000),(157,143,1,8,225000,1800000),(158,143,4,1,843000,843000),(159,144,1,40,210000,8400000),(160,145,1,16,225000,3600000),(161,146,1,15,223000,3345000),(162,146,4,4,836000,3344000),(163,147,1,3,225000,675000),(164,148,1,4,226000,904000),(165,150,4,10,941000,9410000),(252,227,1,1,221000,221000),(167,152,1,9,216000,1944000),(168,153,1,20,216000,4320000),(169,154,1,30,205000,6150000),(170,155,1,6,216000,1296000),(171,155,4,1,810000,810000),(172,156,1,24,206000,4944000),(173,157,1,15,205000,3075000),(174,158,1,10,224000,2240000),(175,159,1,14,221000,3094000),(176,160,1,8,217000,1736000),(177,161,1,5,229000,1145000),(178,162,1,17,229000,3893000),(179,163,1,10,229000,2290000),(180,164,1,9,229000,2061000),(256,229,1,1,221000,221000),(255,228,4,4,0,0),(183,166,1,3,226000,678000),(184,167,1,15,229000,3435000),(185,168,1,4,229000,916000),(186,169,1,4,224000,896000),(187,170,1,25,226000,5650000),(188,171,1,20,229000,4580000),(189,172,1,7,229000,1603000),(190,173,1,5,229000,1145000),(191,174,1,3,229000,687000),(192,174,4,1,859000,859000),(193,175,1,5,217000,1085000),(194,176,1,66,224000,14784000),(195,177,1,8,229000,1832000),(196,178,1,16,229000,3664000),(197,179,1,2,221000,442000),(198,180,1,15,221000,3315000),(199,181,1,5,222000,1110000),(200,182,1,10,219000,2190000),(201,183,1,50,215000,10750000),(202,184,1,51,211000,10761000),(203,185,1,9,215000,1935000),(204,186,1,4,210000,840000),(205,187,1,30,210000,6300000),(206,187,4,5,788000,3940000),(207,188,1,80,215000,17200000),(208,189,1,10,222000,2220000),(209,190,1,20,226000,4520000),(210,191,1,5,229000,1145000),(211,192,1,5,229000,1145000),(212,193,1,17,229000,3893000),(213,194,1,5,229000,1145000),(214,195,1,5,229000,1145000),(215,196,1,12,229000,2748000),(216,197,1,9,229000,2061000),(217,198,1,7,229000,1603000),(218,199,1,8,229000,1832000),(219,200,1,6,229000,1374000),(220,200,4,1,858000,858000),(221,201,1,19,226000,4294000),(222,202,1,23,229000,5267000),(223,202,4,1,843000,843000),(224,203,1,51,222000,11322000),(225,204,1,20,222000,4440000),(226,205,1,38,222000,8436000),(227,206,1,5,229000,1145000),(228,207,1,4,229000,916000),(229,208,1,5,229000,1145000),(230,209,1,5,229000,1145000),(231,210,1,3,229000,687000),(232,211,1,3,229000,687000),(233,212,1,8,229000,1832000),(234,213,1,10,221000,2210000),(235,213,4,1,828000,828000),(236,214,1,8,226000,1808000),(237,215,1,9,226000,2034000),(238,216,1,10,226000,2260000),(239,217,1,30,226000,6780000),(240,218,1,30,221000,6630000),(241,219,1,12,225000,2700000),(242,220,1,10,225000,2250000),(243,221,1,50,225000,11250000),(244,222,1,25,225000,5625000),(245,222,4,2,843000,1686000),(246,223,1,31,210000,6510000),(247,224,1,15,225000,3375000),(248,224,4,2,843000,1686000),(249,225,1,20,223000,4460000),(250,225,4,6,836000,5016000),(251,226,1,1,221000,221000),(253,165,1,7,229000,1603000),(254,165,4,1,859000,859000),(257,230,1,10,224000,2240000),(258,231,1,15,221000,3315000),(259,232,1,10,217000,2170000),(260,233,1,12,229000,2748000),(261,234,1,10,229000,2290000),(262,235,1,9,229000,2061000),(263,236,1,12,229000,2748000),(264,237,1,6,229000,1374000),(265,238,1,3,229000,687000),(266,239,1,24,226000,5424000),(267,240,1,11,229000,2519000),(268,241,1,4,229000,916000),(269,242,1,7,229000,1603000),(270,243,1,18,229000,4122000),(271,244,1,7,229000,1603000),(272,245,1,7,217000,1519000),(273,246,1,3,224000,672000),(274,247,1,50,224000,11200000),(275,248,1,8,217000,1736000),(276,249,1,12,229000,2748000),(277,250,1,10,224000,2240000),(278,252,1,15,221000,3315000),(279,252,4,1,814000,814000),(280,253,4,2,858000,1716000),(281,254,1,41,216000,8856000),(282,255,1,35,205000,7175000),(283,256,1,28,205000,5740000),(284,257,1,6,216000,1296000),(285,258,1,18,206000,3708000),(286,259,1,10,205000,2050000),(287,260,1,15,216000,3240000),(288,261,1,54,216000,11664000),(289,262,1,100,223000,22300000),(290,262,4,1,836000,836000),(291,263,1,50,208000,10400000),(292,263,4,2,780000,1560000),(302,268,4,10,941000,9410000),(301,267,1,1,221000,221000),(295,265,1,20,215000,4300000),(296,265,4,5,806000,4030000),(297,266,1,27,0,0),(298,266,4,23,0,0),(299,264,1,37,226000,8362000),(300,264,4,5,847000,4235000),(303,269,1,7,229000,1603000),(304,270,1,2,229000,458000),(305,271,1,7,229000,1603000),(306,272,4,5,1140000,5700000),(307,273,1,13,229000,2977000),(308,274,1,7,229000,1603000),(309,275,1,78,222000,17316000),(310,275,4,1,832000,832000),(311,276,1,37,222000,8214000),(312,277,1,4,229000,916000),(313,278,1,53,222000,11766000),(314,279,1,18,229000,4122000),(315,280,1,3,229000,687000),(316,281,1,4,229000,916000),(317,282,1,10,221000,2210000),(318,283,1,7,226000,1582000),(319,284,1,17,226000,3842000),(320,285,1,20,226000,4520000),(321,286,1,20,226000,4520000),(322,287,1,60,221000,13260000),(323,288,1,23,225000,5175000),(324,289,1,6,225000,1350000),(325,290,1,18,225000,4050000),(326,291,1,20,225000,4500000),(327,292,1,13,225000,2925000),(328,293,1,25,210000,5250000),(329,293,4,4,787000,3148000),(330,294,1,10,225000,2250000),(331,294,4,2,843000,1686000),(332,295,1,13,225000,2925000),(333,296,1,10,225000,2250000),(334,297,4,3,836000,2508000),(335,298,1,8,225000,1800000),(336,299,1,20,222000,4440000),(337,300,1,40,201000,8040000),(338,300,4,5,754000,3770000),(339,301,1,23,223000,5129000),(340,302,1,50,215000,10750000),(341,303,1,61,211000,12871000),(342,304,1,4,222000,888000),(343,305,1,9,222000,1998000),(344,306,1,135,215000,29025000),(345,307,1,22,216000,4752000),(346,308,1,20,216000,4320000),(347,309,1,23,205000,4715000),(348,310,1,8,206000,1648000),(349,311,1,17,205000,3485000),(350,312,1,83,216000,17928000),(351,313,1,15,216000,3240000),(352,314,1,9,224000,2016000),(353,315,1,4,221000,884000),(354,315,4,6,829000,4974000),(355,316,1,14,224000,3136000),(356,317,1,10,217000,2170000),(357,318,1,10,229000,2290000),(358,319,1,18,229000,4122000),(359,320,1,15,229000,3435000),(360,320,4,1,859000,859000),(361,321,1,8,229000,1832000),(362,321,4,1,859000,859000),(363,322,1,8,226000,1808000),(364,323,1,10,229000,2290000),(365,324,1,22,226000,4972000),(366,325,1,5,229000,1145000),(367,326,1,6,224000,1344000),(368,327,1,18,226000,4068000),(369,328,1,6,229000,1374000),(370,329,1,6,229000,1374000),(371,330,1,6,217000,1302000),(372,331,1,58,224000,12992000),(373,332,1,15,217000,3255000),(374,333,1,7,217000,1519000),(375,334,1,11,229000,2519000),(376,335,1,11,229000,2519000),(384,342,1,130,223000,28990000),(378,337,1,11,221000,2431000),(379,337,4,3,814000,2442000),(380,338,1,20,223000,4460000),(381,339,1,13,223000,2899000),(382,340,4,26,0,0),(383,341,1,15,226000,3390000),(385,342,4,4,836000,3344000),(386,343,4,2,0,0),(387,344,1,10,232000,2320000),(388,345,1,15,229000,3435000),(389,346,1,3,218000,654000),(390,347,1,80,218000,17440000),(391,348,1,8,225000,1800000),(392,349,1,58,218000,12644000),(393,350,1,45,214000,9630000),(394,351,1,26,213000,5538000),(395,352,1,7,213000,1491000),(396,353,1,20,225000,4500000),(397,354,1,5,229000,1145000),(398,355,1,2,232000,464000),(399,356,1,10,232000,2320000),(400,357,1,7,232000,1624000),(401,358,1,7,232000,1624000),(402,359,1,8,232000,1856000),(403,360,1,20,229000,4580000),(404,361,1,6,232000,1392000),(405,362,1,3,232000,696000),(406,363,1,45,225000,10125000),(407,364,1,20,225000,4500000),(408,365,1,59,225000,13275000),(409,366,1,4,232000,928000),(410,367,1,6,232000,1392000),(411,368,1,5,232000,1160000),(412,369,1,3,232000,696000),(413,370,1,11,232000,2552000),(414,371,1,2,232000,464000),(415,372,1,6,232000,1392000),(416,373,1,5,232000,1160000),(417,374,1,3,232000,696000),(418,375,1,10,224000,2240000),(419,375,4,2,840000,1680000),(420,376,1,22,232000,5104000),(421,377,1,5,224000,1120000),(422,378,1,11,229000,2519000),(423,379,1,19,229000,4351000),(424,380,1,29,229000,6641000),(425,381,1,40,224000,8960000),(426,382,1,30,228000,6840000),(427,383,1,10,228000,2280000),(428,384,1,15,228000,3420000),(429,385,1,22,228000,5016000),(430,386,1,36,213000,7668000),(431,387,1,10,228000,2280000),(432,388,1,13,228000,2964000),(433,389,1,16,226000,3616000),(434,389,4,6,847000,5082000),(435,390,1,10,229000,2290000),(436,391,1,9,228000,2052000);

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

insert  into `gas_wholesale_fee`(`id`,`name`,`kind`,`status`) values (1,'Hỗ trợ',-1,1),(2,'Chiết Khấu',-1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_fee_detail` */

insert  into `gas_wholesale_fee_detail`(`id`,`gas_wholesale_id`,`fee_id`,`kind`,`amount`,`note`) values (1,1,1,-1,60000,''),(2,2,1,-1,200000,''),(3,3,1,-1,700000,''),(4,33,2,-1,54000,''),(5,39,2,-1,90000,''),(7,71,1,-1,300000,''),(8,74,1,-1,270000,''),(9,75,1,-1,170000,''),(10,152,1,-1,90000,''),(11,153,1,-1,200000,''),(12,154,1,-1,102000,''),(13,254,1,-1,410000,''),(14,260,1,-1,150000,''),(15,261,1,-1,540000,''),(16,307,1,-1,220000,''),(17,308,1,-1,200000,''),(18,309,1,-1,68000,''),(19,312,1,-1,1630000,''),(20,313,1,-1,150000,''),(21,367,1,-1,114000,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_return_shell` */

insert  into `gas_wholesale_return_shell`(`id`,`gas_wholesale_id`,`shell_id`,`quantity`) values (1,1,1,6),(2,2,1,19),(3,2,36,1),(4,3,1,63),(5,3,31,5),(6,3,37,1),(7,3,43,1),(8,4,1,9),(9,4,28,1),(10,5,1,20),(11,5,43,2),(12,6,1,54),(13,6,36,1),(14,7,1,16),(15,8,1,10),(16,9,1,21),(17,9,22,1),(18,10,1,10),(19,11,1,15),(20,11,2,1),(21,11,12,1),(22,12,1,9),(23,13,1,18),(24,13,2,2),(25,14,1,22),(26,15,1,10),(27,15,2,1),(28,16,1,22),(29,17,1,14),(30,18,1,6),(31,18,38,1),(32,19,1,5),(33,20,1,3),(34,21,1,6),(35,22,1,15),(36,22,2,1),(37,23,1,11),(38,24,1,5),(39,25,1,2),(40,25,36,1),(41,26,1,67),(42,27,1,14),(43,28,1,6),(44,28,15,2),(45,29,1,19),(46,29,2,3),(47,29,38,2),(48,30,1,1),(49,30,38,1),(50,31,2,3),(51,32,1,7),(52,32,2,33),(53,33,1,15),(54,33,42,4),(55,33,39,1),(56,33,2,1),(58,35,1,31),(59,35,2,2),(60,35,15,2),(61,35,28,4),(62,36,1,25),(63,37,1,28),(64,37,42,3),(65,38,1,56),(66,39,2,2),(67,40,1,14),(68,40,18,1),(69,41,1,8),(70,42,1,6),(71,43,1,7),(72,44,1,7),(73,45,1,15),(74,46,1,13),(75,46,39,1),(76,46,2,4),(77,47,1,30),(78,47,39,1),(79,48,1,25),(80,48,38,3),(81,49,1,9),(82,49,36,1),(83,50,1,8),(84,51,1,6),(85,52,1,2),(86,53,1,2),(87,54,1,12),(88,55,1,10),(89,56,2,4),(90,57,1,9),(91,58,1,10),(92,59,1,23),(93,60,1,30),(94,61,1,27),(95,61,36,3),(96,61,2,1),(97,62,1,6),(98,63,1,18),(99,64,1,6),(100,64,34,1),(101,65,1,15),(102,65,2,1),(103,66,1,28),(104,66,42,2),(105,67,1,7),(106,69,1,18),(107,69,31,2),(108,69,2,2),(109,70,1,7),(110,70,19,1),(111,71,1,25),(112,71,31,5),(113,72,1,13),(114,72,12,1),(115,73,1,9),(116,74,1,26),(117,74,37,1),(118,75,1,25),(119,75,19,5),(120,76,1,10),(121,77,1,18),(122,77,2,3),(123,78,1,6),(124,79,1,3),(125,80,1,13),(126,81,1,12),(127,82,1,8),(128,82,2,2),(129,83,1,13),(130,84,1,11),(131,84,42,2),(132,84,2,1),(133,84,28,1),(134,85,1,3),(135,87,1,18),(136,87,38,3),(137,88,1,7),(138,89,1,5),(139,89,45,1),(140,90,1,7),(141,91,1,8),(142,92,1,9),(143,93,1,3),(144,94,1,42),(145,95,1,4),(146,96,1,14),(147,97,1,2),(148,98,2,1),(149,99,1,40),(150,99,2,2),(151,100,1,8),(152,100,2,17),(153,101,1,12),(154,101,37,1),(155,102,1,31),(156,102,36,4),(157,103,1,26),(158,103,36,4),(159,104,1,6),(160,105,1,62),(161,106,1,4),(162,107,1,29),(163,107,11,1),(164,108,1,7),(165,109,1,5),(166,110,1,6),(167,111,1,9),(168,112,1,8),(169,112,20,1),(170,113,1,4),(171,113,24,1),(172,114,1,6),(173,115,1,5),(174,116,1,21),(175,116,2,1),(176,117,1,15),(177,118,1,10),(178,119,1,68),(179,119,38,7),(180,120,1,15),(181,120,28,5),(182,121,1,24),(183,121,36,2),(184,122,1,4),(185,123,1,7),(186,123,28,1),(187,124,1,5),(188,125,1,5),(189,126,1,7),(190,126,38,3),(191,127,1,7),(192,128,1,12),(193,129,1,4),(194,130,1,3),(195,131,1,3),(196,131,31,2),(197,132,1,10),(198,133,1,4),(199,133,19,1),(200,134,1,5),(201,134,34,2),(202,134,2,1),(203,135,1,13),(204,136,1,16),(205,136,38,1),(206,137,1,6),(207,138,1,66),(208,138,38,1),(209,139,1,15),(210,140,1,8),(211,141,1,5),(212,141,36,2),(213,142,1,10),(214,143,1,8),(215,143,2,1),(216,144,1,24),(217,144,12,14),(218,144,42,2),(219,145,1,16),(220,145,2,1),(221,146,1,15),(222,147,1,3),(223,148,1,3),(224,148,38,1),(225,149,1,1),(226,149,38,1),(227,150,2,14),(339,227,1,1),(229,152,1,9),(230,153,1,19),(231,153,12,1),(232,154,1,28),(233,154,19,2),(234,155,1,6),(235,155,2,1),(236,156,1,21),(237,156,36,2),(238,156,38,1),(239,157,1,15),(240,158,1,10),(241,159,1,14),(242,160,1,8),(243,161,1,5),(244,162,1,17),(245,163,1,9),(246,163,18,1),(247,164,1,9),(341,228,2,4),(249,166,1,3),(250,167,1,15),(251,168,1,4),(252,169,1,4),(253,170,1,22),(254,170,38,3),(255,171,1,20),(256,172,1,7),(257,173,1,4),(258,173,20,1),(259,174,1,3),(260,174,2,1),(261,175,1,5),(262,176,1,46),(263,177,1,7),(526,344,1,9),(265,178,1,16),(266,179,1,2),(267,180,1,15),(268,181,1,4),(269,181,18,1),(270,182,1,10),(271,183,1,49),(272,183,45,1),(273,184,1,44),(274,184,12,7),(275,185,1,9),(276,186,1,4),(277,187,1,26),(278,187,28,4),(279,188,1,103),(280,189,1,7),(281,189,15,3),(282,190,1,20),(283,191,1,5),(284,192,1,5),(285,193,1,17),(286,194,1,5),(287,195,1,5),(288,196,1,12),(289,197,1,9),(290,198,1,6),(291,198,42,1),(292,199,1,7),(293,199,42,1),(294,200,1,5),(295,200,42,1),(296,200,2,1),(297,201,1,19),(298,202,1,23),(299,202,2,1),(300,203,1,50),(301,203,31,1),(302,204,1,11),(303,204,36,9),(304,205,1,34),(305,205,28,4),(306,206,1,5),(307,207,1,4),(308,208,1,5),(309,209,1,5),(310,210,1,3),(311,211,1,3),(312,212,1,7),(313,212,19,1),(314,213,1,8),(315,213,19,2),(316,213,2,1),(317,214,1,8),(318,215,1,8),(319,215,36,1),(320,216,1,10),(321,217,1,29),(322,217,36,1),(323,218,1,30),(324,219,1,12),(325,220,1,8),(326,220,19,2),(327,221,1,48),(328,221,34,2),(329,222,1,24),(330,222,36,1),(331,222,2,2),(332,223,1,30),(333,223,39,1),(334,224,1,15),(335,224,2,3),(336,225,1,20),(337,225,2,8),(338,226,1,1),(340,165,1,7),(342,229,1,1),(343,230,1,10),(344,231,1,14),(345,231,42,1),(346,232,1,10),(347,233,1,12),(348,234,1,10),(349,235,1,8),(350,235,24,1),(351,236,1,12),(352,237,1,6),(353,238,1,2),(354,238,24,1),(355,239,1,22),(356,239,42,2),(357,240,1,11),(358,241,1,2),(359,241,12,2),(360,242,1,7),(361,243,1,18),(362,244,1,7),(363,245,1,7),(364,246,1,3),(365,247,1,70),(366,248,1,8),(367,249,1,11),(368,249,38,1),(369,250,1,10),(370,252,1,15),(371,252,2,1),(372,254,1,33),(373,254,18,8),(374,255,1,31),(375,255,36,2),(376,255,38,2),(377,256,1,23),(378,256,36,5),(379,257,1,6),(380,258,1,6),(381,258,12,12),(382,259,1,10),(383,260,1,14),(384,260,39,1),(385,261,1,1),(386,261,31,10),(387,261,19,21),(388,261,39,2),(389,262,1,100),(390,262,2,1),(391,263,1,50),(392,263,2,2),(393,264,1,37),(394,264,2,2),(395,265,1,16),(396,265,12,4),(397,265,2,5),(398,266,1,19),(399,266,2,35),(400,267,1,1),(401,268,2,10),(402,269,1,7),(403,270,1,2),(404,271,1,7),(405,272,2,5),(406,273,1,13),(407,274,1,7),(408,275,1,45),(409,275,36,27),(410,275,28,5),(411,275,15,1),(412,275,2,1),(413,276,1,33),(414,276,12,4),(415,277,1,4),(416,278,1,51),(417,278,12,2),(418,279,1,18),(419,280,1,3),(420,281,1,4),(421,282,1,10),(422,283,1,7),(423,284,1,17),(424,285,1,20),(425,286,1,19),(426,286,12,1),(427,287,1,56),(428,287,42,4),(429,288,1,23),(430,289,1,6),(431,290,1,18),(432,291,1,20),(433,292,1,11),(434,292,14,2),(435,293,1,19),(436,293,12,6),(437,293,2,2),(438,294,1,8),(439,294,24,1),(440,294,19,1),(441,294,2,3),(442,295,1,13),(443,296,1,10),(444,297,2,3),(445,298,1,7),(446,298,18,1),(447,299,1,20),(448,300,1,33),(449,300,34,3),(450,300,37,2),(451,300,38,2),(452,300,2,5),(453,301,1,21),(454,301,33,1),(455,301,39,1),(456,302,1,50),(457,303,1,56),(458,303,42,5),(459,304,1,4),(460,305,1,8),(461,305,42,1),(462,306,1,63),(463,274,2,2),(464,307,1,21),(465,307,12,1),(466,308,1,9),(467,308,31,11),(468,309,1,23),(469,310,1,4),(470,310,12,4),(471,311,1,15),(472,311,14,2),(473,312,1,146),(474,312,19,1),(475,312,36,4),(476,312,37,6),(477,312,38,6),(478,313,1,15),(479,314,1,9),(480,315,1,4),(481,315,2,6),(482,316,1,12),(483,316,18,2),(484,317,1,10),(485,318,1,10),(486,319,1,18),(487,320,1,14),(488,320,18,1),(489,320,2,1),(490,321,1,8),(491,321,2,1),(492,322,1,8),(493,323,1,9),(494,323,18,1),(495,324,1,21),(496,324,20,1),(497,325,1,4),(498,325,24,1),(499,326,1,5),(500,326,31,1),(501,327,1,18),(502,328,9,5),(503,328,31,1),(504,329,1,6),(505,330,1,6),(506,331,1,58),(507,332,1,12),(508,332,11,3),(509,333,1,7),(510,334,1,11),(511,335,1,11),(521,342,1,115),(513,337,1,9),(514,337,15,2),(515,337,2,3),(516,338,1,20),(517,339,1,11),(518,339,19,2),(519,340,2,28),(520,341,1,15),(522,342,28,5),(523,342,31,10),(524,342,2,4),(525,177,24,1),(527,344,36,1),(528,345,1,15),(529,346,1,3),(530,347,1,97),(531,348,1,8),(532,349,1,56),(533,349,12,2),(534,350,1,38),(535,350,42,5),(536,350,37,2),(537,351,1,23),(538,351,15,3),(539,352,1,7),(540,353,1,20),(541,354,1,5),(542,355,1,2),(543,356,1,10),(544,357,1,7),(545,358,1,7),(546,359,1,8),(547,360,1,20),(548,361,1,6),(549,362,1,1),(550,362,19,3),(551,363,1,44),(552,363,28,1),(553,364,1,20),(554,365,1,54),(555,365,28,5),(556,366,1,4),(557,367,1,6),(558,368,1,4),(559,368,31,1),(560,369,1,2),(561,369,36,1),(562,370,1,11),(563,371,1,2),(564,372,1,5),(565,372,36,1),(566,373,1,5),(567,374,1,3),(568,375,1,10),(569,375,2,3),(570,376,1,24),(571,377,1,5),(572,378,1,11),(573,379,1,19),(574,380,1,27),(575,380,38,2),(576,381,1,39),(577,381,36,1),(578,382,1,30),(579,383,1,9),(580,383,34,1),(581,384,1,13),(582,384,34,2),(583,385,1,22),(584,386,1,35),(585,386,19,1),(586,387,1,8),(587,387,19,2),(588,388,1,13),(589,389,1,16),(590,389,2,7),(591,390,1,10),(592,391,1,9);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_in_stock` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `inner_sale` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `inner_sale_detail` */

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `amount` double DEFAULT NULL,
  `amount_paid` double DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invoice` */

insert  into `invoice`(`id`,`created_date`,`code`,`number`,`created_employee_id`,`note`,`amount`,`amount_paid`,`customer_id`) values (2,'2019-11-26','20191126-IN-0001','002',20,'',11400000,0,322);

/*Table structure for table `invoice_detail` */

DROP TABLE IF EXISTS `invoice_detail`;

CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `oil_sale_detail_id` int(11) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `paid` int(1) DEFAULT '0' COMMENT '0:chua thanh toan, 1:da thanh toan',
  `commissioned` int(1) DEFAULT '0' COMMENT '0: chua chiet khau, 1: da chiet khau',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invoice_detail` */

insert  into `invoice_detail`(`id`,`invoice_id`,`oil_sale_detail_id`,`paid_amount`,`paid`,`commissioned`) values (2,2,1,11400000,1,1);

/*Table structure for table `invoice_paid_detail` */

DROP TABLE IF EXISTS `invoice_paid_detail`;

CREATE TABLE `invoice_paid_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invoice_paid_detail` */

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lo_vo` */

insert  into `lo_vo`(`id`,`code`,`created_date`,`quantity`,`note`,`created_employee_id`) values (1,'20191023-LV-0001','2019-10-22',2,'',35),(2,'20191025-LV-0001','2019-10-24',2,'',35),(3,'20191026-LV-0001','2019-10-25',2,'',35),(4,'20191028-LV-0001','2019-10-26',2,'',35),(5,'20191030-LV-0001','2019-10-29',2,'',35),(6,'20191031-LV-0001','2019-10-30',2,'',35);

/*Table structure for table `lo_vo_employee_detail` */

DROP TABLE IF EXISTS `lo_vo_employee_detail`;

CREATE TABLE `lo_vo_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lo_vo_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lo_vo_employee_detail` */

insert  into `lo_vo_employee_detail`(`id`,`lo_vo_id`,`employee_id`,`note`) values (1,1,52,''),(2,1,33,''),(3,1,51,''),(4,1,46,''),(5,1,19,''),(6,1,43,''),(7,1,21,''),(8,1,30,''),(9,2,52,''),(10,2,33,''),(11,2,46,''),(12,2,19,''),(13,2,21,''),(14,2,43,''),(15,2,30,''),(16,3,52,''),(17,3,41,''),(18,3,46,''),(19,3,19,''),(20,3,43,''),(21,3,21,''),(22,4,52,''),(23,4,33,''),(24,4,46,''),(25,4,19,''),(26,4,43,''),(27,4,21,''),(28,4,30,''),(29,4,51,''),(30,5,52,''),(31,5,46,''),(32,5,19,''),(33,5,43,''),(34,5,21,''),(35,5,30,''),(36,6,52,''),(37,6,46,''),(38,6,19,''),(39,6,21,''),(40,6,30,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_import` */

insert  into `lpg_import`(`id`,`code`,`import_date`,`vendor_id`,`kind`,`paper_quantity`,`actual_quantity`,`price`,`vat`,`invoice_amount`,`amount`,`paid`,`debt`,`rate`,`note`,`account_id`,`route_id`,`created_employee_id`,`link_lpg_ids`,`link_lpg_codes`) values (1,'20191024-LI-0001','2019-10-22',16,1,11020,11080,580.0583,0,148683560,148683560,0,148683560,23260,'KDK _ SPO',5,0,35,NULL,''),(2,'20191024-LI-0002','2019-10-23',16,1,11020,10940,580.0583,0,148651599,148651599,0,148651599,23255,'KDK-QT',5,0,35,NULL,''),(3,'20191024-LI-0003','2019-10-23',28,1,1060,1060,10000,0,10600000,10600000,10600000,0,1000,'Mua ngoài',5,0,35,NULL,''),(4,'20191024-LI-0004','2019-10-24',16,1,11020,11070,580.0583,0,148651599,148651599,0,148651599,23255,'KDK-QT',5,0,35,NULL,''),(5,'20191028-LI-0001','2019-10-25',16,1,11030,11060,580.0583,0,148786491,148786491,0,148786491,23255,'KDK - HT',5,18,35,NULL,''),(6,'20191028-LI-0002','2019-10-25',24,1,12070,12120,581.5425,0,163196818,163196818,0,163196818,23250,'VM - QT',5,18,35,NULL,''),(7,'20191028-LI-0003','2019-10-26',16,1,11020,10900,580.0583,0,148651599,148651599,0,148651599,23255,'KDK-QT',5,0,35,NULL,''),(8,'20191030-LI-0001','2019-10-28',16,1,11020,11110,580.0583,0,148651599,148651599,0,148651599,23255,'KDK _ SPO',5,0,35,NULL,''),(9,'20191030-LI-0002','2019-10-29',16,1,11030,11030,580.0583,0,148754501,148754501,0,148754501,23250,'KDK-QT',5,0,35,NULL,''),(10,'20191031-LI-0001','2019-10-30',16,1,11020,11030,580.0583,0,148651599,148651599,0,148651599,23255,'KDK - HT',5,18,35,NULL,''),(11,'20191031-LI-0002','2019-10-30',15,1,11010,11000,583.8525,0,149488164,149488164,0,149488164,23255,'',5,0,35,NULL,''),(12,'20191031-LI-0003','2019-10-31',24,1,10690,10700,581.5425,0,144569110,144569110,0,144569110,23255,'VM - QT',5,0,35,NULL,''),(13,'20191102-LI-0001','2019-11-01',16,1,11020,9200,591.6153,0,151645910,151645910,0,151645910,23260,'KDK - HT',5,0,35,NULL,''),(14,'20191102-LI-0002','2019-11-01',16,1,9520,11330,591.6153,0,130976291,130976291,0,130976291,23255,'KDK-QT',5,0,35,NULL,''),(15,'20191102-LI-0003','2019-11-02',16,1,11020,10980,591.6153,0,151613312,151613312,0,151613312,23255,'KDK-QT',5,0,35,NULL,''),(16,'20191107-LI-0001','2019-11-04',28,1,1100,1100,10000,0,11000000,11000000,11000000,0,1000,'',5,18,35,NULL,''),(17,'20191107-LI-0002','2019-11-04',16,1,11020,11050,591.6153,0,151613312,151613312,0,151613312,23255,'KDK _ SPO',5,0,35,NULL,''),(18,'20191107-LI-0003','2019-11-05',16,1,11030,10990,591.6153,0,151718265,151718265,0,151718265,23250,'KDK-QT',5,0,35,NULL,''),(19,'20191107-LI-0004','2019-11-06',15,1,12010,12040,595.4025,0,166255729,166255729,0,166255729,23250,'TH - QT',5,0,35,NULL,'');

/*Table structure for table `lpg_in_stock` */

DROP TABLE IF EXISTS `lpg_in_stock`;

CREATE TABLE `lpg_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_in_stock` */

insert  into `lpg_in_stock`(`id`,`organization_id`,`vendor_id`,`day`,`in_stock`) values (1,14,15,NULL,0),(2,14,23,NULL,0),(3,14,22,NULL,0),(4,1,24,NULL,0),(5,1,16,NULL,0),(6,1,15,NULL,0),(7,1,21,NULL,0),(8,1,23,NULL,0),(9,1,22,NULL,19389),(10,1,28,NULL,0),(11,14,15,'2019-10-21',0),(12,14,23,'2019-10-21',0),(13,14,22,'2019-10-21',0),(14,1,24,'2019-10-21',0),(15,1,16,'2019-10-21',0),(16,1,15,'2019-10-21',0),(17,1,21,'2019-10-21',0),(18,1,23,'2019-10-21',0),(19,1,22,'2019-10-21',19389),(20,1,28,'2019-10-21',0),(21,14,15,'2019-11-01',0),(22,14,23,'2019-11-01',0),(23,14,22,'2019-11-01',0),(24,1,24,'2019-11-01',0),(25,1,16,'2019-11-01',0),(26,1,15,'2019-11-01',0),(27,1,21,'2019-11-01',0),(28,1,23,'2019-11-01',0),(29,1,22,'2019-11-01',19518),(30,1,28,'2019-11-01',0),(31,14,15,'2019-11-25',0),(32,14,23,'2019-11-25',0),(33,14,22,'2019-11-25',0),(34,1,24,'2019-11-25',0),(35,1,16,'2019-11-25',0),(36,1,15,'2019-11-25',0),(37,1,21,'2019-11-25',0),(38,1,23,'2019-11-25',0),(39,1,22,'2019-11-25',22389),(40,1,28,'2019-11-25',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_sale` */

insert  into `lpg_sale`(`id`,`code`,`sale_date`,`kind`,`customer_id`,`quantity`,`price`,`price_transport`,`vat`,`rate`,`amount`,`paid`,`debt`,`note`,`account_id`,`route_id`,`created_employee_id`) values (1,'20191024-LS-0001','2019-10-22',1,152,11080,14562,0,10,1000,177481656,0,177481656,'',5,0,35),(2,'20191028-LS-0001','2019-10-25',1,124,11060,580.0583,17.5,0,23255,153692174,0,153692174,'HT (An Thuận)',5,0,35),(3,'20191030-LS-0001','2019-10-28',1,152,11110,14562,0,10,1000,177962202,0,177962202,'',5,0,35),(4,'20191031-LS-0001','2019-10-30',1,124,11030,580,18,0,23255,153275287,0,153275287,'',5,0,35),(5,'20191102-LS-0001','2019-11-01',1,124,9200,591.6153,20.5,0,23260,130987777,0,130987777,'Phúc Đạt 2790; Hoàn Thành 6410',5,0,35),(6,'20191107-LS-0001','2019-11-04',1,152,11050,14807,0,10,1000,179979085,0,179979085,'',5,0,35);

/*Table structure for table `money_in_stock` */

DROP TABLE IF EXISTS `money_in_stock`;

CREATE TABLE `money_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL COMMENT '0: tien mat',
  `organization_id` int(11) DEFAULT NULL COMMENT 'neu account_id=0 thi la id cua organization',
  `in_stock` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `money_in_stock` */

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil` */

insert  into `oil`(`id`,`code`,`name`,`vendor_id`,`group_id`,`weight_unit_id`,`weight`,`base_unit_id`,`sale_unit_id`,`employee_commission_id`,`status`,`organization_id`,`price`) values (1,'NW01','NIWA  AUTO 10W-40 4L SJ/CH4',20,1,5,4,4,6,2,1,1,325000),(2,'NW02','NIWA  AUTO 20W-50 4L SJ/CH4',20,1,5,4,4,6,2,1,1,330000),(3,'NW14','NIWA AUTO TURBO DIESEL 20W-50 CF4/SJ - 18L',20,2,5,18,12,12,2,1,1,1430000),(4,'MK LITEL3','LITEL3',26,1,9,1,13,13,2,1,1,43400),(5,'MK VG68','Mê Kông otto VG68',26,1,5,200,14,14,1,1,1,4550000),(6,'NW49','NIWA VG68 - 209L',20,3,5,209,14,14,1,1,1,11690000),(7,'NASCA','Mỡ bò Nasca',27,1,9,1,13,13,2,1,1,0),(8,'NW03','NIWA  OIL 10W-40 4L SL/CI4',20,1,5,4,4,6,2,1,1,350000),(9,'NW04','NIWA  OIL 20W-50 4L SL/CI4',20,1,5,4,4,6,2,1,1,365000),(10,'NW05','NIWA TURBO 10W-40 4L SM/CJ4',20,1,5,4,4,6,2,1,1,385000),(11,'NW06','NIWA TURBO 20W-50 4L SM/CJ4',20,1,5,4,4,6,2,1,1,400000),(12,'NW07','NIWA  AUTO 10W-40 5L SJ/CH4',20,1,5,5,4,6,2,1,1,396000),(13,'NW08','NIWA  AUTO 20W-50 5L SJ/CH4',20,1,5,5,4,6,2,1,1,406000),(14,'NW09','NIWA  OIL 10W-40 5L SL/CI4',20,2,5,5,4,6,2,1,1,427000),(15,'NW10','NIWA  OIL 20W-50 5L SL/CI4',20,1,5,5,4,6,2,1,1,438000),(16,'NW11','NIWA TURBO 10W-40 5L SM/CJ4',20,1,5,5,4,6,2,1,1,469000),(17,'NW12','NIWA TURBO 20W-50 5L SM/CJ4',20,1,5,5,4,6,2,1,1,480000),(18,'NW13','NIWA AUTO TURBO DIESEL 15W-40 - 18L CF4/SJ',20,2,5,18,12,12,2,1,1,1410000),(19,'NW15','NIWA AUTO TURBO DIESEL 15W-40 - 25L CF4/SJ',20,2,5,25,15,15,2,1,1,1936000),(20,'NW16','NIWA AUTO TURBO DIESEL 20W-50 - 25L CF4/SJ',20,2,5,25,15,15,2,1,1,1965000),(21,'NW17','NIWA AUTO TURBO DIESEL 15W-40 - 209L CF4/SJ',20,2,5,209,14,14,1,1,1,14890000),(22,'NW18','NIWA AUTO TURBO DIESEL 20W-50 - 209L CF4/SJ',20,2,5,209,14,14,1,1,1,15100000),(23,'NW19','NIWA AUTO TURBO DIESEL 15W-40 - 18L CH4/SL',20,2,5,18,12,12,2,1,1,1450000),(24,'NW20','NIWA AUTO TURBO DIESEL 20W-50 - 18L CH4/SL',20,2,5,18,12,12,2,1,1,1470000),(25,'NW21','NIWA AUTO TURBO DIESEL 15W-40 - 25L CH4/SL',20,2,5,25,15,15,2,1,1,1990000),(26,'NW22','NIWA AUTO TURBO DIESEL 20W-50 - 25L CH4/SL',20,2,5,25,15,15,2,1,1,2015000),(27,'NW23','NIWA AUTO TURBO DIESEL 15W-40 - 209L CH4/SL',20,2,5,209,14,14,1,1,1,15320000),(28,'NW24','NIWA AUTO TURBO DIESEL 20W-50 - 209L CH4/SL',20,2,5,209,14,14,1,1,1,15550000),(29,'NW25','NIWA AUTO TURBO DIESEL 15W-40 - 18L CI4/SM',20,2,5,18,12,12,2,1,1,1565000),(30,'NW26','NIWA AUTO TURBO DIESEL 20W-50 - 18L CI4/SM',20,2,5,18,12,12,2,1,1,1585000),(31,'NW27','NIWA AUTO TURBO DIESEL 15W-40 - 25L CI4/SM',20,2,5,25,15,15,2,1,1,2145000),(32,'NW28','NIWA AUTO TURBO DIESEL 20W-50 - 25L CI4/SM',20,2,5,25,15,15,2,1,1,2175000),(33,'NW29','NIWA AUTO TURBO DIESEL 15W-40 - 209L CI4/SM',20,2,5,209,14,14,1,1,1,16600000),(34,'NW30','NIWA AUTO TURBO DIESEL 20W-50 - 209L CI4/SM',20,2,5,209,14,14,1,1,1,16810000),(35,'NW31','NIWA TURBO DIESEL 15W-40 - 18L CJ4/SN',20,2,5,18,12,12,2,1,1,1675000),(36,'NW32','NIWA TURBO DIESEL 20W-50 - 18L CJ4/SN',20,2,5,18,12,12,2,1,1,1697000),(37,'NW33','NIWA TURBO DIESEL 15W-40 - 25L CJ4/SN',20,2,5,25,15,15,2,1,1,2305000),(38,'NW34','NIWA TURBO DIESEL 20W-50 - 25L CJ4/SN',20,2,5,25,15,15,2,1,1,2330000),(39,'NW35','NIWA TURBO DIESEL 15W-40 - 209L CJ4/SN',20,2,5,209,14,14,1,1,1,17870000),(40,'NW36','NIWA TURBO DIESEL 20W-50 - 209L CJ4/SN',20,2,5,209,14,14,1,1,1,18070000),(41,'NW48','NIWA VG68 - 18L VG',20,3,5,18,12,12,2,1,1,1130000),(42,'NW54','NIWA AW68 - 18L AW',20,3,5,18,12,12,2,1,1,1360000),(43,'NW55','NIWA AW68 - 209L AW',20,3,5,209,14,14,1,1,1,14250000),(44,'NW59','NIWA GEAR 90 - 4L GL4',20,4,5,4,4,6,2,1,1,335000),(45,'NW60','NIWA GEAR 90 - 18L GL4',20,4,5,18,12,12,2,1,1,1360000),(46,'NW61','NIWA GEAR 90 - 209L GL4',20,4,5,209,14,14,1,1,1,14590000),(47,'NW71','NIWA GEAR 140 - 4L GL5',20,4,5,4,4,6,2,1,1,384000),(48,'NW72','NIWA GEAR 140 - 18L GL5',20,4,5,18,12,12,2,1,1,1580000),(49,'NW73','NIWA GEAR 140 - 209L GL5',20,4,5,209,14,14,1,1,1,17200000),(50,'NW56','NIWA GEAR 90 - 4L GL1',20,5,5,4,4,6,2,1,1,300000),(51,'NW65','NIWA GEAR 140 - 4L GL1',20,5,5,4,4,6,2,1,1,309000),(52,'NW66','NIWA GEAR 140 - 18L GL1',20,5,5,18,12,12,2,1,1,1243000),(53,'NW82','NIWA OIL DIESEL 15W-40 - 18L PT',20,6,5,18,12,12,2,1,1,1208000),(54,'NW83','NIWA OIL DIESEL 15W-40 - 200L PT',20,6,5,200,14,14,1,1,1,12320000),(55,'NW84','NIWA OIL DIESEL 20W-50 - 18L PT CF/SF',20,6,5,18,12,12,2,1,1,1246000),(56,'NW85','NIWA OIL DIESEL 20W-50 - 200L PT',20,6,5,200,14,14,1,1,1,12740000),(57,'NW90','NIWA HG68 - 18L PT HG',20,3,5,18,12,12,2,1,1,1020000),(58,'NW37','NIWA NANO  SJ 0,8L ',20,7,5,0.8,4,11,2,1,1,62000),(59,'NW38','NIWA NANO  SJ 1L ',20,7,5,1,4,11,2,1,1,75000),(60,'NW39','NIWA NANO SL 0,8L ',20,8,5,0.8,4,10,2,1,1,88000),(61,'NW40','NIWA NANO SL 1L ',20,8,5,1,4,10,2,1,1,98000),(62,'NW41','NIWA NANO scooter 0.8L ',20,8,5,0.8,4,10,2,1,1,90000),(63,'NW42','NIWA NANO scooter 1L ',20,8,5,1,4,10,2,1,1,99900),(64,'NWM05','NIWA NANO LIPEX 3 ',20,9,5,18,12,12,2,1,1,1815000),(65,'NWM11','NIWA NANO CALPEX (XĐ)',20,9,5,18,12,12,2,1,1,1494000),(66,'NWM17','NIWA NANO STAR ',20,9,5,18,12,12,2,1,1,1317000),(67,'NW57','NIWA GEAR 90GL1-18L',20,2,12,0,12,12,1,1,1,0),(68,'NW79','NIWA 20W-50 PT CC/SC - 18L',20,2,12,0,12,12,1,1,1,0),(69,'NW92','NIWA NANO Mỡ bôi trơn màu xanh bi trong X',20,2,12,0,12,12,1,1,1,0),(70,'MK CALTOIX','Mỡ bôi trơn MK',26,9,13,0,13,13,1,1,1,0);

/*Table structure for table `oil_export` */

DROP TABLE IF EXISTS `oil_export`;

CREATE TABLE `oil_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oil_sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_export` */

insert  into `oil_export`(`id`,`created_date`,`code`,`oil_sale_id`,`customer_id`,`total`,`note`,`created_employee_id`) values (1,'2019-11-20','20191120-OE-0001',1,230,9405000,'',35),(2,'2019-11-26','20191126-OE-0001',1,322,11400000,'',20),(3,'2019-11-28','20191128-OE-0001',3,286,9352000,'',17);

/*Table structure for table `oil_export_detail` */

DROP TABLE IF EXISTS `oil_export_detail`;

CREATE TABLE `oil_export_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_export_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `oil_sale_detail_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_export_detail` */

insert  into `oil_export_detail`(`id`,`oil_export_id`,`oil_id`,`oil_sale_detail_id`,`quantity`) values (1,1,6,3,1),(2,2,43,1,1),(3,3,6,3,1);

/*Table structure for table `oil_group` */

DROP TABLE IF EXISTS `oil_group`;

CREATE TABLE `oil_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1' COMMENT '0: da bi khoa, 1: dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_group` */

insert  into `oil_group`(`id`,`name`,`note`,`status`) values (1,'NIWA NANO ĐỘNG CƠ CAO CẤP','',1),(2,'AUTO TURBO CAO CẤP','',1),(3,'DẦU THỦY LỰC','',1),(4,'DẦU BÁNH RĂNG','',1),(5,'DẦU BÁNH RĂNG PT','',1),(6,'NIWA OIL','',1),(7,'XE MÁY CHAI NHỰA','',1),(8,'XE MÁY LON THIẾC','',1),(9,'MỠ BÔI TRƠN','',1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_import` */

/*Table structure for table `oil_import_detail` */

DROP TABLE IF EXISTS `oil_import_detail`;

CREATE TABLE `oil_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_import_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `base_quantity` int(3) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_import_detail` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_in_stock` */

insert  into `oil_in_stock`(`id`,`day`,`oil_id`,`organization_id`,`store_id`,`in_stock`) values (1,NULL,4,1,9,0),(2,NULL,5,1,9,0),(3,NULL,7,1,9,0),(4,NULL,1,1,9,0),(5,NULL,12,1,9,0),(6,NULL,2,1,9,0),(7,NULL,13,1,9,0),(8,NULL,8,1,9,0),(9,NULL,14,1,9,0),(10,NULL,9,1,9,0),(11,NULL,15,1,9,0),(12,NULL,68,1,9,0),(13,NULL,18,1,9,0),(14,NULL,23,1,9,0),(15,NULL,29,1,9,0),(16,NULL,21,1,9,0),(17,NULL,27,1,9,0),(18,NULL,33,1,9,0),(19,NULL,19,1,9,0),(20,NULL,25,1,9,0),(21,NULL,31,1,9,0),(22,NULL,24,1,9,0),(23,NULL,30,1,9,0),(24,NULL,22,1,9,0),(25,NULL,28,1,9,0),(26,NULL,34,1,9,0),(27,NULL,20,1,9,0),(28,NULL,26,1,9,0),(29,NULL,32,1,9,0),(30,NULL,3,1,9,0),(31,NULL,42,1,9,0),(32,NULL,43,1,9,0),(33,NULL,52,1,9,0),(34,NULL,48,1,9,0),(35,NULL,49,1,9,0),(36,NULL,51,1,9,0),(37,NULL,47,1,9,0),(38,NULL,45,1,9,0),(39,NULL,46,1,9,0),(40,NULL,50,1,9,0),(41,NULL,44,1,9,0),(42,NULL,67,1,9,0),(43,NULL,57,1,9,0),(44,NULL,58,1,9,0),(45,NULL,59,1,9,0),(46,NULL,65,1,9,0),(47,NULL,64,1,9,0),(48,NULL,69,1,9,0),(49,NULL,62,1,9,0),(50,NULL,63,1,9,0),(51,NULL,60,1,9,0),(52,NULL,61,1,9,0),(53,NULL,66,1,9,0),(54,NULL,53,1,9,0),(55,NULL,54,1,9,0),(56,NULL,55,1,9,0),(57,NULL,56,1,9,0),(58,NULL,10,1,9,0),(59,NULL,16,1,9,0),(60,NULL,11,1,9,0),(61,NULL,17,1,9,0),(62,NULL,35,1,9,0),(63,NULL,39,1,9,0),(64,NULL,37,1,9,0),(65,NULL,36,1,9,0),(66,NULL,40,1,9,0),(67,NULL,38,1,9,0),(68,NULL,41,1,9,0),(69,NULL,6,1,9,0),(70,NULL,4,1,8,0),(71,NULL,5,1,8,0),(72,NULL,7,1,8,0),(73,NULL,1,1,8,0),(74,NULL,12,1,8,0),(75,NULL,2,1,8,0),(76,NULL,13,1,8,0),(77,NULL,8,1,8,0),(78,NULL,14,1,8,0),(79,NULL,9,1,8,0),(80,NULL,15,1,8,0),(81,NULL,68,1,8,0),(82,NULL,18,1,8,0),(83,NULL,23,1,8,0),(84,NULL,29,1,8,0),(85,NULL,21,1,8,0),(86,NULL,27,1,8,0),(87,NULL,33,1,8,0),(88,NULL,19,1,8,0),(89,NULL,25,1,8,0),(90,NULL,31,1,8,0),(91,NULL,24,1,8,0),(92,NULL,30,1,8,0),(93,NULL,22,1,8,0),(94,NULL,28,1,8,0),(95,NULL,34,1,8,0),(96,NULL,20,1,8,0),(97,NULL,26,1,8,0),(98,NULL,32,1,8,0),(99,NULL,3,1,8,0),(100,NULL,42,1,8,0),(101,NULL,43,1,8,0),(102,NULL,52,1,8,0),(103,NULL,48,1,8,0),(104,NULL,49,1,8,0),(105,NULL,51,1,8,0),(106,NULL,47,1,8,0),(107,NULL,45,1,8,0),(108,NULL,46,1,8,0),(109,NULL,50,1,8,0),(110,NULL,44,1,8,0),(111,NULL,67,1,8,0),(112,NULL,57,1,8,0),(113,NULL,58,1,8,0),(114,NULL,59,1,8,0),(115,NULL,65,1,8,0),(116,NULL,64,1,8,0),(117,NULL,69,1,8,0),(118,NULL,62,1,8,0),(119,NULL,63,1,8,0),(120,NULL,60,1,8,0),(121,NULL,61,1,8,0),(122,NULL,66,1,8,0),(123,NULL,53,1,8,0),(124,NULL,54,1,8,0),(125,NULL,55,1,8,0),(126,NULL,56,1,8,0),(127,NULL,10,1,8,0),(128,NULL,16,1,8,0),(129,NULL,11,1,8,0),(130,NULL,17,1,8,0),(131,NULL,35,1,8,0),(132,NULL,39,1,8,0),(133,NULL,37,1,8,0),(134,NULL,36,1,8,0),(135,NULL,40,1,8,0),(136,NULL,38,1,8,0),(137,NULL,41,1,8,0),(138,NULL,6,1,8,0),(139,NULL,4,1,10,0),(140,NULL,5,1,10,0),(141,NULL,7,1,10,0),(142,NULL,1,1,10,0),(143,NULL,12,1,10,0),(144,NULL,2,1,10,0),(145,NULL,13,1,10,0),(146,NULL,8,1,10,0),(147,NULL,14,1,10,0),(148,NULL,9,1,10,0),(149,NULL,15,1,10,0),(150,NULL,68,1,10,0),(151,NULL,18,1,10,0),(152,NULL,23,1,10,0),(153,NULL,29,1,10,0),(154,NULL,21,1,10,0),(155,NULL,27,1,10,0),(156,NULL,33,1,10,0),(157,NULL,19,1,10,0),(158,NULL,25,1,10,0),(159,NULL,31,1,10,0),(160,NULL,24,1,10,0),(161,NULL,30,1,10,0),(162,NULL,22,1,10,0),(163,NULL,28,1,10,0),(164,NULL,34,1,10,0),(165,NULL,20,1,10,0),(166,NULL,26,1,10,0),(167,NULL,32,1,10,0),(168,NULL,3,1,10,0),(169,NULL,42,1,10,0),(170,NULL,43,1,10,0),(171,NULL,52,1,10,0),(172,NULL,48,1,10,0),(173,NULL,49,1,10,0),(174,NULL,51,1,10,0),(175,NULL,47,1,10,0),(176,NULL,45,1,10,0),(177,NULL,46,1,10,0),(178,NULL,50,1,10,0),(179,NULL,44,1,10,0),(180,NULL,67,1,10,0),(181,NULL,57,1,10,0),(182,NULL,58,1,10,0),(183,NULL,59,1,10,0),(184,NULL,65,1,10,0),(185,NULL,64,1,10,0),(186,NULL,69,1,10,0),(187,NULL,62,1,10,0),(188,NULL,63,1,10,0),(189,NULL,60,1,10,0),(190,NULL,61,1,10,0),(191,NULL,66,1,10,0),(192,NULL,53,1,10,0),(193,NULL,54,1,10,0),(194,NULL,55,1,10,0),(195,NULL,56,1,10,0),(196,NULL,10,1,10,0),(197,NULL,16,1,10,0),(198,NULL,11,1,10,0),(199,NULL,17,1,10,0),(200,NULL,35,1,10,0),(201,NULL,39,1,10,0),(202,NULL,37,1,10,0),(203,NULL,36,1,10,0),(204,NULL,40,1,10,0),(205,NULL,38,1,10,0),(206,NULL,41,1,10,0),(207,NULL,6,1,10,0),(208,NULL,4,1,9,0),(209,NULL,5,1,9,0),(210,NULL,7,1,9,0),(211,NULL,1,1,9,0),(212,NULL,12,1,9,0),(213,NULL,2,1,9,0),(214,NULL,13,1,9,0),(215,NULL,8,1,9,0),(216,NULL,14,1,9,0),(217,NULL,9,1,9,0),(218,NULL,15,1,9,0),(219,NULL,68,1,9,0),(220,NULL,18,1,9,0),(221,NULL,23,1,9,0),(222,NULL,29,1,9,0),(223,NULL,21,1,9,0),(224,NULL,27,1,9,0),(225,NULL,33,1,9,0),(226,NULL,19,1,9,0),(227,NULL,25,1,9,0),(228,NULL,31,1,9,0),(229,NULL,24,1,9,0),(230,NULL,30,1,9,0),(231,NULL,22,1,9,0),(232,NULL,28,1,9,0),(233,NULL,34,1,9,0),(234,NULL,20,1,9,0),(235,NULL,26,1,9,0),(236,NULL,32,1,9,0),(237,NULL,3,1,9,0),(238,NULL,42,1,9,0),(239,NULL,43,1,9,0),(240,NULL,52,1,9,0),(241,NULL,48,1,9,0),(242,NULL,49,1,9,0),(243,NULL,51,1,9,0),(244,NULL,47,1,9,0),(245,NULL,45,1,9,0),(246,NULL,46,1,9,0),(247,NULL,50,1,9,0),(248,NULL,44,1,9,0),(249,NULL,67,1,9,0),(250,NULL,57,1,9,0),(251,NULL,58,1,9,0),(252,NULL,59,1,9,0),(253,NULL,65,1,9,0),(254,NULL,64,1,9,0),(255,NULL,69,1,9,0),(256,NULL,62,1,9,0),(257,NULL,63,1,9,0),(258,NULL,60,1,9,0),(259,NULL,61,1,9,0),(260,NULL,66,1,9,0),(261,NULL,53,1,9,0),(262,NULL,54,1,9,0),(263,NULL,55,1,9,0),(264,NULL,56,1,9,0),(265,NULL,10,1,9,0),(266,NULL,16,1,9,0),(267,NULL,11,1,9,0),(268,NULL,17,1,9,0),(269,NULL,35,1,9,0),(270,NULL,39,1,9,0),(271,NULL,37,1,9,0),(272,NULL,36,1,9,0),(273,NULL,40,1,9,0),(274,NULL,38,1,9,0),(275,NULL,41,1,9,0),(276,NULL,6,1,9,0),(277,NULL,4,1,8,0),(278,NULL,5,1,8,0),(279,NULL,7,1,8,0),(280,NULL,1,1,8,0),(281,NULL,12,1,8,0),(282,NULL,2,1,8,0),(283,NULL,13,1,8,0),(284,NULL,8,1,8,0),(285,NULL,14,1,8,0),(286,NULL,9,1,8,0),(287,NULL,15,1,8,0),(288,NULL,68,1,8,0),(289,NULL,18,1,8,0),(290,NULL,23,1,8,0),(291,NULL,29,1,8,0),(292,NULL,21,1,8,0),(293,NULL,27,1,8,0),(294,NULL,33,1,8,0),(295,NULL,19,1,8,0),(296,NULL,25,1,8,0),(297,NULL,31,1,8,0),(298,NULL,24,1,8,0),(299,NULL,30,1,8,0),(300,NULL,22,1,8,0),(301,NULL,28,1,8,0),(302,NULL,34,1,8,0),(303,NULL,20,1,8,0),(304,NULL,26,1,8,0),(305,NULL,32,1,8,0),(306,NULL,3,1,8,0),(307,NULL,42,1,8,0),(308,NULL,43,1,8,0),(309,NULL,52,1,8,0),(310,NULL,48,1,8,0),(311,NULL,49,1,8,0),(312,NULL,51,1,8,0),(313,NULL,47,1,8,0),(314,NULL,45,1,8,0),(315,NULL,46,1,8,0),(316,NULL,50,1,8,0),(317,NULL,44,1,8,0),(318,NULL,67,1,8,0),(319,NULL,57,1,8,0),(320,NULL,58,1,8,0),(321,NULL,59,1,8,0),(322,NULL,65,1,8,0),(323,NULL,64,1,8,0),(324,NULL,69,1,8,0),(325,NULL,62,1,8,0),(326,NULL,63,1,8,0),(327,NULL,60,1,8,0),(328,NULL,61,1,8,0),(329,NULL,66,1,8,0),(330,NULL,53,1,8,0),(331,NULL,54,1,8,0),(332,NULL,55,1,8,0),(333,NULL,56,1,8,0),(334,NULL,10,1,8,0),(335,NULL,16,1,8,0),(336,NULL,11,1,8,0),(337,NULL,17,1,8,0),(338,NULL,35,1,8,0),(339,NULL,39,1,8,0),(340,NULL,37,1,8,0),(341,NULL,36,1,8,0),(342,NULL,40,1,8,0),(343,NULL,38,1,8,0),(344,NULL,41,1,8,0),(345,NULL,6,1,8,0),(346,NULL,4,1,10,0),(347,NULL,5,1,10,0),(348,NULL,7,1,10,0),(349,NULL,1,1,10,0),(350,NULL,12,1,10,0),(351,NULL,2,1,10,0),(352,NULL,13,1,10,0),(353,NULL,8,1,10,0),(354,NULL,14,1,10,0),(355,NULL,9,1,10,0),(356,NULL,15,1,10,0),(357,NULL,68,1,10,0),(358,NULL,18,1,10,0),(359,NULL,23,1,10,0),(360,NULL,29,1,10,0),(361,NULL,21,1,10,0),(362,NULL,27,1,10,0),(363,NULL,33,1,10,0),(364,NULL,19,1,10,0),(365,NULL,25,1,10,0),(366,NULL,31,1,10,0),(367,NULL,24,1,10,0),(368,NULL,30,1,10,0),(369,NULL,22,1,10,0),(370,NULL,28,1,10,0),(371,NULL,34,1,10,0),(372,NULL,20,1,10,0),(373,NULL,26,1,10,0),(374,NULL,32,1,10,0),(375,NULL,3,1,10,0),(376,NULL,42,1,10,0),(377,NULL,43,1,10,0),(378,NULL,52,1,10,0),(379,NULL,48,1,10,0),(380,NULL,49,1,10,0),(381,NULL,51,1,10,0),(382,NULL,47,1,10,0),(383,NULL,45,1,10,0),(384,NULL,46,1,10,0),(385,NULL,50,1,10,0),(386,NULL,44,1,10,0),(387,NULL,67,1,10,0),(388,NULL,57,1,10,0),(389,NULL,58,1,10,0),(390,NULL,59,1,10,0),(391,NULL,65,1,10,0),(392,NULL,64,1,10,0),(393,NULL,69,1,10,0),(394,NULL,62,1,10,0),(395,NULL,63,1,10,0),(396,NULL,60,1,10,0),(397,NULL,61,1,10,0),(398,NULL,66,1,10,0),(399,NULL,53,1,10,0),(400,NULL,54,1,10,0),(401,NULL,55,1,10,0),(402,NULL,56,1,10,0),(403,NULL,10,1,10,0),(404,NULL,16,1,10,0),(405,NULL,11,1,10,0),(406,NULL,17,1,10,0),(407,NULL,35,1,10,0),(408,NULL,39,1,10,0),(409,NULL,37,1,10,0),(410,NULL,36,1,10,0),(411,NULL,40,1,10,0),(412,NULL,38,1,10,0),(413,NULL,41,1,10,0),(414,NULL,6,1,10,0),(415,NULL,4,1,9,0),(416,NULL,5,1,9,0),(417,NULL,7,1,9,0),(418,NULL,1,1,9,0),(419,NULL,12,1,9,0),(420,NULL,2,1,9,0),(421,NULL,13,1,9,0),(422,NULL,8,1,9,0),(423,NULL,14,1,9,0),(424,NULL,9,1,9,0),(425,NULL,15,1,9,0),(426,NULL,68,1,9,0),(427,NULL,18,1,9,0),(428,NULL,23,1,9,0),(429,NULL,29,1,9,0),(430,NULL,21,1,9,0),(431,NULL,27,1,9,0),(432,NULL,33,1,9,0),(433,NULL,19,1,9,0),(434,NULL,25,1,9,0),(435,NULL,31,1,9,0),(436,NULL,24,1,9,0),(437,NULL,30,1,9,0),(438,NULL,22,1,9,0),(439,NULL,28,1,9,0),(440,NULL,34,1,9,0),(441,NULL,20,1,9,0),(442,NULL,26,1,9,0),(443,NULL,32,1,9,0),(444,NULL,3,1,9,0),(445,NULL,42,1,9,0),(446,NULL,43,1,9,0),(447,NULL,52,1,9,0),(448,NULL,48,1,9,0),(449,NULL,49,1,9,0),(450,NULL,51,1,9,0),(451,NULL,47,1,9,0),(452,NULL,45,1,9,0),(453,NULL,46,1,9,0),(454,NULL,50,1,9,0),(455,NULL,44,1,9,0),(456,NULL,67,1,9,0),(457,NULL,57,1,9,0),(458,NULL,58,1,9,0),(459,NULL,59,1,9,0),(460,NULL,65,1,9,0),(461,NULL,64,1,9,0),(462,NULL,69,1,9,0),(463,NULL,62,1,9,0),(464,NULL,63,1,9,0),(465,NULL,60,1,9,0),(466,NULL,61,1,9,0),(467,NULL,66,1,9,0),(468,NULL,53,1,9,0),(469,NULL,54,1,9,0),(470,NULL,55,1,9,0),(471,NULL,56,1,9,0),(472,NULL,10,1,9,0),(473,NULL,16,1,9,0),(474,NULL,11,1,9,0),(475,NULL,17,1,9,0),(476,NULL,35,1,9,0),(477,NULL,39,1,9,0),(478,NULL,37,1,9,0),(479,NULL,36,1,9,0),(480,NULL,40,1,9,0),(481,NULL,38,1,9,0),(482,NULL,41,1,9,0),(483,NULL,6,1,9,0),(484,NULL,4,1,8,0),(485,NULL,5,1,8,0),(486,NULL,7,1,8,0),(487,NULL,1,1,8,0),(488,NULL,12,1,8,0),(489,NULL,2,1,8,0),(490,NULL,13,1,8,0),(491,NULL,8,1,8,0),(492,NULL,14,1,8,0),(493,NULL,9,1,8,0),(494,NULL,15,1,8,0),(495,NULL,68,1,8,0),(496,NULL,18,1,8,0),(497,NULL,23,1,8,0),(498,NULL,29,1,8,0),(499,NULL,21,1,8,0),(500,NULL,27,1,8,0),(501,NULL,33,1,8,0),(502,NULL,19,1,8,0),(503,NULL,25,1,8,0),(504,NULL,31,1,8,0),(505,NULL,24,1,8,0),(506,NULL,30,1,8,0),(507,NULL,22,1,8,0),(508,NULL,28,1,8,0),(509,NULL,34,1,8,0),(510,NULL,20,1,8,0),(511,NULL,26,1,8,0),(512,NULL,32,1,8,0),(513,NULL,3,1,8,0),(514,NULL,42,1,8,0),(515,NULL,43,1,8,0),(516,NULL,52,1,8,0),(517,NULL,48,1,8,0),(518,NULL,49,1,8,0),(519,NULL,51,1,8,0),(520,NULL,47,1,8,0),(521,NULL,45,1,8,0),(522,NULL,46,1,8,0),(523,NULL,50,1,8,0),(524,NULL,44,1,8,0),(525,NULL,67,1,8,0),(526,NULL,57,1,8,0),(527,NULL,58,1,8,0),(528,NULL,59,1,8,0),(529,NULL,65,1,8,0),(530,NULL,64,1,8,0),(531,NULL,69,1,8,0),(532,NULL,62,1,8,0),(533,NULL,63,1,8,0),(534,NULL,60,1,8,0),(535,NULL,61,1,8,0),(536,NULL,66,1,8,0),(537,NULL,53,1,8,0),(538,NULL,54,1,8,0),(539,NULL,55,1,8,0),(540,NULL,56,1,8,0),(541,NULL,10,1,8,0),(542,NULL,16,1,8,0),(543,NULL,11,1,8,0),(544,NULL,17,1,8,0),(545,NULL,35,1,8,0),(546,NULL,39,1,8,0),(547,NULL,37,1,8,0),(548,NULL,36,1,8,0),(549,NULL,40,1,8,0),(550,NULL,38,1,8,0),(551,NULL,41,1,8,0),(552,NULL,6,1,8,0),(553,NULL,4,1,10,0),(554,NULL,5,1,10,0),(555,NULL,7,1,10,0),(556,NULL,1,1,10,0),(557,NULL,12,1,10,0),(558,NULL,2,1,10,0),(559,NULL,13,1,10,0),(560,NULL,8,1,10,0),(561,NULL,14,1,10,0),(562,NULL,9,1,10,0),(563,NULL,15,1,10,0),(564,NULL,68,1,10,0),(565,NULL,18,1,10,0),(566,NULL,23,1,10,0),(567,NULL,29,1,10,0),(568,NULL,21,1,10,0),(569,NULL,27,1,10,0),(570,NULL,33,1,10,0),(571,NULL,19,1,10,0),(572,NULL,25,1,10,0),(573,NULL,31,1,10,0),(574,NULL,24,1,10,0),(575,NULL,30,1,10,0),(576,NULL,22,1,10,0),(577,NULL,28,1,10,0),(578,NULL,34,1,10,0),(579,NULL,20,1,10,0),(580,NULL,26,1,10,0),(581,NULL,32,1,10,0),(582,NULL,3,1,10,0),(583,NULL,42,1,10,0),(584,NULL,43,1,10,0),(585,NULL,52,1,10,0),(586,NULL,48,1,10,0),(587,NULL,49,1,10,0),(588,NULL,51,1,10,0),(589,NULL,47,1,10,0),(590,NULL,45,1,10,0),(591,NULL,46,1,10,0),(592,NULL,50,1,10,0),(593,NULL,44,1,10,0),(594,NULL,67,1,10,0),(595,NULL,57,1,10,0),(596,NULL,58,1,10,0),(597,NULL,59,1,10,0),(598,NULL,65,1,10,0),(599,NULL,64,1,10,0),(600,NULL,69,1,10,0),(601,NULL,62,1,10,0),(602,NULL,63,1,10,0),(603,NULL,60,1,10,0),(604,NULL,61,1,10,0),(605,NULL,66,1,10,0),(606,NULL,53,1,10,0),(607,NULL,54,1,10,0),(608,NULL,55,1,10,0),(609,NULL,56,1,10,0),(610,NULL,10,1,10,0),(611,NULL,16,1,10,0),(612,NULL,11,1,10,0),(613,NULL,17,1,10,0),(614,NULL,35,1,10,0),(615,NULL,39,1,10,0),(616,NULL,37,1,10,0),(617,NULL,36,1,10,0),(618,NULL,40,1,10,0),(619,NULL,38,1,10,0),(620,NULL,41,1,10,0),(621,NULL,6,1,10,0),(622,NULL,4,1,9,0),(623,NULL,5,1,9,0),(624,NULL,7,1,9,0),(625,NULL,1,1,9,0),(626,NULL,12,1,9,0),(627,NULL,2,1,9,0),(628,NULL,13,1,9,0),(629,NULL,8,1,9,0),(630,NULL,14,1,9,0),(631,NULL,9,1,9,0),(632,NULL,15,1,9,0),(633,NULL,68,1,9,0),(634,NULL,18,1,9,0),(635,NULL,23,1,9,0),(636,NULL,29,1,9,0),(637,NULL,21,1,9,0),(638,NULL,27,1,9,0),(639,NULL,33,1,9,0),(640,NULL,19,1,9,0),(641,NULL,25,1,9,0),(642,NULL,31,1,9,0),(643,NULL,24,1,9,0),(644,NULL,30,1,9,0),(645,NULL,22,1,9,0),(646,NULL,28,1,9,0),(647,NULL,34,1,9,0),(648,NULL,20,1,9,0),(649,NULL,26,1,9,0),(650,NULL,32,1,9,0),(651,NULL,3,1,9,0),(652,NULL,42,1,9,0),(653,NULL,43,1,9,0),(654,NULL,52,1,9,0),(655,NULL,48,1,9,0),(656,NULL,49,1,9,0),(657,NULL,51,1,9,0),(658,NULL,47,1,9,0),(659,NULL,45,1,9,0),(660,NULL,46,1,9,0),(661,NULL,50,1,9,0),(662,NULL,44,1,9,0),(663,NULL,67,1,9,0),(664,NULL,57,1,9,0),(665,NULL,58,1,9,0),(666,NULL,59,1,9,0),(667,NULL,65,1,9,0),(668,NULL,64,1,9,0),(669,NULL,69,1,9,0),(670,NULL,62,1,9,0),(671,NULL,63,1,9,0),(672,NULL,60,1,9,0),(673,NULL,61,1,9,0),(674,NULL,66,1,9,0),(675,NULL,53,1,9,0),(676,NULL,54,1,9,0),(677,NULL,55,1,9,0),(678,NULL,56,1,9,0),(679,NULL,10,1,9,0),(680,NULL,16,1,9,0),(681,NULL,11,1,9,0),(682,NULL,17,1,9,0),(683,NULL,35,1,9,0),(684,NULL,39,1,9,0),(685,NULL,37,1,9,0),(686,NULL,36,1,9,0),(687,NULL,40,1,9,0),(688,NULL,38,1,9,0),(689,NULL,41,1,9,0),(690,NULL,6,1,9,0),(691,NULL,4,1,8,0),(692,NULL,5,1,8,0),(693,NULL,7,1,8,0),(694,NULL,1,1,8,0),(695,NULL,12,1,8,0),(696,NULL,2,1,8,0),(697,NULL,13,1,8,0),(698,NULL,8,1,8,0),(699,NULL,14,1,8,0),(700,NULL,9,1,8,0),(701,NULL,15,1,8,0),(702,NULL,68,1,8,0),(703,NULL,18,1,8,0),(704,NULL,23,1,8,0),(705,NULL,29,1,8,0),(706,NULL,21,1,8,0),(707,NULL,27,1,8,0),(708,NULL,33,1,8,0),(709,NULL,19,1,8,0),(710,NULL,25,1,8,0),(711,NULL,31,1,8,0),(712,NULL,24,1,8,0),(713,NULL,30,1,8,0),(714,NULL,22,1,8,0),(715,NULL,28,1,8,0),(716,NULL,34,1,8,0),(717,NULL,20,1,8,0),(718,NULL,26,1,8,0),(719,NULL,32,1,8,0),(720,NULL,3,1,8,0),(721,NULL,42,1,8,0),(722,NULL,43,1,8,0),(723,NULL,52,1,8,0),(724,NULL,48,1,8,0),(725,NULL,49,1,8,0),(726,NULL,51,1,8,0),(727,NULL,47,1,8,0),(728,NULL,45,1,8,0),(729,NULL,46,1,8,0),(730,NULL,50,1,8,0),(731,NULL,44,1,8,0),(732,NULL,67,1,8,0),(733,NULL,57,1,8,0),(734,NULL,58,1,8,0),(735,NULL,59,1,8,0),(736,NULL,65,1,8,0),(737,NULL,64,1,8,0),(738,NULL,69,1,8,0),(739,NULL,62,1,8,0),(740,NULL,63,1,8,0),(741,NULL,60,1,8,0),(742,NULL,61,1,8,0),(743,NULL,66,1,8,0),(744,NULL,53,1,8,0),(745,NULL,54,1,8,0),(746,NULL,55,1,8,0),(747,NULL,56,1,8,0),(748,NULL,10,1,8,0),(749,NULL,16,1,8,0),(750,NULL,11,1,8,0),(751,NULL,17,1,8,0),(752,NULL,35,1,8,0),(753,NULL,39,1,8,0),(754,NULL,37,1,8,0),(755,NULL,36,1,8,0),(756,NULL,40,1,8,0),(757,NULL,38,1,8,0),(758,NULL,41,1,8,0),(759,NULL,6,1,8,0),(760,NULL,4,1,10,0),(761,NULL,5,1,10,0),(762,NULL,7,1,10,0),(763,NULL,1,1,10,0),(764,NULL,12,1,10,0),(765,NULL,2,1,10,0),(766,NULL,13,1,10,0),(767,NULL,8,1,10,0),(768,NULL,14,1,10,0),(769,NULL,9,1,10,0),(770,NULL,15,1,10,0),(771,NULL,68,1,10,0),(772,NULL,18,1,10,0),(773,NULL,23,1,10,0),(774,NULL,29,1,10,0),(775,NULL,21,1,10,0),(776,NULL,27,1,10,0),(777,NULL,33,1,10,0),(778,NULL,19,1,10,0),(779,NULL,25,1,10,0),(780,NULL,31,1,10,0),(781,NULL,24,1,10,0),(782,NULL,30,1,10,0),(783,NULL,22,1,10,0),(784,NULL,28,1,10,0),(785,NULL,34,1,10,0),(786,NULL,20,1,10,0),(787,NULL,26,1,10,0),(788,NULL,32,1,10,0),(789,NULL,3,1,10,0),(790,NULL,42,1,10,0),(791,NULL,43,1,10,0),(792,NULL,52,1,10,0),(793,NULL,48,1,10,0),(794,NULL,49,1,10,0),(795,NULL,51,1,10,0),(796,NULL,47,1,10,0),(797,NULL,45,1,10,0),(798,NULL,46,1,10,0),(799,NULL,50,1,10,0),(800,NULL,44,1,10,0),(801,NULL,67,1,10,0),(802,NULL,57,1,10,0),(803,NULL,58,1,10,0),(804,NULL,59,1,10,0),(805,NULL,65,1,10,0),(806,NULL,64,1,10,0),(807,NULL,69,1,10,0),(808,NULL,62,1,10,0),(809,NULL,63,1,10,0),(810,NULL,60,1,10,0),(811,NULL,61,1,10,0),(812,NULL,66,1,10,0),(813,NULL,53,1,10,0),(814,NULL,54,1,10,0),(815,NULL,55,1,10,0),(816,NULL,56,1,10,0),(817,NULL,10,1,10,0),(818,NULL,16,1,10,0),(819,NULL,11,1,10,0),(820,NULL,17,1,10,0),(821,NULL,35,1,10,0),(822,NULL,39,1,10,0),(823,NULL,37,1,10,0),(824,NULL,36,1,10,0),(825,NULL,40,1,10,0),(826,NULL,38,1,10,0),(827,NULL,41,1,10,0),(828,NULL,6,1,10,0),(829,NULL,4,1,9,0),(830,NULL,5,1,9,0),(831,NULL,7,1,9,0),(832,NULL,1,1,9,0),(833,NULL,12,1,9,0),(834,NULL,2,1,9,0),(835,NULL,13,1,9,0),(836,NULL,8,1,9,0),(837,NULL,14,1,9,0),(838,NULL,9,1,9,0),(839,NULL,15,1,9,0),(840,NULL,68,1,9,0),(841,NULL,18,1,9,0),(842,NULL,23,1,9,0),(843,NULL,29,1,9,0),(844,NULL,21,1,9,0),(845,NULL,27,1,9,0),(846,NULL,33,1,9,0),(847,NULL,19,1,9,0),(848,NULL,25,1,9,0),(849,NULL,31,1,9,0),(850,NULL,24,1,9,0),(851,NULL,30,1,9,0),(852,NULL,22,1,9,0),(853,NULL,28,1,9,0),(854,NULL,34,1,9,0),(855,NULL,20,1,9,0),(856,NULL,26,1,9,0),(857,NULL,32,1,9,0),(858,NULL,3,1,9,0),(859,NULL,42,1,9,0),(860,NULL,43,1,9,0),(861,NULL,52,1,9,0),(862,NULL,48,1,9,0),(863,NULL,49,1,9,0),(864,NULL,51,1,9,0),(865,NULL,47,1,9,0),(866,NULL,45,1,9,0),(867,NULL,46,1,9,0),(868,NULL,50,1,9,0),(869,NULL,44,1,9,0),(870,NULL,67,1,9,0),(871,NULL,57,1,9,0),(872,NULL,58,1,9,0),(873,NULL,59,1,9,0),(874,NULL,65,1,9,0),(875,NULL,64,1,9,0),(876,NULL,69,1,9,0),(877,NULL,62,1,9,0),(878,NULL,63,1,9,0),(879,NULL,60,1,9,0),(880,NULL,61,1,9,0),(881,NULL,66,1,9,0),(882,NULL,53,1,9,0),(883,NULL,54,1,9,0),(884,NULL,55,1,9,0),(885,NULL,56,1,9,0),(886,NULL,10,1,9,0),(887,NULL,16,1,9,0),(888,NULL,11,1,9,0),(889,NULL,17,1,9,0),(890,NULL,35,1,9,0),(891,NULL,39,1,9,0),(892,NULL,37,1,9,0),(893,NULL,36,1,9,0),(894,NULL,40,1,9,0),(895,NULL,38,1,9,0),(896,NULL,41,1,9,0),(897,NULL,6,1,9,0),(898,NULL,4,1,8,0),(899,NULL,5,1,8,0),(900,NULL,7,1,8,0),(901,NULL,1,1,8,0),(902,NULL,12,1,8,0),(903,NULL,2,1,8,0),(904,NULL,13,1,8,0),(905,NULL,8,1,8,0),(906,NULL,14,1,8,0),(907,NULL,9,1,8,0),(908,NULL,15,1,8,0),(909,NULL,68,1,8,0),(910,NULL,18,1,8,0),(911,NULL,23,1,8,0),(912,NULL,29,1,8,0),(913,NULL,21,1,8,0),(914,NULL,27,1,8,0),(915,NULL,33,1,8,0),(916,NULL,19,1,8,0),(917,NULL,25,1,8,0),(918,NULL,31,1,8,0),(919,NULL,24,1,8,0),(920,NULL,30,1,8,0),(921,NULL,22,1,8,0),(922,NULL,28,1,8,0),(923,NULL,34,1,8,0),(924,NULL,20,1,8,0),(925,NULL,26,1,8,0),(926,NULL,32,1,8,0),(927,NULL,3,1,8,0),(928,NULL,42,1,8,0),(929,NULL,43,1,8,0),(930,NULL,52,1,8,0),(931,NULL,48,1,8,0),(932,NULL,49,1,8,0),(933,NULL,51,1,8,0),(934,NULL,47,1,8,0),(935,NULL,45,1,8,0),(936,NULL,46,1,8,0),(937,NULL,50,1,8,0),(938,NULL,44,1,8,0),(939,NULL,67,1,8,0),(940,NULL,57,1,8,0),(941,NULL,58,1,8,0),(942,NULL,59,1,8,0),(943,NULL,65,1,8,0),(944,NULL,64,1,8,0),(945,NULL,69,1,8,0),(946,NULL,62,1,8,0),(947,NULL,63,1,8,0),(948,NULL,60,1,8,0),(949,NULL,61,1,8,0),(950,NULL,66,1,8,0),(951,NULL,53,1,8,0),(952,NULL,54,1,8,0),(953,NULL,55,1,8,0),(954,NULL,56,1,8,0),(955,NULL,10,1,8,0),(956,NULL,16,1,8,0),(957,NULL,11,1,8,0),(958,NULL,17,1,8,0),(959,NULL,35,1,8,0),(960,NULL,39,1,8,0),(961,NULL,37,1,8,0),(962,NULL,36,1,8,0),(963,NULL,40,1,8,0),(964,NULL,38,1,8,0),(965,NULL,41,1,8,0),(966,NULL,6,1,8,0),(967,NULL,4,1,10,0),(968,NULL,5,1,10,0),(969,NULL,7,1,10,0),(970,NULL,1,1,10,0),(971,NULL,12,1,10,0),(972,NULL,2,1,10,0),(973,NULL,13,1,10,0),(974,NULL,8,1,10,0),(975,NULL,14,1,10,0),(976,NULL,9,1,10,0),(977,NULL,15,1,10,0),(978,NULL,68,1,10,0),(979,NULL,18,1,10,0),(980,NULL,23,1,10,0),(981,NULL,29,1,10,0),(982,NULL,21,1,10,0),(983,NULL,27,1,10,0),(984,NULL,33,1,10,0),(985,NULL,19,1,10,0),(986,NULL,25,1,10,0),(987,NULL,31,1,10,0),(988,NULL,24,1,10,0),(989,NULL,30,1,10,0),(990,NULL,22,1,10,0),(991,NULL,28,1,10,0),(992,NULL,34,1,10,0),(993,NULL,20,1,10,0),(994,NULL,26,1,10,0),(995,NULL,32,1,10,0),(996,NULL,3,1,10,0),(997,NULL,42,1,10,0),(998,NULL,43,1,10,0),(999,NULL,52,1,10,0),(1000,NULL,48,1,10,0),(1001,NULL,49,1,10,0),(1002,NULL,51,1,10,0),(1003,NULL,47,1,10,0),(1004,NULL,45,1,10,0),(1005,NULL,46,1,10,0),(1006,NULL,50,1,10,0),(1007,NULL,44,1,10,0),(1008,NULL,67,1,10,0),(1009,NULL,57,1,10,0),(1010,NULL,58,1,10,0),(1011,NULL,59,1,10,0),(1012,NULL,65,1,10,0),(1013,NULL,64,1,10,0),(1014,NULL,69,1,10,0),(1015,NULL,62,1,10,0),(1016,NULL,63,1,10,0),(1017,NULL,60,1,10,0),(1018,NULL,61,1,10,0),(1019,NULL,66,1,10,0),(1020,NULL,53,1,10,0),(1021,NULL,54,1,10,0),(1022,NULL,55,1,10,0),(1023,NULL,56,1,10,0),(1024,NULL,10,1,10,0),(1025,NULL,16,1,10,0),(1026,NULL,11,1,10,0),(1027,NULL,17,1,10,0),(1028,NULL,35,1,10,0),(1029,NULL,39,1,10,0),(1030,NULL,37,1,10,0),(1031,NULL,36,1,10,0),(1032,NULL,40,1,10,0),(1033,NULL,38,1,10,0),(1034,NULL,41,1,10,0),(1035,NULL,6,1,10,0),(1036,'2019-10-21',4,1,9,0),(1037,'2019-10-21',5,1,9,0),(1038,'2019-10-21',7,1,9,0),(1039,'2019-10-21',1,1,9,0),(1040,'2019-10-21',12,1,9,0),(1041,'2019-10-21',2,1,9,0),(1042,'2019-10-21',13,1,9,0),(1043,'2019-10-21',8,1,9,0),(1044,'2019-10-21',14,1,9,0),(1045,'2019-10-21',9,1,9,0),(1046,'2019-10-21',15,1,9,0),(1047,'2019-10-21',68,1,9,0),(1048,'2019-10-21',18,1,9,0),(1049,'2019-10-21',23,1,9,0),(1050,'2019-10-21',29,1,9,0),(1051,'2019-10-21',21,1,9,0),(1052,'2019-10-21',27,1,9,0),(1053,'2019-10-21',33,1,9,0),(1054,'2019-10-21',19,1,9,0),(1055,'2019-10-21',25,1,9,0),(1056,'2019-10-21',31,1,9,0),(1057,'2019-10-21',24,1,9,0),(1058,'2019-10-21',30,1,9,0),(1059,'2019-10-21',22,1,9,0),(1060,'2019-10-21',28,1,9,0),(1061,'2019-10-21',34,1,9,0),(1062,'2019-10-21',20,1,9,0),(1063,'2019-10-21',26,1,9,0),(1064,'2019-10-21',32,1,9,0),(1065,'2019-10-21',3,1,9,0),(1066,'2019-10-21',42,1,9,0),(1067,'2019-10-21',43,1,9,0),(1068,'2019-10-21',52,1,9,0),(1069,'2019-10-21',48,1,9,0),(1070,'2019-10-21',49,1,9,0),(1071,'2019-10-21',51,1,9,0),(1072,'2019-10-21',47,1,9,0),(1073,'2019-10-21',45,1,9,0),(1074,'2019-10-21',46,1,9,0),(1075,'2019-10-21',50,1,9,0),(1076,'2019-10-21',44,1,9,0),(1077,'2019-10-21',67,1,9,0),(1078,'2019-10-21',57,1,9,0),(1079,'2019-10-21',58,1,9,0),(1080,'2019-10-21',59,1,9,0),(1081,'2019-10-21',65,1,9,0),(1082,'2019-10-21',64,1,9,0),(1083,'2019-10-21',69,1,9,0),(1084,'2019-10-21',62,1,9,0),(1085,'2019-10-21',63,1,9,0),(1086,'2019-10-21',60,1,9,0),(1087,'2019-10-21',61,1,9,0),(1088,'2019-10-21',66,1,9,0),(1089,'2019-10-21',53,1,9,0),(1090,'2019-10-21',54,1,9,0),(1091,'2019-10-21',55,1,9,0),(1092,'2019-10-21',56,1,9,0),(1093,'2019-10-21',10,1,9,0),(1094,'2019-10-21',16,1,9,0),(1095,'2019-10-21',11,1,9,0),(1096,'2019-10-21',17,1,9,0),(1097,'2019-10-21',35,1,9,0),(1098,'2019-10-21',39,1,9,0),(1099,'2019-10-21',37,1,9,0),(1100,'2019-10-21',36,1,9,0),(1101,'2019-10-21',40,1,9,0),(1102,'2019-10-21',38,1,9,0),(1103,'2019-10-21',41,1,9,0),(1104,'2019-10-21',6,1,9,0),(1105,'2019-10-21',4,1,8,0),(1106,'2019-10-21',5,1,8,0),(1107,'2019-10-21',7,1,8,0),(1108,'2019-10-21',1,1,8,0),(1109,'2019-10-21',12,1,8,0),(1110,'2019-10-21',2,1,8,0),(1111,'2019-10-21',13,1,8,0),(1112,'2019-10-21',8,1,8,0),(1113,'2019-10-21',14,1,8,0),(1114,'2019-10-21',9,1,8,0),(1115,'2019-10-21',15,1,8,0),(1116,'2019-10-21',68,1,8,0),(1117,'2019-10-21',18,1,8,0),(1118,'2019-10-21',23,1,8,0),(1119,'2019-10-21',29,1,8,0),(1120,'2019-10-21',21,1,8,0),(1121,'2019-10-21',27,1,8,0),(1122,'2019-10-21',33,1,8,0),(1123,'2019-10-21',19,1,8,0),(1124,'2019-10-21',25,1,8,0),(1125,'2019-10-21',31,1,8,0),(1126,'2019-10-21',24,1,8,0),(1127,'2019-10-21',30,1,8,0),(1128,'2019-10-21',22,1,8,0),(1129,'2019-10-21',28,1,8,0),(1130,'2019-10-21',34,1,8,0),(1131,'2019-10-21',20,1,8,0),(1132,'2019-10-21',26,1,8,0),(1133,'2019-10-21',32,1,8,0),(1134,'2019-10-21',3,1,8,0),(1135,'2019-10-21',42,1,8,0),(1136,'2019-10-21',43,1,8,0),(1137,'2019-10-21',52,1,8,0),(1138,'2019-10-21',48,1,8,0),(1139,'2019-10-21',49,1,8,0),(1140,'2019-10-21',51,1,8,0),(1141,'2019-10-21',47,1,8,0),(1142,'2019-10-21',45,1,8,0),(1143,'2019-10-21',46,1,8,0),(1144,'2019-10-21',50,1,8,0),(1145,'2019-10-21',44,1,8,0),(1146,'2019-10-21',67,1,8,0),(1147,'2019-10-21',57,1,8,0),(1148,'2019-10-21',58,1,8,0),(1149,'2019-10-21',59,1,8,0),(1150,'2019-10-21',65,1,8,0),(1151,'2019-10-21',64,1,8,0),(1152,'2019-10-21',69,1,8,0),(1153,'2019-10-21',62,1,8,0),(1154,'2019-10-21',63,1,8,0),(1155,'2019-10-21',60,1,8,0),(1156,'2019-10-21',61,1,8,0),(1157,'2019-10-21',66,1,8,0),(1158,'2019-10-21',53,1,8,0),(1159,'2019-10-21',54,1,8,0),(1160,'2019-10-21',55,1,8,0),(1161,'2019-10-21',56,1,8,0),(1162,'2019-10-21',10,1,8,0),(1163,'2019-10-21',16,1,8,0),(1164,'2019-10-21',11,1,8,0),(1165,'2019-10-21',17,1,8,0),(1166,'2019-10-21',35,1,8,0),(1167,'2019-10-21',39,1,8,0),(1168,'2019-10-21',37,1,8,0),(1169,'2019-10-21',36,1,8,0),(1170,'2019-10-21',40,1,8,0),(1171,'2019-10-21',38,1,8,0),(1172,'2019-10-21',41,1,8,0),(1173,'2019-10-21',6,1,8,0),(1174,'2019-10-21',4,1,10,0),(1175,'2019-10-21',5,1,10,0),(1176,'2019-10-21',7,1,10,0),(1177,'2019-10-21',1,1,10,0),(1178,'2019-10-21',12,1,10,0),(1179,'2019-10-21',2,1,10,0),(1180,'2019-10-21',13,1,10,0),(1181,'2019-10-21',8,1,10,0),(1182,'2019-10-21',14,1,10,0),(1183,'2019-10-21',9,1,10,0),(1184,'2019-10-21',15,1,10,0),(1185,'2019-10-21',68,1,10,0),(1186,'2019-10-21',18,1,10,0),(1187,'2019-10-21',23,1,10,0),(1188,'2019-10-21',29,1,10,0),(1189,'2019-10-21',21,1,10,0),(1190,'2019-10-21',27,1,10,0),(1191,'2019-10-21',33,1,10,0),(1192,'2019-10-21',19,1,10,0),(1193,'2019-10-21',25,1,10,0),(1194,'2019-10-21',31,1,10,0),(1195,'2019-10-21',24,1,10,0),(1196,'2019-10-21',30,1,10,0),(1197,'2019-10-21',22,1,10,0),(1198,'2019-10-21',28,1,10,0),(1199,'2019-10-21',34,1,10,0),(1200,'2019-10-21',20,1,10,0),(1201,'2019-10-21',26,1,10,0),(1202,'2019-10-21',32,1,10,0),(1203,'2019-10-21',3,1,10,0),(1204,'2019-10-21',42,1,10,0),(1205,'2019-10-21',43,1,10,0),(1206,'2019-10-21',52,1,10,0),(1207,'2019-10-21',48,1,10,0),(1208,'2019-10-21',49,1,10,0),(1209,'2019-10-21',51,1,10,0),(1210,'2019-10-21',47,1,10,0),(1211,'2019-10-21',45,1,10,0),(1212,'2019-10-21',46,1,10,0),(1213,'2019-10-21',50,1,10,0),(1214,'2019-10-21',44,1,10,0),(1215,'2019-10-21',67,1,10,0),(1216,'2019-10-21',57,1,10,0),(1217,'2019-10-21',58,1,10,0),(1218,'2019-10-21',59,1,10,0),(1219,'2019-10-21',65,1,10,0),(1220,'2019-10-21',64,1,10,0),(1221,'2019-10-21',69,1,10,0),(1222,'2019-10-21',62,1,10,0),(1223,'2019-10-21',63,1,10,0),(1224,'2019-10-21',60,1,10,0),(1225,'2019-10-21',61,1,10,0),(1226,'2019-10-21',66,1,10,0),(1227,'2019-10-21',53,1,10,0),(1228,'2019-10-21',54,1,10,0),(1229,'2019-10-21',55,1,10,0),(1230,'2019-10-21',56,1,10,0),(1231,'2019-10-21',10,1,10,0),(1232,'2019-10-21',16,1,10,0),(1233,'2019-10-21',11,1,10,0),(1234,'2019-10-21',17,1,10,0),(1235,'2019-10-21',35,1,10,0),(1236,'2019-10-21',39,1,10,0),(1237,'2019-10-21',37,1,10,0),(1238,'2019-10-21',36,1,10,0),(1239,'2019-10-21',40,1,10,0),(1240,'2019-10-21',38,1,10,0),(1241,'2019-10-21',41,1,10,0),(1242,'2019-10-21',6,1,10,0),(1243,NULL,4,1,9,0),(1244,NULL,5,1,9,0),(1245,NULL,7,1,9,0),(1246,NULL,1,1,9,0),(1247,NULL,12,1,9,0),(1248,NULL,2,1,9,0),(1249,NULL,13,1,9,0),(1250,NULL,8,1,9,0),(1251,NULL,14,1,9,0),(1252,NULL,9,1,9,0),(1253,NULL,15,1,9,0),(1254,NULL,68,1,9,0),(1255,NULL,18,1,9,0),(1256,NULL,23,1,9,0),(1257,NULL,29,1,9,0),(1258,NULL,21,1,9,0),(1259,NULL,27,1,9,0),(1260,NULL,33,1,9,0),(1261,NULL,19,1,9,0),(1262,NULL,25,1,9,0),(1263,NULL,31,1,9,0),(1264,NULL,24,1,9,0),(1265,NULL,30,1,9,0),(1266,NULL,22,1,9,0),(1267,NULL,28,1,9,0),(1268,NULL,34,1,9,0),(1269,NULL,20,1,9,0),(1270,NULL,26,1,9,0),(1271,NULL,32,1,9,0),(1272,NULL,3,1,9,0),(1273,NULL,42,1,9,0),(1274,NULL,43,1,9,0),(1275,NULL,52,1,9,0),(1276,NULL,48,1,9,0),(1277,NULL,49,1,9,0),(1278,NULL,51,1,9,0),(1279,NULL,47,1,9,0),(1280,NULL,45,1,9,0),(1281,NULL,46,1,9,0),(1282,NULL,50,1,9,0),(1283,NULL,44,1,9,0),(1284,NULL,67,1,9,0),(1285,NULL,57,1,9,0),(1286,NULL,58,1,9,0),(1287,NULL,59,1,9,0),(1288,NULL,65,1,9,0),(1289,NULL,64,1,9,0),(1290,NULL,69,1,9,0),(1291,NULL,62,1,9,0),(1292,NULL,63,1,9,0),(1293,NULL,60,1,9,0),(1294,NULL,61,1,9,0),(1295,NULL,66,1,9,0),(1296,NULL,53,1,9,0),(1297,NULL,54,1,9,0),(1298,NULL,55,1,9,0),(1299,NULL,56,1,9,0),(1300,NULL,10,1,9,0),(1301,NULL,16,1,9,0),(1302,NULL,11,1,9,0),(1303,NULL,17,1,9,0),(1304,NULL,35,1,9,0),(1305,NULL,39,1,9,0),(1306,NULL,37,1,9,0),(1307,NULL,36,1,9,0),(1308,NULL,40,1,9,0),(1309,NULL,38,1,9,0),(1310,NULL,41,1,9,0),(1311,NULL,6,1,9,0),(1312,NULL,4,1,8,0),(1313,NULL,5,1,8,0),(1314,NULL,7,1,8,0),(1315,NULL,1,1,8,0),(1316,NULL,12,1,8,0),(1317,NULL,2,1,8,0),(1318,NULL,13,1,8,0),(1319,NULL,8,1,8,0),(1320,NULL,14,1,8,0),(1321,NULL,9,1,8,0),(1322,NULL,15,1,8,0),(1323,NULL,68,1,8,0),(1324,NULL,18,1,8,0),(1325,NULL,23,1,8,0),(1326,NULL,29,1,8,0),(1327,NULL,21,1,8,0),(1328,NULL,27,1,8,0),(1329,NULL,33,1,8,0),(1330,NULL,19,1,8,0),(1331,NULL,25,1,8,0),(1332,NULL,31,1,8,0),(1333,NULL,24,1,8,0),(1334,NULL,30,1,8,0),(1335,NULL,22,1,8,0),(1336,NULL,28,1,8,0),(1337,NULL,34,1,8,0),(1338,NULL,20,1,8,0),(1339,NULL,26,1,8,0),(1340,NULL,32,1,8,0),(1341,NULL,3,1,8,0),(1342,NULL,42,1,8,0),(1343,NULL,43,1,8,0),(1344,NULL,52,1,8,0),(1345,NULL,48,1,8,0),(1346,NULL,49,1,8,0),(1347,NULL,51,1,8,0),(1348,NULL,47,1,8,0),(1349,NULL,45,1,8,0),(1350,NULL,46,1,8,0),(1351,NULL,50,1,8,0),(1352,NULL,44,1,8,0),(1353,NULL,67,1,8,0),(1354,NULL,57,1,8,0),(1355,NULL,58,1,8,0),(1356,NULL,59,1,8,0),(1357,NULL,65,1,8,0),(1358,NULL,64,1,8,0),(1359,NULL,69,1,8,0),(1360,NULL,62,1,8,0),(1361,NULL,63,1,8,0),(1362,NULL,60,1,8,0),(1363,NULL,61,1,8,0),(1364,NULL,66,1,8,0),(1365,NULL,53,1,8,0),(1366,NULL,54,1,8,0),(1367,NULL,55,1,8,0),(1368,NULL,56,1,8,0),(1369,NULL,10,1,8,0),(1370,NULL,16,1,8,0),(1371,NULL,11,1,8,0),(1372,NULL,17,1,8,0),(1373,NULL,35,1,8,0),(1374,NULL,39,1,8,0),(1375,NULL,37,1,8,0),(1376,NULL,36,1,8,0),(1377,NULL,40,1,8,0),(1378,NULL,38,1,8,0),(1379,NULL,41,1,8,0),(1380,NULL,6,1,8,0),(1381,NULL,4,1,10,0),(1382,NULL,5,1,10,0),(1383,NULL,7,1,10,0),(1384,NULL,1,1,10,0),(1385,NULL,12,1,10,0),(1386,NULL,2,1,10,0),(1387,NULL,13,1,10,0),(1388,NULL,8,1,10,0),(1389,NULL,14,1,10,0),(1390,NULL,9,1,10,0),(1391,NULL,15,1,10,0),(1392,NULL,68,1,10,0),(1393,NULL,18,1,10,0),(1394,NULL,23,1,10,0),(1395,NULL,29,1,10,0),(1396,NULL,21,1,10,0),(1397,NULL,27,1,10,0),(1398,NULL,33,1,10,0),(1399,NULL,19,1,10,0),(1400,NULL,25,1,10,0),(1401,NULL,31,1,10,0),(1402,NULL,24,1,10,0),(1403,NULL,30,1,10,0),(1404,NULL,22,1,10,0),(1405,NULL,28,1,10,0),(1406,NULL,34,1,10,0),(1407,NULL,20,1,10,0),(1408,NULL,26,1,10,0),(1409,NULL,32,1,10,0),(1410,NULL,3,1,10,0),(1411,NULL,42,1,10,0),(1412,NULL,43,1,10,0),(1413,NULL,52,1,10,0),(1414,NULL,48,1,10,0),(1415,NULL,49,1,10,0),(1416,NULL,51,1,10,0),(1417,NULL,47,1,10,0),(1418,NULL,45,1,10,0),(1419,NULL,46,1,10,0),(1420,NULL,50,1,10,0),(1421,NULL,44,1,10,0),(1422,NULL,67,1,10,0),(1423,NULL,57,1,10,0),(1424,NULL,58,1,10,0),(1425,NULL,59,1,10,0),(1426,NULL,65,1,10,0),(1427,NULL,64,1,10,0),(1428,NULL,69,1,10,0),(1429,NULL,62,1,10,0),(1430,NULL,63,1,10,0),(1431,NULL,60,1,10,0),(1432,NULL,61,1,10,0),(1433,NULL,66,1,10,0),(1434,NULL,53,1,10,0),(1435,NULL,54,1,10,0),(1436,NULL,55,1,10,0),(1437,NULL,56,1,10,0),(1438,NULL,10,1,10,0),(1439,NULL,16,1,10,0),(1440,NULL,11,1,10,0),(1441,NULL,17,1,10,0),(1442,NULL,35,1,10,0),(1443,NULL,39,1,10,0),(1444,NULL,37,1,10,0),(1445,NULL,36,1,10,0),(1446,NULL,40,1,10,0),(1447,NULL,38,1,10,0),(1448,NULL,41,1,10,0),(1449,NULL,6,1,10,0),(1450,NULL,4,1,9,0),(1451,NULL,5,1,9,0),(1452,NULL,7,1,9,0),(1453,NULL,1,1,9,0),(1454,NULL,12,1,9,0),(1455,NULL,2,1,9,0),(1456,NULL,13,1,9,0),(1457,NULL,8,1,9,0),(1458,NULL,14,1,9,0),(1459,NULL,9,1,9,0),(1460,NULL,15,1,9,0),(1461,NULL,68,1,9,0),(1462,NULL,18,1,9,0),(1463,NULL,23,1,9,0),(1464,NULL,29,1,9,0),(1465,NULL,21,1,9,0),(1466,NULL,27,1,9,0),(1467,NULL,33,1,9,0),(1468,NULL,19,1,9,0),(1469,NULL,25,1,9,0),(1470,NULL,31,1,9,0),(1471,NULL,24,1,9,0),(1472,NULL,30,1,9,0),(1473,NULL,22,1,9,0),(1474,NULL,28,1,9,0),(1475,NULL,34,1,9,0),(1476,NULL,20,1,9,0),(1477,NULL,26,1,9,0),(1478,NULL,32,1,9,0),(1479,NULL,3,1,9,0),(1480,NULL,42,1,9,0),(1481,NULL,43,1,9,0),(1482,NULL,52,1,9,0),(1483,NULL,48,1,9,0),(1484,NULL,49,1,9,0),(1485,NULL,51,1,9,0),(1486,NULL,47,1,9,0),(1487,NULL,45,1,9,0),(1488,NULL,46,1,9,0),(1489,NULL,50,1,9,0),(1490,NULL,44,1,9,0),(1491,NULL,67,1,9,0),(1492,NULL,57,1,9,0),(1493,NULL,58,1,9,0),(1494,NULL,59,1,9,0),(1495,NULL,65,1,9,0),(1496,NULL,64,1,9,0),(1497,NULL,69,1,9,0),(1498,NULL,62,1,9,0),(1499,NULL,63,1,9,0),(1500,NULL,60,1,9,0),(1501,NULL,61,1,9,0),(1502,NULL,66,1,9,0),(1503,NULL,53,1,9,0),(1504,NULL,54,1,9,0),(1505,NULL,55,1,9,0),(1506,NULL,56,1,9,0),(1507,NULL,10,1,9,0),(1508,NULL,16,1,9,0),(1509,NULL,11,1,9,0),(1510,NULL,17,1,9,0),(1511,NULL,35,1,9,0),(1512,NULL,39,1,9,0),(1513,NULL,37,1,9,0),(1514,NULL,36,1,9,0),(1515,NULL,40,1,9,0),(1516,NULL,38,1,9,0),(1517,NULL,41,1,9,0),(1518,NULL,6,1,9,0),(1519,NULL,4,1,8,0),(1520,NULL,5,1,8,0),(1521,NULL,7,1,8,0),(1522,NULL,1,1,8,0),(1523,NULL,12,1,8,0),(1524,NULL,2,1,8,0),(1525,NULL,13,1,8,0),(1526,NULL,8,1,8,0),(1527,NULL,14,1,8,0),(1528,NULL,9,1,8,0),(1529,NULL,15,1,8,0),(1530,NULL,68,1,8,0),(1531,NULL,18,1,8,0),(1532,NULL,23,1,8,0),(1533,NULL,29,1,8,0),(1534,NULL,21,1,8,0),(1535,NULL,27,1,8,0),(1536,NULL,33,1,8,0),(1537,NULL,19,1,8,0),(1538,NULL,25,1,8,0),(1539,NULL,31,1,8,0),(1540,NULL,24,1,8,0),(1541,NULL,30,1,8,0),(1542,NULL,22,1,8,0),(1543,NULL,28,1,8,0),(1544,NULL,34,1,8,0),(1545,NULL,20,1,8,0),(1546,NULL,26,1,8,0),(1547,NULL,32,1,8,0),(1548,NULL,3,1,8,0),(1549,NULL,42,1,8,0),(1550,NULL,43,1,8,0),(1551,NULL,52,1,8,0),(1552,NULL,48,1,8,0),(1553,NULL,49,1,8,0),(1554,NULL,51,1,8,0),(1555,NULL,47,1,8,0),(1556,NULL,45,1,8,0),(1557,NULL,46,1,8,0),(1558,NULL,50,1,8,0),(1559,NULL,44,1,8,0),(1560,NULL,67,1,8,0),(1561,NULL,57,1,8,0),(1562,NULL,58,1,8,0),(1563,NULL,59,1,8,0),(1564,NULL,65,1,8,0),(1565,NULL,64,1,8,0),(1566,NULL,69,1,8,0),(1567,NULL,62,1,8,0),(1568,NULL,63,1,8,0),(1569,NULL,60,1,8,0),(1570,NULL,61,1,8,0),(1571,NULL,66,1,8,0),(1572,NULL,53,1,8,0),(1573,NULL,54,1,8,0),(1574,NULL,55,1,8,0),(1575,NULL,56,1,8,0),(1576,NULL,10,1,8,0),(1577,NULL,16,1,8,0),(1578,NULL,11,1,8,0),(1579,NULL,17,1,8,0),(1580,NULL,35,1,8,0),(1581,NULL,39,1,8,0),(1582,NULL,37,1,8,0),(1583,NULL,36,1,8,0),(1584,NULL,40,1,8,0),(1585,NULL,38,1,8,0),(1586,NULL,41,1,8,0),(1587,NULL,6,1,8,0),(1588,NULL,4,1,10,0),(1589,NULL,5,1,10,0),(1590,NULL,7,1,10,0),(1591,NULL,1,1,10,0),(1592,NULL,12,1,10,0),(1593,NULL,2,1,10,0),(1594,NULL,13,1,10,0),(1595,NULL,8,1,10,0),(1596,NULL,14,1,10,0),(1597,NULL,9,1,10,0),(1598,NULL,15,1,10,0),(1599,NULL,68,1,10,0),(1600,NULL,18,1,10,0),(1601,NULL,23,1,10,0),(1602,NULL,29,1,10,0),(1603,NULL,21,1,10,0),(1604,NULL,27,1,10,0),(1605,NULL,33,1,10,0),(1606,NULL,19,1,10,0),(1607,NULL,25,1,10,0),(1608,NULL,31,1,10,0),(1609,NULL,24,1,10,0),(1610,NULL,30,1,10,0),(1611,NULL,22,1,10,0),(1612,NULL,28,1,10,0),(1613,NULL,34,1,10,0),(1614,NULL,20,1,10,0),(1615,NULL,26,1,10,0),(1616,NULL,32,1,10,0),(1617,NULL,3,1,10,0),(1618,NULL,42,1,10,0),(1619,NULL,43,1,10,0),(1620,NULL,52,1,10,0),(1621,NULL,48,1,10,0),(1622,NULL,49,1,10,0),(1623,NULL,51,1,10,0),(1624,NULL,47,1,10,0),(1625,NULL,45,1,10,0),(1626,NULL,46,1,10,0),(1627,NULL,50,1,10,0),(1628,NULL,44,1,10,0),(1629,NULL,67,1,10,0),(1630,NULL,57,1,10,0),(1631,NULL,58,1,10,0),(1632,NULL,59,1,10,0),(1633,NULL,65,1,10,0),(1634,NULL,64,1,10,0),(1635,NULL,69,1,10,0),(1636,NULL,62,1,10,0),(1637,NULL,63,1,10,0),(1638,NULL,60,1,10,0),(1639,NULL,61,1,10,0),(1640,NULL,66,1,10,0),(1641,NULL,53,1,10,0),(1642,NULL,54,1,10,0),(1643,NULL,55,1,10,0),(1644,NULL,56,1,10,0),(1645,NULL,10,1,10,0),(1646,NULL,16,1,10,0),(1647,NULL,11,1,10,0),(1648,NULL,17,1,10,0),(1649,NULL,35,1,10,0),(1650,NULL,39,1,10,0),(1651,NULL,37,1,10,0),(1652,NULL,36,1,10,0),(1653,NULL,40,1,10,0),(1654,NULL,38,1,10,0),(1655,NULL,41,1,10,0),(1656,NULL,6,1,10,0),(1657,NULL,4,1,9,0),(1658,NULL,5,1,9,0),(1659,NULL,7,1,9,0),(1660,NULL,1,1,9,0),(1661,NULL,12,1,9,0),(1662,NULL,2,1,9,0),(1663,NULL,13,1,9,0),(1664,NULL,8,1,9,0),(1665,NULL,14,1,9,0),(1666,NULL,9,1,9,0),(1667,NULL,15,1,9,0),(1668,NULL,68,1,9,0),(1669,NULL,18,1,9,0),(1670,NULL,23,1,9,0),(1671,NULL,29,1,9,0),(1672,NULL,21,1,9,0),(1673,NULL,27,1,9,0),(1674,NULL,33,1,9,0),(1675,NULL,19,1,9,0),(1676,NULL,25,1,9,0),(1677,NULL,31,1,9,0),(1678,NULL,24,1,9,0),(1679,NULL,30,1,9,0),(1680,NULL,22,1,9,0),(1681,NULL,28,1,9,0),(1682,NULL,34,1,9,0),(1683,NULL,20,1,9,0),(1684,NULL,26,1,9,0),(1685,NULL,32,1,9,0),(1686,NULL,3,1,9,0),(1687,NULL,42,1,9,0),(1688,NULL,43,1,9,0),(1689,NULL,52,1,9,0),(1690,NULL,48,1,9,0),(1691,NULL,49,1,9,0),(1692,NULL,51,1,9,0),(1693,NULL,47,1,9,0),(1694,NULL,45,1,9,0),(1695,NULL,46,1,9,0),(1696,NULL,50,1,9,0),(1697,NULL,44,1,9,0),(1698,NULL,67,1,9,0),(1699,NULL,57,1,9,0),(1700,NULL,58,1,9,0),(1701,NULL,59,1,9,0),(1702,NULL,65,1,9,0),(1703,NULL,64,1,9,0),(1704,NULL,69,1,9,0),(1705,NULL,62,1,9,0),(1706,NULL,63,1,9,0),(1707,NULL,60,1,9,0),(1708,NULL,61,1,9,0),(1709,NULL,66,1,9,0),(1710,NULL,53,1,9,0),(1711,NULL,54,1,9,0),(1712,NULL,55,1,9,0),(1713,NULL,56,1,9,0),(1714,NULL,10,1,9,0),(1715,NULL,16,1,9,0),(1716,NULL,11,1,9,0),(1717,NULL,17,1,9,0),(1718,NULL,35,1,9,0),(1719,NULL,39,1,9,0),(1720,NULL,37,1,9,0),(1721,NULL,36,1,9,0),(1722,NULL,40,1,9,0),(1723,NULL,38,1,9,0),(1724,NULL,41,1,9,0),(1725,NULL,6,1,9,0),(1726,NULL,4,1,8,0),(1727,NULL,5,1,8,0),(1728,NULL,7,1,8,0),(1729,NULL,1,1,8,0),(1730,NULL,12,1,8,0),(1731,NULL,2,1,8,0),(1732,NULL,13,1,8,0),(1733,NULL,8,1,8,0),(1734,NULL,14,1,8,0),(1735,NULL,9,1,8,0),(1736,NULL,15,1,8,0),(1737,NULL,68,1,8,0),(1738,NULL,18,1,8,0),(1739,NULL,23,1,8,0),(1740,NULL,29,1,8,0),(1741,NULL,21,1,8,0),(1742,NULL,27,1,8,0),(1743,NULL,33,1,8,0),(1744,NULL,19,1,8,0),(1745,NULL,25,1,8,0),(1746,NULL,31,1,8,0),(1747,NULL,24,1,8,0),(1748,NULL,30,1,8,0),(1749,NULL,22,1,8,0),(1750,NULL,28,1,8,0),(1751,NULL,34,1,8,0),(1752,NULL,20,1,8,0),(1753,NULL,26,1,8,0),(1754,NULL,32,1,8,0),(1755,NULL,3,1,8,0),(1756,NULL,42,1,8,0),(1757,NULL,43,1,8,0),(1758,NULL,52,1,8,0),(1759,NULL,48,1,8,0),(1760,NULL,49,1,8,0),(1761,NULL,51,1,8,0),(1762,NULL,47,1,8,0),(1763,NULL,45,1,8,0),(1764,NULL,46,1,8,0),(1765,NULL,50,1,8,0),(1766,NULL,44,1,8,0),(1767,NULL,67,1,8,0),(1768,NULL,57,1,8,0),(1769,NULL,58,1,8,0),(1770,NULL,59,1,8,0),(1771,NULL,65,1,8,0),(1772,NULL,64,1,8,0),(1773,NULL,69,1,8,0),(1774,NULL,62,1,8,0),(1775,NULL,63,1,8,0),(1776,NULL,60,1,8,0),(1777,NULL,61,1,8,0),(1778,NULL,66,1,8,0),(1779,NULL,53,1,8,0),(1780,NULL,54,1,8,0),(1781,NULL,55,1,8,0),(1782,NULL,56,1,8,0),(1783,NULL,10,1,8,0),(1784,NULL,16,1,8,0),(1785,NULL,11,1,8,0),(1786,NULL,17,1,8,0),(1787,NULL,35,1,8,0),(1788,NULL,39,1,8,0),(1789,NULL,37,1,8,0),(1790,NULL,36,1,8,0),(1791,NULL,40,1,8,0),(1792,NULL,38,1,8,0),(1793,NULL,41,1,8,0),(1794,NULL,6,1,8,0),(1795,NULL,4,1,10,0),(1796,NULL,5,1,10,0),(1797,NULL,7,1,10,0),(1798,NULL,1,1,10,0),(1799,NULL,12,1,10,0),(1800,NULL,2,1,10,0),(1801,NULL,13,1,10,0),(1802,NULL,8,1,10,0),(1803,NULL,14,1,10,0),(1804,NULL,9,1,10,0),(1805,NULL,15,1,10,0),(1806,NULL,68,1,10,0),(1807,NULL,18,1,10,0),(1808,NULL,23,1,10,0),(1809,NULL,29,1,10,0),(1810,NULL,21,1,10,0),(1811,NULL,27,1,10,0),(1812,NULL,33,1,10,0),(1813,NULL,19,1,10,0),(1814,NULL,25,1,10,0),(1815,NULL,31,1,10,0),(1816,NULL,24,1,10,0),(1817,NULL,30,1,10,0),(1818,NULL,22,1,10,0),(1819,NULL,28,1,10,0),(1820,NULL,34,1,10,0),(1821,NULL,20,1,10,0),(1822,NULL,26,1,10,0),(1823,NULL,32,1,10,0),(1824,NULL,3,1,10,0),(1825,NULL,42,1,10,0),(1826,NULL,43,1,10,0),(1827,NULL,52,1,10,0),(1828,NULL,48,1,10,0),(1829,NULL,49,1,10,0),(1830,NULL,51,1,10,0),(1831,NULL,47,1,10,0),(1832,NULL,45,1,10,0),(1833,NULL,46,1,10,0),(1834,NULL,50,1,10,0),(1835,NULL,44,1,10,0),(1836,NULL,67,1,10,0),(1837,NULL,57,1,10,0),(1838,NULL,58,1,10,0),(1839,NULL,59,1,10,0),(1840,NULL,65,1,10,0),(1841,NULL,64,1,10,0),(1842,NULL,69,1,10,0),(1843,NULL,62,1,10,0),(1844,NULL,63,1,10,0),(1845,NULL,60,1,10,0),(1846,NULL,61,1,10,0),(1847,NULL,66,1,10,0),(1848,NULL,53,1,10,0),(1849,NULL,54,1,10,0),(1850,NULL,55,1,10,0),(1851,NULL,56,1,10,0),(1852,NULL,10,1,10,0),(1853,NULL,16,1,10,0),(1854,NULL,11,1,10,0),(1855,NULL,17,1,10,0),(1856,NULL,35,1,10,0),(1857,NULL,39,1,10,0),(1858,NULL,37,1,10,0),(1859,NULL,36,1,10,0),(1860,NULL,40,1,10,0),(1861,NULL,38,1,10,0),(1862,NULL,41,1,10,0),(1863,NULL,6,1,10,0),(1864,'2019-11-20',4,1,9,100),(1865,'2019-11-20',5,1,9,0),(1866,'2019-11-20',7,1,9,0),(1867,'2019-11-20',1,1,9,0),(1868,'2019-11-20',12,1,9,0),(1869,'2019-11-20',2,1,9,0),(1870,'2019-11-20',13,1,9,0),(1871,'2019-11-20',8,1,9,0),(1872,'2019-11-20',14,1,9,0),(1873,'2019-11-20',9,1,9,0),(1874,'2019-11-20',15,1,9,0),(1875,'2019-11-20',68,1,9,0),(1876,'2019-11-20',18,1,9,0),(1877,'2019-11-20',23,1,9,0),(1878,'2019-11-20',29,1,9,0),(1879,'2019-11-20',21,1,9,0),(1880,'2019-11-20',27,1,9,0),(1881,'2019-11-20',33,1,9,0),(1882,'2019-11-20',19,1,9,0),(1883,'2019-11-20',25,1,9,0),(1884,'2019-11-20',31,1,9,0),(1885,'2019-11-20',24,1,9,0),(1886,'2019-11-20',30,1,9,0),(1887,'2019-11-20',22,1,9,0),(1888,'2019-11-20',28,1,9,0),(1889,'2019-11-20',34,1,9,0),(1890,'2019-11-20',20,1,9,0),(1891,'2019-11-20',26,1,9,0),(1892,'2019-11-20',32,1,9,0),(1893,'2019-11-20',3,1,9,0),(1894,'2019-11-20',42,1,9,0),(1895,'2019-11-20',43,1,9,0),(1896,'2019-11-20',52,1,9,0),(1897,'2019-11-20',48,1,9,0),(1898,'2019-11-20',49,1,9,0),(1899,'2019-11-20',51,1,9,0),(1900,'2019-11-20',47,1,9,0),(1901,'2019-11-20',45,1,9,0),(1902,'2019-11-20',46,1,9,0),(1903,'2019-11-20',50,1,9,0),(1904,'2019-11-20',44,1,9,0),(1905,'2019-11-20',67,1,9,0),(1906,'2019-11-20',57,1,9,0),(1907,'2019-11-20',58,1,9,0),(1908,'2019-11-20',59,1,9,0),(1909,'2019-11-20',65,1,9,0),(1910,'2019-11-20',64,1,9,0),(1911,'2019-11-20',69,1,9,0),(1912,'2019-11-20',62,1,9,0),(1913,'2019-11-20',63,1,9,0),(1914,'2019-11-20',60,1,9,0),(1915,'2019-11-20',61,1,9,0),(1916,'2019-11-20',66,1,9,0),(1917,'2019-11-20',53,1,9,0),(1918,'2019-11-20',54,1,9,0),(1919,'2019-11-20',55,1,9,0),(1920,'2019-11-20',56,1,9,0),(1921,'2019-11-20',10,1,9,0),(1922,'2019-11-20',16,1,9,0),(1923,'2019-11-20',11,1,9,0),(1924,'2019-11-20',17,1,9,0),(1925,'2019-11-20',35,1,9,0),(1926,'2019-11-20',39,1,9,0),(1927,'2019-11-20',37,1,9,0),(1928,'2019-11-20',36,1,9,0),(1929,'2019-11-20',40,1,9,0),(1930,'2019-11-20',38,1,9,0),(1931,'2019-11-20',41,1,9,0),(1932,'2019-11-20',6,1,9,0),(1933,'2019-11-20',4,1,8,0),(1934,'2019-11-20',5,1,8,5),(1935,'2019-11-20',7,1,8,50),(1936,'2019-11-20',1,1,8,98),(1937,'2019-11-20',12,1,8,0),(1938,'2019-11-20',2,1,8,44),(1939,'2019-11-20',13,1,8,0),(1940,'2019-11-20',8,1,8,93),(1941,'2019-11-20',14,1,8,0),(1942,'2019-11-20',9,1,8,72),(1943,'2019-11-20',15,1,8,0),(1944,'2019-11-20',68,1,8,30),(1945,'2019-11-20',18,1,8,122),(1946,'2019-11-20',23,1,8,0),(1947,'2019-11-20',29,1,8,1),(1948,'2019-11-20',21,1,8,2),(1949,'2019-11-20',27,1,8,0),(1950,'2019-11-20',33,1,8,0),(1951,'2019-11-20',19,1,8,3),(1952,'2019-11-20',25,1,8,0),(1953,'2019-11-20',31,1,8,0),(1954,'2019-11-20',24,1,8,0),(1955,'2019-11-20',30,1,8,0),(1956,'2019-11-20',22,1,8,0),(1957,'2019-11-20',28,1,8,0),(1958,'2019-11-20',34,1,8,0),(1959,'2019-11-20',20,1,8,0),(1960,'2019-11-20',26,1,8,0),(1961,'2019-11-20',32,1,8,0),(1962,'2019-11-20',3,1,8,150),(1963,'2019-11-20',42,1,8,16),(1964,'2019-11-20',43,1,8,3),(1965,'2019-11-20',52,1,8,0),(1966,'2019-11-20',48,1,8,5),(1967,'2019-11-20',49,1,8,0),(1968,'2019-11-20',51,1,8,2),(1969,'2019-11-20',47,1,8,0),(1970,'2019-11-20',45,1,8,7),(1971,'2019-11-20',46,1,8,0),(1972,'2019-11-20',50,1,8,24),(1973,'2019-11-20',44,1,8,0),(1974,'2019-11-20',67,1,8,13),(1975,'2019-11-20',57,1,8,1),(1976,'2019-11-20',58,1,8,280),(1977,'2019-11-20',59,1,8,504),(1978,'2019-11-20',65,1,8,11),(1979,'2019-11-20',64,1,8,0),(1980,'2019-11-20',69,1,8,0),(1981,'2019-11-20',62,1,8,60),(1982,'2019-11-20',63,1,8,155),(1983,'2019-11-20',60,1,8,234),(1984,'2019-11-20',61,1,8,118),(1985,'2019-11-20',66,1,8,0),(1986,'2019-11-20',53,1,8,60),(1987,'2019-11-20',54,1,8,0),(1988,'2019-11-20',55,1,8,86),(1989,'2019-11-20',56,1,8,0),(1990,'2019-11-20',10,1,8,53),(1991,'2019-11-20',16,1,8,42),(1992,'2019-11-20',11,1,8,71),(1993,'2019-11-20',17,1,8,24),(1994,'2019-11-20',35,1,8,0),(1995,'2019-11-20',39,1,8,0),(1996,'2019-11-20',37,1,8,0),(1997,'2019-11-20',36,1,8,0),(1998,'2019-11-20',40,1,8,0),(1999,'2019-11-20',38,1,8,0),(2000,'2019-11-20',41,1,8,24),(2001,'2019-11-20',6,1,8,6),(2002,'2019-11-20',4,1,10,0),(2003,'2019-11-20',5,1,10,0),(2004,'2019-11-20',7,1,10,0),(2005,'2019-11-20',1,1,10,0),(2006,'2019-11-20',12,1,10,0),(2007,'2019-11-20',2,1,10,20),(2008,'2019-11-20',13,1,10,0),(2009,'2019-11-20',8,1,10,0),(2010,'2019-11-20',14,1,10,0),(2011,'2019-11-20',9,1,10,0),(2012,'2019-11-20',15,1,10,0),(2013,'2019-11-20',68,1,10,0),(2014,'2019-11-20',18,1,10,0),(2015,'2019-11-20',23,1,10,0),(2016,'2019-11-20',29,1,10,0),(2017,'2019-11-20',21,1,10,0),(2018,'2019-11-20',27,1,10,0),(2019,'2019-11-20',33,1,10,0),(2020,'2019-11-20',19,1,10,0),(2021,'2019-11-20',25,1,10,0),(2022,'2019-11-20',31,1,10,0),(2023,'2019-11-20',24,1,10,0),(2024,'2019-11-20',30,1,10,0),(2025,'2019-11-20',22,1,10,0),(2026,'2019-11-20',28,1,10,0),(2027,'2019-11-20',34,1,10,0),(2028,'2019-11-20',20,1,10,0),(2029,'2019-11-20',26,1,10,0),(2030,'2019-11-20',32,1,10,0),(2031,'2019-11-20',3,1,10,0),(2032,'2019-11-20',42,1,10,0),(2033,'2019-11-20',43,1,10,0),(2034,'2019-11-20',52,1,10,0),(2035,'2019-11-20',48,1,10,0),(2036,'2019-11-20',49,1,10,0),(2037,'2019-11-20',51,1,10,2),(2038,'2019-11-20',47,1,10,0),(2039,'2019-11-20',45,1,10,0),(2040,'2019-11-20',46,1,10,0),(2041,'2019-11-20',50,1,10,3),(2042,'2019-11-20',44,1,10,0),(2043,'2019-11-20',67,1,10,0),(2044,'2019-11-20',57,1,10,0),(2045,'2019-11-20',58,1,10,0),(2046,'2019-11-20',59,1,10,0),(2047,'2019-11-20',65,1,10,0),(2048,'2019-11-20',64,1,10,0),(2049,'2019-11-20',69,1,10,1),(2050,'2019-11-20',62,1,10,0),(2051,'2019-11-20',63,1,10,0),(2052,'2019-11-20',60,1,10,60),(2053,'2019-11-20',61,1,10,10),(2054,'2019-11-20',66,1,10,0),(2055,'2019-11-20',53,1,10,0),(2056,'2019-11-20',54,1,10,0),(2057,'2019-11-20',55,1,10,1),(2058,'2019-11-20',56,1,10,0),(2059,'2019-11-20',10,1,10,0),(2060,'2019-11-20',16,1,10,0),(2061,'2019-11-20',11,1,10,0),(2062,'2019-11-20',17,1,10,0),(2063,'2019-11-20',35,1,10,0),(2064,'2019-11-20',39,1,10,0),(2065,'2019-11-20',37,1,10,0),(2066,'2019-11-20',36,1,10,0),(2067,'2019-11-20',40,1,10,0),(2068,'2019-11-20',38,1,10,0),(2069,'2019-11-20',41,1,10,0),(2070,'2019-11-20',6,1,10,0),(2071,'2019-11-01',4,1,9,100),(2072,'2019-11-01',5,1,9,0),(2073,'2019-11-01',7,1,9,0),(2074,'2019-11-01',1,1,9,0),(2075,'2019-11-01',12,1,9,0),(2076,'2019-11-01',2,1,9,0),(2077,'2019-11-01',13,1,9,0),(2078,'2019-11-01',8,1,9,0),(2079,'2019-11-01',14,1,9,0),(2080,'2019-11-01',9,1,9,0),(2081,'2019-11-01',15,1,9,0),(2082,'2019-11-01',68,1,9,0),(2083,'2019-11-01',18,1,9,0),(2084,'2019-11-01',23,1,9,0),(2085,'2019-11-01',29,1,9,0),(2086,'2019-11-01',21,1,9,0),(2087,'2019-11-01',27,1,9,0),(2088,'2019-11-01',33,1,9,0),(2089,'2019-11-01',19,1,9,0),(2090,'2019-11-01',25,1,9,0),(2091,'2019-11-01',31,1,9,0),(2092,'2019-11-01',24,1,9,0),(2093,'2019-11-01',30,1,9,0),(2094,'2019-11-01',22,1,9,0),(2095,'2019-11-01',28,1,9,0),(2096,'2019-11-01',34,1,9,0),(2097,'2019-11-01',20,1,9,0),(2098,'2019-11-01',26,1,9,0),(2099,'2019-11-01',32,1,9,0),(2100,'2019-11-01',3,1,9,0),(2101,'2019-11-01',42,1,9,0),(2102,'2019-11-01',43,1,9,0),(2103,'2019-11-01',52,1,9,0),(2104,'2019-11-01',48,1,9,0),(2105,'2019-11-01',49,1,9,0),(2106,'2019-11-01',51,1,9,0),(2107,'2019-11-01',47,1,9,0),(2108,'2019-11-01',45,1,9,0),(2109,'2019-11-01',46,1,9,0),(2110,'2019-11-01',50,1,9,0),(2111,'2019-11-01',44,1,9,0),(2112,'2019-11-01',67,1,9,0),(2113,'2019-11-01',57,1,9,0),(2114,'2019-11-01',58,1,9,0),(2115,'2019-11-01',59,1,9,0),(2116,'2019-11-01',65,1,9,0),(2117,'2019-11-01',64,1,9,0),(2118,'2019-11-01',69,1,9,0),(2119,'2019-11-01',62,1,9,0),(2120,'2019-11-01',63,1,9,0),(2121,'2019-11-01',60,1,9,0),(2122,'2019-11-01',61,1,9,0),(2123,'2019-11-01',66,1,9,0),(2124,'2019-11-01',53,1,9,0),(2125,'2019-11-01',54,1,9,0),(2126,'2019-11-01',55,1,9,0),(2127,'2019-11-01',56,1,9,0),(2128,'2019-11-01',10,1,9,0),(2129,'2019-11-01',16,1,9,0),(2130,'2019-11-01',11,1,9,0),(2131,'2019-11-01',17,1,9,0),(2132,'2019-11-01',35,1,9,0),(2133,'2019-11-01',39,1,9,0),(2134,'2019-11-01',37,1,9,0),(2135,'2019-11-01',36,1,9,0),(2136,'2019-11-01',40,1,9,0),(2137,'2019-11-01',38,1,9,0),(2138,'2019-11-01',41,1,9,0),(2139,'2019-11-01',6,1,9,0),(2140,'2019-11-01',4,1,8,0),(2141,'2019-11-01',5,1,8,0),(2142,'2019-11-01',7,1,8,0),(2143,'2019-11-01',1,1,8,0),(2144,'2019-11-01',12,1,8,0),(2145,'2019-11-01',2,1,8,0),(2146,'2019-11-01',13,1,8,0),(2147,'2019-11-01',8,1,8,0),(2148,'2019-11-01',14,1,8,0),(2149,'2019-11-01',9,1,8,0),(2150,'2019-11-01',15,1,8,0),(2151,'2019-11-01',68,1,8,0),(2152,'2019-11-01',18,1,8,0),(2153,'2019-11-01',23,1,8,0),(2154,'2019-11-01',29,1,8,0),(2155,'2019-11-01',21,1,8,0),(2156,'2019-11-01',27,1,8,0),(2157,'2019-11-01',33,1,8,0),(2158,'2019-11-01',19,1,8,0),(2159,'2019-11-01',25,1,8,0),(2160,'2019-11-01',31,1,8,0),(2161,'2019-11-01',24,1,8,0),(2162,'2019-11-01',30,1,8,0),(2163,'2019-11-01',22,1,8,0),(2164,'2019-11-01',28,1,8,0),(2165,'2019-11-01',34,1,8,0),(2166,'2019-11-01',20,1,8,0),(2167,'2019-11-01',26,1,8,0),(2168,'2019-11-01',32,1,8,0),(2169,'2019-11-01',3,1,8,0),(2170,'2019-11-01',42,1,8,0),(2171,'2019-11-01',43,1,8,0),(2172,'2019-11-01',52,1,8,0),(2173,'2019-11-01',48,1,8,0),(2174,'2019-11-01',49,1,8,0),(2175,'2019-11-01',51,1,8,0),(2176,'2019-11-01',47,1,8,0),(2177,'2019-11-01',45,1,8,0),(2178,'2019-11-01',46,1,8,0),(2179,'2019-11-01',50,1,8,0),(2180,'2019-11-01',44,1,8,0),(2181,'2019-11-01',67,1,8,0),(2182,'2019-11-01',57,1,8,0),(2183,'2019-11-01',58,1,8,0),(2184,'2019-11-01',59,1,8,0),(2185,'2019-11-01',65,1,8,0),(2186,'2019-11-01',64,1,8,0),(2187,'2019-11-01',69,1,8,0),(2188,'2019-11-01',62,1,8,0),(2189,'2019-11-01',63,1,8,0),(2190,'2019-11-01',60,1,8,0),(2191,'2019-11-01',61,1,8,0),(2192,'2019-11-01',66,1,8,0),(2193,'2019-11-01',53,1,8,0),(2194,'2019-11-01',54,1,8,0),(2195,'2019-11-01',55,1,8,0),(2196,'2019-11-01',56,1,8,0),(2197,'2019-11-01',10,1,8,0),(2198,'2019-11-01',16,1,8,0),(2199,'2019-11-01',11,1,8,0),(2200,'2019-11-01',17,1,8,0),(2201,'2019-11-01',35,1,8,0),(2202,'2019-11-01',39,1,8,0),(2203,'2019-11-01',37,1,8,0),(2204,'2019-11-01',36,1,8,0),(2205,'2019-11-01',40,1,8,0),(2206,'2019-11-01',38,1,8,0),(2207,'2019-11-01',41,1,8,0),(2208,'2019-11-01',6,1,8,0),(2209,'2019-11-01',4,1,10,0),(2210,'2019-11-01',5,1,10,0),(2211,'2019-11-01',7,1,10,0),(2212,'2019-11-01',1,1,10,0),(2213,'2019-11-01',12,1,10,0),(2214,'2019-11-01',2,1,10,0),(2215,'2019-11-01',13,1,10,0),(2216,'2019-11-01',8,1,10,0),(2217,'2019-11-01',14,1,10,0),(2218,'2019-11-01',9,1,10,0),(2219,'2019-11-01',15,1,10,0),(2220,'2019-11-01',68,1,10,0),(2221,'2019-11-01',18,1,10,0),(2222,'2019-11-01',23,1,10,0),(2223,'2019-11-01',29,1,10,0),(2224,'2019-11-01',21,1,10,0),(2225,'2019-11-01',27,1,10,0),(2226,'2019-11-01',33,1,10,0),(2227,'2019-11-01',19,1,10,0),(2228,'2019-11-01',25,1,10,0),(2229,'2019-11-01',31,1,10,0),(2230,'2019-11-01',24,1,10,0),(2231,'2019-11-01',30,1,10,0),(2232,'2019-11-01',22,1,10,0),(2233,'2019-11-01',28,1,10,0),(2234,'2019-11-01',34,1,10,0),(2235,'2019-11-01',20,1,10,0),(2236,'2019-11-01',26,1,10,0),(2237,'2019-11-01',32,1,10,0),(2238,'2019-11-01',3,1,10,0),(2239,'2019-11-01',42,1,10,0),(2240,'2019-11-01',43,1,10,0),(2241,'2019-11-01',52,1,10,0),(2242,'2019-11-01',48,1,10,0),(2243,'2019-11-01',49,1,10,0),(2244,'2019-11-01',51,1,10,0),(2245,'2019-11-01',47,1,10,0),(2246,'2019-11-01',45,1,10,0),(2247,'2019-11-01',46,1,10,0),(2248,'2019-11-01',50,1,10,0),(2249,'2019-11-01',44,1,10,0),(2250,'2019-11-01',67,1,10,0),(2251,'2019-11-01',57,1,10,0),(2252,'2019-11-01',58,1,10,0),(2253,'2019-11-01',59,1,10,0),(2254,'2019-11-01',65,1,10,0),(2255,'2019-11-01',64,1,10,0),(2256,'2019-11-01',69,1,10,0),(2257,'2019-11-01',62,1,10,0),(2258,'2019-11-01',63,1,10,0),(2259,'2019-11-01',60,1,10,0),(2260,'2019-11-01',61,1,10,0),(2261,'2019-11-01',66,1,10,0),(2262,'2019-11-01',53,1,10,0),(2263,'2019-11-01',54,1,10,0),(2264,'2019-11-01',55,1,10,0),(2265,'2019-11-01',56,1,10,0),(2266,'2019-11-01',10,1,10,0),(2267,'2019-11-01',16,1,10,0),(2268,'2019-11-01',11,1,10,0),(2269,'2019-11-01',17,1,10,0),(2270,'2019-11-01',35,1,10,0),(2271,'2019-11-01',39,1,10,0),(2272,'2019-11-01',37,1,10,0),(2273,'2019-11-01',36,1,10,0),(2274,'2019-11-01',40,1,10,0),(2275,'2019-11-01',38,1,10,0),(2276,'2019-11-01',41,1,10,0),(2277,'2019-11-01',6,1,10,0),(2278,'2019-11-20',70,1,9,0),(2279,'2019-11-20',70,1,8,1),(2280,'2019-11-20',70,1,10,0);

/*Table structure for table `oil_return_store` */

DROP TABLE IF EXISTS `oil_return_store`;

CREATE TABLE `oil_return_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_return_store` */

insert  into `oil_return_store`(`id`,`organization_id`,`store_id`) values (1,1,10);

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
  `is_calculate_agency_commission` int(1) DEFAULT '1' COMMENT '0:khong tinh, 1:tinh CK cho dai ly',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale` */

insert  into `oil_sale`(`id`,`code`,`created_date`,`customer_id`,`commission`,`commission_kind`,`commission_amount`,`gap_agency_amount`,`gap_customer_amount`,`total_before_commission`,`total`,`discount`,`total_pay`,`paid`,`debt`,`account_id`,`note`,`created_employee_id`,`is_calculate_agency_commission`) values (1,'20191126-SO-0001','2019-11-26',322,20,1,0,0,0,0,11400000,0,11400000,0,11400000,5,'',20,1),(3,'20191127-SO-0002','2019-11-27',286,0,1,0,0,0,0,21264000,0,21264000,0,21264000,5,'',20,1);

/*Table structure for table `oil_sale_detail` */

DROP TABLE IF EXISTS `oil_sale_detail`;

CREATE TABLE `oil_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_sale_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `base_quantity` int(3) DEFAULT NULL,
  `price_before_commission` double DEFAULT '0',
  `commission_price` float DEFAULT '0' COMMENT 'chiet khau truc tiep tren gia',
  `price` double DEFAULT '0',
  `first_amount` double DEFAULT '0',
  `commission` float DEFAULT '0' COMMENT 'chiet khau tren tung mat hang',
  `gap_agency_amount` double DEFAULT '0' COMMENT 'tien chenh lech cua dai ly',
  `gap_customer_amount` double DEFAULT '0' COMMENT 'tien chenh lech cua khach hang',
  `amount` double DEFAULT '0',
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale_detail` */

insert  into `oil_sale_detail`(`id`,`oil_sale_id`,`oil_id`,`unit_id`,`store_id`,`quantity`,`base_quantity`,`price_before_commission`,`commission_price`,`price`,`first_amount`,`commission`,`gap_agency_amount`,`gap_customer_amount`,`amount`,`vendor_id`) values (1,1,43,14,8,1,1,14250000,20,11400000,11400000,0,0,0,11400000,20),(3,3,6,14,8,1,1,11690000,20,9352000,9352000,0,0,0,9352000,20);

/*Table structure for table `oil_sale_promotion` */

DROP TABLE IF EXISTS `oil_sale_promotion`;

CREATE TABLE `oil_sale_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_oil_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `base_quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale_promotion` */

insert  into `oil_sale_promotion`(`id`,`sale_oil_id`,`oil_id`,`unit_id`,`store_id`,`quantity`,`base_quantity`) values (1,3,4,13,9,0,0),(2,3,4,13,9,0,0);

/*Table structure for table `oil_sale_return` */

DROP TABLE IF EXISTS `oil_sale_return`;

CREATE TABLE `oil_sale_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `oil_sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `commission_kind` int(11) DEFAULT NULL,
  `commission_amount` double DEFAULT NULL,
  `gap_agency_amount` double DEFAULT NULL,
  `gap_customer_amount` double DEFAULT NULL,
  `total_before_commission` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale_return` */

/*Table structure for table `oil_sale_return_detail` */

DROP TABLE IF EXISTS `oil_sale_return_detail`;

CREATE TABLE `oil_sale_return_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_sale_return_id` int(11) DEFAULT NULL,
  `oil_sale_detail_id` int(11) DEFAULT NULL,
  `oil_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `base_quantity` int(3) DEFAULT NULL,
  `price_before_commission` double DEFAULT NULL,
  `commission_price` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `first_amount` double DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `gap_agency_amount` double DEFAULT NULL,
  `gap_customer_amount` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `oil_sale_return_detail` */

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `other_bonus` */

/*Table structure for table `panelty` */

DROP TABLE IF EXISTS `panelty`;

CREATE TABLE `panelty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `panelty` */

insert  into `panelty`(`id`,`name`,`organization_id`,`note`) values (4,'Điện thoại',1,' '),(5,'Phạt',1,'');

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

insert  into `parameter`(`id`,`code`,`name`,`value`,`note`,`is_show`) values (3,'startdate','Ngày bắt đầu sử dụng','01/01/2018',NULL,0),(2,'mailbeforeday','Số ngày nhắc mail trước sinh nhật','3',NULL,1),(4,'insurancepersonal','Bảo hiểm xã hội - Nhân viên đóng (%)','8',NULL,1),(5,'insurancecompany','Bảo hiểm xã hội - Công ty đóng (%)','17',NULL,1),(6,'seniallowday','Số ngày nhắc mail trước khi thay đổi thâm niên','2',NULL,1),(7,'lovo','Lò vỏ','150000',NULL,1),(8,'100km','Số lít dầu cho 100 km','28',NULL,1),(9,'1000kggas','Số lít dầu cho 1000 kg gas','1',NULL,1),(10,'dayoffperyear','Số ngày nghỉ phép trong năm','12',NULL,1);

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

insert  into `permission`(`id`,`name`,`note`,`users`,`organizations`) values (8,'admin','Quyền quản trị hệ thống','1','1,14'),(12,'Admin Hưng Thịnh','','15','14'),(11,'Admin Quang Trung','','11,13,14','1');

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

insert  into `permission_detail`(`id`,`permission_id`,`operation`,`function`) values (17,8,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(16,8,1,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(18,8,3,'1,5,8,4,13,14,53,54,15,20,22,23,51,52,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(19,8,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(20,8,6,'56'),(40,12,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(37,12,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(35,11,8,'20,109,52,101,102,26,27,59,28,30,31,32,33,37,117,128,118,126,76,77,34,36,95,38,39,40,42,43,44,45,46,48,49,50,60,61,93'),(36,11,6,'56,130,57,89,81,62,63,69,64,65,88,86,94,92,66,67,68,79,80,97,71,72,73,74,78,84,85,87,91,103,104,105,107,119,120,121,122,123,124,131,125,129,132'),(38,12,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(39,12,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,90,56,46,48,49,50,60,61'),(34,11,4,'1,5,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,128,118,126,127,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,130,46,48,49,50,60,61,93'),(33,11,3,'1,5,8,4,13,98,99,100,14,53,54,15,58,70,20,109,22,23,51,52,101,102,110,116,25,108,106,26,27,59,28,29,30,31,32,33,37,117,128,118,126,76,77,34,36,55,95,38,39,40,42,82,43,44,45,90,56,130,46,48,49,50,60,61,93'),(32,11,2,'1,5,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,128,118,126,127,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,130,46,48,49,50,60,61,93'),(31,11,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,98,99,100,14,53,54,15,16,17,18,19,58,70,20,109,22,23,51,52,101,102,21,24,75,110,111,112,116,113,25,108,106,26,27,59,28,29,30,31,32,33,37,117,128,118,126,76,77,34,96,36,55,95,38,39,40,42,82,43,44,45,90,56,130,46,48,49,50,60,61,93'),(41,12,8,'20,52,26,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(42,12,6,'56,57,89,81,62,63,69,64,65,88,92,66,67,68,79,80,71,72,73,74,78,84,85,87,91');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_in_stock` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_in_stock` */

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell` */

insert  into `shell`(`id`,`kind_id`,`code`,`name`,`price`,`unit_id`,`status`) values (1,38,'ST12X','Star Gas 12kg sơn xám',0,4,1),(2,39,'ST45X','Start Gas 45kg sơn xám',200000,4,1),(3,38,'Pet','Petimex',150000,4,1),(8,38,'MAIKHE','MAI KHÊ GAS',0,4,1),(9,38,'ST12H','Star Gas 12kg sơn hồng',0,4,1),(10,39,'ST45H','Star Gas 45kg sơn hồng',0,4,1),(11,38,'AGAS','AGAS',0,4,1),(12,38,'NVP, VL','NVP; Vạn Lộc',0,4,1),(13,38,'VANLOC','VẠN LỘC GAS',0,4,2),(14,38,'GIADINH','GIA ĐÌNH GAS',0,4,1),(15,38,'HGAS','H GAS',0,4,1),(16,38,'HOANGAN','HOÀNG ÂN GAS',0,4,1),(17,38,'MT','MT GAS',0,4,1),(18,38,'ORIGIN','ORIGIN GAS',0,4,1),(19,38,'ONIC','ONIC GAS',0,4,1),(20,38,'PACIFIC','PACIFIC GAS',0,4,1),(21,38,'PETIMEX','PETIMEX GAS',0,4,1),(22,38,'PETROLIMEX','PETROLIMEX GAS',0,4,1),(23,38,'PETROVIETNAM','PETROVIETNAM GAS',0,4,2),(24,38,'SAIGONPETRO','SAIGON PETRO GAS',0,4,1),(25,38,'SAIGONGAS','SAIGON GAS',0,4,1),(26,38,'SHELLGAS','SHELL GAS',0,4,1),(27,38,'SOPET','SOPET GAS',0,4,1),(28,38,'THAILAN','THAILAN GAS',0,4,1),(29,38,'TOTAL','TOTAL GAS',0,4,2),(30,38,'VINA','VINA GAS',0,4,2),(31,38,'ELF;TT;VN','TOTAL,VINA, ELF',0,4,1),(32,38,'HIEPHUONG','HIỆP HƯƠNG GAS',0,4,1),(33,38,'THUDUC','THỦ ĐỨC GAS',0,4,1),(34,38,'UNIQUE','UNIQUE GAS',0,4,1),(35,38,'VGAS','V GAS',0,4,2),(36,38,'PM, VG','PM, V Gas',0,4,1),(37,38,'VIMEXCO','VIMEXCO GAS',0,4,1),(38,38,'VINASHIN','VINASHIN GAS',0,4,1),(39,38,'VT','VT GAS',0,4,1),(40,38,'VOTAP','VỎ TẠP CÁC LOẠI',0,4,1),(41,38,'VOVECHAI','VỎ VE CHAI',0,4,1),(42,38,'PETROL VN','PETROL VN',0,4,1),(43,38,'SP','SÀI GÒN PETROL',0,4,1),(44,38,'TTA','THÀNH TÀI GAS',0,4,1),(45,38,'PTNAS','Petrol Nas',0,4,1);

/*Table structure for table `shell_gas_in_stock` */

DROP TABLE IF EXISTS `shell_gas_in_stock`;

CREATE TABLE `shell_gas_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `shell_vendor_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_gas_in_stock` */

insert  into `shell_gas_in_stock`(`id`,`day`,`shell_vendor_id`,`in_stock`) values (1,'2019-10-21',5,0),(2,'2019-10-21',1,647),(3,'2019-10-21',2,0),(4,'2019-10-21',4,34),(5,'2019-11-25',5,0),(6,'2019-11-25',1,902),(7,'2019-11-25',2,0),(8,'2019-11-25',4,2);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_in_stock` */

insert  into `shell_in_stock`(`id`,`day`,`organization_id`,`shell_id`,`in_stock`) values (1,NULL,1,11,0),(2,NULL,1,14,0),(3,NULL,1,15,1),(4,NULL,1,32,0),(5,NULL,1,16,0),(6,NULL,1,8,0),(7,NULL,1,17,0),(8,NULL,1,12,2),(9,NULL,1,19,3),(10,NULL,1,18,0),(11,NULL,1,20,0),(12,NULL,1,3,0),(13,NULL,1,21,0),(14,NULL,1,42,4),(15,NULL,1,22,0),(16,NULL,1,36,5),(17,NULL,1,43,1),(18,NULL,1,25,0),(19,NULL,1,24,0),(20,NULL,1,26,0),(21,NULL,1,27,0),(22,NULL,1,9,0),(23,NULL,1,1,-9),(24,NULL,1,10,0),(25,NULL,1,2,6),(26,NULL,1,28,7),(27,NULL,1,44,0),(28,NULL,1,33,0),(29,NULL,1,31,1),(30,NULL,1,34,1),(31,NULL,1,37,0),(32,NULL,1,38,5),(33,NULL,1,40,0),(34,NULL,1,41,0),(35,NULL,1,39,0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_sale` */

insert  into `shell_sale`(`id`,`code`,`created_date`,`customer_id`,`total`,`discount`,`paid`,`debt`,`total_pay`,`account_id`,`note`,`created_employee_id`) values (1,'20191023-SS-0001','2019-10-22',224,400000,0,400000,0,400000,5,'',35),(2,'20191023-SS-0002','2019-10-22',211,190000,0,190000,0,190000,5,'',35),(3,'20191023-SS-0003','2019-10-22',142,800000,0,800000,0,800000,5,'',35);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_sale_detail` */

insert  into `shell_sale_detail`(`id`,`shell_sale_id`,`shell_id`,`quantity`,`price`,`amount`) values (1,1,1,2,200000,400000),(2,2,1,1,190000,190000),(3,3,1,4,200000,800000);

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_vendor` */

insert  into `shell_vendor`(`id`,`organization_id`,`shell_id`,`vendor_id`,`quantity`) values (1,1,1,22,1),(2,1,10,22,1),(3,1,11,22,0),(4,1,2,22,1),(5,1,9,22,1),(6,1,29,22,0),(7,1,3,22,0),(8,1,8,22,0),(9,1,12,22,0),(10,1,13,22,0),(11,1,14,22,0),(12,1,15,22,0),(13,1,16,22,0),(14,1,17,22,0),(15,1,18,22,0),(16,1,19,22,0),(17,1,20,22,0),(18,1,21,22,0),(19,1,22,22,0),(20,1,23,22,0),(21,1,24,22,0),(22,1,25,22,0),(23,1,26,22,0),(24,1,27,22,0),(25,1,28,22,0),(26,1,30,22,0),(27,1,31,22,0),(28,1,32,22,0),(29,1,33,22,0),(30,1,34,22,0),(31,1,35,22,0),(32,1,36,22,0),(33,1,37,22,0),(34,1,38,22,0),(35,1,39,22,0),(36,1,40,22,0),(37,1,41,22,0),(38,1,42,22,0),(39,1,43,22,0),(40,1,44,22,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_in_stock` */

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

insert  into `store`(`id`,`code`,`name`,`organization_id`,`status`,`is_petro`,`is_good`,`is_oil`) values (6,'QTK2','Kho cửa hàng Thái Bảo',1,1,1,0,0),(4,'QTK1','Trạm chiết nạp khí hoá lỏng LPG Quang Trung',1,1,1,0,0),(7,'KTG','Kho trạm gas',1,1,0,1,0),(8,'KDQT','Kho dầu Quang Trung',1,1,0,0,1),(9,'KDHT','Kho dầu Hưng Thịnh',1,1,0,0,1),(10,'KDT','Kho dầu trả hàng',1,1,0,0,1);

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
  `kind` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_oil_commission_id` int(11) DEFAULT NULL,
  `quantity_employee_oil_commission` int(11) DEFAULT NULL,
  `commission_employee_oil_commission` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `temp_gas_commission` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transport_service` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_fee` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_oil` */

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit` */

insert  into `unit`(`id`,`name`,`status`) values (6,'Thùng 6',1),(5,'Lít',1),(4,'Bình',1),(7,'Cái',1),(8,'Bộ',1),(9,'Kg',1),(10,'Thùng 12',1),(11,'Thùng 24',1),(12,'Xô',1),(13,'Bịch',1),(14,'Phuy',1),(15,'Can',1);

/*Table structure for table `unit_rate` */

DROP TABLE IF EXISTS `unit_rate`;

CREATE TABLE `unit_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_unit_id` int(11) DEFAULT NULL,
  `parent_unit_id` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit_rate` */

insert  into `unit_rate`(`id`,`base_unit_id`,`parent_unit_id`,`rate`) values (1,4,6,6),(2,4,10,12),(3,4,11,24);

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`employee_id`,`username`,`password`,`menu`,`status`) values (1,1,'tu','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Xuất xe về\"><item id=\"vehicleinlist\" text=\"Danh sách xuất xe về\"/><item id=\"vehicleinadd\" text=\"Thêm xuất xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán sỉ gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán sỉ gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán sỉ gas\"/></item><item id=\"gasretails\" complex=\"true\" text=\"Bán lẻ gas\"><item id=\"gasretaillist\" text=\"Danh sách phiếu bán lẻ gas\"/><item id=\"gasretailadd\" text=\"Thêm phiếu bán lẻ gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"gasreturns\" complex=\"true\" text=\"Trả gas\"><item id=\"gasreturnlist\" text=\"Danh sách trả gas\"/><item id=\"gasreturnadd\" text=\"Thêm trả gas\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"petroimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtretails\" complex=\"true\" text=\"Công nợ bán lẻ\"><item id=\"debtretaillist\" text=\"Danh sách công nợ bán lẻ\"/><item id=\"debtretailadd\" text=\"Thêm công nợ bán lẻ\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ bán sỉ\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ bán sỉ\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ bán sỉ\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(11,17,'hungpk','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item><item id=\"dayoffs\" complex=\"true\" text=\"Ngày nghỉ bù\"><item id=\"dayofflist\" text=\"Danh sách ngày nghỉ bù\"/><item id=\"dayoffadd\" text=\"Thêm ngày nghỉ bù\"/></item><item id=\"otherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"otherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"otherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"paneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"paneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"paneltyadd\" text=\"Thêm khoản chi khác\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"oil\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"vendoroils\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendoroillist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoroiladd\" text=\"Thêm nhà cung cấp\"/></item><item id=\"unitrates\" complex=\"true\" text=\"Qui đổi đơn vị tính\"><item id=\"unitratelist\" text=\"Danh sách qui đổi đơn vị tính\"/><item id=\"unitrateadd\" text=\"Thêm qui đổi đơn vị tính\"/></item><item id=\"agencys\" complex=\"true\" text=\"Đại lý\"><item id=\"agencylist\" text=\"Danh sách đại lý\"/><item id=\"agencyadd\" text=\"Thêm đại lý\"/></item><item id=\"oilgroups\" complex=\"true\" text=\"Nhóm dầu nhớt\"><item id=\"oilgrouplist\" text=\"Danh sách nhóm dầu nhớt\"/><item id=\"oilgroupadd\" text=\"Thêm nhóm dầu nhớt\"/></item><item id=\"oils\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"oillist\" text=\"Danh sách dầu nhớt\"/><item id=\"oiladd\" text=\"Thêm dầu nhớt\"/></item><item id=\"employeeoilcommissions\" complex=\"true\" text=\"Loại chiết khấu bán dầu nhớt\"><item id=\"employeeoilcommissionlist\" text=\"Danh sách loại chiết khấu bán dầu nhớt\"/><item id=\"employeeoilcommissionadd\" text=\"Thêm loại chiết khấu bán dầu nhớt\"/></item><item id=\"saleoilreturnstores\" complex=\"true\" text=\"Kho trả hàng dầu nhớt\"><item id=\"saleoilreturnstoreadd\" text=\"Thêm kho trả hàng dầu nhớt\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Giảm giá\"><item id=\"discountlist\" text=\"Danh sách giảm giá\"/><item id=\"discountadd\" text=\"Thêm giảm giá\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"borrows\" complex=\"true\" text=\"Mượn lương\"><item id=\"borrowlist\" text=\"Danh sách phiếu mượn lương\"/><item id=\"borrowadd\" text=\"Thêm phiếu mượn lương\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"employeeotherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"employeeotherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"employeeotherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"employeepaneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"employeepaneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"employeepaneltyadd\" text=\"Thêm khoản chi khác\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"tripoils\" complex=\"true\" text=\"Ứng dầu\"><item id=\"tripoillist\" text=\"Danh sách ứng dầu\"/><item id=\"tripoiladd\" text=\"Thêm ứng dầu\"/></item><item id=\"employeeroutefees\" complex=\"true\" text=\"Chi phí nhân viên vận chuyển\"><item id=\"employeeroutefeelist\" text=\"Danh sách chi phí nhân viên vận chuyển\"/><item id=\"employeeroutefeeadd\" text=\"Thêm chi phí nhân viên vận chuyển\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"oilimports\" complex=\"true\" text=\"Nhập dầu nhớt\"><item id=\"oilimportlist\" text=\"Danh sách phiếu nhập dầu nhớt\"/><item id=\"oilimportadd\" text=\"Thêm phiếu nhập dầu nhớt\"/></item><item id=\"saleoils\" complex=\"true\" text=\"Bán dầu nhớt\"><item id=\"saleoillist\" text=\"Danh sách phiếu bán dầu nhớt\"/><item id=\"saleoiladd\" text=\"Thêm phiếu bán dầu nhớt\"/></item><item id=\"oilexports\" complex=\"true\" text=\"Xuất kho dầu nhớt\"><item id=\"oilexportlist\" text=\"Danh sách phiếu xuất kho dầu nhớt\"/></item><item id=\"saleoilreturns\" complex=\"true\" text=\"Trả hàng dầu nhớt\"><item id=\"saleoilreturnlist\" text=\"Danh sách phiếu trả hàng dầu nhớt\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"invoices\" complex=\"true\" text=\"Hóa đơn\"><item id=\"invoicelist\" text=\"Danh sách hóa đơn\"/><item id=\"invoiceadd\" text=\"Thêm hóa đơn\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng LPG\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reportoil\" complex=\"true\" text=\"Báo cáo dầu nhớt\"><item id=\"reportoilimport\" text=\"Báo cáo nhập dầu nhớt\"/><item id=\"reportoilstock\" text=\"Báo cáo nhập xuất tồn dầu nhớt\"/><item id=\"reportoilstockh\" text=\"Báo cáo nhập xuất tồn dầu nhớt - Ngang\"/><item id=\"reportoilstocksum\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt\"/><item id=\"reportoilstocksumh\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt - Ngang\"/><item id=\"reportoilsale\" text=\"Báo cáo bán hàng dầu nhớt\"/><item id=\"reportoilcompare\" text=\"Đối chiếu dầu nhớt\"/><item id=\"reportoilcommissionagency\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt đại lý\"/><item id=\"reportoilcommissioncustomer\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt khách hàng\"/><item id=\"reportoilvendorstock\" text=\"Bảng theo dõi nhập xuất tồn tổng kho\"/><item id=\"reportoilvendordebt\" text=\"Bảng theo dõi công nợ nhà cung cấp\"/><item id=\"reportoilcustomerdebt\" text=\"Bảng theo dõi công nợ khách hàng dầu nhớt\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item><item id=\"reportaccountant\" complex=\"true\" text=\"Báo cáo kế toán\"><item id=\"reportemployeesalary\" text=\"Bảng thanh toán lương\"/><item id=\"reportemployeeoff\" text=\"Bảng theo dõi ngày nghỉ phép\"/><item id=\"reportemployeeworking\" text=\"Bảng theo dõi thời gian công tác\"/><item id=\"reportemployeevehiclesalary\" text=\"Bảng lương nhân viên vận chuyển\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(12,18,'ntb','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(14,35,'linhle','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item><item id=\"dayoffs\" complex=\"true\" text=\"Ngày nghỉ bù\"><item id=\"dayofflist\" text=\"Danh sách ngày nghỉ bù\"/><item id=\"dayoffadd\" text=\"Thêm ngày nghỉ bù\"/></item><item id=\"otherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"otherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"otherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"paneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"paneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"paneltyadd\" text=\"Thêm khoản chi khác\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"oil\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"vendoroils\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendoroillist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoroiladd\" text=\"Thêm nhà cung cấp\"/></item><item id=\"unitrates\" complex=\"true\" text=\"Qui đổi đơn vị tính\"><item id=\"unitratelist\" text=\"Danh sách qui đổi đơn vị tính\"/><item id=\"unitrateadd\" text=\"Thêm qui đổi đơn vị tính\"/></item><item id=\"agencys\" complex=\"true\" text=\"Đại lý\"><item id=\"agencylist\" text=\"Danh sách đại lý\"/><item id=\"agencyadd\" text=\"Thêm đại lý\"/></item><item id=\"oilgroups\" complex=\"true\" text=\"Nhóm dầu nhớt\"><item id=\"oilgrouplist\" text=\"Danh sách nhóm dầu nhớt\"/><item id=\"oilgroupadd\" text=\"Thêm nhóm dầu nhớt\"/></item><item id=\"oils\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"oillist\" text=\"Danh sách dầu nhớt\"/><item id=\"oiladd\" text=\"Thêm dầu nhớt\"/></item><item id=\"employeeoilcommissions\" complex=\"true\" text=\"Loại chiết khấu bán dầu nhớt\"><item id=\"employeeoilcommissionlist\" text=\"Danh sách loại chiết khấu bán dầu nhớt\"/><item id=\"employeeoilcommissionadd\" text=\"Thêm loại chiết khấu bán dầu nhớt\"/></item><item id=\"saleoilreturnstores\" complex=\"true\" text=\"Kho trả hàng dầu nhớt\"><item id=\"saleoilreturnstoreadd\" text=\"Thêm kho trả hàng dầu nhớt\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Giảm giá\"><item id=\"discountlist\" text=\"Danh sách giảm giá\"/><item id=\"discountadd\" text=\"Thêm giảm giá\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"borrows\" complex=\"true\" text=\"Mượn lương\"><item id=\"borrowlist\" text=\"Danh sách phiếu mượn lương\"/><item id=\"borrowadd\" text=\"Thêm phiếu mượn lương\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"employeeotherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"employeeotherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"employeeotherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"employeepaneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"employeepaneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"employeepaneltyadd\" text=\"Thêm khoản chi khác\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"tripoils\" complex=\"true\" text=\"Ứng dầu\"><item id=\"tripoillist\" text=\"Danh sách ứng dầu\"/><item id=\"tripoiladd\" text=\"Thêm ứng dầu\"/></item><item id=\"employeeroutefees\" complex=\"true\" text=\"Chi phí nhân viên vận chuyển\"><item id=\"employeeroutefeelist\" text=\"Danh sách chi phí nhân viên vận chuyển\"/><item id=\"employeeroutefeeadd\" text=\"Thêm chi phí nhân viên vận chuyển\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"oilimports\" complex=\"true\" text=\"Nhập dầu nhớt\"><item id=\"oilimportlist\" text=\"Danh sách phiếu nhập dầu nhớt\"/><item id=\"oilimportadd\" text=\"Thêm phiếu nhập dầu nhớt\"/></item><item id=\"saleoils\" complex=\"true\" text=\"Bán dầu nhớt\"><item id=\"saleoillist\" text=\"Danh sách phiếu bán dầu nhớt\"/><item id=\"saleoiladd\" text=\"Thêm phiếu bán dầu nhớt\"/></item><item id=\"oilexports\" complex=\"true\" text=\"Xuất kho dầu nhớt\"><item id=\"oilexportlist\" text=\"Danh sách phiếu xuất kho dầu nhớt\"/></item><item id=\"saleoilreturns\" complex=\"true\" text=\"Trả hàng dầu nhớt\"><item id=\"saleoilreturnlist\" text=\"Danh sách phiếu trả hàng dầu nhớt\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"invoices\" complex=\"true\" text=\"Hóa đơn\"><item id=\"invoicelist\" text=\"Danh sách hóa đơn\"/><item id=\"invoiceadd\" text=\"Thêm hóa đơn\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng LPG\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reportoil\" complex=\"true\" text=\"Báo cáo dầu nhớt\"><item id=\"reportoilimport\" text=\"Báo cáo nhập dầu nhớt\"/><item id=\"reportoilstock\" text=\"Báo cáo nhập xuất tồn dầu nhớt\"/><item id=\"reportoilstockh\" text=\"Báo cáo nhập xuất tồn dầu nhớt - Ngang\"/><item id=\"reportoilstocksum\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt\"/><item id=\"reportoilstocksumh\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt - Ngang\"/><item id=\"reportoilsale\" text=\"Báo cáo bán hàng dầu nhớt\"/><item id=\"reportoilcompare\" text=\"Đối chiếu dầu nhớt\"/><item id=\"reportoilcommissionagency\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt đại lý\"/><item id=\"reportoilcommissioncustomer\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt khách hàng\"/><item id=\"reportoilvendorstock\" text=\"Bảng theo dõi nhập xuất tồn tổng kho\"/><item id=\"reportoilvendordebt\" text=\"Bảng theo dõi công nợ nhà cung cấp\"/><item id=\"reportoilcustomerdebt\" text=\"Bảng theo dõi công nợ khách hàng dầu nhớt\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item><item id=\"reportaccountant\" complex=\"true\" text=\"Báo cáo kế toán\"><item id=\"reportemployeesalary\" text=\"Bảng thanh toán lương\"/><item id=\"reportemployeeoff\" text=\"Bảng theo dõi ngày nghỉ phép\"/><item id=\"reportemployeeworking\" text=\"Bảng theo dõi thời gian công tác\"/><item id=\"reportemployeevehiclesalary\" text=\"Bảng lương nhân viên vận chuyển\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(13,20,'hungcp','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item><item id=\"dayoffs\" complex=\"true\" text=\"Ngày nghỉ bù\"><item id=\"dayofflist\" text=\"Danh sách ngày nghỉ bù\"/><item id=\"dayoffadd\" text=\"Thêm ngày nghỉ bù\"/></item><item id=\"otherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"otherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"otherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"paneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"paneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"paneltyadd\" text=\"Thêm khoản chi khác\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"oil\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"vendoroils\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendoroillist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoroiladd\" text=\"Thêm nhà cung cấp\"/></item><item id=\"unitrates\" complex=\"true\" text=\"Qui đổi đơn vị tính\"><item id=\"unitratelist\" text=\"Danh sách qui đổi đơn vị tính\"/><item id=\"unitrateadd\" text=\"Thêm qui đổi đơn vị tính\"/></item><item id=\"agencys\" complex=\"true\" text=\"Đại lý\"><item id=\"agencylist\" text=\"Danh sách đại lý\"/><item id=\"agencyadd\" text=\"Thêm đại lý\"/></item><item id=\"oilgroups\" complex=\"true\" text=\"Nhóm dầu nhớt\"><item id=\"oilgrouplist\" text=\"Danh sách nhóm dầu nhớt\"/><item id=\"oilgroupadd\" text=\"Thêm nhóm dầu nhớt\"/></item><item id=\"oils\" complex=\"true\" text=\"Dầu nhớt\"><item id=\"oillist\" text=\"Danh sách dầu nhớt\"/><item id=\"oiladd\" text=\"Thêm dầu nhớt\"/></item><item id=\"employeeoilcommissions\" complex=\"true\" text=\"Loại chiết khấu bán dầu nhớt\"><item id=\"employeeoilcommissionlist\" text=\"Danh sách loại chiết khấu bán dầu nhớt\"/><item id=\"employeeoilcommissionadd\" text=\"Thêm loại chiết khấu bán dầu nhớt\"/></item><item id=\"saleoilreturnstores\" complex=\"true\" text=\"Kho trả hàng dầu nhớt\"><item id=\"saleoilreturnstoreadd\" text=\"Thêm kho trả hàng dầu nhớt\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Giảm giá\"><item id=\"discountlist\" text=\"Danh sách giảm giá\"/><item id=\"discountadd\" text=\"Thêm giảm giá\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"borrows\" complex=\"true\" text=\"Mượn lương\"><item id=\"borrowlist\" text=\"Danh sách phiếu mượn lương\"/><item id=\"borrowadd\" text=\"Thêm phiếu mượn lương\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"employeeotherbonuss\" complex=\"true\" text=\"Khoản thưởng khác\"><item id=\"employeeotherbonuslist\" text=\"Danh sách khoản thưởng khác\"/><item id=\"employeeotherbonusadd\" text=\"Thêm khoản thưởng khác\"/></item><item id=\"employeepaneltys\" complex=\"true\" text=\"Khoản chi khác\"><item id=\"employeepaneltylist\" text=\"Danh sách khoản chi khác\"/><item id=\"employeepaneltyadd\" text=\"Thêm khoản chi khác\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"tripoils\" complex=\"true\" text=\"Ứng dầu\"><item id=\"tripoillist\" text=\"Danh sách ứng dầu\"/><item id=\"tripoiladd\" text=\"Thêm ứng dầu\"/></item><item id=\"employeeroutefees\" complex=\"true\" text=\"Chi phí nhân viên vận chuyển\"><item id=\"employeeroutefeelist\" text=\"Danh sách chi phí nhân viên vận chuyển\"/><item id=\"employeeroutefeeadd\" text=\"Thêm chi phí nhân viên vận chuyển\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/><item id=\"gaswholesalefeelist\" text=\"Danh sách các khoản phí khác\"/></item><item id=\"saleinners\" complex=\"true\" text=\"Bán Nội bộ\"><item id=\"saleinnerlist\" text=\"Danh sách phiếu bán nội bộ\"/><item id=\"saleinneradd\" text=\"Thêm phiếu bán nội bộ\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"oilimports\" complex=\"true\" text=\"Nhập dầu nhớt\"><item id=\"oilimportlist\" text=\"Danh sách phiếu nhập dầu nhớt\"/><item id=\"oilimportadd\" text=\"Thêm phiếu nhập dầu nhớt\"/></item><item id=\"saleoils\" complex=\"true\" text=\"Bán dầu nhớt\"><item id=\"saleoillist\" text=\"Danh sách phiếu bán dầu nhớt\"/><item id=\"saleoiladd\" text=\"Thêm phiếu bán dầu nhớt\"/></item><item id=\"oilexports\" complex=\"true\" text=\"Xuất kho dầu nhớt\"><item id=\"oilexportlist\" text=\"Danh sách phiếu xuất kho dầu nhớt\"/></item><item id=\"saleoilreturns\" complex=\"true\" text=\"Trả hàng dầu nhớt\"><item id=\"saleoilreturnlist\" text=\"Danh sách phiếu trả hàng dầu nhớt\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"invoices\" complex=\"true\" text=\"Hóa đơn\"><item id=\"invoicelist\" text=\"Danh sách hóa đơn\"/><item id=\"invoiceadd\" text=\"Thêm hóa đơn\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item><item id=\"debtadjustments\" complex=\"true\" text=\"Điều chỉnh công nợ\"><item id=\"debtadjustmentlist\" text=\"Danh sách điều chỉnh công nợ\"/><item id=\"debtadjustmentadd\" text=\"Thêm điều chỉnh công nợ\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Bảng theo dõi công nợ khách hàng LPG\"/><item id=\"reportcomparelpgvendorcustomer\" text=\"Đối chiếu LPG NCC - KH\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportcomparevendor\" text=\"Đối chiếu nhà cung cấp\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/><item id=\"reportshell\" text=\"Thống kê vỏ\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reportoil\" complex=\"true\" text=\"Báo cáo dầu nhớt\"><item id=\"reportoilimport\" text=\"Báo cáo nhập dầu nhớt\"/><item id=\"reportoilstock\" text=\"Báo cáo nhập xuất tồn dầu nhớt\"/><item id=\"reportoilstockh\" text=\"Báo cáo nhập xuất tồn dầu nhớt - Ngang\"/><item id=\"reportoilstocksum\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt\"/><item id=\"reportoilstocksumh\" text=\"Báo cáo nhập xuất tồn tổng hợp dầu nhớt - Ngang\"/><item id=\"reportoilsale\" text=\"Báo cáo bán hàng dầu nhớt\"/><item id=\"reportoilcompare\" text=\"Đối chiếu dầu nhớt\"/><item id=\"reportoilcommissionagency\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt đại lý\"/><item id=\"reportoilcommissioncustomer\" text=\"Báo cáo theo dõi chiết khấu dầu nhớt khách hàng\"/><item id=\"reportoilvendorstock\" text=\"Bảng theo dõi nhập xuất tồn tổng kho\"/><item id=\"reportoilvendordebt\" text=\"Bảng theo dõi công nợ nhà cung cấp\"/><item id=\"reportoilcustomerdebt\" text=\"Bảng theo dõi công nợ khách hàng dầu nhớt\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item><item id=\"reportaccountant\" complex=\"true\" text=\"Báo cáo kế toán\"><item id=\"reportemployeesalary\" text=\"Bảng thanh toán lương\"/><item id=\"reportemployeeoff\" text=\"Bảng theo dõi ngày nghỉ phép\"/><item id=\"reportemployeeworking\" text=\"Bảng theo dõi thời gian công tác\"/><item id=\"reportemployeevehiclesalary\" text=\"Bảng lương nhân viên vận chuyển\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(15,42,'tuht','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item><item id=\"vendorcustomers\" complex=\"true\" text=\"Nhà cung cấp - Khách hàng\"><item id=\"vendorcustomerlist\" text=\"Danh sách nhà cung cấp - Khách hàng\"/><item id=\"vendorcustomeradd\" text=\"Thêm nhà cung cấp - Khách hàng\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item><item id=\"transportservices\" complex=\"true\" text=\"Vận chuyển thuê\"><item id=\"transportservicelist\" text=\"Danh sách vận chuyển thuê\"/><item id=\"transportserviceadd\" text=\"Thêm phiếu vận chuyển thuê\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportlpgsale\" text=\"Bảng theo dõi bán hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportcomparelpg\" text=\"Đối chiếu LPG\"/><item id=\"reportcomparegas\" text=\"Đối chiếu gas bình\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/><item id=\"reportvehiclesale\" text=\"Bảng theo dõi bán hàng theo xe\"/><item id=\"reporttransportservice\" text=\"Bảng theo dõi chi phí vận chuyển thuê\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1);

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `allowance` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle` */

insert  into `vehicle`(`id`,`plate`,`note`,`allowance`) values (6,'72C-06534','Xe tải chở Gas 72C-06534',NULL),(5,'72C-07468','Xe bồn chở Gas 72C-07468',NULL),(7,'72C-09728','Xe tải chở Gas 72C-09728',NULL),(8,'72C-06784','Xe tải chở Gas 72C-06784',NULL),(9,'72C-13179','Xe xitec chở xăng dầu 20.000L 72C-13179',NULL),(10,'72C-06625','Xe xitec chở xăng dầu 16.000L 72C-06625',NULL),(11,'51C-98349','Xe bán tải 51C-98349',NULL),(13,'72c-13905','xe tải chở gas 72C - 13905',0);

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

insert  into `vehicle_in`(`id`,`code`,`employee_id`,`created_date`,`vehicle_out_id`,`note`,`created_employee_id`) values (5,'20191023-VI-0002',NULL,'2019-10-22',8,'',35),(4,'20191023-VI-0001',NULL,'2019-10-22',9,'',35),(6,'20191024-VI-0001',NULL,'2019-10-23',10,'',35),(7,'20191024-VI-0002',NULL,'2019-10-23',11,'',35),(8,'20191024-VI-0003',NULL,'2019-10-23',12,'',35),(9,'20191025-VI-0001',NULL,'2019-10-24',13,'',35),(10,'20191025-VI-0002',NULL,'2019-10-24',14,'',35),(11,'20191025-VI-0003',NULL,'2019-10-24',15,'',35),(12,'20191026-VI-0001',NULL,'2019-10-25',16,'',35),(13,'20191026-VI-0002',NULL,'2019-10-25',17,'',35),(14,'20191026-VI-0003',NULL,'2019-10-25',18,'',35),(15,'20191028-VI-0001',NULL,'2019-10-26',19,'',35),(16,'20191028-VI-0002',NULL,'2019-10-26',21,'',35),(17,'20191029-VI-0001',NULL,'2019-10-28',23,'',35),(18,'20191029-VI-0002',NULL,'2019-10-28',24,'',35),(19,'20191029-VI-0003',NULL,'2019-10-28',25,'',35),(20,'20191030-VI-0001',NULL,'2019-10-29',28,'',35),(21,'20191030-VI-0002',NULL,'2019-10-29',29,'',35),(26,'20191101-VI-0001',NULL,'2019-10-31',39,'',35),(23,'20191031-VI-0002',NULL,'2019-10-30',35,'',35),(24,'20191031-VI-0003',NULL,'2019-10-30',36,'',35),(25,'20191031-VI-0004',NULL,'2019-10-30',37,'',35),(27,'20191126-VI-0001',NULL,'2019-11-25',41,'',35),(28,'20191126-VI-0002',NULL,'2019-11-25',43,'',35);

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_detail` */

insert  into `vehicle_in_detail`(`id`,`vehicle_in_id`,`shell_id`,`quantity`,`price`,`amount`) values (5,5,1,23,0,0),(4,4,1,1,0,0),(6,6,1,32,0,0),(7,7,1,1,0,0),(8,8,1,59,0,0),(9,9,1,35,0,0),(10,10,1,16,0,0),(11,11,1,2,0,0),(12,12,1,64,0,0),(13,13,1,39,0,0),(14,14,1,26,0,0),(15,15,1,23,0,0),(16,16,1,21,0,0),(17,17,1,1,0,0),(18,18,1,14,0,0),(19,19,1,27,0,0),(20,20,1,37,0,0),(21,21,1,23,0,0),(26,26,1,1,0,0),(23,23,1,1,0,0),(24,24,1,7,0,0),(25,25,1,2,0,0),(27,27,1,3,0,0),(28,28,1,44,0,0);

/*Table structure for table `vehicle_in_oil_export_detail` */

DROP TABLE IF EXISTS `vehicle_in_oil_export_detail`;

CREATE TABLE `vehicle_in_oil_export_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_in_id` int(11) DEFAULT NULL,
  `oil_export_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_oil_export_detail` */

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out` */

insert  into `vehicle_out`(`id`,`code`,`created_date`,`vehicle_id`,`note`,`created_employee_id`) values (9,'20191023-VO-0003','2019-10-22',13,'',35),(8,'20191023-VO-0002','2019-10-22',7,'',35),(7,'20191023-VO-0001','2019-10-22',6,'',35),(10,'20191024-VO-0001','2019-10-23',7,'',35),(11,'20191024-VO-0002','2019-10-23',13,'',35),(12,'20191024-VO-0003','2019-10-23',6,'',35),(13,'20191025-VO-0001','2019-10-24',6,'',35),(14,'20191025-VO-0002','2019-10-24',13,'',35),(15,'20191025-VO-0003','2019-10-24',7,'',35),(16,'20191026-VO-0001','2019-10-25',7,'',35),(17,'20191026-VO-0002','2019-10-25',13,'',35),(18,'20191026-VO-0003','2019-10-25',6,'',35),(19,'20191028-VO-0001','2019-10-26',6,'',35),(20,'20191028-VO-0002','2019-10-26',7,'',35),(21,'20191028-VO-0003','2019-10-26',13,'',35),(22,'20191028-VO-0004','2019-10-26',11,'',35),(23,'20191029-VO-0001','2019-10-28',7,'',35),(24,'20191029-VO-0002','2019-10-28',13,'',35),(25,'20191029-VO-0003','2019-10-28',6,'',35),(26,'20191029-VO-0004','2019-10-28',11,'',35),(27,'20191030-VO-0001','2019-10-29',8,'',35),(28,'20191030-VO-0002','2019-10-29',6,'',35),(29,'20191030-VO-0003','2019-10-29',13,'',35),(30,'20191030-VO-0004','2019-10-29',7,'',35),(31,'20191030-VO-0005','2019-10-29',11,'',35),(32,'20191031-VO-0001','2019-10-30',11,'',35),(33,'20191031-VO-0002','2019-10-30',5,'',35),(34,'20191031-VO-0003','2019-10-30',7,'',35),(35,'20191031-VO-0004','2019-10-30',13,'',35),(36,'20191031-VO-0005','2019-10-30',6,'',35),(37,'20191031-VO-0006','2019-10-30',7,'',35),(38,'20191101-VO-0001','2019-10-31',6,'',35),(39,'20191101-VO-0002','2019-10-31',13,'',35),(40,'20191101-VO-0003','2019-10-31',7,'',35),(41,'20191126-VO-0001','2019-11-25',7,'',35),(42,'20191126-VO-0002','2019-11-25',13,'',35),(43,'20191126-VO-0003','2019-11-25',6,'',35),(44,'20191126-VO-0004','2019-11-25',11,'',35);

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
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_detail` */

insert  into `vehicle_out_detail`(`id`,`vehicle_out_id`,`shell_id`,`quantity`,`price`,`amount`,`note`) values (18,10,1,210,0,0,NULL),(17,9,1,200,0,0,NULL),(16,8,4,30,0,0,NULL),(15,8,1,50,0,0,NULL),(14,7,4,8,0,0,NULL),(13,7,1,300,0,0,NULL),(19,10,4,4,0,0,NULL),(20,11,1,214,0,0,NULL),(21,11,4,3,0,0,NULL),(22,12,1,222,0,0,NULL),(23,12,4,4,0,0,NULL),(24,13,1,258,0,0,NULL),(25,13,4,10,0,0,NULL),(26,14,1,126,0,0,NULL),(27,15,1,55,0,0,NULL),(28,15,4,32,0,0,NULL),(29,16,1,256,0,0,NULL),(30,17,1,275,0,0,NULL),(31,17,4,7,0,0,NULL),(32,18,1,316,0,0,NULL),(33,18,4,1,0,0,NULL),(34,19,1,301,0,0,NULL),(35,19,4,2,0,0,NULL),(41,23,1,270,0,0,NULL),(37,21,1,125,0,0,NULL),(38,21,4,1,0,0,NULL),(39,22,1,1,0,0,NULL),(40,20,4,10,0,0,NULL),(42,23,4,5,0,0,NULL),(43,24,1,264,0,0,NULL),(44,24,4,10,0,0,NULL),(45,25,1,300,0,0,NULL),(46,25,4,3,0,0,NULL),(47,26,1,1,0,0,NULL),(48,27,1,100,0,0,NULL),(49,27,4,1,0,0,NULL),(50,28,1,300,0,0,NULL),(51,28,4,1,0,0,NULL),(52,29,1,230,0,0,NULL),(53,29,4,2,0,0,NULL),(54,30,1,134,0,0,NULL),(55,30,4,35,0,0,NULL),(56,31,1,1,0,0,NULL),(57,32,1,1,0,0,NULL),(58,33,4,10,0,0,NULL),(59,34,1,208,0,0,NULL),(60,34,4,5,0,0,NULL),(61,35,1,271,0,0,NULL),(62,35,4,9,0,0,NULL),(63,36,1,250,0,0,NULL),(64,36,4,6,0,0,NULL),(65,37,1,136,0,0,NULL),(66,38,1,288,0,0,NULL),(67,38,4,11,0,0,NULL),(68,39,1,189,0,0,NULL),(69,40,1,178,0,0,NULL),(70,40,4,30,0,0,NULL),(71,31,4,4,0,0,NULL),(72,41,1,280,0,0,NULL),(73,42,1,270,0,0,NULL),(74,42,4,6,0,0,NULL),(75,43,1,313,0,0,NULL),(76,43,4,2,0,0,NULL),(77,44,4,2,0,0,NULL);

/*Table structure for table `vehicle_out_employee_detail` */

DROP TABLE IF EXISTS `vehicle_out_employee_detail`;

CREATE TABLE `vehicle_out_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_employee_detail` */

insert  into `vehicle_out_employee_detail`(`id`,`vehicle_out_id`,`employee_id`,`note`) values (25,10,28,''),(24,9,41,''),(23,9,50,''),(22,8,34,''),(21,8,24,''),(20,7,27,''),(19,7,26,''),(18,7,28,''),(26,10,34,''),(27,11,24,''),(28,11,27,''),(29,11,51,''),(30,12,50,''),(31,12,26,''),(32,13,28,''),(33,13,27,''),(34,13,26,''),(35,14,50,''),(36,14,41,''),(37,15,24,''),(38,15,34,''),(39,16,28,''),(40,16,34,''),(41,16,33,''),(42,17,24,''),(43,17,51,''),(44,17,27,''),(45,18,50,''),(46,18,26,''),(47,18,30,''),(48,19,28,''),(49,19,27,''),(50,19,26,''),(51,20,24,''),(52,20,34,''),(53,21,50,''),(54,21,41,''),(55,23,28,''),(56,23,34,''),(57,23,41,''),(58,24,24,''),(59,24,51,''),(60,24,27,''),(61,25,50,''),(62,25,26,''),(63,25,30,''),(64,26,20,''),(65,22,20,''),(66,27,51,''),(67,27,25,''),(68,28,28,''),(69,28,27,''),(70,28,26,''),(71,29,50,''),(72,29,41,''),(73,30,24,''),(74,30,34,''),(75,32,20,''),(76,33,25,''),(77,34,28,''),(78,34,34,''),(79,34,41,''),(80,35,24,''),(81,35,51,''),(82,35,27,''),(83,36,50,''),(84,36,26,''),(85,37,28,''),(86,38,28,''),(87,38,26,''),(88,38,27,''),(89,39,50,''),(90,39,41,''),(91,40,51,''),(92,40,34,''),(93,41,28,''),(94,41,34,''),(95,41,46,''),(96,42,24,''),(97,42,51,''),(98,42,27,''),(99,43,50,''),(100,43,26,''),(101,43,30,''),(102,44,20,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`code`,`name`,`address`,`tax`,`phone`,`fax`,`organization_id`,`status`,`equal_organization_id`,`has_stock`,`is_gas`,`is_petro`,`is_good`,`is_transport`,`is_oil`,`commision_on_import`,`max_debt`) values (24,'VIMEXCO','Công ty CP Thương Mại va Dịch Vụ Dầu Khí Vũng Tàu','KCN Gò dầu - Đồng Nai','','02513541977','',1,1,-1,0,1,0,0,0,0,0,0),(16,'KDK','Công ty kinh doanh sản phẩm khí',NULL,NULL,NULL,NULL,1,1,-1,1,1,0,0,0,0,0,0),(15,'THIENHA','Công ty TNHH Dầu Khí Thiên Hà','','','','',1,1,-1,1,1,0,0,1,0,0,0),(23,'HUNGTHINH','Công ty TNHH Khí Hoá Lỏng Hưng Thịnh','','','','',14,1,14,1,1,0,0,0,0,0,0),(18,'TCP','Công Ty TNHH Thanh Châu Phát',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0,0,0,0),(19,'PVO MD','Công ty cổ phần xăng dầu dầu khí Vũng Tàu',NULL,NULL,NULL,NULL,1,1,-1,0,0,1,0,0,0,0,0),(20,'NIWA','NIWA','','','','',1,1,-1,0,0,0,0,0,1,43,0),(21,'HGA','Công Ty TNHH Hưng Gia Anh',NULL,NULL,NULL,NULL,1,1,-1,1,1,0,0,0,0,0,0),(22,'QuangTrung','Công ty TNHH Quang Trung','','','','',1,1,1,1,1,0,0,1,0,0,0),(25,'PN','Phú Nguyên','','','','',1,1,-1,0,0,0,0,1,0,0,0),(26,'MK','Mekong','','','','',1,1,-1,0,0,0,0,0,1,0,0),(27,'NASCA','NASCA','','','','',1,1,-1,0,0,0,0,0,1,0,0),(28,'HN','Hàng Ngoài','','','','',1,1,-1,0,1,0,0,0,0,0,0);

/*Table structure for table `vendor_customer` */

DROP TABLE IF EXISTS `vendor_customer`;

CREATE TABLE `vendor_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_customer` */

insert  into `vendor_customer`(`id`,`organization_id`,`vendor_id`,`customer_id`) values (1,1,23,124),(2,14,22,205),(3,1,15,165),(4,1,24,218);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_in_stock` */

insert  into `vendor_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`amount`,`shell_12`,`shell_45`,`transport_amount`) values (1,'2019-10-21',15,14,0,0,0,0),(2,'2019-10-21',23,14,0,0,0,0),(3,'2019-10-21',22,14,0,0,0,0),(4,'2019-10-21',19,1,0,0,0,0),(5,'2019-10-21',24,1,-31323936,0,0,0),(6,'2019-10-21',16,1,1994495261,0,0,0),(7,'2019-10-21',15,1,-1269872004,0,0,0),(8,'2019-10-21',21,1,0,0,0,0),(9,'2019-10-21',23,1,0,0,0,0),(10,'2019-10-21',22,1,0,0,0,0),(11,'2019-10-21',18,1,0,0,0,0),(12,'2019-10-21',28,1,0,0,0,0),(13,'2019-10-21',26,1,0,0,0,0),(14,'2019-10-21',27,1,0,0,0,0),(15,'2019-10-21',20,1,0,0,0,0),(16,'2019-10-21',25,1,0,0,0,0);

/*Table structure for table `vendor_oil_store` */

DROP TABLE IF EXISTS `vendor_oil_store`;

CREATE TABLE `vendor_oil_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_oil_store` */

insert  into `vendor_oil_store`(`id`,`vendor_id`,`store_id`) values (1,27,8);

/*Table structure for table `vendor_organization` */

DROP TABLE IF EXISTS `vendor_organization`;

CREATE TABLE `vendor_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_organization` */

insert  into `vendor_organization`(`id`,`vendor_id`,`organization_id`) values (11,15,1),(12,16,1),(16,18,1),(17,19,1),(18,20,1),(19,21,1),(20,22,1),(21,23,14),(22,23,1),(23,22,14),(24,15,14),(25,24,1),(26,25,1),(27,26,1),(28,27,1),(29,28,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

insert  into `wholesale_debt`(`id`,`code`,`created_date`,`content`,`customer_id`,`paid`,`account_id`,`note`,`created_employee_id`,`kind`,`gas_wholesale_id`) values (2,'20191023-GS-0007_aut','2019-10-22',NULL,18,4809000,5,'',35,1,7),(3,'20191023-GS-0018_aut','2019-10-22',NULL,52,1130000,5,'',35,1,18),(4,'20191023-GS-0023_aut','2019-10-22',NULL,42,1832000,5,'',35,1,23),(5,'20191023-GS-0026_aut','2019-10-22',NULL,106,4480000,5,'',35,1,26),(6,'20191024-GS-0003_aut','2019-10-23',NULL,171,8000000,5,'',35,1,37),(7,'20191024-GS-0007_aut','2019-10-23',NULL,109,2977000,5,'',35,1,41),(8,'20191024-GS-0035_aut','2019-10-23',NULL,158,500000,5,'',35,1,69),(9,'20191025-GS-0016_aut','2019-10-24',NULL,183,916000,5,'',35,1,86),(10,'20191026-GS-0001_aut','2019-10-24',NULL,123,2061000,5,'',35,1,88),(11,'20191026-GS-0024_aut','2019-10-25',NULL,93,1374000,5,'',35,1,111),(12,'20191026-GS-0058_aut','2019-10-25',NULL,44,3420000,5,'',35,1,145),(13,'20191026-GS-0061_aut','2019-10-25',NULL,114,904000,5,'',35,1,148),(14,'20191029-GS-0004_aut','2019-10-28',NULL,171,4000000,5,'',35,1,184),(15,'20191029-GS-0005_aut','2019-10-28',NULL,145,1290000,5,'',35,1,185),(16,'20191029-GS-0011_aut','2019-10-28',NULL,164,687000,5,'',35,1,191),(17,'20191029-GS-0038_aut','2019-10-28',NULL,113,15635000,5,'',35,1,218),(18,'20191029-GS-0039_aut','2019-10-28',NULL,66,1800000,5,'',35,1,219),(19,'20191030-GS-0013_aut','2019-10-29',NULL,42,4580000,5,'',35,1,240),(20,'20191030-GS-0014_aut','2019-10-29',NULL,215,1145000,5,'',35,1,241),(21,'20191030-GS-0020_aut','2019-10-29',NULL,106,4480000,5,'',35,1,247),(22,'20191030-GS-0024_aut','2019-10-29',NULL,57,3436000,5,'',35,1,251),(23,'20191030-GS-0038_aut','2019-10-29',NULL,182,5858000,5,'',35,1,265),(24,'20191031-GS-0002_aut','2019-10-30',NULL,313,5590000,5,'',35,1,268),(25,'20191031-GS-0008_aut','2019-10-30',NULL,50,934000,5,'',35,1,274),(26,'20191031-GS-0012_aut','2019-10-30',NULL,35,17316000,5,'',35,1,278),(27,'20191031-GS-0038_aut','2019-10-30',NULL,72,1800000,5,'',35,1,304),(28,'20191102-GS-0006_aut','2019-10-31',NULL,203,17280000,5,'',35,1,312),(29,'20191102-GS-0023_aut','2019-10-31',NULL,103,2883000,5,'',35,1,329),(30,'20191125-DW-0001','2019-11-25',NULL,152,708484986,9,'Supor thanh toán',35,1,0),(31,'20191126-GS-0004_aut','2019-11-25',NULL,145,1308000,5,'',35,1,346),(32,'20191126-GS-0019_aut','2019-11-25',NULL,97,500000,5,'',35,1,361),(33,'20191126-GS-0029_aut','2019-11-25',NULL,54,4408000,5,'',35,1,371),(34,'20191126-GS-0045_aut','2019-11-25',NULL,91,1300000,5,'',35,1,387);

/* Trigger structure for table `gas_import_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_deleteGasImportDetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_deleteGasImportDetail` AFTER DELETE ON `gas_import_detail` FOR EACH ROW BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id INTO _date, _organization_id, _vendor_id
	FROM gas_import AS f, employee AS eo
	WHERE f.id=old.gas_import_id AND f.created_employee_id=eo.id;
	
	SET _in_stock_id=0;
	SELECT id INTO _in_stock_id FROM shell_vendor WHERE organization_id=_organization_id AND vendor_id=_vendor_id AND shell_id=OLD.shell_id;
	IF _in_stock_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity - old.quantity WHERE id=_in_stock_id;
	END IF;
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
	DELETE FROM accessory_import_detail WHERE accessory_import_id=_id;
	DELETE FROM accessory_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteBorrow` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteBorrow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBorrow`(IN _id INT)
BEGIN
	DELETE FROM borrow_detail WHERE borrow_id=_id;
	DELETE FROM borrow WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtAdjustment`(IN _id INT)
BEGIN
	DELETE FROM debt_adjustment WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtVendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtVendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtVendor`(IN _id INT)
BEGIN
	DELETE FROM vendor_debt WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDebtWholesale`(IN _id INT)
BEGIN
	DELETE FROM wholesale_debt WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDiscount` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDiscount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDiscount`(IN _ids TEXT)
BEGIN
	SET _ids = CONCAT(',',_ids,',');
	DELETE FROM discount_oil_detail WHERE _ids LIKE CONCAT('%,',discount_id,',%');
	DELETE FROM discount_oil WHERE _ids LIKE CONCAT('%,',id,',%');
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
	DELETE FROM employee_advance WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteEmployeeOffMoney` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteEmployeeOffMoney` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmployeeOffMoney`(IN _id INT)
BEGIN
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
	DELETE FROM expense WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteExportWholesale`(IN _id INT)
BEGIN
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
	delete from fraction_gas_detail where fraction_id=_id;
	DELETE FROM fraction_gas WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGasImport`(IN _id INT)
BEGIN
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
	DELETE FROM good_import_detail WHERE good_import_id=_id;
	DELETE FROM good_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteIncome`(IN _id INT)
BEGIN
	DELETE FROM income WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteInvoice`(in _id int)
BEGIN
	DELETE FROM invoice_detail WHERE invoice_id=_id;
	DELETE FROM invoice_paid_detail WHERE invoice_id=_id;
	DELETE FROM invoice WHERE id=_id;
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
	DELETE FROM lpg_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLpgSale`(IN _id INT)
BEGIN
	DELETE FROM lpg_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteOilExport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOilExport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOilExport`(IN _id INT)
BEGIN
	DELETE FROM oil_export_detail WHERE oil_export_id=_id;
	DELETE FROM oil_export WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOilImport`(IN _id INT)
BEGIN
	DELETE FROM oil_import_detail WHERE oil_import_id=_id;
	DELETE FROM oil_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldShell`(IN _id INT)
BEGIN
	DELETE FROM old_shell WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deletePetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deletePetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePetroImport`(IN _id INT)
BEGIN
	DELETE FROM petro_import_detail WHERE petro_import_id=_id;
	DELETE FROM petro_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deletePromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deletePromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePromotionMaterialImport`(IN _id INT)
BEGIN
	DELETE FROM promotion_material_import_detail WHERE import_id=_id;
	DELETE FROM promotion_material_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleAccessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleAccessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleAccessory`(IN _id INT)
BEGIN
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
	DELETE FROM good_sale_detail WHERE good_sale_id=_id;
	DELETE FROM good_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleInner`(IN _id INT)
BEGIN
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
	DELETE FROM oil_sale_detail WHERE oil_sale_id=_id;
	DELETE FROM oil_sale_promotion WHERE sale_oil_id=_id;
	DELETE FROM oil_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleOilReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleOilReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleOilReturn`(IN _id INT)
BEGIN
	DELETE FROM oil_sale_return_detail WHERE oil_sale_return_id=_id;
	DELETE FROM oil_sale_return WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSalePetro`(IN _id INT)
BEGIN
	DELETE FROM petro_sale_detail WHERE petro_sale_id=_id;
	DELETE FROM petro_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSaleShell`(IN _id INT)
BEGIN
	DELETE FROM shell_sale_detail WHERE shell_sale_id=_id;
	DELETE FROM shell_sale WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShellImport`(IN _id int)
BEGIN
	DECLARE _shell_vendor_id, _old_shell_vendor_quantity INT DEFAULT 0;
	
	SELECT sv.id, sv.quantity
	INTO _shell_vendor_id, _old_shell_vendor_quantity
	FROM shell_vendor as sv, shell_import as i, employee as eo
	WHERE i.id=_id AND eo.id=i.created_employee_id and sv.shell_id=i.shell_id AND sv.vendor_id=i.vendor_id AND sv.organization_id=eo.organization_id ;
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
	DELETE FROM shield_decrease WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShieldImport`(IN _id INT)
BEGIN
	DELETE FROM shield_import WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTransportService`(IN _id INT)
BEGIN
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
	DELETE FROM vehicle_in_oil_export_detail WHERE vehicle_in_id=_id;
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
	call get_in_stock_accessory(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_customer_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_customer_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_customer_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_customer(_date, 1, 0, @a, @a, @a, @a);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_good_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_good_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_good_opening_stock`(IN _date VARCHAR(20))
BEGIN
	call get_in_stock_good(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_lpg_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_lpg_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_lpg_opening_stock`(IN _date VARCHAR(20))
BEGIN
	call get_in_stock_lpg(_date, 1, '','', @a);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_money_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_money_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_money_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_money(_date, 1, 0, '', 0, @a);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_oil_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_oil_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_oil_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_oil(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_petro_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_petro_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_petro_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_petro(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_promotion_material_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_promotion_material_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_promotion_material_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_promotion_material(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shell_gas_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shell_gas_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shell_gas_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_shell_gas(_date, 1, 0, '','', @a, @b);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shell_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shell_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shell_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_shell(_date, 1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_shield_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_shield_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_shield_opening_stock`(IN _date VARCHAR(20))
BEGIN
	call get_in_stock_shield(_date, 1, 0, '','', @a);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `export_vendor_opening_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `export_vendor_opening_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `export_vendor_opening_stock`(IN _date VARCHAR(20))
BEGIN
	CALL get_in_stock_vendor(_date, 1, 0, "", @a, @a, @a, @a);
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

/* Procedure structure for procedure `getOilExport` */

/*!50003 DROP PROCEDURE IF EXISTS  `getOilExport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getOilExport`(IN _organization_ids TEXT)
BEGIN
	SELECT e.*, c.name as customer_name
	FROM employee AS eo, customer as c, oil_export AS e
	LEFT JOIN vehicle_in_oil_export_detail AS vie ON e.id=vie.oil_export_id
	WHERE e.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		and e.customer_id=c.id AND vie.id IS NULL
	ORDER BY CODE;
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

/* Procedure structure for procedure `get_in_stock_accessory` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_accessory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_accessory`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM accessory_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS accessory_id, a.NAME AS accessory_name, SUM(COALESCE(tbl.quantity,0)) AS opening_stock
		FROM organization AS o
		LEFT JOIN accessory AS a ON 1
		LEFT JOIN
		(
			SELECT accessory_id, organization_id, COALESCE(in_stock,0) AS quantity
			FROM accessory_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i_det.accessory_id, eo.organization_id, COALESCE(i_det.quantity,0) AS quantity
			FROM accessory_import_detail AS i_det, accessory_import AS i, employee AS eo
			WHERE i_det.accessory_import_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date	
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i_det.accessory_id, eo.organization_id, -COALESCE(i_det.quantity,0) AS quantity
			FROM accessory_sale_detail AS i_det, accessory_sale AS i, employee AS eo
			WHERE i_det.accessory_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date	
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i_det.accessory_id, eo.organization_id, -COALESCE(i_det.quantity,0) AS quantity
			FROM vehicle_in_accessory_detail AS i_det, vehicle_in AS i, employee AS eo
			WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date	
				AND i.created_employee_id=eo.id
		) AS tbl ON tbl.organization_id=o.id AND tbl.accessory_id=a.id
		WHERE a.STATUS=1 AND o.STATUS=1
		GROUP BY o.id, a.id
		ORDER BY o.NAME, a.NAME
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_customer` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_customer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_customer`(IN _date VARCHAR(20), in _kind int, in _customer_id int
	, OUT _out_amount double, out _out_transport_amount double, OUT _out_shell_12 int, OUT _out_shell_45 int)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM customer_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _kind=1 THEN -- export_customer_opening_stock
		SELECT o.id AS organization_id, o.NAME AS organization_name, c.id AS customer_id, c.NAME AS customer_name
			, SUM(COALESCE(tbl.amount,0)) AS opening_stock
			, SUM(COALESCE(tbl.shell_12,0)) AS opening_stock_12
			, SUM(COALESCE(tbl.shell_45,0)) AS opening_stock_45
		FROM organization AS o
		LEFT JOIN customer AS c ON 1
		LEFT JOIN
		(
			SELECT customer_id, COALESCE(shell_12,0) AS shell_12, COALESCE(shell_45,0) AS shell_45, COALESCE(amount,0) AS amount
			FROM customer_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i.customer_id, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM gas_wholesale AS i, gas_wholesale_detail AS idet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id AND idet.shell_id=sv.id
			UNION ALL
			SELECT i.customer_id, -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM gas_wholesale AS i, gas_wholesale_return_shell AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id
			UNION ALL
			SELECT i.customer_id, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM shell_return AS i, shell_return_detail AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.shell_return_id
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM gas_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM gas_export_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM good_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM petro_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM shell_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM lpg_sale AS i
			WHERE DATE(i.sale_date) >= _from_date AND DATE(i.sale_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.paid,0) AS amount
			FROM wholesale_debt AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_customer_id AS customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.customer_amount,0) AS amount
			FROM transport_service AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0
			UNION ALL
			SELECT i.customer_id AS customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.amount,0) AS amount
			FROM debt_adjustment AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM oil_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.debt,0) AS amount
			FROM oil_sale_return AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
		) AS tbl ON tbl.customer_id=c.id
		WHERE c.organization_id=o.id AND c.STATUS=1 AND o.STATUS=1
		GROUP BY c.id
		ORDER BY o.NAME, c.NAME
		;
	ELSEIF _kind=3 THEN -- set value
		SELECT SUM(COALESCE(tbl.amount,0)), SUM(COALESCE(tbl.transport_amount,0)), SUM(COALESCE(tbl.quantity_12,0)), SUM(COALESCE(tbl.quantity_45,0))
			INTO _out_amount, _out_transport_amount, _out_shell_12, _out_shell_45
		FROM customer AS c
		LEFT JOIN
		(
			SELECT COALESCE(shell_12,0) AS quantity_12, COALESCE(shell_45,0) AS quantity_45, COALESCE(amount,0) AS amount, COALESCE(transport_amount,0) AS transport_amount
			FROM customer_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 AND customer_id=_customer_id
			UNION ALL
			SELECT COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount, 0 AS transport_amount
			FROM gas_wholesale AS i, gas_wholesale_detail AS idet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id AND idet.shell_id=sv.id AND i.customer_id=_customer_id
			UNION ALL
			SELECT -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount, 0 AS transport_amount
			FROM gas_wholesale AS i, gas_wholesale_return_shell AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id AND i.customer_id=_customer_id
			UNION ALL
			SELECT -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount, 0 AS transport_amount
			FROM shell_return AS i, shell_return_detail AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.shell_return_id AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM gas_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM gas_export_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM good_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM petro_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM shell_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM lpg_sale AS i
			WHERE DATE(i.sale_date) >= _from_date AND DATE(i.sale_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.paid,0) AS amount, 0 AS transport_amount
			FROM wholesale_debt AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.customer_amount,0) AS amount, 0 AS transport_amount
			FROM transport_service AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0 AND i.customer_customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.amount,0) AS amount, 0 AS transport_amount
			FROM debt_adjustment AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0 AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM oil_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
			UNION ALL
			SELECT 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.debt,0) AS amount, 0 AS transport_amount
			FROM oil_sale_return AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.customer_id=_customer_id
		) AS tbl ON 1
		WHERE c.STATUS=1 AND c.id=_customer_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_good` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_good` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_good`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM good_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS store_id, so.NAME AS store_name, a.id AS good_id, a.NAME AS good_name, SUM(COALESCE(tbl.quantity,0)) AS opening_stock
		FROM organization AS o
		LEFT JOIN store AS so ON 1
		LEFT JOIN good AS a ON 1
		LEFT JOIN
		(
			SELECT good_id, organization_id, store_id, COALESCE(in_stock,0) AS quantity
			FROM good_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i_det.good_id, i.store_id, s.organization_id, COALESCE(i_det.quantity,0) AS quantity
			FROM good_import_detail AS i_det, good_import AS i, store AS s
			WHERE i_det.good_import_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.store_id=s.id
			UNION ALL
			SELECT i_det.good_id, i.store_id, s.organization_id, -COALESCE(i_det.quantity,0) AS quantity
			FROM good_sale_detail AS i_det, good_sale AS i, store AS s
			WHERE i_det.good_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND i.store_id=s.id
		) AS tbl ON tbl.organization_id=o.id AND tbl.good_id=a.id AND tbl.store_id=so.id
		WHERE a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND so.is_good=1
		GROUP BY o.id, so.id, a.id
		ORDER BY o.NAME, so.NAME, a.NAME
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_lpg` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_lpg` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_lpg`(IN _date VARCHAR(20), in _is_list int, in _organization_ids text, in _vendor_ids text, OUT _out_stock INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM lpg_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, v.id AS vendor_id, v.NAME AS vendor_name, SUM(COALESCE(tbl.quantity,0)) AS opening_stock
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT organization_id, vendor_id, COALESCE(in_stock,0) AS quantity
			FROM lpg_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT eo.organization_id, v.id AS vendor_id, COALESCE(i.actual_quantity,0) AS quantity
			FROM lpg_import AS i, employee AS eo, vendor AS v
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id AND eo.organization_id=v.equal_organization_id
			UNION ALL
			SELECT v.equal_organization_id AS organization_id, i.vendor_id, -COALESCE(i.actual_quantity,0) AS quantity 
			FROM lpg_import AS i, vendor AS v
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date AND i.vendor_id=v.id
			UNION ALL
			SELECT eo.organization_id, v.id AS vendor_id, -COALESCE(s.quantity,0) AS quantity
			FROM lpg_sale AS s, employee AS eo, vendor AS v
			WHERE DATE(s.sale_date) >= _from_date AND DATE(s.sale_date) < _to_date	
				AND s.created_employee_id=eo.id AND v.equal_organization_id=eo.organization_id
			UNION ALL
			SELECT sv.organization_id, sv.vendor_id, -COALESCE(f_det.quantity*k.weight,0) AS quantity 
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv, shell AS s, shell_kind AS k
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id AND sv.shell_id=s.id AND s.kind_id=k.id
			UNION ALL
			SELECT rv.organization_id, rv.vendor_id, COALESCE(s.gas_return,0) AS quantity 
			FROM gas_wholesale AS s, employee AS eo, gas_return_vendor AS rv
			WHERE DATE(s.created_date) >= _from_date AND DATE(s.created_date) < _to_date
				AND s.created_employee_id=eo.id AND eo.organization_id=rv.organization_id
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND v.is_gas=1
		GROUP BY o.id, v.id
		ORDER BY o.NAME, v.NAME;
	ELSEIF _is_list=2 THEN
		SELECT COALESCE(SUM(tbl.quantity),0) INTO _out_stock
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT organization_id, vendor_id, COALESCE(in_stock,0) AS quantity
			FROM lpg_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',vendor_id,',%')))
			UNION ALL
			SELECT eo.organization_id, v.id AS vendor_id, COALESCE(i.actual_quantity,0) AS quantity
			FROM lpg_import AS i, employee AS eo, vendor AS v
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id AND eo.organization_id=v.equal_organization_id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',v.id,',%')))
			UNION ALL
			SELECT v.equal_organization_id AS organization_id, i.vendor_id, -COALESCE(i.actual_quantity,0) AS quantity 
			FROM lpg_import AS i, vendor AS v
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date AND i.vendor_id=v.id
				AND _organization_ids LIKE CONCAT('%,',v.equal_organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',i.vendor_id,',%')))
			UNION ALL
			SELECT eo.organization_id, v.id AS vendor_id, -COALESCE(s.quantity,0) AS quantity
			FROM lpg_sale AS s, employee AS eo, vendor AS v
			WHERE DATE(s.sale_date) >= _from_date AND DATE(s.sale_date) < _to_date	
				AND s.created_employee_id=eo.id AND v.equal_organization_id=eo.organization_id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',v.id,',%')))
			UNION ALL
			SELECT sv.organization_id, sv.vendor_id, -COALESCE(f_det.quantity*k.weight,0) AS quantity 
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv, shell AS s, shell_kind AS k
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id AND sv.shell_id=s.id AND s.kind_id=k.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			UNION ALL
			SELECT rv.organization_id, rv.vendor_id, COALESCE(s.gas_return,0) AS quantity 
			FROM gas_wholesale AS s, employee AS eo, gas_return_vendor AS rv
			WHERE DATE(s.created_date) >= _from_date AND DATE(s.created_date) < _to_date
				AND s.created_employee_id=eo.id AND eo.organization_id=rv.organization_id
				AND _organization_ids LIKE CONCAT('%,',rv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',rv.vendor_id,',%')))
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND v.is_gas=1
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_money` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_money` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_money`(IN _date VARCHAR(20), IN _is_list INT, IN _is_value INT
	, IN _organization_ids TEXT, IN _is_cash int, OUT _out_stock INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM money_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS account_id, CONCAT(a.number,' - ',a.bank,' - ',a.branch) AS account_name, SUM(COALESCE(tbl.in_stock,0)) AS opening_stock
		FROM organization AS o, account AS a
		LEFT JOIN
		(
			SELECT account_id, in_stock
			FROM money_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT a.account_id, -COALESCE(a.amount,0) AS in_stock
			FROM employee_advance AS a
			WHERE DATE(a.advance_date) >= _from_date AND DATE(a.advance_date) < _to_date
			GROUP BY a.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.amount,0) AS in_stock
			FROM employee_off_money AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_export_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.amount,0) AS in_stock
			FROM shell_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM lpg_import AS i
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM lpg_sale AS i
			WHERE DATE(i.sale_date) >= _from_date AND DATE(i.sale_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM gas_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_wholesale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_retail AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM shell_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM accessory_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM promotion_material_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM petro_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM good_import AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM accessory_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM petro_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM good_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM vendor_debt AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM retail_debt AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM wholesale_debt AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.amount,0) AS in_stock
			FROM income AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(amount/IF(month_count=0,1,month_count),0) AS in_stock
			FROM expense AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.money_amount,0) AS in_stock
			FROM transport_service AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM inner_sale AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
			UNION ALL
			SELECT i.account_id, -COALESCE(i.total,0) AS in_stock
			FROM borrow AS i
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			GROUP BY i.account_id
		) AS tbl ON tbl.account_id=a.id
		WHERE a.organization_id=o.id AND o.STATUS=1
		GROUP BY a.id
		ORDER BY o.NAME, a.number;
	ELSEIF _is_value=1 THEN
		SELECT SUM(COALESCE(tbl.in_stock,0)) INTO _out_stock
		FROM organization AS o, account AS a
		LEFT JOIN
		(
			SELECT account_id, in_stock
			FROM money_in_stock AS s, account AS a
			WHERE DATEDIFF(s.`day`, _from_date) >= 0 AND DATEDIFF(s.`day`, _to_date) <= 0
				AND s.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT a.account_id, -COALESCE(a.amount,0) AS in_stock
			FROM employee_advance AS a, account AS ac
			WHERE DATE(a.advance_date) >= _from_date AND DATE(a.advance_date) < _to_date
				AND a.account_id=ac.id AND ac.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',ac.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.amount,0) AS in_stock
			FROM employee_off_money AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_export_wholesale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.amount,0) AS in_stock
			FROM shell_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM lpg_import AS i, account AS a
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM lpg_sale AS i, account AS a
			WHERE DATE(i.sale_date) >= _from_date AND DATE(i.sale_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM gas_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_wholesale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM gas_retail AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM shell_sale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM accessory_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM promotion_material_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM petro_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM good_import AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM accessory_sale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM petro_sale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM good_sale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.paid,0) AS in_stock
			FROM vendor_debt AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM retail_debt AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM wholesale_debt AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.amount,0) AS in_stock
			FROM income AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(amount/IF(month_count=0,1,month_count),0) AS in_stock
			FROM expense AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.money_amount,0) AS in_stock
			FROM transport_service AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, COALESCE(i.paid,0) AS in_stock
			FROM inner_sale AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
			UNION ALL
			SELECT i.account_id, -COALESCE(i.total,0) AS in_stock
			FROM borrow AS i, account AS a
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.account_id=a.id AND a.is_cash=_is_cash
				AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		) AS tbl ON tbl.account_id=a.id
		WHERE a.organization_id=o.id AND o.STATUS=1;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_oil` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_oil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_oil`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS store_id, so.NAME AS store_name, a.id AS oil_id, a.CODE AS oil_code, a.NAME AS oil_name, SUM(COALESCE(tbl.in_stock,0)) AS opening_stock
		FROM oil AS a 
		LEFT JOIN store AS so ON 1 
		LEFT JOIN organization AS o ON so.organization_id=o.id
		LEFT JOIN
		(
			SELECT oil_id, store_id, COALESCE(in_stock,0) AS in_stock
			FROM oil_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i_det.oil_id, i.store_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_import_detail AS i_det, oil_import AS i
			WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i_det.oil_id, i_det.store_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_detail AS i_det, oil_sale AS i
			WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i_det.oil_id, i_det.store_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_promotion AS i_det, oil_sale AS i
			WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i_det.oil_id, i_det.store_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_return_detail AS i_det, oil_sale_return AS i
			WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
		) AS tbl ON tbl.oil_id=a.id AND tbl.store_id=so.id
		WHERE a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND so.is_oil=1
		GROUP BY o.id, so.id, a.id
		ORDER BY o.NAME, so.NAME, a.NAME
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_petro` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_petro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_petro`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM petro_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS store_id, so.NAME AS store_name, a.id AS petro_id, a.NAME AS petro_name, COALESCE(SUM(tbl.quantity),0) AS opening_stock
		FROM organization AS o 
		LEFT JOIN store AS so ON 1
		LEFT JOIN petro AS a ON 1
		LEFT JOIN
		(
			SELECT petro_id, store_id, organization_id, COALESCE(in_stock,0) AS quantity
			FROM petro_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i_det.petro_id, s.id AS store_id, s.organization_id, COALESCE(i_det.quantity,0) AS quantity
			FROM petro_import_detail AS i_det, petro_import AS i, store AS s
			WHERE i_det.petro_import_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id
			UNION ALL
			SELECT i_det.petro_id, s.id AS store_id, s.organization_id, -COALESCE(i_det.quantity,0) AS quantity
			FROM petro_sale_detail AS i_det, petro_sale AS i, store AS s
			WHERE i_det.petro_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id
		) AS tbl ON tbl.organization_id=o.id AND tbl.petro_id=a.id AND tbl.store_id=so.id
		WHERE a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND so.is_petro=1
		GROUP BY o.id, so.id, a.id
		ORDER BY o.NAME, so.NAME, a.NAME
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_promotion_material` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_promotion_material` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_promotion_material`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM promotion_material_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, a.id AS promotion_material_id, a.NAME AS promotion_material_name, SUM(COALESCE(tbl.quantity,0)) AS opening_stock
		FROM organization AS o
		LEFT JOIN promotion_material AS a ON 1
		LEFT JOIN
		(
			SELECT promotion_material_id, organization_id, COALESCE(in_stock,0) AS quantity
			FROM promotion_material_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i_det.promotion_material_id, eo.organization_id, COALESCE(i_det.quantity,0) AS quantity
			FROM promotion_material_import_detail AS i_det, promotion_material_import AS i, employee AS eo
			WHERE i_det.promotion_material_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i_det.promotion_material_id, eo.organization_id, -COALESCE(i_det.quantity,0) AS quantity
			FROM gas_wholesale_promotion AS i_det, gas_wholesale AS i, employee AS eo
			WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
		) AS tbl ON tbl.organization_id=o.id AND tbl.promotion_material_id=a.id
		WHERE a.STATUS=1 AND o.STATUS=1
		GROUP BY o.id, a.id
		ORDER BY o.NAME, a.NAME
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_shell` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_shell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_shell`(IN _date VARCHAR(20), IN _is_list INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM shell_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, s.id AS shell_id, s.NAME AS shell_name, SUM(COALESCE(tbl.in_stock,0)) AS opening_stock
		FROM organization AS o, shell AS s, shell_vendor AS sv
		LEFT JOIN
		(
			SELECT organization_id, shell_id, in_stock
			FROM shell_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i.shell_id, eo.organization_id, COALESCE(i.quantity,0) AS in_stock
			FROM shell_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT sv.shell_id, sv.organization_id,  -COALESCE(f_det.quantity,0) AS in_stock
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
			WHERE DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.fraction_id=f.id AND f_det.shell_id=sv.id
			UNION ALL
			SELECT i_det.shell_id, eo.organization_id, COALESCE(i_det.quantity,0) AS in_stock
			FROM gas_wholesale_return_shell AS i_det, gas_wholesale AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.gas_wholesale_id=i.id AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i_det.shell_id, eo.organization_id, -COALESCE(i_det.quantity,0) AS in_stock
			FROM shell_sale_detail AS i_det, shell_sale AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.shell_sale_id=i.id AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.shell_id, eo.organization_id, COALESCE(i.quantity,0) AS in_stock
			FROM old_shell AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT sv.shell_id, sv.organization_id, COALESCE(f_det.quantity,0) AS in_stock
			FROM shell_return_detail AS f_det, shell_return AS f, shell_vendor AS sv
			WHERE DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date 
				AND f_det.shell_return_id=f.id AND f_det.shell_id=sv.id
			UNION ALL
			SELECT sv.shell_id, sv.organization_id, -COALESCE(f_det.quantity,0) AS in_stock
			FROM shell_return_supplier_detail AS f_det, shell_return_supplier AS f, shell_vendor AS sv
			WHERE DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date 
				AND f_det.shell_return_supplier_id=f.id AND f_det.shell_id=sv.id
			UNION ALL
			SELECT f_det.shell_id, eo.organization_id,  COALESCE(f_det.quantity,0) AS in_stock
			FROM vehicle_in_return_shell_detail AS f_det, vehicle_in AS f, employee AS eo
			WHERE DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date 
				AND f_det.vehicle_in_id=f.id AND f.created_employee_id=eo.id
			UNION ALL
			SELECT f_det.shell_id, eo.organization_id, COALESCE(f_det.quantity,0) AS in_stock
			FROM gas_export_wholesale_shell_detail AS f_det, gas_export_wholesale AS f, employee AS eo
			WHERE  DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date 
				AND f_det.gas_export_wholesale_id=f.id AND f.created_employee_id=eo.id
		) AS tbl ON tbl.organization_id=sv.organization_id AND tbl.shell_id=sv.shell_id
		WHERE s.STATUS=1 AND o.STATUS=1 AND sv.shell_id=s.id AND sv.organization_id=o.id 
		GROUP BY o.id, s.id
		ORDER BY o.NAME, s.NAME;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_shell_gas` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_shell_gas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_shell_gas`(IN _date VARCHAR(20), IN _is_list INT, IN _is_value INT
	, IN _organization_ids TEXT, IN _vendor_ids TEXT, OUT _gas_12_stock INT, OUT _gas_45_stock INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM shell_gas_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, so.id AS shell_id, so.NAME AS shell_name, a.id AS vendor_id, a.NAME AS vendor_name
			, SUM(COALESCE(tbl.quantity,0)) -- + COALESCE(tbl_return.return_12,0) + COALESCE(tbl_return.return_45,0) 
			AS opening_stock
		FROM organization AS o, shell AS so, vendor AS a, organization_shell AS os, shell_vendor AS sv
		LEFT JOIN
		(
			SELECT shell_vendor_id AS id, in_stock AS quantity
			FROM shell_gas_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
			UNION ALL
			SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
			FROM gas_import_detail AS f_det, gas_import AS f, shell_vendor AS sv
			WHERE f_det.gas_import_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			-- FROM gas_wholesale_detail AS i_det, gas_wholesale AS i, shell_vendor AS sv
			-- WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			--	AND i_det.shell_id=sv.id
			UNION ALL
			SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			FROM vehicle_out_detail AS i_det, vehicle_out AS i, shell_vendor AS sv
			WHERE i_det.vehicle_out_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.shell_id=sv.id
			UNION ALL
			SELECT sv.id, COALESCE(i_det.quantity,0) AS quantity
			FROM vehicle_in_detail AS i_det, vehicle_in AS i, shell_vendor AS sv
			WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.shell_id=sv.id
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(f_det.quantity,0) AS quantity
			-- FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f, shell_vendor AS sv
			-- WHERE f_det.gas_export_wholesale_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
			--	AND f_det.shell_id=sv.id
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			-- FROM inner_sale_detail AS i_det, inner_sale AS i, shell_vendor AS sv
			-- WHERE i_det.inner_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			--	AND i_det.shell_id=sv.id
		) AS tbl ON tbl.id=sv.id
		-- left join
		-- (
		-- 	SELECT SUM(IF(shell_12.id IS NOT NULL, COALESCE(r.quantity,0),0)) AS return_12, SUM(IF(shell_45.id IS NOT NULL, COALESCE(r.quantity,0),0)) AS return_45
		-- 	FROM gas_wholesale AS g, gas_wholesale_return_shell AS r
		-- 	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON r.shell_id=shell_12.id
		-- 	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON r.shell_id=shell_45.id
		-- 	WHERE DATE(g.created_date) >= _from_date AND DATE(g.created_date) < _to_date
		-- 		AND g.id=r.gas_wholesale_id
		-- ) as tbl_return on 1
		WHERE sv.shell_id=so.id AND sv.organization_id=o.id AND sv.vendor_id=a.id AND a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND a.is_gas=1
			AND o.id=os.organization_id AND so.id=os.shell_id
		GROUP BY o.id, so.id, a.id
		ORDER BY o.NAME, so.NAME, a.NAME;
	ELSEIF _is_value=1 THEN
		SELECT SUM(IF(shell_12.id IS NOT NULL, COALESCE(tbl.quantity,0),0)) -- + COALESCE(tbl_return.return_12,0)
			, SUM(IF(shell_45.id IS NOT NULL, COALESCE(tbl.quantity,0),0)) -- + COALESCE(tbl_return.return_45,0)
			INTO _gas_12_stock, _gas_45_stock 
		FROM organization AS o, shell AS so, vendor AS a, organization_shell AS os, shell_vendor AS sv
		LEFT JOIN
		(
			SELECT sg.shell_vendor_id AS id, sg.in_stock AS quantity
			FROM shell_gas_in_stock sg, shell_vendor AS sv
			WHERE DATEDIFF(sg.`day`, _from_date) >= 0 AND DATEDIFF(sg.`day`, _to_date) <= 0
				AND sg.shell_vendor_id=sv.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			UNION ALL
			SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			UNION ALL
			SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
			FROM gas_import_detail AS f_det, gas_import AS f, shell_vendor AS sv
			WHERE f_det.gas_import_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
			 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
			 	AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			-- FROM gas_wholesale_detail AS i_det, gas_wholesale AS i, shell_vendor AS sv
			-- WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			-- 	AND i_det.shell_id=sv.id
			-- 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
			-- 	AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			UNION ALL
			SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			FROM vehicle_out_detail AS i_det, vehicle_out AS i, shell_vendor AS sv
			WHERE i_det.vehicle_out_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.shell_id=sv.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			UNION ALL
			SELECT sv.id, COALESCE(i_det.quantity,0) AS quantity
			FROM vehicle_in_detail AS i_det, vehicle_in AS i, shell_vendor AS sv
			WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i_det.shell_id=sv.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(f_det.quantity,0) AS quantity
			-- FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f, shell_vendor AS sv
			-- WHERE f_det.gas_export_wholesale_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
			-- 	AND f_det.shell_id=sv.id
			-- 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
			-- 	AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
			-- UNION ALL
			-- SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
			-- FROM inner_sale_detail AS i_det, inner_sale AS i, shell_vendor AS sv
			-- WHERE i_det.inner_sale_id=i.id AND DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
			-- 	AND i_det.shell_id=sv.id
			-- 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
			-- 	AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
		) AS tbl ON tbl.id=sv.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		-- left join
		-- (
		-- 	SELECT SUM(IF(shell_12.id IS NOT NULL, COALESCE(r.quantity,0),0)) AS return_12, SUM(IF(shell_45.id IS NOT NULL, COALESCE(r.quantity,0),0)) AS return_45
		-- 	FROM gas_wholesale AS g, employee AS e, gas_wholesale_return_shell AS r
		-- 	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON r.shell_id=shell_12.id
		-- 	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON r.shell_id=shell_45.id
		-- 	WHERE DATE(g.created_date) >= _from_date AND DATE(g.created_date) < _to_date
		-- 		AND g.created_employee_id=e.id
		-- 		AND g.id=r.gas_wholesale_id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
		-- ) as tbl_return on 1
		WHERE sv.shell_id=so.id AND sv.organization_id=o.id AND sv.vendor_id=a.id AND a.STATUS=1 AND o.STATUS=1 AND so.STATUS=1 AND a.is_gas=1
			AND o.id=os.organization_id AND so.id=os.shell_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_shield` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_shield` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_shield`(IN _date VARCHAR(20), IN _is_list INT, IN _is_value INT
	, IN _organization_ids TEXT, IN _vendor_ids TEXT, OUT _out_stock INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM shield_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _is_list=1 THEN
		SELECT o.id AS organization_id, o.NAME AS organization_name, v.id AS vendor_id, v.NAME AS vendor_name, COALESCE(SUM(tbl.quantity),0) AS opening_stock
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT COALESCE(in_stock,0) AS quantity, vendor_id, organization_id
			FROM shield_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT COALESCE(i.quantity,0) AS quantity, i.vendor_id, eo.organization_id
			FROM shield_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT -COALESCE(i.quantity,0) AS quantity, i.vendor_id, eo.organization_id
			FROM shield_decrease AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT -COALESCE(f_det.quantity,0) AS quantity, sv.vendor_id, sv.organization_id
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) >= _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND v.is_gas=1
		GROUP BY vo.organization_id, vo.vendor_id
		ORDER BY o.NAME, v.NAME
		;
	ELSEIF _is_value=1 THEN
		SELECT COALESCE(SUM(tbl.quantity),0) INTO _out_stock
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT COALESCE(in_stock,0) AS quantity, vendor_id, organization_id
			FROM shield_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',vendor_id,',%')))
			UNION ALL
			SELECT COALESCE(i.quantity,0) AS quantity, i.vendor_id, eo.organization_id
			FROM shield_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',i.vendor_id,',%')))
			UNION ALL
			SELECT -COALESCE(i.quantity,0) AS quantity, i.vendor_id, eo.organization_id
			FROM shield_decrease AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',i.vendor_id,',%')))
			UNION ALL
			SELECT -COALESCE(f_det.quantity,0) AS quantity, sv.vendor_id, sv.organization_id
			FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
			WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date
				AND f_det.shell_id=sv.id
				AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
				AND ((_vendor_ids='' AND 1) OR (_vendor_ids<>'' AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')))
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND v.is_gas=1
		;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_in_stock_vendor` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_in_stock_vendor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_in_stock_vendor`(IN _date VARCHAR(20), IN _kind INT, IN _vendor_id INT, IN _organization_ids TEXT
	, OUT _out_amount DOUBLE, OUT _out_transport_amount DOUBLE, OUT _out_shell_12 INT, OUT _out_shell_45 INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _date<>'' THEN
		SELECT STR_TO_DATE(_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM vendor_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 ORDER BY `day` DESC LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _kind=1 THEN -- export_customer_opening_stock
		SELECT o.id AS organization_id, o.NAME AS organization_name, v.id AS vendor_id, v.NAME AS vendor_name
			, SUM(COALESCE(tbl.amount,0)) AS opening_stock
			, SUM(COALESCE(tbl.shell_12,0)) AS opening_stock_12
			, SUM(COALESCE(tbl.shell_45,0)) AS opening_stock_45
			, SUM(COALESCE(tbl.transport_debt,0)) AS opening_transport_stock
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT vendor_id, organization_id, amount, shell_12, shell_45, transport_amount AS transport_debt
			FROM vendor_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM lpg_import AS i, employee AS eo
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM gas_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, COALESCE(IF(shell_12.id IS NOT NULL, i.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, i.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, shell_import AS i
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON i.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON i.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, gas_import AS i, gas_import_detail AS idet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND idet.shell_id=sv.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM oil_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, - COALESCE(IF(i.kind=1,i.paid,0),0) AS amount, 0 AS quantity_12, 0 AS quantity_45
				, - COALESCE(IF(i.kind=2,i.paid,0),0) AS transport_debt
			FROM vendor_debt AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM promotion_material_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, shell_return_supplier AS i, shell_return_supplier_detail AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_vendor_id AS vendor_id, eo.organization_id, 0 AS amount, 0 AS quantity_12, 0 AS quantity_45
				, COALESCE(i.vendor_amount,0) AS transport_debt
			FROM transport_service AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM accessory_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, -COALESCE(i.amount,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=1
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.amount,0) AS transport_debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=2
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM good_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM petro_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id
			UNION ALL
			SELECT idet.vendor_id, eo.organization_id, -COALESCE(idet.quantity*idet.price_before_commission,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM oil_sale_detail AS idet, oil_sale AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.id=idet.oil_sale_id
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1
		GROUP BY o.id, v.id
		ORDER BY o.NAME, v.NAME
		;
	ELSEIF _kind=3 THEN -- set value
		SELECT SUM(COALESCE(tbl.amount,0)), SUM(COALESCE(tbl.transport_debt,0)), SUM(COALESCE(tbl.shell_12,0)), SUM(COALESCE(tbl.shell_45,0))
			INTO _out_amount, _out_transport_amount, _out_shell_12, _out_shell_45
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		LEFT JOIN
		(
			SELECT vendor_id, organization_id, amount, shell_12, shell_45, transport_amount AS transport_debt
			FROM vendor_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 AND vendor_id=_vendor_id
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM lpg_import AS i, employee AS eo
			WHERE DATE(i.import_date) >= _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM gas_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, COALESCE(IF(shell_12.id IS NOT NULL, i.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, i.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, shell_import AS i
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON i.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON i.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, gas_import AS i, gas_import_detail AS idet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date AND idet.shell_id=sv.id
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM oil_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, - COALESCE(IF(i.kind=1,i.paid,0),0) AS amount, 0 AS quantity_12, 0 AS quantity_45
				, - COALESCE(IF(i.kind=2,i.paid,0),0) AS transport_debt
			FROM vendor_debt AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM promotion_material_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount
				, -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS transport_debt
			FROM employee AS eo, shell_return_supplier AS i, shell_return_supplier_detail AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_vendor_id AS vendor_id, eo.organization_id, 0 AS amount, 0 AS quantity_12, 0 AS quantity_45
				, COALESCE(i.vendor_amount,0) AS transport_debt
			FROM transport_service AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM accessory_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, -COALESCE(i.amount,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=1  AND i.vendor_id=_vendor_id
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, 0 AS amount, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.amount,0) AS transport_debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=2  AND i.vendor_id=_vendor_id
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM good_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM petro_import AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT idet.vendor_id, eo.organization_id, -COALESCE(idet.quantity*idet.price_before_commission,0) AS amount, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
			FROM oil_sale_detail AS idet, oil_sale AS i, employee AS eo
			WHERE DATE(i.created_date) >= _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.id=idet.oil_sale_id AND idet.vendor_id=_vendor_id
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		) AS tbl ON tbl.organization_id=vo.organization_id AND tbl.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 
			AND vo.vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',vo.organization_id,',%')
		;
	END IF;
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
		values (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _accessory_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _customer_id, _in_stock, _in_stock_12, _in_stock_45);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _store_id, _good_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _vendor_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _account_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE money_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE money_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND account_id=_account_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `importOilOpeningStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `importOilOpeningStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importOilOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _store_id INT, IN _oil_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, in_stock INTO _id, _old_stock
	FROM oil_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND store_id=_store_id AND oil_id=_oil_id;
	
	IF _id IS NULL THEN
		INSERT INTO oil_in_stock(`day`, organization_id, store_id, oil_id, in_stock)
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _store_id, _oil_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE oil_in_stock SET in_stock=_in_stock WHERE id=_id;
	
		UPDATE oil_in_stock SET in_stock=in_stock + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND store_id=_store_id AND oil_id=_oil_id;
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _store_id, _petro_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _promotion_material_id, _in_stock);
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
		select STR_TO_DATE(_date,'%d/%m/%Y'), sv.id, _in_stock
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _shell_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _vendor_id, _in_stock);
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
		VALUES (STR_TO_DATE(_date,'%d/%m/%Y'), _organization_id, _vendor_id, _in_stock, _in_stock_transport);
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
	INSERT INTO accessory_import (CODE, created_date, vendor_id, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertAccessoryImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertAccessoryImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAccessoryImportDetail`(IN _accessory_import_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/* Procedure structure for procedure `insertCustomer` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertCustomer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCustomer`(in _name varchar(255), in _code varchar(20), in _organization_id int, in _status int, in _phone varchar(30)
	, in _bank_account text, in _tax varchar(30), in _presenter varchar(255), in _presenter_position varchar(255), in _address text, in _is_gas int
	, in _is_petro int, in _is_good int, in _is_oil int, in _commission_kind int, in _commission_percentage float, in _note text, out _id int)
BEGIN
	Insert Into customer (name, code, organization_id, status, phone, bank_account, tax, presenter, presenter_position, address, is_gas, is_petro, is_good, is_oil, commission_kind, commission_percentage, note)
	values (_name, _code, _organization_id, _status, _phone, _bank_account, _tax, _presenter, _presenter_position, _address, _is_gas, _is_petro, _is_good, _is_oil, _commission_kind, _commission_percentage, _note);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtAdjustment`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _vendor_id INT, IN _customer_id INT, in _kind int, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO debt_adjustment (CODE, created_date, amount, vendor_id, customer_id, kind, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _amount, _vendor_id, _customer_id, _kind, _note, _created_employee_id);
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
	INSERT INTO vendor_debt (CODE, vendor_id, created_date, paid, account_id, note, created_employee_id, kind)
	VALUES (_code, _vendor_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _paid, _account_id, _note, _created_employee_id, _kind);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtWholesale`(IN _code VARCHAR(20), IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, in _kind int, in _gas_wholesale_id int, OUT _id INT)
BEGIN
	INSERT INTO wholesale_debt (CODE, customer_id, created_date, paid, account_id, note, created_employee_id, kind, gas_wholesale_id)
	VALUES (_code, _customer_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _paid, _account_id, _note, _created_employee_id, _kind, _gas_wholesale_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDiscountCommissionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDiscountCommissionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDiscountCommissionDetail`(IN _discount_id INT, IN _commission_from double, IN _commission_to double, IN _commission double)
BEGIN
	INSERT INTO discount_oil_detail(discount_id, commission_from, commission_to, commission)
	VALUES (_discount_id, _commission_from, _commission_to, _commission);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployeeAdvance`(in _code varchar(20), in _employee_id int, in _advance_date varchar(20), in _amount double
	, in _account_id int, in _note text, in _created_employee_id int, in _inner_sale_id int, OUT _id INT)
BEGIN
	insert into employee_advance (code, employee_id, advance_date, amount, account_id, note, created_employee_id, inner_sale_id)
	values (_code, _employee_id, STR_TO_DATE(_advance_date,'%d/%m/%Y'), _amount, _account_id, _note, _created_employee_id, _inner_sale_id);
	SELECT LAST_INSERT_ID() INTO _id;
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
	INSERT INTO employee_off_money (CODE, employee_id, created_date, quantity, price, amount, account_id, note, created_employee_id)
	VALUES (_code, _employee_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _price, _amount, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
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
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	SET _f_date = STR_TO_DATE(_from_date,'%d/%m/%Y');
	SET _t_date = STR_TO_DATE(_to_date,'%d/%m/%Y');
	
	SET _y = 12 * (YEAR(_t_date) - YEAR(_f_date));
	SET _m = _y + MONTH(_t_date) - MONTH(_f_date);
	
	INSERT INTO expense (CODE, created_date, from_date, to_date, amount, account_id, note, content, is_usually, month_count, `type`, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), STR_TO_DATE(_from_date,'%d/%m/%Y'), STR_TO_DATE(_to_date,'%d/%m/%Y'), _amount, _account_id
		, _note, _content, _is_usually, _m, _type, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesale`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO gas_export_wholesale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesaleDetail`(IN _gas_export_wholesale_id INT, IN _shell_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO gas_export_wholesale_detail(gas_export_wholesale_id, shell_id, quantity, price, amount) 
	VALUES (_gas_export_wholesale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertExportWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertExportWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesaleReturnShellDetail`(IN _gas_export_wholesale_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFractionDetail`(in _fraction_id int, in _shell_id int, in _quantity int)
BEGIN
	insert into fraction_gas_detail(fraction_id, shell_id, quantity) values (_fraction_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), in _vendor_id int, in _store_id int
	, in _rate double, in _total double, in _paid double, in _debt double, in _account_id int, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO gas_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasImportDetail`(IN _gas_import_id INT, IN _shell_id INT, IN _quantity INT, in _price double
	, in _amount double, in _vendor_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	
	SELECT eo.organization_id INTO _organization_id
	FROM gas_import AS f, employee as eo
	WHERE f.id=_gas_import_id and f.created_employee_id=eo.id;
	
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
	, IN _amount DOUBLE)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesalePromotionMaterialDetail`(IN _gas_wholesale_id INT, IN _promotion_material_id INT, IN _quantity INT)
BEGIN
	INSERT INTO gas_wholesale_promotion(gas_wholesale_id, promotion_material_id, quantity) 
	VALUES (_gas_wholesale_id, _promotion_material_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesaleReturnShellDetail`(IN _gas_wholesale_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
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
	INSERT INTO good_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGoodImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGoodImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGoodImportDetail`(IN _good_import_id INT, IN _good_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO good_import_detail(good_import_id, good_id, quantity, price, amount) VALUES (_good_import_id, _good_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertIncome`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _amount DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _type int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO income (CODE, created_date, amount, account_id, note, content, `type`, created_employee_id)
	VALUES (_code, _date, _amount, _account_id, _note, _content, _type, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
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
		UNION ALL
		SELECT i_det.accessory_id, eo.organization_id, -SUM(i_det.quantity) AS in_stock
		FROM vehicle_in_accessory_detail AS i_det, vehicle_in AS i, employee AS eo
		WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
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
		SELECT i_det.oil_id, i.store_id, SUM(i_det.base_quantity) AS in_stock
		FROM oil_import_detail AS i_det, oil_import AS i
		WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.oil_id, i.store_id
		UNION ALL
		SELECT i_det.oil_id, i_det.store_id, -SUM(i_det.base_quantity) AS in_stock
		FROM oil_sale_detail AS i_det, oil_sale AS i
		WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.oil_id, i_det.store_id
		UNION ALL
		SELECT i_det.oil_id, i_det.store_id, -SUM(i_det.base_quantity) AS in_stock
		FROM oil_sale_promotion AS i_det, oil_sale AS i
		WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i_det.oil_id, i_det.store_id
		UNION ALL
		SELECT i_det.oil_id, i_det.store_id, SUM(i_det.base_quantity) AS in_stock
		FROM oil_sale_return_detail AS i_det, oil_sale_return AS i
		WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
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
		UNION ALL
		SELECT i.customer_id, SUM(IF(shell_12.id IS NOT NULL, idet.quantity,0)) AS quantity_12
			, SUM(IF(shell_45.id IS NOT NULL, idet.quantity,0)) AS quantity_45
			, 0 AS debt
		FROM shell_return AS i, shell_return_detail AS idet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.id=idet.shell_return_id
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
		SELECT i.customer_customer_id as customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.customer_amount) AS debt
		FROM transport_service AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date and i.customer_id<>0
		GROUP BY i.customer_customer_id
		UNION ALL
		SELECT i.customer_id AS customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.amount) AS debt
		FROM debt_adjustment AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date AND i.customer_id<>0
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS debt
		FROM oil_sale AS i
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
		GROUP BY i.customer_id
		UNION ALL
		SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -SUM(i.debt) AS debt
		FROM oil_sale_return AS i
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
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM oil_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		union all
		SELECT i.vendor_id, eo.organization_id, - SUM(if(i.kind=1,i.paid,0)) AS debt, 0 AS quantity_12, 0 AS quantity_45
			, - SUM(IF(i.kind=2,i.paid,0)) AS transport_debt
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
		SELECT i.vendor_vendor_id as vendor_id, eo.organization_id, 0 AS debt, 0 AS quantity_12, 0 AS quantity_45
			, SUM(i.vendor_amount) AS transport_debt
		FROM transport_service AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_vendor_id
		union all
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM accessory_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM debt_adjustment AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id and i.vendor_id<>0 and i.kind=1
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, 0 AS debt, 0 AS quantity_12, 0 AS quantity_45, SUM(i.debt) AS transport_debt
		FROM debt_adjustment AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=2
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM good_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT i.vendor_id, eo.organization_id, SUM(i.debt) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM petro_import AS i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id
		GROUP BY i.vendor_id
		UNION ALL
		SELECT idet.vendor_id, eo.organization_id, -SUM(idet.quantity*idet.price_before_commission) AS debt, 0 AS quantity_12, 0 AS quantity_45, 0 AS transport_debt
		FROM oil_sale_detail AS idet, oil_sale as i, employee AS eo
		WHERE DATE(i.created_date) > _date AND DATE(i.created_date) <= _current_date
			AND i.created_employee_id=eo.id and i.id=idet.oil_sale_id
		GROUP BY idet.vendor_id
	) AS tbl ON tbl.vendor_id=vo.vendor_id and tbl.organization_id=vo.organization_id
	LEFT JOIN (
		SELECT vendor_id, organization_id, COALESCE(amount,0) AS amount, COALESCE(shell_12,0) AS shell_12, COALESCE(shell_45,0) AS shell_45
			, COALESCE(transport_amount,0) AS transport_amount
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
	END WHILE;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInvoice`(IN _code VARCHAR(20), in _number text, in _customer_id int, IN _created_date VARCHAR(20)
	, IN _amount DOUBLE, IN _amount_paid DOUBLE, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO invoice (CODE, number, created_date, customer_id, amount, amount_paid, note, created_employee_id)
	VALUES (_code, _number, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _amount, _amount_paid, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInvoiceDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInvoiceDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInvoiceDetail`(in _invoice_id int, in _oil_sale_detail_id int, in _paid int, in _commissioned int, in _paid_amount double)
BEGIN
	insert into invoice_detail(invoice_id, oil_sale_detail_id, paid, commissioned, paid_amount) values(_invoice_id, _oil_sale_detail_id, _paid, _commissioned, _paid_amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInvoicePaidDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInvoicePaidDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInvoicePaidDetail`(in _invoice_id int, in _paid_date varchar(20), in _amount double)
BEGIN
	insert into invoice_paid_detail(invoice_id, paid_date, amount) values(_invoice_id, STR_TO_DATE(_paid_date,'%d/%m/%Y'), _amount);
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
	declare _link_lpg_ids text default '';
	SELECT GROUP_CONCAT(id) into _link_lpg_ids FROM lpg_sale WHERE CONCAT('%,',_link_lpg_codes,',%') LIKE CONCAT('%,',CODE,',%');
	
	INSERT INTO lpg_import (CODE, vendor_id, kind, import_date, paper_quantity, actual_quantity, price, vat, invoice_amount, amount, paid, debt, rate, account_id, route_id, note, link_lpg_codes, link_lpg_ids, created_employee_id)
	VALUES (_code, _vendor_id, _kind, STR_TO_DATE(_import_date,'%d/%m/%Y'), _paper_quantity, _actual_quantity, _price, _vat, _invoice_amount, _amount, _paid, _debt, _rate, _account_id, _route_id, _note, _link_lpg_codes, _link_lpg_ids, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLpgSale`(IN _code VARCHAR(20), IN _kind INT, IN _customer_id INT, IN _sale_date VARCHAR(20)
	, IN _quantity FLOAT, IN _price DOUBLE, IN _price_transport DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _account_id INT, IN _route_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO lpg_sale (CODE, kind, customer_id, sale_date, quantity, price, price_transport, vat, rate, amount, paid, debt, account_id, route_id, note, created_employee_id)
	VALUES (_code, _kind, _customer_id, STR_TO_DATE(_sale_date,'%d/%m/%Y'), _quantity, _price, _price_transport, _vat, _rate, _amount, _paid, _debt, _account_id, _route_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOilExport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilExport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilExport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _oil_sale_id INT, IN _customer_id INT
	, IN _total DOUBLE, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO oil_export (CODE, created_date, oil_sale_id, customer_id, total, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _oil_sale_id, _customer_id, _total, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOilExportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilExportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilExportDetail`(IN _oil_export_id INT, IN _oil_id INT, IN _oil_sale_detail_id INT, IN _quantity INT)
BEGIN
	INSERT INTO oil_export_detail(oil_export_id, oil_id, oil_sale_detail_id, quantity) 
	VALUES (_oil_export_id, _oil_id, _oil_sale_detail_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _store_id INT, IN _vendor_id INT
	, in _commission float, IN _rate DOUBLE, in _total_before_commission double, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT
	, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO oil_import (CODE, created_date, store_id, vendor_id, commission, rate, total_before_commission, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _store_id, _vendor_id, _commission, _rate, _total_before_commission, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOilImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOilImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOilImportDetail`(IN _oil_import_id INT, IN _oil_id INT, in _unit_id int, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE)
BEGIN
	DECLARE _base_unit_id, _rate_quantity INT DEFAULT 0;
	
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
	
	INSERT INTO oil_import_detail(oil_import_id, oil_id, unit_id, quantity, base_quantity, price, amount) 
	VALUES (_oil_import_id, _oil_id, _unit_id, _quantity, _rate_quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOldShell`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO old_shell (CODE, created_date, quantity, shell_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _shell_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
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
	INSERT INTO petro_import (CODE, created_date, vendor_id, store_id, rate, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _store_id, _rate, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPetroImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPetroImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPetroImportDetail`(IN _petro_import_id INT, IN _petro_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO petro_import_detail(petro_import_id, petro_id, quantity, price, amount) VALUES (_petro_import_id, _petro_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromotionMaterialImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _vendor_id INT
	, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO promotion_material_import (CODE, created_date, vendor_id, total, paid, debt, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _vendor_id, _total, _paid, _debt, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPromotionMaterialImportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPromotionMaterialImportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromotionMaterialImportDetail`(IN _promotion_material_import_id INT, IN _promotion_material_id INT
	, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleAccessoryDetail`(IN _accessory_sale_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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
	INSERT INTO good_sale (CODE, created_date, customer_id, store_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _store_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleGoodDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleGoodDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleGoodDetail`(IN _good_sale_id INT, IN _good_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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
	, IN _amount DOUBLE)
BEGIN
	INSERT INTO inner_sale_detail(inner_sale_id, shell_id, quantity, price, amount) VALUES (_inner_sale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOil`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, in _commission float, in _commission_kind int
	, in _commission_amount double, in _gap_agency_amount DOUBLE, in _gap_customer_amount DOUBLE, in _total_before_commission DOUBLE
	, IN _note TEXT, IN _created_employee_id INT, in _is_calculate_agency_commission int, OUT _id INT)
BEGIN
	INSERT INTO oil_sale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id, commission
		, commission_kind, commission_amount, gap_agency_amount, gap_customer_amount, total_before_commission, is_calculate_agency_commission)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id
		, _commission, _commission_kind, _commission_amount, _gap_agency_amount, _gap_customer_amount, _total_before_commission, _is_calculate_agency_commission);
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
	DECLARE _organization_id, _base_unit_id, _rate_quantity, _vendor_id INT DEFAULT 0;
	
	SELECT vendor_id INTO _vendor_id FROM oil WHERE id=_oil_id;
	
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
	
	INSERT INTO oil_sale_detail(oil_sale_id, oil_id, unit_id, store_id, quantity, base_quantity, price, amount, price_before_commission, commission_price, first_amount, commission, gap_agency_amount, gap_customer_amount, vendor_id) 
	VALUES (_oil_sale_id, _oil_id, _unit_id, _store_id, _quantity, _rate_quantity, _price, _amount, _price_before_commission, _commssion_price, _first_amount, _commission, _gap_agency_amount, _gap_customer_amount, _vendor_id);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleOilPromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOilPromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOilPromotionMaterialDetail`(IN _sale_oil_id INT, IN _oil_id INT, IN _unit_id INT, IN _store_id INT
	, IN _quantity INT)
BEGIN
	DECLARE _base_unit_id, _rate_quantity INT DEFAULT 0;
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
	INSERT INTO oil_sale_promotion(sale_oil_id, oil_id, unit_id, store_id, quantity, base_quantity) 
	VALUES (_sale_oil_id, _oil_id, _unit_id, _store_id, _quantity, _rate_quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleOilReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOilReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOilReturn`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _commission FLOAT, IN _commission_kind INT
	, IN _commission_amount DOUBLE, IN _gap_agency_amount DOUBLE, IN _gap_customer_amount DOUBLE, IN _total_before_commission DOUBLE
	, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO oil_sale_return (CODE, created_date, customer_id, total, paid, debt, total_pay, account_id, note, created_employee_id, commission
		, commission_kind, commission_amount, gap_agency_amount, gap_customer_amount, total_before_commission)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _total_pay, _account_id, _note, _created_employee_id
		, _commission, _commission_kind, _commission_amount, _gap_agency_amount, _gap_customer_amount, _total_before_commission);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleOilReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleOilReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleOilReturnDetail`(IN _oil_sale_return_id INT, in _oil_sale_detail_id int, IN _oil_id INT, IN _quantity INT, IN _price DOUBLE
	, IN _amount DOUBLE, IN _price_before_commission DOUBLE, IN _commssion_price FLOAT, IN _first_amount DOUBLE, IN _commission FLOAT
	, IN _gap_agency_amount DOUBLE, IN _gap_customer_amount DOUBLE)
BEGIN
	DECLARE _base_unit_id, _rate_quantity, _unit_id, _store_id INT DEFAULT 0;
	select unit_id, store_id into _unit_id, _store_id from oil_sale_detail where id=_oil_sale_detail_id;
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
	INSERT INTO oil_sale_return_detail(oil_sale_return_id, oil_sale_detail_id, oil_id, unit_id, store_id, quantity, base_quantity, price, amount, price_before_commission, commission_price, first_amount, commission, gap_agency_amount, gap_customer_amount) 
	VALUES (_oil_sale_return_id, _oil_sale_detail_id, _oil_id, _unit_id, _store_id, _quantity, _rate_quantity, _price, _amount, _price_before_commission, _commssion_price, _first_amount, _commission, _gap_agency_amount, _gap_customer_amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalePetro`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), in _customer_id int, in _store_id int, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO petro_sale (CODE, created_date, customer_id, store_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _store_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSalePetroDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSalePetroDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalePetroDetail`(IN _petro_sale_id INT, IN _petro_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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
	INSERT INTO shell_sale (CODE, created_date, customer_id, total, paid, debt, discount, total_pay, account_id, note, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSaleShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSaleShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSaleShellDetail`(IN _shell_sale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO shell_sale_detail(shell_sale_id, shell_id, quantity, price, amount) VALUES (_shell_sale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellImport`(IN _code VARCHAR(20), IN _shell_id INT, IN _created_date VARCHAR(20), IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id Int, IN _note TEXT, in _created_employee_id int, in _vendor_id int, OUT _id INT)
BEGIN
	declare _shell_vendor_id, _organization_id int default 0;
	INSERT INTO shell_import (CODE, shell_id, created_date, quantity, price, amount, account_id, note, created_employee_id, vendor_id)
	VALUES (_code, _shell_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _price, _amount, _account_id, _note, _created_employee_id, _vendor_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	select id into _shell_vendor_id from shell_vendor where shell_id=_shell_id and vendor_id=_vendor_id and organization_id=_organization_id;
	
	if _shell_vendor_id=0 then
		insert into shell_vendor(organization_id, shell_id, vendor_id, quantity) values(_organization_id, _shell_id, _vendor_id, _quantity);
	else
		update shell_vendor set quantity=quantity+_quantity where id=_shell_vendor_id;
	end if;
	
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturnDetail`(IN _shell_return_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellReturnSupplierDetail`(IN _shell_return_supplier_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
	INSERT INTO shell_return_supplier_detail(shell_return_supplier_id, shell_id, quantity) VALUES (_shell_return_supplier_id, _shell_id, _quantity);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShieldDecrease` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShieldDecrease` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShieldDecrease`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, IN _vendor_id INT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO shield_decrease (CODE, created_date, quantity, note, vendor_id, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _note, _vendor_id, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShieldImport`(IN _code VARCHAR(20), IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, in _vendor_id int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO shield_import (CODE, created_date, quantity, note, vendor_id, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _quantity, _note, _vendor_id, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertTransportService` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertTransportService` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransportService`(IN _code VARCHAR(20), IN _vendor_id INT, IN _customer_id INT, IN _transporter_id INT
	, IN _charge_for_vendor INT, IN _charge_for_customer INT, IN _created_date VARCHAR(20), IN _in_quantity DOUBLE, IN _out_quantity DOUBLE
	, IN _price DOUBLE, IN _price_diff DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _rate DOUBLE, IN _rate_diff DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _organization_id, _organization_vendor_id, _organization_transport_vendor_id, _money_organization_id, _vendor_vendor_id, _customer_customer_id INT DEFAULT 0;
	DECLARE _money_amount, _vendor_amount, _customer_amount DOUBLE DEFAULT 0;
	
	SELECT eo.organization_id INTO _organization_id FROM employee AS eo WHERE eo.id=_created_employee_id;
	SELECT equal_organization_id INTO _organization_vendor_id FROM vendor WHERE id=_vendor_id;
	SELECT equal_organization_id INTO _organization_transport_vendor_id FROM vendor WHERE id=_transporter_id;
	IF _organization_vendor_id<>_organization_id THEN
		SET _organization_vendor_id=0;
	END IF;
	
	IF _organization_transport_vendor_id<>_organization_id THEN
		SET _organization_transport_vendor_id=0;
	END IF;
	
	-- chi dung tren phuong dien minh la ncc
	IF _charge_for_vendor=1 THEN	-- ben ban chiu
		IF _organization_vendor_id<>0 THEN	-- ben ban la minh
			IF _vendor_id<>_transporter_id THEN	-- minh khong phai la ben van chuyen
				SET _money_organization_id = _organization_vendor_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = -_debt;
			END IF;
		ELSE -- ben ban la cong ty khac
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_transport_vendor_id;
				SET _money_amount = _paid;
				SET _vendor_vendor_id = _vendor_id;
				SET _vendor_amount = _debt;
			END IF;
		END IF;
	ELSEIF _charge_for_customer=1 THEN	-- ben mua chiu
		IF _customer_id=0 THEN	-- ben mua la minh
			IF _organization_transport_vendor_id=0 THEN	-- minh khong phai la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = -_debt;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInAccessoryDetail`(IN _vehicle_in_id INT, IN _accessory_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO vehicle_in_accessory_detail(vehicle_in_id, accessory_id, quantity, price, amount) 
	VALUES (_vehicle_in_id, _accessory_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInDetail`(IN _vehicle_in_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO vehicle_in_detail(vehicle_in_id, shell_id, quantity, price, amount) VALUES (_vehicle_in_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInOilExportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInOilExportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInOilExportDetail`(IN _vehicle_in_id INT, IN _oil_export_id INT)
BEGIN
	INSERT INTO vehicle_in_oil_export_detail(vehicle_in_id, oil_export_id) VALUES (_vehicle_in_id, _oil_export_id);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInReturnShellDetail`(IN _vehicle_in_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleOutDetail`(IN _vehicle_out_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/* Procedure structure for procedure `insertVendorOiStoreDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVendorOiStoreDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVendorOiStoreDetail`(in _vendor_id int, in _store_id int)
BEGIN
	declare _id int default 0;
	select id into _id from vendor_oil_store where vendor_id=_vendor_id and store_id=_store_id;
	if _id=0 then
		insert into vendor_oil_store(vendor_id, store_id) values(_vendor_id, _store_id);
	end if;
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
	CALL get_in_stock_money(_start_date, 0, 1, _organization_ids, 0, _account_opening_stock);
	
	CALL get_in_stock_money(_start_date, 0, 1, _organization_ids, 1, _cash_opening_stock);
	
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
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM shell_sale AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM accessory_sale AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM petro_sale AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM good_sale AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.money_amount,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.money_amount,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM transport_service AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.paid,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.paid,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM inner_sale AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.created_date, IF(a.is_cash=0,o.total,0) AS account_income_amount, 0 AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, IF(a.is_cash=1,o.total,0) AS cash_income_amount, 0 AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM borrow AS o, account AS a
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
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _amount_debt, @a, _shell_12_debt, _shell_45_debt);
	SELECT created_date, SUM(COALESCE(total_pay,0)) AS total_pay, SUM(COALESCE(paid,0)) AS paid, '' AS note, SUM(COALESCE(gas_return_amount,0)) AS gas_return_amount
		, SUM(COALESCE(quantity_12,0)) AS quantity_12, SUM(IF(quantity_12>0,price_12,0)) AS price_12, SUM(IF(quantity_12>0,1,0)) AS price_12_count
		, SUM(COALESCE(quantity_45,0)) AS quantity_45, SUM(IF(quantity_45>0,price_45,0)) AS price_45, SUM(IF(quantity_45>0,1,0)) AS price_45_count
		, SUM(COALESCE(shell_return_12,0)) AS shell_return_12, SUM(COALESCE(shell_return_12t,0)) AS shell_return_12t, SUM(COALESCE(shell_return_45,0)) AS shell_return_45
	FROM(
		SELECT w.created_date, wholesale_detail_tbl.total_pay, (COALESCE(w.paid,0) + COALESCE(w.paid_old_debt_amount,0)) AS paid, w.note, w.gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM gas_wholesale AS w left join
		(
			SELECT w.id, SUM(det.price * det.quantity) AS total_pay
			FROM gas_wholesale AS w, gas_wholesale_detail AS det, employee AS eo
			WHERE w.id=det.gas_wholesale_id AND w.created_employee_id=eo.id 
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
				AND DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			GROUP BY w.id
		) AS wholesale_detail_tbl on w.id= wholesale_detail_tbl.id
		, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, 0 AS total_pay, 0 AS paid, '' AS note, 0 AS gas_return_amount
			, IF(shell_12.id IS NOT NULL, wdet.quantity,0) AS quantity_12, IF(shell_12.id IS NOT NULL, wdet.price,0) AS price_12
			, IF(shell_45.id IS NOT NULL, wdet.quantity,0) AS quantity_45, IF(shell_45.id IS NOT NULL, wdet.price,0) AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM gas_wholesale AS w, employee AS eo, gas_wholesale_detail AS wdet, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, 0 AS total_pay, 0 AS paid, '' AS note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 AS price_12, 0 AS quantity_45, 0 AS price_45
			, IF(shell_12.id IS NOT NULL, wdet.quantity,0) AS shell_return_12
			, IF(shell_12t.id IS NOT NULL, wdet.quantity,0) AS shell_return_12t
			, IF(shell_45.id IS NOT NULL, wdet.quantity,0) AS shell_return_45
		FROM gas_wholesale AS w, employee AS eo, gas_wholesale_return_shell AS wdet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12 ON wdet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_wholesale_id AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND w.customer_id=_customer_id
		UNION ALL
		SELECT w.created_date, 0 AS total_pay, 0 AS paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 AS price_12, 0 AS quantity_45, 0 AS price_45
			, IF(shell_12.id IS NOT NULL, wdet.quantity,0) AS shell_return_12
			, IF(shell_12t.id IS NOT NULL, wdet.quantity,0) AS shell_return_12t
			, IF(shell_45.id IS NOT NULL, wdet.quantity,0) AS shell_return_45
		FROM shell_return AS w, employee AS eo, shell_return_detail AS wdet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12 ON wdet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.shell_return_id AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND w.customer_id=_customer_id
/*
		UNION ALL
		SELECT w.created_date, w.total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM good_sale AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, w.total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM petro_sale AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, w.total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM shell_sale AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.sale_date AS created_date, w.amount AS total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM lpg_sale AS w, employee AS eo
		WHERE DATE(w.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, 0 AS total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM wholesale_debt AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id=_customer_id 
		UNION ALL
		SELECT w.created_date, w.amount AS total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM transport_service AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	AND w.customer_id<>0 AND w.customer_customer_id=_customer_id
		UNION ALL
		SELECT wd.created_date, 0 AS total_pay, wd.amount AS paid, wd.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 AS price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM debt_adjustment AS wd, employee AS eo
		WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND wd.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND wd.customer_id=_customer_id
		UNION ALL
		SELECT w.created_date, w.total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 AS price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM oil_sale AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND w.customer_id=_customer_id
		UNION ALL
		SELECT w.created_date, w.total_pay, w.paid, w.note, 0 AS gas_return_amount
			, 0 AS quantity_12, 0 AS price_12, 0 AS quantity_45, 0 AS price_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
		FROM oil_sale_return AS w, employee AS eo
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.created_employee_id=eo.id 
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND w.customer_id=_customer_id
	*/
	) AS tbl
	GROUP BY tbl.created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_agency_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_agency_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_agency_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _agency_id INT)
BEGIN
	SELECT c.CODE AS customer_code, c.NAME AS customer_name, o.CODE AS oil_code, o.NAME AS oil_name, u.NAME AS unit_name, COALESCE(oe.CODE,'') AS oil_export_code
		, osdet.quantity, osdet.price_before_commission AS price, osdet.amount - osdet.gap_customer_amount * osdet.quantity AS amount
		, IF(idet.id IS NOT NULL AND idet.paid=1,(osdet.gap_agency_amount * osdet.quantity + IF(os.is_calculate_agency_commission=1,osdet.price_before_commission * osdet.quantity * (IF(aco.commission IS NULL,100,aco.commission)-(osdet.commission_price+osdet.commission)) / 100,0)),0) AS commission
		, IF(idet.id IS NOT NULL AND idet.commissioned=1,1,0) AS is_paid
	FROM oil_sale AS os, oil AS o, unit AS u, customer AS c, employee AS eo, agency_customer AS ac, oil_sale_detail AS osdet
		LEFT JOIN agency_commission AS aco ON aco.agency_id=_agency_id AND (osdet.commission_price + osdet.commission) >= commission_from AND (osdet.commission_price + osdet.commission) < commission_to
		LEFT JOIN invoice_detail AS idet ON idet.oil_sale_detail_id=osdet.id
		LEFT JOIN oil_export_detail AS edet ON edet.oil_sale_detail_id=osdet.id
		LEFT JOIN oil_export AS oe ON edet.oil_export_id=oe.id
	WHERE DATE(os.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(os.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND os.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		AND os.customer_id=c.id AND os.customer_id=ac.customer_id AND ac.agency_id=_agency_id
		AND os.id=osdet.oil_sale_id AND osdet.oil_id=o.id AND osdet.unit_id=u.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_customer_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_customer_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_customer_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT)
BEGIN
	SELECT o.CODE AS oil_code, o.NAME AS oil_name, u.NAME AS unit_name, COALESCE(oe.CODE,'') AS oil_export_code, osdet.quantity
, osdet.price_before_commission AS price, osdet.quantity * osdet.price_before_commission AS amount
, IF(idet.id IS NOT NULL AND idet.paid=1, osdet.gap_customer_amount * osdet.quantity, 0) AS commission
, IF(idet.id IS NOT NULL AND idet.commissioned=1,1,0) AS is_paid
FROM oil_sale AS os, oil AS o, unit AS u, employee AS eo, oil_sale_detail AS osdet
LEFT JOIN invoice_detail AS idet ON idet.oil_sale_detail_id=osdet.id
LEFT JOIN oil_export_detail AS edet ON edet.oil_sale_detail_id=osdet.id
LEFT JOIN oil_export AS oe ON edet.oil_export_id=oe.id
WHERE DATE(os.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(os.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
AND os.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
AND os.customer_id=_customer_id
AND os.id=osdet.oil_sale_id AND osdet.oil_id=o.id AND osdet.unit_id=u.id
;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare_gas` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare_gas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare_gas`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT
	, OUT _shell12_debt INT, OUT _shell45_debt INT, OUT _amount_debt DOUBLE)
BEGIN
	CALL get_in_stock_vendor(_start_date, 3, _vendor_id, _organization_ids, _amount_debt, @a, _shell12_debt, _shell45_debt);
	
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
		FROM gas_import AS w, employee AS eo, gas_import_detail AS wdet, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_import_id AND wdet.shell_id=sv.id AND w.vendor_id=_vendor_id 
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
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _opening_stock, @a, @a, @a);
	
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
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _amount_debt, @a, @a, @a);
	
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
	DECLARE _vendor_id, _customer_id INT DEFAULT 0;
	DECLARE _vendor_debt, _customer_debt, _customer_amount, _customer_transport_amount, _amount_debt, _transport_amount_debt DOUBLE DEFAULT 0;
	
	SELECT vendor_id, customer_id INTO _vendor_id, _customer_id FROM vendor_customer WHERE id=_vendor_customer_id;
	
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _customer_amount, _customer_transport_amount, @a, @a);
	
	set _customer_debt = _customer_amount + _customer_transport_amount;
	
	CALL get_in_stock_vendor(_start_date, 3, _vendor_id, _organization_ids, _amount_debt, _transport_amount_debt, @a, @a);
	
	set _vendor_debt = _amount_debt + _transport_amount_debt;
	
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
	DECLARE _customer_id INT DEFAULT -1;
	declare _amount_debt, _transport_amount_debt double default 0;
	
	SELECT customer_id INTO _customer_id FROM vendor_customer WHERE vendor_id=_vendor_id AND _organization_ids LIKE CONCAT('%,',organization_id,',%') LIMIT 1;
	
	CALL get_in_stock_vendor(_start_date, 3, _vendor_id, _organization_ids, _amount_debt, _transport_amount_debt, @a, @a);
	
	set _opening_debt = _amount_debt + _transport_amount_debt;
		
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
	, IN _employee_id INT, IN _accessory_kind_id INT, IN _employee_oil_commission_id INT, IN _session_id VARCHAR(255), OUT _employee_ids TEXT
	, OUT _accessory_kind_ids TEXT, OUT _employee_oil_commission_ids TEXT, OUT _commission_12 DOUBLE, OUT _commission_45 DOUBLE, OUT _commission_lovo DOUBLE)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT COALESCE(commission,0) INTO _commission_12 FROM shell_kind WHERE weight=12;
	
	SELECT COALESCE(commission,0) INTO _commission_45 FROM shell_kind WHERE weight=45;
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _commission_lovo FROM parameter WHERE `code`='lovo';
	
	IF _employee_id=0 THEN
		DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
		INSERT INTO temp_gas_commission(session_id, id, created_date, quantity_12, quantity_45, quantity_lovo, accessory_kind_id, quantity_accessory
			, commission_accessory, employee_ids, employee_count, vehicle_plate, kind
			, employee_oil_commission_id, quantity_employee_oil_commission, commission_employee_oil_commission)
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, COALESCE(tbl.quantity_12,0) AS quantity_12, COALESCE(tbl.quantity_45,0) AS quantity_45
			, 0 AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count, v.plate, 'out'
			, 0 as employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
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
			, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
		FROM lo_vo AS lv, lo_vo_employee_detail AS lve, employee AS eo
		WHERE DATE(lv.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(lv.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND lv.id=lve.lo_vo_id AND lv.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY lv.id
		UNION ALL
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
			, tbl.kind_id, tbl.quantity_accessory, tbl.commission AS commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count, v.plate, 'acc'
			, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
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
		union all
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
			, 0 as kind_id, 0 as quantity_accessory, 0 AS commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count, v.plate, 'oil'
			, tbl.employee_oil_commission_id, tbl.quantity_accessory as quantity_employee_oil_commission, tbl.amount AS commission_employee_oil_commission
		FROM
		(
			SELECT v.vehicle_out_id, SUM(oe.quantity) AS quantity_accessory, eoc.id as employee_oil_commission_id, eoc.amount
			FROM vehicle_in AS v, vehicle_in_oil_export_detail AS vadet, employee AS eo, oil_export_detail AS oe, oil AS o, employee_oil_commission as eoc
			WHERE DATE(v.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(v.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND v.id=vadet.vehicle_in_id AND vadet.oil_export_id=oe.oil_export_id AND oe.oil_id=o.id and o.employee_commission_id=eoc.id
				AND v.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY v.id, eoc.id
		) AS tbl
		, vehicle_out_employee_detail AS ve, vehicle_out AS vo, vehicle AS v
		WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id AND vo.vehicle_id=v.id
		GROUP BY tbl.vehicle_out_id, tbl.employee_oil_commission_id
		;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT employee_ids),'') INTO _employee_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT accessory_kind_id),'') INTO _accessory_kind_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT employee_oil_commission_id),'') INTO _employee_oil_commission_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT created_date, vehicle_plate, 0 AS employee_id, SUM(quantity_12) AS quantity_12, SUM(quantity_45) AS quantity_45
			, SUM(quantity_lovo) AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory, 0 AS amount
			, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
		FROM temp_gas_commission
		WHERE session_id=_session_id 
		GROUP BY id ORDER BY created_date, id;
	ELSE
		IF _accessory_kind_id<>0 THEN
			SELECT tbl.created_date, t.vehicle_plate, 0 AS employee_id, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
				, _accessory_kind_id AS accessory_kind_id, SUM(t.quantity_accessory) AS quantity_accessory, 0 AS commission_accessory
				, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
				, (t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory + t.quantity_employee_oil_commission*t.commission_employee_oil_commission)/t.employee_count AS amount
			FROM (SELECT id, kind, created_date, session_id, accessory_kind_id FROM temp_gas_commission WHERE session_id=_session_id) AS tbl
			LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.id=tbl.id AND t.kind=tbl.kind AND t.accessory_kind_id=tbl.accessory_kind_id
			AND t.accessory_kind_id=_accessory_kind_id
			GROUP BY tbl.id ORDER BY tbl.created_date, tbl.id
			;
		ELSE
			if _employee_oil_commission_id<>0 then
				SELECT tbl.created_date, t.vehicle_plate, 0 AS employee_id, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
					, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
					, _employee_oil_commission_id AS employee_oil_commission_id, SUM(t.quantity_employee_oil_commission) AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
					, (t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory + t.quantity_employee_oil_commission*t.commission_employee_oil_commission)/t.employee_count AS amount
				FROM (SELECT id, kind, created_date, session_id, employee_oil_commission_id FROM temp_gas_commission WHERE session_id=_session_id) AS tbl
				LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.id=tbl.id AND t.kind=tbl.kind AND t.employee_oil_commission_id=tbl.employee_oil_commission_id AND t.employee_oil_commission_id=_employee_oil_commission_id
				where t.employee_oil_commission_id is not null
				GROUP BY tbl.id ORDER BY tbl.created_date, tbl.id
				;
			else
				SELECT tbl.created_date, CONCAT(COALESCE(ta.vehicle_plate,''),COALESCE(tox.vehicle_plate,'')) as vehicle_plate, _employee_id AS employee_id, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
					, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
					, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
					, SUM((COALESCE(ta.quantity_12,0)*_commission_12 + COALESCE(ta.quantity_45,0)*_commission_45 + COALESCE(ta.quantity_lovo,0)*_commission_lovo + COALESCE(ta.quantity_accessory,0)*COALESCE(ta.commission_accessory,0) + COALESCE(tox.quantity_employee_oil_commission,0)*COALESCE(tox.commission_employee_oil_commission,0))/IF(ta.employee_count<>0,ta.employee_count,IF(tox.employee_count<>0,tox.employee_count,1))) AS amount
				FROM (SELECT id, kind, created_date, session_id, accessory_kind_id, employee_oil_commission_id FROM temp_gas_commission WHERE session_id=_session_id) AS tbl
				LEFT JOIN temp_gas_commission AS ta ON ta.session_id=tbl.session_id AND ta.id=tbl.id AND ta.kind=tbl.kind AND ta.kind<>'acc' AND ta.accessory_kind_id=tbl.accessory_kind_id AND CONCAT("0,",ta.employee_ids,",0") LIKE CONCAT('%,',_employee_id,',%')
				LEFT JOIN temp_gas_commission AS tox ON tox.session_id=tbl.session_id AND tox.id=tbl.id AND tox.kind=tbl.kind AND tox.kind='oil' AND tox.employee_oil_commission_id=tbl.employee_oil_commission_id AND CONCAT("0,",tox.employee_ids,",0") LIKE CONCAT('%,',_employee_id,',%')
				GROUP BY tbl.id ORDER BY tbl.created_date, tbl.id
				;
			end if;
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
	
	INSERT INTO temp_gas_commission(session_id, id, created_date, kind, quantity_12, quantity_45, quantity_lovo, accessory_kind_id, quantity_accessory
		, commission_accessory, employee_ids, employee_count
		, employee_oil_commission_id, quantity_employee_oil_commission, commission_employee_oil_commission)
	SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 'out', COALESCE(tbl.quantity_12,0) AS quantity_12, COALESCE(tbl.quantity_45,0) AS quantity_45
		, 0 AS quantity_lovo, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
		, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count 
		, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
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
	SELECT _session_id, lv.id, lv.created_date, 'lovo', 0 AS quantity_12, 0 AS quantity_45, lv.quantity AS quantity_lovo
		, 0 AS accessory_kind_id, 0 AS quantity_accessory, 0 AS commission_accessory
		, GROUP_CONCAT(lve.employee_id) AS employee_ids, COUNT(lve.id) AS employee_count 
		, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
	FROM lo_vo AS lv, lo_vo_employee_detail AS lve, employee AS eo
	WHERE DATE(lv.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(lv.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND lv.id=lve.lo_vo_id AND lv.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
	GROUP BY lv.id
	UNION ALL
	SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 'acc', 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
		, tbl.kind_id, tbl.quantity_accessory, tbl.commission AS commission_accessory
		, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count 
		, 0 AS employee_oil_commission_id, 0 AS quantity_employee_oil_commission, 0 AS commission_employee_oil_commission
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
	UNION ALL
	SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 'oil', 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
		, 0 as kind_id, 0 as quantity_accessory, 0 AS commission_accessory
		, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count
		, tbl.employee_oil_commission_id, tbl.quantity_accessory AS quantity_employee_oil_commission, tbl.amount AS commission_employee_oil_commission
	FROM
	(
		SELECT v.vehicle_out_id, SUM(oe.quantity) AS quantity_accessory, eoc.id AS employee_oil_commission_id, eoc.amount
		FROM vehicle_in AS v, vehicle_in_oil_export_detail AS vadet, employee AS eo, oil_export_detail AS oe, oil AS o, employee_oil_commission AS eoc
		WHERE DATE(v.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(v.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND v.id=vadet.vehicle_in_id AND vadet.oil_export_id=oe.oil_export_id AND oe.oil_id=o.id AND o.employee_commission_id=eoc.id
			AND v.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY v.id, eoc.id
	) AS tbl
	, vehicle_out_employee_detail AS ve, vehicle_out AS vo
	WHERE tbl.vehicle_out_id=ve.vehicle_out_id AND tbl.vehicle_out_id=vo.id
	GROUP BY tbl.vehicle_out_id, tbl.employee_oil_commission_id
	;
	
		
	SELECT tbl_employee.id, tbl_employee.fullname as employee_name
		, SUM((COALESCE(ta.quantity_12,0)*0 + COALESCE(ta.quantity_45,0)*0 + COALESCE(ta.quantity_lovo,0)*0 + COALESCE(ta.quantity_accessory,0)*COALESCE(ta.commission_accessory,0) + COALESCE(tox.quantity_employee_oil_commission,0)*COALESCE(tox.commission_employee_oil_commission,0))/IF(ta.employee_count<>0,ta.employee_count,IF(tox.employee_count<>0,tox.employee_count,1))) AS amount
	FROM (SELECT id, fullname FROM employee WHERE STATUS=1) AS tbl_employee
	LEFT JOIN temp_gas_commission AS ta ON ta.session_id=_session_id AND ta.kind='acc' AND CONCAT("0,",ta.employee_ids,",0") LIKE CONCAT('%,',tbl_employee.id,',%')
	LEFT JOIN temp_gas_commission AS tox ON tox.session_id=_session_id AND tox.kind='oil' AND CONCAT("0,",tox.employee_ids,",0") LIKE CONCAT('%,',tbl_employee.id,',%')
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
	CALL get_in_stock_lpg(_start_date, 2, _organization_ids, _vendor_ids, _gas_stock);
	
	SELECT created_date AS content, created_date, coalesce(SUM(lpg_import),0) AS import_quantity, COALESCE(SUM(export_12_quantity),0) AS export_12_quantity
		, COALESCE(SUM(export_45_quantity),0) AS export_45_quantity, COALESCE(SUM(return_quantity),0) AS return_quantity
		, COALESCE(SUM(lpg_sale),0) AS export_quantity, '' AS note
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
	CALL get_in_stock_shell_gas(_start_date, 0, 1, _organization_ids, _vendor_ids, _gas_12_stock, _gas_45_stock);
	
	CALL get_in_stock_lpg(_start_date, 2, _organization_ids, _vendor_ids, _gas_stock);
	
	CALL get_in_stock_shield(_start_date, 0, 1, _organization_ids, _vendor_ids, _final_stock);
	
	SELECT created_date AS content, created_date, COALESCE(SUM(fraction_12),0) AS fraction_12, COALESCE(SUM(fraction_45),0) AS fraction_45
		, COALESCE(SUM(vehicle_out_12),0) AS vehicle_out_12, COALESCE(SUM(vehicle_out_45),0) AS vehicle_out_45
		, COALESCE(SUM(vehicle_in_12),0) AS vehicle_in_12, COALESCE(SUM(vehicle_in_45),0) AS vehicle_in_45
		, COALESCE(SUM(sale_12),0) AS sale_12, COALESCE(SUM(sale_45),0) AS sale_45
		, COALESCE(SUM(shield_import),0) AS shield_import, COALESCE(SUM(shield_decrease),0) AS shield_decrease
		, COALESCE(SUM(import_quantity),0) AS import_quantity
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
			AND pdet.id=det.fraction_id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
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
			AND det.vehicle_out_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
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
		FROM shield_import AS s, employee AS eo
		WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
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
			AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
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
			AND _vendor_ids LIKE CONCAT('%,',s.vendor_id,',%')
			AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY s.import_date
		-- UNION ALL
		-- SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		-- 	, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		-- 	, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		-- 	, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
		-- 	, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		-- FROM inner_sale AS pdet, inner_sale_detail AS det, shell_vendor AS sv
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		-- WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		-- 	AND det.inner_sale_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		-- 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
		-- GROUP BY pdet.created_date, sv.shell_id
		UNION ALL
		SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
			, 0 AS vehicle_out_12, 0 AS vehicle_out_45
			, 0 AS vehicle_in_12, 0 AS vehicle_in_45
			, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
			, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		FROM gas_import AS pdet, gas_import_detail AS det, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND det.gas_import_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
			AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
		GROUP BY pdet.created_date, sv.shell_id
		-- UNION ALL
		-- SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
		-- 	, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		-- 	, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		-- 	, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
		-- 	, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		-- FROM gas_wholesale AS pdet, gas_wholesale_detail AS det, shell_vendor AS sv
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		-- WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		-- 	AND det.gas_wholesale_id=pdet.id AND det.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		-- 	AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
		-- GROUP BY pdet.created_date, sv.shell_id
		-- union all
		-- SELECT g.created_date, 0 AS fraction_12, 0 AS fraction_45
		-- 	, 0 AS vehicle_out_12, 0 AS vehicle_out_45
		-- 	, 0 AS vehicle_in_12, 0 AS vehicle_in_45
		-- 	, SUM(IF(shell_12.id IS NOT NULL, r.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, r.quantity,0)) AS sale_45
		-- 	, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		-- FROM gas_wholesale AS g, employee AS e, gas_wholesale_return_shell AS r
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON r.shell_id=shell_12.id
		-- LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON r.shell_id=shell_45.id
		-- WHERE DATE(g.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(g.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		-- 	AND g.created_employee_id=e.id
		-- 	AND g.id=r.gas_wholesale_id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%')
	) AS tbl
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
	CALL get_in_stock_shell_gas(_start_date, 0, 1, _organization_ids, CONCAT('0,',_vendor_id,',0'), _gas_12_stock, _gas_45_stock);
	
	CALL get_in_stock_lpg(_start_date, 2, _organization_ids, concat('0,',_vendor_id,',0'), _gas_stock);
	
	CALL get_in_stock_shield(_start_date, 0, 1, _organization_ids, CONCAT('0,',_vendor_id,',0'), _final_stock);
	
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
		UNION all
		SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
			, 0 AS vehicle_out_12, 0 AS vehicle_out_45
			, 0 AS vehicle_in_12, 0 AS vehicle_in_45
			, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
			, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		FROM gas_import AS pdet, gas_import_detail AS det, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND det.gas_import_id=pdet.id AND det.shell_id=sv.id AND sv.vendor_id=_vendor_id
			AND _organization_ids LIKE CONCAT('%,',sv.organization_id,',%')
		GROUP BY pdet.created_date, sv.shell_id
		UNION ALL
		SELECT pdet.created_date, 0 AS fraction_12, 0 AS fraction_45
			, 0 AS vehicle_out_12, 0 AS vehicle_out_45
			, 0 AS vehicle_in_12, 0 AS vehicle_in_45
			, SUM(IF(shell_12.id IS NOT NULL, det.quantity,0)) AS sale_12, SUM(IF(shell_45.id IS NOT NULL, det.quantity,0)) AS sale_45
			, 0 AS shield_import, 0 AS shield_decrease, 0 AS import_quantity
		FROM gas_wholesale AS pdet, gas_wholesale_detail AS det, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND det.gas_wholesale_id=pdet.id AND det.shell_id=sv.id AND sv.vendor_id=_vendor_id
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
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _amount_debt, @a, @a, @a);
	
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

/* Procedure structure for procedure `report_oil_customer_debt` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_customer_debt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_customer_debt`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _customer_id INT, OUT _opening_debt DOUBLE)
BEGIN
	CALL get_in_stock_customer(_start_date, 3, _customer_id, _opening_debt, @a, @a, @a);
	
	SELECT COALESCE(oe.CODE,'') AS oil_export_code, o.CODE AS oil_code, o.NAME AS oil_name, u.NAME AS unit_name
		, osdet.quantity, osdet.price, osdet.amount, coalesce(idet.paid_amount,0) as paid
	FROM oil_sale AS os, oil AS o, unit AS u, employee AS eo, oil_sale_detail AS osdet
	LEFT JOIN invoice_detail AS idet ON idet.oil_sale_detail_id=osdet.id
	LEFT JOIN oil_export_detail AS edet ON edet.oil_sale_detail_id=osdet.id
	LEFT JOIN oil_export AS oe ON edet.oil_export_id=oe.id
	WHERE DATE(os.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(os.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND os.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		AND os.customer_id=_customer_id AND os.id=osdet.oil_sale_id AND osdet.oil_id=o.id AND osdet.unit_id=u.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_export` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_export` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_export`(IN _oil_export_id INT)
BEGIN
	SELECT o.CODE AS oil_code, o.NAME AS oil_name, u.NAME AS unit_name, det.quantity, sdet.price, det.quantity*sdet.price as amount
	FROM oil_export_detail AS det, oil_sale_detail as sdet, oil AS o, unit AS u
	WHERE det.oil_export_id=_oil_export_id and det.oil_sale_detail_id=sdet.id AND det.oil_id=o.id AND sdet.unit_id=u.id
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
		, 0 as agency_commission, 0 as actual_total
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
	, in _session_id varchar(255), out _oil_ids text, out _opening_stock int)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SET _to_date = STR_TO_DATE(_start_date,'%d/%m/%Y');
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date=NULL THEN
		SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _from_date FROM parameter WHERE `code`="startdate";
	END IF;
	
	IF _oil_id=0 THEN
		DELETE FROM temp_oil_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_oil_stock(session_id, created_date, oil_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.oil_id, COALESCE(opening_stock,0), SUM(import_quantity), SUM(export_quantity) FROM
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
			SELECT _from_date AS created_date, o.id as oil_id, sum(COALESCE(tbl.in_stock,0)) AS opening_stock
			FROM oil AS o
			left join
			(
				SELECT oil_id, in_stock
				FROM oil_in_stock
				WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
				union all
				SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_import_detail AS i_det, oil_import AS i, store AS s
				WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
				UNION ALL
				SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_detail AS i_det, oil_sale AS i, store AS s
				WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
				UNION ALL
				SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_promotion AS i_det, oil_sale AS i, store AS s
				WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
				UNION ALL
				SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
				WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			) as tbl on tbl.oil_id=o.id
			WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
			group by o.id
		) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
		GROUP BY tbl.created_date, tbl.oil_id;
	
		SELECT COALESCE(GROUP_CONCAT(oil_id),'') INTO _oil_ids FROM temp_oil_stock WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS oil_id, 0 AS opening_stock, 0 AS import_quantity, 0 AS export_quantity 
		FROM temp_oil_stock 
		WHERE session_id=_session_id 
		GROUP BY created_date ORDER BY created_date;
	ELSE
		SELECT max(t.opening_stock) into _opening_stock
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id;
		SELECT tbl.created_date, t.oil_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id
		ORDER BY tbl.created_date;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_stock_h` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_stock_h` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_stock_h`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SET _to_date = STR_TO_DATE(_start_date,'%d/%m/%Y');
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date=NULL THEN
		SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _from_date FROM parameter WHERE `code`="startdate";
	END IF;
	
	SELECT o.CODE, o.NAME, COALESCE(opening_stock,0) AS opening_stock, SUM(COALESCE(import_quantity,0)) AS import_quantity, SUM(COALESCE(export_quantity,0)) AS export_quantity 
	FROM oil AS o
	LEFT JOIN
	(
		SELECT idet.oil_id, SUM(idet.quantity) AS import_quantity, 0 AS export_quantity
		FROM oil_import AS i, oil_import_detail AS idet, employee AS eo, oil AS p
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.oil_import_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY i.created_date, idet.oil_id
		UNION ALL
		SELECT idet.oil_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
		FROM oil_sale AS i, oil_sale_detail AS idet, employee AS eo, oil AS p
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.oil_sale_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY i.created_date, idet.oil_id
	) AS tbl ON o.id=tbl.oil_id
	LEFT JOIN
	(
		SELECT o.id AS oil_id, SUM(COALESCE(in_stock,0)) AS opening_stock
		FROM oil AS o
		LEFT JOIN (
			SELECT oil_id, in_stock
			FROM oil_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_import_detail AS i_det, oil_import AS i, store AS s
			WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_detail AS i_det, oil_sale AS i, store AS s
			WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_promotion AS i_det, oil_sale AS i, store AS s
			WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
			WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
		) AS tbl_old_stock ON tbl_old_stock.oil_id=o.id
		WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
		GROUP BY o.id
	) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
	WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
	GROUP BY o.id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_stock_store` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_stock_store` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_stock_store`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _store_id INT
	, IN _oil_id INT, IN _session_id VARCHAR(255), OUT _oil_ids TEXT, OUT _opening_stock INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SET _to_date = STR_TO_DATE(_start_date,'%d/%m/%Y');
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date=NULL THEN
		SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _from_date FROM parameter WHERE `code`="startdate";
	END IF;
	
	IF _oil_id=0 THEN
		DELETE FROM temp_oil_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_oil_stock(session_id, created_date, oil_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.oil_id, COALESCE(opening_stock,0), SUM(COALESCE(import_quantity,0)), SUM(COALESCE(export_quantity,0)) FROM
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
			SELECT _from_date AS created_date, o.id as oil_id, sum(COALESCE(in_stock,0)) AS opening_stock
			FROM oil AS o
			LEFT JOIN (
				SELECT oil_id, in_stock
				FROM oil_in_stock
				WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 
					AND _organization_ids LIKE CONCAT('%,',organization_id,',%') and store_id=_store_id	
				union all
				SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_import_detail AS i_det, oil_import AS i, store AS s
				WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
				UNION ALL
				SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_detail AS i_det, oil_sale AS i, store AS s
				WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
				UNION ALL
				SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_promotion AS i_det, oil_sale AS i, store AS s
				WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
				UNION ALL
				SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
				FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
				WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
			) AS tbl_old_stock ON tbl_old_stock.oil_id=o.id
			WHERE o.STATUS=1 and _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
			group by o.id
		) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
		GROUP BY tbl.created_date, tbl.oil_id;
	
		SELECT COALESCE(GROUP_CONCAT(oil_id),'') INTO _oil_ids FROM temp_oil_stock WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS oil_id, 0 AS opening_stock, 0 AS import_quantity, 0 AS export_quantity 
		FROM temp_oil_stock 
		WHERE session_id=_session_id 
		GROUP BY created_date ORDER BY created_date;
	ELSE
		SELECT max(t.opening_stock) into _opening_stock
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id
		ORDER BY tbl.created_date;
	
		SELECT tbl.created_date, t.oil_id, t.opening_stock, t.import_quantity, t.export_quantity 
		FROM (SELECT created_date, session_id FROM temp_oil_stock WHERE session_id=_session_id GROUP BY created_date) AS tbl
		LEFT JOIN temp_oil_stock AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date AND t.oil_id=_oil_id
		ORDER BY tbl.created_date;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_stock_store_h` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_stock_store_h` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_stock_store_h`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _store_id INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SET _to_date = STR_TO_DATE(_start_date,'%d/%m/%Y');
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date=NULL THEN
		SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _from_date FROM parameter WHERE `code`="startdate";
	END IF;
	
	SELECT o.code, o.name, COALESCE(opening_stock,0) as opening_stock, SUM(COALESCE(import_quantity,0)) as import_quantity, SUM(COALESCE(export_quantity,0)) as export_quantity 
	FROM oil as o
	left join
	(
		SELECT idet.oil_id, SUM(idet.quantity) AS import_quantity, 0 AS export_quantity
		FROM oil_import AS i, oil_import_detail AS idet, employee AS eo, oil AS p
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.oil_import_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND i.store_id=_store_id
		GROUP BY i.created_date, idet.oil_id
		UNION ALL
		SELECT idet.oil_id, 0 AS import_quantity, SUM(idet.quantity) AS export_quantity
		FROM oil_sale AS i, oil_sale_detail AS idet, employee AS eo, oil AS p
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.oil_sale_id AND i.created_employee_id=eo.id AND idet.oil_id=p.id AND p.STATUS=1
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND idet.store_id=_store_id
		GROUP BY i.created_date, idet.oil_id
	) AS tbl on o.id=tbl.oil_id
	LEFT JOIN
	(
		SELECT o.id AS oil_id, SUM(COALESCE(in_stock,0)) AS opening_stock
		FROM oil AS o
		LEFT JOIN (
			SELECT oil_id, in_stock
			FROM oil_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%') AND store_id=_store_id	
			UNION ALL
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_import_detail AS i_det, oil_import AS i, store AS s
			WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_detail AS i_det, oil_sale AS i, store AS s
			WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_promotion AS i_det, oil_sale AS i, store AS s
			WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
			UNION ALL
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
			WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
		) AS tbl_old_stock ON tbl_old_stock.oil_id=o.id
		WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
		GROUP BY o.id
	) AS opening_tbl ON tbl.oil_id=opening_tbl.oil_id
	WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
	GROUP BY o.id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_vendor_debt` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_vendor_debt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_vendor_debt`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM vendor_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	SELECT v.CODE AS vendor_code, v.NAME AS vendor_name, tbl_vendor_stock.amount AS opening_stock
		, SUM(COALESCE(tbl_oil_import.amount,0)) AS amount
		, SUM(COALESCE(tbl_vendor_debt.amount,0) + COALESCE(tbl_oil_import.paid,0)) AS paid
	FROM vendor AS v, organization AS o, vendor_organization AS vo
	LEFT JOIN (
		SELECT vo.organization_id, vo.vendor_id, sum(COALESCE(stock.debt,0)) AS amount
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		left join
		(
			SELECT vendor_id, organization_id, amount as debt
			FROM vendor_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0  AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			union all
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM lpg_import AS i, employee AS eo
			WHERE DATE(i.import_date) > _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM gas_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM oil_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, - COALESCE(IF(i.kind=1,i.paid,0),0) AS debt
			FROM vendor_debt AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM promotion_material_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM accessory_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.amount,0) AS debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=1
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM good_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM petro_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT idet.vendor_id, eo.organization_id, -COALESCE(idet.quantity*idet.price_before_commission,0) AS debt
			FROM oil_sale_detail AS idet, oil_sale AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.id=idet.oil_sale_id
					 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		) AS stock ON stock.organization_id=vo.organization_id AND stock.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',vo.organization_id,',%')
		GROUP BY vo.organization_id, vo.vendor_id
		ORDER BY o.NAME, v.NAME
	) AS tbl_vendor_stock ON vo.vendor_id=tbl_vendor_stock.vendor_id AND vo.organization_id=tbl_vendor_stock.organization_id
	LEFT JOIN (
		SELECT vd.vendor_id, eo.organization_id, SUM(vd.paid) AS amount
		FROM vendor_debt as vd, employee as eo
		WHERE DATE(vd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(vd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
			AND vd.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		GROUP BY vd.vendor_id, eo.organization_id
	) AS tbl_vendor_debt ON vo.vendor_id=tbl_vendor_debt.vendor_id AND vo.organization_id=tbl_vendor_debt.organization_id
	LEFT JOIN (
		SELECT oi.vendor_id, eo.organization_id, SUM(oi.total) AS amount, SUM(oi.paid) AS paid
		FROM oil_import AS oi, employee AS eo
		WHERE DATE(oi.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(oi.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
			AND oi.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') 
		GROUP BY oi.vendor_id, eo.organization_id
	) AS tbl_oil_import ON vo.vendor_id=tbl_oil_import.vendor_id AND vo.organization_id=tbl_oil_import.organization_id
	WHERE vo.vendor_id=v.id AND vo.organization_id=o.id AND v.STATUS=1 AND o.STATUS=1 and v.is_oil=1
	GROUP BY v.id	
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_oil_vendor_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_oil_vendor_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_oil_vendor_stock`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_id INT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SET _to_date = STR_TO_DATE(_start_date,'%d/%m/%Y');
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM oil_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date=NULL THEN
		SELECT STR_TO_DATE(`value`,'%d/%m/%Y') INTO _from_date FROM parameter WHERE `code`="startdate";
	END IF;
	
	select o.code as oil_code, o.name as oil_name, coalesce(opening_stock,0) as opening_stock
		, SUM(import_tbl.quantity) AS import_quantity, sum(export_tbl.quantity) AS export_quantity 
		, import_tbl.price AS import_price, sum(import_tbl.amount) AS import_amount, import_tbl.note
	from oil as o
	LEFT JOIN
	(
		SELECT o.id as oil_id, sum(COALESCE(in_stock,0)) AS opening_stock
		FROM oil AS o
		LEFT JOIN (
			SELECT oil_id, in_stock
			FROM oil_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			union all
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_import_detail AS i_det, oil_import AS i, store AS s
			WHERE i_det.oil_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_detail AS i_det, oil_sale AS i, store AS s
			WHERE i_det.oil_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, -COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_promotion AS i_det, oil_sale AS i, store AS s
			WHERE i_det.sale_oil_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT i_det.oil_id, COALESCE(i_det.base_quantity,0) AS in_stock
			FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
			WHERE i_det.oil_sale_return_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i_det.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
		) AS tbl_old_stock ON tbl_old_stock.oil_id=o.id
		WHERE o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',o.organization_id,',%')
		group by o.id
	) AS opening_tbl ON o.id=opening_tbl.oil_id
	left join
	(
		SELECT oil_id, SUM(base_quantity) AS quantity, SUM(amount) AS amount, GROUP_CONCAT(CONCAT(price,'(',quantity,')')) AS note, avg(price) as price
		FROM(
			SELECT idet.oil_id, SUM(idet.base_quantity) AS base_quantity, SUM(idet.quantity) AS quantity, idet.price, sum(idet.amount) as amount
			FROM oil_import AS i, oil_import_detail AS idet, employee AS eo
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.oil_import_id AND i.created_employee_id=eo.id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY idet.oil_id, idet.price
		) as tbl
		group by oil_id
	) as import_tbl on o.id=import_tbl.oil_id
	LEFT JOIN
	(
		SELECT idet.oil_id, SUM(idet.base_quantity) AS quantity
		FROM oil_sale AS i, oil_sale_detail AS idet, employee AS eo
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.oil_sale_id AND i.created_employee_id=eo.id
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY idet.oil_id
		union all
		SELECT idet.oil_id, SUM(idet.base_quantity) AS quantity
		FROM oil_sale AS i, oil_sale_promotion AS idet, employee AS eo
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i.id=idet.sale_oil_id AND i.created_employee_id=eo.id
			AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		GROUP BY idet.oil_id
		union all
		SELECT i_det.oil_id, -SUM(i_det.base_quantity) AS quantity
		FROM oil_sale_return_detail AS i_det, oil_sale_return AS i, store AS s
		WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND i_det.oil_sale_return_id=i.id AND i_det.store_id=s.id
			AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
		GROUP BY i_det.oil_id
	) AS export_tbl ON o.id=export_tbl.oil_id
	where o.status=1
	group by o.id
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
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		select STR_TO_DATE(_start_date,'%d/%m/%Y') into _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM petro_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date is NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	if _petro_id=0 then
		delete from temp_petro_stock where session_id=_session_id;
		insert into temp_petro_stock(session_id, created_date, petro_id, opening_stock, import_quantity, export_quantity)
		select _session_id, tbl.created_date, tbl.petro_id, coalesce(sum(opening_stock),0) as opening_stock
			, coalesce(sum(import_quantity),0) as import_quantity, coalesce(sum(export_quantity),0) as export_quantity
		from petro as p left join
		(
			select i.created_date, idet.petro_id, 0 as opening_stock, coalesce(idet.quantity,0) as import_quantity, 0 as export_quantity
			from petro_import as i, petro_import_detail as idet, employee as eo
			where DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				and i.id=idet.petro_import_id and i.created_employee_id=eo.id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.created_date, idet.petro_id, 0 as opening_stock, 0 AS import_quantity, coalesce(idet.quantity,0) AS export_quantity
			FROM petro_sale AS i, petro_sale_detail AS idet, employee AS eo
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_sale_id AND i.created_employee_id=eo.id 
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			union all
			SELECT _from_date as created_date, petro_id, coalesce(in_stock,0) as opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			union all
			SELECT _from_date as created_date, i_det.petro_id, COALESCE(i_det.quantity,0) AS opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_import_detail AS i_det, petro_import AS i, store AS s
			WHERE i_det.petro_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
			UNION ALL
			SELECT _from_date as created_date, i_det.petro_id, -COALESCE(i_det.quantity,0) AS opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_sale_detail AS i_det, petro_sale AS i, store as s
			WHERE i_det.petro_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%')
		) as tbl on tbl.petro_id=p.id
		where p.status=1
		group by tbl.created_date, p.id
		having opening_stock>0 or import_quantity>0 or export_quantity>0;
	
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
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM petro_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	IF _petro_id=0 THEN
		DELETE FROM temp_petro_stock WHERE session_id=_session_id;
	
		INSERT INTO temp_petro_stock(session_id, created_date, petro_id, opening_stock, import_quantity, export_quantity)
		SELECT _session_id, tbl.created_date, tbl.petro_id, COALESCE(SUM(opening_stock),0) as opening_stock
			, COALESCE(SUM(import_quantity),0) as import_quantity, coalesce(SUM(export_quantity),0) as export_quantity 
		FROM petro as p left join
		(
			SELECT i.created_date, idet.petro_id, 0 as opening_stock, COALESCE(idet.quantity,0) AS import_quantity, 0 AS export_quantity
			FROM petro_import AS i, petro_import_detail AS idet, employee AS eo
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_import_id AND i.created_employee_id=eo.id 
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND i.store_id=_store_id
			UNION ALL
			SELECT i.created_date, idet.petro_id, 0 as opening_stock, 0 AS import_quantity, COALESCE(idet.quantity,0) AS export_quantity
			FROM petro_sale AS i, petro_sale_detail AS idet, employee AS eo
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i.id=idet.petro_sale_id AND i.created_employee_id=eo.id
				AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%') AND i.store_id=_store_id
			union all
			SELECT _from_date AS created_date, petro_id, coalesce(in_stock,0) as opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0 
				AND _organization_ids LIKE CONCAT('%,',organization_id,',%') AND store_id=_store_id
			union all
			SELECT _from_date AS created_date, i_det.petro_id, COALESCE(i_det.quantity,0) as opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_import_detail AS i_det, petro_import AS i, store AS s
			WHERE i_det.petro_import_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
			UNION ALL
			SELECT _from_date AS created_date, i_det.petro_id, -COALESCE(i_det.quantity,0) as opening_stock, 0 as import_quantity, 0 as export_quantity
			FROM petro_sale_detail AS i_det, petro_sale AS i, store AS s
			WHERE i_det.petro_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date 
				AND i.store_id=s.id AND _organization_ids LIKE CONCAT('%,',s.organization_id,',%') AND s.id=_store_id
		) AS tbl ON tbl.petro_id=p.id
		WHERE p.STATUS=1
		GROUP BY tbl.created_date, p.id
		HAVING opening_stock>0 OR import_quantity>0 OR export_quantity>0;
	
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
	SELECT ws.id, ws.created_date, c.CODE AS customer_code, c.NAME AS customer_name, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t
		, SUM(tbl.shell_return_45) AS shell_return_45, SUM(tbl.price_12/tbl.price_12_count) AS price_12, SUM(tbl.price_45/tbl.price_45_count) AS price_45
		, COALESCE(SUM(tbl.total),0) AS total, (COALESCE(ws.paid,0) + COALESCE(ws.paid_old_debt_amount,0)) AS paid, a.number AS account, ws.note, 0 as other_fee
	FROM gas_wholesale AS ws left join
	(
		SELECT w.id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
			, 0 AS shell_return_12, 0 AS shell_return_12t, 0 AS shell_return_45
			, SUM(IF(shell_12.id IS NOT NULL, wdet.price,0)) AS price_12, SUM(IF(shell_12.id IS NOT NULL, 1,0)) AS price_12_count
			, SUM(IF(shell_45.id IS NOT NULL, wdet.price,0)) AS price_45, SUM(IF(shell_45.id IS NOT NULL, 1,0)) AS price_45_count
			, SUM(wdet.quantity * wdet.price) AS total
		FROM gas_wholesale AS w, gas_wholesale_detail AS wdet, shell_vendor AS sv
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
		GROUP BY w.id
		UNION ALL
		SELECT w.id, 0 AS quantity_12, 0 AS quantity_45
			, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
			, SUM(IF(shell_12t.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12t
			, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
			, 0 AS price_12, 0 AS price_45, 0 AS price_12_count, 0 AS price_45_count
			, 0 AS total
		FROM gas_wholesale AS w, gas_wholesale_return_shell AS wdet
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk, organization_shell AS os WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id=os.shell_id AND _organization_ids LIKE CONCAT('%,',os.organization_id,',%') ) AS shell_12 ON wdet.shell_id=shell_12.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id NOT IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
		LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
		WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND w.id=wdet.gas_wholesale_id 
		GROUP BY w.id
	) AS tbl on tbl.id=ws.id, customer AS c, account AS a
	WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND ws.customer_id=c.id AND _organization_ids LIKE CONCAT('%,',c.organization_id,',%') AND ws.account_id=a.id
	GROUP BY ws.id
	union all
	SELECT tbl_fee.id, tbl_fee.created_date, tbl_fee.customer_code, tbl_fee.customer_name, 0 AS quantity_12, 0 AS quantity_45
		, 0 shell_return_12, 0 shell_return_12t
		, 0 AS shell_return_45, 0 AS price_12, 0 AS price_45
		, 0 AS total, 0 AS paid, '' AS account, tbl_fee.note, tbl_fee.fee_amount as other_fee
	FROM
	(
		select ws.id, ws.created_date, c.code as customer_code, c.name as customer_name, coalesce(fd.amount) as fee_amount, coalesce(f.name) as note
		FROM customer AS c, gas_wholesale AS ws, gas_wholesale_fee_detail AS fd, gas_wholesale_fee AS f 
		WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ws.customer_id=c.id AND _organization_ids LIKE CONCAT('%,',c.organization_id,',%')
			AND fd.gas_wholesale_id=ws.id AND fd.fee_id=f.id
	) AS tbl_fee
	union all
	SELECT tbl_gas_turn.id, tbl_gas_turn.created_date, tbl_gas_turn.customer_code, tbl_gas_turn.customer_name, 0 AS quantity_12, 0 AS quantity_45
		, 0 shell_return_12, 0 shell_return_12t
		, 0 AS shell_return_45, 0 AS price_12, 0 AS price_45
		, 0 AS total, 0 AS paid, '' AS account, tbl_gas_turn.note, tbl_gas_turn.fee_amount as other_fee
	FROM
	(
		select ws.id, ws.created_date, c.code as customer_code, c.name as customer_name, coalesce(ws.gas_return_amount) as fee_amount, "Gas dư" as note
		FROM customer AS c, gas_wholesale AS ws
		WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND ws.customer_id=c.id AND _organization_ids LIKE CONCAT('%,',c.organization_id,',%')
			and ws.gas_return<>0
	) AS tbl_gas_turn
	ORDER BY id, created_date;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `report_sale_customer` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_sale_customer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_sale_customer`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _vendor_ids TEXT)
BEGIN
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM customer_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	SELECT c.CODE AS customer_code, c.NAME AS customer_name, SUM(coalesce(tbl.quantity_12,0)) AS quantity_12, SUM(coalesce(tbl.quantity_45,0)) AS quantity_45
		, SUM(coalesce(tbl_return12.shell_return_12,0)) AS shell_return_12, SUM(coalesce(tbl_return45.shell_return_45,0)) AS shell_return_45
		, SUM(coalesce(tbl.total,0)) AS amount, SUM(coalesce(tbl.debt,0)) AS debt
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
		SELECT c.id AS customer_id, sum(COALESCE(tbl.amount,0)) AS amount, sum(COALESCE(tbl.shell_12,0)) AS shell_12, sum(COALESCE(tbl.shell_45,0)) AS shell_45
		FROM customer AS c
		left join
		(
			SELECT customer_id, shell_12, shell_45, amount
			FROM customer_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
			union all
			SELECT i.customer_id, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM gas_wholesale AS i, gas_wholesale_detail AS idet, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id AND idet.shell_id=sv.id
			UNION ALL
			SELECT i.customer_id, -COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, -COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM gas_wholesale AS i, gas_wholesale_return_shell AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.gas_wholesale_id
			UNION ALL
			SELECT i.customer_id, COALESCE(IF(shell_12.id IS NOT NULL, idet.quantity,0),0) AS quantity_12
				, COALESCE(IF(shell_45.id IS NOT NULL, idet.quantity,0),0) AS quantity_45
				, 0 AS amount
			FROM shell_return AS i, shell_return_detail AS idet
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON idet.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON idet.shell_id=shell_45.id
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.id=idet.shell_return_id
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM gas_wholesale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM gas_export_wholesale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM good_sale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM petro_sale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM shell_sale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM lpg_sale AS i
			WHERE DATE(i.sale_date) > _from_date AND DATE(i.sale_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.paid,0) AS amount
			FROM wholesale_debt AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_customer_id AS customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.customer_amount,0) AS amount
			FROM transport_service AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0
			UNION ALL
			SELECT i.customer_id AS customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.amount,0) AS amount
			FROM debt_adjustment AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date AND i.customer_id<>0
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, COALESCE(i.debt,0) AS amount
			FROM oil_sale AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
			UNION ALL
			SELECT i.customer_id, 0 AS quantity_12, 0 AS quantity_45, -COALESCE(i.debt,0) AS amount
			FROM oil_sale_return AS i
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
		) as tbl on tbl.customer_id=c.id
		WHERE c.STATUS=1
		GROUP BY c.id
		ORDER BY c.NAME
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
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM shell_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
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
			SELECT sv.id AS shell_vendor_id, coalesce(stock.quantity,0) as in_stock
			FROM shell_vendor AS sv
			left join
			(
				SELECT shell_vendor_id as id, in_stock as quantity
				FROM shell_gas_in_stock
				WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
				union all
				SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
				FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
				WHERE f_det.fraction_id=f.id AND DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date
					AND f_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, COALESCE(f_det.quantity,0) AS quantity
				FROM gas_import_detail AS f_det, gas_import AS f, shell_vendor AS sv
				WHERE f_det.gas_import_id=f.id AND DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date
					AND f_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
				FROM gas_wholesale_detail AS i_det, gas_wholesale AS i, shell_vendor AS sv
				WHERE i_det.gas_wholesale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
				FROM vehicle_out_detail AS i_det, vehicle_out AS i, shell_vendor AS sv
				WHERE i_det.vehicle_out_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, COALESCE(i_det.quantity,0) AS quantity
				FROM vehicle_in_detail AS i_det, vehicle_in AS i, shell_vendor AS sv
				WHERE i_det.vehicle_in_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, -COALESCE(f_det.quantity,0) AS quantity
				FROM gas_export_wholesale_detail AS f_det, gas_export_wholesale AS f, shell_vendor AS sv
				WHERE f_det.gas_export_wholesale_id=f.id AND DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date
					AND f_det.shell_id=sv.id
				UNION ALL
				SELECT sv.id, -COALESCE(i_det.quantity,0) AS quantity
				FROM inner_sale_detail AS i_det, inner_sale AS i, shell_vendor AS sv
				WHERE i_det.inner_sale_id=i.id AND DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.shell_id=sv.id
			) as stock on stock.id=sv.id
			UNION ALL
			SELECT sv.id AS shell_vendor_id, sum(tbl_stock.in_stock) as in_stock
			FROM shell_vendor AS sv
			left join(
				SELECT so.organization_id, so.shell_id, COALESCE(tbl_shell.in_stock,0) AS in_stock
				FROM organization_shell AS so
				left join
				(
					SELECT shell_id, organization_id, in_stock
					FROM shell_in_stock
					WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0
					union all
					SELECT i.shell_id, eo.organization_id, COALESCE(i.quantity,0) AS in_stock
					FROM shell_import AS i, employee AS eo
					WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
						AND i.created_employee_id=eo.id
					UNION ALL
					SELECT sv.shell_id, sv.organization_id,  -COALESCE(f_det.quantity,0) AS in_stock
					FROM fraction_gas_detail AS f_det, fraction_gas AS f, shell_vendor AS sv
					WHERE DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date
						AND f_det.fraction_id=f.id AND f_det.shell_id=sv.id
					UNION ALL
					SELECT i_det.shell_id, eo.organization_id, COALESCE(i_det.quantity,0) AS in_stock
					FROM gas_wholesale_return_shell AS i_det, gas_wholesale AS i, employee AS eo
					WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
						AND i_det.gas_wholesale_id=i.id AND i.created_employee_id=eo.id
					UNION ALL
					SELECT i_det.shell_id, eo.organization_id, -COALESCE(i_det.quantity,0) AS in_stock
					FROM shell_sale_detail AS i_det, shell_sale AS i, employee AS eo
					WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
					AND i_det.shell_sale_id=i.id AND i.created_employee_id=eo.id
					UNION ALL
					SELECT i.shell_id, eo.organization_id, COALESCE(i.quantity,0) AS in_stock
					FROM old_shell AS i, employee AS eo
					WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
						AND i.created_employee_id=eo.id
					UNION ALL
					SELECT sv.shell_id, sv.organization_id, COALESCE(f_det.quantity,0) AS in_stock
					FROM shell_return_detail AS f_det, shell_return AS f, shell_vendor AS sv
					WHERE DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date 
						AND f_det.shell_return_id=f.id AND f_det.shell_id=sv.id
					UNION ALL
					SELECT sv.shell_id, sv.organization_id, -COALESCE(f_det.quantity,0) AS in_stock
					FROM shell_return_supplier_detail AS f_det, shell_return_supplier AS f, shell_vendor AS sv
					WHERE DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date 
						AND f_det.shell_return_supplier_id=f.id AND f_det.shell_id=sv.id
					UNION ALL
					SELECT f_det.shell_id, eo.organization_id,  COALESCE(f_det.quantity,0) AS in_stock
					FROM vehicle_in_return_shell_detail AS f_det, vehicle_in AS f, employee AS eo
					WHERE DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date 
						AND f_det.vehicle_in_id=f.id AND f.created_employee_id=eo.id
					UNION ALL
					SELECT f_det.shell_id, eo.organization_id, COALESCE(f_det.quantity,0) AS in_stock
					FROM gas_export_wholesale_shell_detail AS f_det, gas_export_wholesale AS f, employee AS eo
					WHERE  DATE(f.created_date) > _from_date AND DATE(f.created_date) < _to_date 
						AND f_det.gas_export_wholesale_id=f.id AND f.created_employee_id=eo.id
				) AS tbl_shell ON tbl_shell.organization_id=so.organization_id AND tbl_shell.shell_id=so.shell_id
			) as tbl_stock on tbl_stock.organization_id=sv.organization_id AND tbl_stock.shell_id=sv.shell_id
			group by sv.id
		) AS tbl GROUP BY shell_vendor_id
	) AS opening_stock_tbl ON shell_tbl.shell_vendor_id=opening_stock_tbl.shell_vendor_id
	LEFT JOIN
	(
		SELECT shell_vendor_id, created_date, SUM(quantity) AS quantity FROM
		(
			SELECT i_det.shell_id AS shell_vendor_id, i.created_date, -SUM(i_det.quantity) AS quantity
			FROM gas_wholesale_detail AS i_det, gas_wholesale AS i
			WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND i_det.gas_wholesale_id=i.id 
			GROUP BY i_det.shell_id, i.created_date
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
	CALL get_in_stock_shell_gas(_start_date, 0, 1, _organization_ids, _vendor_ids, _gas_12_stock, _gas_45_stock);
	
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
			SELECT tbl.vehicle_out_id, SUM(tbl.total) AS total, SUM(tbl.paid) AS paid 
			FROM(
				SELECT ws.vehicle_out_id, SUM(wholesale_detail_tbl.total) AS total, SUM(ws.paid) AS paid 
				FROM gas_wholesale AS ws,
				(
					SELECT w.id, SUM(det.price * det.quantity) AS total
					FROM gas_wholesale AS w, gas_wholesale_detail AS det
					WHERE w.id=det.gas_wholesale_id AND w.vehicle_out_id<>0
						AND DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
					GROUP BY w.id
				) AS wholesale_detail_tbl 
				WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
					AND ws.vehicle_out_id<>0 AND wholesale_detail_tbl.id=ws.id
				GROUP BY ws.vehicle_out_id
				UNION ALL
				SELECT gw.vehicle_out_id, 0 AS total, SUM(wd.paid) AS paid 
				FROM wholesale_debt AS wd, gas_wholesale AS gw
				WHERE DATE(wd.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(wd.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y') 
					AND wd.gas_wholesale_id=gw.id AND gw.vehicle_out_id<>0
				GROUP BY gw.vehicle_out_id
			) AS tbl GROUP BY tbl.vehicle_out_id 
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
		AND tbl.vehicle_out_id=gas_wholesale_tbl.vehicle_out_id
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
	declare _is_transported_by int default 0;
	
	if _transporter_id<>0 then
		SELECT EXISTS (SELECT id FROM vendor WHERE id=_transporter_id AND equal_organization_id=_organization_id_log) into _is_transported_by;
	end if;
	
	if _is_transported_by=1 then 	-- cong ty van chuyen
		IF _vendor_id<>0 THEN
			SELECT `name`, address, tax, phone, fax INTO _customer_name, _customer_address, _customer_tax, _customer_phone, _customer_fax 
			FROM vendor WHERE id=_vendor_id;
		
			CALL get_in_stock_vendor(_start_date, 3, _vendor_id, _organization_ids, @a, _amount_debt, @a, @a);
		
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
		
			CALL get_in_stock_customer(_start_date, 3, _customer_id, @a, _amount_debt, @a, @a);
	
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
		
			CALL get_in_stock_vendor(_start_date, 3, _transporter_id, _organization_ids, @a, _amount_debt, @a, @a);
		
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
	DECLARE _from_date, _to_date DATE;
	
	IF _start_date<>'' THEN
		SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _to_date;
	ELSE
		SELECT SYSDATE() INTO _to_date;
	END IF;
	
	SELECT `day` INTO _from_date FROM vendor_in_stock WHERE DATEDIFF(`day`, _to_date) <= 0 LIMIT 1;
	IF _from_date IS NULL THEN
		SELECT DATE_ADD(_to_date, INTERVAL -1 DAY) INTO _from_date;
	END IF;
	
	SELECT v.CODE AS vendor_code, v.NAME AS vendor_name, tbl_vendor_stock.amount AS opening_stock, SUM(i.amount) AS amount, SUM(i.paid) AS paid
	FROM vendor AS v, organization AS o, vendor_organization AS vo
	LEFT JOIN (
		SELECT vo.organization_id, vo.vendor_id, SUM(COALESCE(stock.debt,0)) AS amount
		FROM organization AS o, vendor AS v, vendor_organization AS vo
		left join
		(
			SELECT vendor_id, organization_id, amount as debt
			FROM vendor_in_stock
			WHERE DATEDIFF(`day`, _from_date) >= 0 AND DATEDIFF(`day`, _to_date) <= 0  AND _organization_ids LIKE CONCAT('%,',organization_id,',%')
			union all
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM lpg_import AS i, employee AS eo
			WHERE DATE(i.import_date) > _from_date AND DATE(i.import_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM gas_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM oil_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, - COALESCE(IF(i.kind=1,i.paid,0),0) AS debt
			FROM vendor_debt AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM promotion_material_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM accessory_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.amount,0) AS debt
			FROM debt_adjustment AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.vendor_id<>0 AND i.kind=1
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM good_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT i.vendor_id, eo.organization_id, COALESCE(i.debt,0) AS debt
			FROM petro_import AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			UNION ALL
			SELECT idet.vendor_id, eo.organization_id, -COALESCE(idet.quantity*idet.price_before_commission,0) AS debt
			FROM oil_sale_detail AS idet, oil_sale AS i, employee AS eo
			WHERE DATE(i.created_date) > _from_date AND DATE(i.created_date) < _to_date
				AND i.created_employee_id=eo.id AND i.id=idet.oil_sale_id
				 AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		) AS stock ON stock.organization_id=vo.organization_id AND stock.vendor_id=vo.vendor_id
		WHERE vo.organization_id=o.id AND vo.vendor_id=v.id AND v.STATUS=1 AND o.STATUS=1 AND _organization_ids LIKE CONCAT('%,',vo.organization_id,',%')
		GROUP BY vo.vendor_id, vo.organization_id
		ORDER BY o.NAME, v.NAME
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

/* Procedure structure for procedure `searchInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchInvoice`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT a.*, coalesce(c.name,'') as customer_name
	FROM employee AS eo, invoice AS a left join customer as c on a.customer_id=c.id
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

/* Procedure structure for procedure `searchOilExport` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchOilExport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchOilExport`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT i.*, c.NAME AS customer_name
	FROM oil_export AS i, customer AS c, employee as eo
	WHERE DATE(i.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND i.customer_id=c.id and i.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
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
	SELECT s.*, c.name as customer_name, coalesce(oe.code) as oil_export_code
	FROM employee AS eo, customer as c, oil_sale AS s
	left join oil_export as oe on s.id=oe.oil_sale_id
	WHERE DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		and s.customer_id=c.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleOilDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleOilDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleOilDetail`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), in _code text, in _oil_name text, in _customer_id int)
BEGIN
	SELECT sdet.id, s.code as oil_sale_code, s.created_date as oil_sale_date, o.name as oil_name, sdet.amount
	FROM oil_sale as s, oil as o, oil_sale_detail AS sdet
	left join invoice_detail AS idet on idet.oil_sale_detail_id=sdet.id
	WHERE sdet.oil_sale_id=s.id and sdet.oil_id=o.id
		and DATE(s.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND ((_customer_id=0 AND 1) OR (_customer_id<> 0 AND s.customer_id=_customer_id))
		and ((_oil_name='' AND 1) OR (_oil_name<> '' AND o.`name` LIKE CONCAT('%',_oil_name,'%')))
		AND ((_code='' AND 1) OR (_code<> '' AND s.code LIKE CONCAT('%',_code,'%')))
		and (idet.id is null or(idet.id is not null and idet.paid_amount<>sdet.amount))
	order by s.created_date, sdet.id
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchSaleOilReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchSaleOilReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchSaleOilReturn`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT)
BEGIN
	SELECT s.*
	FROM oil_sale_return AS s, employee AS eo
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccessoryImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/* Procedure structure for procedure `updateCustomer` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateCustomer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCustomer`(in _id int, IN _name VARCHAR(255), IN _code VARCHAR(20), IN _organization_id INT, IN _status INT, IN _phone VARCHAR(30)
	, IN _bank_account TEXT, IN _tax VARCHAR(30), IN _presenter VARCHAR(255), IN _presenter_position VARCHAR(255), IN _address TEXT, IN _is_gas INT
	, IN _is_petro INT, IN _is_good INT, IN _is_oil INT, IN _commission_kind INT, IN _commission_percentage FLOAT, IN _note TEXT)
BEGIN
	Update customer Set name=_name
		, code=_code
                , organization_id=_organization_id
		, STATUS=_status
		, phone=_phone
		, bank_account=_bank_account
		, tax=_tax
                , presenter=_presenter
                , presenter_position=_presenter_position
		, address=_address
		, is_gas=_is_gas
                , is_petro=_is_petro
                , is_good=_is_good
                , is_oil=_is_oil
		, commission_kind=_commission_kind
                , commission_percentage=_commission_percentage
                , note =_note
	Where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtAdjustment` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtAdjustment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtAdjustment`(IN _id INT, IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _vendor_id INT, IN _customer_id INT, in _kind int, IN _note TEXT)
BEGIN
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
	UPDATE vendor_debt SET vendor_id=_vendor_id, paid=_paid, account_id=_account_id, note=_note, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y'), kind=_kind WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtWholesale`(IN _id INT, IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, in _kind int)
BEGIN
	UPDATE wholesale_debt SET customer_id=_customer_id
		, paid=_paid
		, account_id=_account_id
		, note=_note
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') 
		, kind=_kind
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDiscountCommissionDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDiscountCommissionDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDiscountCommissionDetail`(IN _id INT, IN _commission_from double, IN _commission_to double, IN _commission double)
BEGIN
	UPDATE discount_oil_detail SET commission_from=_commission_from, commission_to=_commission_to, commission=_commission WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeAdvance`(IN _id INT, IN _employee_id INT, in _advance_date VARCHAR(20), IN _amount DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesaleDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE gas_export_wholesale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExportWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExportWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesaleReturnShellDetail`(IN _id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFractionDetail`(in _id int, in _quantity int)
BEGIN
	update fraction_gas_detail set quantity=_quantity where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasImport`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
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
	, in _vendor_id int)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _old_vendor_id, _shell_id, _old_quantity INT DEFAULT 0;
	DECLARE _date, _old_date DATE;
	
	SELECT f.created_date, eo.organization_id, f.vendor_id, fdet.shell_id, fdet.quantity
	INTO _old_date, _organization_id, _old_vendor_id, _shell_id, _old_quantity
	FROM gas_import_detail fdet, gas_import AS f, employee AS eo
	WHERE fdet.id=_id and f.id=fdet.gas_import_id AND f.created_employee_id=eo.id;
	
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
	DECLARE _organization_id, _vendor_id, _old_wholesale_debt_id INT DEFAULT 0;
	declare _old_paid, _old_debt, _old_old_paid_debt double default 0;
	
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesaleDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesalePromotionMaterialDetail`(IN _id INT, IN _quantity INT)
BEGIN
	UPDATE gas_wholesale_promotion SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasWholesaleReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasWholesaleReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesaleReturnShellDetail`(IN _id INT, IN _quantity INT)
BEGIN
	UPDATE gas_wholesale_return_shell SET quantity=_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGoodImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGoodImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoodImport`(IN _id INT, IN _created_date VARCHAR(20), IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _vendor_id INT, IN _store_id INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoodImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE good_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateIncome` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateIncome` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIncome`(IN _id INT, IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _account_id INT, IN _note TEXT, IN _content TEXT, in _type int)
BEGIN
	UPDATE income SET amount=_amount, account_id=_account_id, note=_note, content=_content, `type`=_type, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInvoice`(in _id int, IN _number TEXT, IN _created_date VARCHAR(20)
	, IN _amount DOUBLE, IN _amount_paid DOUBLE, IN _note TEXT)
BEGIN
	update invoice set number=_number
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, amount=_amount
		, amount_paid=_amount_paid
		, note=_note
	where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateInvoiceDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateInvoiceDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInvoiceDetail`(in _id int, IN _paid INT, in _commissioned int, IN _paid_amount DOUBLE)
BEGIN
	update invoice_detail set paid=_paid, commissioned=_commissioned, paid_amount=_paid_amount where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateInvoicePaidDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateInvoicePaidDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInvoicePaidDetail`(IN _id INT, IN _amount DOUBLE)
BEGIN
	update invoice_paid_detail set amount=_amount where id=_id;
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
	DECLARE _link_lpg_ids TEXT DEFAULT '';
		
	SELECT GROUP_CONCAT(id) INTO _link_lpg_ids FROM lpg_sale WHERE CONCAT('%,',_link_lpg_codes,',%') LIKE CONCAT('%,',CODE,',%');
	
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

/* Procedure structure for procedure `updateOilExport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOilExport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilExport`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _note TEXT)
BEGIN
	UPDATE oil_export SET total=_total, note=_note, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y') WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOilExportDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOilExportDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilExportDetail`(IN _id INT, IN _quantity INT)
BEGIN
	update oil_export_detail set quantity=_quantity where id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOilImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOilImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilImport`(IN _id INT, IN _created_date VARCHAR(20), IN _commission FLOAT, IN _rate DOUBLE
	, IN _total_before_commission DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, IN _store_id INT, IN _vendor_id INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOilImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	DECLARE _oil_id, _unit_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	
	SELECT fdet.oil_id, fdet.unit_id
	INTO _oil_id, _unit_id
	FROM oil_import_detail AS fdet
	WHERE fdet.id=_id;
	
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
	
	UPDATE oil_import_detail SET quantity=_quantity, base_quantity=_rate_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOldShell`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _shell_id int, IN _note TEXT)
BEGIN
	UPDATE old_shell SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y'), quantity=_quantity, shell_id=_shell_id, note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePetroImport`(IN _id INT, IN _created_date VARCHAR(20), IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT, in _vendor_id int, in _store_id int)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePetroImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE petro_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePromotionMaterialImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePromotionMaterialImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePromotionMaterialImport`(IN _id INT, IN _created_date VARCHAR(20), IN _vendor_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePromotionMaterialImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleAccessoryDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE accessory_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleGood`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _store_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleGoodDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE good_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleInner` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleInner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleInner`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _employee_id INT)
BEGIN
	DECLARE _old_employee_advance_id, _created_employee_id INT DEFAULT 0;
	
	SELECT f.created_employee_id
	INTO _created_employee_id
	FROM inner_sale AS f, employee AS eo 
	WHERE f.id=_id AND f.created_employee_id=eo.id;
	
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleInnerDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE inner_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOil`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _commission FLOAT, IN _commission_kind INT
	, IN _commission_amount DOUBLE, IN _gap_agency_amount DOUBLE, IN _gap_customer_amount DOUBLE, IN _total_before_commission DOUBLE, IN _note TEXT
	, IN _is_calculate_agency_commission INT)
BEGIN
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
		, is_calculate_agency_commission=_is_calculate_agency_commission
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
	DECLARE _oil_id, _unit_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	
	SELECT fdet.oil_id, fdet.unit_id
	INTO _oil_id, _unit_id
	FROM oil_sale_detail AS fdet
	WHERE fdet.id=_id;
	
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
	
	UPDATE oil_sale_detail SET quantity=_quantity
		, base_quantity=_rate_quantity
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

/* Procedure structure for procedure `updateSaleOilPromotionMaterialDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOilPromotionMaterialDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOilPromotionMaterialDetail`(IN _id INT, IN _quantity INT)
BEGIN
	DECLARE _oil_id, _unit_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	
	SELECT fdet.oil_id, fdet.unit_id
	INTO _oil_id, _unit_id
	FROM oil_sale_promotion AS fdet
	WHERE fdet.id=_id;
	
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
	
	UPDATE oil_sale_promotion SET quantity=_quantity, base_quantity=_rate_quantity WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleOilReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOilReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOilReturn`(IN _id INT, IN _created_date VARCHAR(20), IN _customer_id INT, IN _total DOUBLE
	, IN _paid DOUBLE, IN _debt DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _commission FLOAT, IN _commission_kind INT
	, IN _commission_amount DOUBLE, IN _gap_agency_amount DOUBLE, IN _gap_customer_amount DOUBLE, IN _total_before_commission DOUBLE, IN _note TEXT)
BEGIN
	UPDATE oil_sale SET total=_total
		, customer_id=_customer_id
		, paid=_paid
		, debt=_debt
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

/* Procedure structure for procedure `updateSaleOilReturnDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleOilReturnDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleOilReturnDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE
	, IN _price_before_commission DOUBLE, IN _commssion_price FLOAT, IN _first_amount DOUBLE, IN _commission FLOAT, IN _gap_agency_amount DOUBLE
	, IN _gap_customer_amount DOUBLE)
BEGIN
	DECLARE _oil_id, _unit_id, _base_unit_id, _rate_quantity INT DEFAULT 0;
	SELECT fdet.oil_id, fdet.unit_id
	INTO _oil_id, _unit_id
	FROM oil_sale_return_detail AS fdet
	WHERE fdet.id=_id;
	
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
	
	UPDATE oil_sale_return_detail SET quantity=_quantity
		, base_quantity=_rate_quantity
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalePetroDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE petro_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateSaleShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSaleShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleShell`(IN _id INT, IN _created_date VARCHAR(20), IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, in _customer_id int)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleShellDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE shell_sale_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellImport`(IN _id INT, IN _created_date VARCHAR(20), IN _shell_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id int, IN _note TEXT, in _vendor_id int)
BEGIN
	DECLARE _old_shell_id, _old_vendor_id, _in_stock_id, _organization_id INT DEFAULT 0;
		
	SELECT i.shell_id, i.vendor_id, eo.organization_id
	INTO _old_shell_id, _old_vendor_id, _organization_id
	FROM shell_import as i, employee as eo
	WHERE i.id=_id and i.created_employee_id=eo.id;
	
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnDetail`(IN _id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnSupplierDetail`(IN _id INT, IN _quantity INT)
BEGIN
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
	UPDATE shield_decrease SET quantity=_quantity, note=_note, vendor_id=_vendor_id WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShieldImport`(IN _id INT, IN _quantity INT, IN _note TEXT, in _vendor_id int)
BEGIN
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
	DECLARE _organization_id, _organization_vendor_id, _organization_transport_vendor_id INT DEFAULT 0;
	DECLARE _money_organization_id, _vendor_vendor_id, _customer_customer_id INT DEFAULT 0;
	DECLARE _money_amount, _vendor_amount, _customer_amount DOUBLE DEFAULT 0;
	
	SELECT eo.organization_id
	INTO _organization_id
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
	
	-- chi dung tren phuong dien minh la ncc
	IF _charge_for_vendor=1 THEN	-- ben ban chiu
		IF _organization_vendor_id<>0 THEN	-- ben ban la minh
			IF _vendor_id<>_transporter_id THEN	-- minh khong phai la ben van chuyen
				SET _money_organization_id = _organization_vendor_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = -_debt;
			END IF;
		ELSE -- ben ban la cong ty khac
			IF _organization_transport_vendor_id<>0 THEN	-- minh la cong ty van chuyen
				SET _money_organization_id = _organization_transport_vendor_id;
				SET _money_amount = _paid;
				SET _vendor_vendor_id = _vendor_id;
				SET _vendor_amount = _debt;
			END IF;
		END IF;
	ELSEIF _charge_for_customer=1 THEN	-- ben mua chiu
		IF _customer_id=0 THEN	-- ben mua la minh
			IF _organization_transport_vendor_id=0 THEN	-- minh khong phai la cong ty van chuyen
				SET _money_organization_id = _organization_id;
				SET _money_amount = -_paid;
				SET _vendor_vendor_id = _transporter_id;
				SET _vendor_amount = -_debt;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInAccessoryDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE vehicle_in_accessory_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleInDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleInDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE vehicle_in_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVehicleInReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVehicleInReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleInReturnShellDetail`(IN _id INT, IN _quantity INT)
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleOutDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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
	, IN _fax VARCHAR(50), IN _code VARCHAR(20), IN _organization_id INT, IN _status INT, IN _equal_organization_id INT, in _has_stock int, IN _is_gas INT
	, IN _is_petro INT, IN _is_good INT, IN _is_transport INT, IN _is_oil INT, in _id INT)
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
	where id=_id;
	
	update shell set `status`=_status where vendor_id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateVendorOil` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateVendorOil` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVendorOil`(IN _commision_on_import FLOAT, IN _max_debt DOUBLE, IN _id INT)
BEGIN
	UPDATE vendor SET commision_on_import=_commision_on_import, max_debt=_max_debt WHERE id=_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
