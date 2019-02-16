CREATE DATABASE IF NOT EXISTS main_db;

USE main_db;

CREATE TABLE IF NOT EXISTS `User` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`username` VARCHAR(30) NOT NULL , 
	`password` VARCHAR(30) NOT NULL , 
	`nickname` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`email` VARCHAR(60) NOT NULL , 
	`gender` BIT NULL , 
	`image` VARCHAR(90) NULL , 
	PRIMARY KEY (`id`), 
	UNIQUE (`username`), 
	UNIQUE (`nickname`), 
	UNIQUE (`email`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Article` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`category_id` INT NOT NULL , 
	`title` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`author` INT NOT NULL , 
	`content` VARCHAR(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`publish_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
	`update_time` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- INSERT INTO `Article` (`id`, `category_id`, `title`, `author`, `content`, `publish_time`, `update_time`) VALUES (NULL, '1', '測試', '1', '這是測試！', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS `Category` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`description` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , 
	`class_id` INT NOT NULL, 
	PRIMARY KEY (`id`), 
	UNIQUE (`name`)
) ENGINE = InnoDB;

-- INSERT INTO `Category` (`id`, `name`, `description`) VALUES (NULL, '系統', NULL);

CREATE TABLE IF NOT EXISTS `Comment` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`article_id` INT NOT NULL , 
	`user_id` INT NOT NULL , 
	`content` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- INSERT INTO `Comment` (`id`, `article_id`, `user_id`, `content`, `create_time`) VALUES (NULL, '1', '2', '讚喔~', CURRENT_TIMESTAMP);
-- INSERT INTO `Comment` (`id`, `article_id`, `user_id`, `content`, `create_time`) VALUES (NULL, '1', '3', '<p>安安安安</p>\r\n<p><span style=\"color: #0000ff;\">你好</span></p>\r\n<p><strong>這是測試~</strong></p>\r\n<table border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>這是表格~</td>\r\n<td>安安</td>\r\n<td>你好</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src=\"data:image/jpeg;base64,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\" alt=\"\" width=\"261\" height=\"193\" /></p>', CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS `Class` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`name` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`description` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL , 
	PRIMARY KEY (`id`), 
	UNIQUE (`name`)
) ENGINE = InnoDB;

-- INSERT INTO `Class` (`id`, `name`, `description`) VALUES ('1', '通用看板', NULL), ('2', '棒球', NULL), ('3', '籃球', NULL), ('4', '百家樂', NULL), ('5', '彩票', NULL), ('6', '北京賽車', NULL), ('7', '其他', NULL)

CREATE TABLE IF NOT EXISTS `Message` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`senderId` INT NOT NULL , 
	`receiverId` INT NOT NULL , 
	`sendTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
	`subject` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`message` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
	`readFlag` TINYINT NOT NULL , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- INSERT INTO `Message` (`id`, `senderId`, `receiverId`, `sendTime`, `message`, `readFlag`) VALUES (NULL, '1', '2', CURRENT_TIMESTAMP, '<p><span style=\"color:#1abc9c\">你好啊這是測試信</span></p>\r\n', '0')


CREATE TABLE `Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` INT NOT NULL,
  `price` INT NOT NULL,
  `image_url` VARCHAR(120) NOT NULL DEFAULT 'images/product/test.png',
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
) ENGINE = InnoDB;
-- INSERT INTO `Product` (`id`, `name`, `category_id`, `price`, `image_url`) VALUES (NULL, '黑色高跟鞋', '3', '100', 'images/product/shoes/black.png'), (NULL, '深藍色高跟鞋', '3', '200', 'images/product/shoes/dark-blue.png'), (NULL, '綠色高跟鞋', '3', '100', 'images/product/shoes/green.png'), (NULL, '紅色高跟鞋', '3', '150', 'images/product/shoes/red.png'), (NULL, '黃色高跟鞋', '3', '180', 'images/product/shoes/yellow.png')

CREATE TABLE `ProductCategory` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`name` VARCHAR(20) CHARACTER SET utf8  COLLATE utf8_general_ci NOT NULL , 
	`e_name` VARCHAR(20) NOT NULL , 
	PRIMARY KEY (`id`),
	UNIQUE (`name`)
) ENGINE = InnoDB;

-- INSERT INTO `ProductCategory` (`id`, `name`, `e_name`) VALUES (NULL, '髮型', 'hairstyles'), (NULL, '衣服', 'clothes'), (NULL, '鞋子', 'shoes')