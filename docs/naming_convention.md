## Naming Conventions

The project follows consistent naming conventions across the Bronze, Silver, and Gold layers to improve readability, maintainability, and scalability.

### Database

| Object | Convention | Example |
|--------|------------|---------|
| Database | `snake_case` | `datawarehouse` |

---

### Schemas / Layers

| Layer | Prefix | Purpose |
|-------|--------|---------|
| Bronze | `bronze_` | Raw data loaded from source systems |
| Silver | `silver_` | Cleaned, standardized, and transformed data |
| Gold | `gold_` | Business-ready analytical views |

---

### Tables

Format:

```text
<layer>_<source>_<entity>
```

Examples:

```text
bronze_crm_cust_info
bronze_crm_prd_info
bronze_crm_sales_details

silver_crm_cust_info
silver_crm_prd_info
silver_crm_sales_details

silver_erp_cust_az12
silver_erp_loc_a101
silver_erp_px_cat_g1v2
```

---

### Views

Format:

```text
gold_dim_<entity>
gold_fact_<entity>
```

Examples:

```text
gold_dim_customers
gold_dim_products
gold_fact_sales
```

---

### Stored Procedures

Format:

```text
sp_<action>_<layer>
```

Examples:

```text
sp_load_bronze
sp_load_silver
sp_load_gold
```

---

### Columns

- All column names use **snake_case**.
- Avoid spaces and special characters.
- Use meaningful, descriptive names.

Examples:

```text
customer_id
customer_key
first_name
last_name
sales_amount
product_number
order_date
birthdate
create_date
dwh_create_date
```

---

### Primary Keys

Format:

```text
<entity>_id
```

Examples:

```text
customer_id
product_id
order_id
```

---

### Surrogate Keys

Format:

```text
<entity>_key
```

Examples:

```text
customer_key
product_key
```

---

### Foreign Keys

Foreign keys follow the same naming convention as the referenced primary or surrogate key.

Examples:

```text
customer_key
product_key
customer_id
product_id
```

---

### Date Columns

Format:

```text
<event>_date
```

Examples:

```text
order_date
ship_date
due_date
start_date
end_date
birthdate
create_date
dwh_create_date
```

---

### Measures

Numeric business metrics use descriptive names.

Examples:

```text
sales_amount
quantity
price
cost
```

---

### SQL Style

- SQL keywords are written in **UPPERCASE**.
- Table and column names use **snake_case**.
- Aliases are short and meaningful.

Example:

```sql
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    s.sales_amount
FROM silver_crm_cust_info AS c
JOIN silver_crm_sales_details AS s
    ON c.customer_id = s.sls_cust_id;
```

---

### General Guidelines

- Use lowercase object names.
- Use underscores (`_`) instead of spaces.
- Avoid abbreviations unless they are source-system fields.
- Keep names consistent across all layers.
- Use descriptive names that clearly represent the business entity or attribute.
