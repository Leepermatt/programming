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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`agents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agents` (
  `agents_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`agents_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`employment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employment` (
  `employment_id` INT NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transactions` (
  `transactions_id` INT NOT NULL,
  `agents_id` INT NOT NULL,
  PRIMARY KEY (`transactions_id`, `agents_id`),
  INDEX `fk_transactions_agents1_idx` (`agents_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_agents1`
    FOREIGN KEY (`agents_id`)
    REFERENCES `mydb`.`agents` (`agents_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`lender_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lender_info` (
  `Lender_info_id` INT NOT NULL,
  `lender_name` VARCHAR(45) NULL DEFAULT NULL,
  `transactions_id` INT NOT NULL,
  PRIMARY KEY (`Lender_info_id`, `transactions_id`),
  INDEX `fk_Lender_info_transactions1_idx` (`transactions_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lender_info_transactions1`
    FOREIGN KEY (`transactions_id`)
    REFERENCES `mydb`.`transactions` (`transactions_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`spouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`spouse` (
  `Spouse_id` INT NOT NULL,
  `spouse_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Spouse_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`state` (
  `State_id` INT NOT NULL,
  `State_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`State_id`),
  UNIQUE INDEX `Statecol_UNIQUE` (`State_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customer_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_info` (
  `customer_info_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(13) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `price-range` INT NULL DEFAULT NULL,
  `customer_infocol` VARCHAR(45) NULL DEFAULT NULL,
  `Spouse_id` INT NOT NULL,
  `Lender_info_id` INT NOT NULL,
  `agents_id` INT NOT NULL,
  `employment_id` INT NOT NULL,
  `State_id` INT NOT NULL,
  PRIMARY KEY (`customer_info_id`, `employment_id`, `State_id`),
  INDEX `fk_customer_info_Spouse1_idx` (`Spouse_id` ASC) VISIBLE,
  INDEX `fk_customer_info_Lender_info1_idx` (`Lender_info_id` ASC) VISIBLE,
  INDEX `fk_customer_info_agents1_idx` (`agents_id` ASC) VISIBLE,
  INDEX `fk_customer_info_employment1_idx` (`employment_id` ASC) VISIBLE,
  INDEX `fk_customer_info_State1_idx` (`State_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_info_agents1`
    FOREIGN KEY (`agents_id`)
    REFERENCES `mydb`.`agents` (`agents_id`),
  CONSTRAINT `fk_customer_info_employment1`
    FOREIGN KEY (`employment_id`)
    REFERENCES `mydb`.`employment` (`employment_id`),
  CONSTRAINT `fk_customer_info_Lender_info1`
    FOREIGN KEY (`Lender_info_id`)
    REFERENCES `mydb`.`lender_info` (`Lender_info_id`),
  CONSTRAINT `fk_customer_info_Spouse1`
    FOREIGN KEY (`Spouse_id`)
    REFERENCES `mydb`.`spouse` (`Spouse_id`),
  CONSTRAINT `fk_customer_info_State1`
    FOREIGN KEY (`State_id`)
    REFERENCES `mydb`.`state` (`State_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`children`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`children` (
  `Children_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_info_id` INT NOT NULL,
  PRIMARY KEY (`Children_id`),
  INDEX `fk_Children_customer_info1_idx` (`customer_info_id` ASC) VISIBLE,
  CONSTRAINT `fk_Children_customer_info1`
    FOREIGN KEY (`customer_info_id`)
    REFERENCES `mydb`.`customer_info` (`customer_info_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`current_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`current_address` (
  `current_address_id` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `owned` TINYINT NOT NULL,
  `customer_info_id` INT NOT NULL,
  PRIMARY KEY (`current_address_id`, `customer_info_id`),
  INDEX `fk_current_address_customer_info1_idx` (`customer_info_id` ASC) VISIBLE,
  CONSTRAINT `fk_current_address_customer_info1`
    FOREIGN KEY (`customer_info_id`)
    REFERENCES `mydb`.`customer_info` (`customer_info_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`property_interested`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`property_interested` (
  `Property_id` INT NOT NULL,
  `property_address` VARCHAR(45) NOT NULL,
  `property_price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Property_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customer_info_has_property_interested`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_info_has_property_interested` (
  `customer_info_id` INT NOT NULL,
  `employment_id` INT NOT NULL,
  `State_id` INT NOT NULL,
  `Property_id` INT NOT NULL,
  PRIMARY KEY (`customer_info_id`, `employment_id`, `State_id`, `Property_id`),
  INDEX `fk_customer_info_has_Property_interested_Property_intereste_idx` (`Property_id` ASC) VISIBLE,
  INDEX `fk_customer_info_has_Property_interested_customer_info1_idx` (`customer_info_id` ASC, `employment_id` ASC, `State_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_info_has_Property_interested_customer_info1`
    FOREIGN KEY (`customer_info_id` , `employment_id` , `State_id`)
    REFERENCES `mydb`.`customer_info` (`customer_info_id` , `employment_id` , `State_id`),
  CONSTRAINT `fk_customer_info_has_Property_interested_Property_interested1`
    FOREIGN KEY (`Property_id`)
    REFERENCES `mydb`.`property_interested` (`Property_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customer_info_has_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_info_has_transactions` (
  `customer_info_id` INT NOT NULL,
  `employment_id` INT NOT NULL,
  `State_id` INT NOT NULL,
  `transactions_id` INT NOT NULL,
  `agents_id` INT NOT NULL,
  PRIMARY KEY (`customer_info_id`, `employment_id`, `State_id`, `transactions_id`, `agents_id`),
  INDEX `fk_customer_info_has_transactions_transactions1_idx` (`transactions_id` ASC, `agents_id` ASC) VISIBLE,
  INDEX `fk_customer_info_has_transactions_customer_info1_idx` (`customer_info_id` ASC, `employment_id` ASC, `State_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_info_has_transactions_customer_info1`
    FOREIGN KEY (`customer_info_id` , `employment_id` , `State_id`)
    REFERENCES `mydb`.`customer_info` (`customer_info_id` , `employment_id` , `State_id`),
  CONSTRAINT `fk_customer_info_has_transactions_transactions1`
    FOREIGN KEY (`transactions_id` , `agents_id`)
    REFERENCES `mydb`.`transactions` (`transactions_id` , `agents_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
