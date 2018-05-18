/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - gasoline
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
  `accessory_kind_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory` */

/*Table structure for table `accessory_kind` */

DROP TABLE IF EXISTS `accessory_kind`;

CREATE TABLE `accessory_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_kind` */

/*Table structure for table `accessory_sale` */

DROP TABLE IF EXISTS `accessory_sale`;

CREATE TABLE `accessory_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL COMMENT 'gia tien doi bep cu',
  `total` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `accessory_sale` */

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang hoat dong',
  `kind` int(1) DEFAULT '1' COMMENT '1:khach le, 2: khach si',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

/*Table structure for table `dynamic_field` */

DROP TABLE IF EXISTS `dynamic_field`;

CREATE TABLE `dynamic_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field` */

/*Table structure for table `dynamic_field_value` */

DROP TABLE IF EXISTS `dynamic_field_value`;

CREATE TABLE `dynamic_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dynamic_field_value` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: da bi khoa, 1: dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

/*Table structure for table `employee_advance` */

DROP TABLE IF EXISTS `employee_advance`;

CREATE TABLE `employee_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `advance_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_advance` */

/*Table structure for table `employee_salary` */

DROP TABLE IF EXISTS `employee_salary`;

CREATE TABLE `employee_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `real_salary` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary` */

/*Table structure for table `employee_salary_field_detail` */

DROP TABLE IF EXISTS `employee_salary_field_detail`;

CREATE TABLE `employee_salary_field_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_salary_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
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
  `timesheet_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee_salary_timesheet_detail` */

/*Table structure for table `expense` */

DROP TABLE IF EXISTS `expense`;

CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `payment_mode` int(1) DEFAULT '1' COMMENT '1: chuyen khoan, 2: tien mat',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_usually` int(1) DEFAULT '0' COMMENT '0: khong thuong xuyen, 1: thuong xuyen',
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `expense` */

/*Table structure for table `fraction_gas` */

DROP TABLE IF EXISTS `fraction_gas`;

CREATE TABLE `fraction_gas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `fraction_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fraction_gas` */

/*Table structure for table `gas_export_wholesale` */

DROP TABLE IF EXISTS `gas_export_wholesale`;

CREATE TABLE `gas_export_wholesale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale` */

/*Table structure for table `gas_export_wholesale_detail` */

DROP TABLE IF EXISTS `gas_export_wholesale_detail`;

CREATE TABLE `gas_export_wholesale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_export_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale_detail` */

/*Table structure for table `gas_export_wholesale_shell` */

DROP TABLE IF EXISTS `gas_export_wholesale_shell`;

CREATE TABLE `gas_export_wholesale_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_export_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_export_wholesale_shell` */

/*Table structure for table `gas_import` */

DROP TABLE IF EXISTS `gas_import`;

CREATE TABLE `gas_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `payment_mode` int(1) DEFAULT '1' COMMENT '1:tien mat, 2:chuyen khoan',
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import` */

/*Table structure for table `gas_import_detail` */

DROP TABLE IF EXISTS `gas_import_detail`;

CREATE TABLE `gas_import_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_import_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_import_detail` */

/*Table structure for table `gas_price_list` */

DROP TABLE IF EXISTS `gas_price_list`;

CREATE TABLE `gas_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_price_list` */

/*Table structure for table `gas_retail` */

DROP TABLE IF EXISTS `gas_retail`;

CREATE TABLE `gas_retail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `payment_mode` int(1) DEFAULT '1' COMMENT '1:tien mat, 2:chuyen khoan',
  `account_id` int(11) DEFAULT NULL,
  `return_shell_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_retail` */

/*Table structure for table `gas_return` */

DROP TABLE IF EXISTS `gas_return`;

CREATE TABLE `gas_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_return` */

/*Table structure for table `gas_shell_kind` */

DROP TABLE IF EXISTS `gas_shell_kind`;

CREATE TABLE `gas_shell_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1:dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_shell_kind` */

/*Table structure for table `gas_shell_return_to_supplier` */

DROP TABLE IF EXISTS `gas_shell_return_to_supplier`;

CREATE TABLE `gas_shell_return_to_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_shell_return_to_supplier` */

/*Table structure for table `gas_shell_sale` */

DROP TABLE IF EXISTS `gas_shell_sale`;

CREATE TABLE `gas_shell_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `payment_mode` int(1) DEFAULT '1' COMMENT '1:tien mat, 2:chuyen khoan',
  `account_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_shell_sale` */

/*Table structure for table `gas_shell_sale_detail` */

DROP TABLE IF EXISTS `gas_shell_sale_detail`;

CREATE TABLE `gas_shell_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_shell_sale_detail` */

/*Table structure for table `gas_wholesale` */

DROP TABLE IF EXISTS `gas_wholesale`;

CREATE TABLE `gas_wholesale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `payment_mode` int(1) DEFAULT NULL COMMENT '1:chuyen khoan, 2: tien mat',
  `account_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale` */

/*Table structure for table `gas_wholesale_detail` */

DROP TABLE IF EXISTS `gas_wholesale_detail`;

CREATE TABLE `gas_wholesale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_detail` */

/*Table structure for table `gas_wholesale_promotion` */

DROP TABLE IF EXISTS `gas_wholesale_promotion`;

CREATE TABLE `gas_wholesale_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `promotion_material_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_promotion` */

/*Table structure for table `gas_wholesale_return_shell` */

DROP TABLE IF EXISTS `gas_wholesale_return_shell`;

CREATE TABLE `gas_wholesale_return_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas_wholesale_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gas_wholesale_return_shell` */

/*Table structure for table `income` */

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `income` */

/*Table structure for table `lpg_import` */

DROP TABLE IF EXISTS `lpg_import`;

CREATE TABLE `lpg_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `import_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `paper_quantity` float DEFAULT NULL,
  `actual_quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `debt` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `payment_mode` int(1) DEFAULT '1' COMMENT '1: TM, 2: CK',
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lpg_import` */

/*Table structure for table `material_shell_return` */

DROP TABLE IF EXISTS `material_shell_return`;

CREATE TABLE `material_shell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `material_shell_return` */

/*Table structure for table `material_shell_sale` */

DROP TABLE IF EXISTS `material_shell_sale`;

CREATE TABLE `material_shell_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `material_shell_sale` */

/*Table structure for table `old_gas_shell` */

DROP TABLE IF EXISTS `old_gas_shell`;

CREATE TABLE `old_gas_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `current_quantity` int(3) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `new_quantity` int(3) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `old_gas_shell` */

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0:bi khoa, 1: dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization` */

/*Table structure for table `parameter` */

DROP TABLE IF EXISTS `parameter`;

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `parameter` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `users` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission` */

/*Table structure for table `permission_detail` */

DROP TABLE IF EXISTS `permission_detail`;

CREATE TABLE `permission_detail` (
  `id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `operation` int(2) DEFAULT NULL,
  `function` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permission_detail` */

/*Table structure for table `petro` */

DROP TABLE IF EXISTS `petro`;

CREATE TABLE `petro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `petro` */

/*Table structure for table `promotion_material` */

DROP TABLE IF EXISTS `promotion_material`;

CREATE TABLE `promotion_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `promotion_material` */

/*Table structure for table `retail_debt` */

DROP TABLE IF EXISTS `retail_debt`;

CREATE TABLE `retail_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `old_debt` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `new_debt` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `retail_debt` */

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `route` */

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell` */

/*Table structure for table `shell_import` */

DROP TABLE IF EXISTS `shell_import`;

CREATE TABLE `shell_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shell_import` */

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

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `store` */

/*Table structure for table `timesheet` */

DROP TABLE IF EXISTS `timesheet`;

CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `timesheet` */

/*Table structure for table `trip_fee` */

DROP TABLE IF EXISTS `trip_fee`;

CREATE TABLE `trip_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `fee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trip_fee` */

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unit` */

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vehicle` */

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0: dang khoa, 1: dang su dung',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor` */

/*Table structure for table `vendor_debt` */

DROP TABLE IF EXISTS `vendor_debt`;

CREATE TABLE `vendor_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `old_debt` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `new_debt` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vendor_debt` */

/*Table structure for table `verhicle_in` */

DROP TABLE IF EXISTS `verhicle_in`;

CREATE TABLE `verhicle_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_in` */

/*Table structure for table `verhicle_in_detail` */

DROP TABLE IF EXISTS `verhicle_in_detail`;

CREATE TABLE `verhicle_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verhicle_in_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_in_detail` */

/*Table structure for table `verhicle_in_shell` */

DROP TABLE IF EXISTS `verhicle_in_shell`;

CREATE TABLE `verhicle_in_shell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verhicle_in_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_in_shell` */

/*Table structure for table `verhicle_out` */

DROP TABLE IF EXISTS `verhicle_out`;

CREATE TABLE `verhicle_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_out` */

/*Table structure for table `verhicle_out_detail` */

DROP TABLE IF EXISTS `verhicle_out_detail`;

CREATE TABLE `verhicle_out_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verhicle_out_id` int(11) DEFAULT NULL,
  `shell_id` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_out_detail` */

/*Table structure for table `verhicle_out_employee` */

DROP TABLE IF EXISTS `verhicle_out_employee`;

CREATE TABLE `verhicle_out_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verhicle_out_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `verhicle_out_employee` */

/*Table structure for table `wholesale_debt` */

DROP TABLE IF EXISTS `wholesale_debt`;

CREATE TABLE `wholesale_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `old_debt` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `new_debt` double DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `wholesale_debt` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
