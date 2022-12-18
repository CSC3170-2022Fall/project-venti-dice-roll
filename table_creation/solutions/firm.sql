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
-- Create entity `locations` here
-- -----------------------------------------------------
create table locations(
    LOCATION_ID varchar(30),
    LOCATION_X numeric(7,2),
    LOCATION_Y numeric(7,2),
    
    primary key(LOCATION_ID)
    
);

-- -----------------------------------------------------
-- Create entity `plant` here
-- -----------------------------------------------------
create table plant(
    PLANT_ID int,
    LOCATION_ID varchar(30),

    primary key(PLANT_ID),
    foreign key(LOCATION_ID) references locations(LOCATION_ID)
);


-- -----------------------------------------------------
-- Create entity `consumer` here
-- -----------------------------------------------------
create table consumer(
    CONSUMER_ID int,
    PLANT_ID int not null,
    PHONE_NUMBER varchar(30) not null,
    `ADDRESS` varchar(30) not null,
    `NAME` varchar(30) not null,
    LOCATION_ID varchar(30),

    primary key(CONSUMER_ID),
    foreign key(PLANT_ID) references plant(PLANT_ID),
    foreign key(LOCATION_ID) references locations(LOCATION_ID)
);

-- -----------------------------------------------------
-- Create entity `package` here
-- -----------------------------------------------------
create table package(
    PACKAGE_ID int,
    CONSUMER_ID int,
    BUDGET int,
    OVERALL_TIME varchar(30),

    primary key(PACKAGE_ID),
    foreign key(CONSUMER_ID) references consumer(CONSUMER_ID)
);

-- -----------------------------------------------------
-- Create entity `operation_type` here
-- -----------------------------------------------------
create table operation_type(
    OPERATION_TYPE_ID int,

    primary key(OPERATION_TYPE_ID)
    
);

-- -----------------------------------------------------
-- Create entity `machine_type` here
-- -----------------------------------------------------
create table machine_type(
    MACHINE_TYPE_ID int,
    OPERATION_TYPE_ID int,
    EXECUTE_TIME int,
    COST int,
    FEASIBILITY boolean,

    primary key(MACHINE_TYPE_ID),
    foreign key(OPERATION_TYPE_ID) references operation_type(OPERATION_TYPE_ID)

);

-- -----------------------------------------------------
-- Create entity `machine` here
-- -----------------------------------------------------
create table machine(
    MACHINE_ID int,
    MACHINE_TYPE_ID int,
    PLANT_ID int,

    primary key(MACHINE_ID),
    foreign key(PLANT_ID) references plant(PLANT_ID)
    
);

-- -----------------------------------------------------
-- Create entity `chip_type` here
-- -----------------------------------------------------
create table chip_type(
    CHIP_TYPE_ID int,

    primary key(CHIP_TYPE_ID)
);


-- -----------------------------------------------------
-- Create entity `chip` here
-- -----------------------------------------------------
create table chip(
    CHIP_ID int,
    CHIP_TYPE_ID int,
    PLANT_ID int not null,
    MACHINE_ID int not null,
    PACKAGE_ID int not null,

    primary key(CHIP_ID),
    foreign key(CHIP_TYPE_ID) references chip_type(CHIP_TYPE_ID),
    foreign key(PLANT_ID) references plant(PLANT_ID),
    foreign key(MACHINE_ID) references machine(MACHINE_ID),
    foreign key(PACKAGE_ID) references package(PACKAGE_ID)
    
);


-- -----------------------------------------------------
-- Create entity `operation` here
-- -----------------------------------------------------
create table operation(
    OPERATION_ID int,
    OPERATION_TYPE_ID int,

    primary key(OPERATION_ID),
    foreign key(OPERATION_TYPE_ID) references operation_type(OPERATION_TYPE_ID)
    
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
    foreign key(MACHINE_ID) references machine(MACHINE_ID),
    foreign key(OPERATION_ID) references operation(OPERATION_ID)
    
);

-- -----------------------------------------------------
-- Create relationship `produce_order here
-- -----------------------------------------------------
create table produce_order(
	ORDER_NUMBER int,
    PERDENCY_OPERATION_ID int,
    OPERATION_TYPE_ID int
    
);

-- -----------------------------------------------------
-- Recover Meta Data
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
