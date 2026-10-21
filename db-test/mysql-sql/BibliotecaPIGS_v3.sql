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
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `idAUTOR` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAUTOR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libro` (
  `idLIBRO` INT NOT NULL,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `isbn` VARCHAR(45) NULL DEFAULT NULL,
  `anio_publicacion` INT NULL DEFAULT NULL,
  `imagen_base64` VARCHAR(1000) NULL,
  `editorial` VARCHAR(45) NULL DEFAULT NULL,
  `genero` VARCHAR(45) NULL,
  `idAUTOR` INT NOT NULL,
  PRIMARY KEY (`idLIBRO`),
  INDEX `fk_LIBRO_AUTOR1_idx` (`idAUTOR` ASC) VISIBLE,
  CONSTRAINT `fk_LIBRO_AUTOR1`
    FOREIGN KEY (`idAUTOR`)
    REFERENCES `mydb`.`autor` (`idAUTOR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ejemplar` (
  `idEJEMPLAR` INT NOT NULL,
  `idLIBRO` INT NOT NULL,
  `codigo_inventario` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `ubicacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEJEMPLAR`),
  UNIQUE INDEX `codigo_inventario_UNIQUE` (`codigo_inventario` ASC) VISIBLE,
  INDEX `fk_EJEMPLAR_LIBRO1_idx` (`idLIBRO` ASC) VISIBLE,
  CONSTRAINT `fk_EJEMPLAR_LIBRO1`
    FOREIGN KEY (`idLIBRO`)
    REFERENCES `mydb`.`libro` (`idLIBRO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rol` (
  `idROL` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idROL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idUSUARIO` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_alta` DATE NULL DEFAULT NULL,
  `token_recuperacion` VARCHAR(255) NULL,
  `expiracion_token` DATETIME NULL,
  `idROL` INT NOT NULL,
  PRIMARY KEY (`idUSUARIO`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_usuario_rol_idx` (`idROL` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`idROL`)
    REFERENCES `mydb`.`rol` (`idROL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleado` (
  `idEMPLEADO` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `puesto` VARCHAR(45) NULL DEFAULT NULL,
  `USUARIO_idUSUARIO` INT NOT NULL,
  PRIMARY KEY (`idEMPLEADO`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_USUARIO1_idx` (`USUARIO_idUSUARIO` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_USUARIO1`
    FOREIGN KEY (`USUARIO_idUSUARIO`)
    REFERENCES `mydb`.`usuario` (`idUSUARIO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`permiso` (
  `idPERMISO` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idPERMISO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`socio` (
  `idSOCIO` INT NOT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `contador_sanciones` INT NULL DEFAULT '0',
  `USUARIO_idUSUARIO` INT NOT NULL,
  PRIMARY KEY (`idSOCIO`),
  INDEX `fk_SOCIO_USUARIO1_idx` (`USUARIO_idUSUARIO` ASC) VISIBLE,
  CONSTRAINT `fk_SOCIO_USUARIO1`
    FOREIGN KEY (`USUARIO_idUSUARIO`)
    REFERENCES `mydb`.`usuario` (`idUSUARIO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservas` (
  `idRESERVAS` INT NOT NULL AUTO_INCREMENT,
  `fecha_reserva` DATE NULL,
  `estado` VARCHAR(45) NULL,
  `empleado_idEMPLEADO` INT NOT NULL,
  `socio_idSOCIO` INT NOT NULL,
  `libro_idLIBRO` INT NOT NULL,
  PRIMARY KEY (`idRESERVAS`),
  INDEX `fk_reservas_empleado1_idx` (`empleado_idEMPLEADO` ASC) VISIBLE,
  INDEX `fk_reservas_socio1_idx` (`socio_idSOCIO` ASC) VISIBLE,
  INDEX `fk_reservas_libro1_idx` (`libro_idLIBRO` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_empleado1`
    FOREIGN KEY (`empleado_idEMPLEADO`)
    REFERENCES `mydb`.`empleado` (`idEMPLEADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_socio1`
    FOREIGN KEY (`socio_idSOCIO`)
    REFERENCES `mydb`.`socio` (`idSOCIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_libro1`
    FOREIGN KEY (`libro_idLIBRO`)
    REFERENCES `mydb`.`libro` (`idLIBRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestamo` (
  `idPRESTAMO` INT NOT NULL,
  `idSOCIO` INT NOT NULL,
  `idEJEMPLAR` INT NOT NULL,
  `fecha_prestamo` DATE NULL DEFAULT NULL,
  `fecha_devolucion_prevista` DATE NULL DEFAULT NULL,
  `fecha_devolucion_real` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `reservas_idRESERVAS` INT NOT NULL,
  PRIMARY KEY (`idPRESTAMO`),
  INDEX `fk_PRESTAMO_SOCIO1_idx` (`idSOCIO` ASC) VISIBLE,
  INDEX `fk_PRESTAMO_EJEMPLAR1_idx` (`idEJEMPLAR` ASC) VISIBLE,
  INDEX `fk_prestamo_reservas1_idx` (`reservas_idRESERVAS` ASC) VISIBLE,
  CONSTRAINT `fk_PRESTAMO_EJEMPLAR1`
    FOREIGN KEY (`idEJEMPLAR`)
    REFERENCES `mydb`.`ejemplar` (`idEJEMPLAR`),
  CONSTRAINT `fk_PRESTAMO_SOCIO1`
    FOREIGN KEY (`idSOCIO`)
    REFERENCES `mydb`.`socio` (`idSOCIO`),
  CONSTRAINT `fk_prestamo_reservas1`
    FOREIGN KEY (`reservas_idRESERVAS`)
    REFERENCES `mydb`.`reservas` (`idRESERVAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rol_has_permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rol_has_permiso` (
  `ROL_idROL` INT NOT NULL,
  `PERMISO_idPERMISO` INT NOT NULL,
  PRIMARY KEY (`ROL_idROL`, `PERMISO_idPERMISO`),
  INDEX `fk_ROL_has_PERMISO_PERMISO1_idx` (`PERMISO_idPERMISO` ASC) VISIBLE,
  INDEX `fk_ROL_has_PERMISO_ROL1_idx` (`ROL_idROL` ASC) VISIBLE,
  CONSTRAINT `fk_ROL_has_PERMISO_PERMISO1`
    FOREIGN KEY (`PERMISO_idPERMISO`)
    REFERENCES `mydb`.`permiso` (`idPERMISO`),
  CONSTRAINT `fk_ROL_has_PERMISO_ROL1`
    FOREIGN KEY (`ROL_idROL`)
    REFERENCES `mydb`.`rol` (`idROL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`sancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sancion` (
  `idSANCION` INT NOT NULL,
  `idPRESTAMO` INT NOT NULL,
  `cantidad` DECIMAL(6,2) NULL DEFAULT NULL,
  `motivo` VARCHAR(100) NULL DEFAULT NULL,
  `gravedad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idSANCION`),
  INDEX `fk_SANCION_PRESTAMO1_idx` (`idPRESTAMO` ASC) VISIBLE,
  CONSTRAINT `fk_SANCION_PRESTAMO1`
    FOREIGN KEY (`idPRESTAMO`)
    REFERENCES `mydb`.`prestamo` (`idPRESTAMO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
