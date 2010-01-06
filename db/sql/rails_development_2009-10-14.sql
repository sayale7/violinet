# Sequel Pro dump
# Version 663
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: rails_development
# Generation Time: 2009-10-14 22:39:13 +0200
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cleaning_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cleaning_items`;

CREATE TABLE `cleaning_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` text,
  `counter` int(11) default NULL,
  `intervall` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `active` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `cleaning_items` WRITE;
/*!40000 ALTER TABLE `cleaning_items` DISABLE KEYS */;
INSERT INTO `cleaning_items` (`id`,`title`,`description`,`counter`,`intervall`,`created_at`,`updated_at`,`active`)
VALUES
	(5,'erster reinigungseintrag','du trottel a sau bleda\r\n\r\nwieso mochstn des',19,19,'2009-10-13 18:51:15','2009-10-13 21:29:15',1),
	(6,'zweiter eintrag','das ist der zweite eintrag',16,16,'2009-10-13 20:54:18','2009-10-13 20:56:38',0),
	(7,'dritter eintrag','das ist der dritte eintrag',14,14,'2009-10-13 21:01:48','2009-10-14 18:25:06',0);

/*!40000 ALTER TABLE `cleaning_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table finished_cleans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `finished_cleans`;

CREATE TABLE `finished_cleans` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `cleaning_item_id` int(11) NOT NULL,
  `title` varchar(64) default NULL,
  `user_id` int(11) NOT NULL,
  `when_finished` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

LOCK TABLES `finished_cleans` WRITE;
/*!40000 ALTER TABLE `finished_cleans` DISABLE KEYS */;
INSERT INTO `finished_cleans` (`id`,`created_at`,`updated_at`,`cleaning_item_id`,`title`,`user_id`,`when_finished`)
VALUES
	(11,'2009-10-13 20:09:48','2009-10-13 20:09:48',5,'erster reinigungseintrag',10,'2009-10-13 20:09:46'),
	(12,'2009-10-13 20:22:37','2009-10-13 20:22:37',5,'erster reinigungseintrag',17,'2009-10-13 20:22:33'),
	(13,'2009-10-13 20:25:59','2009-10-13 20:25:59',5,'erster reinigungseintrag',6,'2009-10-13 20:25:50'),
	(14,'2009-10-13 20:28:54','2009-10-13 20:28:54',5,'erster reinigungseintrag',10,'2009-10-13 20:28:52'),
	(15,'2009-10-13 20:28:57','2009-10-13 20:28:57',5,'erster reinigungseintrag',10,'2009-10-13 20:28:54'),
	(16,'2009-10-13 20:34:57','2009-10-13 20:34:57',5,'erster reinigungseintrag',18,'2009-10-13 20:28:57'),
	(17,'2009-10-13 20:35:59','2009-10-13 20:35:59',5,'erster reinigungseintrag',10,'2009-10-13 20:35:47'),
	(18,'2009-10-13 20:36:02','2009-10-13 20:36:02',5,'erster reinigungseintrag',10,'2009-10-13 20:35:59'),
	(19,'2009-10-13 20:36:05','2009-10-13 20:36:05',5,'erster reinigungseintrag',6,'2009-10-13 20:36:02'),
	(20,'2009-10-13 20:37:17','2009-10-13 20:37:17',5,'erster reinigungseintrag',10,'2009-10-13 20:37:15'),
	(21,'2009-10-13 20:39:42','2009-10-13 20:39:42',5,'erster reinigungseintrag',10,'2009-10-13 20:39:40'),
	(22,'2009-10-13 20:43:09','2009-10-13 20:43:09',5,'erster reinigungseintrag',6,'2009-10-13 20:43:04'),
	(23,'2009-10-13 20:51:13','2009-10-13 20:51:13',5,'erster reinigungseintrag',10,'2009-10-13 20:51:05'),
	(24,'2009-10-13 20:51:24','2009-10-13 20:51:24',5,'erster reinigungseintrag',17,'2009-10-13 20:51:13'),
	(25,'2009-10-13 20:56:38','2009-10-13 20:56:38',6,'zweiter eintrag',6,'2009-10-13 20:56:31'),
	(26,'2009-10-13 21:02:35','2009-10-13 21:02:35',5,'erster reinigungseintrag',10,'2009-10-13 21:02:21'),
	(27,'2009-10-13 21:02:51','2009-10-13 21:02:51',7,'dritter eintrag',10,'2009-10-13 21:02:46'),
	(28,'2009-10-13 21:29:15','2009-10-13 21:29:15',5,'erster reinigungseintrag',10,'2009-10-13 21:28:57'),
	(29,'2009-10-14 18:25:06','2009-10-14 18:25:06',7,'dritter eintrag',10,'2009-10-14 18:25:03');

/*!40000 ALTER TABLE `finished_cleans` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` (`id`,`user_id`,`parent_id`,`name`,`created_at`,`updated_at`)
VALUES
	(8,6,NULL,'Inbox','2009-07-14 15:50:01','2009-07-14 15:50:01'),
	(9,6,NULL,'Trash','2009-07-14 15:50:01','2009-07-14 15:50:01'),
	(16,10,NULL,'Inbox','2009-07-17 14:37:40','2009-07-17 14:37:40'),
	(17,10,NULL,'Trash','2009-07-17 14:37:40','2009-07-17 14:37:40'),
	(30,17,NULL,'Inbox','2009-07-17 16:41:43','2009-07-17 16:41:43'),
	(31,17,NULL,'Trash','2009-07-17 16:41:43','2009-07-17 16:41:43'),
	(32,18,NULL,'Inbox','2009-07-23 18:54:24','2009-07-23 18:54:24'),
	(33,18,NULL,'Trash','2009-07-23 18:54:24','2009-07-23 18:54:24');

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
  `deleted` tinyint(1) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `read` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

LOCK TABLES `message_copies` WRITE;
/*!40000 ALTER TABLE `message_copies` DISABLE KEYS */;
INSERT INTO `message_copies` (`id`,`recipient_id`,`message_id`,`folder_id`,`deleted`,`created_at`,`updated_at`,`read`)
VALUES
	(115,10,92,17,1,NULL,'2009-10-11 19:33:30',1),
	(116,10,93,16,0,NULL,'2009-10-11 19:33:21',1),
	(117,10,94,17,1,NULL,'2009-10-11 19:33:28',1),
	(119,10,97,16,0,NULL,'2009-10-11 19:33:19',0),
	(120,10,98,16,0,NULL,'2009-10-11 19:55:06',1);

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
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`,`author_id`,`subject`,`body`,`created_at`,`updated_at`,`deleted`)
VALUES
	(92,10,'asdfasdf','asdfasdfasdf<br type=\"_moz\" />','2009-10-09 17:55:08','2009-10-09 17:56:10',1),
	(93,10,'ttt','asdfasdf<br />\r\n<br />\r\n<br />\r\nasdfasdfasdf<br />\r\n<br />\r\nasdf<br />\r\n<br />\r\nasdf<br />\r\n<br />\r\n<br />\r\nasdf<br />\r\nasdf<br type=\"_moz\" />','2009-10-09 17:56:25','2009-10-11 10:56:32',1),
	(94,10,'test mail an alle außer joe','tasfd<br />adsf<br /><br />asdf<br /><br />adsf<br type=\"_moz\" />','2009-10-09 17:58:29','2009-10-11 19:33:02',1),
	(95,10,'asdf','asdf','2009-10-09 19:44:49','2009-10-11 19:33:01',1),
	(96,10,'asdf','asdffa','2009-10-11 10:56:16','2009-10-11 10:56:16',0),
	(97,10,'asdfasa','asdf','2009-10-11 19:32:51','2009-10-11 19:32:51',0),
	(98,10,'ddd','d','2009-10-11 19:38:16','2009-10-11 19:38:16',0);

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  `order` tinyint(1) NOT NULL default '0',
  `activ` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`,`parent_id`,`name`,`content`,`created_at`,`updated_at`,`inactive`,`order`,`activ`)
VALUES
	(27,NULL,'erste Seite, asdfasd, asaaaaaaaaaffffffffffffffffffffffffffffffffaaaaa aaaa','asdf mein m&auml;uschen<br /><br />m&auml; m&Auml; m&ouml; m&Ouml; m&uuml; m&Uuml; m&szlig;sd<br type=\"_moz\" />','2009-07-21 20:14:08','2009-10-11 18:50:41',0,0,0),
	(28,30,'zweite seite','Pagination<br />Sphinx paginates search results by default. Indeed, there&rsquo;s no way to turn it off (but you can request really big pages should you wish). The parameters for pagination in Thinking Sphinx are exactly the same as Will Paginate: :page and :per_page.<br /><br />Article.search \'pancakes\', :page =&gt; params[:page], :per_page =&gt; 42<br />The output of search results can be used with Will Paginate&rsquo;s view helper as well, just to keep things nice and easy.<br /><br /># in the controller:<br />@articles = Article.search \'pancakes\'<br /><br /># in the view:<br />will_paginate @articles<br />Search Results Information<br />If you&rsquo;re building your own pagination output, then you can find out the statistics of your search using the following accessors:<br /><br />@articles = Aricle.search \'pancakes\'<br /># Number of matches in Sphinx<br />@articles.total_entries<br /># Number of pages available<br />@articles.total_pages<br /># Current page index<br />@articles.current_page<br /># Number of results per page<br />@articles.per_page','2009-07-21 20:14:23','2009-07-26 12:59:29',1,0,0),
	(29,31,'dritte seite','sdafasd<br type=\"_moz\" />','2009-07-21 20:14:36','2009-07-31 19:20:47',0,0,0),
	(30,29,'sss','s<br type=\"_moz\" />','2009-07-21 22:13:22','2009-07-31 19:13:39',0,0,0),
	(31,NULL,'sadfasdf','asdfasdf<br type=\"_moz\" />','2009-07-21 22:36:05','2009-07-31 19:24:40',0,0,0),
	(32,NULL,'asdf','<br />Joanna Hiffernan, selten auch Joanna Heffernan (* um 1843; &dagger; nach 1903), war eine katholische Irin, die in den Jahren 1861 bis 1868 mehrfach von James McNeill Whistler und von Gustave Courbet portr&auml;tiert wurde. Sie war zu dieser Zeit das bevorzugte Modell Whistlers und auch seine Geliebte. Die beka<br /><br />nntesten Gem&auml;lde, auf denen Joanna Hiffernan dargestellt ist, sind Symphonie in Wei&szlig; Nr. 1, M&auml;dchen in Wei&szlig;, Symphonie in Wei&szlig; Nr. 2, M&auml;dchen in Wei&szlig; und Symphonie in Wei&szlig; Nr. 3 von Whistler. Der US-amerikanische Maler bewunderte Hiffernan, vor allem ihr Aussehen und ihre roten Haare, die ihr den Beinamen fiery Jo (&bdquo;feurige Jo&ldquo;) einbrachten. Auch stand sie f&uuml;r Gustave Courbets erotisches Gem&auml;lde Le Sommeil und La Belle Irlandaise Modell. &Uuml;ber Hiffernans sp&auml;teres Leben ist nur wenig bekannt. mehr<br type=\"_moz\" />','2009-07-21 23:15:41','2009-07-24 15:22:47',0,0,0),
	(33,34,'asdfasdf','<div class=\"pages\"><p>zeile mit <a href=\"http://f/\">link</a><br /><br />liste</p><ul>    <li>erster punkt</li>    <li>zweiter punkt</li></ul><ol>    <li>SDFASDF</li></ol><ul>    <li>asdfasdfasdf</li>    <li>asdfasdfasdf</li>    <li>asdfasdfasd</li></ul><ol>    <li>asdfasdf</li>    <li>asdfasdf</li>    <li>asdfasdf</li>    <li>asdfasdf</li></ol></div>','2009-07-22 15:17:56','2009-07-31 19:13:38',0,0,0),
	(34,27,'Computer- und iTunes- Bedienung','dfsasdf<br type=\"_moz\" />','2009-10-09 16:43:22','2009-10-09 16:43:22',0,0,0);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`,`title`,`body`,`created_at`,`updated_at`)
VALUES
	(20,'yxcv','&nbsp;ycxv','2009-10-13 17:12:25','2009-10-13 17:12:25'),
	(21,'asdfasdfasdf','&nbsp;asdfasdf','2009-10-13 17:12:44','2009-10-13 17:12:44'),
	(22,'neruer eintrag für dicha','&nbsp;asdfasdf','2009-10-13 17:13:39','2009-10-13 17:13:39'),
	(23,'neuer eintrag für verena','&nbsp;asdfasdf','2009-10-13 17:14:32','2009-10-13 17:14:32'),
	(24,'neuer eintrag für verena','&nbsp;fasdfadsf','2009-10-13 17:15:02','2009-10-13 17:15:02'),
	(25,'sdfg','&nbsp;sdfgsdfg','2009-10-13 17:15:21','2009-10-13 17:15:21'),
	(26,'asdf','&nbsp;asdfasdf','2009-10-13 17:27:04','2009-10-13 17:27:04'),
	(27,'asdfasdf','&nbsp;asdfadsfasdfadf','2009-10-13 17:27:52','2009-10-13 17:27:52'),
	(28,'asdfa','asdfasdf<br type=\"_moz\" />','2009-10-13 17:28:32','2009-10-13 17:28:32'),
	(29,'asdfasdf','&nbsp;asdfasdf','2009-10-13 17:29:07','2009-10-13 17:29:07'),
	(30,'asdfasdf','&nbsp;','2009-10-13 17:43:12','2009-10-13 17:43:12'),
	(31,'asdfasdfaa','asdfasdf<br />asdfasdf<br /><br /><br />asdfasdf<br type=\"_moz\" />','2009-10-13 18:38:11','2009-10-13 18:38:11'),
	(32,'asdfasdf','&nbsp;asdfasdfadsf','2009-10-13 21:29:57','2009-10-13 21:29:57');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

LOCK TABLES `recipients` WRITE;
/*!40000 ALTER TABLE `recipients` DISABLE KEYS */;
INSERT INTO `recipients` (`id`,`message_id`,`user_id`,`created_at`,`updated_at`)
VALUES
	(25,21,10,'2009-07-17 16:01:35','2009-07-17 16:01:35'),
	(26,21,6,'2009-07-17 16:01:35','2009-07-17 16:01:35'),
	(27,22,16,'2009-07-17 16:04:26','2009-07-17 16:04:26'),
	(28,23,6,'2009-07-17 16:08:35','2009-07-17 16:08:35'),
	(29,24,6,'2009-07-17 16:41:58','2009-07-17 16:41:58'),
	(30,25,10,'2009-07-21 17:42:11','2009-07-21 17:42:11'),
	(31,26,10,'2009-07-21 17:43:20','2009-07-21 17:43:20'),
	(32,27,18,'2009-07-21 17:43:55','2009-07-21 17:43:55'),
	(33,28,10,'2009-07-21 19:07:39','2009-07-21 19:07:39'),
	(34,30,10,'2009-07-23 16:03:48','2009-07-23 16:03:48'),
	(35,32,6,'2009-07-23 18:53:51','2009-07-23 18:53:51'),
	(36,32,10,'2009-07-23 18:53:51','2009-07-23 18:53:51'),
	(37,32,17,'2009-07-23 18:53:51','2009-07-23 18:53:51'),
	(38,33,6,'2009-07-23 18:54:57','2009-07-23 18:54:57'),
	(39,33,10,'2009-07-23 18:54:57','2009-07-23 18:54:57'),
	(40,33,17,'2009-07-23 18:54:57','2009-07-23 18:54:57'),
	(41,34,6,'2009-07-23 18:55:06','2009-07-23 18:55:06'),
	(42,34,10,'2009-07-23 18:55:06','2009-07-23 18:55:06'),
	(43,34,17,'2009-07-23 18:55:06','2009-07-23 18:55:06'),
	(44,34,18,'2009-07-23 18:55:06','2009-07-23 18:55:06'),
	(45,35,6,'2009-07-23 18:55:25','2009-07-23 18:55:25'),
	(46,35,10,'2009-07-23 18:55:25','2009-07-23 18:55:25'),
	(47,35,17,'2009-07-23 18:55:25','2009-07-23 18:55:25'),
	(48,35,18,'2009-07-23 18:55:25','2009-07-23 18:55:25'),
	(49,38,10,'2009-07-23 18:56:42','2009-07-23 18:56:42'),
	(50,38,18,'2009-07-23 18:56:42','2009-07-23 18:56:42'),
	(51,39,6,'2009-07-23 19:13:11','2009-07-23 19:13:11'),
	(52,39,10,'2009-07-23 19:13:11','2009-07-23 19:13:11'),
	(53,39,17,'2009-07-23 19:13:11','2009-07-23 19:13:11'),
	(54,39,18,'2009-07-23 19:13:11','2009-07-23 19:13:11'),
	(55,40,17,'2009-07-23 19:30:15','2009-07-23 19:30:15'),
	(56,41,10,'2009-07-23 19:31:53','2009-07-23 19:31:53'),
	(57,42,6,'2009-07-23 19:32:02','2009-07-23 19:32:02'),
	(58,42,10,'2009-07-23 19:32:02','2009-07-23 19:32:02'),
	(59,42,17,'2009-07-23 19:32:02','2009-07-23 19:32:02'),
	(60,42,18,'2009-07-23 19:32:02','2009-07-23 19:32:02'),
	(61,43,6,'2009-07-23 19:32:17','2009-07-23 19:32:17'),
	(62,43,10,'2009-07-23 19:32:17','2009-07-23 19:32:17'),
	(63,43,17,'2009-07-23 19:32:17','2009-07-23 19:32:17'),
	(64,44,10,'2009-07-23 19:45:35','2009-07-23 19:45:35'),
	(65,45,10,'2009-07-23 19:46:07','2009-07-23 19:46:07'),
	(66,47,6,'2009-07-23 23:01:32','2009-07-23 23:01:32'),
	(67,47,10,'2009-07-23 23:01:32','2009-07-23 23:01:32'),
	(68,47,17,'2009-07-23 23:01:32','2009-07-23 23:01:32'),
	(69,47,18,'2009-07-23 23:01:32','2009-07-23 23:01:32'),
	(70,49,6,'2009-07-23 23:02:04','2009-07-23 23:02:04'),
	(71,49,10,'2009-07-23 23:02:04','2009-07-23 23:02:04'),
	(72,49,17,'2009-07-23 23:02:04','2009-07-23 23:02:04'),
	(73,49,18,'2009-07-23 23:02:04','2009-07-23 23:02:04'),
	(74,50,6,'2009-07-23 23:02:43','2009-07-23 23:02:43'),
	(75,50,10,'2009-07-23 23:02:43','2009-07-23 23:02:43'),
	(76,50,17,'2009-07-23 23:02:43','2009-07-23 23:02:43'),
	(77,50,18,'2009-07-23 23:02:43','2009-07-23 23:02:43'),
	(78,51,10,'2009-07-26 14:30:54','2009-07-26 14:30:54'),
	(79,52,10,'2009-07-26 14:47:29','2009-07-26 14:47:29'),
	(80,53,10,'2009-07-26 14:53:35','2009-07-26 14:53:35'),
	(81,54,10,'2009-07-26 15:07:25','2009-07-26 15:07:25'),
	(82,55,10,'2009-07-26 15:22:49','2009-07-26 15:22:49'),
	(83,56,10,'2009-07-26 15:25:10','2009-07-26 15:25:10'),
	(84,57,10,'2009-07-26 15:27:21','2009-07-26 15:27:21'),
	(85,58,10,'2009-07-26 15:27:49','2009-07-26 15:27:49'),
	(86,59,10,'2009-07-26 15:28:37','2009-07-26 15:28:37'),
	(87,60,10,'2009-07-26 16:14:30','2009-07-26 16:14:30'),
	(88,61,10,'2009-07-26 17:28:12','2009-07-26 17:28:12'),
	(89,62,10,'2009-07-26 17:29:40','2009-07-26 17:29:40'),
	(90,63,10,'2009-07-26 17:30:47','2009-07-26 17:30:47'),
	(91,64,10,'2009-07-26 17:32:26','2009-07-26 17:32:26'),
	(92,65,10,'2009-07-26 17:32:54','2009-07-26 17:32:54'),
	(93,66,10,'2009-07-26 17:33:16','2009-07-26 17:33:16'),
	(94,67,10,'2009-07-26 17:34:52','2009-07-26 17:34:52'),
	(95,68,10,'2009-07-26 17:35:28','2009-07-26 17:35:28'),
	(96,69,10,'2009-07-26 17:37:37','2009-07-26 17:37:37'),
	(97,70,10,'2009-07-26 17:38:05','2009-07-26 17:38:05'),
	(98,71,10,'2009-07-26 17:51:00','2009-07-26 17:51:00'),
	(99,72,10,'2009-07-26 17:55:01','2009-07-26 17:55:01'),
	(100,73,10,'2009-07-26 18:03:21','2009-07-26 18:03:21'),
	(101,74,10,'2009-07-26 18:14:43','2009-07-26 18:14:43'),
	(102,75,10,'2009-07-26 18:16:20','2009-07-26 18:16:20'),
	(103,76,10,'2009-07-26 18:34:29','2009-07-26 18:34:29'),
	(104,77,10,'2009-07-26 18:35:40','2009-07-26 18:35:40'),
	(105,78,10,'2009-07-26 18:37:08','2009-07-26 18:37:08'),
	(106,79,10,'2009-07-26 18:46:05','2009-07-26 18:46:05'),
	(107,80,10,'2009-07-27 08:15:31','2009-07-27 08:15:31'),
	(108,81,10,'2009-07-27 08:16:52','2009-07-27 08:16:52'),
	(109,82,10,'2009-07-27 10:20:46','2009-07-27 10:20:46'),
	(110,83,10,'2009-07-27 19:45:04','2009-07-27 19:45:04'),
	(111,84,10,'2009-08-01 20:52:57','2009-08-01 20:52:57'),
	(112,85,10,'2009-10-09 16:49:41','2009-10-09 16:49:41'),
	(113,86,10,'2009-10-09 17:22:54','2009-10-09 17:22:54'),
	(114,87,10,'2009-10-09 17:23:53','2009-10-09 17:23:53'),
	(115,88,10,'2009-10-09 17:25:23','2009-10-09 17:25:23'),
	(116,89,10,'2009-10-09 17:35:56','2009-10-09 17:35:56'),
	(117,90,10,'2009-10-09 17:37:07','2009-10-09 17:37:07'),
	(118,91,17,'2009-10-09 17:45:05','2009-10-09 17:45:05'),
	(119,92,10,'2009-10-09 17:55:08','2009-10-09 17:55:08'),
	(120,93,10,'2009-10-09 17:56:25','2009-10-09 17:56:25'),
	(121,94,10,'2009-10-09 17:58:29','2009-10-09 17:58:29'),
	(122,96,10,'2009-10-11 10:56:16','2009-10-11 10:56:16'),
	(123,97,10,'2009-10-11 19:32:51','2009-10-11 19:32:51'),
	(124,98,10,'2009-10-11 19:38:16','2009-10-11 19:38:16');

/*!40000 ALTER TABLE `recipients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  `authorizable_type` varchar(40) default NULL,
  `authorizable_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`,`name`,`authorizable_type`,`authorizable_id`,`created_at`,`updated_at`)
VALUES
	(1,'admin',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles_users`;

CREATE TABLE `roles_users` (
  `user_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` (`user_id`,`role_id`,`created_at`,`updated_at`)
VALUES
	(6,1,NULL,NULL),
	(10,1,NULL,NULL);

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
	('20090513231250'),
	('20090611111443'),
	('20090612153119'),
	('20090615163736'),
	('20090615164428'),
	('20090616155050'),
	('20090616155106'),
	('20090616155116'),
	('20090705221056'),
	('20090723232238'),
	('20090726133911'),
	('20091013181038'),
	('20091013190123'),
	('5'),
	('6');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `persistence_token` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `mail` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`email`,`crypted_password`,`password_salt`,`persistence_token`,`created_at`,`updated_at`,`mail`)
VALUES
	(6,'admin','admin@admin.com','64b6c35caf747fd827754d2adb7d66388179bc218e02e51bb3c8d44fe21339d61746552bd613206111dc8ab4288e52eb6327f41b7ffc2aa74859cdaaf5ced528','eb6AZ-NkPZohJ0afYTS8','57e203ce1962370fa7b6fd8347d7d2682598a2a91abdf45b4282479ee5f01ddf78ec691c73a0f8a6f865d2b6705c437fd08bbbccb7e52d7d0d1e7e678d894206','2009-07-14 15:50:01','2009-07-14 15:50:01',0),
	(10,'thomas','thomas.kohler@gmx.at','26eb3bae38ca7734d2142f0be5c583676dfe07fa4031c27a4cc734c4671918f0b2689c6b8ddb7c99b0216b4f3aa8b0f700f2d02f97442d075ad8dcacad61dc04','5F4ZoI_dw3Pf8c69RxzT','92ff90eefa830ee8b36a5f036fac9486065cb0aae87e5e644f7718cb0ec9797a555fd2aa570725db93856003671c2f8e08b8483aeee18609913c63ef9bb7368c','2009-07-17 14:37:40','2009-10-13 17:29:25',1),
	(17,'demo','demo@demo.com','6748f2807ddce0c3109cb3f4012879bdf130925c7278fed8ef497c06fe2e5e4d8cd04d4fbc46d83103a74c960474bd342902095b81761f6c4a1051087c11a2ec','Olb0YIoNHu9R_1L-kOHI','da8ba8bdb7fba8d6a0df6ddb10c3375803c8f49bbaf50582b2438890513717d0d2acf8b6d13c02cfe500e7781bbb4c404734aae009431021844573ecd5bbc581','2009-07-17 16:41:43','2009-10-10 18:15:00',1),
	(18,'joe','joe@joe.com','ebbef1fdab5cd204d29476df8d4cc41299106272e965ab605fb2ab2030ae80cca2719580173fbfb4e25045e8d9acb8704c24bbe5eef2fe2dd3a03314f2a38f40','VehIH0khT6Rnnj2NaS1p','47c4773504b8bf086325687bcc40b7d57c562f67914dc0e755396699e18039812cad0a1bd42552b4878aa1a1d669b24a23cb6b2ff5bb4604c702daa2887f55d9','2009-07-23 18:54:24','2009-07-23 18:54:24',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
