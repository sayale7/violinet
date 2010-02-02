# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: violinet1_development
# Generation Time: 2010-02-02 17:35:58 +0100
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_assign_value_names
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_assign_value_names`;

CREATE TABLE `admin_assign_value_names` (
  `id` int(11) NOT NULL auto_increment,
  `admin_assign_value_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table admin_assign_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_assign_values`;

CREATE TABLE `admin_assign_values` (
  `id` int(11) NOT NULL auto_increment,
  `assign_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assign_names
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assign_names`;

CREATE TABLE `assign_names` (
  `id` int(11) NOT NULL auto_increment,
  `assign_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assigns`;

CREATE TABLE `assigns` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `ancestor_id` int(11) default NULL,
  `assignable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `html_attribute` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table user_assign_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_assign_values`;

CREATE TABLE `user_assign_values` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `assign_id` int(11) default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
