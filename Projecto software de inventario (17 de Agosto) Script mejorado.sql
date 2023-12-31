-- MySQL Script generated by MySQL Workbench
-- Thu Aug 17 19:45:09 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inventario` DEFAULT CHARACTER SET utf8 ;
USE `Inventario` ;

-- -----------------------------------------------------
-- Table `Inventario`.`Listadeproductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Listadeproductos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` TEXT NOT NULL,
  `Cantidad` VARCHAR(20) NOT NULL,
  `Tipodeproducto` VARCHAR(20) NOT NULL,
  `Localizacion` VARCHAR(20) NOT NULL,
  `Preciodeventa` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Historial` (
  `Iddelaacciónrealizada` INT NOT NULL AUTO_INCREMENT,
  `Nombredelaacción` VARCHAR(45) NOT NULL,
  `Hora` DATE NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`Iddelaacciónrealizada`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Administrador` (
  `Listadodeclientesyproveedores` VARCHAR(10) NOT NULL,
  `Categoriadeclientesyproveedores` VARCHAR(10) NOT NULL,
  `Listadeproductos` VARCHAR(10) NOT NULL,
  `Historial` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Listadodeclientesyproveedores`, `Listadeproductos`, `Historial`),
  INDEX `fk_Administrador_Lista de productos1_idx` (`Listadeproductos` ASC) VISIBLE,
  INDEX `fk_Administrador_Historial1_idx` (`Historial` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_Lista de productos1`
    FOREIGN KEY (`Listadeproductos`)
    REFERENCES `Inventario`.`Listadeproductos` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_Historial1`
    FOREIGN KEY (`Historial`)
    REFERENCES `Inventario`.`Historial` (`Iddelaacciónrealizada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Clientes` (
  `Nombre` VARCHAR(35) NOT NULL,
  `ZonadeBogotá` VARCHAR(35) NOT NULL,
  `Códigodelpedido` VARCHAR(35) NOT NULL,
  `ListadeProductos` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`Nombre`, `Códigodelpedido`),
  INDEX `fk_Clientes_Administrador1_idx` (`Códigodelpedido` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Administrador1`
    FOREIGN KEY (`Códigodelpedido`)
    REFERENCES `Inventario`.`Administrador` (`Listadodeclientesyproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Proveedores` (
  `Nombre` VARCHAR(35) NOT NULL,
  `ZonadeBogotá` VARCHAR(35) NOT NULL,
  `Productosdisponibles` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`Nombre`, `Productosdisponibles`),
  INDEX `fk_Proveedores_Administrador1_idx` (`Productosdisponibles` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedores_Administrador1`
    FOREIGN KEY (`Productosdisponibles`)
    REFERENCES `Inventario`.`Administrador` (`Listadodeclientesyproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
