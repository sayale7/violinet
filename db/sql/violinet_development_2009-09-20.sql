# Sequel Pro dump
# Version 663
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: violinet_development
# Generation Time: 2009-09-20 20:02:32 +0200
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `folders`;

CREATE TABLE `folders` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` (`id`,`user_id`,`parent_id`,`name`,`created_at`,`updated_at`)
VALUES
	(1,2,NULL,'Inbox','2009-09-08 15:42:52','2009-09-08 15:42:52'),
	(2,2,NULL,'Trash','2009-09-08 15:42:52','2009-09-08 15:42:52');

/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_copies`;

CREATE TABLE `message_copies` (
  `id` int(11) NOT NULL auto_increment,
  `recipient_id` int(11) default NULL,
  `message_id` int(11) default NULL,
  `folder_id` int(11) default NULL,
  `deleted` tinyint(1) default NULL,
  `read` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `message_copies` WRITE;
/*!40000 ALTER TABLE `message_copies` DISABLE KEYS */;
INSERT INTO `message_copies` (`id`,`recipient_id`,`message_id`,`folder_id`,`deleted`,`read`,`created_at`,`updated_at`)
VALUES
	(4,2,5,1,NULL,NULL,NULL,'2009-09-20 17:19:20');

/*!40000 ALTER TABLE `message_copies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `author_id` int(11) default NULL,
  `subject` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`,`author_id`,`subject`,`body`,`created_at`,`updated_at`)
VALUES
	(5,2,'tho','tho','2009-09-20 17:19:20','2009-09-20 17:19:20');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`,`title`,`body`,`user_id`,`created_at`,`updated_at`)
VALUES
	(10,'asdasd','asdasdasd',2,'2009-09-17 07:51:06','2009-09-17 07:51:06');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `profile_images` WRITE;
/*!40000 ALTER TABLE `profile_images` DISABLE KEYS */;
INSERT INTO `profile_images` (`id`,`parent_id`,`content_type`,`filename`,`thumbnail`,`size`,`width`,`height`,`user_id`)
VALUES
	(1,NULL,'image/jpeg','image042.jpg',NULL,14770,100,150,2),
	(2,1,'image/jpeg','image042_thumb.jpg','thumb',5521,47,70,2);

/*!40000 ALTER TABLE `profile_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recipients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipients`;

CREATE TABLE `recipients` (
  `id` int(11) NOT NULL auto_increment,
  `message_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `recipients` WRITE;
/*!40000 ALTER TABLE `recipients` DISABLE KEYS */;
INSERT INTO `recipients` (`id`,`message_id`,`user_id`,`created_at`,`updated_at`)
VALUES
	(4,5,2,'2009-09-20 17:19:20','2009-09-20 17:19:20');

/*!40000 ALTER TABLE `recipients` ENABLE KEYS */;
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
	('20090616155050'),
	('20090616155106'),
	('20090616155116'),
	('20090624203401'),
	('20090625133946'),
	('20090705221056'),
	('20090726133911'),
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
	('20090912113055'),
	('20090915192425'),
	('20090915192500');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`,`name`,`created_at`,`updated_at`)
VALUES
	(1,'violinen','2009-09-15 19:28:57','2009-09-15 19:28:57'),
	(2,'celli','2009-09-15 19:29:04','2009-09-15 19:29:04'),
	(3,'kontrabässe','2009-09-15 19:29:16','2009-09-15 19:29:16'),
	(4,'bratschen','2009-09-15 19:29:22','2009-09-15 19:29:22'),
	(5,NULL,'2009-09-16 21:41:05','2009-09-16 21:41:05');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags_posts`;

CREATE TABLE `tags_posts` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `post_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

LOCK TABLES `tags_posts` WRITE;
/*!40000 ALTER TABLE `tags_posts` DISABLE KEYS */;
INSERT INTO `tags_posts` (`id`,`tag_id`,`post_id`,`created_at`,`updated_at`)
VALUES
	(38,1,10,'2009-09-17 07:57:39','2009-09-17 07:57:39'),
	(39,2,10,'2009-09-17 08:41:17','2009-09-17 08:41:17');

/*!40000 ALTER TABLE `tags_posts` ENABLE KEYS */;
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
  `mail` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`login`,`email`,`crypted_password`,`password_salt`,`persistence_token`,`single_access_token`,`perishable_token`,`login_count`,`failed_login_count`,`last_request_at`,`current_login_at`,`last_login_at`,`current_login_ip`,`last_login_ip`,`created_at`,`updated_at`,`active`,`mail`)
VALUES
	(2,'thomas','thomas.kohler@gmx.at','d94879eaf9f1f46924c3514e7569e6ef151f6c82553a89330f5785a1e6d2dffc1950bc1ebe96e6493ea1e7d272a13b53f45ebe54caaea8824ed254ba3e35a95f','KU4aora21T5GI_-mJM7C','e1f88001d5696eca66659831ac299a217b4b45b0a7302a61f3f07a64a485ffba718938adcc2d1c18c4912cdb2a54812f54cfa131c4737c55e4efb46c6a19904c','se8aPkCPKR3nnvpH98Gs','_NjIDhLU4RAF2ZBjEYNW',62,0,'2009-09-20 17:19:30','2009-09-20 16:49:50','2009-09-18 15:38:53','127.0.0.1','127.0.0.1','2009-08-11 08:22:50','2009-09-20 17:19:30',1,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
