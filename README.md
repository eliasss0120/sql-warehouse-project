# sql-warehouse-project
Building a modern data warehouse with SQL Sever, including ETL Processes,d ata modeling, and analytics.

# Data Warehouse and Analytics Project

## 1. Project Overview

This project demonstrates how to build a data warehouse using **SQL Server**. It combines data from two source systems, CRM (Customer Relationship Management) and ERP (Enterprise Resource Planning), into a centralized database for reporting and analysis.

The project uses SQL scripts to load, clean, transform, and organize the data into a structure that supports business analysis.

### Project objectives

- Build a data warehouse using SQL Server.
- Extract data from CRM and ERP CSV files.
- Clean and standardize data to improve its quality.
- Combine data from different sources into a consistent data model.
- Organize data into fact and dimension tables.
- Use SQL queries to analyze customer behavior, product performance, and sales trends.

## 2. Data Architecture

The project follows the **Medallion Architecture**, which organizes data into three layers: Bronze, Silver, and Gold.

![Data Architecture](docs/data_architecture.png)

### Bronze Layer — Raw Data

The Bronze layer stores the data as it is received from the source files.

- Loads the original CSV files into SQL Server.
- Preserves the raw data for subsequent processing.

### Silver Layer — Cleaned Data

The Silver layer prepares the data for analysis.

- Identifies and handles data quality issues.
- Standardizes data formats and values.
- Organizes the data into a consistent structure.

### Gold Layer — Business-Ready Data

The Gold layer contains data organized for reporting and analytics.

- Structures data using fact and dimension tables.
- Supports analytical SQL queries.
- Makes it easier to analyze sales, customers, and products.

## 3. Repository Structure

The repository is organized into folders according to their purpose.

```text
sql-data-warehouse-project/
├── 00_setup/
│   └── Setup instructions and configuration files
├── datasets/
│   ├── source_crm/
│   │   └── CRM source CSV files
│   └── source_erp/
│       └── ERP source CSV files
├── docs/
│   ├── data_architecture.png
│   └── Project requirements and documentation
├── scripts/
│   ├── init_database.sql
│   ├── bronze/
│   ├── silver/
│   └── gold/
└── tests/
    └── Data quality tests
```

*Note: This tree summarizes the main project structure. Some folders may contain additional files and scripts.*

### Main folders and files

| Folder or file | Purpose |
|---|---|
| `00_setup/` | Explains how to configure the environment and prepare the database. |
| `datasets/` | Contains the source CSV files used by the project. |
| `docs/` | Stores architecture diagrams, requirements, and documentation. |
| `scripts/` | Contains the SQL scripts used to create and populate the data warehouse. |
| `scripts/init_database.sql` | Initializes the project database. |
| `scripts/bronze/` | Loads raw data into the Bronze layer. |
| `scripts/silver/` | Cleans and transforms the data. |
| `scripts/gold/` | Creates the analytical data structures. |
| `tests/` | Contains scripts for checking data quality. |

## 4. Data Sources

The project uses six CSV files from two source systems:

- **CRM:** Provides customer-related data.
- **ERP:** Provides additional business and operational data.

The data from both systems is integrated into a single data warehouse.

The project focuses on the latest available dataset. Historical tracking of changes over time is outside its current scope.

## 5. Technologies and Tools

- **SQL Server:** Stores and processes the data.
- **SQL:** Defines the database structures, loads data, performs transformations, and runs analytical queries.
- **SQL Server Management Studio (SSMS):** Provides a graphical interface for working with SQL Server.
- **Git and GitHub:** Track code changes and manage the project repository.
- **draw.io:** Can be used to create and edit architecture and data model diagrams.

Refer to the `00_setup/` folder for installation and configuration instructions.

## 6. Getting Started

Follow these steps to prepare the project.

### Step 1: Configure the environment

Read the instructions in the `00_setup/` folder to install and configure the required tools.

### Step 2: Prepare the database

Open `scripts/init_database.sql` in SQL Server Management Studio and execute it to initialize the project database.

Review the script before running it, particularly if your SQL Server instance already contains databases with the same name.

### Step 3: Configure the source file paths

The original project scripts may expect the CSV files to be located at:

```text
C:\sql\dwh_project\datasets\
```

If your files are stored elsewhere, update the relevant file paths in:

```text
scripts/bronze/proc_load_bronze.sql
```

Make sure the paths match the location of your local CSV files.

### Step 4: Load the raw data

Execute the Bronze-layer scripts to load the source CSV files into SQL Server.

### Step 5: Clean and transform the data

Execute the Silver-layer scripts to clean, standardize, and prepare the data for analysis.

### Step 6: Build the analytical model

Execute the Gold-layer scripts to create the tables used for reporting and analytical queries.

Follow the script dependencies and execution order documented in the repository.

### Step 7: Validate the results

Use the scripts in `tests/` to check data quality and verify the resulting data structures.

For complete setup instructions and additional requirements, consult the files in `00_setup/` and `docs/`.

## 7. Business Analysis

The data warehouse supports SQL-based analysis in three main areas.

### Customer Behavior

Analyze customer information and identify patterns that may help explain purchasing behavior.

### Product Performance

Identify products and product categories that contribute most to sales.

### Sales Trends

Analyze sales performance across available dates and other business dimensions.

These analyses can help answer business questions and support data-driven decision-making.

## 8. Data Model Concepts

This project introduces important concepts used in data engineering and data warehousing.

- **ETL (Extract, Transform, Load):** A process for extracting data from source systems, transforming it, and loading it into a destination.
- **Data quality:** Checks that help identify missing, inconsistent, or invalid data.
- **Medallion Architecture:** A layered approach to organizing raw, cleaned, and business-ready data.
- **Fact tables:** Tables that record business events and measurable values, such as sales amounts and quantities.
- **Dimension tables:** Tables that describe business entities, such as customers, products, and dates.
- **Star schema:** A data model in which a central fact table connects to descriptive dimension tables.

## 9. Project Requirements

The main requirements are documented in [`docs/requirements.md`](docs/requirements.md).

The project aims to consolidate CRM and ERP data, improve data quality, create an analytical data model, and support SQL-based business analysis.

## 10. License and Attribution

Refer to the repository's [`LICENSE`](LICENSE) file for the applicable terms of use.

This project is based on educational materials from Data With Baraa. Refer to the original repository for the original author's documentation and attribution.
