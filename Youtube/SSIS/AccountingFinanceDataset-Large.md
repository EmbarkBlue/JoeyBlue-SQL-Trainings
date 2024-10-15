# Accounting/Finance Example Datasets (Large Scale)

This document provides the sample SQL statements and files to set up an expanded version of the accounting/finance example discussed in the SSIS Introduction. These larger datasets will help demonstrate the complete ETL process in SSIS, suitable for performance and scalability testing.

## 1. Source Database Setup

### 1.1. Create Source Database for Financial Transactions
```sql
CREATE DATABASE financial_transactions_db;
```

### 2.2. Use Source Database
```sql
USE financial_transactions_db;
```
## 2. SQL Server Setup

### 2.1. Create Financial Transactions Table
```sql
CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    supplier_name VARCHAR(50),
    transaction_date DATE,
    amount DECIMAL(10, 2),
    currency VARCHAR(10)
);
```

### 2.2. Insert Sample Data into Financial Transactions Table
```sql
DECLARE @counter INT = 1;

WHILE @counter <= 1000000
BEGIN
    INSERT INTO financial_transactions (transaction_id, customer_id, supplier_name, transaction_date, amount, currency)
    VALUES
        (@counter, (101 + (@counter % 1000)), 
         CASE 
            WHEN @counter % 3 = 0 THEN 'ABC Corp'
            WHEN @counter % 3 = 1 THEN 'XYZ Ltd'
            ELSE 'Global Inc'
         END,
         DATEADD(DAY, @counter % 365, '2024-01-01'),
         ROUND(RAND() * 10000, 2),
         CASE 
            WHEN @counter % 4 = 0 THEN 'USD'
            WHEN @counter % 4 = 1 THEN 'EUR'
            ELSE 'GBP'
         END);
    SET @counter = @counter + 1;
END;
```

### 2.3. Create Customer Details Table
```sql
CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);
```

### 2.4. Insert Sample Data into Customer Details Table
```sql
DECLARE @customer_id INT = 101;

WHILE @customer_id <= 1100
BEGIN
    INSERT INTO customer_details (customer_id, customer_name, email, phone)
    VALUES
        (@customer_id, CONCAT('Customer ', @customer_id), CONCAT('customer', @customer_id, '@example.com'), 
        CONCAT('123-456-', RIGHT('0000' + CAST(@customer_id AS VARCHAR(4)), 4)));
    SET @customer_id = @customer_id + 1;
END;
```

## 2. Excel File Setup

### 2.1. Exchange Rates File (`exchange_rates.xlsx`)
- **Sheet Name**: `Rates`
- **Columns**:
  - `from_currency` (VARCHAR)
  - `to_currency` (VARCHAR)
  - `exchange_rate` (DECIMAL)
  - `effective_date` (DATE)

| from_currency | to_currency | exchange_rate | effective_date |
|---------------|------------|---------------|----------------|
| USD           | USD        | 1.00          | 2024-01-01     |
| EUR           | USD        | 0.89          | 2024-01-01     |
| GBP           | USD        | 1.30          | 2024-01-01     |
| JPY           | USD        | 0.0074        | 2024-01-01     |
| CAD           | USD        | 0.78          | 2024-01-01     |

## 3. CSV File Setup

### 3.1. Supplier List File (`suppliers.csv`)
| supplier_id | supplier_name | contact_name | phone        |
|-------------|---------------|--------------|--------------|
| 201         | ABC Corp      | Alice Brown  | 567-890-1234 |
| 202         | XYZ Ltd       | Bob White    | 678-901-2345 |
| 203         | Global Inc    | Carol Green  | 789-012-3456 |
| 204         | National Supplies | Dave Black | 890-123-4567 |
| 205         | World Trade Ltd | Eve Adams   | 901-234-5678 |

Save this file as `suppliers.csv` with the above columns and data.

## 4. Data Warehouse Setup

### 4.1. Create Data Warehouse Database
```sql
CREATE DATABASE financial_data_warehouse;
```

### 4.2. Use Data Warehouse Database
```sql
USE financial_data_warehouse;
```

### 4.3. Create Financial Analysis Table in Data Warehouse
```sql
CREATE TABLE financial_analysis (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    supplier_name VARCHAR(50),
    transaction_date DATE,
    amount_usd DECIMAL(10, 2),
    supplier_phone VARCHAR(20)
);
```

## 5. ETL Workflow Recap

- **Extract**:
  - **SQL Server**: Extract financial transactions and customer details.
  - **Excel**: Extract exchange rates.
  - **CSV**: Extract supplier information.

- **Transform**:
  - Perform lookups to enrich transaction data with customer and supplier details.
  - For supplier information, perform a lookup using `suppliers.csv` to retrieve the supplier phone number based on `supplier_name`.
  - Convert transaction amounts to a common currency using exchange rates.

- **Load**:
  - Store the transformed data into a data warehouse for financial analysis.
  - **Destination Table**: The final transformed data will be loaded into a table named `financial_analysis` in the `financial_data_warehouse` database.

These larger datasets will provide a complete environment for demonstrating SSIS workflows, including Control Flow and Data Flow tasks, transformations, error handling, and deployment. This expanded version is well-suited for scalability and performance testing to ensure that SSIS packages can handle significant data volumes effectively.