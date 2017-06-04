# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: grishamind
# Generation Time: 2017-06-04 06:13:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table applications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_application_references` (`reference`),
  UNIQUE KEY `unique_application_domains` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;

INSERT INTO `applications` (`id`, `name`, `reference`, `domain`, `enabled`)
VALUES
	(1,'Grisham Industries','grishamind','grishamind.local:8888',1);

/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table applications_domains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `applications_domains`;

CREATE TABLE `applications_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_application_aliases` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_addons_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_addons_extensions`;

CREATE TABLE `grishamind_addons_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_extensions` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_addons_extensions` WRITE;
/*!40000 ALTER TABLE `grishamind_addons_extensions` DISABLE KEYS */;

INSERT INTO `grishamind_addons_extensions` (`id`, `namespace`, `installed`, `enabled`)
VALUES
	(1,'anomaly.extension.default_authenticator',1,1),
	(2,'anomaly.extension.default_page_handler',1,1),
	(3,'anomaly.extension.local_storage_adapter',1,1),
	(4,'anomaly.extension.page_link_type',1,1),
	(5,'anomaly.extension.robots',1,1),
	(6,'anomaly.extension.sitemap',1,1),
	(7,'anomaly.extension.throttle_security_check',1,1),
	(8,'anomaly.extension.url_link_type',1,1),
	(9,'anomaly.extension.user_security_check',1,1),
	(10,'anomaly.extension.xml_feed_widget',1,1),
	(11,'anomaly.extension.standard_form',1,1);

/*!40000 ALTER TABLE `grishamind_addons_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_addons_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_addons_modules`;

CREATE TABLE `grishamind_addons_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_modules` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_addons_modules` WRITE;
/*!40000 ALTER TABLE `grishamind_addons_modules` DISABLE KEYS */;

INSERT INTO `grishamind_addons_modules` (`id`, `namespace`, `installed`, `enabled`)
VALUES
	(1,'anomaly.module.addons',1,1),
	(2,'anomaly.module.configuration',1,1),
	(3,'anomaly.module.dashboard',1,1),
	(4,'anomaly.module.files',1,1),
	(5,'anomaly.module.navigation',1,1),
	(6,'anomaly.module.pages',1,1),
	(7,'anomaly.module.posts',1,1),
	(8,'anomaly.module.preferences',1,1),
	(9,'anomaly.module.redirects',1,1),
	(10,'anomaly.module.repeaters',1,1),
	(11,'anomaly.module.settings',1,1),
	(12,'anomaly.module.users',1,1),
	(13,'anomaly.module.variables',1,1),
	(14,'anomaly.module.forms',1,1);

/*!40000 ALTER TABLE `grishamind_addons_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_configuration_configuration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_configuration_configuration`;

CREATE TABLE `grishamind_configuration_configuration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_configuration_configuration` WRITE;
/*!40000 ALTER TABLE `grishamind_configuration_configuration` DISABLE KEYS */;

INSERT INTO `grishamind_configuration_configuration` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `scope`, `key`, `value`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,NULL,NULL,'1','anomaly.extension.xml_feed_widget::url','http://www.pyrocms.com/posts/rss.xml');

/*!40000 ALTER TABLE `grishamind_configuration_configuration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_dashboard_dashboards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_dashboards`;

CREATE TABLE `grishamind_dashboard_dashboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `9e2c1f0b0af4a3796ef2922690d63a22` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_dashboard_dashboards` WRITE;
/*!40000 ALTER TABLE `grishamind_dashboard_dashboards` DISABLE KEYS */;

INSERT INTO `grishamind_dashboard_dashboards` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `slug`, `layout`)
VALUES
	(1,1,'2017-06-03 02:02:13',NULL,NULL,NULL,'welcome','24');

/*!40000 ALTER TABLE `grishamind_dashboard_dashboards` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_dashboard_dashboards_allowed_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_dashboards_allowed_roles`;

CREATE TABLE `grishamind_dashboard_dashboards_allowed_roles` (
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_dashboard_dashboards_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_dashboards_translations`;

CREATE TABLE `grishamind_dashboard_dashboards_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `dashboard_dashboards_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_dashboard_dashboards_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_dashboard_dashboards_translations` DISABLE KEYS */;

INSERT INTO `grishamind_dashboard_dashboards_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:13',NULL,'2017-06-03 02:02:13',NULL,'en','Welcome','This is the default dashboard for PyroCMS.');

/*!40000 ALTER TABLE `grishamind_dashboard_dashboards_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_dashboard_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_widgets`;

CREATE TABLE `grishamind_dashboard_widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column` int(11) NOT NULL DEFAULT '1',
  `dashboard_id` int(11) NOT NULL,
  `pinned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `grishamind_dashboard_widgets` DISABLE KEYS */;

INSERT INTO `grishamind_dashboard_widgets` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `extension`, `column`, `dashboard_id`, `pinned`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,NULL,NULL,'anomaly.extension.xml_feed_widget',1,1,0);

/*!40000 ALTER TABLE `grishamind_dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_dashboard_widgets_allowed_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_widgets_allowed_roles`;

CREATE TABLE `grishamind_dashboard_widgets_allowed_roles` (
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_dashboard_widgets_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_dashboard_widgets_translations`;

CREATE TABLE `grishamind_dashboard_widgets_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `dashboard_widgets_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_dashboard_widgets_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_dashboard_widgets_translations` DISABLE KEYS */;

INSERT INTO `grishamind_dashboard_widgets_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `title`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,'2017-06-03 02:02:14',NULL,'en','Recent News','Recent news from http://pyrocms.com/');

/*!40000 ALTER TABLE `grishamind_dashboard_widgets_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_failed_jobs`;

CREATE TABLE `grishamind_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_files_disks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_disks`;

CREATE TABLE `grishamind_files_disks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adapter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e45e39ecdef3a3c7a5535279b117d2a4` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_files_disks` WRITE;
/*!40000 ALTER TABLE `grishamind_files_disks` DISABLE KEYS */;

INSERT INTO `grishamind_files_disks` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`, `adapter`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,NULL,NULL,NULL,'local','anomaly.extension.local_storage_adapter');

/*!40000 ALTER TABLE `grishamind_files_disks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_files_disks_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_disks_translations`;

CREATE TABLE `grishamind_files_disks_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `files_disks_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_files_disks_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_files_disks_translations` DISABLE KEYS */;

INSERT INTO `grishamind_files_disks_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,'2017-06-03 02:02:14',NULL,'en','Local','A local (public) storage disk.');

/*!40000 ALTER TABLE `grishamind_files_disks_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_files_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_documents`;

CREATE TABLE `grishamind_files_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_files_documents_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_documents_translations`;

CREATE TABLE `grishamind_files_documents_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_documents_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_files_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_files`;

CREATE TABLE `grishamind_files_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disk_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_unicode_ci,
  `height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_files_files` WRITE;
/*!40000 ALTER TABLE `grishamind_files_files` DISABLE KEYS */;

INSERT INTO `grishamind_files_files` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `name`, `disk_id`, `folder_id`, `extension`, `size`, `mime_type`, `entry_id`, `entry_type`, `keywords`, `height`, `width`)
VALUES
	(1,1,'2017-06-04 04:52:15',1,'2017-06-04 04:52:15',1,NULL,'files-thumb-1-200.jpg',1,1,'jpg',10445,'image/jpeg',NULL,'Anomaly\\Streams\\Platform\\Model\\Files\\FilesImagesEntryModel',NULL,'144','200'),
	(2,2,'2017-06-04 05:09:00',1,'2017-06-04 05:09:01',1,NULL,'laracasts-rubies-shirt.jpg',1,1,'jpg',165954,'image/jpeg',NULL,'Anomaly\\Streams\\Platform\\Model\\Files\\FilesImagesEntryModel',NULL,'1082','1200'),
	(3,2,'2017-06-04 05:09:00',1,'2017-06-04 05:09:00',1,NULL,'t-shirt-design-ideas-15.jpg',1,1,'jpg',45096,'image/jpeg',NULL,'Anomaly\\Streams\\Platform\\Model\\Files\\FilesImagesEntryModel',NULL,'640','640'),
	(4,4,'2017-06-04 05:09:00',1,'2017-06-04 05:09:00',1,NULL,'laracasts-emblem-shirt.jpg',1,1,'jpg',111367,'image/jpeg',NULL,'Anomaly\\Streams\\Platform\\Model\\Files\\FilesImagesEntryModel',NULL,'1108','1200');

/*!40000 ALTER TABLE `grishamind_files_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_files_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_folders`;

CREATE TABLE `grishamind_files_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `disk_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_types` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eb1f1e9d6c256e3428a0c6606a721cc5` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_files_folders` WRITE;
/*!40000 ALTER TABLE `grishamind_files_folders` DISABLE KEYS */;

INSERT INTO `grishamind_files_folders` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `disk_id`, `slug`, `allowed_types`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,NULL,NULL,NULL,1,'images','a:3:{i:0;s:3:\"png\";i:1;s:4:\"jpeg\";i:2;s:3:\"jpg\";}'),
	(2,2,'2017-06-03 02:02:14',NULL,NULL,NULL,NULL,1,'documents','a:2:{i:0;s:3:\"pdf\";i:1;s:4:\"docx\";}');

/*!40000 ALTER TABLE `grishamind_files_folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_files_folders_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_folders_translations`;

CREATE TABLE `grishamind_files_folders_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `files_folders_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_files_folders_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_files_folders_translations` DISABLE KEYS */;

INSERT INTO `grishamind_files_folders_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:14',NULL,'2017-06-03 02:02:14',NULL,'en','Images','A folder for images.'),
	(2,2,'2017-06-03 02:02:15',NULL,'2017-06-03 02:02:15',NULL,'en','Documents','A folder for documents.');

/*!40000 ALTER TABLE `grishamind_files_folders_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_files_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_images`;

CREATE TABLE `grishamind_files_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_files_images_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_files_images_translations`;

CREATE TABLE `grishamind_files_images_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_images_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_forms_contact_us
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_contact_us`;

CREATE TABLE `grishamind_forms_contact_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_forms_contact_us_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_contact_us_translations`;

CREATE TABLE `grishamind_forms_contact_us_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_contact_us_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_forms_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_forms`;

CREATE TABLE `grishamind_forms_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `form_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `form_description` text COLLATE utf8_unicode_ci,
  `form_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `form_handler` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anomaly.extension.default_form_handler',
  `form_view_options` text COLLATE utf8_unicode_ci,
  `send_notification` tinyint(1) DEFAULT '0',
  `notification_id` int(11) DEFAULT NULL,
  `send_autoresponder` tinyint(1) DEFAULT '0',
  `user_email_field_id` int(11) DEFAULT NULL,
  `autoresponder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `51ad0f4e65589df135cdbfd63e6fd63e` (`form_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_forms_forms` WRITE;
/*!40000 ALTER TABLE `grishamind_forms_forms` DISABLE KEYS */;

INSERT INTO `grishamind_forms_forms` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `form_name`, `form_description`, `form_slug`, `form_handler`, `form_view_options`, `send_notification`, `notification_id`, `send_autoresponder`, `user_email_field_id`, `autoresponder_id`)
VALUES
	(1,1,'2017-06-04 05:57:52',1,NULL,NULL,NULL,'Contact Us',NULL,'contact_us','anomaly.extension.standard_form',NULL,1,1,0,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_forms_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_forms_forms_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_forms_translations`;

CREATE TABLE `grishamind_forms_forms_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `success_message` text COLLATE utf8_unicode_ci,
  `success_redirect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_send_to` text COLLATE utf8_unicode_ci,
  `notification_cc` text COLLATE utf8_unicode_ci,
  `notification_bcc` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `forms_forms_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_forms_forms_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_forms_forms_translations` DISABLE KEYS */;

INSERT INTO `grishamind_forms_forms_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `success_message`, `success_redirect`, `notification_send_to`, `notification_cc`, `notification_bcc`)
VALUES
	(1,1,'2017-06-04 05:57:52',NULL,'2017-06-04 05:57:52',1,'en','Thank you for contacting us! We will get back to you as soon as possible.',NULL,'a:1:{i:0;s:23:\"rthompson@terrostar.com\";}','a:0:{}','a:0:{}');

/*!40000 ALTER TABLE `grishamind_forms_forms_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_forms_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_notifications`;

CREATE TABLE `grishamind_forms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `notification_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_description` text COLLATE utf8_unicode_ci,
  `notification_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_email_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_from_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_reply_to_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_reply_to_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `include_attachments` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dfe8afabff68ca70db454cacdf05140e` (`notification_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_forms_notifications` WRITE;
/*!40000 ALTER TABLE `grishamind_forms_notifications` DISABLE KEYS */;

INSERT INTO `grishamind_forms_notifications` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `notification_name`, `notification_description`, `notification_slug`, `notification_email_layout`, `notification_from_email`, `notification_reply_to_name`, `notification_reply_to_email`, `include_attachments`)
VALUES
	(1,1,'2017-06-04 05:57:08',1,NULL,NULL,NULL,'General',NULL,'general',NULL,'noreply@grishamind.com','Grisham Industries','noreply@grishamind.com',0);

/*!40000 ALTER TABLE `grishamind_forms_notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_forms_notifications_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_forms_notifications_translations`;

CREATE TABLE `grishamind_forms_notifications_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_content` text COLLATE utf8_unicode_ci,
  `notification_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_notifications_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_forms_notifications_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_forms_notifications_translations` DISABLE KEYS */;

INSERT INTO `grishamind_forms_notifications_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `notification_content`, `notification_from_name`, `notification_subject`)
VALUES
	(1,1,'2017-06-04 05:57:08',NULL,'2017-06-04 05:57:08',1,'en','<h3>{{ form.form_name }}</h3>\r\n<p><a href=\"{{ url_previous() }}\">{{ url_previous() }}</a></p>\r\n<hr>\r\n<p><em>{{ form.form_description }}</em><br>{{ forms_input(input)|raw }}</p>','Grisham Industries','Contact Request from www.GrishamInd.com');

/*!40000 ALTER TABLE `grishamind_forms_notifications_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_grid_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_grid_content`;

CREATE TABLE `grishamind_grid_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_grid_content` WRITE;
/*!40000 ALTER TABLE `grishamind_grid_content` DISABLE KEYS */;

INSERT INTO `grishamind_grid_content` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `content`)
VALUES
	(1,1,'2017-06-04 04:48:40',1,'2017-06-04 04:55:48',1,'<p><img src=\"/files/images/files-thumb-1-200.jpg\" class=\"border tilt-left left\" style=\"float: left; margin: 0px 20px 20px 0px;\">Grisham Industries has been serving the Quad City area and beyond for&nbsp;over 20 years. Our machine and fabrication shop has the equipment and experience to fabricate, form and weld a wide variety of projects. New structures or just repairs of old. We readily work with mild steel, stainless steel, aluminum and cast iron. We are equipped to handle most industrial machining including:&nbsp;drilling, milling, boring, broaching and cutting of keyways. We specialize in reconditioning worn and damaged equipment and components for all types of industrial, agricultural and transport applications.</p>'),
	(2,2,'2017-06-04 04:55:48',1,NULL,NULL,'<hr>\r\n<p class=\"text-center\"><strong>13629 110th Ave</strong><br><strong>Davenport, IA 52804&nbsp;<br>(563) 381-3525</strong></p>'),
	(3,3,'2017-06-04 04:57:21',1,'2017-06-04 05:32:13',1,'<h2>Serving clients all over the Midwest since 1986</h2>\r\n<p>Grisham Industries,&nbsp;founded in 1986, has a reputation for providing customers with dependable products and prompt service. We service customers all over the Midwest including, but not limited to, Iowa, Illinois, Missouri, Wisconsin and Nebraska. Our machine and fabricating shops have the capabilities to serve a wide variety of industrial customers.</p>\r\n<p>In our shop, projects exceeding 75,000 pounds have been fabricated, yet we remain flexible enough to effectively and economically perform smaller jobs. Procedures such as cutting, forming, drilling and welding structural shapes and plate up to and including 3\" thick are routinely done in house. Forming equipment includes rolling, breaking, and shearing steel up to 1/4\" thick. We have the equipment and expertise necessary to weld not only mild steel, but cast iron, aluminum, and stainless steel as well.</p>\r\n<p>Our machine shop is equipped to accommodate most industrial machining. Our turning capacities encompass shafts up to 24 inches x 16 feet. We have drilling, milling, broaching, and boring capabilities including a radial arm drill with a 13 inch column and 5 foot reach. We have the equipment necessary to mill keyways and line bore to customer specifications and satisfaction. We specialize in reconditioning worn and damaged shafts.</p>\r\n<p>Both our fabricating and machining shops accommodate quick turnaround for emergency projects. We have the experience needed for building prototype and short run production projects. We excel at repair and steel fabrication.</p>\r\n<p>We are here to help you&nbsp;save time and money. In providing our services to the commercial and industrial community, we strive to accommodate emergency and quick turnaround projects and have established an extensive list of satisfied customers.</p>'),
	(4,4,'2017-06-04 05:31:58',1,'2017-06-04 05:34:48',1,'<h2>Millwright Services</h2>\r\n<h4>Full service millwright contracting with over 40 years of combined expertise.</h4>\r\n<p>• Move, install and repair machinery and equipment\r\n• Maintenance assistance\r\n• Emergency service when in need!</p>\r\n<p>As a full service millwright contractor, we maintain throughout the year, a crew of millwrights with the knowledge and experience to fulfill your needs. Our millwrights have&nbsp;over 40 years combined experience&nbsp;moving and installing equipment and general plant maintenance repairs.</p>\r\n<p>We have capabilities of moving equipment with our 14-ton boom truck. We also have knowledge and skills in&nbsp;pipe and tank fabrication&nbsp;and welding skills for your&nbsp;custom transitions. We are versed in all types of maintenance repairs, including&nbsp;mechanical changes or alignment problems.</p>\r\n<p>We have a crew experienced in all types of&nbsp;conveying equipment, including belt conveyors, screw conveyors, bucket elevators and drag chain conveyors. We also have&nbsp;bridge crane and jib crane&nbsp;repair and installation knowledge.</p>'),
	(5,5,'2017-06-04 05:35:38',1,'2017-06-04 05:36:47',1,'<h2>Machining</h2>\r\n<h4>Drilling, milling, boring, broaching, keyways, Grisham Industries</h4>\r\n<p>• Individual Component Machining\r\n• Build-up & Repairs\r\n• Emergency Machining\r\n• Milling / Drilling / Boring / Broaching / Keyways</p>\r\n<p>Grisham Industries is equipped to handle most industrial machining including:&nbsp;drilling, milling, boring, broaching and cutting of keyways. Our machine crew has&nbsp;over 70 years combined experience&nbsp;in machining.</p>\r\n<h4>Individual Component Machining</h4>\r\n<p>We can bring your innovative ideas to reality by building prototype and new design parts for short run production projects. We can also create replacement or new OEM parts for existing machinery.</p>\r\n<h4>Build-Up & Repairs</h4>\r\n<p>We specialize in reconditioning worn and damaged equipment and components for all types of industrial, agricultural and transport applications including propeller and rudder shafts.</p>\r\n<h4>Line Boring</h4>\r\n<p>Grisham Industries provides line boring both in house and on the job site.&nbsp;\r\nField Machining / Repair Capabilities:\r\n• Bucket Pivots\r\n• Articulated Steering Joints\r\n• Kingpin Supports\r\n• Truck Body Pivots\r\n• Linkages, Supports and Pivots\r\n• Weldments and Sleeves</p>'),
	(6,6,'2017-06-04 05:36:33',1,NULL,NULL,'<h2>Custom Fabrication</h2>\r\n<h4>We readily work with&nbsp;mild steel, stainless steel, aluminum and cast iron.</h4>\r\n<p>•&nbsp;Cut / Drill / Weld (Unlimited Thickness)\r\n• Roll / Form / Break / Shear (up to ¼\" thick)&nbsp;\r\n• Structural Steel\r\n• Conveyors\r\n• Miscellaneous & Ornamental Metals\r\n• Truck & Trailer Repair</p>\r\n<p>Our fabrication shop has the equipment and experience to fabricate, form and weld a variety of projects. We can fabricate new structures or repair existing ones. We readily work with&nbsp;mild steel, stainless steel, aluminum and cast iron.</p>\r\n<h4>Structural Steel</h4>\r\n<p>We can fabricate, repair and install catwalks and mezzanines in your facility. We can also do columns, supports, headers, lintels and small building additions.</p>\r\n<h4>Conveyors</h4>\r\n<p>We have a crew experienced in fabrication, repairs and installation of all types of conveying equipment, including belt conveyors, screw conveyors, bucket elevators and drag chain conveyors.</p>\r\n<h4>Miscellaneous & Ornamental Metals</h4>\r\n<p>We can fabricate and install custom projects such as railings, light fixtures, window security screens and even decorative metal wall coverings.</p>\r\n<h4>Truck & Trailer Repair</h4>\r\n<p>We strive to accommodate emergency projects such as floor replacements as well as frame, door, hinge and wall repair on trailers. We can also repair and make modifications to hitches.</p>'),
	(7,7,'2017-06-04 05:48:27',1,NULL,NULL,'<h2>McKay Plating</h2>\r\n<h4>Mend, Move,&nbsp;Repair</h4>\r\n<p>Grisham Industries was able to quickly and efficiently tear down one of our manual dip plating lines and install a new hoist.&nbsp; They were able to schedule the work around our production team and installed all equipment in a timely manner. &nbsp;This got us back up and running so we didn’t lose production due to having a plating line down.</p>\r\n<p>Grisham’s millwrights were friendly and fast.&nbsp; They came prepared for the job and our cost was surprisingly low for the work done.</p>\r\n<p>I would recommend Grisham’s to anyone needing quality, affordable millwrights.</p>'),
	(8,8,'2017-06-04 05:53:33',1,NULL,NULL,'<blockquote>\r\n                                <strong>13629 110th Avenue, Davenport, IA 52804</strong><br>\r\n                                <small>Phone: (563) 381-3525, Fax: (563) 381-3075</small>\r\n                            </blockquote>\r\n'),
	(9,9,'2017-06-04 06:04:03',1,'2017-06-04 06:11:28',1,'<blockquote>\r\n                                <strong>13629 110th Avenue, Davenport, IA 52804</strong><br>\r\n                                <small>Phone: (563) 381-3525, Fax: (563) 381-3075</small>\r\n                            </blockquote>');

/*!40000 ALTER TABLE `grishamind_grid_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_grid_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_grid_gallery`;

CREATE TABLE `grishamind_grid_gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_grid_gallery` WRITE;
/*!40000 ALTER TABLE `grishamind_grid_gallery` DISABLE KEYS */;

INSERT INTO `grishamind_grid_gallery` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`)
VALUES
	(1,1,'2017-06-04 05:09:08',1,'2017-06-04 05:22:32',1),
	(2,2,'2017-06-04 05:31:12',1,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_grid_gallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_grid_gallery_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_grid_gallery_images`;

CREATE TABLE `grishamind_grid_gallery_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-files` (`entry_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_grid_gallery_images` WRITE;
/*!40000 ALTER TABLE `grishamind_grid_gallery_images` DISABLE KEYS */;

INSERT INTO `grishamind_grid_gallery_images` (`id`, `entry_id`, `file_id`, `sort_order`)
VALUES
	(4,1,3,0),
	(5,1,4,1),
	(6,1,2,2),
	(7,2,3,0),
	(8,2,4,1),
	(9,2,2,2);

/*!40000 ALTER TABLE `grishamind_grid_gallery_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_grid_html
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_grid_html`;

CREATE TABLE `grishamind_grid_html` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_grid_html` WRITE;
/*!40000 ALTER TABLE `grishamind_grid_html` DISABLE KEYS */;

INSERT INTO `grishamind_grid_html` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `html`)
VALUES
	(1,1,'2017-06-04 05:53:33',1,NULL,NULL,'                    <section id=\"default\" class=\"page-chunk default\">\r\n                        <div class=\"page-chunk-pad\">\r\n                            <div class=\"gmap-wrapper\">\r\n                                <script type=\'text/javascript\'\r\n                                        src=\'http://maps.google.com/maps/api/js?sensor=false\'></script>\r\n                                <script type=\'text/javascript\'>\r\n                                    (function ($) {\r\n                                        $(document).ready(function () {\r\n                                            $(\'div#gmap_canvas\').each(function () {\r\n\r\n                                                var canvas = $(this);\r\n                                                canvas.css(\'width\', \"100%\");\r\n                                                canvas.css(\'height\', \"400px\");\r\n\r\n                                                var geocoder = new google.maps.Geocoder();\r\n                                                geocoder.geocode(\r\n                                                        {\r\n                                                            address: canvas.attr(\'data-address\')\r\n                                                        }, function (results, status) {\r\n                                                            if (status == google.maps.GeocoderStatus.OK) {\r\n                                                                var latlng = results[0].geometry.location;\r\n                                                                var map = new google.maps.Map(canvas.get(0),\r\n                                                                        {\r\n                                                                            zoom: 15,\r\n                                                                            center: latlng,\r\n                                                                            mapTypeId: google.maps.MapTypeId.ROADMAP,\r\n                                                                            mapTypeControl: true,\r\n                                                                            mapTypeControlOptions: {\r\n                                                                                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU\r\n                                                                            },\r\n                                                                            navigationControl: true,\r\n                                                                            navigationControlOptions: {\r\n                                                                                style: google.maps.NavigationControlStyle.SMALL\r\n                                                                            },\r\n                                                                            streetViewControl: true\r\n                                                                        });\r\n\r\n                                                                var marker = new google.maps.Marker(\r\n                                                                        {\r\n                                                                            map: map,\r\n                                                                            position: latlng\r\n                                                                        });\r\n\r\n                                                            }\r\n                                                        });\r\n                                            });\r\n                                        });\r\n                                    })(jQuery);\r\n                                </script>\r\n\r\n                                <div id=\'gmap_canvas\' data-address=\"13609 110th Avenue, Davenport, IA 52804\"></div>\r\n                            </div>\r\n\r\n                            <br>\r\n\r\n                            <a href=\"https://maps.google.com/maps?q=13629+110th+Avenue+Davenport,+IA+52804&amp;hl=en&amp;safe=off&amp;hnear=13609+110th+Ave,+Davenport,+Scott,+Iowa+52804&amp;gl=us&amp;t=m&amp;z=16\"\r\n                               target=\"_blank\">Get Directions</a>\r\n\r\n                        </div>\r\n                </div>\r\n        </section>\r\n'),
	(2,2,'2017-06-04 06:04:03',1,'2017-06-04 06:11:28',1,'                    <section id=\"default\" class=\"page-chunk default\">\r\n                        <div class=\"page-chunk-pad\">\r\n                            <div class=\"gmap-wrapper\">\r\n                                <script type=\'text/javascript\'\r\n                                        src=\'http://maps.google.com/maps/api/js?sensor=true\'></script>\r\n                                <script type=\'text/javascript\'>\r\n                                    (function ($) {\r\n                                        $(document).ready(function () {\r\n                                            $(\'div#gmap_canvas\').each(function () {\r\n\r\n                                                var canvas = $(this);\r\n                                                canvas.css(\'width\', \"100%\");\r\n                                                canvas.css(\'height\', \"400px\");\r\n\r\n                                                var geocoder = new google.maps.Geocoder();\r\n                                                geocoder.geocode(\r\n                                                        {\r\n                                                            address: canvas.attr(\'data-address\')\r\n                                                        }, function (results, status) {\r\n                                                            if (status == google.maps.GeocoderStatus.OK) {\r\n                                                                var latlng = results[0].geometry.location;\r\n                                                                var map = new google.maps.Map(canvas.get(0),\r\n                                                                        {\r\n                                                                            zoom: 15,\r\n                                                                            center: latlng,\r\n                                                                            mapTypeId: google.maps.MapTypeId.ROADMAP,\r\n                                                                            mapTypeControl: true,\r\n                                                                            mapTypeControlOptions: {\r\n                                                                                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU\r\n                                                                            },\r\n                                                                            navigationControl: true,\r\n                                                                            navigationControlOptions: {\r\n                                                                                style: google.maps.NavigationControlStyle.SMALL\r\n                                                                            },\r\n                                                                            streetViewControl: true\r\n                                                                        });\r\n\r\n                                                                var marker = new google.maps.Marker(\r\n                                                                        {\r\n                                                                            map: map,\r\n                                                                            position: latlng\r\n                                                                        });\r\n\r\n                                                            }\r\n                                                        });\r\n                                            });\r\n                                        });\r\n                                    })(jQuery);\r\n                                </script>\r\n\r\n                                <div id=\'gmap_canvas\' data-address=\"13609 110th Avenue, Davenport, IA 52804\"></div>\r\n                            </div>\r\n\r\n                            <br>\r\n\r\n                            <a href=\"https://maps.google.com/maps?q=13629+110th+Avenue+Davenport,+IA+52804&amp;hl=en&amp;safe=off&amp;hnear=13609+110th+Ave,+Davenport,+Scott,+Iowa+52804&amp;gl=us&amp;t=m&amp;z=16\"\r\n                               target=\"_blank\">Get Directions</a>\r\n\r\n                        </div>\r\n                </div>\r\n        </section>\r\n');

/*!40000 ALTER TABLE `grishamind_grid_html` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_jobs`;

CREATE TABLE `grishamind_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_migrations`;

CREATE TABLE `grishamind_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_migrations` WRITE;
/*!40000 ALTER TABLE `grishamind_migrations` DISABLE KEYS */;

INSERT INTO `grishamind_migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2015_03_15_171506_create_jobs_table',1),
	(2,'2015_03_15_171507_create_failed_jobs_table',1),
	(3,'2015_03_15_171508_create_sessions_table',1),
	(4,'2015_03_15_171620_create_streams_tables',1),
	(5,'2015_03_15_171646_create_fields_tables',1),
	(6,'2015_03_15_171720_create_assignments_tables',1),
	(7,'2015_03_15_171838_create_modules_table',1),
	(8,'2015_03_15_171926_create_extensions_table',1),
	(9,'2016_08_30_185635_create_notifications_table',1),
	(10,'2016_09_02_164448_add_searchable_column_to_streams',1),
	(11,'2016_11_11_154228_append_id_to_user_meta_columns',1),
	(12,'2015_03_25_091755_anomaly.module.configuration__create_configuration_fields',2),
	(13,'2015_03_25_091845_anomaly.module.configuration__create_configuration_stream',2),
	(14,'2015_11_01_164326_anomaly.module.dashboard__create_dashboard_fields',3),
	(15,'2015_11_01_170645_anomaly.module.dashboard__create_dashboards_stream',3),
	(16,'2015_11_01_170650_anomaly.module.dashboard__create_widgets_stream',3),
	(17,'2015_03_05_021725_anomaly.module.files__create_files_fields',4),
	(18,'2015_03_05_022227_anomaly.module.files__create_disks_stream',4),
	(19,'2015_06_09_031343_anomaly.module.files__create_folders_stream',4),
	(20,'2015_06_09_031351_anomaly.module.files__create_files_stream',4),
	(21,'2016_08_29_151020_anomaly.module.files__remove_required_from_entry_assignment',4),
	(22,'2016_09_02_175659_anomaly.module.files__make_files_searchable',4),
	(23,'2016_10_05_221741_anomaly.module.files__make_disks_sortable',4),
	(24,'2015_05_21_061832_anomaly.module.navigation__create_navigation_fields',5),
	(25,'2015_05_21_062115_anomaly.module.navigation__create_menus_stream',5),
	(26,'2015_05_21_064952_anomaly.module.navigation__create_links_stream',5),
	(27,'2015_03_20_171947_anomaly.module.pages__create_pages_fields',6),
	(28,'2015_03_20_171955_anomaly.module.pages__create_pages_stream',6),
	(29,'2015_04_22_150211_anomaly.module.pages__create_types_stream',6),
	(30,'2016_09_02_175135_anomaly.module.pages__make_pages_searchable',6),
	(31,'2015_03_20_184103_anomaly.module.posts__create_posts_fields',7),
	(32,'2015_03_20_184141_anomaly.module.posts__create_categories_stream',7),
	(33,'2015_03_20_184148_anomaly.module.posts__create_posts_stream',7),
	(34,'2015_05_16_050818_anomaly.module.posts__create_types_stream',7),
	(35,'2016_09_02_175531_anomaly.module.posts__make_posts_searchable',7),
	(36,'2015_02_27_101227_anomaly.module.preferences__create_preferences_fields',8),
	(37,'2015_02_27_101300_anomaly.module.preferences__create_preferences_streams',8),
	(38,'2016_11_16_151654_anomaly.module.preferences__update_user_related_config',8),
	(39,'2015_03_21_153325_anomaly.module.redirects__create_redirects_fields',9),
	(40,'2015_03_21_153326_anomaly.module.redirects__create_redirects_stream',9),
	(41,'2015_02_27_101410_anomaly.module.settings__create_settings_fields',10),
	(42,'2015_02_27_101510_anomaly.module.settings__create_settings_stream',10),
	(43,'2015_02_27_101816_anomaly.module.users__create_users_fields',11),
	(44,'2015_02_27_101851_anomaly.module.users__create_users_stream',11),
	(45,'2015_02_27_101940_anomaly.module.users__create_roles_stream',11),
	(46,'2016_09_02_175848_anomaly.module.users__make_users_searchable',11),
	(47,'2015_06_02_170526_anomaly.extension.page_link_type__create_page_link_type_fields',12),
	(48,'2015_06_02_170542_anomaly.extension.page_link_type__create_page_links_stream',12),
	(49,'2015_05_24_201105_anomaly.extension.url_link_type__create_url_link_type_fields',13),
	(50,'2015_05_24_201134_anomaly.extension.url_link_type__create_links_stream',13),
	(51,'2015_09_21_200616_anomaly.module.forms__create_forms_fields',14),
	(52,'2015_09_21_201644_anomaly.module.forms__create_forms_stream',14),
	(53,'2015_09_28_162152_anomaly.module.forms__create_notifications_stream',14);

/*!40000 ALTER TABLE `grishamind_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_navigation_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_navigation_links`;

CREATE TABLE `grishamind_navigation_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` int(11) NOT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_navigation_links` WRITE;
/*!40000 ALTER TABLE `grishamind_navigation_links` DISABLE KEYS */;

INSERT INTO `grishamind_navigation_links` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `menu_id`, `type`, `entry_id`, `entry_type`, `target`, `class`, `parent_id`)
VALUES
	(1,1,'2017-06-03 02:02:15',NULL,NULL,NULL,NULL,1,'anomaly.extension.url_link_type',1,'Anomaly\\UrlLinkTypeExtension\\UrlLinkTypeModel','_blank',NULL,NULL),
	(2,2,'2017-06-03 02:02:15',NULL,NULL,NULL,NULL,1,'anomaly.extension.url_link_type',2,'Anomaly\\UrlLinkTypeExtension\\UrlLinkTypeModel','_blank',NULL,NULL);

/*!40000 ALTER TABLE `grishamind_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_navigation_links_allowed_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_navigation_links_allowed_roles`;

CREATE TABLE `grishamind_navigation_links_allowed_roles` (
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_navigation_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_navigation_menus`;

CREATE TABLE `grishamind_navigation_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b971176b13cd6738cbb5a6905fe40e9b` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_navigation_menus` WRITE;
/*!40000 ALTER TABLE `grishamind_navigation_menus` DISABLE KEYS */;

INSERT INTO `grishamind_navigation_menus` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`)
VALUES
	(1,1,'2017-06-03 02:02:15',NULL,NULL,NULL,NULL,'footer');

/*!40000 ALTER TABLE `grishamind_navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_navigation_menus_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_navigation_menus_translations`;

CREATE TABLE `grishamind_navigation_menus_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `navigation_menus_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_navigation_menus_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_navigation_menus_translations` DISABLE KEYS */;

INSERT INTO `grishamind_navigation_menus_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:15',NULL,'2017-06-03 02:02:15',NULL,'en','Footer','This is the footer.');

/*!40000 ALTER TABLE `grishamind_navigation_menus_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_notifications`;

CREATE TABLE `grishamind_notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_page_link_type_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_page_link_type_pages`;

CREATE TABLE `grishamind_page_link_type_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_page_link_type_pages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_page_link_type_pages_translations`;

CREATE TABLE `grishamind_page_link_type_pages_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `page_link_type_pages_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_pages_contact_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_contact_pages`;

CREATE TABLE `grishamind_pages_contact_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_contact_pages` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_contact_pages` DISABLE KEYS */;

INSERT INTO `grishamind_pages_contact_pages` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`)
VALUES
	(1,1,'2017-06-04 06:04:03',1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_pages_contact_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_contact_pages_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_contact_pages_content`;

CREATE TABLE `grishamind_pages_contact_pages_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-relations` (`related_id`,`entry_id`,`entry_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_contact_pages_content` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_contact_pages_content` DISABLE KEYS */;

INSERT INTO `grishamind_pages_contact_pages_content` (`id`, `entry_id`, `entry_type`, `related_id`, `sort_order`)
VALUES
	(3,9,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',1,0),
	(4,2,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridHtmlEntryModel',1,1);

/*!40000 ALTER TABLE `grishamind_pages_contact_pages_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_contact_pages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_contact_pages_translations`;

CREATE TABLE `grishamind_pages_contact_pages_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_contact_pages_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_contact_pages_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_contact_pages_translations` DISABLE KEYS */;

INSERT INTO `grishamind_pages_contact_pages_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`)
VALUES
	(1,1,'2017-06-04 06:04:03',NULL,'2017-06-04 06:04:03',1,'en');

/*!40000 ALTER TABLE `grishamind_pages_contact_pages_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_default_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_default_pages`;

CREATE TABLE `grishamind_pages_default_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_default_pages` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_default_pages` DISABLE KEYS */;

INSERT INTO `grishamind_pages_default_pages` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,NULL,NULL,NULL),
	(2,2,'2017-06-03 02:02:16',NULL,NULL,NULL,'2017-06-04 06:04:09'),
	(3,3,'2017-06-04 04:57:21',1,NULL,NULL,NULL),
	(4,4,'2017-06-04 05:31:12',1,NULL,NULL,NULL),
	(5,5,'2017-06-04 05:31:58',1,NULL,NULL,NULL),
	(6,6,'2017-06-04 05:35:38',1,NULL,NULL,NULL),
	(7,7,'2017-06-04 05:36:33',1,NULL,NULL,NULL),
	(8,8,'2017-06-04 05:48:27',1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_pages_default_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_default_pages_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_default_pages_content`;

CREATE TABLE `grishamind_pages_default_pages_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-relations` (`related_id`,`entry_id`,`entry_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_default_pages_content` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_default_pages_content` DISABLE KEYS */;

INSERT INTO `grishamind_pages_default_pages_content` (`id`, `entry_id`, `entry_type`, `related_id`, `sort_order`)
VALUES
	(6,1,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',1,0),
	(7,2,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',1,1),
	(9,2,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridGalleryEntryModel',4,0),
	(11,3,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',3,0),
	(12,4,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',5,0),
	(14,6,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',7,0),
	(15,5,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',6,0),
	(16,7,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',8,0),
	(17,8,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridContentEntryModel',2,0),
	(18,1,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridHtmlEntryModel',2,1);

/*!40000 ALTER TABLE `grishamind_pages_default_pages_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_default_pages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_default_pages_translations`;

CREATE TABLE `grishamind_pages_default_pages_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_default_pages_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_default_pages_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_default_pages_translations` DISABLE KEYS */;

INSERT INTO `grishamind_pages_default_pages_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,'2017-06-03 02:02:16',NULL,'en'),
	(2,2,'2017-06-03 02:02:16',NULL,'2017-06-03 02:02:16',NULL,'en'),
	(3,3,'2017-06-04 04:57:21',NULL,'2017-06-04 04:57:21',1,'en'),
	(4,4,'2017-06-04 05:31:12',NULL,'2017-06-04 05:31:12',1,'en'),
	(5,5,'2017-06-04 05:31:58',NULL,'2017-06-04 05:31:58',1,'en'),
	(6,6,'2017-06-04 05:35:38',NULL,'2017-06-04 05:35:38',1,'en'),
	(7,7,'2017-06-04 05:36:33',NULL,'2017-06-04 05:36:33',1,'en'),
	(8,8,'2017-06-04 05:48:27',NULL,'2017-06-04 05:48:27',1,'en');

/*!40000 ALTER TABLE `grishamind_pages_default_pages_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_pages`;

CREATE TABLE `grishamind_pages_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `str_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  `exact` tinyint(1) DEFAULT '1',
  `home` tinyint(1) DEFAULT '0',
  `theme_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'theme::layouts/default.twig',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_pages` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_pages` DISABLE KEYS */;

INSERT INTO `grishamind_pages_pages` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `str_id`, `slug`, `path`, `type_id`, `entry_id`, `entry_type`, `parent_id`, `visible`, `enabled`, `exact`, `home`, `theme_layout`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,'2017-06-04 04:55:48',1,NULL,'ABBv1wjSfUVM4EsN7XRNXvsh','welcome','/',1,1,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',NULL,1,1,1,1,'theme::layouts.home'),
	(2,5,'2017-06-03 02:02:16',NULL,'2017-06-04 05:53:33',1,'2017-06-04 06:04:09','2G1vcGy3jSJtqqlY31F4alRu','contact','/contact',1,2,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',NULL,1,1,1,0,NULL),
	(3,2,'2017-06-04 04:57:21',1,'2017-06-04 05:32:14',1,NULL,'juurjhq4FaV3uBBCZF9j2XVf','about','/about',1,3,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',NULL,1,1,1,0,NULL),
	(4,4,'2017-06-04 05:02:15',1,'2017-06-04 05:22:32',1,'2017-06-04 05:25:25','tHOLC8moPDlXAimr4kPVMIqO','services','/services',2,1,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesSidebarPagesEntryModel',NULL,1,1,1,0,NULL),
	(5,3,'2017-06-04 05:31:12',1,'2017-06-04 05:31:20',1,NULL,'aaEd11VKuP0sCDf1W30OrIVb','services','/services',1,4,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',NULL,1,1,1,0,NULL),
	(6,1,'2017-06-04 05:31:58',1,'2017-06-04 05:35:53',1,NULL,'cUOJ4xGuhHbWoVetJbh1KzHA','millwright','/services/millwright',1,5,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',5,1,1,1,0,NULL),
	(7,2,'2017-06-04 05:35:38',1,'2017-06-04 05:36:47',1,NULL,'YVDM9F7X81nNPXXJcPD7XsvX','machining','/services/machining',1,6,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',5,1,1,1,0,NULL),
	(8,3,'2017-06-04 05:36:33',1,'2017-06-04 05:48:39',1,NULL,'rUxWBy1h5CaXSbrHPFMvt4v4','custom-fabrication','/services/custom-fabrication',1,7,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',5,1,1,1,0,NULL),
	(9,4,'2017-06-04 05:48:27',1,'2017-06-04 05:48:39',1,NULL,'aHcBXORIKTtKdEdQbChbvCSi','references','/references',1,8,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesDefaultPagesEntryModel',NULL,1,1,1,0,NULL),
	(10,9,'2017-06-04 06:04:03',1,'2017-06-04 06:11:28',1,NULL,'qYssQwlEA2gDBCUoJfSqgExH','contact','/contact',3,1,'Anomaly\\Streams\\Platform\\Model\\Pages\\PagesContactPagesEntryModel',NULL,1,1,1,0,NULL);

/*!40000 ALTER TABLE `grishamind_pages_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_pages_allowed_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_pages_allowed_roles`;

CREATE TABLE `grishamind_pages_pages_allowed_roles` (
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_pages_pages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_pages_translations`;

CREATE TABLE `grishamind_pages_pages_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pages_pages_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_pages_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_pages_translations` DISABLE KEYS */;

INSERT INTO `grishamind_pages_pages_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `title`, `meta_title`, `meta_description`, `meta_keywords`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,'2017-06-04 04:48:40',1,'en','Welcome',NULL,NULL,'a:0:{}'),
	(2,2,'2017-06-03 02:02:16',NULL,'2017-06-04 05:50:31',1,'en','Contact',NULL,NULL,'a:0:{}'),
	(3,3,'2017-06-04 04:57:21',NULL,'2017-06-04 05:32:14',1,'en','About',NULL,NULL,'a:0:{}'),
	(4,4,'2017-06-04 05:02:16',NULL,'2017-06-04 05:02:16',1,'en','Services',NULL,NULL,'a:0:{}'),
	(5,5,'2017-06-04 05:31:12',NULL,'2017-06-04 05:31:12',1,'en','Services',NULL,NULL,'a:0:{}'),
	(6,6,'2017-06-04 05:31:58',NULL,'2017-06-04 05:34:48',1,'en','Millwright','Millwright Services','Full service millwright contracting with over 40 years of combined expertise.','a:0:{}'),
	(7,7,'2017-06-04 05:35:38',NULL,'2017-06-04 05:36:47',1,'en','Machining','Machining Services','Our machine crew has over 70 years combined experience in machining.','a:0:{}'),
	(8,8,'2017-06-04 05:36:34',NULL,'2017-06-04 05:36:34',1,'en','Custom Fabrication',NULL,NULL,'a:0:{}'),
	(9,9,'2017-06-04 05:48:27',NULL,'2017-06-04 05:48:27',1,'en','References','Professional References','Don\'t just take our word for it, check out what our clients said!','a:0:{}'),
	(10,10,'2017-06-04 06:04:03',NULL,'2017-06-04 06:04:03',1,'en','Contact',NULL,NULL,'a:0:{}');

/*!40000 ALTER TABLE `grishamind_pages_pages_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_sidebar_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_sidebar_pages`;

CREATE TABLE `grishamind_pages_sidebar_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `sidebar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_sidebar_pages` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages` DISABLE KEYS */;

INSERT INTO `grishamind_pages_sidebar_pages` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `sidebar`)
VALUES
	(1,1,'2017-06-04 05:02:15',1,'2017-06-04 05:22:32',1,'2017-06-04 05:25:25','Our Services');

/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_sidebar_pages_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_sidebar_pages_content`;

CREATE TABLE `grishamind_pages_sidebar_pages_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-relations` (`related_id`,`entry_id`,`entry_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_sidebar_pages_content` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_content` DISABLE KEYS */;

INSERT INTO `grishamind_pages_sidebar_pages_content` (`id`, `entry_id`, `entry_type`, `related_id`, `sort_order`)
VALUES
	(2,1,'Anomaly\\Streams\\Platform\\Model\\Grid\\GridGalleryEntryModel',1,0);

/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_sidebar_pages_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_sidebar_pages_items`;

CREATE TABLE `grishamind_pages_sidebar_pages_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-relations` (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_sidebar_pages_items` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_items` DISABLE KEYS */;

INSERT INTO `grishamind_pages_sidebar_pages_items` (`id`, `entry_id`, `related_id`, `sort_order`)
VALUES
	(1,1,1,0),
	(2,1,2,1),
	(3,1,3,2);

/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_sidebar_pages_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_sidebar_pages_translations`;

CREATE TABLE `grishamind_pages_sidebar_pages_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_sidebar_pages_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_sidebar_pages_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_translations` DISABLE KEYS */;

INSERT INTO `grishamind_pages_sidebar_pages_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`)
VALUES
	(1,1,'2017-06-04 05:02:15',NULL,'2017-06-04 05:02:15',1,'en');

/*!40000 ALTER TABLE `grishamind_pages_sidebar_pages_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_types`;

CREATE TABLE `grishamind_pages_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'theme::layouts/default.twig',
  `layout` text COLLATE utf8_unicode_ci NOT NULL,
  `handler` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anomaly.extension.default_page_handler',
  PRIMARY KEY (`id`),
  UNIQUE KEY `381176fc0d89ae8d97d99ce9b6109b9a` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_types` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_types` DISABLE KEYS */;

INSERT INTO `grishamind_pages_types` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`, `theme_layout`, `layout`, `handler`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,'2017-06-04 06:07:39',1,NULL,'default','theme::layouts.default','<section class=\"{{ not page.children.isEmpty() or page.parent_id ? \'span8\' : \'span12\' }} content\">\r\n    <div class=\"white-panel equal-column\">\r\n\r\n        <div class=\"page-header\">\r\n\r\n            <h1>{{ template.page.title }}</h1>\r\n\r\n        </div>\r\n\r\n        <div class=\"content\">\r\n\r\n            {% for block in page.content %}\r\n                <div class=\"block {{ block.type }}-block-type\">\r\n                    {% include \"theme::blocks/\" ~ block.type %}\r\n                </div>\r\n            {% endfor %}\r\n\r\n\r\n        </div>\r\n\r\n        <div class=\"clearfix\"></div>\r\n    </div>\r\n</section>\r\n\r\n{% if not page.children.isEmpty() or page.parent_id %}\r\n    <section class=\"span4\">\r\n        <div class=\"white-panel equal-column\">\r\n\r\n            <div class=\"widget navigation\">\r\n                <h3 class=\"title\">Learn More</h3>\r\n\r\n                <div class=\"wrapper\">\r\n                    <ul class=\"navigation\">\r\n                        {% if not page.children.isEmpty() %}\r\n                            {% for page in page.children %}\r\n                                <li class=\"{{ page.id == template.page.id ? \'current\' }}\">\r\n                                    <a href=\"{{ page.path }}\">{{ page.title }}</a>\r\n                                </li>\r\n                            {% endfor %}\r\n                        {% else %}\r\n                            {% for page in page.siblings %}\r\n                                <li class=\"{{ page.id == template.page.id ? \'current\' }}\">\r\n                                    <a href=\"{{ page.path }}\">{{ page.title }}</a>\r\n                                </li>\r\n                            {% endfor %}\r\n                        {% endif %}\r\n                    </ul>\r\n                </div>\r\n                <div class=\"divider\"></div>\r\n            </div>\r\n            {#<div id=\"get-a-free-estimate\" class=\"widget html services-sidebar\">#}\r\n            {#<h3 class=\"title\">Get a FREE estimate!</h3>#}\r\n\r\n            {#<div class=\"wrapper\">#}\r\n            {#<a href=\"/contact-us\" class=\"btn btn-large btn-warning\">Call (563) 381-3525 or Email Us</a>#}\r\n            {#</div>#}\r\n            {#<div class=\"divider\"></div>#}\r\n            {#</div>#}\r\n\r\n        </div>\r\n    </section>\r\n{% endif %}\r\n','anomaly.extension.default_page_handler'),
	(2,2,'2017-06-04 05:01:57',1,'2017-06-04 05:25:02',1,'2017-06-04 05:25:26','sidebar','theme::layouts.default','<section class=\"span8 content\">\r\n    <div class=\"white-panel\">\r\n\r\n        <div class=\"page-header\">\r\n\r\n            <h1>{{ template.page.title }}</h1>\r\n\r\n        </div>\r\n\r\n        <div class=\"content\">\r\n\r\n            {% for block in page.content %}\r\n                <div class=\"block {{ block.type }}-block-type\">\r\n                    {% include \"theme::blocks/\" ~ block.type %}\r\n                </div>\r\n            {% endfor %}\r\n\r\n\r\n        </div>\r\n\r\n        <div class=\"clearfix\"></div>\r\n    </div>\r\n</section>\r\n\r\n<section class=\"span4\">\r\n            <div class=\"white-panel equal-column\" style=\"height: 436px;\">\r\n\r\n                <div id=\"our-services\" class=\"widget navigation services-sidebar\">\r\n                    <h3 class=\"title\">{{ page.sidebar ?: \'More \' ~ page.name }}</h3>\r\n\r\n                    <div class=\"wrapper\">\r\n                        <ul class=\"navigation\">\r\n                            {% for item in page.items %}\r\n                                <li><a href=\"/services-millwright\">Millwright</a></li>\r\n                                <li><a href=\"/services-machining\">Machining</a></li>\r\n                                <li><a href=\"/services-custom-fabrication\">Custom Fabrication</a></li>\r\n                            {% endfor %}\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"divider\"></div>\r\n                </div>\r\n                <div id=\"get-a-free-estimate\" class=\"widget html services-sidebar\">\r\n                    <h3 class=\"title\">Get a FREE estimate!</h3>\r\n\r\n                    <div class=\"wrapper\">\r\n                    </div>\r\n                    <div class=\"divider\"></div>\r\n                </div>\r\n\r\n\r\n            </div>\r\n        </section>\r\n','anomaly.extension.default_page_handler'),
	(3,2,'2017-06-04 06:01:44',1,'2017-06-04 06:07:09',1,NULL,'contact','theme::layouts.default','<section class=\"span4\">\r\n	<div class=\"white-panel equal-column\">\r\n\r\n		<div class=\"widget\">\r\n			<h3 class=\"title\">Email Us</h3>\r\n\r\n			<div class=\"wrapper\">\r\n				{{ form(\'anomaly.module.forms::forms.contact_us\')|raw }}\r\n			</div>\r\n			<div class=\"divider\"></div>\r\n		</div>\r\n\r\n	</div>\r\n</section>\r\n\r\n<section class=\"span8 content\">\r\n    <div class=\"white-panel\">\r\n\r\n        <div class=\"page-header\">\r\n\r\n            <h1>{{ template.page.title }}</h1>\r\n\r\n        </div>\r\n\r\n        <div class=\"content\">\r\n\r\n            {% for block in page.content %}\r\n                <div class=\"block {{ block.type }}-block-type\">\r\n                    {% include \"theme::blocks/\" ~ block.type %}\r\n                </div>\r\n            {% endfor %}\r\n\r\n\r\n        </div>\r\n\r\n        <div class=\"clearfix\"></div>\r\n    </div>\r\n</section>\r\n','anomaly.extension.default_page_handler');

/*!40000 ALTER TABLE `grishamind_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_pages_types_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_pages_types_translations`;

CREATE TABLE `grishamind_pages_types_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pages_types_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_pages_types_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_pages_types_translations` DISABLE KEYS */;

INSERT INTO `grishamind_pages_types_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:16',NULL,'2017-06-03 02:02:16',NULL,'en','Default','A simple page type.'),
	(2,2,'2017-06-04 05:01:57',NULL,'2017-06-04 05:01:57',1,'en','Sidebar','A simple page type with block content and a callout sidebar.'),
	(3,3,'2017-06-04 06:01:44',NULL,'2017-06-04 06:01:44',1,'en','Contact','A special page for the contact page only.');

/*!40000 ALTER TABLE `grishamind_pages_types_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_categories`;

CREATE TABLE `grishamind_posts_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `9a8a0682d35f9b22c741cb0536aa691f` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_categories` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_categories` DISABLE KEYS */;

INSERT INTO `grishamind_posts_categories` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,NULL,NULL,NULL,'news');

/*!40000 ALTER TABLE `grishamind_posts_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_categories_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_categories_translations`;

CREATE TABLE `grishamind_posts_categories_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_categories_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_categories_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_categories_translations` DISABLE KEYS */;

INSERT INTO `grishamind_posts_categories_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,'2017-06-03 02:02:17',NULL,'en','News','Company news and updates.');

/*!40000 ALTER TABLE `grishamind_posts_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_default_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_default_posts`;

CREATE TABLE `grishamind_posts_default_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_default_posts` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_default_posts` DISABLE KEYS */;

INSERT INTO `grishamind_posts_default_posts` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_posts_default_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_default_posts_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_default_posts_translations`;

CREATE TABLE `grishamind_posts_default_posts_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_default_posts_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_default_posts_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_default_posts_translations` DISABLE KEYS */;

INSERT INTO `grishamind_posts_default_posts_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `content`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,'2017-06-03 02:02:17',NULL,'en','<p>Welcome to PyroCMS!</p>');

/*!40000 ALTER TABLE `grishamind_posts_default_posts_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_posts`;

CREATE TABLE `grishamind_posts_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `str_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `publish_at` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `entry_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '0',
  `tags` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `a1128facbe9e8e6c2c59eddcfa495104` (`str_id`),
  UNIQUE KEY `0c47b5470543e28befe49a899387ccff` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_posts` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_posts` DISABLE KEYS */;

INSERT INTO `grishamind_posts_posts` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `str_id`, `slug`, `type_id`, `publish_at`, `author_id`, `entry_id`, `entry_type`, `category_id`, `featured`, `enabled`, `tags`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,NULL,NULL,NULL,'hddOjcCriKfV4Yrr','welcome-to-pyrocms',1,'2017-06-03 02:02:17',1,1,'Anomaly\\Streams\\Platform\\Model\\Posts\\PostsDefaultPostsEntryModel',1,0,1,NULL);

/*!40000 ALTER TABLE `grishamind_posts_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_posts_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_posts_translations`;

CREATE TABLE `grishamind_posts_posts_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_posts_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_posts_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_posts_translations` DISABLE KEYS */;

INSERT INTO `grishamind_posts_posts_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `title`, `summary`, `meta_title`, `meta_description`, `meta_keywords`)
VALUES
	(1,1,'2017-06-03 02:02:18',NULL,'2017-06-03 02:02:18',NULL,'en','Welcome to PyroCMS!','This is an example post to demonstrate the posts module.',NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_posts_posts_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_types`;

CREATE TABLE `grishamind_posts_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` text COLLATE utf8_unicode_ci NOT NULL,
  `theme_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `1dc1b98be4181be266b483941a42b000` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_types` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_types` DISABLE KEYS */;

INSERT INTO `grishamind_posts_types` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`, `layout`, `theme_layout`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,NULL,NULL,NULL,'default','{{ post.content.render|raw }}','theme::layouts/default.twig');

/*!40000 ALTER TABLE `grishamind_posts_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_posts_types_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_posts_types_translations`;

CREATE TABLE `grishamind_posts_types_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_types_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_posts_types_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_posts_types_translations` DISABLE KEYS */;

INSERT INTO `grishamind_posts_types_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:17',NULL,'2017-06-03 02:02:17',NULL,'en','Default','A simple post type.');

/*!40000 ALTER TABLE `grishamind_posts_types_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_preferences_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_preferences_preferences`;

CREATE TABLE `grishamind_preferences_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_redirects_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_redirects_redirects`;

CREATE TABLE `grishamind_redirects_redirects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '301',
  `secure` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `0cb4275c3992e35aae2a6b18f5f213c1` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_repeater_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_repeater_item`;

CREATE TABLE `grishamind_repeater_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_repeater_item` WRITE;
/*!40000 ALTER TABLE `grishamind_repeater_item` DISABLE KEYS */;

INSERT INTO `grishamind_repeater_item` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `text`)
VALUES
	(1,1,'2017-06-04 05:22:32',1,NULL,NULL,'Millwright'),
	(2,2,'2017-06-04 05:22:32',1,NULL,NULL,'Machining'),
	(3,3,'2017-06-04 05:22:32',1,NULL,NULL,'Custom Fabrication');

/*!40000 ALTER TABLE `grishamind_repeater_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_sessions`;

CREATE TABLE `grishamind_sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table grishamind_settings_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_settings_settings`;

CREATE TABLE `grishamind_settings_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `c51990785fa58fe7b8132ccb33d9b45f` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_settings_settings` WRITE;
/*!40000 ALTER TABLE `grishamind_settings_settings` DISABLE KEYS */;

INSERT INTO `grishamind_settings_settings` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `key`, `value`)
VALUES
	(1,1,'2017-06-03 02:02:19',NULL,'2017-06-03 07:25:27',1,'streams::timezone','America/Chicago'),
	(2,2,'2017-06-03 02:02:19',NULL,'2017-06-03 07:25:27',1,'streams::default_locale','en'),
	(3,3,'2017-06-03 07:25:27',1,NULL,NULL,'streams::name','Grisham Industries, Inc.'),
	(4,4,'2017-06-03 07:25:27',1,NULL,NULL,'streams::description',NULL),
	(5,5,'2017-06-03 07:25:27',1,NULL,NULL,'streams::business',NULL),
	(6,6,'2017-06-03 07:25:27',1,NULL,NULL,'streams::phone','5633813525'),
	(7,7,'2017-06-03 07:25:27',1,NULL,NULL,'streams::address','13609 110th Avenue'),
	(8,8,'2017-06-03 07:25:27',1,NULL,NULL,'streams::address2',NULL),
	(9,9,'2017-06-03 07:25:27',1,NULL,NULL,'streams::city','Davenport'),
	(10,10,'2017-06-03 07:25:27',1,NULL,NULL,'streams::state','IA'),
	(11,11,'2017-06-03 07:25:27',1,NULL,NULL,'streams::postal_code','52804'),
	(12,12,'2017-06-03 07:25:27',1,NULL,NULL,'streams::country','US'),
	(13,13,'2017-06-03 07:25:27',1,NULL,NULL,'streams::date_format','j F, Y'),
	(14,14,'2017-06-03 07:25:27',1,NULL,NULL,'streams::time_format','g:i A'),
	(15,15,'2017-06-03 07:25:27',1,NULL,NULL,'streams::unit_system','imperial'),
	(16,16,'2017-06-03 07:25:27',1,NULL,NULL,'streams::currency','USD'),
	(17,17,'2017-06-03 07:25:27',1,NULL,NULL,'streams::standard_theme','grishamind.theme.grishamind'),
	(18,18,'2017-06-03 07:25:27',1,NULL,NULL,'streams::admin_theme','pyrocms.theme.accelerant'),
	(19,19,'2017-06-03 07:25:27',1,NULL,NULL,'streams::per_page','15'),
	(20,20,'2017-06-03 07:25:27',1,NULL,NULL,'streams::enabled_locales','a:1:{i:0;s:2:\"en\";}'),
	(21,21,'2017-06-03 07:25:27',1,NULL,NULL,'streams::debug','0'),
	(22,22,'2017-06-03 07:25:27',1,NULL,NULL,'streams::maintenance','0'),
	(23,23,'2017-06-03 07:25:27',1,NULL,NULL,'streams::basic_auth','0'),
	(24,24,'2017-06-03 07:25:27',1,NULL,NULL,'streams::ip_whitelist','a:0:{}'),
	(25,25,'2017-06-03 07:25:27',1,NULL,NULL,'streams::email','noreply@grishamind.local'),
	(26,26,'2017-06-03 07:25:27',1,NULL,NULL,'streams::sender','PyroCMS');

/*!40000 ALTER TABLE `grishamind_settings_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_assignments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_assignments`;

CREATE TABLE `grishamind_streams_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `translatable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_assignments` (`stream_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_assignments` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_assignments` DISABLE KEYS */;

INSERT INTO `grishamind_streams_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `config`, `unique`, `required`, `translatable`)
VALUES
	(1,1,1,1,'a:0:{}',0,1,0),
	(2,2,1,2,'a:0:{}',0,1,0),
	(3,3,1,3,'a:0:{}',0,0,0),
	(4,4,2,4,'a:0:{}',0,1,1),
	(5,5,2,5,'a:0:{}',1,1,0),
	(6,6,2,6,'a:0:{}',0,0,1),
	(7,7,2,7,'a:0:{}',0,1,0),
	(8,8,2,13,'a:0:{}',0,0,0),
	(9,9,3,8,'a:0:{}',0,1,1),
	(10,10,3,6,'a:0:{}',0,0,1),
	(11,11,3,9,'a:0:{}',0,1,0),
	(12,12,3,10,'a:0:{}',0,1,0),
	(13,13,3,12,'a:0:{}',0,1,0),
	(14,14,3,13,'a:0:{}',0,0,0),
	(15,15,3,11,'a:0:{}',0,0,0),
	(16,16,4,14,'a:0:{}',1,1,1),
	(17,17,4,15,'a:0:{}',1,1,0),
	(18,18,4,16,'a:0:{}',0,1,0),
	(19,19,4,20,'a:0:{}',0,0,1),
	(20,20,5,18,'a:0:{}',0,1,0),
	(21,21,5,14,'a:1:{s:3:\"max\";i:50;}',0,1,1),
	(22,22,5,15,'a:1:{s:3:\"max\";i:50;}',1,1,0),
	(23,23,5,20,'a:0:{}',0,0,1),
	(24,24,5,21,'a:0:{}',0,0,0),
	(25,25,6,14,'a:0:{}',0,1,0),
	(26,26,6,18,'a:0:{}',0,1,0),
	(27,27,6,17,'a:0:{}',0,1,0),
	(28,28,6,23,'a:0:{}',0,1,0),
	(29,29,6,27,'a:0:{}',0,1,0),
	(30,30,6,26,'a:0:{}',0,1,0),
	(31,31,6,19,'a:0:{}',0,0,0),
	(32,32,6,22,'a:0:{}',0,0,0),
	(33,33,6,25,'a:0:{}',0,0,0),
	(34,34,6,24,'a:0:{}',0,0,0),
	(35,35,7,28,'a:0:{}',1,1,1),
	(36,36,7,32,'a:0:{}',1,1,0),
	(37,37,7,30,'a:0:{}',0,0,1),
	(38,38,8,33,'a:0:{}',0,1,0),
	(39,39,8,36,'a:0:{}',0,1,0),
	(40,40,8,31,'a:0:{}',0,1,0),
	(41,41,8,37,'a:0:{}',0,1,0),
	(42,42,8,29,'a:0:{}',0,0,0),
	(43,43,8,34,'a:0:{}',0,0,0),
	(44,44,8,35,'a:0:{}',0,0,0),
	(45,45,9,38,'a:0:{}',0,1,0),
	(46,46,9,39,'a:0:{}',0,1,1),
	(47,47,9,40,'a:0:{}',0,1,0),
	(48,48,9,42,'a:0:{}',0,1,0),
	(49,49,9,52,'a:0:{}',0,1,0),
	(50,50,9,56,'a:0:{}',0,0,0),
	(51,51,9,50,'a:0:{}',0,0,0),
	(52,52,9,54,'a:0:{}',0,0,0),
	(53,53,9,43,'a:0:{}',0,0,0),
	(54,54,9,55,'a:0:{}',0,0,0),
	(55,55,9,44,'a:0:{}',0,0,0),
	(56,56,9,45,'a:0:{}',0,0,1),
	(57,57,9,46,'a:0:{}',0,0,1),
	(58,58,9,47,'a:0:{}',0,0,1),
	(59,59,9,51,'a:0:{}',0,0,0),
	(60,60,9,49,'a:0:{}',0,0,0),
	(61,61,10,57,'a:1:{s:3:\"max\";i:50;}',1,1,1),
	(62,62,10,40,'a:3:{s:7:\"slugify\";s:4:\"name\";s:4:\"type\";s:1:\"_\";s:3:\"max\";i:50;}',1,1,0),
	(63,63,10,58,'a:0:{}',0,0,1),
	(64,64,10,51,'a:0:{}',0,1,0),
	(65,65,10,48,'a:0:{}',0,1,0),
	(66,66,10,53,'a:0:{}',0,1,0),
	(67,67,11,60,'a:0:{}',1,1,1),
	(68,68,11,62,'a:1:{s:7:\"slugify\";s:4:\"name\";}',1,1,0),
	(69,69,11,67,'a:0:{}',0,0,1),
	(70,70,12,59,'a:0:{}',1,1,0),
	(71,71,12,61,'a:0:{}',0,1,1),
	(72,72,12,66,'a:0:{}',0,0,1),
	(73,73,12,62,'a:0:{}',1,1,0),
	(74,74,12,64,'a:0:{}',0,1,0),
	(75,75,12,68,'a:0:{}',0,1,0),
	(76,76,12,70,'a:0:{}',0,1,0),
	(77,77,12,69,'a:0:{}',0,1,0),
	(78,78,12,75,'a:0:{}',0,0,1),
	(79,79,12,76,'a:0:{}',0,0,1),
	(80,80,12,77,'a:0:{}',0,0,1),
	(81,81,12,72,'a:0:{}',0,0,0),
	(82,82,12,74,'a:0:{}',0,0,0),
	(83,83,12,73,'a:0:{}',0,0,0),
	(84,84,12,65,'a:0:{}',0,0,0),
	(85,85,13,60,'a:1:{s:3:\"max\";i:50;}',1,1,1),
	(86,86,13,62,'a:3:{s:7:\"slugify\";s:4:\"name\";s:4:\"type\";s:1:\"_\";s:3:\"max\";i:50;}',1,1,0),
	(87,87,13,71,'a:0:{}',0,1,0),
	(88,88,13,79,'a:0:{}',0,1,0),
	(89,89,13,67,'a:0:{}',0,0,1),
	(90,90,14,80,'a:0:{}',0,1,0),
	(91,91,14,81,'a:0:{}',0,1,0),
	(92,92,14,82,'a:0:{}',0,0,0),
	(93,93,15,83,'a:0:{}',1,1,0),
	(94,94,15,84,'a:0:{}',0,1,0),
	(95,95,15,85,'a:0:{}',0,1,0),
	(96,96,15,86,'a:0:{}',0,0,0),
	(97,97,16,87,'a:0:{}',1,1,0),
	(98,98,16,88,'a:0:{}',0,0,0),
	(99,99,17,89,'a:0:{}',1,1,0),
	(100,100,17,90,'a:0:{}',1,1,0),
	(101,101,17,91,'a:0:{}',0,1,0),
	(102,102,17,109,'a:0:{}',0,1,0),
	(103,103,17,97,'a:0:{}',0,1,0),
	(104,104,17,98,'a:0:{}',0,0,0),
	(105,105,17,99,'a:0:{}',0,0,0),
	(106,106,17,106,'a:0:{}',0,0,0),
	(107,107,17,107,'a:0:{}',0,0,0),
	(108,108,17,96,'a:0:{}',0,0,0),
	(109,109,17,94,'a:0:{}',0,0,0),
	(110,110,17,92,'a:0:{}',0,0,0),
	(111,111,17,104,'a:0:{}',0,0,0),
	(112,112,17,102,'a:0:{}',0,0,0),
	(113,113,17,95,'a:0:{}',0,0,0),
	(114,114,17,93,'a:0:{}',0,0,0),
	(115,115,18,100,'a:0:{}',0,1,1),
	(116,116,18,108,'a:0:{}',1,1,0),
	(117,117,18,101,'a:0:{}',0,0,1),
	(118,118,18,96,'a:0:{}',0,0,0),
	(119,119,19,110,'a:0:{}',0,0,1),
	(120,120,19,111,'a:0:{}',0,1,0),
	(121,121,19,112,'a:0:{}',0,0,1),
	(122,122,20,113,'a:0:{}',0,1,1),
	(123,123,20,114,'a:0:{}',0,1,0),
	(124,124,20,115,'a:0:{}',0,0,1),
	(126,126,24,63,'a:0:{}',0,0,1),
	(127,126,23,116,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(128,127,25,117,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(129,128,26,118,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(130,129,27,116,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(131,130,28,119,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(132,131,29,121,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(133,132,27,120,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(134,133,27,122,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0),
	(135,134,30,123,'a:0:{}',0,1,0),
	(136,135,30,124,'a:0:{}',0,0,0),
	(137,136,30,125,'a:0:{}',1,1,0),
	(138,137,30,126,'a:0:{}',0,1,0),
	(139,138,30,127,'a:0:{}',0,0,0),
	(140,139,30,147,'a:0:{}',0,0,1),
	(141,140,30,148,'a:0:{}',0,0,1),
	(142,141,30,140,'a:0:{}',0,0,0),
	(143,142,30,141,'a:0:{}',0,0,1),
	(144,143,30,138,'a:0:{}',0,0,1),
	(145,144,30,139,'a:0:{}',0,0,1),
	(146,145,30,142,'a:0:{}',0,0,0),
	(147,146,30,143,'a:0:{}',0,0,0),
	(148,147,30,144,'a:0:{}',0,0,0),
	(149,148,30,145,'a:0:{}',0,0,0),
	(150,149,31,128,'a:0:{}',0,1,0),
	(151,150,31,129,'a:0:{}',0,0,0),
	(152,151,31,130,'a:0:{}',1,1,0),
	(153,152,31,131,'a:0:{}',0,0,0),
	(154,153,31,132,'a:0:{}',0,1,1),
	(155,154,31,133,'a:0:{}',0,1,1),
	(156,155,31,134,'a:0:{}',0,1,0),
	(157,156,31,135,'a:0:{}',0,1,0),
	(158,157,31,136,'a:0:{}',0,1,0),
	(159,158,31,137,'a:0:{}',0,1,1),
	(160,159,31,146,'a:0:{}',0,0,0),
	(161,160,32,149,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(162,161,32,150,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(163,162,32,151,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(164,163,32,152,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(165,164,32,153,'a:1:{i:0;s:6:\"a:0:{}\";}',0,1,0),
	(166,165,33,116,'a:1:{i:0;s:6:\"a:0:{}\";}',0,0,0);

/*!40000 ALTER TABLE `grishamind_streams_assignments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_assignments_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_assignments_translations`;

CREATE TABLE `grishamind_streams_assignments_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `streams_assignments_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_assignments_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_assignments_translations` DISABLE KEYS */;

INSERT INTO `grishamind_streams_assignments_translations` (`id`, `assignment_id`, `locale`, `label`, `warning`, `placeholder`, `instructions`)
VALUES
	(1,1,'en','anomaly.module.configuration::field.scope.label.configuration','anomaly.module.configuration::field.scope.warning.configuration','anomaly.module.configuration::field.scope.placeholder.configuration','anomaly.module.configuration::field.scope.instructions.configuration'),
	(2,2,'en','anomaly.module.configuration::field.key.label.configuration','anomaly.module.configuration::field.key.warning.configuration','anomaly.module.configuration::field.key.placeholder.configuration','anomaly.module.configuration::field.key.instructions.configuration'),
	(3,3,'en','anomaly.module.configuration::field.value.label.configuration','anomaly.module.configuration::field.value.warning.configuration','anomaly.module.configuration::field.value.placeholder.configuration','anomaly.module.configuration::field.value.instructions.configuration'),
	(4,4,'en','anomaly.module.dashboard::field.name.label.dashboards','anomaly.module.dashboard::field.name.warning.dashboards','anomaly.module.dashboard::field.name.placeholder.dashboards','anomaly.module.dashboard::field.name.instructions.dashboards'),
	(5,5,'en','anomaly.module.dashboard::field.slug.label.dashboards','anomaly.module.dashboard::field.slug.warning.dashboards','anomaly.module.dashboard::field.slug.placeholder.dashboards','anomaly.module.dashboard::field.slug.instructions.dashboards'),
	(6,6,'en','anomaly.module.dashboard::field.description.label.dashboards','anomaly.module.dashboard::field.description.warning.dashboards','anomaly.module.dashboard::field.description.placeholder.dashboards','anomaly.module.dashboard::field.description.instructions.dashboards'),
	(7,7,'en','anomaly.module.dashboard::field.layout.label.dashboards','anomaly.module.dashboard::field.layout.warning.dashboards','anomaly.module.dashboard::field.layout.placeholder.dashboards','anomaly.module.dashboard::field.layout.instructions.dashboards'),
	(8,8,'en','anomaly.module.dashboard::field.allowed_roles.label.dashboards','anomaly.module.dashboard::field.allowed_roles.warning.dashboards','anomaly.module.dashboard::field.allowed_roles.placeholder.dashboards','anomaly.module.dashboard::field.allowed_roles.instructions.dashboards'),
	(9,9,'en','anomaly.module.dashboard::field.title.label.widgets','anomaly.module.dashboard::field.title.warning.widgets','anomaly.module.dashboard::field.title.placeholder.widgets','anomaly.module.dashboard::field.title.instructions.widgets'),
	(10,10,'en','anomaly.module.dashboard::field.description.label.widgets','anomaly.module.dashboard::field.description.warning.widgets','anomaly.module.dashboard::field.description.placeholder.widgets','anomaly.module.dashboard::field.description.instructions.widgets'),
	(11,11,'en','anomaly.module.dashboard::field.extension.label.widgets','anomaly.module.dashboard::field.extension.warning.widgets','anomaly.module.dashboard::field.extension.placeholder.widgets','anomaly.module.dashboard::field.extension.instructions.widgets'),
	(12,12,'en','anomaly.module.dashboard::field.column.label.widgets','anomaly.module.dashboard::field.column.warning.widgets','anomaly.module.dashboard::field.column.placeholder.widgets','anomaly.module.dashboard::field.column.instructions.widgets'),
	(13,13,'en','anomaly.module.dashboard::field.dashboard.label.widgets','anomaly.module.dashboard::field.dashboard.warning.widgets','anomaly.module.dashboard::field.dashboard.placeholder.widgets','anomaly.module.dashboard::field.dashboard.instructions.widgets'),
	(14,14,'en','anomaly.module.dashboard::field.allowed_roles.label.widgets','anomaly.module.dashboard::field.allowed_roles.warning.widgets','anomaly.module.dashboard::field.allowed_roles.placeholder.widgets','anomaly.module.dashboard::field.allowed_roles.instructions.widgets'),
	(15,15,'en','anomaly.module.dashboard::field.pinned.label.widgets','anomaly.module.dashboard::field.pinned.warning.widgets','anomaly.module.dashboard::field.pinned.placeholder.widgets','anomaly.module.dashboard::field.pinned.instructions.widgets'),
	(16,16,'en','anomaly.module.files::field.name.label.disks','anomaly.module.files::field.name.warning.disks','anomaly.module.files::field.name.placeholder.disks','anomaly.module.files::field.name.instructions.disks'),
	(17,17,'en','anomaly.module.files::field.slug.label.disks','anomaly.module.files::field.slug.warning.disks','anomaly.module.files::field.slug.placeholder.disks','anomaly.module.files::field.slug.instructions.disks'),
	(18,18,'en','anomaly.module.files::field.adapter.label.disks','anomaly.module.files::field.adapter.warning.disks','anomaly.module.files::field.adapter.placeholder.disks','anomaly.module.files::field.adapter.instructions.disks'),
	(19,19,'en','anomaly.module.files::field.description.label.disks','anomaly.module.files::field.description.warning.disks','anomaly.module.files::field.description.placeholder.disks','anomaly.module.files::field.description.instructions.disks'),
	(20,20,'en','anomaly.module.files::field.disk.label.folders','anomaly.module.files::field.disk.warning.folders','anomaly.module.files::field.disk.placeholder.folders','anomaly.module.files::field.disk.instructions.folders'),
	(21,21,'en','anomaly.module.files::field.name.label.folders','anomaly.module.files::field.name.warning.folders','anomaly.module.files::field.name.placeholder.folders','anomaly.module.files::field.name.instructions.folders'),
	(22,22,'en','anomaly.module.files::field.slug.label.folders','anomaly.module.files::field.slug.warning.folders','anomaly.module.files::field.slug.placeholder.folders','anomaly.module.files::field.slug.instructions.folders'),
	(23,23,'en','anomaly.module.files::field.description.label.folders','anomaly.module.files::field.description.warning.folders','anomaly.module.files::field.description.placeholder.folders','anomaly.module.files::field.description.instructions.folders'),
	(24,24,'en','anomaly.module.files::field.allowed_types.label.folders','anomaly.module.files::field.allowed_types.warning.folders','anomaly.module.files::field.allowed_types.placeholder.folders','anomaly.module.files::field.allowed_types.instructions.folders'),
	(25,25,'en','anomaly.module.files::field.name.label.files','anomaly.module.files::field.name.warning.files','anomaly.module.files::field.name.placeholder.files','anomaly.module.files::field.name.instructions.files'),
	(26,26,'en','anomaly.module.files::field.disk.label.files','anomaly.module.files::field.disk.warning.files','anomaly.module.files::field.disk.placeholder.files','anomaly.module.files::field.disk.instructions.files'),
	(27,27,'en','anomaly.module.files::field.folder.label.files','anomaly.module.files::field.folder.warning.files','anomaly.module.files::field.folder.placeholder.files','anomaly.module.files::field.folder.instructions.files'),
	(28,28,'en','anomaly.module.files::field.extension.label.files','anomaly.module.files::field.extension.warning.files','anomaly.module.files::field.extension.placeholder.files','anomaly.module.files::field.extension.instructions.files'),
	(29,29,'en','anomaly.module.files::field.size.label.files','anomaly.module.files::field.size.warning.files','anomaly.module.files::field.size.placeholder.files','anomaly.module.files::field.size.instructions.files'),
	(30,30,'en','anomaly.module.files::field.mime_type.label.files','anomaly.module.files::field.mime_type.warning.files','anomaly.module.files::field.mime_type.placeholder.files','anomaly.module.files::field.mime_type.instructions.files'),
	(31,31,'en','anomaly.module.files::field.entry.label.files','anomaly.module.files::field.entry.warning.files','anomaly.module.files::field.entry.placeholder.files','anomaly.module.files::field.entry.instructions.files'),
	(32,32,'en','anomaly.module.files::field.keywords.label.files','anomaly.module.files::field.keywords.warning.files','anomaly.module.files::field.keywords.placeholder.files','anomaly.module.files::field.keywords.instructions.files'),
	(33,33,'en','anomaly.module.files::field.height.label.files','anomaly.module.files::field.height.warning.files','anomaly.module.files::field.height.placeholder.files','anomaly.module.files::field.height.instructions.files'),
	(34,34,'en','anomaly.module.files::field.width.label.files','anomaly.module.files::field.width.warning.files','anomaly.module.files::field.width.placeholder.files','anomaly.module.files::field.width.instructions.files'),
	(35,35,'en','anomaly.module.navigation::field.name.label.menus','anomaly.module.navigation::field.name.warning.menus','anomaly.module.navigation::field.name.placeholder.menus','anomaly.module.navigation::field.name.instructions.menus'),
	(36,36,'en','anomaly.module.navigation::field.slug.label.menus','anomaly.module.navigation::field.slug.warning.menus','anomaly.module.navigation::field.slug.placeholder.menus','anomaly.module.navigation::field.slug.instructions.menus'),
	(37,37,'en','anomaly.module.navigation::field.description.label.menus','anomaly.module.navigation::field.description.warning.menus','anomaly.module.navigation::field.description.placeholder.menus','anomaly.module.navigation::field.description.instructions.menus'),
	(38,38,'en','anomaly.module.navigation::field.menu.label.links','anomaly.module.navigation::field.menu.warning.links','anomaly.module.navigation::field.menu.placeholder.links','anomaly.module.navigation::field.menu.instructions.links'),
	(39,39,'en','anomaly.module.navigation::field.type.label.links','anomaly.module.navigation::field.type.warning.links','anomaly.module.navigation::field.type.placeholder.links','anomaly.module.navigation::field.type.instructions.links'),
	(40,40,'en','anomaly.module.navigation::field.entry.label.links','anomaly.module.navigation::field.entry.warning.links','anomaly.module.navigation::field.entry.placeholder.links','anomaly.module.navigation::field.entry.instructions.links'),
	(41,41,'en','anomaly.module.navigation::field.target.label.links','anomaly.module.navigation::field.target.warning.links','anomaly.module.navigation::field.target.placeholder.links','anomaly.module.navigation::field.target.instructions.links'),
	(42,42,'en','anomaly.module.navigation::field.class.label.links','anomaly.module.navigation::field.class.warning.links','anomaly.module.navigation::field.class.placeholder.links','anomaly.module.navigation::field.class.instructions.links'),
	(43,43,'en','anomaly.module.navigation::field.parent.label.links','anomaly.module.navigation::field.parent.warning.links','anomaly.module.navigation::field.parent.placeholder.links','anomaly.module.navigation::field.parent.instructions.links'),
	(44,44,'en','anomaly.module.navigation::field.allowed_roles.label.links','anomaly.module.navigation::field.allowed_roles.warning.links','anomaly.module.navigation::field.allowed_roles.placeholder.links','anomaly.module.navigation::field.allowed_roles.instructions.links'),
	(45,45,'en','anomaly.module.pages::field.str_id.label.pages','anomaly.module.pages::field.str_id.warning.pages','anomaly.module.pages::field.str_id.placeholder.pages','anomaly.module.pages::field.str_id.instructions.pages'),
	(46,46,'en','anomaly.module.pages::field.title.label.pages','anomaly.module.pages::field.title.warning.pages','anomaly.module.pages::field.title.placeholder.pages','anomaly.module.pages::field.title.instructions.pages'),
	(47,47,'en','anomaly.module.pages::field.slug.label.pages','anomaly.module.pages::field.slug.warning.pages','anomaly.module.pages::field.slug.placeholder.pages','anomaly.module.pages::field.slug.instructions.pages'),
	(48,48,'en','anomaly.module.pages::field.path.label.pages','anomaly.module.pages::field.path.warning.pages','anomaly.module.pages::field.path.placeholder.pages','anomaly.module.pages::field.path.instructions.pages'),
	(49,49,'en','anomaly.module.pages::field.type.label.pages','anomaly.module.pages::field.type.warning.pages','anomaly.module.pages::field.type.placeholder.pages','anomaly.module.pages::field.type.instructions.pages'),
	(50,50,'en','anomaly.module.pages::field.entry.label.pages','anomaly.module.pages::field.entry.warning.pages','anomaly.module.pages::field.entry.placeholder.pages','anomaly.module.pages::field.entry.instructions.pages'),
	(51,51,'en','anomaly.module.pages::field.parent.label.pages','anomaly.module.pages::field.parent.warning.pages','anomaly.module.pages::field.parent.placeholder.pages','anomaly.module.pages::field.parent.instructions.pages'),
	(52,52,'en','anomaly.module.pages::field.visible.label.pages','anomaly.module.pages::field.visible.warning.pages','anomaly.module.pages::field.visible.placeholder.pages','anomaly.module.pages::field.visible.instructions.pages'),
	(53,53,'en','anomaly.module.pages::field.enabled.label.pages','anomaly.module.pages::field.enabled.warning.pages','anomaly.module.pages::field.enabled.placeholder.pages','anomaly.module.pages::field.enabled.instructions.pages'),
	(54,54,'en','anomaly.module.pages::field.exact.label.pages','anomaly.module.pages::field.exact.warning.pages','anomaly.module.pages::field.exact.placeholder.pages','anomaly.module.pages::field.exact.instructions.pages'),
	(55,55,'en','anomaly.module.pages::field.home.label.pages','anomaly.module.pages::field.home.warning.pages','anomaly.module.pages::field.home.placeholder.pages','anomaly.module.pages::field.home.instructions.pages'),
	(56,56,'en','anomaly.module.pages::field.meta_title.label.pages','anomaly.module.pages::field.meta_title.warning.pages','anomaly.module.pages::field.meta_title.placeholder.pages','anomaly.module.pages::field.meta_title.instructions.pages'),
	(57,57,'en','anomaly.module.pages::field.meta_description.label.pages','anomaly.module.pages::field.meta_description.warning.pages','anomaly.module.pages::field.meta_description.placeholder.pages','anomaly.module.pages::field.meta_description.instructions.pages'),
	(58,58,'en','anomaly.module.pages::field.meta_keywords.label.pages','anomaly.module.pages::field.meta_keywords.warning.pages','anomaly.module.pages::field.meta_keywords.placeholder.pages','anomaly.module.pages::field.meta_keywords.instructions.pages'),
	(59,59,'en','anomaly.module.pages::field.theme_layout.label.pages','anomaly.module.pages::field.theme_layout.warning.pages','anomaly.module.pages::field.theme_layout.placeholder.pages','anomaly.module.pages::field.theme_layout.instructions.pages'),
	(60,60,'en','anomaly.module.pages::field.allowed_roles.label.pages','anomaly.module.pages::field.allowed_roles.warning.pages','anomaly.module.pages::field.allowed_roles.placeholder.pages','anomaly.module.pages::field.allowed_roles.instructions.pages'),
	(61,61,'en','anomaly.module.pages::field.name.label.types','anomaly.module.pages::field.name.warning.types','anomaly.module.pages::field.name.placeholder.types','anomaly.module.pages::field.name.instructions.types'),
	(62,62,'en','anomaly.module.pages::field.slug.label.types','anomaly.module.pages::field.slug.warning.types','anomaly.module.pages::field.slug.placeholder.types','anomaly.module.pages::field.slug.instructions.types'),
	(63,63,'en','anomaly.module.pages::field.description.label.types','anomaly.module.pages::field.description.warning.types','anomaly.module.pages::field.description.placeholder.types','anomaly.module.pages::field.description.instructions.types'),
	(64,64,'en','anomaly.module.pages::field.theme_layout.label.types','anomaly.module.pages::field.theme_layout.warning.types','anomaly.module.pages::field.theme_layout.placeholder.types','anomaly.module.pages::field.theme_layout.instructions.types'),
	(65,65,'en','anomaly.module.pages::field.layout.label.types','anomaly.module.pages::field.layout.warning.types','anomaly.module.pages::field.layout.placeholder.types','anomaly.module.pages::field.layout.instructions.types'),
	(66,66,'en','anomaly.module.pages::field.handler.label.types','anomaly.module.pages::field.handler.warning.types','anomaly.module.pages::field.handler.placeholder.types','anomaly.module.pages::field.handler.instructions.types'),
	(67,67,'en','anomaly.module.posts::field.name.label.categories','anomaly.module.posts::field.name.warning.categories','anomaly.module.posts::field.name.placeholder.categories','anomaly.module.posts::field.name.instructions.categories'),
	(68,68,'en','anomaly.module.posts::field.slug.label.categories','anomaly.module.posts::field.slug.warning.categories','anomaly.module.posts::field.slug.placeholder.categories','anomaly.module.posts::field.slug.instructions.categories'),
	(69,69,'en','anomaly.module.posts::field.description.label.categories','anomaly.module.posts::field.description.warning.categories','anomaly.module.posts::field.description.placeholder.categories','anomaly.module.posts::field.description.instructions.categories'),
	(70,70,'en','anomaly.module.posts::field.str_id.label.posts','anomaly.module.posts::field.str_id.warning.posts','anomaly.module.posts::field.str_id.placeholder.posts','anomaly.module.posts::field.str_id.instructions.posts'),
	(71,71,'en','anomaly.module.posts::field.title.label.posts','anomaly.module.posts::field.title.warning.posts','anomaly.module.posts::field.title.placeholder.posts','anomaly.module.posts::field.title.instructions.posts'),
	(72,72,'en','anomaly.module.posts::field.summary.label.posts','anomaly.module.posts::field.summary.warning.posts','anomaly.module.posts::field.summary.placeholder.posts','anomaly.module.posts::field.summary.instructions.posts'),
	(73,73,'en','anomaly.module.posts::field.slug.label.posts','anomaly.module.posts::field.slug.warning.posts','anomaly.module.posts::field.slug.placeholder.posts','anomaly.module.posts::field.slug.instructions.posts'),
	(74,74,'en','anomaly.module.posts::field.type.label.posts','anomaly.module.posts::field.type.warning.posts','anomaly.module.posts::field.type.placeholder.posts','anomaly.module.posts::field.type.instructions.posts'),
	(75,75,'en','anomaly.module.posts::field.publish_at.label.posts','anomaly.module.posts::field.publish_at.warning.posts','anomaly.module.posts::field.publish_at.placeholder.posts','anomaly.module.posts::field.publish_at.instructions.posts'),
	(76,76,'en','anomaly.module.posts::field.author.label.posts','anomaly.module.posts::field.author.warning.posts','anomaly.module.posts::field.author.placeholder.posts','anomaly.module.posts::field.author.instructions.posts'),
	(77,77,'en','anomaly.module.posts::field.entry.label.posts','anomaly.module.posts::field.entry.warning.posts','anomaly.module.posts::field.entry.placeholder.posts','anomaly.module.posts::field.entry.instructions.posts'),
	(78,78,'en','anomaly.module.posts::field.meta_title.label.posts','anomaly.module.posts::field.meta_title.warning.posts','anomaly.module.posts::field.meta_title.placeholder.posts','anomaly.module.posts::field.meta_title.instructions.posts'),
	(79,79,'en','anomaly.module.posts::field.meta_description.label.posts','anomaly.module.posts::field.meta_description.warning.posts','anomaly.module.posts::field.meta_description.placeholder.posts','anomaly.module.posts::field.meta_description.instructions.posts'),
	(80,80,'en','anomaly.module.posts::field.meta_keywords.label.posts','anomaly.module.posts::field.meta_keywords.warning.posts','anomaly.module.posts::field.meta_keywords.placeholder.posts','anomaly.module.posts::field.meta_keywords.instructions.posts'),
	(81,81,'en','anomaly.module.posts::field.category.label.posts','anomaly.module.posts::field.category.warning.posts','anomaly.module.posts::field.category.placeholder.posts','anomaly.module.posts::field.category.instructions.posts'),
	(82,82,'en','anomaly.module.posts::field.featured.label.posts','anomaly.module.posts::field.featured.warning.posts','anomaly.module.posts::field.featured.placeholder.posts','anomaly.module.posts::field.featured.instructions.posts'),
	(83,83,'en','anomaly.module.posts::field.enabled.label.posts','anomaly.module.posts::field.enabled.warning.posts','anomaly.module.posts::field.enabled.placeholder.posts','anomaly.module.posts::field.enabled.instructions.posts'),
	(84,84,'en','anomaly.module.posts::field.tags.label.posts','anomaly.module.posts::field.tags.warning.posts','anomaly.module.posts::field.tags.placeholder.posts','anomaly.module.posts::field.tags.instructions.posts'),
	(85,85,'en','anomaly.module.posts::field.name.label.types','anomaly.module.posts::field.name.warning.types','anomaly.module.posts::field.name.placeholder.types','anomaly.module.posts::field.name.instructions.types'),
	(86,86,'en','anomaly.module.posts::field.slug.label.types','anomaly.module.posts::field.slug.warning.types','anomaly.module.posts::field.slug.placeholder.types','anomaly.module.posts::field.slug.instructions.types'),
	(87,87,'en','anomaly.module.posts::field.layout.label.types','anomaly.module.posts::field.layout.warning.types','anomaly.module.posts::field.layout.placeholder.types','anomaly.module.posts::field.layout.instructions.types'),
	(88,88,'en','anomaly.module.posts::field.theme_layout.label.types','anomaly.module.posts::field.theme_layout.warning.types','anomaly.module.posts::field.theme_layout.placeholder.types','anomaly.module.posts::field.theme_layout.instructions.types'),
	(89,89,'en','anomaly.module.posts::field.description.label.types','anomaly.module.posts::field.description.warning.types','anomaly.module.posts::field.description.placeholder.types','anomaly.module.posts::field.description.instructions.types'),
	(90,90,'en','anomaly.module.preferences::field.user.label.preferences','anomaly.module.preferences::field.user.warning.preferences','anomaly.module.preferences::field.user.placeholder.preferences','anomaly.module.preferences::field.user.instructions.preferences'),
	(91,91,'en','anomaly.module.preferences::field.key.label.preferences','anomaly.module.preferences::field.key.warning.preferences','anomaly.module.preferences::field.key.placeholder.preferences','anomaly.module.preferences::field.key.instructions.preferences'),
	(92,92,'en','anomaly.module.preferences::field.value.label.preferences','anomaly.module.preferences::field.value.warning.preferences','anomaly.module.preferences::field.value.placeholder.preferences','anomaly.module.preferences::field.value.instructions.preferences'),
	(93,93,'en','anomaly.module.redirects::field.from.label.redirects','anomaly.module.redirects::field.from.warning.redirects','anomaly.module.redirects::field.from.placeholder.redirects','anomaly.module.redirects::field.from.instructions.redirects'),
	(94,94,'en','anomaly.module.redirects::field.to.label.redirects','anomaly.module.redirects::field.to.warning.redirects','anomaly.module.redirects::field.to.placeholder.redirects','anomaly.module.redirects::field.to.instructions.redirects'),
	(95,95,'en','anomaly.module.redirects::field.status.label.redirects','anomaly.module.redirects::field.status.warning.redirects','anomaly.module.redirects::field.status.placeholder.redirects','anomaly.module.redirects::field.status.instructions.redirects'),
	(96,96,'en','anomaly.module.redirects::field.secure.label.redirects','anomaly.module.redirects::field.secure.warning.redirects','anomaly.module.redirects::field.secure.placeholder.redirects','anomaly.module.redirects::field.secure.instructions.redirects'),
	(97,97,'en','anomaly.module.settings::field.key.label.settings','anomaly.module.settings::field.key.warning.settings','anomaly.module.settings::field.key.placeholder.settings','anomaly.module.settings::field.key.instructions.settings'),
	(98,98,'en','anomaly.module.settings::field.value.label.settings','anomaly.module.settings::field.value.warning.settings','anomaly.module.settings::field.value.placeholder.settings','anomaly.module.settings::field.value.instructions.settings'),
	(99,99,'en','anomaly.module.users::field.email.label.users','anomaly.module.users::field.email.warning.users','anomaly.module.users::field.email.placeholder.users','anomaly.module.users::field.email.instructions.users'),
	(100,100,'en','anomaly.module.users::field.username.label.users','anomaly.module.users::field.username.warning.users','anomaly.module.users::field.username.placeholder.users','anomaly.module.users::field.username.instructions.users'),
	(101,101,'en','anomaly.module.users::field.password.label.users','anomaly.module.users::field.password.warning.users','anomaly.module.users::field.password.placeholder.users','anomaly.module.users::field.password.instructions.users'),
	(102,102,'en','anomaly.module.users::field.roles.label.users','anomaly.module.users::field.roles.warning.users','anomaly.module.users::field.roles.placeholder.users','anomaly.module.users::field.roles.instructions.users'),
	(103,103,'en','anomaly.module.users::field.display_name.label.users','anomaly.module.users::field.display_name.warning.users','anomaly.module.users::field.display_name.placeholder.users','anomaly.module.users::field.display_name.instructions.users'),
	(104,104,'en','anomaly.module.users::field.first_name.label.users','anomaly.module.users::field.first_name.warning.users','anomaly.module.users::field.first_name.placeholder.users','anomaly.module.users::field.first_name.instructions.users'),
	(105,105,'en','anomaly.module.users::field.last_name.label.users','anomaly.module.users::field.last_name.warning.users','anomaly.module.users::field.last_name.placeholder.users','anomaly.module.users::field.last_name.instructions.users'),
	(106,106,'en','anomaly.module.users::field.activated.label.users','anomaly.module.users::field.activated.warning.users','anomaly.module.users::field.activated.placeholder.users','anomaly.module.users::field.activated.instructions.users'),
	(107,107,'en','anomaly.module.users::field.enabled.label.users','anomaly.module.users::field.enabled.warning.users','anomaly.module.users::field.enabled.placeholder.users','anomaly.module.users::field.enabled.instructions.users'),
	(108,108,'en','anomaly.module.users::field.permissions.label.users','anomaly.module.users::field.permissions.warning.users','anomaly.module.users::field.permissions.placeholder.users','anomaly.module.users::field.permissions.instructions.users'),
	(109,109,'en','anomaly.module.users::field.last_login_at.label.users','anomaly.module.users::field.last_login_at.warning.users','anomaly.module.users::field.last_login_at.placeholder.users','anomaly.module.users::field.last_login_at.instructions.users'),
	(110,110,'en','anomaly.module.users::field.remember_token.label.users','anomaly.module.users::field.remember_token.warning.users','anomaly.module.users::field.remember_token.placeholder.users','anomaly.module.users::field.remember_token.instructions.users'),
	(111,111,'en','anomaly.module.users::field.activation_code.label.users','anomaly.module.users::field.activation_code.warning.users','anomaly.module.users::field.activation_code.placeholder.users','anomaly.module.users::field.activation_code.instructions.users'),
	(112,112,'en','anomaly.module.users::field.reset_code.label.users','anomaly.module.users::field.reset_code.warning.users','anomaly.module.users::field.reset_code.placeholder.users','anomaly.module.users::field.reset_code.instructions.users'),
	(113,113,'en','anomaly.module.users::field.last_activity_at.label.users','anomaly.module.users::field.last_activity_at.warning.users','anomaly.module.users::field.last_activity_at.placeholder.users','anomaly.module.users::field.last_activity_at.instructions.users'),
	(114,114,'en','anomaly.module.users::field.ip_address.label.users','anomaly.module.users::field.ip_address.warning.users','anomaly.module.users::field.ip_address.placeholder.users','anomaly.module.users::field.ip_address.instructions.users'),
	(115,115,'en','anomaly.module.users::field.name.label.roles','anomaly.module.users::field.name.warning.roles','anomaly.module.users::field.name.placeholder.roles','anomaly.module.users::field.name.instructions.roles'),
	(116,116,'en','anomaly.module.users::field.slug.label.roles','anomaly.module.users::field.slug.warning.roles','anomaly.module.users::field.slug.placeholder.roles','anomaly.module.users::field.slug.instructions.roles'),
	(117,117,'en','anomaly.module.users::field.description.label.roles','anomaly.module.users::field.description.warning.roles','anomaly.module.users::field.description.placeholder.roles','anomaly.module.users::field.description.instructions.roles'),
	(118,118,'en','anomaly.module.users::field.permissions.label.roles','anomaly.module.users::field.permissions.warning.roles','anomaly.module.users::field.permissions.placeholder.roles','anomaly.module.users::field.permissions.instructions.roles'),
	(119,119,'en','anomaly.extension.page_link_type::field.title.label.pages','anomaly.extension.page_link_type::field.title.warning.pages','anomaly.extension.page_link_type::field.title.placeholder.pages','anomaly.extension.page_link_type::field.title.instructions.pages'),
	(120,120,'en','anomaly.extension.page_link_type::field.page.label.pages','anomaly.extension.page_link_type::field.page.warning.pages','anomaly.extension.page_link_type::field.page.placeholder.pages','anomaly.extension.page_link_type::field.page.instructions.pages'),
	(121,121,'en','anomaly.extension.page_link_type::field.description.label.pages','anomaly.extension.page_link_type::field.description.warning.pages','anomaly.extension.page_link_type::field.description.placeholder.pages','anomaly.extension.page_link_type::field.description.instructions.pages'),
	(122,122,'en','anomaly.extension.url_link_type::field.title.label.urls','anomaly.extension.url_link_type::field.title.warning.urls','anomaly.extension.url_link_type::field.title.placeholder.urls','anomaly.extension.url_link_type::field.title.instructions.urls'),
	(123,123,'en','anomaly.extension.url_link_type::field.url.label.urls','anomaly.extension.url_link_type::field.url.warning.urls','anomaly.extension.url_link_type::field.url.placeholder.urls','anomaly.extension.url_link_type::field.url.instructions.urls'),
	(124,124,'en','anomaly.extension.url_link_type::field.description.label.urls','anomaly.extension.url_link_type::field.description.warning.urls','anomaly.extension.url_link_type::field.description.placeholder.urls','anomaly.extension.url_link_type::field.description.instructions.urls'),
	(126,126,'en',NULL,NULL,NULL,NULL),
	(127,127,'en',NULL,NULL,NULL,'Build up your page with stacked blocks of content.'),
	(128,128,'en',NULL,NULL,NULL,NULL),
	(129,129,'en',NULL,NULL,NULL,NULL),
	(130,130,'en',NULL,NULL,NULL,NULL),
	(131,131,'en',NULL,NULL,NULL,NULL),
	(132,132,'en',NULL,NULL,NULL,NULL),
	(133,133,'en',NULL,NULL,NULL,'Specify the title for the sidebar.'),
	(134,134,'en',NULL,NULL,NULL,'Specify the callout items listed in the sidebar.'),
	(135,135,'en','anomaly.module.forms::field.form_name.label.forms','anomaly.module.forms::field.form_name.warning.forms','anomaly.module.forms::field.form_name.placeholder.forms','anomaly.module.forms::field.form_name.instructions.forms'),
	(136,136,'en','anomaly.module.forms::field.form_description.label.forms','anomaly.module.forms::field.form_description.warning.forms','anomaly.module.forms::field.form_description.placeholder.forms','anomaly.module.forms::field.form_description.instructions.forms'),
	(137,137,'en','anomaly.module.forms::field.form_slug.label.forms','anomaly.module.forms::field.form_slug.warning.forms','anomaly.module.forms::field.form_slug.placeholder.forms','anomaly.module.forms::field.form_slug.instructions.forms'),
	(138,138,'en','anomaly.module.forms::field.form_handler.label.forms','anomaly.module.forms::field.form_handler.warning.forms','anomaly.module.forms::field.form_handler.placeholder.forms','anomaly.module.forms::field.form_handler.instructions.forms'),
	(139,139,'en','anomaly.module.forms::field.form_view_options.label.forms','anomaly.module.forms::field.form_view_options.warning.forms','anomaly.module.forms::field.form_view_options.placeholder.forms','anomaly.module.forms::field.form_view_options.instructions.forms'),
	(140,140,'en','anomaly.module.forms::field.success_message.label.forms','anomaly.module.forms::field.success_message.warning.forms','anomaly.module.forms::field.success_message.placeholder.forms','anomaly.module.forms::field.success_message.instructions.forms'),
	(141,141,'en','anomaly.module.forms::field.success_redirect.label.forms','anomaly.module.forms::field.success_redirect.warning.forms','anomaly.module.forms::field.success_redirect.placeholder.forms','anomaly.module.forms::field.success_redirect.instructions.forms'),
	(142,142,'en','anomaly.module.forms::field.send_notification.label.forms','anomaly.module.forms::field.send_notification.warning.forms','anomaly.module.forms::field.send_notification.placeholder.forms','anomaly.module.forms::field.send_notification.instructions.forms'),
	(143,143,'en','anomaly.module.forms::field.notification_send_to.label.forms','anomaly.module.forms::field.notification_send_to.warning.forms','anomaly.module.forms::field.notification_send_to.placeholder.forms','anomaly.module.forms::field.notification_send_to.instructions.forms'),
	(144,144,'en','anomaly.module.forms::field.notification_cc.label.forms','anomaly.module.forms::field.notification_cc.warning.forms','anomaly.module.forms::field.notification_cc.placeholder.forms','anomaly.module.forms::field.notification_cc.instructions.forms'),
	(145,145,'en','anomaly.module.forms::field.notification_bcc.label.forms','anomaly.module.forms::field.notification_bcc.warning.forms','anomaly.module.forms::field.notification_bcc.placeholder.forms','anomaly.module.forms::field.notification_bcc.instructions.forms'),
	(146,146,'en','anomaly.module.forms::field.notification.label.forms','anomaly.module.forms::field.notification.warning.forms','anomaly.module.forms::field.notification.placeholder.forms','anomaly.module.forms::field.notification.instructions.forms'),
	(147,147,'en','anomaly.module.forms::field.send_autoresponder.label.forms','anomaly.module.forms::field.send_autoresponder.warning.forms','anomaly.module.forms::field.send_autoresponder.placeholder.forms','anomaly.module.forms::field.send_autoresponder.instructions.forms'),
	(148,148,'en','anomaly.module.forms::field.user_email_field.label.forms','anomaly.module.forms::field.user_email_field.warning.forms','anomaly.module.forms::field.user_email_field.placeholder.forms','anomaly.module.forms::field.user_email_field.instructions.forms'),
	(149,149,'en','anomaly.module.forms::field.autoresponder.label.forms','anomaly.module.forms::field.autoresponder.warning.forms','anomaly.module.forms::field.autoresponder.placeholder.forms','anomaly.module.forms::field.autoresponder.instructions.forms'),
	(150,150,'en','anomaly.module.forms::field.notification_name.label.notifications','anomaly.module.forms::field.notification_name.warning.notifications','anomaly.module.forms::field.notification_name.placeholder.notifications','anomaly.module.forms::field.notification_name.instructions.notifications'),
	(151,151,'en','anomaly.module.forms::field.notification_description.label.notifications','anomaly.module.forms::field.notification_description.warning.notifications','anomaly.module.forms::field.notification_description.placeholder.notifications','anomaly.module.forms::field.notification_description.instructions.notifications'),
	(152,152,'en','anomaly.module.forms::field.notification_slug.label.notifications','anomaly.module.forms::field.notification_slug.warning.notifications','anomaly.module.forms::field.notification_slug.placeholder.notifications','anomaly.module.forms::field.notification_slug.instructions.notifications'),
	(153,153,'en','anomaly.module.forms::field.notification_email_layout.label.notifications','anomaly.module.forms::field.notification_email_layout.warning.notifications','anomaly.module.forms::field.notification_email_layout.placeholder.notifications','anomaly.module.forms::field.notification_email_layout.instructions.notifications'),
	(154,154,'en','anomaly.module.forms::field.notification_content.label.notifications','anomaly.module.forms::field.notification_content.warning.notifications','anomaly.module.forms::field.notification_content.placeholder.notifications','anomaly.module.forms::field.notification_content.instructions.notifications'),
	(155,155,'en','anomaly.module.forms::field.notification_from_name.label.notifications','anomaly.module.forms::field.notification_from_name.warning.notifications','anomaly.module.forms::field.notification_from_name.placeholder.notifications','anomaly.module.forms::field.notification_from_name.instructions.notifications'),
	(156,156,'en','anomaly.module.forms::field.notification_from_email.label.notifications','anomaly.module.forms::field.notification_from_email.warning.notifications','anomaly.module.forms::field.notification_from_email.placeholder.notifications','anomaly.module.forms::field.notification_from_email.instructions.notifications'),
	(157,157,'en','anomaly.module.forms::field.notification_reply_to_name.label.notifications','anomaly.module.forms::field.notification_reply_to_name.warning.notifications','anomaly.module.forms::field.notification_reply_to_name.placeholder.notifications','anomaly.module.forms::field.notification_reply_to_name.instructions.notifications'),
	(158,158,'en','anomaly.module.forms::field.notification_reply_to_email.label.notifications','anomaly.module.forms::field.notification_reply_to_email.warning.notifications','anomaly.module.forms::field.notification_reply_to_email.placeholder.notifications','anomaly.module.forms::field.notification_reply_to_email.instructions.notifications'),
	(159,159,'en','anomaly.module.forms::field.notification_subject.label.notifications','anomaly.module.forms::field.notification_subject.warning.notifications','anomaly.module.forms::field.notification_subject.placeholder.notifications','anomaly.module.forms::field.notification_subject.instructions.notifications'),
	(160,160,'en','anomaly.module.forms::field.include_attachments.label.notifications','anomaly.module.forms::field.include_attachments.warning.notifications','anomaly.module.forms::field.include_attachments.placeholder.notifications','anomaly.module.forms::field.include_attachments.instructions.notifications'),
	(161,161,'en',NULL,NULL,NULL,NULL),
	(162,162,'en',NULL,NULL,NULL,NULL),
	(163,163,'en',NULL,NULL,NULL,NULL),
	(164,164,'en',NULL,NULL,NULL,NULL),
	(165,165,'en',NULL,NULL,NULL,NULL),
	(166,166,'en',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_streams_assignments_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_fields`;

CREATE TABLE `grishamind_streams_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_fields` (`namespace`,`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_fields` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_fields` DISABLE KEYS */;

INSERT INTO `grishamind_streams_fields` (`id`, `namespace`, `slug`, `type`, `config`, `locked`)
VALUES
	(1,'configuration','scope','anomaly.field_type.text','a:0:{}',1),
	(2,'configuration','key','anomaly.field_type.text','a:0:{}',1),
	(3,'configuration','value','anomaly.field_type.textarea','a:0:{}',1),
	(4,'dashboard','name','anomaly.field_type.text','a:0:{}',1),
	(5,'dashboard','slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:4:\"name\";}',1),
	(6,'dashboard','description','anomaly.field_type.textarea','a:0:{}',1),
	(7,'dashboard','layout','anomaly.field_type.select','a:1:{s:7:\"options\";a:9:{i:24;s:48:\"anomaly.module.dashboard::field.layout.option.24\";s:5:\"12-12\";s:51:\"anomaly.module.dashboard::field.layout.option.12-12\";s:4:\"16-8\";s:50:\"anomaly.module.dashboard::field.layout.option.16-8\";s:4:\"8-16\";s:50:\"anomaly.module.dashboard::field.layout.option.8-16\";s:5:\"8-8-8\";s:51:\"anomaly.module.dashboard::field.layout.option.8-8-8\";s:6:\"6-12-6\";s:52:\"anomaly.module.dashboard::field.layout.option.6-12-6\";s:6:\"12-6-6\";s:52:\"anomaly.module.dashboard::field.layout.option.12-6-6\";s:6:\"6-6-12\";s:52:\"anomaly.module.dashboard::field.layout.option.6-6-12\";s:7:\"6-6-6-6\";s:53:\"anomaly.module.dashboard::field.layout.option.6-6-6-6\";}}',1),
	(8,'dashboard','title','anomaly.field_type.text','a:0:{}',1),
	(9,'dashboard','extension','anomaly.field_type.addon','a:2:{s:4:\"type\";s:9:\"extension\";s:6:\"search\";s:34:\"anomaly.module.dashboard::widget.*\";}',1),
	(10,'dashboard','column','anomaly.field_type.integer','a:2:{s:3:\"min\";i:1;s:13:\"default_value\";i:1;}',1),
	(11,'dashboard','pinned','anomaly.field_type.boolean','a:0:{}',1),
	(12,'dashboard','dashboard','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:48:\"Anomaly\\DashboardModule\\Dashboard\\DashboardModel\";}',1),
	(13,'dashboard','allowed_roles','anomaly.field_type.multiple','a:1:{s:7:\"related\";s:34:\"Anomaly\\UsersModule\\Role\\RoleModel\";}',1),
	(14,'files','name','anomaly.field_type.text','a:0:{}',1),
	(15,'files','slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:4:\"name\";}',1),
	(16,'files','adapter','anomaly.field_type.addon','a:2:{s:4:\"type\";s:10:\"extensions\";s:6:\"search\";s:31:\"anomaly.module.files::adapter.*\";}',1),
	(17,'files','folder','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:38:\"Anomaly\\FilesModule\\Folder\\FolderModel\";}',1),
	(18,'files','disk','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:34:\"Anomaly\\FilesModule\\Disk\\DiskModel\";}',1),
	(19,'files','entry','anomaly.field_type.polymorphic','a:0:{}',1),
	(20,'files','description','anomaly.field_type.textarea','a:0:{}',1),
	(21,'files','allowed_types','anomaly.field_type.tags','a:0:{}',1),
	(22,'files','keywords','anomaly.field_type.tags','a:0:{}',1),
	(23,'files','extension','anomaly.field_type.text','a:0:{}',1),
	(24,'files','width','anomaly.field_type.text','a:0:{}',1),
	(25,'files','height','anomaly.field_type.text','a:0:{}',1),
	(26,'files','mime_type','anomaly.field_type.text','a:0:{}',1),
	(27,'files','size','anomaly.field_type.integer','a:0:{}',1),
	(28,'navigation','name','anomaly.field_type.text','a:0:{}',1),
	(29,'navigation','class','anomaly.field_type.text','a:0:{}',1),
	(30,'navigation','description','anomaly.field_type.textarea','a:0:{}',1),
	(31,'navigation','entry','anomaly.field_type.polymorphic','a:0:{}',1),
	(32,'navigation','slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:4:\"name\";}',1),
	(33,'navigation','menu','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:39:\"Anomaly\\NavigationModule\\Menu\\MenuModel\";}',1),
	(34,'navigation','parent','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:39:\"Anomaly\\NavigationModule\\Link\\LinkModel\";}',1),
	(35,'navigation','allowed_roles','anomaly.field_type.multiple','a:1:{s:7:\"related\";s:34:\"Anomaly\\UsersModule\\Role\\RoleModel\";}',1),
	(36,'navigation','type','anomaly.field_type.addon','a:2:{s:4:\"type\";s:9:\"extension\";s:6:\"search\";s:38:\"anomaly.module.navigation::link_type.*\";}',1),
	(37,'navigation','target','anomaly.field_type.select','a:2:{s:13:\"default_value\";s:5:\"_self\";s:7:\"options\";a:2:{s:5:\"_self\";s:51:\"anomaly.module.navigation::field.target.option.self\";s:6:\"_blank\";s:52:\"anomaly.module.navigation::field.target.option.blank\";}}',1),
	(38,'pages','str_id','anomaly.field_type.text','a:0:{}',1),
	(39,'pages','title','anomaly.field_type.text','a:0:{}',1),
	(40,'pages','slug','anomaly.field_type.slug','a:2:{s:7:\"slugify\";s:5:\"title\";s:4:\"type\";s:1:\"-\";}',1),
	(42,'pages','path','anomaly.field_type.text','a:0:{}',1),
	(43,'pages','enabled','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:1;}',1),
	(44,'pages','home','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:0;}',1),
	(45,'pages','meta_title','anomaly.field_type.text','a:0:{}',1),
	(46,'pages','meta_description','anomaly.field_type.textarea','a:0:{}',1),
	(47,'pages','meta_keywords','anomaly.field_type.tags','a:0:{}',1),
	(48,'pages','layout','anomaly.field_type.editor','a:2:{s:13:\"default_value\";s:25:\"<h1>{{ page.title }}</h1>\";s:4:\"mode\";s:4:\"twig\";}',1),
	(49,'pages','allowed_roles','anomaly.field_type.multiple','a:1:{s:7:\"related\";s:34:\"Anomaly\\UsersModule\\Role\\RoleModel\";}',1),
	(50,'pages','parent','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:34:\"Anomaly\\PagesModule\\Page\\PageModel\";}',1),
	(51,'pages','theme_layout','anomaly.field_type.select','a:2:{s:13:\"default_value\";s:27:\"theme::layouts/default.twig\";s:7:\"handler\";s:46:\"Anomaly\\SelectFieldType\\Handler\\Layouts@handle\";}',1),
	(52,'pages','type','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:34:\"Anomaly\\PagesModule\\Type\\TypeModel\";}',1),
	(53,'pages','handler','anomaly.field_type.addon','a:3:{s:4:\"type\";s:9:\"extension\";s:6:\"search\";s:31:\"anomaly.module.pages::handler.*\";s:13:\"default_value\";s:38:\"anomaly.extension.default_page_handler\";}',1),
	(54,'pages','visible','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:1;}',1),
	(55,'pages','exact','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:1;}',1),
	(56,'pages','entry','anomaly.field_type.polymorphic','a:0:{}',1),
	(57,'pages','name','anomaly.field_type.text','a:0:{}',1),
	(58,'pages','description','anomaly.field_type.textarea','a:0:{}',1),
	(59,'posts','str_id','anomaly.field_type.text','a:0:{}',1),
	(60,'posts','name','anomaly.field_type.text','a:0:{}',1),
	(61,'posts','title','anomaly.field_type.text','a:0:{}',1),
	(62,'posts','slug','anomaly.field_type.slug','a:2:{s:7:\"slugify\";s:5:\"title\";s:4:\"type\";s:1:\"-\";}',1),
	(63,'posts','content','anomaly.field_type.wysiwyg','a:0:{}',0),
	(64,'posts','type','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:34:\"Anomaly\\PostsModule\\Type\\TypeModel\";}',1),
	(65,'posts','tags','anomaly.field_type.tags','a:0:{}',1),
	(66,'posts','summary','anomaly.field_type.textarea','a:0:{}',1),
	(67,'posts','description','anomaly.field_type.textarea','a:0:{}',1),
	(68,'posts','publish_at','anomaly.field_type.datetime','a:0:{}',1),
	(69,'posts','entry','anomaly.field_type.polymorphic','a:0:{}',1),
	(70,'posts','author','anomaly.field_type.relationship','a:2:{s:4:\"mode\";s:6:\"lookup\";s:7:\"related\";s:34:\"Anomaly\\UsersModule\\User\\UserModel\";}',1),
	(71,'posts','layout','anomaly.field_type.editor','a:2:{s:13:\"default_value\";s:22:\"{{ post.content|raw }}\";s:4:\"mode\";s:4:\"twig\";}',1),
	(72,'posts','category','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:42:\"Anomaly\\PostsModule\\Category\\CategoryModel\";}',1),
	(73,'posts','enabled','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:0;}',1),
	(74,'posts','featured','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:0;}',1),
	(75,'posts','meta_title','anomaly.field_type.text','a:0:{}',1),
	(76,'posts','meta_description','anomaly.field_type.textarea','a:0:{}',1),
	(77,'posts','meta_keywords','anomaly.field_type.tags','a:0:{}',1),
	(78,'posts','ttl','anomaly.field_type.integer','a:3:{s:3:\"min\";i:0;s:4:\"step\";i:1;s:4:\"page\";i:5;}',1),
	(79,'posts','theme_layout','anomaly.field_type.select','a:1:{s:7:\"handler\";s:39:\"Anomaly\\SelectFieldType\\Handler\\Layouts\";}',1),
	(80,'preferences','user','anomaly.field_type.relationship','a:2:{s:4:\"mode\";s:6:\"lookup\";s:7:\"related\";s:34:\"Anomaly\\UsersModule\\User\\UserModel\";}',1),
	(81,'preferences','key','anomaly.field_type.text','a:0:{}',1),
	(82,'preferences','value','anomaly.field_type.textarea','a:0:{}',1),
	(83,'redirects','from','anomaly.field_type.text','a:0:{}',1),
	(84,'redirects','to','anomaly.field_type.text','a:0:{}',1),
	(85,'redirects','status','anomaly.field_type.select','a:2:{s:13:\"default_value\";s:3:\"301\";s:7:\"options\";a:2:{i:301;s:49:\"anomaly.module.redirects::field.status.option.301\";i:302;s:49:\"anomaly.module.redirects::field.status.option.302\";}}',1),
	(86,'redirects','secure','anomaly.field_type.boolean','a:0:{}',1),
	(87,'settings','key','anomaly.field_type.text','a:0:{}',1),
	(88,'settings','value','anomaly.field_type.textarea','a:0:{}',1),
	(89,'users','email','anomaly.field_type.email','a:0:{}',1),
	(90,'users','username','anomaly.field_type.slug','a:2:{s:4:\"type\";s:1:\"_\";s:9:\"lowercase\";b:0;}',1),
	(91,'users','password','anomaly.field_type.text','a:1:{s:4:\"type\";s:8:\"password\";}',1),
	(92,'users','remember_token','anomaly.field_type.text','a:0:{}',1),
	(93,'users','ip_address','anomaly.field_type.text','a:0:{}',1),
	(94,'users','last_login_at','anomaly.field_type.datetime','a:0:{}',1),
	(95,'users','last_activity_at','anomaly.field_type.datetime','a:0:{}',1),
	(96,'users','permissions','anomaly.field_type.checkboxes','a:0:{}',1),
	(97,'users','display_name','anomaly.field_type.text','a:0:{}',1),
	(98,'users','first_name','anomaly.field_type.text','a:0:{}',1),
	(99,'users','last_name','anomaly.field_type.text','a:0:{}',1),
	(100,'users','name','anomaly.field_type.text','a:0:{}',1),
	(101,'users','description','anomaly.field_type.textarea','a:0:{}',1),
	(102,'users','reset_code','anomaly.field_type.text','a:0:{}',1),
	(103,'users','reset_code_expires_at','anomaly.field_type.datetime','a:0:{}',1),
	(104,'users','activation_code','anomaly.field_type.text','a:0:{}',1),
	(105,'users','activation_code_expires_at','anomaly.field_type.datetime','a:0:{}',1),
	(106,'users','activated','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:0;}',1),
	(107,'users','enabled','anomaly.field_type.boolean','a:1:{s:13:\"default_value\";b:1;}',1),
	(108,'users','slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:4:\"name\";}',1),
	(109,'users','roles','anomaly.field_type.multiple','a:1:{s:7:\"related\";s:34:\"Anomaly\\UsersModule\\Role\\RoleModel\";}',1),
	(110,'page_link_type','title','anomaly.field_type.text','a:0:{}',1),
	(111,'page_link_type','page','anomaly.field_type.relationship','a:2:{s:4:\"mode\";s:6:\"lookup\";s:7:\"related\";s:34:\"Anomaly\\PagesModule\\Page\\PageModel\";}',1),
	(112,'page_link_type','description','anomaly.field_type.textarea','a:0:{}',1),
	(113,'url_link_type','title','anomaly.field_type.text','a:0:{}',1),
	(114,'url_link_type','url','anomaly.field_type.text','a:0:{}',1),
	(115,'url_link_type','description','anomaly.field_type.textarea','a:0:{}',1),
	(116,'pages','content','anomaly.field_type.grid','a:4:{s:7:\"related\";N;s:7:\"add_row\";N;s:3:\"min\";N;s:3:\"max\";N;}',0),
	(117,'grid','content','anomaly.field_type.wysiwyg','a:4:{s:7:\"buttons\";a:8:{i:0;s:6:\"format\";i:1;s:4:\"bold\";i:2;s:6:\"italic\";i:3;s:7:\"deleted\";i:4;s:5:\"lists\";i:5;s:4:\"link\";i:6;s:14:\"horizontalrule\";i:7;s:9:\"underline\";}s:7:\"plugins\";a:8:{i:0;s:9:\"alignment\";i:1;s:11:\"inlinestyle\";i:2;s:5:\"table\";i:3;s:5:\"video\";i:4;s:11:\"filemanager\";i:5;s:12:\"imagemanager\";i:6;s:6:\"source\";i:7;s:10:\"fullscreen\";}s:6:\"height\";s:2:\"75\";s:11:\"line_breaks\";b:0;}',0),
	(118,'grid','html','anomaly.field_type.editor','a:4:{s:4:\"mode\";s:4:\"twig\";s:13:\"default_value\";N;s:6:\"height\";s:2:\"75\";s:9:\"word_wrap\";s:3:\"yes\";}',0),
	(119,'grid','images','anomaly.field_type.files','a:4:{s:7:\"folders\";a:1:{i:0;s:1:\"1\";}s:3:\"min\";N;s:3:\"max\";N;s:4:\"mode\";s:7:\"default\";}',0),
	(120,'pages','sidebar','anomaly.field_type.text','a:7:{s:4:\"type\";s:4:\"text\";s:4:\"mask\";N;s:3:\"min\";N;s:3:\"max\";N;s:12:\"show_counter\";b:0;s:9:\"suggested\";N;s:13:\"default_value\";N;}',0),
	(121,'repeater','text','anomaly.field_type.text','a:7:{s:4:\"type\";s:4:\"text\";s:4:\"mask\";N;s:3:\"min\";N;s:3:\"max\";N;s:12:\"show_counter\";b:0;s:9:\"suggested\";N;s:13:\"default_value\";N;}',0),
	(122,'pages','items','anomaly.field_type.repeater','a:4:{s:7:\"related\";s:62:\"Anomaly\\Streams\\Platform\\Model\\Repeater\\RepeaterItemEntryModel\";s:7:\"add_row\";s:8:\"Add Item\";s:3:\"min\";N;s:3:\"max\";N;}',0),
	(123,'forms','form_name','anomaly.field_type.text','a:0:{}',1),
	(124,'forms','form_description','anomaly.field_type.textarea','a:0:{}',1),
	(125,'forms','form_slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:9:\"form_name\";}',1),
	(126,'forms','form_handler','anomaly.field_type.addon','a:3:{s:4:\"type\";s:9:\"extension\";s:6:\"search\";s:36:\"anomaly.module.forms::form_handler.*\";s:13:\"default_value\";s:38:\"anomaly.extension.default_form_handler\";}',1),
	(127,'forms','form_view_options','anomaly.field_type.tags','a:2:{s:7:\"handler\";s:54:\"Anomaly\\FormsModule\\Form\\Form\\Field\\ViewOptions@handle\";s:19:\"allow_creating_tags\";b:0;}',1),
	(128,'forms','notification_name','anomaly.field_type.text','a:0:{}',1),
	(129,'forms','notification_description','anomaly.field_type.textarea','a:0:{}',1),
	(130,'forms','notification_slug','anomaly.field_type.slug','a:1:{s:7:\"slugify\";s:17:\"notification_name\";}',1),
	(131,'forms','notification_email_layout','anomaly.field_type.select','a:1:{s:7:\"handler\";s:6:\"emails\";}',1),
	(132,'forms','notification_content','anomaly.field_type.wysiwyg','a:1:{s:13:\"default_value\";s:170:\"<h3>{{ form.form_name }}</h3><p><a href=\"{{ url_previous() }}\">{{ url_previous() }}</a></p><hr><p><em>{{ form.form_description }}</em><br>{{ forms_input(input)|raw }}</p>\";}',1),
	(133,'forms','notification_from_name','anomaly.field_type.text','a:0:{}',1),
	(134,'forms','notification_from_email','anomaly.field_type.text','a:0:{}',1),
	(135,'forms','notification_reply_to_name','anomaly.field_type.text','a:0:{}',1),
	(136,'forms','notification_reply_to_email','anomaly.field_type.text','a:0:{}',1),
	(137,'forms','notification_subject','anomaly.field_type.text','a:0:{}',1),
	(138,'forms','notification_cc','anomaly.field_type.tags','a:1:{s:6:\"filter\";a:1:{i:0;s:21:\"FILTER_VALIDATE_EMAIL\";}}',1),
	(139,'forms','notification_bcc','anomaly.field_type.tags','a:1:{s:6:\"filter\";a:1:{i:0;s:21:\"FILTER_VALIDATE_EMAIL\";}}',1),
	(140,'forms','send_notification','anomaly.field_type.boolean','a:0:{}',1),
	(141,'forms','notification_send_to','anomaly.field_type.tags','a:1:{s:6:\"filter\";a:1:{i:0;s:21:\"FILTER_VALIDATE_EMAIL\";}}',1),
	(142,'forms','notification','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:50:\"Anomaly\\FormsModule\\Notification\\NotificationModel\";}',1),
	(143,'forms','send_autoresponder','anomaly.field_type.boolean','a:0:{}',1),
	(144,'forms','user_email_field','anomaly.field_type.relationship','a:4:{s:7:\"related\";s:41:\"Anomaly\\Streams\\Platform\\Field\\FieldModel\";s:7:\"handler\";s:6:\"fields\";s:9:\"namespace\";s:5:\"forms\";s:8:\"unlocked\";b:1;}',1),
	(145,'forms','autoresponder','anomaly.field_type.relationship','a:1:{s:7:\"related\";s:50:\"Anomaly\\FormsModule\\Notification\\NotificationModel\";}',1),
	(146,'forms','include_attachments','anomaly.field_type.boolean','a:0:{}',1),
	(147,'forms','success_message','anomaly.field_type.textarea','a:0:{}',1),
	(148,'forms','success_redirect','anomaly.field_type.text','a:0:{}',1),
	(149,'forms','name','anomaly.field_type.text','a:7:{s:4:\"type\";s:4:\"text\";s:4:\"mask\";N;s:3:\"min\";N;s:3:\"max\";N;s:12:\"show_counter\";b:0;s:9:\"suggested\";N;s:13:\"default_value\";N;}',0),
	(150,'forms','phone','anomaly.field_type.text','a:7:{s:4:\"type\";s:4:\"text\";s:4:\"mask\";N;s:3:\"min\";N;s:3:\"max\";N;s:12:\"show_counter\";b:0;s:9:\"suggested\";N;s:13:\"default_value\";N;}',0),
	(151,'forms','email','anomaly.field_type.text','a:7:{s:4:\"type\";s:4:\"text\";s:4:\"mask\";N;s:3:\"min\";N;s:3:\"max\";N;s:12:\"show_counter\";b:0;s:9:\"suggested\";N;s:13:\"default_value\";N;}',0),
	(152,'forms','subject','anomaly.field_type.select','a:3:{s:4:\"mode\";s:8:\"dropdown\";s:7:\"options\";s:14:\"Sales\r\nGeneral\";s:13:\"default_value\";N;}',0),
	(153,'forms','message','anomaly.field_type.textarea','a:4:{s:4:\"rows\";s:1:\"6\";s:3:\"min\";N;s:3:\"max\";N;s:13:\"default_value\";N;}',0);

/*!40000 ALTER TABLE `grishamind_streams_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_fields_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_fields_translations`;

CREATE TABLE `grishamind_streams_fields_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `streams_fields_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_fields_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_fields_translations` DISABLE KEYS */;

INSERT INTO `grishamind_streams_fields_translations` (`id`, `field_id`, `locale`, `name`, `placeholder`, `warning`, `instructions`)
VALUES
	(1,1,'en','anomaly.module.configuration::field.scope.name','anomaly.module.configuration::field.scope.placeholder','anomaly.module.configuration::field.scope.warning','anomaly.module.configuration::field.scope.instructions'),
	(2,2,'en','anomaly.module.configuration::field.key.name','anomaly.module.configuration::field.key.placeholder','anomaly.module.configuration::field.key.warning','anomaly.module.configuration::field.key.instructions'),
	(3,3,'en','anomaly.module.configuration::field.value.name','anomaly.module.configuration::field.value.placeholder','anomaly.module.configuration::field.value.warning','anomaly.module.configuration::field.value.instructions'),
	(4,4,'en','anomaly.module.dashboard::field.name.name','anomaly.module.dashboard::field.name.placeholder','anomaly.module.dashboard::field.name.warning','anomaly.module.dashboard::field.name.instructions'),
	(5,5,'en','anomaly.module.dashboard::field.slug.name','anomaly.module.dashboard::field.slug.placeholder','anomaly.module.dashboard::field.slug.warning','anomaly.module.dashboard::field.slug.instructions'),
	(6,6,'en','anomaly.module.dashboard::field.description.name','anomaly.module.dashboard::field.description.placeholder','anomaly.module.dashboard::field.description.warning','anomaly.module.dashboard::field.description.instructions'),
	(7,7,'en','anomaly.module.dashboard::field.layout.name','anomaly.module.dashboard::field.layout.placeholder','anomaly.module.dashboard::field.layout.warning','anomaly.module.dashboard::field.layout.instructions'),
	(8,8,'en','anomaly.module.dashboard::field.title.name','anomaly.module.dashboard::field.title.placeholder','anomaly.module.dashboard::field.title.warning','anomaly.module.dashboard::field.title.instructions'),
	(9,9,'en','anomaly.module.dashboard::field.extension.name','anomaly.module.dashboard::field.extension.placeholder','anomaly.module.dashboard::field.extension.warning','anomaly.module.dashboard::field.extension.instructions'),
	(10,10,'en','anomaly.module.dashboard::field.column.name','anomaly.module.dashboard::field.column.placeholder','anomaly.module.dashboard::field.column.warning','anomaly.module.dashboard::field.column.instructions'),
	(11,11,'en','anomaly.module.dashboard::field.pinned.name','anomaly.module.dashboard::field.pinned.placeholder','anomaly.module.dashboard::field.pinned.warning','anomaly.module.dashboard::field.pinned.instructions'),
	(12,12,'en','anomaly.module.dashboard::field.dashboard.name','anomaly.module.dashboard::field.dashboard.placeholder','anomaly.module.dashboard::field.dashboard.warning','anomaly.module.dashboard::field.dashboard.instructions'),
	(13,13,'en','anomaly.module.dashboard::field.allowed_roles.name','anomaly.module.dashboard::field.allowed_roles.placeholder','anomaly.module.dashboard::field.allowed_roles.warning','anomaly.module.dashboard::field.allowed_roles.instructions'),
	(14,14,'en','anomaly.module.files::field.name.name','anomaly.module.files::field.name.placeholder','anomaly.module.files::field.name.warning','anomaly.module.files::field.name.instructions'),
	(15,15,'en','anomaly.module.files::field.slug.name','anomaly.module.files::field.slug.placeholder','anomaly.module.files::field.slug.warning','anomaly.module.files::field.slug.instructions'),
	(16,16,'en','anomaly.module.files::field.adapter.name','anomaly.module.files::field.adapter.placeholder','anomaly.module.files::field.adapter.warning','anomaly.module.files::field.adapter.instructions'),
	(17,17,'en','anomaly.module.files::field.folder.name','anomaly.module.files::field.folder.placeholder','anomaly.module.files::field.folder.warning','anomaly.module.files::field.folder.instructions'),
	(18,18,'en','anomaly.module.files::field.disk.name','anomaly.module.files::field.disk.placeholder','anomaly.module.files::field.disk.warning','anomaly.module.files::field.disk.instructions'),
	(19,19,'en','anomaly.module.files::field.entry.name','anomaly.module.files::field.entry.placeholder','anomaly.module.files::field.entry.warning','anomaly.module.files::field.entry.instructions'),
	(20,20,'en','anomaly.module.files::field.description.name','anomaly.module.files::field.description.placeholder','anomaly.module.files::field.description.warning','anomaly.module.files::field.description.instructions'),
	(21,21,'en','anomaly.module.files::field.allowed_types.name','anomaly.module.files::field.allowed_types.placeholder','anomaly.module.files::field.allowed_types.warning','anomaly.module.files::field.allowed_types.instructions'),
	(22,22,'en','anomaly.module.files::field.keywords.name','anomaly.module.files::field.keywords.placeholder','anomaly.module.files::field.keywords.warning','anomaly.module.files::field.keywords.instructions'),
	(23,23,'en','anomaly.module.files::field.extension.name','anomaly.module.files::field.extension.placeholder','anomaly.module.files::field.extension.warning','anomaly.module.files::field.extension.instructions'),
	(24,24,'en','anomaly.module.files::field.width.name','anomaly.module.files::field.width.placeholder','anomaly.module.files::field.width.warning','anomaly.module.files::field.width.instructions'),
	(25,25,'en','anomaly.module.files::field.height.name','anomaly.module.files::field.height.placeholder','anomaly.module.files::field.height.warning','anomaly.module.files::field.height.instructions'),
	(26,26,'en','anomaly.module.files::field.mime_type.name','anomaly.module.files::field.mime_type.placeholder','anomaly.module.files::field.mime_type.warning','anomaly.module.files::field.mime_type.instructions'),
	(27,27,'en','anomaly.module.files::field.size.name','anomaly.module.files::field.size.placeholder','anomaly.module.files::field.size.warning','anomaly.module.files::field.size.instructions'),
	(28,28,'en','anomaly.module.navigation::field.name.name','anomaly.module.navigation::field.name.placeholder','anomaly.module.navigation::field.name.warning','anomaly.module.navigation::field.name.instructions'),
	(29,29,'en','anomaly.module.navigation::field.class.name','anomaly.module.navigation::field.class.placeholder','anomaly.module.navigation::field.class.warning','anomaly.module.navigation::field.class.instructions'),
	(30,30,'en','anomaly.module.navigation::field.description.name','anomaly.module.navigation::field.description.placeholder','anomaly.module.navigation::field.description.warning','anomaly.module.navigation::field.description.instructions'),
	(31,31,'en','anomaly.module.navigation::field.entry.name','anomaly.module.navigation::field.entry.placeholder','anomaly.module.navigation::field.entry.warning','anomaly.module.navigation::field.entry.instructions'),
	(32,32,'en','anomaly.module.navigation::field.slug.name','anomaly.module.navigation::field.slug.placeholder','anomaly.module.navigation::field.slug.warning','anomaly.module.navigation::field.slug.instructions'),
	(33,33,'en','anomaly.module.navigation::field.menu.name','anomaly.module.navigation::field.menu.placeholder','anomaly.module.navigation::field.menu.warning','anomaly.module.navigation::field.menu.instructions'),
	(34,34,'en','anomaly.module.navigation::field.parent.name','anomaly.module.navigation::field.parent.placeholder','anomaly.module.navigation::field.parent.warning','anomaly.module.navigation::field.parent.instructions'),
	(35,35,'en','anomaly.module.navigation::field.allowed_roles.name','anomaly.module.navigation::field.allowed_roles.placeholder','anomaly.module.navigation::field.allowed_roles.warning','anomaly.module.navigation::field.allowed_roles.instructions'),
	(36,36,'en','anomaly.module.navigation::field.type.name','anomaly.module.navigation::field.type.placeholder','anomaly.module.navigation::field.type.warning','anomaly.module.navigation::field.type.instructions'),
	(37,37,'en','anomaly.module.navigation::field.target.name','anomaly.module.navigation::field.target.placeholder','anomaly.module.navigation::field.target.warning','anomaly.module.navigation::field.target.instructions'),
	(38,38,'en','anomaly.module.pages::field.str_id.name','anomaly.module.pages::field.str_id.placeholder','anomaly.module.pages::field.str_id.warning','anomaly.module.pages::field.str_id.instructions'),
	(39,39,'en','anomaly.module.pages::field.title.name','anomaly.module.pages::field.title.placeholder','anomaly.module.pages::field.title.warning','anomaly.module.pages::field.title.instructions'),
	(40,40,'en','anomaly.module.pages::field.slug.name','anomaly.module.pages::field.slug.placeholder','anomaly.module.pages::field.slug.warning','anomaly.module.pages::field.slug.instructions'),
	(42,42,'en','anomaly.module.pages::field.path.name','anomaly.module.pages::field.path.placeholder','anomaly.module.pages::field.path.warning','anomaly.module.pages::field.path.instructions'),
	(43,43,'en','anomaly.module.pages::field.enabled.name','anomaly.module.pages::field.enabled.placeholder','anomaly.module.pages::field.enabled.warning','anomaly.module.pages::field.enabled.instructions'),
	(44,44,'en','anomaly.module.pages::field.home.name','anomaly.module.pages::field.home.placeholder','anomaly.module.pages::field.home.warning','anomaly.module.pages::field.home.instructions'),
	(45,45,'en','anomaly.module.pages::field.meta_title.name','anomaly.module.pages::field.meta_title.placeholder','anomaly.module.pages::field.meta_title.warning','anomaly.module.pages::field.meta_title.instructions'),
	(46,46,'en','anomaly.module.pages::field.meta_description.name','anomaly.module.pages::field.meta_description.placeholder','anomaly.module.pages::field.meta_description.warning','anomaly.module.pages::field.meta_description.instructions'),
	(47,47,'en','anomaly.module.pages::field.meta_keywords.name','anomaly.module.pages::field.meta_keywords.placeholder','anomaly.module.pages::field.meta_keywords.warning','anomaly.module.pages::field.meta_keywords.instructions'),
	(48,48,'en','anomaly.module.pages::field.layout.name','anomaly.module.pages::field.layout.placeholder','anomaly.module.pages::field.layout.warning','anomaly.module.pages::field.layout.instructions'),
	(49,49,'en','anomaly.module.pages::field.allowed_roles.name','anomaly.module.pages::field.allowed_roles.placeholder','anomaly.module.pages::field.allowed_roles.warning','anomaly.module.pages::field.allowed_roles.instructions'),
	(50,50,'en','anomaly.module.pages::field.parent.name','anomaly.module.pages::field.parent.placeholder','anomaly.module.pages::field.parent.warning','anomaly.module.pages::field.parent.instructions'),
	(51,51,'en','anomaly.module.pages::field.theme_layout.name','anomaly.module.pages::field.theme_layout.placeholder','anomaly.module.pages::field.theme_layout.warning','anomaly.module.pages::field.theme_layout.instructions'),
	(52,52,'en','anomaly.module.pages::field.type.name','anomaly.module.pages::field.type.placeholder','anomaly.module.pages::field.type.warning','anomaly.module.pages::field.type.instructions'),
	(53,53,'en','anomaly.module.pages::field.handler.name','anomaly.module.pages::field.handler.placeholder','anomaly.module.pages::field.handler.warning','anomaly.module.pages::field.handler.instructions'),
	(54,54,'en','anomaly.module.pages::field.visible.name','anomaly.module.pages::field.visible.placeholder','anomaly.module.pages::field.visible.warning','anomaly.module.pages::field.visible.instructions'),
	(55,55,'en','anomaly.module.pages::field.exact.name','anomaly.module.pages::field.exact.placeholder','anomaly.module.pages::field.exact.warning','anomaly.module.pages::field.exact.instructions'),
	(56,56,'en','anomaly.module.pages::field.entry.name','anomaly.module.pages::field.entry.placeholder','anomaly.module.pages::field.entry.warning','anomaly.module.pages::field.entry.instructions'),
	(57,57,'en','anomaly.module.pages::field.name.name','anomaly.module.pages::field.name.placeholder','anomaly.module.pages::field.name.warning','anomaly.module.pages::field.name.instructions'),
	(58,58,'en','anomaly.module.pages::field.description.name','anomaly.module.pages::field.description.placeholder','anomaly.module.pages::field.description.warning','anomaly.module.pages::field.description.instructions'),
	(59,59,'en','anomaly.module.posts::field.str_id.name','anomaly.module.posts::field.str_id.placeholder','anomaly.module.posts::field.str_id.warning','anomaly.module.posts::field.str_id.instructions'),
	(60,60,'en','anomaly.module.posts::field.name.name','anomaly.module.posts::field.name.placeholder','anomaly.module.posts::field.name.warning','anomaly.module.posts::field.name.instructions'),
	(61,61,'en','anomaly.module.posts::field.title.name','anomaly.module.posts::field.title.placeholder','anomaly.module.posts::field.title.warning','anomaly.module.posts::field.title.instructions'),
	(62,62,'en','anomaly.module.posts::field.slug.name','anomaly.module.posts::field.slug.placeholder','anomaly.module.posts::field.slug.warning','anomaly.module.posts::field.slug.instructions'),
	(63,63,'en','anomaly.module.posts::field.content.name','anomaly.module.posts::field.content.placeholder','anomaly.module.posts::field.content.warning','anomaly.module.posts::field.content.instructions'),
	(64,64,'en','anomaly.module.posts::field.type.name','anomaly.module.posts::field.type.placeholder','anomaly.module.posts::field.type.warning','anomaly.module.posts::field.type.instructions'),
	(65,65,'en','anomaly.module.posts::field.tags.name','anomaly.module.posts::field.tags.placeholder','anomaly.module.posts::field.tags.warning','anomaly.module.posts::field.tags.instructions'),
	(66,66,'en','anomaly.module.posts::field.summary.name','anomaly.module.posts::field.summary.placeholder','anomaly.module.posts::field.summary.warning','anomaly.module.posts::field.summary.instructions'),
	(67,67,'en','anomaly.module.posts::field.description.name','anomaly.module.posts::field.description.placeholder','anomaly.module.posts::field.description.warning','anomaly.module.posts::field.description.instructions'),
	(68,68,'en','anomaly.module.posts::field.publish_at.name','anomaly.module.posts::field.publish_at.placeholder','anomaly.module.posts::field.publish_at.warning','anomaly.module.posts::field.publish_at.instructions'),
	(69,69,'en','anomaly.module.posts::field.entry.name','anomaly.module.posts::field.entry.placeholder','anomaly.module.posts::field.entry.warning','anomaly.module.posts::field.entry.instructions'),
	(70,70,'en','anomaly.module.posts::field.author.name','anomaly.module.posts::field.author.placeholder','anomaly.module.posts::field.author.warning','anomaly.module.posts::field.author.instructions'),
	(71,71,'en','anomaly.module.posts::field.layout.name','anomaly.module.posts::field.layout.placeholder','anomaly.module.posts::field.layout.warning','anomaly.module.posts::field.layout.instructions'),
	(72,72,'en','anomaly.module.posts::field.category.name','anomaly.module.posts::field.category.placeholder','anomaly.module.posts::field.category.warning','anomaly.module.posts::field.category.instructions'),
	(73,73,'en','anomaly.module.posts::field.enabled.name','anomaly.module.posts::field.enabled.placeholder','anomaly.module.posts::field.enabled.warning','anomaly.module.posts::field.enabled.instructions'),
	(74,74,'en','anomaly.module.posts::field.featured.name','anomaly.module.posts::field.featured.placeholder','anomaly.module.posts::field.featured.warning','anomaly.module.posts::field.featured.instructions'),
	(75,75,'en','anomaly.module.posts::field.meta_title.name','anomaly.module.posts::field.meta_title.placeholder','anomaly.module.posts::field.meta_title.warning','anomaly.module.posts::field.meta_title.instructions'),
	(76,76,'en','anomaly.module.posts::field.meta_description.name','anomaly.module.posts::field.meta_description.placeholder','anomaly.module.posts::field.meta_description.warning','anomaly.module.posts::field.meta_description.instructions'),
	(77,77,'en','anomaly.module.posts::field.meta_keywords.name','anomaly.module.posts::field.meta_keywords.placeholder','anomaly.module.posts::field.meta_keywords.warning','anomaly.module.posts::field.meta_keywords.instructions'),
	(78,78,'en','anomaly.module.posts::field.ttl.name','anomaly.module.posts::field.ttl.placeholder','anomaly.module.posts::field.ttl.warning','anomaly.module.posts::field.ttl.instructions'),
	(79,79,'en','anomaly.module.posts::field.theme_layout.name','anomaly.module.posts::field.theme_layout.placeholder','anomaly.module.posts::field.theme_layout.warning','anomaly.module.posts::field.theme_layout.instructions'),
	(80,80,'en','anomaly.module.preferences::field.user.name','anomaly.module.preferences::field.user.placeholder','anomaly.module.preferences::field.user.warning','anomaly.module.preferences::field.user.instructions'),
	(81,81,'en','anomaly.module.preferences::field.key.name','anomaly.module.preferences::field.key.placeholder','anomaly.module.preferences::field.key.warning','anomaly.module.preferences::field.key.instructions'),
	(82,82,'en','anomaly.module.preferences::field.value.name','anomaly.module.preferences::field.value.placeholder','anomaly.module.preferences::field.value.warning','anomaly.module.preferences::field.value.instructions'),
	(83,83,'en','anomaly.module.redirects::field.from.name','anomaly.module.redirects::field.from.placeholder','anomaly.module.redirects::field.from.warning','anomaly.module.redirects::field.from.instructions'),
	(84,84,'en','anomaly.module.redirects::field.to.name','anomaly.module.redirects::field.to.placeholder','anomaly.module.redirects::field.to.warning','anomaly.module.redirects::field.to.instructions'),
	(85,85,'en','anomaly.module.redirects::field.status.name','anomaly.module.redirects::field.status.placeholder','anomaly.module.redirects::field.status.warning','anomaly.module.redirects::field.status.instructions'),
	(86,86,'en','anomaly.module.redirects::field.secure.name','anomaly.module.redirects::field.secure.placeholder','anomaly.module.redirects::field.secure.warning','anomaly.module.redirects::field.secure.instructions'),
	(87,87,'en','anomaly.module.settings::field.key.name','anomaly.module.settings::field.key.placeholder','anomaly.module.settings::field.key.warning','anomaly.module.settings::field.key.instructions'),
	(88,88,'en','anomaly.module.settings::field.value.name','anomaly.module.settings::field.value.placeholder','anomaly.module.settings::field.value.warning','anomaly.module.settings::field.value.instructions'),
	(89,89,'en','anomaly.module.users::field.email.name','anomaly.module.users::field.email.placeholder','anomaly.module.users::field.email.warning','anomaly.module.users::field.email.instructions'),
	(90,90,'en','anomaly.module.users::field.username.name','anomaly.module.users::field.username.placeholder','anomaly.module.users::field.username.warning','anomaly.module.users::field.username.instructions'),
	(91,91,'en','anomaly.module.users::field.password.name','anomaly.module.users::field.password.placeholder','anomaly.module.users::field.password.warning','anomaly.module.users::field.password.instructions'),
	(92,92,'en','anomaly.module.users::field.remember_token.name','anomaly.module.users::field.remember_token.placeholder','anomaly.module.users::field.remember_token.warning','anomaly.module.users::field.remember_token.instructions'),
	(93,93,'en','anomaly.module.users::field.ip_address.name','anomaly.module.users::field.ip_address.placeholder','anomaly.module.users::field.ip_address.warning','anomaly.module.users::field.ip_address.instructions'),
	(94,94,'en','anomaly.module.users::field.last_login_at.name','anomaly.module.users::field.last_login_at.placeholder','anomaly.module.users::field.last_login_at.warning','anomaly.module.users::field.last_login_at.instructions'),
	(95,95,'en','anomaly.module.users::field.last_activity_at.name','anomaly.module.users::field.last_activity_at.placeholder','anomaly.module.users::field.last_activity_at.warning','anomaly.module.users::field.last_activity_at.instructions'),
	(96,96,'en','anomaly.module.users::field.permissions.name','anomaly.module.users::field.permissions.placeholder','anomaly.module.users::field.permissions.warning','anomaly.module.users::field.permissions.instructions'),
	(97,97,'en','anomaly.module.users::field.display_name.name','anomaly.module.users::field.display_name.placeholder','anomaly.module.users::field.display_name.warning','anomaly.module.users::field.display_name.instructions'),
	(98,98,'en','anomaly.module.users::field.first_name.name','anomaly.module.users::field.first_name.placeholder','anomaly.module.users::field.first_name.warning','anomaly.module.users::field.first_name.instructions'),
	(99,99,'en','anomaly.module.users::field.last_name.name','anomaly.module.users::field.last_name.placeholder','anomaly.module.users::field.last_name.warning','anomaly.module.users::field.last_name.instructions'),
	(100,100,'en','anomaly.module.users::field.name.name','anomaly.module.users::field.name.placeholder','anomaly.module.users::field.name.warning','anomaly.module.users::field.name.instructions'),
	(101,101,'en','anomaly.module.users::field.description.name','anomaly.module.users::field.description.placeholder','anomaly.module.users::field.description.warning','anomaly.module.users::field.description.instructions'),
	(102,102,'en','anomaly.module.users::field.reset_code.name','anomaly.module.users::field.reset_code.placeholder','anomaly.module.users::field.reset_code.warning','anomaly.module.users::field.reset_code.instructions'),
	(103,103,'en','anomaly.module.users::field.reset_code_expires_at.name','anomaly.module.users::field.reset_code_expires_at.placeholder','anomaly.module.users::field.reset_code_expires_at.warning','anomaly.module.users::field.reset_code_expires_at.instructions'),
	(104,104,'en','anomaly.module.users::field.activation_code.name','anomaly.module.users::field.activation_code.placeholder','anomaly.module.users::field.activation_code.warning','anomaly.module.users::field.activation_code.instructions'),
	(105,105,'en','anomaly.module.users::field.activation_code_expires_at.name','anomaly.module.users::field.activation_code_expires_at.placeholder','anomaly.module.users::field.activation_code_expires_at.warning','anomaly.module.users::field.activation_code_expires_at.instructions'),
	(106,106,'en','anomaly.module.users::field.activated.name','anomaly.module.users::field.activated.placeholder','anomaly.module.users::field.activated.warning','anomaly.module.users::field.activated.instructions'),
	(107,107,'en','anomaly.module.users::field.enabled.name','anomaly.module.users::field.enabled.placeholder','anomaly.module.users::field.enabled.warning','anomaly.module.users::field.enabled.instructions'),
	(108,108,'en','anomaly.module.users::field.slug.name','anomaly.module.users::field.slug.placeholder','anomaly.module.users::field.slug.warning','anomaly.module.users::field.slug.instructions'),
	(109,109,'en','anomaly.module.users::field.roles.name','anomaly.module.users::field.roles.placeholder','anomaly.module.users::field.roles.warning','anomaly.module.users::field.roles.instructions'),
	(110,110,'en','anomaly.extension.page_link_type::field.title.name','anomaly.extension.page_link_type::field.title.placeholder','anomaly.extension.page_link_type::field.title.warning','anomaly.extension.page_link_type::field.title.instructions'),
	(111,111,'en','anomaly.extension.page_link_type::field.page.name','anomaly.extension.page_link_type::field.page.placeholder','anomaly.extension.page_link_type::field.page.warning','anomaly.extension.page_link_type::field.page.instructions'),
	(112,112,'en','anomaly.extension.page_link_type::field.description.name','anomaly.extension.page_link_type::field.description.placeholder','anomaly.extension.page_link_type::field.description.warning','anomaly.extension.page_link_type::field.description.instructions'),
	(113,113,'en','anomaly.extension.url_link_type::field.title.name','anomaly.extension.url_link_type::field.title.placeholder','anomaly.extension.url_link_type::field.title.warning','anomaly.extension.url_link_type::field.title.instructions'),
	(114,114,'en','anomaly.extension.url_link_type::field.url.name','anomaly.extension.url_link_type::field.url.placeholder','anomaly.extension.url_link_type::field.url.warning','anomaly.extension.url_link_type::field.url.instructions'),
	(115,115,'en','anomaly.extension.url_link_type::field.description.name','anomaly.extension.url_link_type::field.description.placeholder','anomaly.extension.url_link_type::field.description.warning','anomaly.extension.url_link_type::field.description.instructions'),
	(116,116,'en','Content',NULL,NULL,NULL),
	(117,117,'en','Content',NULL,NULL,NULL),
	(118,118,'en','HTML',NULL,NULL,NULL),
	(119,119,'en','Images',NULL,NULL,NULL),
	(120,120,'en','Sidebar',NULL,NULL,NULL),
	(121,121,'en','Text',NULL,NULL,NULL),
	(122,122,'en','Items',NULL,NULL,NULL),
	(123,123,'en','anomaly.module.forms::field.form_name.name','anomaly.module.forms::field.form_name.placeholder','anomaly.module.forms::field.form_name.warning','anomaly.module.forms::field.form_name.instructions'),
	(124,124,'en','anomaly.module.forms::field.form_description.name','anomaly.module.forms::field.form_description.placeholder','anomaly.module.forms::field.form_description.warning','anomaly.module.forms::field.form_description.instructions'),
	(125,125,'en','anomaly.module.forms::field.form_slug.name','anomaly.module.forms::field.form_slug.placeholder','anomaly.module.forms::field.form_slug.warning','anomaly.module.forms::field.form_slug.instructions'),
	(126,126,'en','anomaly.module.forms::field.form_handler.name','anomaly.module.forms::field.form_handler.placeholder','anomaly.module.forms::field.form_handler.warning','anomaly.module.forms::field.form_handler.instructions'),
	(127,127,'en','anomaly.module.forms::field.form_view_options.name','anomaly.module.forms::field.form_view_options.placeholder','anomaly.module.forms::field.form_view_options.warning','anomaly.module.forms::field.form_view_options.instructions'),
	(128,128,'en','anomaly.module.forms::field.notification_name.name','anomaly.module.forms::field.notification_name.placeholder','anomaly.module.forms::field.notification_name.warning','anomaly.module.forms::field.notification_name.instructions'),
	(129,129,'en','anomaly.module.forms::field.notification_description.name','anomaly.module.forms::field.notification_description.placeholder','anomaly.module.forms::field.notification_description.warning','anomaly.module.forms::field.notification_description.instructions'),
	(130,130,'en','anomaly.module.forms::field.notification_slug.name','anomaly.module.forms::field.notification_slug.placeholder','anomaly.module.forms::field.notification_slug.warning','anomaly.module.forms::field.notification_slug.instructions'),
	(131,131,'en','anomaly.module.forms::field.notification_email_layout.name','anomaly.module.forms::field.notification_email_layout.placeholder','anomaly.module.forms::field.notification_email_layout.warning','anomaly.module.forms::field.notification_email_layout.instructions'),
	(132,132,'en','anomaly.module.forms::field.notification_content.name','anomaly.module.forms::field.notification_content.placeholder','anomaly.module.forms::field.notification_content.warning','anomaly.module.forms::field.notification_content.instructions'),
	(133,133,'en','anomaly.module.forms::field.notification_from_name.name','anomaly.module.forms::field.notification_from_name.placeholder','anomaly.module.forms::field.notification_from_name.warning','anomaly.module.forms::field.notification_from_name.instructions'),
	(134,134,'en','anomaly.module.forms::field.notification_from_email.name','anomaly.module.forms::field.notification_from_email.placeholder','anomaly.module.forms::field.notification_from_email.warning','anomaly.module.forms::field.notification_from_email.instructions'),
	(135,135,'en','anomaly.module.forms::field.notification_reply_to_name.name','anomaly.module.forms::field.notification_reply_to_name.placeholder','anomaly.module.forms::field.notification_reply_to_name.warning','anomaly.module.forms::field.notification_reply_to_name.instructions'),
	(136,136,'en','anomaly.module.forms::field.notification_reply_to_email.name','anomaly.module.forms::field.notification_reply_to_email.placeholder','anomaly.module.forms::field.notification_reply_to_email.warning','anomaly.module.forms::field.notification_reply_to_email.instructions'),
	(137,137,'en','anomaly.module.forms::field.notification_subject.name','anomaly.module.forms::field.notification_subject.placeholder','anomaly.module.forms::field.notification_subject.warning','anomaly.module.forms::field.notification_subject.instructions'),
	(138,138,'en','anomaly.module.forms::field.notification_cc.name','anomaly.module.forms::field.notification_cc.placeholder','anomaly.module.forms::field.notification_cc.warning','anomaly.module.forms::field.notification_cc.instructions'),
	(139,139,'en','anomaly.module.forms::field.notification_bcc.name','anomaly.module.forms::field.notification_bcc.placeholder','anomaly.module.forms::field.notification_bcc.warning','anomaly.module.forms::field.notification_bcc.instructions'),
	(140,140,'en','anomaly.module.forms::field.send_notification.name','anomaly.module.forms::field.send_notification.placeholder','anomaly.module.forms::field.send_notification.warning','anomaly.module.forms::field.send_notification.instructions'),
	(141,141,'en','anomaly.module.forms::field.notification_send_to.name','anomaly.module.forms::field.notification_send_to.placeholder','anomaly.module.forms::field.notification_send_to.warning','anomaly.module.forms::field.notification_send_to.instructions'),
	(142,142,'en','anomaly.module.forms::field.notification.name','anomaly.module.forms::field.notification.placeholder','anomaly.module.forms::field.notification.warning','anomaly.module.forms::field.notification.instructions'),
	(143,143,'en','anomaly.module.forms::field.send_autoresponder.name','anomaly.module.forms::field.send_autoresponder.placeholder','anomaly.module.forms::field.send_autoresponder.warning','anomaly.module.forms::field.send_autoresponder.instructions'),
	(144,144,'en','anomaly.module.forms::field.user_email_field.name','anomaly.module.forms::field.user_email_field.placeholder','anomaly.module.forms::field.user_email_field.warning','anomaly.module.forms::field.user_email_field.instructions'),
	(145,145,'en','anomaly.module.forms::field.autoresponder.name','anomaly.module.forms::field.autoresponder.placeholder','anomaly.module.forms::field.autoresponder.warning','anomaly.module.forms::field.autoresponder.instructions'),
	(146,146,'en','anomaly.module.forms::field.include_attachments.name','anomaly.module.forms::field.include_attachments.placeholder','anomaly.module.forms::field.include_attachments.warning','anomaly.module.forms::field.include_attachments.instructions'),
	(147,147,'en','anomaly.module.forms::field.success_message.name','anomaly.module.forms::field.success_message.placeholder','anomaly.module.forms::field.success_message.warning','anomaly.module.forms::field.success_message.instructions'),
	(148,148,'en','anomaly.module.forms::field.success_redirect.name','anomaly.module.forms::field.success_redirect.placeholder','anomaly.module.forms::field.success_redirect.warning','anomaly.module.forms::field.success_redirect.instructions'),
	(149,149,'en','Name',NULL,NULL,NULL),
	(150,150,'en','Phone',NULL,NULL,NULL),
	(151,151,'en','Email',NULL,NULL,NULL),
	(152,152,'en','Subject',NULL,NULL,NULL),
	(153,153,'en','Message',NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_streams_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_streams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_streams`;

CREATE TABLE `grishamind_streams_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'id',
  `order_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'id',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `sortable` tinyint(1) NOT NULL DEFAULT '0',
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `trashable` tinyint(1) NOT NULL DEFAULT '0',
  `translatable` tinyint(1) NOT NULL DEFAULT '0',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_streams` (`namespace`,`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_streams` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_streams` DISABLE KEYS */;

INSERT INTO `grishamind_streams_streams` (`id`, `namespace`, `slug`, `prefix`, `title_column`, `order_by`, `locked`, `hidden`, `sortable`, `searchable`, `trashable`, `translatable`, `config`)
VALUES
	(1,'configuration','configuration','configuration_','id','id',1,0,0,0,0,0,'a:0:{}'),
	(2,'dashboard','dashboards','dashboard_','name','id',0,0,1,0,0,1,'a:0:{}'),
	(3,'dashboard','widgets','dashboard_','title','id',0,0,1,0,0,1,'a:0:{}'),
	(4,'files','disks','files_','name','id',0,0,1,0,1,1,'a:0:{}'),
	(5,'files','folders','files_','name','id',0,0,1,0,1,1,'a:0:{}'),
	(6,'files','files','files_','name','id',0,0,0,1,1,0,'a:0:{}'),
	(7,'navigation','menus','navigation_','name','id',0,0,0,0,1,1,'a:0:{}'),
	(8,'navigation','links','navigation_','id','id',0,0,1,0,1,0,'a:0:{}'),
	(9,'pages','pages','pages_','title','id',0,0,1,1,1,1,'a:0:{}'),
	(10,'pages','types','pages_','name','id',0,0,1,0,1,1,'a:0:{}'),
	(11,'posts','categories','posts_','name','id',0,0,1,0,1,1,'a:0:{}'),
	(12,'posts','posts','posts_','title','id',0,0,0,1,1,1,'a:0:{}'),
	(13,'posts','types','posts_','name','id',0,0,1,0,1,1,'a:0:{}'),
	(14,'preferences','preferences','preferences_','id','id',0,0,0,0,0,0,'a:0:{}'),
	(15,'redirects','redirects','redirects_','from','id',0,0,1,0,1,0,'a:0:{}'),
	(16,'settings','settings','settings_','id','id',0,0,0,0,0,0,'a:0:{}'),
	(17,'users','users','users_','display_name','id',0,0,0,1,1,0,'a:0:{}'),
	(18,'users','roles','users_','name','id',0,0,0,0,1,1,'a:0:{}'),
	(19,'page_link_type','pages','page_link_type_','title','id',0,0,0,0,0,1,'a:0:{}'),
	(20,'url_link_type','urls','url_link_type_','title','id',0,0,0,0,0,1,'a:0:{}'),
	(21,'files','images','files_','id','id',0,0,0,0,1,1,'a:0:{}'),
	(22,'files','documents','files_','id','id',0,0,0,0,1,1,'a:0:{}'),
	(23,'pages','default_pages','pages_','id','id',0,1,0,0,1,1,'a:0:{}'),
	(24,'posts','default_posts','posts_','id','id',0,1,0,0,1,1,'a:0:{}'),
	(25,'grid','content','grid_','id','id',0,0,0,0,0,0,''),
	(26,'grid','html','grid_','id','id',0,0,0,0,0,0,''),
	(27,'pages','sidebar_pages','pages_','id','id',0,1,0,0,1,1,'a:0:{}'),
	(28,'grid','gallery','grid_','id','id',0,0,0,0,0,0,''),
	(29,'repeater','item','repeater_','id','id',0,0,0,0,0,0,'a:1:{i:0;s:17:\"a:1:{i:0;s:0:\"\";}\";}'),
	(30,'forms','forms','forms_','form_name','id',0,0,0,0,1,1,'a:0:{}'),
	(31,'forms','notifications','forms_','notification_name','id',0,0,0,0,1,1,'a:0:{}'),
	(32,'forms','contact_us','forms_','id','id',0,0,0,0,0,1,'a:0:{}'),
	(33,'pages','contact_pages','pages_','id','id',0,1,0,0,1,1,'a:0:{}');

/*!40000 ALTER TABLE `grishamind_streams_streams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_streams_streams_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_streams_streams_translations`;

CREATE TABLE `grishamind_streams_streams_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `streams_streams_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_streams_streams_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_streams_streams_translations` DISABLE KEYS */;

INSERT INTO `grishamind_streams_streams_translations` (`id`, `stream_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'en','anomaly.module.configuration::stream.configuration.name','anomaly.module.configuration::stream.configuration.description'),
	(2,2,'en','anomaly.module.dashboard::stream.dashboards.name','anomaly.module.dashboard::stream.dashboards.description'),
	(3,3,'en','anomaly.module.dashboard::stream.widgets.name','anomaly.module.dashboard::stream.widgets.description'),
	(4,4,'en','anomaly.module.files::stream.disks.name','anomaly.module.files::stream.disks.description'),
	(5,5,'en','anomaly.module.files::stream.folders.name','anomaly.module.files::stream.folders.description'),
	(6,6,'en','anomaly.module.files::stream.files.name','anomaly.module.files::stream.files.description'),
	(7,7,'en','anomaly.module.navigation::stream.menus.name','anomaly.module.navigation::stream.menus.description'),
	(8,8,'en','anomaly.module.navigation::stream.links.name','anomaly.module.navigation::stream.links.description'),
	(9,9,'en','anomaly.module.pages::stream.pages.name','anomaly.module.pages::stream.pages.description'),
	(10,10,'en','anomaly.module.pages::stream.types.name','anomaly.module.pages::stream.types.description'),
	(11,11,'en','anomaly.module.posts::stream.categories.name','anomaly.module.posts::stream.categories.description'),
	(12,12,'en','anomaly.module.posts::stream.posts.name','anomaly.module.posts::stream.posts.description'),
	(13,13,'en','anomaly.module.posts::stream.types.name','anomaly.module.posts::stream.types.description'),
	(14,14,'en','anomaly.module.preferences::stream.preferences.name','anomaly.module.preferences::stream.preferences.description'),
	(15,15,'en','anomaly.module.redirects::stream.redirects.name','anomaly.module.redirects::stream.redirects.description'),
	(16,16,'en','anomaly.module.settings::stream.settings.name','anomaly.module.settings::stream.settings.description'),
	(17,17,'en','anomaly.module.users::stream.users.name','anomaly.module.users::stream.users.description'),
	(18,18,'en','anomaly.module.users::stream.roles.name','anomaly.module.users::stream.roles.description'),
	(19,19,'en','anomaly.extension.page_link_type::stream.pages.name','anomaly.extension.page_link_type::stream.pages.description'),
	(20,20,'en','anomaly.extension.url_link_type::stream.urls.name','anomaly.extension.url_link_type::stream.urls.description'),
	(21,21,'en','Images','A folder for images.'),
	(22,22,'en','Documents','A folder for documents.'),
	(23,23,'en','Default','A simple page type.'),
	(24,24,'en','Default',NULL),
	(25,25,'en','Content','A simple WYSIWYG content block.'),
	(26,26,'en','HTML','A custom HTML content block.'),
	(27,27,'en','Sidebar','A simple page type with block content and a callout sidebar.'),
	(28,28,'en','Gallery','A simple image gallery block.'),
	(29,29,'en','Item',NULL),
	(30,30,'en','anomaly.module.forms::stream.forms.name','anomaly.module.forms::stream.forms.description'),
	(31,31,'en','anomaly.module.forms::stream.notifications.name','anomaly.module.forms::stream.notifications.description'),
	(32,32,'en',NULL,NULL),
	(33,33,'en','Contact','A special page for the contact page only.');

/*!40000 ALTER TABLE `grishamind_streams_streams_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_url_link_type_urls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_url_link_type_urls`;

CREATE TABLE `grishamind_url_link_type_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_url_link_type_urls` WRITE;
/*!40000 ALTER TABLE `grishamind_url_link_type_urls` DISABLE KEYS */;

INSERT INTO `grishamind_url_link_type_urls` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `url`)
VALUES
	(1,1,'2017-06-03 02:02:15',NULL,NULL,NULL,'http://pyrocms.com/'),
	(2,2,'2017-06-03 02:02:15',NULL,NULL,NULL,'http://pyrocms.com/documentation');

/*!40000 ALTER TABLE `grishamind_url_link_type_urls` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_url_link_type_urls_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_url_link_type_urls_translations`;

CREATE TABLE `grishamind_url_link_type_urls_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `url_link_type_urls_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_url_link_type_urls_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_url_link_type_urls_translations` DISABLE KEYS */;

INSERT INTO `grishamind_url_link_type_urls_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `title`, `description`)
VALUES
	(1,1,'2017-06-03 02:02:15',NULL,'2017-06-03 02:02:15',NULL,'en','PyroCMS.com',NULL),
	(2,2,'2017-06-03 02:02:15',NULL,'2017-06-03 02:02:15',NULL,'en','Documentation',NULL);

/*!40000 ALTER TABLE `grishamind_url_link_type_urls_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_users_roles`;

CREATE TABLE `grishamind_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `c8501689d10e8645dd553604c773dca2` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_users_roles` WRITE;
/*!40000 ALTER TABLE `grishamind_users_roles` DISABLE KEYS */;

INSERT INTO `grishamind_users_roles` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `slug`, `permissions`)
VALUES
	(1,1,'2017-06-03 07:02:19',NULL,NULL,NULL,NULL,'admin',NULL),
	(2,2,'2017-06-03 07:02:20',NULL,NULL,NULL,NULL,'user',NULL),
	(3,3,'2017-06-03 07:02:20',NULL,NULL,NULL,NULL,'guest',NULL);

/*!40000 ALTER TABLE `grishamind_users_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_users_roles_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_users_roles_translations`;

CREATE TABLE `grishamind_users_roles_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `users_roles_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_users_roles_translations` WRITE;
/*!40000 ALTER TABLE `grishamind_users_roles_translations` DISABLE KEYS */;

INSERT INTO `grishamind_users_roles_translations` (`id`, `entry_id`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `locale`, `name`, `description`)
VALUES
	(1,1,'2017-06-03 07:02:20',NULL,'2017-06-03 07:02:20',NULL,'en','Admin','The super admin role.'),
	(2,2,'2017-06-03 07:02:20',NULL,'2017-06-03 07:02:20',NULL,'en','User','The default user role.'),
	(3,3,'2017-06-03 07:02:20',NULL,'2017-06-03 07:02:20',NULL,'en','Guest','The fallback role for non-users.');

/*!40000 ALTER TABLE `grishamind_users_roles_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_users_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_users_users`;

CREATE TABLE `grishamind_users_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `f432e8a18875d82efd589bf0d89fc033` (`email`),
  UNIQUE KEY `729e247f9366c049a3e2924a0a51b756` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_users_users` WRITE;
/*!40000 ALTER TABLE `grishamind_users_users` DISABLE KEYS */;

INSERT INTO `grishamind_users_users` (`id`, `sort_order`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `email`, `username`, `password`, `display_name`, `first_name`, `last_name`, `activated`, `enabled`, `permissions`, `last_login_at`, `remember_token`, `activation_code`, `reset_code`, `last_activity_at`, `ip_address`)
VALUES
	(1,1,'2017-06-03 07:02:20',NULL,'2017-06-04 04:48:01',1,NULL,'ryan@pyrocms.com','admin','$2y$10$hTLVpVWFcNBGmqSAbb0tr.bZ1QrFJYqkKeHqVPFa2BKOBnXQITMdu','Administrator',NULL,NULL,1,1,NULL,'2017-06-04 04:48:01',NULL,NULL,NULL,NULL,NULL),
	(2,2,'2017-06-03 07:02:20',NULL,'2017-06-03 07:02:20',NULL,NULL,'demo@pyrocms.com','demo','$2y$10$iN00bSzVTFxvxgv2jKGvSe3S/mbNlm1sNkafzI/OvlxLcAjKNXPM2','Demo User',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grishamind_users_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grishamind_users_users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grishamind_users_users_roles`;

CREATE TABLE `grishamind_users_users_roles` (
  `entry_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `grishamind_users_users_roles` WRITE;
/*!40000 ALTER TABLE `grishamind_users_users_roles` DISABLE KEYS */;

INSERT INTO `grishamind_users_users_roles` (`entry_id`, `related_id`, `sort_order`)
VALUES
	(1,1,NULL),
	(2,2,NULL);

/*!40000 ALTER TABLE `grishamind_users_users_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2015_03_15_171404_create_applications_table',1),
	(2,'2015_03_15_171506_create_applications_domains_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
