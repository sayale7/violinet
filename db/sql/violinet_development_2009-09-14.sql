# Sequel Pro dump
# Version 663
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: violinet_development
# Generation Time: 2009-09-14 23:36:43 +0200
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) default NULL,
  `body` text,
  `author` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;



# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `body` text,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`,`title`,`body`,`user_id`,`created_at`,`updated_at`)
VALUES
	(4,'neuer Post','Schau ma mal',2,'2009-09-10 13:55:19','2009-09-10 13:55:19');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profile_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_entries`;

CREATE TABLE `profile_entries` (
  `id` int(11) NOT NULL auto_increment,
  `body` text,
  `author` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `author_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;



# Dump of table profile_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_images`;

CREATE TABLE `profile_images` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `user_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `profile_images` WRITE;
/*!40000 ALTER TABLE `profile_images` DISABLE KEYS */;
INSERT INTO `profile_images` (`id`,`parent_id`,`content_type`,`filename`,`thumbnail`,`size`,`width`,`height`,`user_id`)
VALUES
	(15,NULL,'image/jpeg','image215.jpg',NULL,15820,100,150,2),
	(16,15,'image/jpeg','image215_thumb.jpg','thumb',5695,47,70,2);

/*!40000 ALTER TABLE `profile_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `authorizable_type` varchar(255) default NULL,
  `authorizable_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`,`name`,`authorizable_type`,`authorizable_id`,`created_at`,`updated_at`)
VALUES
	(2,'admin','',NULL,'2009-09-08 15:42:52','2009-09-08 16:14:48');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles_users`;

CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` (`id`,`user_id`,`role_id`,`created_at`,`updated_at`)
VALUES
	(2,2,2,'2009-09-08 15:43:02','2009-09-08 15:43:02');

/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`)
VALUES
	('20090624203401'),
	('20090625133946'),
	('20090811061407'),
	('20090811064621'),
	('20090814184632'),
	('20090817204828'),
	('20090824175000'),
	('20090824175243'),
	('20090903153849'),
	('20090908151950'),
	('20090908152521'),
	('20090908174422'),
	('20090908174634'),
	('20090912113055');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_commons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_commons`;

CREATE TABLE `user_commons` (
  `id` int(11) NOT NULL auto_increment,
  `gender` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `coordinates` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `administrative_area` varchar(255) default NULL,
  `district` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `zip` int(11) default NULL,
  `optional_address_attributes` varchar(255) default NULL,
  `www` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `user_commons` WRITE;
/*!40000 ALTER TABLE `user_commons` DISABLE KEYS */;
INSERT INTO `user_commons` (`id`,`gender`,`title`,`firstname`,`lastname`,`coordinates`,`street`,`city`,`administrative_area`,`district`,`state`,`zip`,`optional_address_attributes`,`www`,`phone`,`created_at`,`updated_at`,`user_id`)
VALUES
	(3,'Männlich','','Thomas','Kohler','','Ausstellunsstrasse 3','Wien','Wien','Leopoldsstadt','Österreich',1020,'','www.violination.com','10202020','2009-08-19 10:25:55','2009-09-14 21:31:40',2);

/*!40000 ALTER TABLE `user_commons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `persistence_token` varchar(255) NOT NULL,
  `single_access_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL default '0',
  `failed_login_count` int(11) NOT NULL default '0',
  `last_request_at` datetime default NULL,
  `current_login_at` datetime default NULL,
  `last_login_at` datetime default NULL,
  `current_login_ip` varchar(255) default NULL,
  `last_login_ip` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `active` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`login`,`email`,`crypted_password`,`password_salt`,`persistence_token`,`single_access_token`,`perishable_token`,`login_count`,`failed_login_count`,`last_request_at`,`current_login_at`,`last_login_at`,`current_login_ip`,`last_login_ip`,`created_at`,`updated_at`,`active`)
VALUES
	(2,'thomas','thomas.kohler@gmx.at','d94879eaf9f1f46924c3514e7569e6ef151f6c82553a89330f5785a1e6d2dffc1950bc1ebe96e6493ea1e7d272a13b53f45ebe54caaea8824ed254ba3e35a95f','KU4aora21T5GI_-mJM7C','e1f88001d5696eca66659831ac299a217b4b45b0a7302a61f3f07a64a485ffba718938adcc2d1c18c4912cdb2a54812f54cfa131c4737c55e4efb46c6a19904c','se8aPkCPKR3nnvpH98Gs','4ewIBb4njBDYRH8u5jyJ',53,0,'2009-09-14 21:36:07','2009-09-14 21:36:07','2009-09-14 21:35:37','127.0.0.1','127.0.0.1','2009-08-11 08:22:50','2009-09-14 21:36:07',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
