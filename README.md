# 📊 SQL Data Warehouse Project

## 📖 Overview

This project demonstrates the end-to-end implementation of a **Data Warehouse** using **MySQL**, following the **Medallion Architecture (Bronze, Silver, Gold)**. The project covers data ingestion, ETL development, data cleansing, quality validation, dimensional modeling, and business reporting using **Power BI**.

The objective is to transform raw CRM and ERP data into clean, trusted, and business-ready datasets for analytical reporting while following industry-standard Data Engineering practices.

---

# ✨ Features

### 🏗️ Data Warehouse

- Medallion Architecture (Bronze, Silver & Gold)
- End-to-End ETL Pipeline
- Multi-source Data Integration
- Star Schema (Gold Layer)
- Fact & Dimension Modeling

### 🥉 Bronze Layer

- Raw Data Ingestion
- Bulk Loading using `LOAD DATA INFILE`
- Source Data Preservation
- Audit & Traceability

### 🥈 Silver Layer

- Data Cleansing
- Data Standardization
- Business Rule Validation
- Data Quality Checks
- NULL Handling
- Duplicate Detection

### 🥇 Gold Layer *(In Progress)*

- Fact Tables
- Dimension Tables
- Business Metrics
- KPI Development
- Power BI Reporting

### 📊 Analytics

- Interactive Power BI Dashboards
- Business Reporting
- KPI Analysis
- Data Visualization

### 📚 Documentation

- Project Workflow
- Architecture Diagrams
- SQL Scripts
- Naming Standards
- Notion Project Tracking

---

# 🎯 Project Objectives

- Design and implement a scalable Data Warehouse using **MySQL**.
- Implement the **Bronze, Silver, and Gold** layers.
- Develop ETL pipelines for extracting, transforming, and loading data.
- Perform data cleansing and quality validation.
- Design Fact and Dimension tables.
- Build business-ready datasets for reporting.
- Create interactive Power BI dashboards.
- Follow Data Engineering best practices.
- Maintain project documentation using Notion.

---

# 🛠️ Technologies Used

| Category | Technology |
|-----------|------------|
| Database | MySQL |
| Query Language | SQL |
| ETL | LOAD DATA INFILE, Stored Procedures |
| Data Warehouse | Medallion Architecture |
| Reporting | Power BI |
| Documentation | Notion |
| Version Control | Git & GitHub |
| AI Assistance | ChatGPT & AI Tools |

---

# 🏗️ Data Warehouse Architecture

The project follows the **Medallion Architecture**, where data flows through multiple layers before becoming business-ready.

```text
             CRM + ERP Source Systems
                      │
                      ▼
             🥉 Bronze Layer
           Raw Data Ingestion
                      │
                      ▼
             🥈 Silver Layer
      Cleansing & Standardization
                      │
                      ▼
              🥇 Gold Layer
      Business-Ready Analytics
                      │
                      ▼
             📊 Power BI Reports
```

---

# 🖼️ Architecture Diagrams

The following diagrams are included in the repository.

- 📌 Data Warehouse Architecture
- 🔄 Data Integration Diagram
- 🌊 Data Flow Diagram

> **Note:** Export the `.drawio` files as PNG or SVG and place them in the `images/` folder. Then reference them in the README using standard Markdown image syntax.

---

# 📂 Project Structure

```text
SQL-Data-Warehouse-Project
│
├── datasets
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
├── scripts
│   ├── bronze
│   │   ├── CREATE Tables.sql
│   │   ├── LOAD Tables.sql
│   │   └── Quality Checks.sql
│   │
│   ├── silver
│   │   ├── CREATE Tables.sql
│   │   ├── Cleansing & Transformations.sql
│   │   └── Quality Checks.sql
│   │
│   └── gold
│
├── docs
│   ├── Data Warehouse Architecture.drawio
│   ├── Data Integration.drawio
│   └── Data Flow Diagram.drawio
│
├── images
│
├── powerbi
│
└── README.md
```

---

# 📂 Project Workflow

```text
Source Files
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Layer
      │
      ▼
Power BI Dashboard
```

---

# 🥉 Bronze Layer

## 📖 Overview

The **Bronze Layer** is the raw data ingestion layer of the Data Warehouse.

Its purpose is to ingest data from multiple source systems into MySQL **without applying business transformations**. This layer preserves the original data and serves as the foundation for downstream processing.

---

## 📥 Source Systems

The project integrates data from two independent business systems.

### CRM

- `cust_info.csv`
- `prd_info.csv`
- `sales_details.csv`

### ERP

- `CUST_AZ12.csv`
- `LOC_A101.csv`
- `PX_CAT_G1V2.csv`

---

## 🗄️ Bronze Tables

### CRM

```text
bronze_crm_cust_info
bronze_crm_prd_info
bronze_crm_sales_details
```

### ERP

```text
bronze_erp_cust_az12
bronze_erp_loc_a101
bronze_erp_px_cat_g1v2
```

---

## ⚙️ Data Loading Strategy

The Bronze Layer uses **MySQL `LOAD DATA INFILE`** to perform high-performance bulk loading of CSV files.

### Benefits

- Fast bulk ingestion
- Reduced execution time
- Efficient loading of large datasets
- Preserves original source data

---

## 🔧 MySQL Configuration

The following configuration was required before loading data.

- Enabled `local_infile`
- Configured `OPT_LOCAL_INFILE=1`
- Verified `secure_file_priv`
- Copied source CSV files into the MySQL upload directory

---

## 🧹 Handling Missing Values

During ingestion, blank values were converted into **NULL** using `NULLIF()`.

Example

```sql
SET
    customer_id = NULLIF(@customer_id,''),
    order_date = NULLIF(@order_date,'');
```

This prevents datatype conversion errors while preserving missing values.

---

## ✅ Bronze Layer Quality Checks

The following validations are performed after data ingestion.

- Primary Key Validation
- Duplicate Detection
- NULL Validation
- Data Type Validation
- Date Validation
- Numeric Validation
- Source-to-Target Record Count Validation

---

## 📊 Bronze Layer Status

| Task | Status |
|------|--------|
| Bronze Schema | ✅ |
| CRM Tables | ✅ |
| ERP Tables | ✅ |
| Bulk Loading | ✅ |
| Data Validation | ✅ |
| Quality Checks | ✅ |

---

# 🥈 Silver Layer

## 📖 Overview

The **Silver Layer** transforms raw Bronze data into clean, standardized, and validated datasets. It is responsible for improving data quality by applying cleansing rules, standardization, and business validations before preparing the data for the Gold Layer.

---

## 🎯 Objectives

- Clean raw data.
- Remove duplicate records.
- Handle missing values.
- Standardize inconsistent values.
- Apply business transformation rules.
- Validate data quality.
- Prepare trusted datasets for analytical reporting.

---

## 🗄️ Silver Tables

### CRM

```text
silver_crm_cust_info
silver_crm_prd_info
silver_crm_sales_details
```

### ERP

```text
silver_erp_cust_az12
silver_erp_loc_a101
silver_erp_px_cat_g1v2
```

Each Silver table includes a technical metadata column.

```text
dwh_create_date
```

---

# 🔄 ETL Transformations

The Silver Layer applies transformation logic to improve data quality and consistency.

### Data Cleansing

- Remove leading and trailing spaces.
- Convert blank values to NULL where appropriate.
- Standardize text formatting.
- Handle inconsistent records.

### Data Standardization

- Standardize categorical values.
- Normalize business attributes.
- Ensure consistent naming across datasets.

### Data Validation

- Validate primary keys.
- Validate data types.
- Validate date values.
- Validate numeric values.
- Validate business rules.

---

# ✅ Data Quality Checks

Quality checks are executed after loading data into the Silver Layer to ensure only trusted data progresses to the Gold Layer.

The implemented validations include:

- Primary Key Validation
- Duplicate Detection
- NULL Validation
- Whitespace Validation
- Product Validation
- Customer Validation
- Sales Validation
- Date Validation
- Numeric Validation
- Business Rule Validation

---

# 📋 ETL Workflow

```text
CSV Files
      │
      ▼
Bronze Layer
(Raw Data)
      │
      ▼
Data Cleansing
      │
      ▼
Standardization
      │
      ▼
Quality Validation
      │
      ▼
Silver Layer
(Clean Data)
      │
      ▼
Gold Layer
```

---

# 📊 Silver Layer Status

| Task | Status |
|------|--------|
| Silver Schema | ✅ |
| CRM Tables | ✅ |
| ERP Tables | ✅ |
| Data Cleansing | ✅ |
| Data Standardization | ✅ |
| Quality Checks | ✅ |
| Business Validation | ✅ |
| ETL Transformations | ✅ |

---

# 📈 Current Progress

| Module | Status |
|---------|--------|
| Data Warehouse Architecture | ✅ |
| Bronze Layer | ✅ |
| Silver Layer | ✅ |
| Gold Layer | 🚧 |
| Power BI Reports | 🚧 |
| Documentation | ✅ |

---

## 🚀 Next Phase

The next stage of the project focuses on building the **Gold Layer**.

Planned activities include:

- Create Dimension Tables
- Create Fact Tables
- Generate Surrogate Keys
- Design Star Schema
- Build Business Metrics
- Develop KPIs
- Connect Power BI
- Build Interactive Dashboards

---

# 📐 Naming Conventions

To ensure consistency, maintainability, and readability, the following naming conventions are followed throughout the project.

---

## General Rules

- Use **snake_case** for all database objects.
- Use lowercase letters with underscores (`_`) to separate words.
- Use meaningful and descriptive names.
- Avoid spaces and special characters.

---

## Schema Naming

The project follows the Medallion Architecture.

```text
bronze
silver
gold
```

---

## Table Naming

Examples

```text
crm_customer_info
crm_product_info
crm_sales_details

erp_customer
erp_location
erp_product_category

fact_sales
dim_customer
dim_product
```

---

## Column Naming

Examples

```text
customer_id
customer_name
product_name
sales_amount
order_date
```

---

## Surrogate Keys

Convention

```text
<table_name>_key
```

Examples

```text
customer_key
product_key
sales_key
date_key
```

---

## Technical Columns

Convention

```text
dwh_<column_name>
```

Examples

```text
dwh_create_date
dwh_update_date
dwh_load_date
dwh_source_system
```

---

## Stored Procedures

Convention

```text
sp_<procedure_name>
```

Examples

```text
sp_load_bronze
sp_load_silver
sp_load_gold
```

---

## Views

Convention

```text
vw_<view_name>
```

Examples

```text
vw_sales_summary
vw_customer_analysis
```

---

# 📂 Repository Highlights

✔ End-to-End SQL Data Warehouse Project

✔ Medallion Architecture

✔ CRM & ERP Data Integration

✔ Bronze Layer Implementation

✔ Silver Layer Implementation

✔ ETL Pipeline Development

✔ Data Cleansing & Standardization

✔ Data Quality Validation

✔ Architecture Documentation

✔ Power BI Integration (In Progress)

---

# 📊 Data Quality Framework

Quality validation is implemented throughout the ETL pipeline.

### Bronze Layer

- Source-to-target validation
- NULL validation
- Duplicate detection
- Data type validation

### Silver Layer

- Primary key validation
- Duplicate detection
- Standardization checks
- Date validation
- Numeric validation
- Business rule validation

Only validated and trusted data proceeds to the Gold Layer.

---

# 🚀 Future Enhancements

The following features are planned for upcoming releases.

## 🥇 Gold Layer

- Star Schema
- Dimension Tables
- Fact Tables
- Business-ready Data Marts

---

## 📊 Analytics

- Power BI Dashboard
- KPI Reporting
- Executive Dashboard
- Sales Analytics
- Customer Analytics

---

## ⚙️ Performance

- Query Optimization
- Indexing
- Incremental Loading
- ETL Automation
- Performance Monitoring

---

## 📚 Documentation

- Dashboard Screenshots
- ER Diagram
- Data Dictionary
- ETL Workflow Diagram
- Deployment Guide

---

# 📈 Project Status

| Component | Status |
|-----------|--------|
| Data Architecture | ✅ Complete |
| Bronze Layer | ✅ Complete |
| Silver Layer | ✅ Complete |
| Gold Layer | 🚧 In Progress |
| Power BI Dashboard | 🚧 In Progress |
| Documentation | ✅ Ongoing |

---


# 🤝 Contributing

Contributions are welcome!

If you would like to improve this project:

1. Fork the repository.
2. Create a new feature branch.
3. Commit your changes.
4. Push the branch to your fork.
5. Open a Pull Request.

Please ensure that all SQL scripts follow the project's naming conventions and coding standards.

---

# 📚 Learning Outcomes

This project demonstrates practical experience in:

- Data Warehouse Design
- Medallion Architecture
- ETL Development
- SQL Programming
- Data Cleansing
- Data Standardization
- Data Quality Validation
- Dimensional Modeling
- Data Integration
- Business Intelligence
- Power BI Reporting
- Database Design
- Documentation
- Git & GitHub Version Control

---

# 📌 Project Roadmap

### ✅ Completed

- Data Warehouse Architecture
- CRM & ERP Data Integration
- Bronze Layer
- Silver Layer
- ETL Pipeline
- Data Cleansing
- Data Quality Validation
- Project Documentation

### 🚧 In Progress

- Gold Layer
- Star Schema
- Fact Tables
- Dimension Tables
- Power BI Dashboards

### 🔮 Future Enhancements

- Incremental Data Loading
- ETL Automation
- Performance Optimization
- Dashboard Screenshots
- Data Dictionary
- ER Diagram
- CI/CD Pipeline
- Cloud Deployment

---

# 📄 License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute this project under the terms of the MIT License.

---

# 🙏 Acknowledgements

This project was built using the following technologies and tools:

- MySQL
- SQL
- Power BI
- Git & GitHub
- Notion
- ChatGPT & AI Tools

Special thanks to the open-source community and learning resources that inspired the implementation of modern Data Warehouse practices.

---
## 📈 Repository Statistics

| Layer | Status |
|--------|--------|
| Bronze | ✅ Completed |
| Silver | ✅ Completed |
| Gold | 🚧 In Progress |

| Source Systems | Count |
|----------------|------:|
| CRM | 3 |
| ERP | 3 |
| Total Source Files | 6 |

| Database Objects | Count |
|------------------|------:|
| Bronze Tables | 6 |
| Silver Tables | 6 |
| Gold Tables | In Progress |



# 👨‍💻 Author

**Mounish Kumar**

**Aspiring Data Analyst | Data Engineer | Business Intelligence Analyst**

### Skills

- SQL
- MySQL
- Power BI
- Python
- ETL
- Data Warehousing
- Data Modeling
- Data Analytics

### Connect with Me

- GitHub: https://github.com/MounishKumar228
- LinkedIn: https://www.linkedin.com/in/mounish-kumar-685b47301/

---

# ⭐ Support

If you found this project helpful or learned something from it:

- ⭐ Star this repository
- 🍴 Fork the repository
- 📝 Share your feedback
- 💡 Suggest improvements

Your support helps improve the project and makes it easier for others to discover.

---

## 📬 Feedback

If you have suggestions, ideas, or improvements, feel free to:

- Open an Issue
- Submit a Pull Request
- Connect with me on LinkedIn

I appreciate your feedback and contributions!

---

## 🚀 Thank You

Thank you for visiting this repository!

I hope this project provides useful insights into building a modern SQL Data Warehouse using the Medallion Architecture and serves as a valuable learning resource for Data Engineering and Business Intelligence enthusiasts.

Happy Learning! 🎉
