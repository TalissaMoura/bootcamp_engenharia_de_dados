-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema segurosCarro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema segurosCarro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `segurosCarro` ;
USE `segurosCarro` ;

-- -----------------------------------------------------
-- Table `segurosCarro`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `segurosCarro`.`Clientes` (
  `codClientes` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Sexo` VARCHAR(45) NULL,
  `TelefoneFixo` VARCHAR(45) NULL,
  `TelefoneCelular` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  PRIMARY KEY (`codClientes`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `CPF_UNIQUE` ON `segurosCarro`.`Clientes` (`CPF` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `segurosCarro`.`Carros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `segurosCarro`.`Carros` (
  `codCarros` INT NOT NULL,
  `Placa` VARCHAR(45) NULL,
  `Chassi` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Cor` VARCHAR(45) NULL,
  `Ano` DATE NULL,
  PRIMARY KEY (`codCarros`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Placa_UNIQUE` ON `segurosCarro`.`Carros` (`Placa` ASC) VISIBLE;

CREATE UNIQUE INDEX `Chassi_UNIQUE` ON `segurosCarro`.`Carros` (`Chassi` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `segurosCarro`.`Apólices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `segurosCarro`.`Apólices` (
  `codApólices` INT NOT NULL,
  `dataInicioVigência` DATE NULL,
  `dataFimVigência` DATE NULL,
  `valorTotalAssegurado` FLOAT NULL,
  `valorFranquia` FLOAT NULL,
  `codClientes` INT NOT NULL,
  `codCarros` INT NOT NULL,
  PRIMARY KEY (`codApólices`),
  CONSTRAINT `fk_Apólices_Clientes`
    FOREIGN KEY (`codClientes`)
    REFERENCES `segurosCarro`.`Clientes` (`codClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apólices_Carros1`
    FOREIGN KEY (`codCarros`)
    REFERENCES `segurosCarro`.`Carros` (`codCarros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Apólices_Clientes_idx` ON `segurosCarro`.`Apólices` (`codClientes` ASC) VISIBLE;

CREATE INDEX `fk_Apólices_Carros1_idx` ON `segurosCarro`.`Apólices` (`codCarros` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `segurosCarro`.`Sinistros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `segurosCarro`.`Sinistros` (
  `codSinistros` INT NOT NULL,
  `Condutor` VARCHAR(45) NULL,
  `dataOcorrência` DATE NULL,
  `horaOcorrência` TIMESTAMP(6) NULL,
  `tipoOcorrência` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `codCarros` INT NOT NULL,
  `codApólices` INT NOT NULL,
  PRIMARY KEY (`codSinistros`),
  CONSTRAINT `fk_Sinistros_Carros1`
    FOREIGN KEY (`codCarros`)
    REFERENCES `segurosCarro`.`Carros` (`codCarros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sinistros_Apólices1`
    FOREIGN KEY (`codApólices`)
    REFERENCES `segurosCarro`.`Apólices` (`codApólices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Sinistros_Carros1_idx` ON `segurosCarro`.`Sinistros` (`codCarros` ASC) VISIBLE;

CREATE INDEX `fk_Sinistros_Apólices1_idx` ON `segurosCarro`.`Sinistros` (`codApólices` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
