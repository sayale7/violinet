# Sequel Pro dump
# Version 663
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: das_jetzt_development
# Generation Time: 2009-11-19 16:17:07 +0100
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `content` text,
  `author_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`,`name`,`content`,`author_name`,`created_at`,`updated_at`,`user_id`)
VALUES
	(1,'erster','<div style=\"float: left; padding-top: 0.5em; padding-right: 0.5em;\"><a class=\"image\" title=\"Logo der New England Patriots\" href=\"http://de.wikipedia.org/wiki/Datei:New_England_Patriots_Logo.svg\"><img src=\"http://upload.wikimedia.org/wikipedia/de/thumb/1/1f/New_England_Patriots_Logo.svg/135px-New_England_Patriots_Logo.svg.png\" alt=\"Logo der New England Patriots\" width=\"135\" height=\"64\" /></a></div>\r\n<p>Die <strong><a title=\"New England Patriots\" href=\"http://de.wikipedia.org/wiki/New_England_Patriots\">New England Patriots</a></strong> (englisch f&uuml;r &bdquo;Neuengland-Patrioten&ldquo;), h&auml;ufig <strong>Pats</strong> genannt, sind eine American-Football-Mannschaft der amerikanischen Profiliga National Football League (NFL) aus Foxborough, Massachusetts. Sie geh&ouml;ren der <em>Eastern</em> <em>Division</em> gemeinsam mit den New York Jets, den Miami Dolphins und den Buffalo Bills innerhalb der American Football Conference (AFC) an. Von der Gr&uuml;ndung 1959 beziehungsweise der ersten Saison 1960 bis zum Umzug in das Foxboro Stadium 1970 hie&szlig;en sie <strong>Boston&nbsp;Patriots</strong>. Der Besitzer des Teams ist Robert Kraft, dem auch das Gillette Stadium, das aktuelle Stadion der Mannschaft und das Fu&szlig;ballteam New England Revolution geh&ouml;ren. In den Jahren 2001, 2003 und 2004 gewannen die New England Patriots den Super Bowl, das j&auml;hrliche Meisterschaftsfinale im American Football. Der Verein begeht heute sein 50-j&auml;hriges Jubil&auml;um.</p>\r\n<p>&nbsp;</p>\r\n<div style=\"float: left; padding-top: 0.5em; padding-right: 0.5em;\"><a class=\"image\" title=\"Logo der New England Patriots\" href=\"http://de.wikipedia.org/wiki/Datei:New_England_Patriots_Logo.svg\"><br /></a></div>','thomas','2009-11-19 12:04:39','2009-11-19 14:26:51',1),
	(2,'zweiter','<p>artikel</p>',NULL,'2009-11-19 12:05:00','2009-11-19 12:05:00',1);

/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assignments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignments`;

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` (`id`,`user_id`,`role_id`,`created_at`,`updated_at`)
VALUES
	(1,1,1,'2009-11-19 11:49:51','2009-11-19 11:49:51'),
	(2,1,2,'2009-11-19 11:49:51','2009-11-19 11:49:51'),
	(3,2,2,'2009-11-19 11:50:47','2009-11-19 11:50:47');

/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `article_id` int(11) default NULL,
  `author_name` varchar(255) default NULL,
  `site_url` varchar(255) default NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`,`article_id`,`author_name`,`site_url`,`content`,`created_at`,`updated_at`,`user_id`)
VALUES
	(1,1,'Thomas Koher','','mein commentar','2009-11-19 12:12:26','2009-11-19 12:12:26',NULL);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`,`name`,`created_at`,`updated_at`)
VALUES
	(1,'admin','2009-11-19 00:00:00','2009-11-19 00:00:00'),
	(2,'guest','2009-11-19 00:00:00','2009-11-19 00:00:00');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
	('20080719200447'),
	('20080719201435'),
	('20091116005037'),
	('20091116011510'),
	('20091116072645'),
	('20091116073210');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `persistence_token` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`email`,`persistence_token`,`crypted_password`,`password_salt`,`created_at`,`updated_at`)
VALUES
	(1,'thomas','thomas.kohler@gmx.at','2e4d984badccbabb768cf484e82a22399571e621b0b8bfc8cd220663d9b27e5a8dae9553d80ab3a4d08dedcc764fc3f5df8b99e1e99d5021f495005b939d834f','8ba5dc3061cf72008a720339db15229ec0e8bb1d57ecfe726ae2a76d845a25e07f3b76aab4f1d2304ee28b3b29effaf2d7de695f7f2caba696502c79c1748328','hHXPASefLUOuZP1uWbf4','2009-11-19 11:49:51','2009-11-19 12:41:51'),
	(2,'Gast','gast@gast.at','32884f6d2d1c591731f757a2a6ff20c429b3c85cedbe869c6db3655764b3b6c651253ca9a0579853e442f1afa6a925eab1cabc342729860ae22434f9b784b5a1','7b2923d1104550ea0f6a9e7764450514e2ad53899f0433cee547920d55f7a7627df8cce5d456ace2ddf5ff6a88ab133edb1e123db05031ac6b73be4ba2fd158a','gY5nmyt2ldfNzuiZbaQd','2009-11-19 11:50:47','2009-11-19 11:50:47');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
