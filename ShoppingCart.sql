-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vending_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vending_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vending_db` DEFAULT CHARACTER SET utf8 ;
USE `vending_db` ;

-- -----------------------------------------------------
-- Table `vending_db`.`snacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vending_db`.`snacks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `price` DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vending_db`.`drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vending_db`.`drinks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `price` DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vending_db`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vending_db`.`cart` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `totalcost` DOUBLE UNSIGNED NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vending_db`.`snacks_has_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vending_db`.`snacks_has_cart` (
  `snacks_id` INT UNSIGNED NOT NULL,
  `cart_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`snacks_id`, `cart_id`),
  INDEX `fk_snacks_has_cart_cart1_idx` (`cart_id` ASC),
  INDEX `fk_snacks_has_cart_snacks_idx` (`snacks_id` ASC),
  CONSTRAINT `fk_snacks_has_cart_snacks`
    FOREIGN KEY (`snacks_id`)
    REFERENCES `vending_db`.`snacks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_snacks_has_cart_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `vending_db`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vending_db`.`cart_has_drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vending_db`.`cart_has_drinks` (
  `cart_id` INT UNSIGNED NOT NULL,
  `drinks_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cart_id`, `drinks_id`),
  INDEX `fk_cart_has_drinks_drinks1_idx` (`drinks_id` ASC),
  INDEX `fk_cart_has_drinks_cart1_idx` (`cart_id` ASC),
  CONSTRAINT `fk_cart_has_drinks_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `vending_db`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_has_drinks_drinks1`
    FOREIGN KEY (`drinks_id`)
    REFERENCES `vending_db`.`drinks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
