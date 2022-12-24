SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE firm;

-- --------------------------------------------------------

INSERT INTO locations (LOCATION_ID, LOCATION_X, LOCATION_Y)
VALUES ('AAA', 5, 5),
        ('BBB', 15, 5),
        ('CCC', 5, 15),
        ('DDD', 15, 15),
        ('EEE', 8, 2),
        ('FFF', 12, 2),
        ('GGG', 8, 18),
        ('HHH', 12, 18),
        ('III', 3, 10),
        ('JJJ', 17, 10);

INSERT INTO plant (PLANT_ID, LOCATION_ID)
VALUES (1, 'AAA'),
        (2, 'BBB'),
        (3, 'CCC'),
        (4, 'DDD'),
        (5, 'EEE'),
        (6, 'FFF'),
        (7, 'GGG'),
        (8, 'HHH'),
        (9, 'III'),
        (10, 'JJJ');

INSERT INTO consumer (CONSUMER_ID, PHONENUM, USERNAME, LOCATION_ID)
VALUES (1, '123-456-7890', 'John Smith', 'AAA'),
        (2, '234-567-8901', 'Jane Smith', 'BBB'),
        (3, '345-678-9012', 'Bob Smith', 'CCC'),
        (4, '456-789-0123', 'Alice Smith', 'DDD'),
        (5, '567-890-1234', 'Mike Smith', 'EEE'),
        (6, '678-901-2345', 'Sara Smith', 'FFF'),
        (7, '789-012-3456', 'Tom Smith', 'GGG'),
        (8, '890-123-4567', 'Jessica Smith', 'HHH'),
        (9, '901-234-5678', 'Bill Smith', 'III'),
        (10, '012-345-6789', 'Kim Smith', 'JJJ');

INSERT INTO package (PACKAGE_ID, CONSUMER_ID, A1_NUM, A1_PLANT, B2_NUM, B2_PLANT, C3_NUM, C3_PLANT)
VALUES (1, 1, 100, 'A111', 100, 'B222', 100, 'C333'),
        (2, 2, 200, 'A111', 200, 'B222', 200, 'C333'),
        (3, 3, 300, 'A111', 300, 'B222', 300, 'C333'),
        (4, 4, 400, 'A111', 400, 'B222', 400, 'C333'),
        (5, 5, 500, 'A111', 500, 'B222', 500, 'C333'),
        (6, 6, 600, 'A111', 600, 'B222', 600, 'C333'),
        (7, 7, 700, 'A111', 700, 'B222', 700, 'C333'),
        (8, 8, 800, 'A111', 800, 'B222', 800, 'C333'),
        (9, 9, 900, 'A111', 900, 'B222', 900, 'C333'),
        (10, 10, 1000, 'A111', 1000, 'B222', 1000, 'C333');

INSERT INTO operation_type (OPERATION_TYPE_ID)
VALUES (1),
        (2),
        (3),
        (4),
        (5),
        (6),
        (7),
        (8),
        (9),
        (10);

INSERT INTO machine_type (MACHINE_TYPE_ID, OPERATION_TYPE_ID, EXECUTE_TIME, COST, FEASIBILITY)
VALUES (1, 1, 5, 50, 1),
        (2, 2, 10, 100, 1),
        (3, 3, 15, 150, 1),
        (4, 4, 20, 200, 1),
        (5, 5, 25, 250, 1),
        (6, 6, 30, 300, 1),
        (7, 7, 35, 350, 1),
        (8, 8, 40, 400, 1),
        (9, 1, 45, 450, 0),
        (10, 2, 50, 500, 0);

INSERT INTO machine (MACHINE_ID, MACHINE_TYPE_ID, PLANT_ID)
VALUES (1, 1, 1),
        (2, 2, 2),
        (3, 3, 3),
        (4, 4, 4),
        (5, 5, 5),
        (6, 6, 6),
        (7, 7, 7),
        (8, 8, 8),
        (9, 9, 9),
        (10, 10, 10);

INSERT INTO chip_type (CHIP_TYPE_ID)
VALUES (1),
        (2),
        (3),
        (4),
        (5),
        (6),
        (7),
        (8),
        (9),
        (10);

INSERT INTO chip (CHIP_ID, CHIP_TYPE_ID, PLANT_ID, MACHINE_ID, PACKAGE_ID)
VALUES (1, 1, 1, 1, 1),
        (2, 2, 2, 2, 2),
        (3, 3, 3, 3, 3),
        (4, 4, 4, 4, 4),
        (5, 5, 5, 5, 5),
        (6, 6, 6, 6, 6),
        (7, 7, 7, 7, 7),
        (8, 8, 8, 8, 8),
        (9, 9, 9, 9, 9),
        (10, 10, 10, 10, 10);


INSERT INTO operation (OPERATION_ID, OPERATION_TYPE_ID)
VALUES (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7),
        (8, 8),
        (9, 1),
        (10, 2);

INSERT INTO processing_record (MACHINE_ID, OPERATION_ID, START_TIME, END_TIME, EXPENSE)
VALUES (1, 1, '2022-01-01 08:00:00', '2022-01-01 09:00:00', 50),
        (2, 2, '2022-01-02 08:00:00', '2022-01-02 09:00:00', 100),
        (3, 3, '2022-01-03 08:00:00', '2022-01-03 09:00:00', 150),
        (4, 4, '2022-01-04 08:00:00', '2022-01-04 09:00:00', 200),
        (5, 5, '2022-01-05 08:00:00', '2022-01-05 09:00:00', 250),
        (6, 6, '2022-01-06 08:00:00', '2022-01-06 09:00:00', 300),
        (7, 7, '2022-01-07 08:00:00', '2022-01-07 09:00:00', 350),
        (8, 8, '2022-01-08 08:00:00', '2022-01-08 09:00:00', 400),
        (9, 9, '2022-01-09 08:00:00', '2022-01-09 09:00:00', 450),
        (10, 10, '2022-01-10 08:00:00', '2022-01-10 09:00:00', 500);

INSERT INTO produce_order (ORDER_NUMBER, PERDENCY_OPERATION_ID, OPERATION_TYPE_ID)
VALUES (1, 1, 1),
        (2, 2, 2),
        (3, 3, 3),
        (4, 4, 4),
        (5, 5, 5),
        (6, 6, 6),
        (7, 7, 7),
        (8, 8, 8),
        (9, 9, 1),
        (10, 10, 2);
-- --------------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;