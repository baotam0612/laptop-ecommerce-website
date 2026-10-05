-- MySQL SQL script, UTF-8.
-- WARNING: Recreates the listed tables and replaces their existing data.
-- Source is incomplete: product row 6 is truncated; rows 7-15 are unavailable.
-- Only complete product rows 1-5 and 16 are retained.
-- roles is a minimal inferred table: 1=ROLE_ADMIN, 2=ROLE_USER.
-- Confirm role names/columns against your application before using.

CREATE DATABASE IF NOT EXISTS `computer_ver3`
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `computer_ver3`;

SET NAMES utf8mb4;
SET @saved_time_zone = @@SESSION.time_zone;
SET time_zone = '+00:00';

DROP TABLE IF EXISTS `userroles`;
DROP TABLE IF EXISTS `password_reset_token`;
DROP TABLE IF EXISTS `orderdetail`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `users`;

-- Table: users
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` TINYINT(1) DEFAULT '1',
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(45) DEFAULT NULL,
  `modifiedby` VARCHAR(45) DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: roles
CREATE TABLE `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: product
CREATE TABLE `product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(300) NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `brand` VARCHAR(100) NOT NULL,
  `cpu` VARCHAR(500) DEFAULT NULL,
  `gpu` VARCHAR(500) DEFAULT NULL,
  `ram` VARCHAR(30) DEFAULT NULL,
  `rom` VARCHAR(30) DEFAULT NULL,
  `price` VARCHAR(100) DEFAULT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(45) DEFAULT NULL,
  `modifiedby` VARCHAR(45) DEFAULT NULL,
  `imagespath` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: customer
CREATE TABLE `customer` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `user_id` INT DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `fk_customer_user` (`user_id`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: orders
CREATE TABLE `orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `customer_id` BIGINT DEFAULT NULL,
  `total_amount` BIGINT DEFAULT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(45) DEFAULT NULL,
  `modifiedby` VARCHAR(45) DEFAULT NULL,
  `status` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: orderdetail
CREATE TABLE `orderdetail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT DEFAULT NULL,
  `product_id` BIGINT DEFAULT NULL,
  `quantity` INT NOT NULL,
  `price` BIGINT NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(45) DEFAULT NULL,
  `modifiedby` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: password_reset_token
CREATE TABLE `password_reset_token` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `expiry_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `password_reset_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: userroles
CREATE TABLE `userroles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(45) DEFAULT NULL,
  `modifiedby` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userroles_ibfk_1` (`user_id`),
  KEY `userroles_ibfk_2` (`role_id`),
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data
START TRANSACTION;

INSERT INTO `users` (`id`, `username`, `password`, `enabled`, `createddate`, `modifieddate`, `createdby`, `modifiedby`, `email`)
VALUES
  (1,'nguyenvana','$2a$10$Ha0h03Vu4tr/5VM0BcuiiOoNAE7UHhzTDUq2eCcX2doq//GpKTjTW',1,NULL,'2025-11-05 20:34:07',NULL,'anonymousUser','baotam0612@gmail.com'),
  (2,'admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',1,NULL,NULL,NULL,NULL,'admin@gmail.com'),
  (3,'nphuonglinh','$2a$10$Ha0h03Vu4tr/5VM0BcuiiOoNAE7UHhzTDUq2eCcX2doq//GpKTjTW',1,'2025-11-05 21:00:34','2025-11-05 21:00:34','','anonymousUser','nplinh03@gmail.com'),
  (4,'Elder06','$2a$10$ybl3cnUTldAvNBivlwEVyu7KTHuG8.sHddVCrdFFTDQ0QYFSPPwMK',1,'2025-11-05 21:02:37','2025-11-05 21:02:37','anonymousUser','anonymousUser','nguyenbaotam2005@gmail.com');

INSERT INTO `roles` (`id`, `name`)
VALUES
  (1,'ROLE_ADMIN'),
  (2,'ROLE_USER');

INSERT INTO `product` (`id`, `name`, `category`, `brand`, `cpu`, `gpu`, `ram`, `rom`, `price`, `createddate`, `modifieddate`, `createdby`, `modifiedby`, `imagespath`)
VALUES
  (1,'Lenovo LOQ Essential 15IAX9E 83LK006CIN','laptop','LENOVO','Intel i5-12450HX','RTX 3060','16gb','256gb','15.990.000',NULL,'2025-10-13 23:12:42',NULL,'admin','https://laptop88.vn/media/product/pro_poster_9754.jpg'),
  (2,'GIGABYTE G6 MF H2VN853KH','laptop','GIGABYTE','Intel Core i7 13620H','RTX 4050','16gb','256gb','22.990.000',NULL,NULL,NULL,NULL,'https://laptop88.vn/media/product/pro_poster_9754.jpg'),
  (3,'HP 15-fd0235TU 9Q970PA','laptop','HP','Intel Core i5-1334U','RTX 2050','16gb','512gb','14.690.000',NULL,NULL,NULL,NULL,'https://laptop88.vn/media/product/250_9800__new_100___hp_15_fd0235tu_9q970pa.jpg'),
  (4,'Asus TUF F16 FX607VJ-RL034W','laptop','ASUS','Intel Core 5 210H','RTX 3050','16gb','512gb','19.990.000',NULL,NULL,NULL,NULL,'https://laptop88.vn/media/product/250_9800__new_100___hp_15_fd0235tu_9q970pa.jpg'),
  (5,'Acer Nitro V ProPanel ANV15-41-R7AP','laptop','Acer','AMD Ryzen 5-7535HS','RTX 2050','16gb','512gb','16.990.000',NULL,NULL,NULL,NULL,'https://laptop88.vn/media/product/pro_poster_9968.jpg'),
  (16,'lenovo','laptop','LENOVO','','','','',NULL,'2025-11-05 00:58:19','2025-11-05 00:58:19','admin','admin','1762279098852_123456.jpg');

INSERT INTO `customer` (`id`, `full_name`, `email`, `phone`, `address`, `user_id`)
VALUES
  (1,'Nguyen Thi B','ntb2025@gmail.com','0123456789','Mo Lao - Ha Dong - Ha Noi',NULL),
  (2,'Nguyen Van C','vc@2025@gmail.com','0456789123','Tu Son - Bac Ninh',NULL),
  (3,'Nguyen Van A','ye@2025@gmail.com','01165645','Dai Dong - Bac Ninh',1);

INSERT INTO `orders` (`id`, `date`, `customer_id`, `total_amount`, `createddate`, `modifieddate`, `createdby`, `modifiedby`, `status`)
VALUES
  (1,'2025-09-17 18:02:30',1,15990000,NULL,NULL,NULL,NULL,''),
  (2,'2025-11-03 10:43:16',NULL,15990000,'2025-11-03 10:43:17','2025-11-04 22:32:57','nguyenvana','admin','APPROVED'),
  (3,'2025-11-03 10:50:38',NULL,15990000,'2025-11-03 10:50:38','2025-11-04 22:31:40','nguyenvana','admin','CANCELED'),
  (4,'2025-11-03 13:05:50',3,15990000,'2025-11-03 13:06:10','2025-11-04 22:41:34','nguyenvana','admin','APPROVED'),
  (5,'2025-11-04 22:50:49',3,15990000,'2025-11-04 22:50:49','2025-11-04 22:51:23','nguyenvana','admin','APPROVED'),
  (6,'2025-11-04 22:58:06',3,15990000,'2025-11-04 22:58:06','2025-11-04 22:58:21','nguyenvana','admin','APPROVED'),
  (7,'2025-11-04 23:01:43',NULL,15990000,'2025-11-04 23:01:43','2025-11-04 23:01:43','admin','admin',NULL),
  (8,'2025-11-04 23:02:27',3,15990000,'2025-11-04 23:02:27','2025-11-04 23:02:41','nguyenvana','admin','APPROVED'),
  (9,'2025-11-04 23:09:14',3,15990000,'2025-11-04 23:09:14','2025-11-04 23:09:28','nguyenvana','admin','APPROVED'),
  (10,'2025-11-04 23:11:44',3,15990000,'2025-11-04 23:11:44','2025-11-04 23:11:58','nguyenvana','admin','APPROVED'),
  (11,'2025-11-04 23:13:36',3,15990000,'2025-11-04 23:13:36','2025-11-04 23:13:48','nguyenvana','admin','APPROVED'),
  (12,'2025-11-05 12:58:22',3,19990000,'2025-11-05 12:58:22','2025-11-05 12:59:03','nguyenvana','admin','CANCELED'),
  (13,'2025-11-05 20:34:56',3,15990000,'2025-11-05 20:34:56','2025-11-05 20:34:56','nguyenvana','nguyenvana','PENDING');

INSERT INTO `orderdetail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `createddate`, `modifieddate`, `createdby`, `modifiedby`)
VALUES
  (1,1,1,1,15990000,NULL,NULL,NULL,NULL),
  (2,2,1,1,15990000,NULL,NULL,NULL,NULL),
  (3,3,1,1,15990000,NULL,NULL,NULL,NULL),
  (4,4,1,1,15990000,NULL,NULL,NULL,NULL),
  (5,5,1,1,15990000,NULL,NULL,NULL,NULL),
  (6,6,1,1,15990000,NULL,NULL,NULL,NULL),
  (7,7,1,1,15990000,NULL,NULL,NULL,NULL),
  (8,8,1,1,15990000,NULL,NULL,NULL,NULL),
  (9,9,1,1,15990000,NULL,NULL,NULL,NULL),
  (10,10,1,1,15990000,NULL,NULL,NULL,NULL),
  (11,11,1,1,15990000,NULL,NULL,NULL,NULL),
  (12,12,4,1,19990000,NULL,NULL,NULL,NULL),
  (13,13,1,1,15990000,NULL,NULL,NULL,NULL);

INSERT INTO `password_reset_token` (`id`, `token`, `user_id`, `expiry_date`)
VALUES
  (1,'6c67a8f7-945a-46e1-b9d2-d7e67f9f8ddf',1,'2025-11-05 08:28:02'),
  (2,'a099989f-f7da-4c86-be6b-762367a319f4',1,'2025-11-05 08:28:45'),
  (3,'3d3bd566-2ced-4c77-968a-5a27d83b0f4a',1,'2025-11-05 08:42:12'),
  (4,'3a5eb9d5-51d2-47ee-9c30-95d5f9a5d2e1',1,'2025-11-05 08:56:08'),
  (5,'e2402e77-765b-45a6-bec1-1655c95b0e55',1,'2025-11-05 08:58:19'),
  (6,'5be83ac7-4024-4d7a-9354-9a2561a94485',1,'2025-11-05 12:48:39');

INSERT INTO `userroles` (`id`, `user_id`, `role_id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`)
VALUES
  (1,1,2,NULL,NULL,NULL,NULL),
  (2,2,1,NULL,NULL,NULL,NULL);

COMMIT;
SET time_zone = @saved_time_zone;
