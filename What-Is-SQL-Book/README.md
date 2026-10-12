# What is SQL? Your First Queries in Plain English (3rd Edition)

Free practice files for the book *What is SQL? Your First Queries in Plain English*, 3rd Edition, by Joey Blue (Embark Blue Inc.).

You don't need to sign up for anything. Download the files and start practicing.

## What's in this folder

| File | What it is |
|---|---|
| `sqlite/store.db` | A finished SQLite database with the book's store tables and sample data. Open it and you can start querying right away. |
| `sqlite/01_create_tables.sql` | Creates the `Customer`, `Products` and `Orders` tables in SQLite. |
| `sqlite/02_insert_data.sql` | Adds the sample customers, products and orders in SQLite. |
| `sqlserver/01_create_tables.sql` | Creates the `WhatIsSQLStore` database and the same three tables in Microsoft SQL Server. |
| `sqlserver/02_insert_data.sql` | Adds the same sample data in SQL Server. |

The data matches the queries and results printed in the book: 3 customers, 2 products and 10 orders, with total sales of $1,199.74.

## Option 1: Open the ready-made database (easiest)

1. Download `sqlite/store.db`. (On GitHub, click the file name, then the download button.)
2. Install the free [DB Browser for SQLite](https://sqlitebrowser.org/).
3. Open DB Browser, click **Open Database** and choose `store.db`.
4. Click the **Execute SQL** tab, type `SELECT * FROM Customer;` and press Ctrl+Enter (Cmd+Enter on a Mac).

## Option 2: Build it yourself in SQLite

1. In DB Browser for SQLite, click **New Database** and save it as `store.db`. Close the "Edit table definition" window if it pops up.
2. On the **Execute SQL** tab, paste in `sqlite/01_create_tables.sql` and run it.
3. Paste in `sqlite/02_insert_data.sql` and run it.
4. Click **Write Changes** to save.

Using the `sqlite3` command-line tool instead? Run:

```
sqlite3 store.db ".read sqlite/01_create_tables.sql" ".read sqlite/02_insert_data.sql"
```

Note: in the `sqlite3` command-line tool, foreign keys are off by default. Run `PRAGMA foreign_keys = ON;` at the start of each session if you want to try the foreign key examples in Chapter 6.

## Option 3: Microsoft SQL Server

1. Open SQL Server Management Studio and connect to your server.
2. Open `sqlserver/01_create_tables.sql` and press **F5**.
3. Open `sqlserver/02_insert_data.sql` and press **F5**.

The scripts use `DROP TABLE IF EXISTS`, which needs SQL Server 2016 or later (including Azure SQL Database). The free Developer and Express editions work fine.

## Starting over

Made a mess? That's part of learning. In SQLite, delete `store.db` and download it again, or re-run both scripts. In SQL Server, re-run both scripts; the first one drops and recreates the tables.

## A note on SQLite vs. SQL Server

The table design and data are identical. The only differences are how each database numbers the ID columns automatically (`INTEGER PRIMARY KEY` in SQLite, `INT IDENTITY(1,1)` in SQL Server) and the `PRAGMA` and `GO` lines, which belong to SQLite and SQL Server Management Studio respectively. Nearly all of the book's queries run unchanged in both, and the book points out the few exceptions.

---

© 2026 Embark Blue Inc. See the repository's LICENSE file for terms of use.
