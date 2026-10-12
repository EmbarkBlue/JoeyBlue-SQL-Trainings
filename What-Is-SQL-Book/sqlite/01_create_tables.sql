-- What is SQL? Your First Queries in Plain English
-- 3rd Edition, Joey Blue, Embark Blue Inc.
-- SQLite, script 1 of 2: create the store tables
-- Safe to re-run: it drops and recreates the tables.

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    CustomerID INTEGER PRIMARY KEY,
    FirstName  VARCHAR(50) NOT NULL,
    LastName   VARCHAR(50) NOT NULL,
    Age        INTEGER,
    City       VARCHAR(50)
);

CREATE TABLE Products (
    ProductID   INTEGER PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price       DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID    INTEGER PRIMARY KEY,
    OrderDate  DATE NOT NULL,
    CustomerID INTEGER NOT NULL
        REFERENCES Customer(CustomerID),
    ProductID  INTEGER NOT NULL
        REFERENCES Products(ProductID)
);
