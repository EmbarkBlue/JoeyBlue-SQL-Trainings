-- What is SQL? Your First Queries in Plain English
-- 3rd Edition, Joey Blue, Embark Blue Inc.
-- SQL Server, script 1 of 2: create the database and tables
-- Run in SQL Server Management Studio (press F5).
-- Safe to re-run: it drops and recreates the tables.

IF DB_ID('WhatIsSQLStore') IS NULL
    CREATE DATABASE WhatIsSQLStore;
GO

USE WhatIsSQLStore;
GO

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customer;
GO

CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName  VARCHAR(50) NOT NULL,
    LastName   VARCHAR(50) NOT NULL,
    Age        INT,
    City       VARCHAR(50)
);

CREATE TABLE Products (
    ProductID   INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price       DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID    INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate  DATE NOT NULL,
    CustomerID INT NOT NULL
        REFERENCES Customer(CustomerID),
    ProductID  INT NOT NULL
        REFERENCES Products(ProductID)
);
GO
