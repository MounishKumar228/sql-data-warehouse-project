# 📊 Data Warehouse Project

Welcome to the **Data Warehouse Project**! 🚀

This project demonstrates the end-to-end implementation of a modern **Data Warehouse** using industry best practices. It covers data ingestion, transformation, dimensional modeling, and reporting to convert raw data into meaningful business insights. The project follows the **Medallion Architecture (Bronze, Silver, Gold)** and leverages SQL, ETL, Power BI, AI-assisted development, and Notion for documentation and progress tracking.

---

## 🎯 Project Objectives

- Design and implement a scalable Data Warehouse using **MySQL**.
- Build robust **ETL pipelines** for extracting, transforming, and loading data.
- Implement the **Bronze, Silver, and Gold** layers following the Medallion Architecture.
- Clean, transform, and integrate data from multiple source systems.
- Design dimension and fact tables for analytical reporting.
- Write optimized SQL queries for efficient data processing.
- Develop interactive **Power BI** dashboards and reports.
- Utilize **AI tools** for development assistance, documentation, and SQL optimization.
- Track project planning, milestones, and documentation using **Notion**.
- Apply industry-standard data warehouse and dimensional modeling best practices.

---

## 📂 Project Workflow

The project is implemented in the following phases:

### 1️⃣ Data Architecture
- Design the overall Data Warehouse architecture.
- Define schemas, naming conventions, and the Medallion Architecture.

### 2️⃣ Data Sourcing
- Identify and connect to source systems.
- Analyze source data structure and quality.

### 3️⃣ Bronze, Silver & Gold Layers
- **Bronze Layer:** Store raw source data.
- **Silver Layer:** Clean, standardize, and transform data.
- **Gold Layer:** Create business-ready datasets optimized for analytics.

### 4️⃣ Data Modeling
- Design fact and dimension tables.
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
- Track project progress and milestones using Notion.
- Manage source code using Git & GitHub.

---

## 🛠️ Technologies Used

- MySQL
- SQL
- ETL Processes
- Power BI
- Notion
- AI Tools
- Git & GitHub
- Medallion Architecture (Bronze, Silver & Gold)

---

## 📐 Naming Conventions

To ensure consistency, maintainability, and readability, the following naming conventions are followed throughout the project.

### General Rules

- Use **snake_case** for all database objects.
- Use lowercase letters with underscores (`_`) to separate words.
- Use descriptive and meaningful names.
- Avoid spaces and special characters.

### Schema Naming

The project is organized using the Medallion Architecture:

- `bronze`
- `silver`
- `gold`

### Table Naming

Tables are named using descriptive business entities.

**Examples**

- `crm_customer_info`
- `erp_product`
- `fact_sales`
- `dim_customer`

### Column Naming

Business columns use descriptive names in **snake_case**.

**Examples**

- `customer_id`
- `product_name`
- `order_date`
- `sales_amount`

### Surrogate Keys

Surrogate keys follow the naming convention:

```text
<table_name>_key
```

**Examples**

- `customer_key`
- `product_key`
- `sales_key`
- `date_key`

### Technical (Data Warehouse) Columns

Technical metadata columns are prefixed with:

```text
dwh_<column_name>
```

**Examples**

- `dwh_created_date`
- `dwh_updated_date`
- `dwh_load_date`
- `dwh_source_system`

### Stored Procedures

Stored procedures use the prefix:

```text
sp_
```

**Examples**

- `sp_load_bronze`
- `sp_transform_silver`
- `sp_load_gold`

### Views

Views use the prefix:

```text
vw_
```

**Examples**

- `vw_sales_summary`
- `vw_customer_analysis`

### SQL Coding Standards

- SQL keywords are written in **UPPERCASE**.
- Database objects use **snake_case**.
- Queries are properly formatted and indented.
- Use meaningful aliases for improved readability.

---

## 📄 License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute this project under the terms of the MIT License.

---

⭐ If you found this project useful, consider giving it a **Star** on GitHub!
