-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio3
-- -----------------------------------------------------
-- Vamos a realizar el diagrama de relacion en funcion de los datos que voy a necesitar.

-- -----------------------------------------------------
-- Schema portfolio3
--
-- Vamos a realizar el diagrama de relacion en funcion de los datos que voy a necesitar.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio3` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `portfolio3` ;

-- -----------------------------------------------------
-- Table `portfolio3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`usuario` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`datosuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`datosuser` (
  `id` INT NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `edad` INT NULL,
  `acercade` VARCHAR(255) NULL,
  `urlimg` VARCHAR(90) NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`),
  CONSTRAINT `fk_datosuser_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio3`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`credenciales` (
  `id` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `rol` VARCHAR(45) NOT NULL,
  `datosuser_id` INT NOT NULL,
  `datosuser_usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `datosuser_id`, `datosuser_usuario_id`),
  CONSTRAINT `fk_credenciales_datosuser1`
    FOREIGN KEY (`datosuser_id` , `datosuser_usuario_id`)
    REFERENCES `portfolio3`.`datosuser` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`expeubi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`expeubi` (
  `id` INT NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `urlimg` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`expetiempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`expetiempo` (
  `id` INT NOT NULL,
  `empresa` VARCHAR(90) NULL,
  `fechaini` VARCHAR(45) NULL,
  `fechafin` VARCHAR(45) NULL,
  `deltaanio` VARCHAR(45) NULL,
  `expeubi_id` INT NOT NULL,
  PRIMARY KEY (`id`, `expeubi_id`),
  CONSTRAINT `fk_expetiempo_expeubi1`
    FOREIGN KEY (`expeubi_id`)
    REFERENCES `portfolio3`.`expeubi` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`experiencia` (
  `id` INT NOT NULL,
  `trabajo` VARCHAR(90) NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  `expetiempo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`, `expetiempo_id`),
  CONSTRAINT `fk_experiencia_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio3`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_expetiempo1`
    FOREIGN KEY (`expetiempo_id`)
    REFERENCES `portfolio3`.`expetiempo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`edutiempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`edutiempo` (
  `id` INT NOT NULL,
  `fechaini` VARCHAR(45) NULL,
  `fechafin` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NOT NULL,
  `uriim` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`educacion` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(200) NULL,
  `institucion` VARCHAR(200) NULL,
  `edutiempo_id` INT NOT NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `edutiempo_id`, `usuario_id`),
  CONSTRAINT `fk_educacion_edutiempo1`
    FOREIGN KEY (`edutiempo_id`)
    REFERENCES `portfolio3`.`edutiempo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio3`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`idiomadato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`idiomadato` (
  `id` INT NOT NULL,
  `nivellectura` VARCHAR(90) NOT NULL,
  `nivelescritura` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`idioma` (
  `id` INT NOT NULL,
  `idioma` VARCHAR(255) NOT NULL,
  `idiomadato_id` INT NOT NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `idiomadato_id`, `usuario_id`),
  CONSTRAINT `fk_idioma_idiomadato1`
    FOREIGN KEY (`idiomadato_id`)
    REFERENCES `portfolio3`.`idiomadato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idioma_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio3`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`lenguajedato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`lenguajedato` (
  `id` INT NOT NULL,
  `info` VARCHAR(255) NULL,
  `nivel` VARCHAR(45) NULL,
  `urlimg` VARCHAR(255) NULL,
  `lenguajedatocol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio3`.`lenguaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio3`.`lenguaje` (
  `id` INT NOT NULL,
  `lenguaje` VARCHAR(200) NULL,
  `lenguajedato_id` INT NOT NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `lenguajedato_id`, `usuario_id`),
  CONSTRAINT `fk_lenguaje_lenguajedato1`
    FOREIGN KEY (`lenguajedato_id`)
    REFERENCES `portfolio3`.`lenguajedato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lenguaje_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio3`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
