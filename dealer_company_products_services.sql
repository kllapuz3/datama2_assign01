-- MySQL Script generated by MySQL Workbench
-- Thu Oct 10 14:56:43 2019
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
-- Table `mydb`.`dealer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dealer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `deal_num` INT NULL,
  `deal_date` TIMESTAMP(10) NULL,
  `deal_vehicle` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `deal_num_UNIQUE` (`deal_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comp_num` INT NULL,
  `comp_foundation` VARCHAR(45) NULL,
  `comp_site` VARCHAR(45) NULL,
  `comp_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `comp_num_UNIQUE` (`comp_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prod_num` INT NULL,
  `prod_exp_date` TIMESTAMP(10) NULL,
  `prod_manufac` VARCHAR(45) NULL,
  `prod_ingredient` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `prod_num_UNIQUE` (`prod_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serv_num` VARCHAR(45) NULL,
  `serv_dats` TIMESTAMP(10) NULL,
  `serv_no_of_men` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `serv_num_UNIQUE` (`serv_num` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;