CREATE DATABASE IF NOT EXISTS main_db;

USE main_db;

CREATE TABLE IF NOT EXISTS `User` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`username` VARCHAR(30) NOT NULL , 
	`password` VARCHAR(30) NOT NULL , 
	`nickname` VARCHAR(30) NOT NULL , 
	`email` VARCHAR(60) NOT NULL , 
	`gender` BIT NOT NULL , 
	`image` INT NULL DEFAULT '0',
	 PRIMARY KEY (`id`), 
	 UNIQUE (`password`), 
	 UNIQUE (`nickname`), 
	 UNIQUE (`username`), 
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