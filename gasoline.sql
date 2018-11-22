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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory` */

insert  into `accessory`(`id`,`kind_id`,`name`,`price`,`unit_id`,`status`) values (6,1,'Bếp Nagas',123456,4,1),(7,2,'Van',10000,4,1),(8,2,'Kẹp',5000,4,1);

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
  `in_stock` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_in_stock` */

insert  into `accessory_in_stock`(`id`,`day`,`accessory_id`,`in_stock`,`organization_id`) values (123,'2018-11-21',6,0,1),(124,'2018-11-21',7,0,1),(125,'2018-11-21',8,0,1),(126,'2018-11-21',6,0,14),(127,'2018-11-21',7,0,14),(128,'2018-11-21',8,0,14);

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

insert  into `accessory_kind`(`id`,`name`,`commission`,`note`,`status`) values (1,'Bếp',3000,'Bếp',1),(2,'Phụ kiện',1000,'Phụ kiện',1);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`number`,`holder`,`bank`,`branch`,`organization_id`,`note`,`is_cash`) values (5,'Tiền mặt','Cao Huy Hoàng','Quang Trung','Quang Trung',1,'',1),(4,'001223445','Cao Huy Hoàng','Agribank','Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu',1,'',0),(7,'Tiền mặt','Hiệp Hương','Hiệp Hương','Hiệp Hương',14,'',1),(8,'34567890','Hiệp Hương','Sacombank','Gò Vấp, TP.HCM',14,'',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auto` */

insert  into `auto`(`id`,`auto_date`,`auto_name`) values (20,'2018-11-21','in_stock');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`code`,`name`,`organization_id`,`status`,`kind`,`address`,`phone`,`bank_account`,`tax`,`presenter`,`presenter_position`,`discount`,`is_gas`,`is_petro`,`is_good`) values (1,'TP','Công ty TNHH Gốm Tân Phát',1,1,2,'Lô số 164, Đường N1, Cụm công nghiệp Gốm sứ, Ấp 4, xã Tân Hạnh, Tp. Biên Hòa, Tỉnh Đồng Nai','0915. 87.36.37','','3603454432','Nguyễn Thị Thanh Thúy','Giám đốc','',1,0,0),(2,'LPGHH','Cửa hàng LPG Huy Hoàng',1,1,1,'Số 125/5 ấp Phú Tâm, xã Hòa Hiệp, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','0988789713','','123456789','Nguyễn Tiến Công','Giám đốc','CK1,HT5K',1,0,0),(10,'b','b',1,1,2,'','','','','','','',0,0,1),(9,'a','a',1,1,2,'','','','','','','',0,1,0);

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
  `shell_12` int(11) DEFAULT NULL,
  `shell_45` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_in_stock` */

insert  into `customer_in_stock`(`id`,`day`,`customer_id`,`shell_12`,`shell_45`,`amount`) values (115,'2018-11-21',1,0,0,0),(116,'2018-11-21',2,0,0,0),(117,'2018-11-21',9,0,0,0),(118,'2018-11-21',10,0,0,0);

/*Table structure for table `discount` */

DROP TABLE IF EXISTS `discount`;

CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `discount` */

insert  into `discount`(`id`,`name`,`note`) values (2,'CK1','chiết khấu 1'),(3,'Ht5k','hỗ trợ 5k'),(4,'CK2','Chiết khấu 2');

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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_value` */

insert  into `dynamic_field_value`(`id`,`field_id`,`parent_id`,`value`) values (1,1,17,'12'),(2,2,17,'1'),(3,3,17,'2'),(4,7,17,'Cao Đẳng'),(5,4,18,'13'),(6,5,18,'0.5'),(7,6,18,'1'),(8,1,19,'12'),(9,2,19,'1'),(10,3,19,'2'),(11,7,19,''),(12,1,20,'12'),(13,2,20,'1'),(14,3,20,'2'),(15,7,20,''),(16,1,20,'12'),(17,2,20,'1'),(18,3,20,'2'),(19,7,20,''),(20,1,20,'12'),(21,2,20,'1'),(22,3,20,'2'),(23,7,20,''),(24,1,20,'12'),(25,2,20,'1'),(26,3,20,'2'),(27,7,20,''),(28,1,20,'12'),(29,2,20,'1'),(30,3,20,'2'),(31,7,20,''),(32,1,20,'12'),(33,2,20,'1'),(34,3,20,'2'),(35,7,20,''),(36,1,21,'12'),(37,2,21,'1'),(38,3,21,'2'),(39,7,21,''),(40,1,22,'12'),(41,2,22,'1'),(42,3,22,'2'),(43,7,22,''),(44,1,23,'12'),(45,2,23,'1'),(46,3,23,'2'),(47,7,23,''),(48,1,24,'12'),(49,2,24,'1'),(50,3,24,'2'),(51,7,24,''),(52,1,25,'12'),(53,2,25,'1'),(54,3,25,'2'),(55,7,25,''),(56,1,26,'12'),(57,2,26,'1'),(58,3,26,'2'),(59,7,26,''),(60,1,26,'12'),(61,2,26,'1'),(62,3,26,'2'),(63,7,26,''),(64,1,27,'12'),(65,2,27,'1'),(66,3,27,'2'),(67,7,27,''),(68,1,28,'12'),(69,2,28,'1'),(70,3,28,'2'),(71,7,28,'');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idcard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: da bi khoa, 1: dang su dung',
  `seniority` int(2) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`id`,`fullname`,`idcard`,`email`,`salary`,`organization_id`,`birthday`,`status`,`seniority`,`start_date`) values (1,'Admin',NULL,'admin@gmail.com',0,-1,'2018-08-23',1,0,NULL),(19,'Nguyễn Văn C',NULL,'c@gmail.com',0,1,NULL,1,1,NULL),(26,'b','b','',0,1,NULL,1,1,NULL),(18,'Nguyễn Thị B',NULL,'ntb@gmail.com',2000000,14,'1980-01-15',1,1,'2000-01-01'),(28,'a','d','',0,1,NULL,1,1,NULL),(17,'Phan Khắc Hùng',NULL,'hungpk@gmail.com',3000000,1,'1988-09-20',1,1,'2017-09-19'),(25,'a','a','',0,1,NULL,1,1,NULL),(27,'c','cc','',0,1,NULL,1,1,NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale_detail` */

/*Table structure for table `gas_export_wholesale_shell_detail` */

DROP TABLE IF EXISTS `gas_export_wholesale_shell_detail`;

CREATE TABLE `gas_export_wholesale_shell_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_export_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import_detail` */

/*Table structure for table `gas_price_list` */

DROP TABLE IF EXISTS `gas_price_list`;

CREATE TABLE `gas_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `kind` int(1) DEFAULT NULL COMMENT '1:khach le,2:khach si',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return_vendor` */

insert  into `gas_return_vendor`(`id`,`vendor_id`) values (1,14);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good_in_stock` */

insert  into `good_in_stock`(`id`,`day`,`good_id`,`organization_id`,`store_id`,`in_stock`) values (55,'2018-11-21',1,1,7,0),(56,'2018-11-21',2,1,7,0),(57,'2018-11-21',3,1,7,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_import` */

/*Table structure for table `lpg_in_stock` */

DROP TABLE IF EXISTS `lpg_in_stock`;

CREATE TABLE `lpg_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_in_stock` */

insert  into `lpg_in_stock`(`id`,`organization_id`,`vendor_id`,`day`,`in_stock`) values (121,1,14,'2018-11-21',0),(122,1,15,'2018-11-21',0),(123,14,17,'2018-11-21',0),(124,14,14,'2018-11-21',0),(125,1,17,'2018-11-21',0);

/*Table structure for table `lpg_sale` */

DROP TABLE IF EXISTS `lpg_sale`;

CREATE TABLE `lpg_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
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
  `lpg_import_id` int(11) DEFAULT NULL,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_sale` */

/*Table structure for table `money_in_stock` */

DROP TABLE IF EXISTS `money_in_stock`;

CREATE TABLE `money_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL COMMENT '0: tien mat',
  `organization_id` int(11) DEFAULT NULL COMMENT 'neu account_id=0 thi la id cua organization',
  `in_stock` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `money_in_stock` */

insert  into `money_in_stock`(`id`,`day`,`account_id`,`organization_id`,`in_stock`) values (120,'2018-11-21',4,1,0),(121,'2018-11-21',5,1,0),(122,'2018-11-21',7,14,0),(123,'2018-11-21',8,14,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

insert  into `organization`(`id`,`code`,`name`,`address`,`status`,`phone`,`fax`,`bank_account`,`tax`,`presenter`,`presenter_position`) values (1,'QT','Công ty TNHH Quang Trung','21 Bình Giã, khu phố Phước Lộc, thị trấn Phước Bửu, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu',1,'064.3771972','064.3877075','050014822604, tại ngân hàng Sacombank - PGD Xuyên Mộc, huyện Xuyên Mộc, tỉnh Bà Rịa Vũng Tàu','3501475916','Cao Huy Hoàng','Giám đốc'),(14,'HT','Công ty TNHH Khí Hóa Lỏng Hưng Thịnh','39/1, KP3, P. Tam Hiệp, TP. Biên Hòa, Đồng Nai',1,'(0251)3.818.111','(0251)3.855.550','050046951171 Ngân hàng TMCP Sài Gòn Thương Tín- Sacombank Chi nhánh Đ.Nai','3600874037','Trần Quang Ngọc','Giám đốc');

/*Table structure for table `organization_shell` */

DROP TABLE IF EXISTS `organization_shell`;

CREATE TABLE `organization_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization_shell` */

insert  into `organization_shell`(`id`,`organization_id`,`shell_id`) values (4,14,1),(5,14,2);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`,`note`,`users`,`organizations`) values (8,'admin','Quyền quản trị hệ thống','1','1,14'),(11,'Admin Quang Trung','','11','1');

/*Table structure for table `permission_detail` */

DROP TABLE IF EXISTS `permission_detail`;

CREATE TABLE `permission_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `operation` int(2) DEFAULT NULL,
  `function` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission_detail` */

insert  into `permission_detail`(`id`,`permission_id`,`operation`,`function`) values (17,8,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(16,8,1,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(18,8,3,'1,5,8,4,13,14,53,54,15,20,22,23,51,52,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(19,8,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,20,22,23,51,52,21,24,25,26,27,28,29,30,31,32,33,34,35,36,37,55,38,39,40,41,42,43,44,45,56,46,47,48,49,50'),(20,8,6,'56'),(36,11,6,'56,57,81,62,63,69,64,65,66,67,68,79,80,71,72,73,74,78,84,85'),(35,11,8,'20,52,27,59,28,30,31,32,33,37,76,77,34,36,38,39,40,42,43,44,45,46,48,49,50,60,61'),(33,11,3,'1,5,8,4,13,14,53,54,15,58,70,20,22,23,51,52,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,56,46,48,49,50,60,61'),(34,11,4,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,56,46,48,49,50,60,61'),(31,11,1,'1,5,83,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,56,46,48,49,50,60,61'),(32,11,2,'1,5,8,6,7,3,4,9,10,11,12,13,14,53,54,15,16,17,18,19,58,70,20,22,23,51,52,21,24,75,25,26,27,59,28,29,30,31,32,33,37,76,77,34,36,55,38,39,40,42,82,43,44,45,56,46,48,49,50,60,61');

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
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro_in_stock` */

insert  into `petro_in_stock`(`id`,`day`,`petro_id`,`organization_id`,`store_id`,`in_stock`) values (51,'2018-11-21',6,1,4,0),(52,'2018-11-21',6,1,6,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material_in_stock` */

insert  into `promotion_material_in_stock`(`id`,`day`,`promotion_material_id`,`organization_id`,`in_stock`) values (115,'2018-11-21',3,1,0),(116,'2018-11-21',4,1,0),(117,'2018-11-21',3,14,0),(118,'2018-11-21',4,14,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `route` */

insert  into `route`(`id`,`name`,`distance`,`note`) values (2,'Thị Vải - Supor',1234.5678,'a'),(3,'Gdầu - KCN VN-Sin',128,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell` */

insert  into `shell`(`id`,`kind_id`,`code`,`name`,`price`,`unit_id`,`status`) values (1,2,'S12','Start 12',100000,4,1),(2,1,'S45','Start 45',200000,4,1),(3,2,'Pet','Petimex',150000,4,1),(8,2,'MKG','Mai Khê Gas',100000,4,1);

/*Table structure for table `shell_gas_in_stock` */

DROP TABLE IF EXISTS `shell_gas_in_stock`;

CREATE TABLE `shell_gas_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `shell_vendor_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_gas_in_stock` */

insert  into `shell_gas_in_stock`(`id`,`day`,`shell_vendor_id`,`in_stock`) values (29,'2018-11-21',9,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_in_stock` */

insert  into `shell_in_stock`(`id`,`day`,`organization_id`,`shell_id`,`in_stock`) values (32,'2018-11-21',1,1,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_kind` */

insert  into `shell_kind`(`id`,`code`,`name`,`weight`,`commission`,`status`) values (1,'ST45','Gas 45 kg',45,1000,1),(2,'ST12','Gas 12 kg',12,500,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_vendor` */

insert  into `shell_vendor`(`id`,`organization_id`,`shell_id`,`vendor_id`,`quantity`) values (9,1,1,15,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shield_in_stock` */

insert  into `shield_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`in_stock`) values (119,'2018-11-21',14,1,0),(120,'2018-11-21',15,1,0),(121,'2018-11-21',17,1,0),(122,'2018-11-21',14,14,0),(123,'2018-11-21',17,14,0);

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

insert  into `store`(`id`,`code`,`name`,`organization_id`,`status`,`is_petro`,`is_good`) values (6,'QTK2','Kho cửa hàng Thái Bảo',1,1,1,0),(4,'QTK1','Kho cửa hàng Quang Trung',1,1,1,0),(7,'KTG','Kho trạm gas',1,1,0,1);

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
  `employee_count` int(11) DEFAULT NULL
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_fee` */

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit` */

insert  into `unit`(`id`,`name`,`status`) values (6,'Thùng',1),(5,'Lít',1),(4,'Bình',1),(7,'Cái',1),(8,'Bộ',1);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`employee_id`,`username`,`password`,`menu`,`status`) values (1,1,'tu','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Xuất xe về\"><item id=\"vehicleinlist\" text=\"Danh sách xuất xe về\"/><item id=\"vehicleinadd\" text=\"Thêm xuất xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán sỉ gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán sỉ gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán sỉ gas\"/></item><item id=\"gasretails\" complex=\"true\" text=\"Bán lẻ gas\"><item id=\"gasretaillist\" text=\"Danh sách phiếu bán lẻ gas\"/><item id=\"gasretailadd\" text=\"Thêm phiếu bán lẻ gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"gasreturns\" complex=\"true\" text=\"Trả gas\"><item id=\"gasreturnlist\" text=\"Danh sách trả gas\"/><item id=\"gasreturnadd\" text=\"Thêm trả gas\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"petroimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtretails\" complex=\"true\" text=\"Công nợ bán lẻ\"><item id=\"debtretaillist\" text=\"Danh sách công nợ bán lẻ\"/><item id=\"debtretailadd\" text=\"Thêm công nợ bán lẻ\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ bán sỉ\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ bán sỉ\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ bán sỉ\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(11,17,'hungpk','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"list\" complex=\"true\" text=\"Khai báo danh mục\"><item id=\"system\" complex=\"true\" text=\"Hệ thống\"><item id=\"users\" complex=\"true\" text=\"Tài khoản hệ thống\"><item id=\"userlist\" text=\"Danh sách tài khoản hệ thống\"/><item id=\"useradd\" text=\"Thêm tài khoản hệ thống\"/></item><item id=\"parameter\" text=\"Thông số hệ thống\"/><item id=\"permissionlist\" text=\"Phân quyền\"/><item id=\"openingstock\" text=\"Số dư đầu kỳ\"/></item><item id=\"organization\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizations\" complex=\"true\" text=\"Đơn vị\"><item id=\"organizationlist\" text=\"Danh sách đơn vị\"/><item id=\"organizationadd\" text=\"Thêm đơn vị\"/></item><item id=\"stores\" complex=\"true\" text=\"Kho\"><item id=\"storelist\" text=\"Danh sách kho\"/><item id=\"storeadd\" text=\"Thêm kho\"/></item><item id=\"employees\" complex=\"true\" text=\"Nhân viên\"><item id=\"employeelist\" text=\"Danh sách nhân viên\"/><item id=\"employeeadd\" text=\"Thêm nhân viên\"/><item id=\"employeefiellist\" text=\"Thông tin động - Nhân viên\"/></item><item id=\"accounts\" complex=\"true\" text=\"Tài khoản ngân hàng\"><item id=\"accountlist\" text=\"Danh sách tài khoản ngân hàng\"/><item id=\"accountadd\" text=\"Thêm tài khoản ngân hàng\"/></item></item><item id=\"good\" complex=\"true\" text=\"Hàng hóa\"><item id=\"units\" complex=\"true\" text=\"Đơn vị tính\"><item id=\"unitlist\" text=\"Danh sách đơn vị tính\"/><item id=\"unitadd\" text=\"Thêm đơn vị tính\"/></item><item id=\"shellkinds\" complex=\"true\" text=\"Loại vỏ bình\"><item id=\"shellkindlist\" text=\"Danh sách loại vỏ bình\"/><item id=\"shellkindadd\" text=\"Thêm loại vỏ bình\"/></item><item id=\"shells\" complex=\"true\" text=\"Vỏ bình\"><item id=\"shelllist\" text=\"Danh sách vỏ bình\"/><item id=\"shelladd\" text=\"Thêm vỏ bình\"/></item><item id=\"accessorykinds\" complex=\"true\" text=\"Loại phụ kiện\"><item id=\"accessorykindlist\" text=\"Danh sách loại phụ kiện\"/><item id=\"accessorykindadd\" text=\"Thêm loại phụ kiện\"/></item><item id=\"accessorys\" complex=\"true\" text=\"Phụ kiện\"><item id=\"accessorylist\" text=\"Danh sách phụ kiện\"/><item id=\"accessoryadd\" text=\"Thêm phụ kiện\"/></item><item id=\"promotionmaterials\" complex=\"true\" text=\"Hàng khuyến mãi\"><item id=\"promotionmateriallist\" text=\"Danh sách hàng khuyến mãi\"/><item id=\"promotionmaterialadd\" text=\"Thêm hàng khuyến mãi\"/></item><item id=\"petros\" complex=\"true\" text=\"Xăng dầu\"><item id=\"petrolist\" text=\"Danh sách hàng xăng dầu\"/><item id=\"petroadd\" text=\"Thêm hàng xăng dầu\"/></item><item id=\"goods\" complex=\"true\" text=\"Hàng hóa\"><item id=\"goodlist\" text=\"Danh sách hàng hóa\"/><item id=\"goodadd\" text=\"Thêm hàng hóa\"/></item></item><item id=\"vendor\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendors\" complex=\"true\" text=\"Nhà cung cấp\"><item id=\"vendorlist\" text=\"Danh sách nhà cung cấp\"/><item id=\"vendoradd\" text=\"Thêm nhà cung cấp\"/><item id=\"addgasreturnvendor\" text=\"Nhà cung cấp nhận gas trả\"/><item id=\"vendorfiellist\" text=\"Thông tin động - Nhà cung cấp\"/></item><item id=\"vendororganizations\" complex=\"true\" text=\"Nhà cung cấp liên kết\"><item id=\"vendororganizationlist\" text=\"Danh sách nhà cung cấp liên kết\"/><item id=\"vendororganizationadd\" text=\"Thêm nhà cung cấp liên kết\"/></item></item><item id=\"customer\" complex=\"true\" text=\"Khách hàng\"><item id=\"customers\" complex=\"true\" text=\"Khách hàng\"><item id=\"customerlist\" text=\"Danh sách khách hàng\"/><item id=\"customeradd\" text=\"Thêm khách hàng\"/><item id=\"customerfiellist\" text=\"Thông tin động - Khách hàng\"/><item id=\"customerdocumentlist\" text=\"Danh sách văn bản\"/></item><item id=\"discounts\" complex=\"true\" text=\"Chiết khấu\"><item id=\"discountlist\" text=\"Danh sách chiết khấu\"/><item id=\"discountadd\" text=\"Thêm chiết khấu\"/></item></item><item id=\"vehicle\" complex=\"true\" text=\"Xe\"><item id=\"vehicles\" complex=\"true\" text=\"Xe\"><item id=\"vehiclelist\" text=\"Danh sách xe\"/><item id=\"vehicleadd\" text=\"Thêm xe\"/></item><item id=\"routes\" complex=\"true\" text=\"Tuyến đường\"><item id=\"routelist\" text=\"Danh sách tuyến đường\"/><item id=\"routeadd\" text=\"Thêm tuyến đường\"/></item></item><item id=\"fixedassetgroup\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetgroups\" complex=\"true\" text=\"Nhóm tài sản cố định\"><item id=\"fixedassetgrouplist\" text=\"Danh sách nhóm tài sản cố định\"/><item id=\"fixedassetgroupadd\" text=\"Thêm nhóm tài sản cố định\"/></item><item id=\"fixedassets\" complex=\"true\" text=\"Tài sản cố định\"><item id=\"fixedassetlist\" text=\"Danh sách tài sản cố định\"/><item id=\"fixedassetadd\" text=\"Thêm tài sản cố định\"/></item></item></item><item id=\"employeefunction\" complex=\"true\" text=\"Nghiệp vụ Nhân viên\"><item id=\"employeeadvances\" complex=\"true\" text=\"Nhân viên tạm ứng\"><item id=\"employeeadvancelist\" text=\"Danh sách tạm ứng\"/><item id=\"employeeadvanceadd\" text=\"Thêm tạm ứng\"/></item><item id=\"employeetimesheets\" complex=\"true\" text=\"Chấm công nhân viên\"><item id=\"employeetimesheetlist\" text=\"Danh sách chấm công\"/><item id=\"employeetimesheetadd\" text=\"Thêm chấm công\"/></item><item id=\"employeeoffs\" complex=\"true\" text=\"Nghỉ phép\"><item id=\"employeeofflist\" text=\"Danh sách nghỉ phép\"/><item id=\"employeeoffadd\" text=\"Thêm nghỉ phép\"/></item><item id=\"employeeoffincreases\" complex=\"true\" text=\"Bù nghỉ phép\"><item id=\"employeeoffincreaselist\" text=\"Danh sách bù nghỉ phép\"/><item id=\"employeeoffincreaseadd\" text=\"Thêm bù nghỉ phép\"/></item><item id=\"employeeoffmoneys\" complex=\"true\" text=\"Thanh toán ngày phép\"><item id=\"employeeoffmoneylist\" text=\"Danh sách thanh toán ngày phép\"/><item id=\"employeeoffmoneyadd\" text=\"Thêm thanh toán ngày phép\"/></item><item id=\"salarys\" complex=\"true\" text=\"Bảng lương\"><item id=\"salarylist\" text=\"Danh sách bảng lương\"/><item id=\"salarysalaryfiels\" complex=\"true\" text=\"Thông tin động\"><item id=\"salaryfiellist\" text=\"Phụ cấp\"/><item id=\"timesheetfiellist\" text=\"Chấm công\"/></item><item id=\"dynamicfielvalues\" complex=\"true\" text=\"Giá trị thông tin động\"><item id=\"employeesalarylist\" text=\"Danh sách phụ cấp\"/><item id=\"organizationtimesheetlist\" text=\"Danh sách chi phí chấm công\"/></item></item></item><item id=\"vehiclefunction\" complex=\"true\" text=\"Nghiệp vụ Xe\"><item id=\"tripfees\" complex=\"true\" text=\"Chi phí xe\"><item id=\"tripfeelist\" text=\"Danh sách chi phí xe\"/><item id=\"tripfeeadd\" text=\"Thêm chi phí xe\"/></item><item id=\"vehicleouts\" complex=\"true\" text=\"Xuất xe đi\"><item id=\"vehicleoutlist\" text=\"Danh sách xuất xe đi\"/><item id=\"vehicleoutadd\" text=\"Thêm xuất xe đi\"/></item><item id=\"vehicleins\" complex=\"true\" text=\"Nhập xe về\"><item id=\"vehicleinlist\" text=\"Danh sách nhập xe về\"/><item id=\"vehicleinadd\" text=\"Thêm nhập xe về\"/></item><item id=\"exportwholesales\" complex=\"true\" text=\"Xuất sỉ\"><item id=\"exportwholesalelist\" text=\"Danh sách xuất sỉ\"/><item id=\"exportwholesaleadd\" text=\"Thêm xuất sỉ\"/></item></item><item id=\"gasfunction\" complex=\"true\" text=\"Nghiệp vụ gas\"><item id=\"shellimports\" complex=\"true\" text=\"Nhập vỏ bình\"><item id=\"shellimportlist\" text=\"Danh sách nhập vỏ bình\"/><item id=\"shellimportadd\" text=\"Thêm nhập vỏ bình\"/></item><item id=\"lpgimports\" complex=\"true\" text=\"Nhập LPG\"><item id=\"lpgimportlist\" text=\"Danh sách nhập LPG\"/><item id=\"lpgimportadd\" text=\"Thêm nhập LPG\"/></item><item id=\"lpgsales\" complex=\"true\" text=\"Bán LPG\"><item id=\"lpgsalelist\" text=\"Danh sách bán LPG\"/><item id=\"lpgsaleadd\" text=\"Thêm bán LPG\"/></item><item id=\"fractions\" complex=\"true\" text=\"Chiết gas\"><item id=\"fractionlist\" text=\"Danh sách chiết gas\"/><item id=\"fractionadd\" text=\"Thêm chiết gas\"/></item><item id=\"gasprices\" complex=\"true\" text=\"Giá bán gas\"><item id=\"gaspricelist\" text=\"Danh sách giá bán gas\"/><item id=\"gaspriceadd\" text=\"Thêm giá bán gas\"/></item><item id=\"gasimports\" complex=\"true\" text=\"Nhập gas\"><item id=\"gasimportlist\" text=\"Danh sách phiếu nhập gas\"/><item id=\"gasimportadd\" text=\"Thêm phiếu nhập gas\"/></item><item id=\"gaswholesales\" complex=\"true\" text=\"Bán gas\"><item id=\"gaswholesalelist\" text=\"Danh sách phiếu bán gas\"/><item id=\"gaswholesaleadd\" text=\"Thêm phiếu bán gas\"/></item><item id=\"saleshells\" complex=\"true\" text=\"Bán vỏ bình\"><item id=\"saleshelllist\" text=\"Danh sách phiếu bán vỏ bình\"/><item id=\"saleshelladd\" text=\"Thêm phiếu bán vỏ bình\"/></item><item id=\"oldshells\" complex=\"true\" text=\"Điều chỉnh số lượng vỏ bình\"><item id=\"oldshelllist\" text=\"Danh sách điều chỉnh số lượng vỏ bình\"/><item id=\"oldshelladd\" text=\"Thêm điều chỉnh số lượng vỏ bình\"/></item><item id=\"shellreturns\" complex=\"true\" text=\"Trả vỏ bình\"><item id=\"shellreturnlist\" text=\"Danh sách trả vỏ bình\"/><item id=\"shellreturnadd\" text=\"Thêm trả vỏ bình\"/></item><item id=\"shellreturnsuppliers\" complex=\"true\" text=\"Trả vỏ bình NCC\"><item id=\"shellreturnsupplierlist\" text=\"Danh sách trả vỏ bình NCC\"/><item id=\"shellreturnsupplieradd\" text=\"Thêm trả vỏ bình NCC\"/></item><item id=\"lovos\" complex=\"true\" text=\"Làm lò vỏ\"><item id=\"lovolist\" text=\"Danh sách làm lò vỏ\"/><item id=\"lovoadd\" text=\"Thêm làm lò vỏ\"/></item></item><item id=\"goodfunction\" complex=\"true\" text=\"Nghiệp vụ hàng hóa\"><item id=\"petroimports\" complex=\"true\" text=\"Nhập xăng\"><item id=\"petroimportlist\" text=\"Danh sách phiếu nhập xăng\"/><item id=\"petroimportadd\" text=\"Thêm phiếu nhập xăng\"/></item><item id=\"salepetros\" complex=\"true\" text=\"Bán xăng\"><item id=\"salepetrolist\" text=\"Danh sách phiếu bán xăng\"/><item id=\"salepetroadd\" text=\"Thêm phiếu bán xăng\"/></item><item id=\"goodimports\" complex=\"true\" text=\"Nhập hàng hóa\"><item id=\"goodimportlist\" text=\"Danh sách phiếu nhập hàng hóa\"/><item id=\"goodimportadd\" text=\"Thêm phiếu nhập hàng hóa\"/></item><item id=\"salegoods\" complex=\"true\" text=\"Bán hàng hóa\"><item id=\"salegoodlist\" text=\"Danh sách phiếu bán hàng hóa\"/><item id=\"salegoodadd\" text=\"Thêm phiếu bán hàng hóa\"/></item><item id=\"shieldimports\" complex=\"true\" text=\"Nhập shield\"><item id=\"shieldimportlist\" text=\"Danh sách phiếu nhập shield\"/><item id=\"shieldimportadd\" text=\"Thêm phiếu nhập shield\"/></item><item id=\"shielddecreases\" complex=\"true\" text=\"Giảm shield\"><item id=\"shielddecreaselist\" text=\"Danh sách phiếu giảm shield\"/><item id=\"shielddecreaseadd\" text=\"Thêm phiếu giảm shield\"/></item><item id=\"accessoryimports\" complex=\"true\" text=\"Nhập phụ kiện\"><item id=\"accessoryimportlist\" text=\"Danh sách phiếu nhập phụ kiện\"/><item id=\"accessoryimportadd\" text=\"Thêm phiếu nhập phụ kiện\"/></item><item id=\"saleaccessorys\" complex=\"true\" text=\"Bán phụ kiện\"><item id=\"saleaccessorylist\" text=\"Danh sách phiếu bán phụ kiện\"/><item id=\"saleaccessoryadd\" text=\"Thêm phiếu bán phụ kiện\"/></item><item id=\"promotionmaterialimports\" complex=\"true\" text=\"Nhập hàng khuyến mãi\"><item id=\"promotionmaterialimportlist\" text=\"Danh sách phiếu nhập hàng khuyến mãi\"/><item id=\"promotionmaterialimportadd\" text=\"Thêm phiếu nhập hàng khuyến mãi\"/></item><item id=\"fixedassetdepreciations\" complex=\"true\" text=\"Khấu hao\"><item id=\"fixedassetdepreciationlist\" text=\"Danh sách phiếu khấu hao\"/><item id=\"fixedassetdepreciationadd\" text=\"Thêm phiếu khấu hao\"/></item></item><item id=\"paymentfunction\" complex=\"true\" text=\"Nghiệp vụ thanh toán\"><item id=\"contracts\" complex=\"true\" text=\"Hợp đồng\"><item id=\"contractlist\" text=\"Danh sách hợp đồng\"/><item id=\"contractadd\" text=\"Thêm hợp đồng\"/></item><item id=\"debtvendors\" complex=\"true\" text=\"Công nợ NCC\"><item id=\"debtvendorlist\" text=\"Danh sách công nợ NCC\"/><item id=\"debtvendoradd\" text=\"Thêm công nợ NCC\"/></item><item id=\"debtwholesales\" complex=\"true\" text=\"Công nợ khách hàng\"><item id=\"debtwholesalelist\" text=\"Danh sách công nợ khách hàng\"/><item id=\"debtwholesaleadd\" text=\"Thêm công nợ khách hàng\"/></item><item id=\"incomes\" complex=\"true\" text=\"Thu\"><item id=\"incomelist\" text=\"Danh sách thu\"/><item id=\"incomeadd\" text=\"Thêm thu\"/></item><item id=\"expenses\" complex=\"true\" text=\"Chi\"><item id=\"expenselist\" text=\"Danh sách chi\"/><item id=\"expenseadd\" text=\"Thêm chi\"/></item></item><item id=\"reportfunction\" complex=\"true\" text=\"Báo cáo\"><item id=\"reportgas\" complex=\"true\" text=\"Báo cáo gas\"><item id=\"reportlpgimport\" text=\"Bảng theo dõi nhập hàng LPG\"/><item id=\"reportvendordebt\" text=\"Bảng theo dõi công nợ NCC\"/><item id=\"reportlpgstock\" text=\"Sổ theo dõi sản lượng khí hóa lỏng LPG\"/><item id=\"reportlpgstocksum\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG\"/><item id=\"reportlpgstocksumorganization\" text=\"Sổ theo dõi nhập xuất khí hóa lỏng LPG theo nhà cung cấp\"/><item id=\"reportsum\" text=\"Tổng hợp\"/><item id=\"reportcompare\" text=\"Đối chiếu\"/><item id=\"reportsale\" text=\"Xuất bán hàng\"/><item id=\"reportsalecustomer\" text=\"Chi tiết bán hàng theo khách hàng\"/><item id=\"reportcashbook\" text=\"Báo cáo quỹ tiền\"/><item id=\"reportgascommission\" text=\"Chiết khấu bán hàng - Gas\"/><item id=\"reportgasemployeecommission\" text=\"Thanh toán tiền chiết khấu - Gas\"/></item><item id=\"reportpetro\" complex=\"true\" text=\"Báo cáo xăng\"><item id=\"reportpetroimport\" text=\"Bảng theo dõi nhập hàng xăng\"/><item id=\"reportpetrosale\" text=\"Xuất bán hàng xăng dầu\"/><item id=\"reportpetrostock\" text=\"Sổ theo dõi NXT xăng dầu tổng hợp\"/><item id=\"reportpetrostockstore\" text=\"Sổ theo dõi NXT xăng dầu theo cửa hàng\"/></item><item id=\"reportgood\" complex=\"true\" text=\"Báo cáo hàng hóa\"><item id=\"reportcomparegood\" text=\"Đối chiếu hàng hóa\"/></item><item id=\"reporttransport\" complex=\"true\" text=\"Báo cáo xe\"><item id=\"reporttransportfee\" text=\"Bảng theo dõi chi phí vận chuyển\"/><item id=\"reportvehiclefee\" text=\"Bảng theo dõi chi phí xe\"/></item></item><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1),(12,18,'ntb','gdyb21LQTcIANtvYMT7QVQ==','<?xml version=\"1.0\"?><menu><item id=\"setting\" complex=\"true\" text=\"Cấu hình\"><item id=\"resetpassword\" text=\"Đổi mật khẩu\"/></item><item id=\"logout\" text=\"Đăng xuất\"/></menu>',1);

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle` */

insert  into `vehicle`(`id`,`plate`,`note`) values (6,'72A-123.45','Xe tải'),(5,'72C-07468','Xe bồn');

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_in_detail` */

/*Table structure for table `vehicle_in_return_shell_detail` */

DROP TABLE IF EXISTS `vehicle_in_return_shell_detail`;

CREATE TABLE `vehicle_in_return_shell_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_in_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_detail` */

/*Table structure for table `vehicle_out_employee_detail` */

DROP TABLE IF EXISTS `vehicle_out_employee_detail`;

CREATE TABLE `vehicle_out_employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_out_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle_out_employee_detail` */

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: dang khoa, 1: dang su dung',
  `equal_organization_id` int(11) DEFAULT '-1',
  `has_stock` int(1) DEFAULT '0' COMMENT '0:khong tinh NXT, 1:tinh NXT',
  `is_gas` int(1) DEFAULT '0',
  `is_petro` int(1) DEFAULT '0',
  `is_good` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`code`,`name`,`organization_id`,`status`,`equal_organization_id`,`has_stock`,`is_gas`,`is_petro`,`is_good`) values (17,'HT','Hưng Thịnh',14,1,14,1,1,0,0),(16,'KDK','KDK',1,1,-1,0,1,0,0),(15,'VNS','Vinashin',1,1,-1,1,1,0,0),(14,'QT','Quang Trung',1,1,1,1,1,0,0),(18,'TCP','Thanh Châu Phát',1,1,-1,0,0,1,0),(19,'PVO MD','PV Oil MĐ',1,1,-1,0,0,1,0),(20,'NIWA','NIWA',1,1,-1,0,0,0,1);

/*Table structure for table `vendor_debt` */

DROP TABLE IF EXISTS `vendor_debt`;

CREATE TABLE `vendor_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_debt` */

/*Table structure for table `vendor_in_stock` */

DROP TABLE IF EXISTS `vendor_in_stock`;

CREATE TABLE `vendor_in_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_in_stock` */

insert  into `vendor_in_stock`(`id`,`day`,`vendor_id`,`organization_id`,`amount`) values (249,'2018-11-21',14,1,0),(250,'2018-11-21',14,14,0),(251,'2018-11-21',15,1,0),(252,'2018-11-21',16,1,0),(253,'2018-11-21',17,1,0),(254,'2018-11-21',17,14,0),(255,'2018-11-21',18,1,0),(256,'2018-11-21',19,1,0),(257,'2018-11-21',20,1,0);

/*Table structure for table `vendor_organization` */

DROP TABLE IF EXISTS `vendor_organization`;

CREATE TABLE `vendor_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_organization` */

insert  into `vendor_organization`(`id`,`vendor_id`,`organization_id`) values (10,14,1),(11,15,1),(12,16,1),(13,17,14),(14,14,14),(15,17,1),(16,18,1),(17,19,1),(18,20,1);

/*Table structure for table `wholesale_debt` */

DROP TABLE IF EXISTS `wholesale_debt`;

CREATE TABLE `wholesale_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

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
	DELETE FROM accessory_import_detail WHERE accessory_import_id=_id;
	DELETE FROM accessory_import WHERE id=_id;
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
	DELETE FROM gas_wholesale WHERE id=_id;
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
	DECLARE _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT import_date, actual_quantity, amount INTO _date, _old_quantity, _old_amount FROM lpg_import WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM lpg_in_stock AS ss, lpg_import AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id AND ss.vendor_id=i.vendor_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM vendor_in_stock as ss, lpg_import AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=eo.organization_id and eo.id=i.created_employee_id AND ss.vendor_id=i.vendor_id and i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE vendor_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, lpg_import AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id AND ss.account_id=i.account_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
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
	DECLARE _date_diff, _in_stock_id, _old_quantity, _old_customer_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
	
	SELECT sale_date, quantity, amount, customer_id INTO _date, _old_quantity, _old_amount, _old_customer_id
	FROM lpg_sale WHERE id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM lpg_in_stock AS ss, lpg_sale AS s, lpg_import as i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id and i.id=s.lpg_import_id 
			AND ss.vendor_id=i.vendor_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM customer_in_stock AS ss, lpg_sale AS s
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id= s.customer_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE customer_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock AS ss, lpg_sale AS s, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=s.created_employee_id and ss.account_id=s.account_id AND s.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
		END IF;
	
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
	DECLARE _date_diff, _in_stock_id, _old_quantity INT DEFAULT 0;
	declare _old_amount double;
	DECLARE _date DATE;
	
	SELECT sv.id, sv.quantity INTO _shell_vendor_id, _old_shell_vendor_quantity
	FROM shell_vendor as sv, shell_import as i, employee as eo
	WHERE i.id=_id AND eo.id=i.created_employee_id and sv.shell_id=i.shell_id AND sv.vendor_id=i.vendor_id AND sv.organization_id=eo.organization_id ;
	
	select created_date, quantity, amount into _date, _old_quantity, _old_amount from shell_import where id=_id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM shell_in_stock as ss, shell_import as i, employee as eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id and eo.id=i.created_employee_id and ss.shell_id=i.shell_id and i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id 
		FROM money_in_stock as ss, shell_import AS i, employee AS eo
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= eo.organization_id AND eo.id=i.created_employee_id AND ss.account_id=i.account_id AND i.id=_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock - _old_amount WHERE id=_in_stock_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `importVendorOpeningStock`(IN _date VARCHAR(20), IN _organization_id INT, IN _vendor_id INT, IN _in_stock DOUBLE)
BEGIN
	DECLARE _id INT;
	DECLARE _old_stock, _diff DOUBLE DEFAULT 0;
	
	SELECT id, amount INTO _id, _old_stock
	FROM vendor_in_stock
	WHERE DATE(`day`) = STR_TO_DATE(_date,'%d/%m/%Y') AND organization_id=_organization_id AND vendor_id=_vendor_id;
	
	IF _id IS NULL THEN
		INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount)
		VALUES (_date, _organization_id, _vendor_id, _in_stock);
	ELSE
		SET _diff = _in_stock - _old_stock;
		UPDATE vendor_in_stock SET amount=_in_stock WHERE id=_id;
	
		UPDATE vendor_in_stock SET amount=amount + _diff WHERE DATE(`day`) > STR_TO_DATE(_date,'%d/%m/%Y') 
			AND organization_id=_organization_id AND vendor_id=_vendor_id;
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
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO vendor_debt (CODE, vendor_id, created_date, paid, account_id, note, created_employee_id)
	VALUES (_code, _vendor_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _paid, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDebtWholesale`(IN _code VARCHAR(20), IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT, IN _created_employee_id INT, OUT _id INT)
BEGIN
	INSERT INTO wholesale_debt (CODE, customer_id, created_date, paid, account_id, note, created_employee_id)
	VALUES (_code, _customer_id, STR_TO_DATE(_created_date,'%d/%m/%Y'), _paid, _account_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExportWholesaleDetail`(IN _gas_export_wholesale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasImportDetail`(IN _gas_import_id INT, IN _shell_id INT, IN _quantity INT, in _price double, in _amount double)
BEGIN
	INSERT INTO gas_import_detail(gas_import_id, shell_id, quantity, price, amount) VALUES (_gas_import_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasPrice` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasPrice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasPrice`(IN _code VARCHAR(20), IN _from_date VARCHAR(20), IN _to_date VARCHAR(20)
	, IN _price DOUBLE, IN _kind int, IN _note TEXT, OUT _id INT)
BEGIN
	INSERT INTO gas_price_list (CODE, from_date, to_date, kind, price, note)
	VALUES (_code, STR_TO_DATE(_from_date,'%d/%m/%Y'), STR_TO_DATE(_to_date,'%d/%m/%Y'), _kind, _price, _note);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasReturnVendor`(in _id int, in _vendor_id int)
BEGIN
	if _id=0 then
		insert into gas_return_vendor(vendor_id) values(_vendor_id);
	else
		update gas_return_vendor set vendor_id=_vendor_id where id=_id;
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
	INSERT INTO gas_wholesale (CODE, created_date, customer_id, vehicle_out_id, total, paid, debt, discount, total_pay, account_id, note, gas_return, gas_return_price, gas_return_amount, created_employee_id)
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _customer_id, _vehicle_out_id, _total, _paid, _debt, _discount, _total_pay, _account_id, _note, _gas_return, _gas_return_price, _gas_return_amount, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertGasWholesaleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertGasWholesaleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGasWholesaleDetail`(IN _gas_wholesale_id INT, IN _shell_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	INSERT INTO gas_wholesale_detail(gas_wholesale_id, shell_id, quantity, price, amount) 
	VALUES (_gas_wholesale_id, _shell_id, _quantity, _price, _amount);
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
	VALUES (_code, STR_TO_DATE(_created_date,'%d/%m/%Y'), _amount, _account_id, _note, _content, _type, _created_employee_id);
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
	
-- ==============================================
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
	SELECT _current_date, o.id, sv.shell_id, coalesce(tbl_old_stock.tbl_old_in_stock,0) + COALESCE(SUM(tbl.in_stock),0)
	FROM shell as s, organization as o, shell_vendor as sv
	LEFT JOIN (
		SELECT  organization_id, shell_id, COALESCE(in_stock,0) AS tbl_old_in_stock
		FROM shell_in_stock WHERE date(`day`)=_pre_date
	) AS tbl_old_stock ON sv.shell_id=tbl_old_stock.shell_id and sv.organization_id=tbl_old_stock.organization_id
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
	) AS tbl ON tbl.shell_id=sv.shell_id and tbl.organization_id=sv.organization_id
	WHERE o.id=sv.organization_id and sv.shell_id=s.id and s.STATUS=1 and o.status=1 GROUP BY o.id, s.id;
	
-- ==============================================
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
	
-- ==========================================
	
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
		+ COALESCE(tbl_lpg_in_stock.tbl_import_quantity,0) - COALESCE(tbl_lpg_in_stock.tbl_sale_quantity,0) 
		- COALESCE(tbl_lpg_in_stock.tbl_fraction_quantity,0) + COALESCE(tbl_lpg_in_stock.tbl_gas_return_quantity,0)
	FROM (
		SELECT vo.organization_id, vo.vendor_id, tbl_import.tbl_import_quantity, tbl_sale.tbl_sale_quantity, tbl_old_stock.tbl_old_stock_quantity, tbl_fraction.tbl_fraction_quantity, tbl_gas_return.tbl_gas_return_quantity
		FROM vendor as v, vendor_organization as vo
		LEFT JOIN (
			SELECT COALESCE(SUM(i.actual_quantity),0) AS tbl_import_quantity, i.vendor_id, eo.organization_id
			FROM lpg_import as i, employee as eo
			WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
				and i.created_employee_id=eo.id
			group by i.vendor_id, eo.organization_id
		) AS tbl_import ON tbl_import.vendor_id=vo.vendor_id and tbl_import.organization_id=vo.organization_id
		LEFT JOIN (
			SELECT COALESCE(SUM(s.quantity),0) AS tbl_sale_quantity, i.vendor_id, eo.organization_id
			FROM lpg_sale AS s, lpg_import AS i, employee AS eo
			WHERE DATE(s.sale_date) > _date AND DATE(s.sale_date) <= _current_date
				and s.lpg_import_id=i.id AND s.created_employee_id=eo.id
			GROUP BY i.vendor_id, eo.organization_id
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
			SELECT COALESCE(SUM(s.gas_return),0) AS tbl_gas_return_quantity, rv.vendor_id, eo.organization_id
			FROM gas_wholesale AS s, gas_return_vendor as rv, employee as eo
			WHERE DATE(s.created_date) > _date AND DATE(s.created_date) <= _current_date
				and s.created_employee_id=eo.id
			GROUP BY rv.vendor_id, eo.organization_id
		) AS tbl_gas_return ON tbl_gas_return.vendor_id=vo.vendor_id and tbl_gas_return.organization_id=vo.organization_id
		where v.id=vo.vendor_id and v.status=1 and v.has_stock=1
	) AS tbl_lpg_in_stock;
-- ==========================================
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
	
-- ==========================================
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
-- ==========================================
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
	
-- ==========================================
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
	
-- ==========================================
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
	
-- ==========================================
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
	
-- ==========================================
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
		FROM lpg_sale AS i
		WHERE DATE(i.sale_date) > _date AND DATE(i.sale_date) <= _current_date
		GROUP BY i.customer_id
	) AS tbl ON tbl.customer_id=c.id
	LEFT JOIN (
		SELECT customer_id, COALESCE(shell_12,0) AS shell_12, COALESCE(shell_45,0) AS shell_45, COALESCE(amount,0) AS amount
		FROM customer_in_stock WHERE DATE(`day`)=_pre_date
	) AS tbl_old_stock ON tbl_old_stock.customer_id=c.id
	WHERE c.STATUS=1
	GROUP BY c.id
	;
	
-- ==========================================
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
	
	INSERT INTO vendor_in_stock(DAY, vendor_id, organization_id, amount)
	SELECT _current_date, vo.vendor_id, vo.organization_id, COALESCE(tbl_old_stock.amount,0) + COALESCE(SUM(tbl.debt),0)
	FROM vendor as v, organization as o, vendor_organization AS vo
	LEFT JOIN (
		SELECT i.vendor_id, eo.organization_id, sum(i.debt) as debt
		FROM lpg_import AS i, employee as eo
		WHERE DATE(i.import_date) > _date AND DATE(i.import_date) <= _current_date
			and i.created_employee_id=eo.id
		GROUP BY i.vendor_id
	) AS tbl ON tbl.vendor_id=vo.vendor_id and tbl.organization_id=vo.organization_id
	LEFT JOIN (
		SELECT vendor_id, organization_id, COALESCE(amount,0) AS amount
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLpgImport`(IN _code VARCHAR(20), IN _vendor_id INT, IN _import_date VARCHAR(20), IN _paper_quantity float
	, IN _actual_quantity float, IN _price double, in _vat double, in _invoice_amount double, IN _amount double, IN _paid double, IN _debt double
	, IN _rate double, in _account_id int, in _route_id int, IN _note TEXT, in _created_employee_id int, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_import_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	
	INSERT INTO lpg_import (CODE, vendor_id, import_date, paper_quantity, actual_quantity, price, vat, invoice_amount, amount, paid, debt, rate, account_id, route_id, note, created_employee_id)
	VALUES (_code, _vendor_id, _date, _paper_quantity, _actual_quantity, _price, _vat, _invoice_amount, _amount, _paid, _debt, _rate, _account_id, _route_id, _note, _created_employee_id);
	SELECT LAST_INSERT_ID() INTO _id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _actual_quantity);
		ELSE
			UPDATE lpg_in_stock SET in_stock=in_stock + _actual_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _amount);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
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
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLpgSale`(IN _code VARCHAR(20), IN _customer_id INT, IN _sale_date VARCHAR(20), IN _quantity FLOAT
	, IN _price DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT, in _lpg_import_id int, IN _created_employee_id INT, OUT _id INT)
BEGIN
	DECLARE _date_diff, _in_stock_id, _organization_id, _vendor_id INT DEFAULT 0;
	DECLARE _date DATE;
	
	SELECT STR_TO_DATE(_sale_date,'%d/%m/%Y') INTO _date;
	SELECT organization_id INTO _organization_id FROM employee WHERE id=_created_employee_id;
	select vendor_id into _vendor_id from lpg_import where id=_lpg_import_id;
	
	INSERT INTO lpg_sale (CODE, customer_id, sale_date, quantity, price, vat, rate, amount, paid, debt, account_id, route_id, note, lpg_import_id, created_employee_id)
	VALUES (_code, _customer_id, _date, _quantity, _price, _vat, _rate, _amount, _paid, _debt, _account_id, _route_id, _note, _lpg_import_id, _created_employee_id);
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
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _amount);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
		END IF;
	
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromotionMaterialImportDetail`(IN _promotion_material_import_id INT, IN _promotion_material_id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
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
	INSERT INTO shell_sale_detail(shell_sale_id, shell_id, quantity, price, amount) 
	VALUES (_shell_sale_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertShellImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellImport`(IN _code VARCHAR(20), IN _shell_id INT, IN _created_date VARCHAR(20), IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id Int, IN _note TEXT, in _created_employee_id int, in _vendor_id int, OUT _id INT)
BEGIN
	declare _shell_vendor_id, _organization_id int default 0;
	declare _date_diff, _in_stock_id int default 0;
	declare _date date;
	
	SELECT STR_TO_DATE(_created_date,'%d/%m/%Y') INTO _date;
	
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
	
		set _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
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

/* Procedure structure for procedure `insertShellVendorDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertShellVendorDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShellVendorDetail`(in _shell_id int, in _vendor_id int)
BEGIN
	INSERT INTO shell_vendor(shell_id, vendor_id) 
	VALUES (_shell_id, _vendor_id);
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
	INSERT INTO vehicle_in_detail(vehicle_in_id, shell_id, quantity, price, amount) 
	VALUES (_vehicle_in_id, _shell_id, _quantity, _price, _amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertVehicleInReturnShellDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertVehicleInReturnShellDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVehicleInReturnShellDetail`(IN _vehicle_in_id INT, IN _shell_id INT, IN _quantity INT)
BEGIN
	INSERT INTO vehicle_in_return_shell_detail(vehicle_in_id, shell_id, quantity) 
	VALUES (_vehicle_in_id, _shell_id, _quantity);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVendor`(in _name varchar(255), in _code varchar(20), in _organization_id int, in _status int
	, in _equal_organization_id int, in _has_stock int, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, out _id int)
BEGIN
	declare _vendor_organization_id int default 0;
	Insert Into vendor (`name`, `code`, organization_id, `status`, equal_organization_id, has_stock, is_gas, is_petro, is_good)
	values (_name, _code, _organization_id, _status, _equal_organization_id, _has_stock, _is_gas, _is_petro, _is_good);
	SELECT LAST_INSERT_ID() INTO _id;
	
	select id into _vendor_organization_id from vendor_organization where vendor_id=_id and organization_id=_organization_id;
	if _vendor_organization_id=0 then
		insert into vendor_organization(vendor_id, organization_id) values(_id, _organization_id);
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
	, out _account_opening_stock double, OUT _cash_opening_stock DOUBLE)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT mis.`day` INTO _pre_date FROM money_in_stock AS mis WHERE DATEDIFF(_from_date,mis.`day`)=1 LIMIT 1;
	
	SELECT mis.in_stock INTO _account_opening_stock
	FROM money_in_stock AS mis, account AS a
	WHERE DATE(mis.`day`)=_pre_date AND mis.account_id=a.id AND a.is_cash=0 AND _organization_ids LIKE CONCAT('%,',mis.organization_id,',%') LIMIT 1;
	
	SELECT mis.in_stock INTO _cash_opening_stock
	FROM money_in_stock AS mis, account as a
	WHERE DATE(mis.`day`)=_pre_date AND mis.account_id=a.id and a.is_cash=1 and _organization_ids LIKE CONCAT('%,',mis.organization_id,',%') LIMIT 1;
	
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
	-- chi
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM accessory_import AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
		UNION ALL
		SELECT o.advance_date as created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.amount,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
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
		SELECT o.import_date as created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
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
		UNION ALL
		SELECT o.created_date, 0 AS account_income_amount, IF(a.is_cash=0,o.paid,0) AS account_outcome_amount, IF(a.is_cash=0,o.note,'') AS account_note
			, 0 AS cash_income_amount, IF(a.is_cash=1,o.paid,0) AS cash_outcome_amount, IF(a.is_cash=1,o.note,'') AS cash_note
		FROM wholesale_debt AS o, account AS a
		WHERE DATE(o.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(o.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			AND o.account_id=a.id AND _organization_ids LIKE CONCAT('%,',a.organization_id,',%')
	) AS tbl
	GROUP BY tbl.created_date order by tbl.created_date;
END */$$
DELIMITER ;

/* Procedure structure for procedure `report_compare` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_compare` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_compare`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, in _customer_id int
	, OUT _shell_12_debt int, OUT _shell_45_debt int, out _amount_debt double)
BEGIN
	DECLARE _from_date, _pre_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 LIMIT 1;
	
	SELECT cis.shell_12, cis.shell_45, cis.amount into _shell_12_debt, _shell_45_debt, _amount_debt
	FROM customer_in_stock as cis WHERE DATE(cis.`day`)=_pre_date and cis.customer_id=_customer_id limit 1;
	
	SELECT ws.created_date, ws.total_pay, ws.paid, ws.note, ws.gas_return_amount
		, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_12t) AS shell_return_12t, SUM(tbl.shell_return_45) AS shell_return_45
		, sum(tbl.price_12/tbl.price_12_count) AS price_12, sum(tbl.price_45/tbl.price_45_count) AS price_45
	FROM gas_wholesale AS ws,
	(
	SELECT w.id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) as quantity_45
		, 0 as shell_return_12, 0 as shell_return_12t, 0 as shell_return_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.price,0)) AS price_12, SUM(IF(shell_12.id IS NOT NULL, 1,0)) AS price_12_count
		, SUM(IF(shell_45.id IS NOT NULL, wdet.price,0)) AS price_45, SUM(IF(shell_45.id IS NOT NULL, 1,0)) AS price_45_count
	FROM gas_wholesale AS w, employee AS eo, gas_wholesale_detail as wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and w.id=wdet.gas_wholesale_id and w.customer_id=_customer_id 
		and w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	UNION ALL
	SELECT w.id, 0 AS quantity_12, 0 AS quantity_45
		, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12
		, SUM(IF(shell_12t.id IS NOT NULL, wdet.quantity,0)) AS shell_return_12t
		, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS shell_return_45
		, 0 AS price_12, 0 AS price_45, 0 as price_12_count, 0 as price_45_count
	FROM gas_wholesale AS w, employee AS eo, gas_wholesale_return_shell AS wdet
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 and s.id in (select shell_id from organization_shell where _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12 ON wdet.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12 AND s.id not IN (SELECT shell_id FROM organization_shell WHERE _organization_ids LIKE CONCAT('%,',organization_id,',%'))) AS shell_12t ON wdet.shell_id=shell_12t.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON wdet.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND w.customer_id=_customer_id
		AND w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')	
	GROUP BY w.id
	) AS tbl
	WHERE DATE(ws.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(ws.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and tbl.id=ws.id
	group by ws.created_date
	ORDER BY ws.created_date;
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

/* Procedure structure for procedure `report_gas_commission` */

/*!50003 DROP PROCEDURE IF EXISTS  `report_gas_commission` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `report_gas_commission`(IN _start_date VARCHAR(20), IN _end_date VARCHAR(20), IN _organization_ids TEXT, IN _employee_id INT
	, in _accessory_kind_id int, IN _session_id VARCHAR(255), OUT _employee_ids TEXT, out _accessory_kind_ids text, out _commission_12 double
	, out _commission_45 double, out _commission_lovo double)
BEGIN
	DECLARE _from_date DATE;
	
	SELECT STR_TO_DATE(_start_date,'%d/%m/%Y') INTO _from_date;
	
	select coalesce(commission,0) into _commission_12 from shell_kind where weight=12;
	
	SELECT COALESCE(commission,0) INTO _commission_45 FROM shell_kind WHERE weight=45;
	
	SELECT CAST(`value` AS SIGNED INTEGER) INTO _commission_lovo FROM parameter WHERE `code`='lovo';
	
	IF _employee_id=0 THEN
		DELETE FROM temp_gas_commission WHERE session_id=_session_id;
	
		INSERT INTO temp_gas_commission(session_id, id, created_date, quantity_12, quantity_45, quantity_lovo, accessory_kind_id, quantity_accessory, commission_accessory, employee_ids, employee_count)
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, COALESCE(tbl.quantity_12,0) as quantity_12, COALESCE(tbl.quantity_45,0) as quantity_45
			, 0 as quantity_lovo, 0 as accessory_kind_id, 0 AS quantity_accessory, 0 as commission_accessory
			, GROUP_CONCAT(ve.employee_id) as employee_ids, COUNT(ve.id) as employee_count 
		FROM
		(
			SELECT w.vehicle_out_id
				, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12
				, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
			FROM gas_wholesale AS w, gas_wholesale_detail AS wdet, employee as eo, shell_vendor AS sv
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
			LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
			WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND w.id=wdet.gas_wholesale_id AND wdet.shell_id=sv.id
				and w.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY w.vehicle_out_id
		) AS tbl
		, vehicle_out_employee_detail as ve, vehicle_out as vo
		where tbl.vehicle_out_id=ve.vehicle_out_id and tbl.vehicle_out_id=vo.id
		group by tbl.vehicle_out_id
		UNION ALL
		SELECT _session_id, lv.id, lv.created_date, 0 as quantity_12, 0 as quantity_45, lv.quantity as quantity_lovo
			, 0 AS accessory_kind_id, 0 as quantity_accessory, 0 AS commission_accessory
			, GROUP_CONCAT(lve.employee_id) AS employee_ids, COUNT(lve.id) AS employee_count 
		FROM lo_vo AS lv, lo_vo_employee_detail as lve, employee as eo
		WHERE DATE(lv.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(lv.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
			and lv.id=lve.lo_vo_id and lv.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
		group by lv.id
		UNION ALL
		SELECT _session_id, tbl.vehicle_out_id, vo.created_date, 0 AS quantity_12, 0 AS quantity_45, 0 AS quantity_lovo
			, tbl.kind_id, tbl.quantity_accessory, tbl.commission as commission_accessory
			, GROUP_CONCAT(ve.employee_id) AS employee_ids, COUNT(ve.id) AS employee_count 
		FROM
		(
			SELECT v.vehicle_out_id, sum(vadet.quantity) as quantity_accessory, a.kind_id, ak.commission
			FROM vehicle_in AS v, vehicle_in_accessory_detail AS vadet, employee AS eo, accessory as a, accessory_kind as ak
			WHERE DATE(v.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(v.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
				AND v.id=vadet.vehicle_in_id and vadet.accessory_id=a.id and a.kind_id=ak.id
				AND v.created_employee_id=eo.id AND _organization_ids LIKE CONCAT('%,',eo.organization_id,',%')
			GROUP BY v.id, a.kind_id
		) AS tbl
		, vehicle_out_employee_detail AS ve, vehicle_out as vo
		WHERE tbl.vehicle_out_id=ve.vehicle_out_id and tbl.vehicle_out_id=vo.id
		GROUP BY tbl.vehicle_out_id, tbl.kind_id
		;
	
		SELECT COALESCE(group_concat(distinct employee_ids),'') INTO _employee_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT COALESCE(GROUP_CONCAT(DISTINCT accessory_kind_id),'') INTO _accessory_kind_ids FROM temp_gas_commission WHERE session_id=_session_id;
	
		SELECT created_date, 0 AS employee_id, SUM(quantity_12) AS quantity_12, SUM(quantity_45) AS quantity_45
			, SUM(quantity_lovo) AS quantity_lovo, 0 as accessory_kind_id, 0 AS quantity_accessory, 0 as commission_accessory, 0 AS amount
		FROM temp_gas_commission
		WHERE session_id=_session_id 
		GROUP BY created_date order by created_date;
	ELSE
		if _accessory_kind_id=0 then
			SELECT tbl.created_date, _employee_id as employee_id, 0 AS quantity_12, 0 AS quantity_45
				, 0 as quantity_lovo, 0 AS accessory_kind_id, 0 as quantity_accessory, 0 AS commission_accessory
				, SUM((t.quantity_12*_commission_12 + t.quantity_45*_commission_45 + t.quantity_lovo*_commission_lovo + t.quantity_accessory*t.commission_accessory)/t.employee_count) AS amount
			FROM (SELECT created_date, session_id FROM temp_gas_commission WHERE session_id=_session_id GROUP BY created_date) AS tbl
			LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date 
			and concat("0,",t.employee_ids,",0") LIKE CONCAT('%,',_employee_id,',%')
			group by tbl.created_date ORDER BY tbl.created_date
			;
		else
			SELECT tbl.created_date, 0 AS employee_id, 0 AS quantity_12, 0 AS quantity_45
				, 0 AS quantity_lovo, _accessory_kind_id AS accessory_kind_id, t.quantity_accessory, 0 as commission_accessory, 0 AS amount
			FROM (SELECT created_date, session_id FROM temp_gas_commission WHERE session_id=_session_id GROUP BY created_date) AS tbl
			LEFT JOIN temp_gas_commission AS t ON t.session_id=tbl.session_id AND t.created_date=tbl.created_date 
			AND t.accessory_kind_id=_accessory_kind_id
			GROUP BY tbl.created_date ORDER BY tbl.created_date
			;
		end if;
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
	SET _organization_ids = CONCAT(',',_organization_ids,',');
	select i.id as import_id, i.import_date, v.name as vendor_name, i.paper_quantity, i.actual_quantity, i.price, i.rate, i.amount, i.paid, i.note
		, 0 as sale_id, '' as sale_date, '' as customer_name, 0 as sale_quantity, 0 as sale_price, 0 as sale_amount, 0 as sale_paid, '' as sale_note
	from lpg_import as i , vendor as v, employee AS e
	where DATE(i.import_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(i.import_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		and i.vendor_id=v.id AND i.created_employee_id=e.id AND _organization_ids LIKE CONCAT('%,',e.organization_id,',%') and v.status=1
	union all
	SELECT s.lpg_import_id as import_id, '' as import_date, '' AS vendor_name, 0 as paper_quantity, 0 as actual_quantity, 0 as price, 0 as rate, 0 as amount, 0 as paid, '' as note
		, s.id AS sale_id, s.sale_date AS sale_date, c.NAME AS customer_name, s.quantity AS sale_quantity, s.price AS sale_price, s.amount AS sale_amount, s.paid AS sale_paid, s.note AS sale_note
	FROM lpg_sale AS s, customer AS c
	WHERE DATE(s.sale_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(s.sale_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND s.customer_id=c.id AND _organization_ids LIKE CONCAT('%,',c.organization_id,',%') AND c.STATUS=1
		and s.lpg_import_id<>0
	order by import_id, sale_id
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
	FROM gas_wholesale AS pdet, gas_return_vendor as v
	WHERE DATE(pdet.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(pdet.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
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
	
	select STR_TO_DATE(_start_date,'%d/%m/%Y') into _from_date;
	
	SELECT cis.`day` INTO _pre_date FROM customer_in_stock AS cis WHERE DATEDIFF(_from_date,cis.`day`)=1 limit 1;
	
	SELECT c.code as customer_code, c.NAME AS customer_name, SUM(tbl.quantity_12) AS quantity_12, SUM(tbl.quantity_45) AS quantity_45
		, SUM(tbl.shell_return_12) AS shell_return_12, SUM(tbl.shell_return_45) AS shell_return_45
		, SUM(tbl.total) AS amount, sum(tbl.debt) AS debt
		, tbl_debt.shell_12 as opening_debt_12, tbl_debt.shell_45 as opening_debt_45, tbl_debt.amount as opening_debt
	FROM customer as c 
	left join
	(
	SELECT w.customer_id, SUM(IF(shell_12.id IS NOT NULL, wdet.quantity,0)) AS quantity_12, SUM(IF(shell_45.id IS NOT NULL, wdet.quantity,0)) AS quantity_45
	, SUM(IF(return_shell_12.shell_id IS NOT NULL, return_shell_12.quantity,0)) AS shell_return_12
	, SUM(IF(return_shell_45.shell_id IS NOT NULL, return_shell_45.quantity,0)) AS shell_return_45
	, w.total, w.debt
	FROM gas_wholesale AS w, gas_wholesale_detail AS wdet
	left join shell_vendor AS sv on wdet.shell_id=sv.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=12) AS shell_12 ON sv.shell_id=shell_12.id
	LEFT JOIN (SELECT s.id FROM shell AS s, shell_kind AS sk WHERE s.kind_id=sk.id AND sk.weight=45) AS shell_45 ON sv.shell_id=shell_45.id
	LEFT JOIN gas_wholesale_return_shell AS return_shell_12 ON return_shell_12.gas_wholesale_id=wdet.gas_wholesale_id AND return_shell_12.shell_id=shell_12.id
	LEFT JOIN gas_wholesale_return_shell AS return_shell_45 ON return_shell_45.gas_wholesale_id=wdet.gas_wholesale_id AND return_shell_45.shell_id=shell_45.id
	WHERE DATE(w.created_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(w.created_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y')
		AND w.id=wdet.gas_wholesale_id AND _vendor_ids LIKE CONCAT('%,',sv.vendor_id,',%')
	group by w.id
	) AS tbl on c.id=tbl.customer_id
	left join
	(
	SELECT customer_id, shell_12, shell_45, amount FROM customer_in_stock WHERE DATE(`day`)=_pre_date 
	) as tbl_debt on tbl_debt.customer_id=c.id
	where  _organization_ids LIKE CONCAT('%,',c.organization_id,',%') and c.status=1
	GROUP BY c.id
	ORDER BY c.name;
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
	SELECT *
	FROM gas_price_list
	WHERE (DATE(from_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(from_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y'))
	or (DATE(to_date) >= STR_TO_DATE(_start_date,'%d/%m/%Y') AND DATE(to_date) <= STR_TO_DATE(_end_date,'%d/%m/%Y'))
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
	SELECT i.id, i.CODE, c.NAME AS customer_name, i.quantity, i.price, i.amount, i.note, coalesce(li.code,'') as lpg_import_code
	FROM lpg_sale AS i left join lpg_import as li on i.lpg_import_id=li.id, customer AS c, employee AS eo
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccessoryImport`(IN _id INT, IN _vendor_id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE accessory_import SET vendor_id=_vendor_id
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtVendor`(IN _id INT, IN _vendor_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE vendor_debt SET vendor_id=_vendor_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateDebtWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateDebtWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDebtWholesale`(IN _id INT, IN _customer_id INT, IN _created_date VARCHAR(20), IN _paid DOUBLE
	, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE wholesale_debt SET customer_id=_customer_id
		, created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, paid=_paid
		, account_id=_account_id
		, note=_note
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateEmployeeAdvance` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateEmployeeAdvance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeAdvance`(IN _id INT, IN _employee_id INT, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	declare _old_amount double;
	DECLARE _date DATE;
		
	SELECT s.advance_date, eo.organization_id, s.amount, s.account_id
	INTO _date, _organization_id, _old_amount, _old_account_id
	FROM employee_advance AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id
		FROM money_in_stock
		WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	update employee_advance set employee_id=_employee_id, amount=_amount, account_id=_account_id, note=_note where id=_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployeeOffMoney`(IN _id INT, IN _employee_id INT, IN _quantity int, IN _price DOUBLE
	, IN _amount DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
		
	SELECT s.created_date, eo.organization_id, s.amount, s.account_id
	INTO _date, _organization_id, _old_amount, _old_account_id
	FROM employee_off_money AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT id INTO _in_stock_id
		FROM money_in_stock
		WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_old_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE employee_off_money SET employee_id=_employee_id
		, quantity=_quantity
		, price=_price
		, amount=_amount
		, account_id=_account_id
		, note=_note
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
	
	set _f_date = STR_TO_DATE(_from_date,'%d/%m/%Y');
	SET _t_date = STR_TO_DATE(_to_date,'%d/%m/%Y');
	
	set _y = 12 * (year(_t_date) - year(_f_date));
	set _m = _y + month(_t_date) - month(_f_date);
	
	UPDATE expense SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, from_date=_f_date
		, to_date=_t_date
		, month_count=_m
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, content=_content
		, is_usually=_is_usually
		, `type`=_type
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateExportWholesale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateExportWholesale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateExportWholesale`(IN _id INT, IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE gas_export_wholesale SET customer_id=_customer_id
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
	UPDATE fraction_gas SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, note=_note
	WHERE id=_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasImport`(IN _id INT, IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE gas_import SET vendor_id=_vendor_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasImportDetail`(IN _id INT, IN _quantity INT, IN _price DOUBLE, IN _amount DOUBLE)
BEGIN
	UPDATE gas_import_detail SET quantity=_quantity, price=_price, amount=_amount WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateGasPrice` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateGasPrice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasPrice`(IN _id INT, IN _from_date VARCHAR(20), IN _to_date VARCHAR(20), IN _price DOUBLE, IN _kind int, IN _note TEXT)
BEGIN
	UPDATE gas_price_list SET from_date=STR_TO_DATE(_from_date,'%d/%m/%Y')
		, to_date=STR_TO_DATE(_to_date,'%d/%m/%Y')
		, price=_price	
		, kind=_kind
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGasWholesale`(IN _id INT, IN _customer_id INT, IN _vehicle_out_id INT, IN _total DOUBLE, IN _paid DOUBLE
	, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT, IN _gas_return INT, IN _gas_return_price DOUBLE
	, IN _gas_return_amount DOUBLE)
BEGIN
	UPDATE gas_wholesale SET customer_id=_customer_id
		, vehicle_out_id=_vehicle_out_id
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
	WHERE id=_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoodImport`(IN _id INT, IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE good_import SET vendor_id=_vendor_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIncome`(IN _id INT, IN _created_date VARCHAR(20), IN _amount DOUBLE, IN _account_id INT, IN _note TEXT
	, IN _content TEXT, in _type int)
BEGIN
	UPDATE income SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, content=_content
		, `type`=_type
	WHERE id=_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLpgImport`(IN _id INT, IN _vendor_id INT, IN _paper_quantity FLOAT
	, IN _actual_quantity FLOAT, IN _price DOUBLE, IN _vat DOUBLE, IN _invoice_amount DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _rate DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT)
BEGIN
	DECLARE _organization_id, _old_vendor_id, _date_diff, _in_stock_id, _old_quantity, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
		
	SELECT i.import_date, eo.organization_id, i.vendor_id, i.actual_quantity, i.amount, i.account_id
	INTO _date, _organization_id, _old_vendor_id, _old_quantity, _old_amount, _old_account_id
	FROM lpg_import AS i, employee AS eo
	WHERE i.id=_id AND i.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM lpg_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_old_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM lpg_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO lpg_in_stock(`day`, organization_id, vendor_id, in_stock) VALUES (_date, _organization_id, _vendor_id, _actual_quantity);
		ELSE
			UPDATE lpg_in_stock SET in_stock=in_stock + _actual_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- vendor_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM vendor_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_old_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE vendor_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM vendor_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND vendor_id=_vendor_id;
		IF _in_stock_id=0 THEN
			INSERT INTO vendor_in_stock(`day`, organization_id, vendor_id, amount) VALUES (_date, _organization_id, _vendor_id, _amount);
		ELSE
			UPDATE vendor_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM money_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id AND ss.account_id=_old_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock  + _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, -_amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock - _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE lpg_import SET vendor_id=_vendor_id
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

/* Procedure structure for procedure `updateLpgSale` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateLpgSale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLpgSale`(IN _id INT, IN _customer_id INT, IN _quantity FLOAT
	, IN _price DOUBLE, IN _vat DOUBLE, IN _rate DOUBLE, IN _amount DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _route_id INT, IN _note TEXT, IN _lpg_import_id INT)
BEGIN
	DECLARE _date_diff, _organization_id, _old_vendor_id, _in_stock_id, _old_quantity, _old_account_id, _old_customer_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
		
	SELECT s.sale_date, eo.organization_id, i.vendor_id, s.quantity, s.amount, s.account_id, s.customer_id
	INTO _date, _organization_id, _old_vendor_id, _old_quantity, _old_amount, _old_account_id, _old_customer_id
	FROM lpg_sale as s, lpg_import AS i, employee AS eo
	WHERE s.id=_id and s.lpg_import_id=i.id AND i.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- lpg_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM lpg_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.vendor_id=_old_vendor_id;
		IF _in_stock_id<>0 THEN
			UPDATE lpg_in_stock SET in_stock=in_stock + _old_quantity - _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- customer_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM customer_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.customer_id=_old_customer_id;
		IF _in_stock_id<>0 THEN
			UPDATE customer_in_stock SET amount=amount - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM customer_in_stock WHERE DATEDIFF(`day`,_date)=0 AND customer_id=_customer_id;
		IF _in_stock_id=0 THEN
			INSERT INTO customer_in_stock(`day`, customer_id, amount) VALUES (_date, _customer_id, _amount);
		ELSE
			UPDATE customer_in_stock SET amount=amount + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM money_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id AND ss.account_id=_old_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock  - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE lpg_sale SET customer_id=_customer_id
		, quantity=_quantity
		, price=_price
		, vat=_vat
		, rate=_rate
		, amount=_amount
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, route_id=_route_id
		, note=_note
		, lpg_import_id=_lpg_import_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOldShell` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOldShell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOldShell`(IN _id INT, IN _quantity INT, IN _shell_id int, IN _note TEXT)
BEGIN
	DECLARE _date_diff, _organization_id, _in_stock_id, _old_quantity, _old_shell_id INT DEFAULT 0;
	DECLARE _date DATE;
		
	SELECT s.created_date, eo.organization_id, s.quantity, s.shell_id
	INTO _date, _organization_id, _old_quantity, _old_shell_id
	FROM old_shell AS s, employee AS eo
	WHERE s.id=_id AND s.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT id INTO _in_stock_id
		FROM shell_in_stock
		WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_old_shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
	
	UPDATE old_shell SET quantity=_quantity, shell_id=_shell_id, note=_note WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePetroImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePetroImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePetroImport`(IN _id INT, IN _vendor_id INT, IN _store_id INT
	, IN _rate DOUBLE, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE petro_import SET vendor_id=_vendor_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePromotionMaterialImport`(IN _id INT, IN _vendor_id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE promotion_material_import SET vendor_id=_vendor_id
		, total=_total
		, paid=_paid
		, debt=_debt
		, account_id=_account_id
		, note=_note
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleAccessory`(IN _id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE accessory_sale SET total=_total
		, paid=_paid
		, debt=_debt
		, discount=_discount
		, total_pay=_total_pay
		, account_id=_account_id
		, note=_note
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleGood`(IN _id INT, IN _customer_id INT, IN _store_id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
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

/* Procedure structure for procedure `updateSalePetro` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateSalePetro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalePetro`(IN _id INT, in _customer_id int, in _store_id int, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSaleShell`(IN _id INT, IN _customer_id INT, IN _total DOUBLE, IN _paid DOUBLE, IN _debt DOUBLE
	, IN _discount DOUBLE, IN _total_pay DOUBLE, IN _account_id INT, IN _note TEXT)
BEGIN
	UPDATE shell_sale SET total=_total
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellImport`(IN _id INT, IN _shell_id INT, IN _quantity INT
	, IN _price DOUBLE, IN _amount DOUBLE, IN _account_id int, IN _note TEXT, in _vendor_id int)
BEGIN
	DECLARE _shell_vendor_id, _old_shell_vendor_quantity, _old_shell_id, _old_vendor_id INT DEFAULT 0;
	DECLARE _date_diff, _in_stock_id, _old_quantity, _organization_id, _old_account_id INT DEFAULT 0;
	DECLARE _old_amount DOUBLE;
	DECLARE _date DATE;
		
	SELECT i.shell_id, i.vendor_id, i.created_date, i.quantity, i.amount, i.account_id, eo.organization_id 
	INTO _old_shell_id, _old_vendor_id, _date, _old_quantity, _old_amount, _old_account_id, _organization_id
	FROM shell_import as i, employee as eo
	WHERE i.id=_id and i.created_employee_id=eo.id;
	
	SELECT DATEDIFF(SYSDATE(),_date) INTO _date_diff;
	WHILE _date_diff>0 DO
		SET _in_stock_id=0;
		-- shell_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM shell_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id= _organization_id AND ss.shell_id=_old_shell_id;
		IF _in_stock_id<>0 THEN
			UPDATE shell_in_stock SET in_stock=in_stock - _old_quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM shell_in_stock WHERE DATEDIFF(`day`,_date)=0 AND organization_id=_organization_id AND shell_id=_shell_id;
		IF _in_stock_id=0 THEN
			INSERT INTO shell_in_stock(`day`, organization_id, shell_id, in_stock) VALUES (_date, _organization_id, _shell_id, _quantity);
		ELSE
			UPDATE shell_in_stock SET in_stock=in_stock + _quantity WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		-- money_in_stock
		SELECT ss.id INTO _in_stock_id
		FROM money_in_stock AS ss
		WHERE DATEDIFF(ss.`day`,_date)=0 AND ss.organization_id=_organization_id AND ss.account_id=_old_account_id;
		IF _in_stock_id<>0 THEN
			UPDATE money_in_stock SET in_stock=in_stock  - _old_amount WHERE id=_in_stock_id;
		END IF;
	
		SET _in_stock_id=0;
		SELECT id INTO _in_stock_id FROM money_in_stock WHERE DATEDIFF(`day`,_date)=0  AND organization_id=_organization_id AND account_id=_account_id;
		IF _in_stock_id=0 THEN
			INSERT INTO money_in_stock(`day`, organization_id, account_id, in_stock) VALUES (_date, _organization_id, _account_id, _amount);
		ELSE
			UPDATE money_in_stock SET in_stock=in_stock + _amount WHERE id=_in_stock_id;
		END IF;
	
		SET _date_diff=_date_diff-1;
		SELECT DATE_ADD(_date, INTERVAL 1 DAY) INTO _date;
	END WHILE;
		
	SELECT id, quantity INTO _shell_vendor_id, _old_shell_vendor_quantity FROM shell_vendor WHERE shell_id=_old_shell_id AND vendor_id=_old_vendor_id;
	
	UPDATE shell_import SET shell_id=_shell_id
		, quantity=_quantity
		, price=_price
		, amount=_amount
		, account_id=_account_id
		, note=_note
		, vendor_id=_vendor_id
	WHERE id=_id;
	
	IF _shell_vendor_id<>0 THEN
		UPDATE shell_vendor SET quantity=quantity-_old_shell_vendor_quantity+_quantity, shell_id=_shell_id, vendor_id=_vendor_id 
		WHERE id=_shell_vendor_id;
	END IF;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShellReturn` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShellReturn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturn`(IN _id INT, IN _customer_id INT, IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE shell_return SET customer_id=_customer_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShellReturnSupplier`(IN _id INT, IN _vendor_id INT, IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE shell_return_supplier SET vendor_id=_vendor_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShieldDecrease`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, IN _vendor_id INT)
BEGIN
	UPDATE shield_decrease SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, note=_note
		, vendor_id=_vendor_id
	WHERE id=_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `updateShieldImport` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateShieldImport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShieldImport`(IN _id INT, IN _created_date VARCHAR(20), IN _quantity INT, IN _note TEXT, in _vendor_id int)
BEGIN
	UPDATE shield_import SET created_date=STR_TO_DATE(_created_date,'%d/%m/%Y')
		, quantity=_quantity
		, note=_note
		, vendor_id=_vendor_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleIn`(IN _id INT, IN _vehicle_out_id INT, IN _note TEXT)
BEGIN
	UPDATE vehicle_in SET vehicle_out_id=_vehicle_out_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVehicleOut`(IN _id INT, IN _vehicle_id INT, IN _note TEXT)
BEGIN
	UPDATE vehicle_out SET vehicle_id=_vehicle_id
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVendor`(IN _name VARCHAR(255), IN _code VARCHAR(20), IN _organization_id INT, IN _status INT
	, IN _equal_organization_id INT, in _has_stock int, IN _is_gas INT, IN _is_petro INT, IN _is_good INT, in _id INT)
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

/*Table structure for table `view_shell_kind` */

DROP TABLE IF EXISTS `view_shell_kind`;

/*!50001 DROP VIEW IF EXISTS `view_shell_kind` */;
/*!50001 DROP TABLE IF EXISTS `view_shell_kind` */;

/*!50001 CREATE TABLE  `view_shell_kind`(
 `shell_12` bigint(20) ,
 `shell_45` bigint(11) 
)*/;

/*View structure for view view_shell_kind */

/*!50001 DROP TABLE IF EXISTS `view_shell_kind` */;
/*!50001 DROP VIEW IF EXISTS `view_shell_kind` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_shell_kind` AS select `s`.`id` AS `shell_12`,0 AS `shell_45` from (`shell_kind` `sk` join `shell` `s`) where ((`sk`.`id` = `s`.`kind_id`) and (`sk`.`weight` = 12)) union select 0 AS `shell_12`,`s`.`id` AS `shell_45` from (`shell_kind` `sk` join `shell` `s`) where ((`sk`.`id` = `s`.`kind_id`) and (`sk`.`weight` = 45)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
