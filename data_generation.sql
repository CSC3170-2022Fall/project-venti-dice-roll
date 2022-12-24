use firm

INSERT INTO locations (LOCATION_ID, LOCATION_X, LOCATION_Y)
VALUES ('A', 5, 5),
        ('B', 15, 5),
        ('C', 5, 15),
        ('D', 15, 15),
        ('E', 8, 2),
        ('F', 12, 2),
        ('G', 8, 18),
        ('H', 12, 18),
        ('I', 3, 10),
        ('J', 17, 10);

INSERT INTO plant (PLANT_ID, LOCATION_ID)
VALUES (1, 'A'),
        (2, 'B'),
        (3, 'C'),
        (4, 'D'),
        (5, 'E'),
        (6, 'F'),
        (7, 'G'),
        (8, 'H'),
        (9, 'I'),
        (10, 'J');

INSERT INTO consumer (CONSUMER_ID, PLANT_ID, PHONE_NUMBER, ADDRESS, NAME, LOCATION_ID)
VALUES (1, 1, '123-456-7890', '123 Main Street', 'John Smith', 'A'),
        (2, 2, '234-567-8901', '456 Main Street', 'Jane Smith', 'B'),
        (3, 3, '345-678-9012', '789 Main Street', 'Bob Smith', 'C'),
        (4, 4, '456-789-0123', '321 Main Street', 'Alice Smith', 'D'),
        (5, 5, '567-890-1234', '654 Main Street', 'Mike Smith', 'E'),
        (6, 6, '678-901-2345', '987 Main Street', 'Sara Smith', 'F'),
        (7, 7, '789-012-3456', '246 Main Street', 'Tom Smith', 'G'),
        (8, 8, '890-123-4567', '369 Main Street', 'Jessica Smith', 'H'),
        (9, 9, '901-234-5678', '159 Main Street', 'Bill Smith', 'I'),
        (10, 10, '012-345-6789', '753 Main Street', 'Kim Smith', 'J');

INSERT INTO package (PACKAGE_ID, CONSUMER_ID, BUDGET, OVERALL_TIME)
VALUES (1, 1, 100, '3 days'),
        (2, 2, 200, '5 days'),
        (3, 3, 300, '7 days'),
        (4, 4, 400, '10 days'),
        (5, 5, 500, '14 days'),
        (6, 6, 600, '21 days'),
        (7, 7, 700, '30 days'),
        (8, 8, 800, '45 days'),
        (9, 9, 900, '60 days'),
        (10, 10, 1000, '90 days');

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
