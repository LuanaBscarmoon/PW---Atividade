-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pw;
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pw;
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pw` DEFAULT CHARACTER SET utf8 ;
USE `pw` ;

-- -----------------------------------------------------
-- Table `pw`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pw`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `enderecoCliente` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `telefoneCliente` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `nascimentoCliente` DATE NULL DEFAULT NULL,
  `bairroCliente` VARCHAR(50) NULL DEFAULT NULL,
  `cidadeCliente` VARCHAR(50) NULL DEFAULT NULL,
  `estadoCliente` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pw`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pw`.`servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nomeServico` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `descricaoServico` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `precoServico` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pw`.`ordemservico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pw`.`ordemservico` (
  `idOS` INT NOT NULL,
  `dataOS` VARCHAR(45) NULL DEFAULT NULL,
  `idCliente` INT NULL DEFAULT NULL,
  `totalOS` DECIMAL(10,2) NULL DEFAULT NULL,
  `descontoOS` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idOS`),
  CONSTRAINT `fk_Venda_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pw`.`cliente` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_Venda_Cliente_idx` ON `pw`.`ordemservico` (`idCliente` ASC) VISIBLE;

-- -----------------------------------------------------
-- Table `pw`.`itemos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pw`.`itemos` (
  `idVenda` INT NOT NULL,
  `idServico` INT NOT NULL,
  `QuantidadeIOS` DECIMAL(10,2) NULL DEFAULT NULL,
  `valorServico` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idVenda`, `idServico`),
  CONSTRAINT `fk_itemVenda_Produto`
    FOREIGN KEY (`idServico`)
    REFERENCES `pw`.`servico` (`idServico`),
  CONSTRAINT `fk_itemVenda_Venda`
    FOREIGN KEY (`idVenda`)
    REFERENCES `pw`.`ordemservico` (`idOS`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_itemVenda_Produto_idx` ON `pw`.`itemos` (`idServico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `pw`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pw`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `loginUsuario` VARCHAR(45) NOT NULL,
  `senhaUsuario` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
