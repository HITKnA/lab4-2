# Host: 127.0.0.1  (Version: 5.7.9-log)
# Date: 2015-11-03 14:02:38
# Generator: MySQL-Front 5.3  (Build 4.243)

/*!40101 SET NAMES utf8 */;
USE app_kevinbookdb;
#
# Structure for table "auth_group"
#

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_group"
#


#
# Structure for table "auth_user"
#

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "auth_user"
#

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$uUF9ePdHJ27K$bXEsLNSygE6j9QeeS3rR7Jj50oelAsg0SAM796fJ9NE=','2015-10-27 15:06:08',1,'kevin','','','594912907@qq.com',1,1,'2015-10-27 15:04:31');

#
# Structure for table "auth_user_groups"
#

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_groups"
#


#
# Structure for table "booksdb_author"
#

DROP TABLE IF EXISTS `booksdb_author`;
CREATE TABLE `booksdb_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorID` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Country` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "booksdb_author"
#

INSERT INTO `booksdb_author` VALUES (1,'1','1',1,'1'),(2,'2','a2',2,'a2');

#
# Structure for table "booksdb_book"
#

DROP TABLE IF EXISTS `booksdb_book`;
CREATE TABLE `booksdb_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Publisher` varchar(30) NOT NULL,
  `PublishDate` date DEFAULT NULL,
  `ISBN` varchar(30) NOT NULL,
  `Price` double NOT NULL,
  `AuthorID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BooksDB_book_AuthorID_id_3abeb574_fk_BooksDB_author_id` (`AuthorID_id`),
  CONSTRAINT `BooksDB_book_AuthorID_id_3abeb574_fk_BooksDB_author_id` FOREIGN KEY (`AuthorID_id`) REFERENCES `booksdb_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "booksdb_book"
#

INSERT INTO `booksdb_book` VALUES (8,'b3','p3','2015-11-02','3',3,2);

#
# Structure for table "django_content_type"
#

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "django_content_type"
#

INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'BooksDB','author'),(8,'BooksDB','book');

#
# Structure for table "django_admin_log"
#

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "django_admin_log"
#

INSERT INTO `django_admin_log` VALUES (1,'2015-10-27 15:51:08','1','1',1,'',7,1),(2,'2015-10-27 15:51:37','1','b1',1,'',8,1),(3,'2015-10-29 09:14:42','2','b2',1,'',8,1),(4,'2015-10-29 09:19:16','2','a2',1,'',7,1),(5,'2015-11-02 01:13:30','3','b2',1,'',8,1),(6,'2015-11-02 01:14:09','4','b3',1,'',8,1),(7,'2015-11-02 12:24:19','5','b1',1,'',8,1),(8,'2015-11-02 12:28:36','5','b1',2,'No fields changed.',8,1),(9,'2015-11-02 12:43:18','6','b1',1,'',8,1),(10,'2015-11-02 12:43:46','7','b2',1,'',8,1),(11,'2015-11-02 12:44:08','8','b3',1,'',8,1),(12,'2015-11-02 12:52:38','2','a2',2,'No fields changed.',7,1),(13,'2015-11-02 12:54:09','2','a2',2,'Changed AuthorID.',7,1),(14,'2015-11-02 12:55:54','2','a2',2,'Changed AuthorID.',7,1),(15,'2015-11-02 12:56:06','1','1',2,'Changed AuthorID.',7,1),(16,'2015-11-02 12:59:31','2','a2',2,'Changed AuthorID.',7,1),(17,'2015-11-02 12:59:40','1','1',2,'Changed AuthorID.',7,1);

#
# Structure for table "auth_permission"
#

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "auth_permission"
#

INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book');

#
# Structure for table "auth_user_user_permissions"
#

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_user_permissions"
#


#
# Structure for table "auth_group_permissions"
#

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_group_permissions"
#


#
# Structure for table "django_migrations"
#

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-27 15:02:10'),(2,'auth','0001_initial','2015-10-27 15:02:22'),(3,'admin','0001_initial','2015-10-27 15:02:28'),(4,'contenttypes','0002_remove_content_type_name','2015-10-27 15:02:30'),(5,'auth','0002_alter_permission_name_max_length','2015-10-27 15:02:31'),(6,'auth','0003_alter_user_email_max_length','2015-10-27 15:02:32'),(7,'auth','0004_alter_user_username_opts','2015-10-27 15:02:32'),(8,'auth','0005_alter_user_last_login_null','2015-10-27 15:02:33'),(9,'auth','0006_require_contenttypes_0002','2015-10-27 15:02:33'),(10,'sessions','0001_initial','2015-10-27 15:02:34'),(11,'BooksDB','0001_initial','2015-10-27 15:50:12');

#
# Structure for table "django_session"
#

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "django_session"
#

INSERT INTO `django_session` VALUES ('xpqp0r7nsg6b92bzj8erahuzophpbv5z','ODQwOGViMmFkMDgyMDVlYTlmNTlhODU3MThlMDMzYzQxZmM1YmU0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImEzNWI0Y2Y4MWIxYjZmNWVhMjRhN2VhZTU5MTBiZTMxYjJjMTVlY2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-10 15:06:08');
