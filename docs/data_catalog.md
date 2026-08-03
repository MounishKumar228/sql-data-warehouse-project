# Data Catalog

This document describes the Gold Layer views used for analytics and reporting in the Data Warehouse.

---

# Gold Layer

The Gold layer contains business-ready dimensional and fact views built from the Silver layer.

## 1. gold_dim_customers

**Description**

Customer dimension containing cleaned and standardized customer information enriched with ERP demographic and location data.

**Primary Key**

| Column | Description |
|---------|-------------|
| customer_key | Surrogate key generated using `ROW_NUMBER()` |

### Columns

| Column | Description |
|---------|-------------|
| customer_key | Surrogate key |
| customer_id | Customer ID from CRM |
| customer_number | Customer business key |
| first_name | Customer first name |
| last_name | Customer last name |
| country | Customer country |
| marital_status | Standardized marital status |
| gender | Standardized gender |
| birthdate | Customer birth date |
| create_date | Customer creation date |

---

## 2. gold_dim_products

**Description**

Product dimension containing active products enriched with ERP category information.

**Primary Key**

| Column | Description |
|---------|-------------|
| product_key | Surrogate key generated using `ROW_NUMBER()` |

### Columns

| Column | Description |
|---------|-------------|
| product_key | Surrogate key |
| product_id | Product ID |
| product_number | Product business key |
| product_name | Product name |
| category_id | Product category ID |
| category | Product category |
| subcategory | Product subcategory |
| maintenance | Maintenance classification |
| cost | Product cost |
| product_line | Product line |
| start_date | Product effective start date |

**Business Rule**

- Only active products (`prd_end_dt IS NULL`) are included.

---

## 3. gold_fact_sales

**Description**

Sales fact table containing transactional sales information linked to customer and product dimensions.

### Foreign Keys

| Column | References |
|---------|------------|
| product_key | gold_dim_products.product_key |
| customer_key | gold_dim_customers.customer_key |

### Columns

| Column | Description |
|---------|-------------|
| order_number | Sales order number |
| product_key | Product surrogate key |
| customer_key | Customer surrogate key |
| order_date | Order date |
| ship_date | Shipping date |
| due_date | Due date |
| sales_amount | Total sales amount |
| quantity | Quantity sold |
| price | Unit price |

---

# Data Model

```
                 gold_dim_customers
                        │
                        │ customer_key
                        │
                        ▼
                 gold_fact_sales
                        ▲
                        │ product_key
                        │
                 gold_dim_products
```

---

# Layer Summary

| Layer | Purpose |
|--------|---------|
| Bronze | Raw data loaded from CRM and ERP source systems |
| Silver | Cleaned, standardized, and validated data |
| Gold | Business-ready dimensional model for reporting and analytics |

---

# Naming Convention

| Prefix | Description |
|--------|-------------|
| bronze_ | Raw source tables |
| silver_ | Cleansed and transformed tables |
| gold_ | Business-ready analytical views |

---

# Refresh Process

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
Gold Views
      │
      ▼
Power BI / SQL Analytics
```
