# Accounting/Finance Example Datasets

This document provides the sample SQL statements and files to set up the accounting/finance example discussed in the SSIS Introduction. These datasets will help demonstrate the complete ETL process in SSIS.

## 1. Source Database Setup

### 1.1. Create Source Database for Financial Transactions
```sql
CREATE DATABASE financial_transactions_db;
```

### 1.2. Use Source Database
```sql
USE financial_transactions_db;
```

### 1.3. Create Financial Transactions Table
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

### 1.4. Insert Sample Data into Financial Transactions Table
```sql
INSERT INTO financial_transactions (transaction_id, customer_id, supplier_name, transaction_date, amount, currency)
VALUES
    (1, 101, 'ABC Corp', '2024-01-15', 1000.00, 'USD'),
    (2, 102, 'XYZ Ltd', '2024-01-20', 1500.50, 'EUR'),
    (3, 103, 'Global Inc', '2024-02-05', 2000.00, 'GBP'),
    (4, 104, 'ABC Corp', '2024-02-10', 500.25, 'USD');
```

### 1.5. Create Customer Details Table
```sql
CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);
```

### 1.6. Insert Sample Data into Customer Details Table
```sql
INSERT INTO customer_details (customer_id, customer_name, email, phone)
VALUES
    (101, 'John Doe', 'john.doe@example.com', '123-456-7890'),
    (102, 'Jane Smith', 'jane.smith@example.com', '234-567-8901'),
    (103, 'Mike Johnson', 'mike.johnson@example.com', '345-678-9012'),
    (104, 'Emily Davis', 'emily.davis@example.com', '456-789-0123');
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

## 3. CSV File Setup

### 3.1. Supplier List File (`suppliers.csv`)
| supplier_id | supplier_name | contact_name | phone        |
|-------------|---------------|--------------|--------------|
| 201         | ABC Corp      | Alice Brown  | 567-890-1234 |
| 202         | XYZ Ltd       | Bob White    | 678-901-2345 |
| 203         | Global Inc    | Carol Green  | 789-012-3456 |

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
  - **SQL Server**: Extract financial transactions and customer details from `financial_transactions_db`.
  - **Excel**: Extract exchange rates.
  - **CSV**: Extract supplier information.

- **Transform**:
  - Perform lookups to enrich transaction data with customer and supplier details.
  - For supplier information, perform a lookup using `suppliers.csv` to retrieve the supplier phone number based on `supplier_name`.
  - Convert transaction amounts to a common currency using exchange rates.

- **Load**:
  - Store the transformed data into a data warehouse for financial analysis.
  - **Destination Table**: The final transformed data will be loaded into a table named `financial_analysis` in the `financial_data_warehouse` database.

These datasets will provide a complete environment for demonstrating SSIS workflows, including Control Flow and Data Flow tasks, transformations, error handling, and deployment.