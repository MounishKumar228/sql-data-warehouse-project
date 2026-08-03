# Data Catalog

This document describes the business-ready objects available in the **Gold Layer** of the Data Warehouse. These views are designed for reporting, dashboarding, and analytical workloads.

---

# 1. gold_dim_customers

**Purpose**

Stores customer information enriched with demographic and geographic data by integrating CRM and ERP sources.

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| customer_key | BIGINT | Surrogate key generated using `ROW_NUMBER()` to uniquely identify each customer record. |
| customer_id | INT | Customer identifier from the CRM system. |
| customer_number | VARCHAR(50) | Business customer identifier used across source systems. |
| first_name | VARCHAR(100) | Customer's first name. |
| last_name | VARCHAR(100) | Customer's last name. |
| country | VARCHAR(50) | Customer's country of residence. |
| marital_status | VARCHAR(20) | Standardized marital status (Married, Single, n/a). |
| gender | VARCHAR(20) | Standardized gender (Male, Female, n/a). |
| birthdate | DATE | Customer's birth date. |
| create_date | DATE | Customer creation date from the CRM system. |

**Source Tables**

- `silver_crm_cust_info`
- `silver_erp_cust_az12`
- `silver_erp_loc_a101`

---

# 2. gold_dim_products

**Purpose**

Stores active product information enriched with category and maintenance details from ERP.

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| product_key | BIGINT | Surrogate key generated using `ROW_NUMBER()`. |
| product_id | INT | Product identifier from the CRM system. |
| product_number | VARCHAR(50) | Business product identifier. |
| product_name | VARCHAR(255) | Product name. |
| category_id | VARCHAR(10) | Product category identifier. |
| category | VARCHAR(100) | Product category. |
| subcategory | VARCHAR(100) | Product subcategory. |
| maintenance | VARCHAR(50) | Product maintenance classification. |
| cost | DECIMAL(10,2) | Product cost. |
| product_line | VARCHAR(50) | Product line description. |
| start_date | DATE | Product effective start date. |

### Business Rules

- Only active products are included.
- Historical product records are excluded (`prd_end_dt IS NULL`).

### Source Tables

- `silver_crm_prd_info`
- `silver_erp_px_cat_g1v2`

---

# 3. gold_fact_sales

**Purpose**

Stores transactional sales data linked to customer and product dimensions for analytical reporting.

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| order_number | VARCHAR(50) | Sales order number. |
| product_key | BIGINT | Foreign key referencing `gold_dim_products`. |
| customer_key | BIGINT | Foreign key referencing `gold_dim_customers`. |
| order_date | DATE | Date the order was placed. |
| ship_date | DATE | Date the order was shipped. |
| due_date | DATE | Order due date. |
| sales_amount | DECIMAL(10,2) | Total sales amount. |
| quantity | INT | Quantity sold. |
| price | DECIMAL(10,2) | Unit selling price. |

### Source Tables

- `silver_crm_sales_details`
- `gold_dim_products`
- `gold_dim_customers`

---

# Entity Relationship

```text
                      gold_dim_customers
                      ------------------
                      customer_key (PK)
                             │
                             │
                             │
                             ▼
                    gold_fact_sales
      -----------------------------------------
      order_number
      customer_key (FK)
      product_key  (FK)
      order_date
      ship_date
      due_date
      sales_amount
      quantity
      price
                             ▲
                             │
                             │
                             │
                      product_key (PK)
                      ----------------
                      gold_dim_products
```

---

# Gold Layer Architecture

```text
                    +---------------------------+
                    |     CRM Source Files      |
                    +---------------------------+
                                |
                    +---------------------------+
                    |     ERP Source Files      |
                    +---------------------------+
                                |
                                ▼
                    +---------------------------+
                    |       Bronze Layer        |
                    |      Raw Source Data      |
                    +---------------------------+
                                |
                                ▼
                    +---------------------------+
                    |       Silver Layer        |
                    | Cleansed & Standardized   |
                    +---------------------------+
                                |
                                ▼
                    +---------------------------+
                    |        Gold Layer         |
                    | Business Ready Data Model |
                    +---------------------------+
                                |
                                ▼
                    Power BI • SQL Analytics • Reporting
```

---

# Refresh Sequence

```text
CRM CSV Files
ERP CSV Files
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Dimension Views
      │
      ▼
Gold Fact View
      │
      ▼
Power BI Dashboards
```

---

# Naming Convention

| Object | Convention | Example |
|--------|------------|---------|
| Dimension View | `gold_dim_<entity>` | `gold_dim_customers` |
| Fact View | `gold_fact_<entity>` | `gold_fact_sales` |
| Surrogate Key | `<entity>_key` | `customer_key` |
| Business Key | `<entity>_id` | `customer_id` |
| Foreign Key | `<entity>_key` | `product_key` |
| Measures | Descriptive snake_case | `sales_amount`, `quantity`, `price` |

---

# Summary

| Object | Type | Description |
|---------|------|-------------|
| `gold_dim_customers` | Dimension View | Customer master data enriched with ERP demographic and location information. |
| `gold_dim_products` | Dimension View | Active products enriched with category and maintenance attributes. |
| `gold_fact_sales` | Fact View | Sales transactions linked to customer and product dimensions for analytical reporting. |
