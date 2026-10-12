-- What is SQL? Your First Queries in Plain English
-- 3rd Edition, Joey Blue, Embark Blue Inc.
-- SQL Server, script 2 of 2: add the sample data
-- Run 01_create_tables.sql first.

USE WhatIsSQLStore;
GO

INSERT INTO Customer (FirstName, LastName, Age, City)
VALUES ('Joey',  'Blue',    40, 'Goddard'),
       ('Barry', 'Bonds',   50, 'San Francisco'),
       ('Mike',  'Schmidt', 60, 'Kansas City');

INSERT INTO Products (ProductName, Price)
VALUES ('Baseball',   5.95),
       ('Bat',      195.99);

INSERT INTO Orders (OrderDate, CustomerID, ProductID)
VALUES ('2026-10-01', 1, 1),
       ('2026-10-01', 1, 1),
       ('2026-10-02', 2, 1),
       ('2026-10-02', 2, 1),
       ('2026-10-02', 2, 2),
       ('2026-10-03', 2, 2),
       ('2026-10-03', 2, 2),
       ('2026-10-04', 2, 2),
       ('2026-10-04', 3, 2),
       ('2026-10-05', 3, 2);
GO
