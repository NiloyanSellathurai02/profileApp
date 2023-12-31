-- MySQL Script generated by MySQL Workbench
-- Sun Oct 29 14:25:33 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolioApp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolioApp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolioApp` DEFAULT CHARACTER SET utf8 ;
USE `portfolioApp` ;

-- -----------------------------------------------------
-- Table `portfolioApp`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `linkedInURL` VARCHAR(128) NULL,
  `githubURL` VARCHAR(128) NULL,
  `about` VARCHAR(2048) NULL,
  `Created_at` TIMESTAMP NULL,
  `Updated_at` TIMESTAMP NULL,
  UNIQUE KEY (`email`),
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `portfolioApp`.`educations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`educations` (
  `ID_Education` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `About` VARCHAR(45) NULL,
  `user_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Education`, `user_ID`),
  CONSTRAINT `fk_Education_user`
    FOREIGN KEY (`user_ID`)
    REFERENCES `portfolioApp`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `portfolioApp`.`results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`results` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Result` FLOAT NULL,
  `Education_ID_Education` INT NOT NULL,
  `Education_user_ID` INT NOT NULL,
  PRIMARY KEY (`Education_ID_Education`, `Education_user_ID`),
  CONSTRAINT `fk_Result_Education1`
    FOREIGN KEY (`Education_ID_Education` , `Education_user_ID`)
    REFERENCES `portfolioApp`.`educations` (`ID_Education` , `user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `portfolioApp`.`hobbies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`hobbies` (
  `hobby` VARCHAR(45) NULL,
  `About` VARCHAR(45) NULL,
  `user_ID` INT NOT NULL,
  CONSTRAINT `fk_Hobby_user1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `portfolioApp`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `portfolioApp`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`skills` (
  `user_ID` INT NOT NULL,
  `Level` INT NULL,
  `skill` VARCHAR(45) NULL,
  `About` VARCHAR(45) NULL,
  CONSTRAINT `fk_Skills_user1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `portfolioApp`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `portfolioApp`.`jobExperience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`jobExperience` (
  `Name` VARCHAR(45) NULL,
  `About` VARCHAR(45) NULL,
  `Employer` VARCHAR(45) NULL,
  `Function` VARCHAR(45) NULL,
  `Length_start` DATETIME NULL,
  `Length_end` DATETIME NULL,
  `user_ID` INT NOT NULL,
  PRIMARY KEY (`user_ID`),
  CONSTRAINT `fk_Job_Experience_user1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `portfolioApp`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `portfolioApp`.`portfolioimages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioApp`.`portfolioimages` (
  `portfolio_img` MEDIUMBLOB NULL,
  `user_ID` INT NOT NULL,
  CONSTRAINT `fk_portfolioimages_user1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `portfolioApp`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
