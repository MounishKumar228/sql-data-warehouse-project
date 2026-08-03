# Gold Layer

## Overview

The Gold layer represents the final stage of the data warehouse and contains business-ready data models optimized for reporting, dashboards, and analytics.

The data is organized using a Star Schema consisting of dimension and fact views.

---

## Objectives

- Deliver business-ready datasets.
- Simplify analytical queries.
- Improve reporting performance.
- Support BI tools such as Power BI.
- Provide a consistent semantic layer for analytics.

---

## Architecture

```
Silver Layer
      │
      ▼
Dimension Views
      │
      ▼
Fact View
      │
      ▼
Power BI / Analytics
```

---

## Gold Views

### Customer Dimension

**View**

```
gold_dim_customers
```

Provides:

- Customer profile
- Geographic information
- Demographic information
- Marital status
- Gender
- Birth date

---

### Product Dimension

**View**

```
gold_dim_products
```

Provides:

- Product information
- Product category
- Product subcategory
- Product maintenance
- Product line
- Product cost

Only active products are included.

---

### Sales Fact

**View**

```
gold_fact_sales
```

Contains:

- Sales transactions
- Customer relationships
- Product relationships
- Order dates
- Shipping dates
- Sales metrics

---

## Data Model

```
                 gold_dim_customers
                        │
                        │ Customer Key
                        │
                        ▼
                 gold_fact_sales
                        ▲
                        │ Product Key
                        │
                 gold_dim_products
```

---

## Business Model

The Gold layer follows a Star Schema.

### Dimensions

- Customer Dimension
- Product Dimension

### Fact

- Sales Fact

---

## Benefits

- Simplified SQL queries
- Optimized reporting
- Consistent business definitions
- Improved query performance
- Ready for Power BI dashboards
- Centralized analytical model

---

## Output

The Gold layer is the presentation layer of the data warehouse and serves as the primary data source for business intelligence, reporting, and decision-making.
