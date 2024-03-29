-- MySQL Script generated by MySQL Workbench
-- Thu Oct 10 14:41:35 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`financial report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`financial report` (
  `id` INT NOT NULL,
  `fr_num` INT(3) NULL,
  `fr_amount` INT(100) NULL,
  `fr_date` TIMESTAMP(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `fr_num_UNIQUE` (`fr_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contract` (
  `id` INT NOT NULL,
  `con_signed` VARCHAR(2) NULL,
  `con_date` TIMESTAMP(10) NULL,
  `con_expiration` TIMESTAMP(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `con_signed_UNIQUE` (`con_signed` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
