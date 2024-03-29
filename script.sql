-- MySQL Script generated by MySQL Workbench
-- Wed Apr 20 10:32:43 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema test_pratique_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `test_pratique_db`;

-- -----------------------------------------------------
-- Schema test_pratique_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_pratique_db` DEFAULT CHARACTER SET utf8;
USE `test_pratique_db`;

-- -----------------------------------------------------
-- Table `test_pratique_db`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test_pratique_db`.`employees`;

CREATE TABLE IF NOT EXISTS `test_pratique_db`.`employees`
(
    `id`        VARCHAR(45) NOT NULL,
    `lastname`  VARCHAR(45) NOT NULL,
    `firstname` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_pratique_db`.`operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test_pratique_db`.`operations`;

CREATE TABLE IF NOT EXISTS `test_pratique_db`.`operations`
(
    `id`     VARCHAR(45) NOT NULL,
    `name`   VARCHAR(45) NOT NULL,
    `hourly` DOUBLE      NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_pratique_db`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test_pratique_db`.`tasks`;

CREATE TABLE IF NOT EXISTS `test_pratique_db`.`tasks`
(
    `id`           BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id`  VARCHAR(45)         NOT NULL,
    `operation_id` VARCHAR(45)         NOT NULL,
    `salary`       DOUBLE              NOT NULL,
    `start_at`     DATETIME            NOT NULL,
    `end_at`       DATETIME            NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_plannings_tasks1_idx` (`operation_id` ASC),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    CONSTRAINT `fk_plannings_employees`
        FOREIGN KEY (`employee_id`)
            REFERENCES `test_pratique_db`.`employees` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_plannings_tasks1`
        FOREIGN KEY (`operation_id`)
            REFERENCES `test_pratique_db`.`operations` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `test_pratique_db`.`employees`
-- -----------------------------------------------------
START TRANSACTION;
USE `test_pratique_db`;
INSERT INTO `test_pratique_db`.`employees` (`id`, `lastname`, `firstname`)
VALUES ('EMP1', 'Employee', '1');
INSERT INTO `test_pratique_db`.`employees` (`id`, `lastname`, `firstname`)
VALUES ('EMP2', 'Employee', '2');
INSERT INTO `test_pratique_db`.`employees` (`id`, `lastname`, `firstname`)
VALUES ('EMP3', 'Employee', '3');
INSERT INTO `test_pratique_db`.`employees` (`id`, `lastname`, `firstname`)
VALUES ('EMP4', 'Employee', '4');
INSERT INTO `test_pratique_db`.`employees` (`id`, `lastname`, `firstname`)
VALUES ('EMP5', 'Employee', '5');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test_pratique_db`.`operations`
-- -----------------------------------------------------
START TRANSACTION;
USE `test_pratique_db`;
INSERT INTO `test_pratique_db`.`operations` (`id`, `name`, `hourly`)
VALUES ('OP1', 'Operation 1', 100);
INSERT INTO `test_pratique_db`.`operations` (`id`, `name`, `hourly`)
VALUES ('OP2', 'Operation 2', 200);
INSERT INTO `test_pratique_db`.`operations` (`id`, `name`, `hourly`)
VALUES ('OP3', 'Operation 3', 500);
INSERT INTO `test_pratique_db`.`operations` (`id`, `name`, `hourly`)
VALUES ('OP4', 'Operation 4', 1000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test_pratique_db`.`tasks`
-- -----------------------------------------------------
START TRANSACTION;
USE `test_pratique_db`;
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP3', 'OP1', 100, '2022-01-20 10:00:00', '2022-01-20 11:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP4', 'OP1', 600, '2022-02-20 10:00:00', '2022-02-20 16:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP1', 'OP1', 100, '2022-04-20 10:00:00', '2022-04-20 11:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP1', 'OP2', 400, '2022-04-20 12:00:00', '2022-04-20 14:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP1', 'OP4', 1000, '2022-04-20 15:00:00', '2022-04-20 16:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP1', 'OP4', 1000, '2021-04-20 15:00:00', '2021-04-20 16:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP2', 'OP1', 800, '2022-04-21 08:00:00', '2022-04-21 16:00:00');
INSERT INTO `test_pratique_db`.`tasks` (`id`, `employee_id`, `operation_id`, `salary`, `start_at`, `end_at`)
VALUES (DEFAULT, 'EMP2', 'OP1', 800, '2022-05-21 08:00:00', '2022-05-21 16:00:00');

COMMIT;

