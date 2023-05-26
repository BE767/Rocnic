-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema rocnicestatus
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rocnicestatus` ;

-- -----------------------------------------------------
-- Schema rocnicestatus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rocnicestatus` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `rocnicestatus` ;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`laboratorio` (
  `IdLaboratorio` INT NOT NULL AUTO_INCREMENT,
  `NombreLaboratorio` VARCHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`IdLaboratorio`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`perifericos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`perifericos` (
  `IdPeriferico` INT NOT NULL AUTO_INCREMENT,
  `NombrePerifericos` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`IdPeriferico`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`equipos` (
  `IdEquipo` INT NOT NULL AUTO_INCREMENT,
  `NombreEquipo` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `IdLaboratorio` INT NULL DEFAULT NULL,
  `IdPeriferico` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdEquipo`),
  INDEX `IdLaboratorio` (`IdLaboratorio` ASC),
  INDEX `IdPeriferico` (`IdPeriferico` ASC),
  CONSTRAINT `equipos_ibfk_1`
    FOREIGN KEY (`IdLaboratorio`)
    REFERENCES `rocnicestatus`.`laboratorio` (`IdLaboratorio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_2`
    FOREIGN KEY (`IdPeriferico`)
    REFERENCES `rocnicestatus`.`perifericos` (`IdPeriferico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`estatusreporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`estatusreporte` (
  `IdEstatusReporte` INT NOT NULL AUTO_INCREMENT,
  `NombreEstatus` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`IdEstatusReporte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`perfiles` (
  `IdPerfil` INT NOT NULL AUTO_INCREMENT,
  `NombrePerfil` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`IdPerfil`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`tiporeporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`tiporeporte` (
  `IdTipoReporte` INT NOT NULL AUTO_INCREMENT,
  `NombreTipoReporte` VARCHAR(20) NULL DEFAULT NULL,
  `FechaCreacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipoReporte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`usuarios` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `IdPerfil` INT NULL DEFAULT NULL,
  `Usuario` VARCHAR(20) NULL DEFAULT NULL,
  `Contrasena` VARCHAR(20) NULL DEFAULT NULL,
  `Nombre` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  INDEX `IdPerfil` (`IdPerfil` ASC),
  CONSTRAINT `usuarios_ibfk_1`
    FOREIGN KEY (`IdPerfil`)
    REFERENCES `rocnicestatus`.`perfiles` (`IdPerfil`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`tipoerror`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`tipoerror` (
  `IdTipoError` INT NOT NULL AUTO_INCREMENT,
  `NombreError` VARCHAR(50) NULL DEFAULT NULL,
  `IdTipoReporte` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipoError`),
  INDEX `IdTipoReporte` (`IdTipoReporte` ASC),
  CONSTRAINT `tipoerror_ibfk_1`
    FOREIGN KEY (`IdTipoReporte`)
    REFERENCES `rocnicestatus`.`tiporeporte` (`IdTipoReporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `rocnicestatus`.`reportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocnicestatus`.`reportes` (
  `IdReporte` INT NOT NULL AUTO_INCREMENT,
  `IdTipoReporte` INT NULL DEFAULT NULL,
  `IdLaboratorio` INT NULL DEFAULT NULL,
  `IdEquipo` INT NULL DEFAULT NULL,
  `IdUsuario` INT NULL DEFAULT NULL,
  `IdTipoError` INT NULL DEFAULT NULL,
  `IdEstatusReporte` INT NULL DEFAULT NULL,
  `FechaCreacion` DATETIME NULL DEFAULT NULL,
  `FechaActualizacion` DATETIME NULL DEFAULT NULL,
  `UsuarioActualizacion` DATETIME NULL DEFAULT NULL,
  `UsuarioCreacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`IdReporte`),
  INDEX `IdTipoReporte` (`IdTipoReporte` ASC),
  INDEX `IdLaboratorio` (`IdLaboratorio` ASC),
  INDEX `IdUsuario` (`IdUsuario` ASC),
  INDEX `IdTipoError` (`IdTipoError` ASC),
  INDEX `IdEstatusReporte` (`IdEstatusReporte` ASC),
  INDEX `IdEquipo` (`IdEquipo` ASC),
  CONSTRAINT `reportes_ibfk_1`
    FOREIGN KEY (`IdTipoReporte`)
    REFERENCES `rocnicestatus`.`tiporeporte` (`IdTipoReporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reportes_ibfk_2`
    FOREIGN KEY (`IdLaboratorio`)
    REFERENCES `rocnicestatus`.`laboratorio` (`IdLaboratorio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reportes_ibfk_3`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `rocnicestatus`.`usuarios` (`IdUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reportes_ibfk_4`
    FOREIGN KEY (`IdTipoError`)
    REFERENCES `rocnicestatus`.`tipoerror` (`IdTipoError`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reportes_ibfk_5`
    FOREIGN KEY (`IdEstatusReporte`)
    REFERENCES `rocnicestatus`.`estatusreporte` (`IdEstatusReporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reportes_ibfk_6`
    FOREIGN KEY (`IdEquipo`)
    REFERENCES `rocnicestatus`.`equipos` (`IdEquipo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
