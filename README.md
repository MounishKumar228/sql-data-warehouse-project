# SQL Data Warehouse Project | Medallion Architecture (Bronze • Silver • Gold)

## Overview

This project demonstrates the design and implementation of a **Modern Data Warehouse** using **MySQL**, following the **Medallion Architecture** (Bronze, Silver, and Gold layers).

The solution integrates data from multiple CRM and ERP source systems, performs ETL processes to clean and standardize the data, validates data quality, and delivers business-ready analytical views using a **Star Schema** for reporting and business intelligence.

---

## Project Objectives

- Design a scalable Data Warehouse using Medallion Architecture.
- Integrate CRM and ERP source systems.
- Build ETL pipelines for data ingestion and transformation.
- Improve data quality through cleansing and validation.
- Create business-ready dimension and fact views.
- Support reporting and dashboard development.

---

## Architecture

```
                  +----------------------+
                  |     Source Systems   |
                  |----------------------|
                  | CRM Files            |
                  | ERP Files            |
                  +----------+-----------+
                             |
                             ▼
                  +----------------------+
                  |    Bronze Layer      |
                  |----------------------|
                  | Raw Source Data      |
                  +----------+-----------+
                             |
                             ▼
                  +----------------------+
                  |    Silver Layer      |
                  |----------------------|
                  | Data Cleaning        |
                  | Data Validation      |
                  | Data Standardization |
                  +----------+-----------+
                             |
                             ▼
                  +----------------------+
                  |     Gold Layer       |
                  |----------------------|
                  | Star Schema          |
                  | Business Views       |
                  +----------+-----------+
                             |
                             ▼
                    Power BI / Analytics
```

---

# Project Structure

```
sql-data-warehouse-project
│
├── datasets
│   ├── source_crm
│   └── source_erp
│
├── diagrams
│   ├── Data Flow Diagram.drawio
│   ├── Data Integration.drawio
│   └── Data Warehouse Architecture.drawio
│
├── scripts
│   ├── bronze
│   │   ├── README.md
│   │   ├── create_tables.sql
│   │   └── load_data.sql
│   │
│   ├── silver
│   │   ├── README.md
│   │   ├── create_tables.sql
│   │   ├── sp_load_silver.sql
│   │   └── quality_checks.sql
│   │
│   └── gold
│       ├── README.md
│       ├── create_views.sql
│       └── DATA_CATALOG.md
│
└── README.md
```

---

# Source Systems

The project integrates data from two operational systems.

## CRM

- Customer Information
- Product Information
- Sales Details

## ERP

- Customer Information
- Customer Location
- Product Categories

---

# Bronze Layer

The Bronze layer acts as the landing zone for raw source data.

### Features

- Bulk loading using `LOAD DATA INFILE`
- Raw data preservation
- One table per source entity
- No business transformations
- Minimal validation

### Tables

```
bronze_crm_cust_info
bronze_crm_prd_info
bronze_crm_sales_details

bronze_erp_cust_az12
bronze_erp_loc_a101
bronze_erp_px_cat_g1v2
```

📖 Detailed documentation: **bronze/README.md**

---

# Silver Layer

The Silver layer transforms raw data into clean, standardized datasets.

### Transformations

- Duplicate removal
- Data cleansing
- Null handling
- Standardization
- Business rule implementation
- Date conversions
- Data validation
- Stored procedure automation

### Tables

```
silver_crm_cust_info
silver_crm_prd_info
silver_crm_sales_details

silver_erp_cust_az12
silver_erp_loc_a101
silver_erp_px_cat_g1v2
```

### ETL

```
CALL sp_load_silver();
```

📖 Detailed documentation: **silver/README.md**

---

# Data Quality Validation

After loading the Silver layer, multiple quality checks are performed.

### Validations

- Duplicate detection
- Primary key validation
- NULL validation
- Unwanted spaces
- Date validation
- Product validation
- Sales validation
- Country standardization
- Gender standardization
- Business rule verification

---

# Gold Layer

The Gold layer exposes business-ready analytical views.

### Star Schema

```
                  Customer Dimension
                          │
                          │
                          ▼
                     Sales Fact
                          ▲
                          │
                          │
                   Product Dimension
```

### Views

```
gold_dim_customers
gold_dim_products
gold_fact_sales
```

📖 Detailed documentation: **gold/README.md**

📖 Data Dictionary: **gold/DATA_CATALOG.md**

---

# ETL Workflow

```
CSV Files
     │
     ▼
Bronze Layer
     │
     ▼
Silver Layer
     │
     ▼
Quality Checks
     │
     ▼
Gold Views
     │
     ▼
Power BI / Reporting
```

---

# Technologies Used

| Category | Technology |
|----------|------------|
| Database | MySQL 8.0 |
| Query Language | SQL |
| ETL | MySQL Stored Procedures |
| Data Loading | LOAD DATA INFILE |
| Data Modeling | Star Schema |
| Architecture | Medallion Architecture |
| Version Control | Git |
| Repository | GitHub |
| Diagramming | Draw.io |

---

# SQL Concepts Used

- Joins
- Views
- Stored Procedures
- Window Functions
- ROW_NUMBER()
- LEAD()
- CASE
- COALESCE()
- NULLIF()
- IFNULL()
- STR_TO_DATE()
- DATE_ADD()
- DATE_SUB()
- Aggregate Functions
- Data Validation Queries
- Bulk Data Loading
- Data Quality Checks

---

# Key Features

- End-to-end ETL pipeline
- Multi-source data integration
- Automated Silver layer loading
- Comprehensive data quality validation
- Business-ready dimensional model
- Well-documented SQL scripts
- Layer-wise project organization
- GitHub-friendly documentation

---

# Skills Demonstrated

- SQL
- MySQL
- Data Warehousing
- ETL Development
- Data Modeling
- Star Schema
- Medallion Architecture
- Data Cleaning
- Data Transformation
- Data Validation
- Window Functions
- Stored Procedures
- Business Intelligence

---

# Future Enhancements

- Incremental Loading
- Change Data Capture (CDC)
- ETL Scheduling
- Index Optimization
- Partitioning
- Power BI Dashboard Development
- Data Lineage Tracking

---

# Author

**Mounish Kumar**

- **GitHub:** https://github.com/MounishKumar228
- **LinkedIn:** https://www.linkedin.com/in/mounish-kumar-685b47301/

---

## Documentation

- 📄 `bronze/README.md` — Bronze Layer Documentation
- 📄 `silver/README.md` — Silver Layer Documentation
- 📄 `gold/README.md` — Gold Layer Documentation
- 📄 `gold/DATA_CATALOG.md` — Gold Layer Data Dictionary
