# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.0.51a-3ubuntu5.4)
# Database: violinet_production
# Generation Time: 2010-01-16 12:19:14 +0100
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`login`,`email`,`crypted_password`,`password_salt`,`persistence_token`,`single_access_token`,`perishable_token`,`mail`,`active`,`login_count`,`failed_login_count`,`last_request_at`,`current_login_at`,`last_login_at`,`current_login_ip`,`last_login_ip`,`created_at`,`updated_at`)
VALUES
	(4,'thomas','thomas.kohler@gmx.at','5ada373676e14a013f11faf501aca77fa5a28b3a8ab44261ae7e4b28e2f10b22c73f66f662a3e11aca924243ae86892f47484b50235c4cc27af2bd69411c051b','ATPH_QJ1utHBuIWtKxKG','b83b8f825a12e46c6d7ba3c7085b125d9728ad2d45350655f4ddee0c987b3e2e49f8b69a30d57ff472a270bceabb3a15ed2224688c65a98e59e089be359a8ee7','vVU2BPrPY8um_2MNmXK-','x7ZrCB-JhEE8p5sSf_SB',NULL,1,35,0,'2010-01-16 11:09:02','2010-01-16 11:03:26','2010-01-16 11:03:14','62.178.225.194','62.178.225.194','2010-01-14 15:02:08','2010-01-16 11:09:02'),
	(5,'geiger','geigenneubau@aon.at','9c8ad811b06399a7e804e85deb8431447ee00d851647c21363c6b7af59785ce16ecfd148ac3188c94c267404ef4b9605d1589a5a3d4b7a18c8888f7944eb8d55','8KmiuFSJrZJUSV_T28ec','9a929d3e4f474395d4f81b7ad4b39584480246f78b54f4a1cf77113be9e5161f846625bda35579dbda82f1fa29a41578f442969dcb0ed9ac256b040dd11fb1a2','9Kvcw-rUL5r50XW9i_9-','NbUoJOszux_7iSmcd3j8',NULL,1,2,0,'2010-01-15 14:21:48','2010-01-15 13:14:46','2010-01-15 08:05:25','80.123.50.134','80.123.48.245','2010-01-15 08:04:51','2010-01-15 14:21:48'),
	(6,'thomas1','thomas1.kohler@gmx.at','1a74dda4c4f9ae985cadea703b31e473c2f97370491d5dcf7fc2ca888d8df1057aaa13446490227dcc42cfb0b1749c471b87d6492a4f7457e032e4660e5b75e5','poc62FztN9TMuyV7_RBm','87ef9a147692e712c2ff81517d760028a71f3af5e63337529fcc124a1a85ca09617349f65dc43650980ce296524bdabd0a1727c9a97dd00b9d0373fbe30230ea','LAW6pE18Itx2wxjJl6J0','jToFxpTkTyOMl5kZS1oe',NULL,1,1,0,'2010-01-15 10:33:22','2010-01-15 10:25:32',NULL,'91.114.58.242',NULL,'2010-01-15 10:25:20','2010-01-15 10:33:22');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table folders
# ------------------------------------------------------------

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` (`id`,`user_id`,`parent_id`,`name`,`created_at`,`updated_at`)
VALUES
	(7,4,NULL,'Inbox','2010-01-14 15:02:08','2010-01-14 15:02:08'),
	(8,4,NULL,'Trash','2010-01-14 15:02:08','2010-01-14 15:02:08'),
	(9,5,NULL,'Inbox','2010-01-15 08:04:51','2010-01-15 08:04:51'),
	(10,5,NULL,'Trash','2010-01-15 08:04:51','2010-01-15 08:04:51'),
	(11,6,NULL,'Inbox','2010-01-15 10:25:20','2010-01-15 10:25:20'),
	(12,6,NULL,'Trash','2010-01-15 10:25:20','2010-01-15 10:25:20');

/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_commons
# ------------------------------------------------------------

LOCK TABLES `user_commons` WRITE;
/*!40000 ALTER TABLE `user_commons` DISABLE KEYS */;
INSERT INTO `user_commons` (`id`,`gender`,`title`,`firstname`,`lastname`,`coordinates`,`street`,`city`,`administrative_area`,`district`,`state`,`zip`,`optional_address_attributes`,`www`,`phone`,`created_at`,`updated_at`,`user_id`)
VALUES
	(5,'Männlich','','Thomas','Koher',NULL,'Ausstellungsstrasse','Wien','Wien','Leopoldsstadt','Österreich',1020,NULL,'','','2010-01-14 15:02:08','2010-01-14 15:13:21',4),
	(6,'Männlich','','Christian','Gann',NULL,'Haizingergasse 45','Wien','Wien','Währing','Österreich',1180,NULL,'violination.com/Violination','+43.1.4075941','2010-01-15 08:04:51','2010-01-15 08:07:12',5),
	(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-01-15 10:25:20','2010-01-15 10:25:20',6);

/*!40000 ALTER TABLE `user_commons` ENABLE KEYS */;
UNLOCK TABLES;








/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
