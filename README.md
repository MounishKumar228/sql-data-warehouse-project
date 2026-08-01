# 📊 Data Warehouse Project

Welcome to the **Data Warehouse Project**! 🚀

This repository showcases the end-to-end implementation of a modern **Data Warehouse** using **MySQL**, following the **Medallion Architecture (Bronze, Silver, Gold)**. The project demonstrates data ingestion, ETL development, dimensional modeling, and analytical reporting with **Power BI**. **Notion** is used for project planning and documentation, while **AI tools** assist with development, documentation, and SQL optimization.

---

# 🎯 Project Objectives

- Design and implement a scalable Data Warehouse using **MySQL**.
- Build robust ETL pipelines for extracting, transforming, and loading data.
- Implement the **Bronze, Silver, and Gold** layers following the Medallion Architecture.
- Clean, transform, and integrate data from multiple source systems.
- Design dimension and fact tables for analytical reporting.
- Write optimized SQL queries for efficient data processing.
- Develop interactive **Power BI** dashboards and reports.
- Utilize **AI tools** for development assistance, documentation, and SQL optimization.
- Track project planning, milestones, and documentation using **Notion**.
- Apply industry-standard Data Warehouse and dimensional modeling best practices.

---

# 📂 Project Workflow

The project is implemented in the following phases.

### 1️⃣ Data Architecture

- Design the overall Data Warehouse architecture.
- Define schemas, naming conventions, and the Medallion Architecture.

### 2️⃣ Data Sourcing

- Identify and connect to source systems.
- Analyze source data structure and quality.

### 3️⃣ Bronze, Silver & Gold Layers

- **Bronze Layer** – Store raw source data.
- **Silver Layer** – Clean, standardize, and transform data.
- **Gold Layer** – Create business-ready datasets optimized for analytics.

### 4️⃣ Data Modeling

- Design dimension and fact tables.
- Generate surrogate keys.
- Define relationships and business rules.

### 5️⃣ ETL Processes

- Extract data from source systems.
- Transform and cleanse data.
- Load data into Bronze, Silver, and Gold layers.
- Automate ETL workflows using stored procedures.

### 6️⃣ Reporting & Visualization

- Build interactive Power BI dashboards.
- Develop business KPIs and analytical reports.

### 7️⃣ Documentation & Project Tracking

- Document project architecture and SQL scripts.
- Track project progress and milestones using **Notion**.
- Manage source code using **Git & GitHub**.

---

# 📁 Project Structure

```text
DataWarehouse
│
├── Source Files
│   ├── CRM
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   │
│   └── ERP
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
│
├── Bronze Layer
│   ├── DDL
│   ├── Stored Procedures
│   └── Tables
│
├── Silver Layer
│   ├── DDL
│   ├── Stored Procedures
│   └── Tables
│
├── Gold Layer
│   ├── DDL
│   ├── Stored Procedures
│   ├── Fact Tables
│   └── Dimension Tables
│
├── Power BI Reports
│
├── Documentation
│   ├── Project Requirements
│   ├── Data Architecture
│   ├── Naming Conventions
│   └── Notion Workspace
│
└── README.md
```

### Structure Overview

- **Source Files** – Raw CRM and ERP datasets.
- **Bronze Layer** – Raw ingested source data.
- **Silver Layer** – Cleaned and standardized data.
- **Gold Layer** – Business-ready analytical data.
- **Power BI Reports** – Dashboards and business insights.
- **Documentation** – Project planning, architecture, naming conventions, and project tracking.

---
# 🥉 Bronze Layer Implementation

## Overview

The **Bronze Layer** serves as the raw data ingestion layer in the Medallion Architecture. Data from multiple source systems is loaded into MySQL without applying any business transformations. This layer preserves the source data for auditing, traceability, and future processing.

---

## 📥 Source Systems

The project ingests data from two independent source systems.

### CRM Source

- `cust_info.csv`
- `prd_info.csv`
- `sales_details.csv`

### ERP Source

- `CUST_AZ12.csv`
- `LOC_A101.csv`
- `PX_CAT_G1V2.csv`

---

## 🗂️ Bronze Tables

The following Bronze tables were created to store the raw source data.

```text
bronze_crm_cust_info
bronze_crm_prd_info
bronze_crm_sales_details

bronze_erp_cust_az12
bronze_erp_loc_a101
bronze_erp_px_cat_g1v2
```

Each Bronze table mirrors the structure of its corresponding source CSV file.

---

## ⚙️ Data Loading Strategy

Instead of SQL Server's **BULK INSERT**, MySQL's high-performance **LOAD DATA INFILE** command is used to perform bulk data ingestion.

Example:

```sql
LOAD DATA INFILE '.../cust_info.csv'
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
```

This approach provides efficient loading of large CSV datasets while maintaining the integrity of the source data.

---

## 🔧 MySQL Configuration

To enable bulk loading in MySQL, the following configurations were completed.

- Enabled **local_infile**
- Configured MySQL Workbench with:

```text
OPT_LOCAL_INFILE=1
```

Verified the server configuration using:

```sql
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
```

Configured upload directory:

```text
C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\
```

All CSV source files were copied into the configured upload directory before executing the loading scripts.

---

## 🧹 Handling Missing Values

Several source files contain empty values for numeric and date columns.

To ensure successful loading, **user variables** together with **NULLIF()** were used during the import process to convert empty strings into **NULL** values.

Example:

```sql
LOAD DATA INFILE ...
(
    @cst_id,
    cst_key,
    ...
    @cst_create_date
)
SET
    cst_id = NULLIF(@cst_id, ''),
    cst_create_date = NULLIF(@cst_create_date, '');
```

This approach preserves missing values while preventing data type conversion errors during bulk loading.

---

## 🚧 Challenges Encountered

During data ingestion, several issues were identified and resolved.

- Configured **LOAD DATA INFILE** permissions in both MySQL Server and MySQL Workbench.
- Resolved **secure_file_priv** restrictions by placing files inside the configured MySQL upload directory.
- Fixed **Incorrect integer value** errors caused by blank numeric fields.
- Fixed **Incorrect date value** errors caused by blank date fields.
- Improved data quality by converting blank values into **NULL** using **NULLIF()** during import.

---

## ✅ Current Progress

The following milestones have been successfully completed:

- ✔ Created the `data_warehouse` database.
- ✔ Designed the Bronze Layer architecture.
- ✔ Created all Bronze layer tables.
- ✔ Configured MySQL for bulk data loading.
- ✔ Enabled `local_infile` and configured MySQL Workbench.
- ✔ Implemented bulk loading using `LOAD DATA INFILE`.
- ✔ Converted missing values to `NULL` during ingestion using `NULLIF()`.
- ✔ Successfully loaded and validated CRM source data.
- ✔ Successfully loaded and validated ERP source data.
- ✔ Verified data integrity after ingestion.

---

## 🚀 Next Steps

The following phases are planned for the project:

- Build the **Silver Layer** for data cleansing and standardization.
- Remove duplicates and improve data quality.
- Apply business rules and data transformations.
- Generate surrogate keys.
- Create dimension and fact tables.
- Build the **Gold Layer** for analytical reporting.
- Develop Power BI dashboards.
- Create business KPIs and executive reports.
- Automate the ETL process using stored procedures.

---

# 🛠️ Technologies Used

| Category | Technology |
|----------|------------|
| Database | MySQL |
| Query Language | SQL |
| ETL | LOAD DATA INFILE, Stored Procedures |
| Data Warehouse | Medallion Architecture |
| Reporting | Power BI |
| Documentation | Notion |
| Version Control | Git & GitHub |
| AI Assistance | ChatGPT & AI Tools |

---

# 📐 Naming Conventions

To ensure consistency, maintainability, and readability, the following naming conventions are followed throughout the project.

## General Rules

- Use **snake_case** for all database objects.
- Use lowercase letters with underscores (`_`) to separate words.
- Use meaningful and descriptive names.
- Avoid spaces and special characters.

---

## Schema Naming

The project follows the **Medallion Architecture**.

```text
bronze
silver
gold
```

---

## Table Naming

Business entities are named using descriptive names.

Examples:

```text
crm_customer_info
erp_product
fact_sales
dim_customer
```

---

## Business Columns

Business columns use descriptive names in **snake_case**.

Examples:

```text
customer_id
product_name
order_date
sales_amount
customer_city
```

---

## Surrogate Keys

Surrogate keys follow the naming convention:

```text
<table_name>_key
```

Examples:

```text
customer_key
product_key
sales_key
date_key
store_key
```

---

## Technical (Data Warehouse) Columns

Technical metadata columns use the prefix:

```text
dwh_<column_name>
```

Examples:

```text
dwh_created_date
dwh_updated_date
dwh_load_date
dwh_source_system
dwh_batch_id
```

---

## Stored Procedures

All stored procedures follow the prefix:

```text
sp_
```

Examples:

```text
sp_load_bronze
sp_transform_silver
sp_load_gold
sp_validate_data
```

The naming convention clearly identifies stored procedures responsible for loading, transforming, and validating data across different layers.

---

## Views

Views follow the prefix:

```text
vw_
```

Examples:

```text
vw_sales_summary
vw_customer_analysis
vw_product_performance
```

---

## SQL Coding Standards

To improve readability and maintain consistency across the project, the following SQL standards are followed.

- SQL keywords are written in **UPPERCASE**.
- Database objects use **snake_case**.
- Proper indentation is used for all SQL statements.
- Meaningful aliases are used for tables and columns.
- SQL scripts are organized by layer (Bronze, Silver, Gold).
- Comments are added wherever necessary to explain complex logic.
- One responsibility per stored procedure to improve maintainability.

Example:

```sql
SELECT
    customer_id,
    customer_name,
    country
FROM silver.crm_customer_info
WHERE customer_status = 'Active';
```

---

# 📈 Future Enhancements

The following improvements are planned for future versions of the project.

- ✅ Build the complete Silver Layer.
- ✅ Develop the Gold Layer using a Star Schema.
- ✅ Create Fact and Dimension tables.
- ✅ Implement data quality validation checks.
- ✅ Build interactive Power BI dashboards.
- ✅ Automate ETL execution using stored procedures.
- ✅ Add incremental data loading.
- ✅ Improve query performance through indexing and optimization.
- ✅ Add project architecture and ETL flow diagrams.
- ✅ Publish dashboard screenshots and business insights.

---

# 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Submit a Pull Request.

---

# 📄 License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute this project under the terms of the MIT License.

---

# 🙏 Acknowledgements

Special thanks to the tools and technologies that supported the development of this project.

- MySQL
- Power BI
- Git & GitHub
- Notion
- ChatGPT & AI Tools

---

# ⭐ Support

If you found this project helpful or learned something from it, please consider giving it a **⭐ Star** on GitHub.

Your support helps motivate future improvements and makes the repository easier for others to discover.

---

## 👨‍💻 Author

**Mounish Kumar**

- 🎓 B.Tech – Computer Science & Engineering
- 📊 Aspiring Data Analyst | Business Intelligence Analyst | Data Engineer
- 💻 Skills: SQL, MySQL, Power BI, Python, Excel, ETL, Data Warehousing
- 🌐 GitHub: https://github.com/MounishKumar228

---

## 📬 Feedback

If you have any suggestions, ideas, or feedback, feel free to open an issue or reach out through GitHub.

Happy Learning! 🚀
