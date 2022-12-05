-- Meta Data Settings
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `firm`;

-- -----------------------------------------------------
-- Create Schema `firm`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firm` DEFAULT CHARACTER SET utf8;
USE `firm`;

-- -----------------------------------------------------
-- Create entity `consumer` here
-- -----------------------------------------------------
create table consumer(
    CONSUMER_ID int,
    PHONE_NUMBER varchar(30) not null,
    ADDRESS varchar(30),
    NAME varchar(30),
    PACKAGE_ID int,

    primary key(CONSUMER_ID),
    foreign key(PACKAGE_ID),
);

-- -----------------------------------------------------
-- Create entity `package` here
-- -----------------------------------------------------
create table package(
    PACKAGE_ID int,
    CONSUMER_ID int,
    BUDGET int,
    OVERALL_TIME varchar(30),
    content varchar(30),

    primary key(PACKAGE_ID),
    foreign key(CONSUMER_ID, PLANT_ID, CHIP_ID),
);

-- Create multivalue `content` here
create table content(
    PACKAGE_ID int,
    CHIP_ID int,

    primary key(PACKAGE_ID),
);

-- Create multivalue `producer` here
create table producer(
    PACKAGE_ID int,
    PLANT_ID int,

    primary key(PACKAGE_ID),
);


-- -----------------------------------------------------
-- Create entity `plant` here
-- -----------------------------------------------------
create table plant(
    PLANT_ID int,
    PLANT_LOCATION varchar(30),
    MACHINE_TYPE_ID int,
    MACHINE_NUM int,

    primary key(PLANT_ID),
    foreign key (MACHINE_TYPE_ID),
);

-- -----------------------------------------------------
-- Create entity `machine_type` here
-- -----------------------------------------------------
create table machine_type(
    MACHINE_TYPE_ID int,
    OPERATION_TYPE_ID int,
    EXECUTE_TIME int,
    COST int,

    primary key(MACHINE_TYPE_ID),
    foreign key(OPERATION_TYPE_ID),

);

-- -----------------------------------------------------
-- Create entity `machine` here
-- -----------------------------------------------------
create table machine(
    MACHINE_ID int,
    MACHINE_TYPE_ID int,
    OPERATION_ID int,
    CHIP_ID int,
    PLANT_ID int

    primary key(MACHINE_ID),
    foreign key(MACHINE_TYPE_ID, OPERATION_ID,
                CHIP_ID, PLANT_ID),

);

-- -----------------------------------------------------
-- Create entity `chip_type` here
-- -----------------------------------------------------
create table chip_type(
    CHIP_TYPE_ID int,
    NUMBER int,
    PRECEDENCY varchar(30),
    OPERATION_TYPE_ID int,

    primary key(CHIP_TYPE_ID),
    foreign key(OPERATION_TYPE_ID),
);

create table order(
    ORDER_ID int,
    PRODUCE_PROGRESS varchar(50),

    primary key(ORDER_ID),
);


-- -----------------------------------------------------
-- Create entity `chip` here
-- -----------------------------------------------------
create table chip(
    CHIP_ID int,
    CHIP_TYPE_ID int,

    primary key(CHIP_ID),
    foreign key(CHIP_TYPE_ID),
);

create table producer(
    CHIP_ID int,
    PLANT_ID int,

    primary key(CHIP_ID),
);

create table maker(
    CHIP_ID int,
    MACHINE_ID int,

    primary key(CHIP_ID),
);

-- -----------------------------------------------------
-- Create entity `operation_type` here
-- -----------------------------------------------------
create table operation_type(
    OPERATION_TYPE_ID int,
    MACHINE_TYPE_ID int,

    primary key(OPERATION_TYPE_ID),
    foreign key(MACHINE_TYPE_ID),
);

-- -----------------------------------------------------
-- Create entity `operation` here
-- -----------------------------------------------------
create table operation(
    OPERATION_ID int,
    OPERATION_TYPE_ID int,
    MACHINE_ID int,

    primary key(OPERATION_ID),
    foreign key(OPERATION_TYPE_ID, MACHINE_ID),
);

-- -----------------------------------------------------
-- Create relationship `processing_record` here
-- -----------------------------------------------------
create table processing_record(
    MACHINE_ID int,
    OPERATION_ID int,
    START_TIME varchar(30),
    END_TIME varchar(30),
    EXPENSE int,

    primary key(MACHINE_ID, OPERATION_ID),
);



-- -----------------------------------------------------
-- Recover Meta Data
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
