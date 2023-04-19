/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.10-MariaDB : Database - express_chat_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`express_chat_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `express_chat_app`;

/*Table structure for table `chat_message_delete` */

DROP TABLE IF EXISTS `chat_message_delete`;

CREATE TABLE `chat_message_delete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `chat_message_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chat_message_delete` */

/*Table structure for table `chat_message_status` */

DROP TABLE IF EXISTS `chat_message_status`;

CREATE TABLE `chat_message_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_message_id` int(11) NOT NULL,
  `is_read` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chat_message_status` */

/*Table structure for table `chat_messages` */

DROP TABLE IF EXISTS `chat_messages`;

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `file_url` text DEFAULT NULL,
  `message_type` varchar(100) NOT NULL DEFAULT 'text',
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `chat_messages` */

insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (1,1,1,'hello',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (2,1,1,'',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (3,1,1,'hello\\',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (4,1,1,'hello',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (5,1,1,'hello',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (6,1,1,'hello',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (7,1,1,'asfaaf',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (8,1,1,'dassda',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (9,1,1,'asdas',NULL,'text',NULL,'2020-10-07 23:04:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (10,1,1,'hello',NULL,'text',NULL,'2020-10-07 23:08:23',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (11,1,1,'as',NULL,'text',NULL,'2020-10-07 23:08:25',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (12,1,1,'asdds',NULL,'text',NULL,'2020-10-07 23:08:40',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (13,1,1,'aksa',NULL,'text',NULL,'2020-10-07 23:08:42',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (14,1,1,'lasd',NULL,'text',NULL,'2020-10-07 23:08:43',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (15,1,1,'asdasd',NULL,'text',NULL,'2020-10-07 23:08:59',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (16,1,1,'dasdads',NULL,'text',NULL,'2020-10-07 23:09:42',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (17,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:09:48',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (18,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:09:49',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (19,1,1,'aaaa',NULL,'text',NULL,'2020-10-07 23:10:03',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (20,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:04',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (21,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:06',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (22,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:07',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (23,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:08',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (24,1,1,'',NULL,'text',NULL,'2020-10-07 23:10:09',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (25,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:10',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (26,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:12',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (27,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:13',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (28,1,1,'aa',NULL,'text',NULL,'2020-10-07 23:10:14',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (29,1,1,'aaa',NULL,'text',NULL,'2020-10-07 23:10:15',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (30,2,1,'hello',NULL,'text',NULL,'2020-10-07 23:36:06',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (31,2,2,'hello\\',NULL,'text',NULL,'2020-10-07 23:43:21',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (32,3,0,'pussy cat',NULL,'text',NULL,'2020-10-07 23:43:22',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (33,2,2,'asds',NULL,'text',NULL,'2020-10-07 23:43:33',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (34,3,2,'pussy cat',NULL,'text',NULL,'2020-10-07 23:43:52',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (35,2,2,'asad',NULL,'text',NULL,'2020-10-07 23:43:58',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (36,2,2,'asdasd',NULL,'text',NULL,'2020-10-07 23:43:59',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (37,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:43:59',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (38,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:00',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (39,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:00',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (40,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:00',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (41,2,2,'sd',NULL,'text',NULL,'2020-10-07 23:44:00',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (42,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:01',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (43,2,2,'sdsd',NULL,'text',NULL,'2020-10-07 23:44:01',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (44,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:01',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (45,2,2,'asd',NULL,'text',NULL,'2020-10-07 23:44:01',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (46,2,2,'sd',NULL,'text',NULL,'2020-10-07 23:44:02',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (47,2,2,'sda',NULL,'text',NULL,'2020-10-07 23:44:02',NULL,NULL);
insert  into `chat_messages`(`id`,`user_id`,`chat_room_id`,`message`,`file_url`,`message_type`,`ip_address`,`created_at`,`updated_at`,`deleted_at`) values (48,2,2,'as',NULL,'text',NULL,'2020-10-07 23:44:02',NULL,NULL);

/*Table structure for table `chat_room_users` */

DROP TABLE IF EXISTS `chat_room_users`;

CREATE TABLE `chat_room_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_owner` int(1) NOT NULL DEFAULT 0,
  `creted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `chat_room_users` */

insert  into `chat_room_users`(`id`,`chat_room_id`,`user_id`,`is_owner`,`creted_at`,`updated_at`,`deleted_at`) values (1,1,1,0,'2020-10-07 22:36:42',NULL,NULL);
insert  into `chat_room_users`(`id`,`chat_room_id`,`user_id`,`is_owner`,`creted_at`,`updated_at`,`deleted_at`) values (2,1,2,1,'2020-10-07 22:36:42',NULL,NULL);
insert  into `chat_room_users`(`id`,`chat_room_id`,`user_id`,`is_owner`,`creted_at`,`updated_at`,`deleted_at`) values (3,2,2,0,'2020-10-07 23:43:10',NULL,NULL);
insert  into `chat_room_users`(`id`,`chat_room_id`,`user_id`,`is_owner`,`creted_at`,`updated_at`,`deleted_at`) values (4,2,3,1,'2020-10-07 23:43:10',NULL,NULL);

/*Table structure for table `chat_rooms` */

DROP TABLE IF EXISTS `chat_rooms`;

CREATE TABLE `chat_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `type` enum('single','group') NOT NULL,
  `member_limit` int(11) NOT NULL,
  `last_chat_message_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `chat_rooms` */

insert  into `chat_rooms`(`id`,`identifier`,`created_by`,`title`,`slug`,`image_url`,`description`,`status`,`type`,`member_limit`,`last_chat_message_id`,`created_at`,`updated_at`,`deleted_at`) values (1,'abtach_354',2,'abtach','abtach',NULL,NULL,1,'group',0,0,'2020-10-07 22:36:42',NULL,NULL);
insert  into `chat_rooms`(`id`,`identifier`,`created_by`,`title`,`slug`,`image_url`,`description`,`status`,`type`,`member_limit`,`last_chat_message_id`,`created_at`,`updated_at`,`deleted_at`) values (2,'aa_241',3,'aa','aa',NULL,NULL,1,'group',0,0,'2020-10-07 23:43:10',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT 0,
  `dob` date DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'male',
  `social_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expiry_at` date DEFAULT NULL,
  `socket_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_status` int(11) DEFAULT 1,
  `date_of_join` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`username`,`email`,`password`,`mobile_no`,`image_url`,`age`,`dob`,`status`,`gender`,`social_id`,`social_type`,`device_type`,`device_token`,`token`,`token_expiry_at`,`socket_id`,`online_status`,`date_of_join`,`created_at`,`updated_at`,`deleted_at`) values (1,'','','ajay kumar 1','ajay.kumar1@abtach.org','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,0,NULL,1,'male',NULL,NULL,NULL,NULL,'b7c7631fb31a1fb2303a6148a41d5555',NULL,NULL,0,NULL,NULL,NULL,NULL);
insert  into `users`(`id`,`first_name`,`last_name`,`username`,`email`,`password`,`mobile_no`,`image_url`,`age`,`dob`,`status`,`gender`,`social_id`,`social_type`,`device_type`,`device_token`,`token`,`token_expiry_at`,`socket_id`,`online_status`,`date_of_join`,`created_at`,`updated_at`,`deleted_at`) values (2,'','','ajay kumar 2','ajay.kumar2@abtach.org','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,0,NULL,1,'male',NULL,NULL,NULL,NULL,'39b51000e484875de268fa055a839e3b',NULL,'pUV1Kq9CJjvoozGuAAAH',1,NULL,NULL,NULL,NULL);
insert  into `users`(`id`,`first_name`,`last_name`,`username`,`email`,`password`,`mobile_no`,`image_url`,`age`,`dob`,`status`,`gender`,`social_id`,`social_type`,`device_type`,`device_token`,`token`,`token_expiry_at`,`socket_id`,`online_status`,`date_of_join`,`created_at`,`updated_at`,`deleted_at`) values (3,'','','aman_ur_rehman','aman_ur_rehman@hotmail.com','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,0,NULL,1,'male',NULL,NULL,NULL,NULL,'7398478385ca0568dcfe9d48b4891e92',NULL,'JUxL3Pzad9wExBTGAAAI',1,NULL,'2020-10-07 23:36:40',NULL,NULL);
insert  into `users`(`id`,`first_name`,`last_name`,`username`,`email`,`password`,`mobile_no`,`image_url`,`age`,`dob`,`status`,`gender`,`social_id`,`social_type`,`device_type`,`device_token`,`token`,`token_expiry_at`,`socket_id`,`online_status`,`date_of_join`,`created_at`,`updated_at`,`deleted_at`) values (4,'','','aman_ur_rehman','aman_ur_rehman@hotmail.com','92186a8573527a743c4e9a9d13848375',NULL,NULL,0,NULL,1,'male',NULL,NULL,NULL,NULL,'7398478385ca0568dcfe9d48b4891e92',NULL,NULL,1,NULL,'2020-10-07 23:37:35',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
