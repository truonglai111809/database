-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
  `id` INT(11) NOT NULL,
  `name_role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT(11) NOT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `roles_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_roles1_idx` (`roles_id` ASC),
  CONSTRAINT `fk_User_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `mydb`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`album` (
  `id` INT(11) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_album_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `content` VARCHAR(45) NULL DEFAULT NULL,
  `date_start` DATETIME NULL DEFAULT NULL,
  `date_end` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Event_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Event_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_info` (
  `id` INT(11) NOT NULL,
  `fullname` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `birthday` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `hobbie` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_User_info_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_User_info_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`image` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `album_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Image_Album1_idx` (`album_id` ASC),
  INDEX `fk_Image_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Image_Album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `mydb`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Image_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`type_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type_post` (
  `id_typePost` INT(11) NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `id_parent` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_typePost`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `content` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `view` VARCHAR(255) NULL DEFAULT NULL,
  `type_post_id_typePost` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_type_post1_idx` (`type_post_id_typePost` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_type_post1`
    FOREIGN KEY (`type_post_id_typePost`)
    REFERENCES `mydb`.`type_post` (`id_typePost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `id` INT(11) NOT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `content` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  `post_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comment_User1_idx` (`user_id` ASC),
  INDEX `fk_Comment_Image1_idx` (`image_id` ASC),
  INDEX `fk_Comment_Album1_idx` (`album_id` ASC),
  INDEX `fk_Comment_Event1_idx` (`event_id` ASC),
  INDEX `fk_Comment_Post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_Comment_Album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `mydb`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`like` (
  `id` INT(11) NOT NULL,
  `post_id` INT NOT NULL,
  `album_id` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `comment_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Like_Post1_idx` (`post_id` ASC),
  INDEX `fk_Like_Album1_idx` (`album_id` ASC),
  INDEX `fk_Like_Image1_idx` (`image_id` ASC),
  INDEX `fk_Like_Comment1_idx` (`comment_id` ASC),
  INDEX `fk_Like_Event1_idx` (`event_id` ASC),
  INDEX `fk_Like_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Like_Album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `mydb`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_Comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `mydb`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_Event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_Image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_Post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Like_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`share`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`share` (
  `id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `post_id` INT(11) NOT NULL,
  `share_social` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_share_user1_idx` (`user_id` ASC),
  INDEX `fk_share_album1_idx` (`album_id` ASC),
  INDEX `fk_share_image1_idx` (`image_id` ASC),
  INDEX `fk_share_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_share_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_share_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `mydb`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_share_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_share_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(50) NULL,
  `content` VARCHAR(45) NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_contact_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
