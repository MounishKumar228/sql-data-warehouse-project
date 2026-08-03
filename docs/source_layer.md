# Silver Layer

## Overview

The Silver layer transforms raw data from the Bronze layer into clean, standardized, and reliable datasets suitable for business processing.

This layer performs data cleansing, validation, deduplication, standardization, and enrichment before the data is consumed by analytical models.

---

## Objectives

- Clean raw source data.
- Remove duplicate records.
- Standardize inconsistent values.
- Validate business rules.
- Improve data quality.
- Prepare data for analytical modeling.

---

## Source

The Silver layer consumes data exclusively from the Bronze layer.

```
Bronze Tables
      │
      ▼
Silver Transformations
      │
      ▼
Clean & Standardized Data
```

---

## Silver Tables

| Table | Description |
|---------|-------------|
| silver_crm_cust_info | Cleansed customer information |
| silver_crm_prd_info | Cleansed product information |
| silver_crm_sales_details | Validated sales transactions |
| silver_erp_cust_az12 | Standardized ERP customer data |
| silver_erp_loc_a101 | Standardized customer location |
| silver_erp_px_cat_g1v2 | Product category reference data |

---

## Transformations Performed

### Customer Data

- Removed duplicate customer records
- Selected the latest customer information
- Trimmed unwanted spaces
- Converted blank strings to NULL
- Standardized marital status
- Standardized gender values

---

### Product Data

- Extracted category identifiers
- Extracted product numbers
- Replaced missing product costs
- Standardized product lines
- Calculated product validity periods

---

### Sales Data

- Converted integer dates to DATE format
- Corrected invalid sales amounts
- Calculated missing prices
- Validated sales consistency

---

### ERP Customer

- Removed unnecessary customer prefixes
- Removed invalid future birth dates
- Standardized gender values

---

### ERP Location

- Standardized country names
- Converted blank values to `n/a`

---

### ERP Product Category

- Loaded validated category reference data

---

## Quality Checks

The Silver layer includes comprehensive validation to ensure high-quality data.

Checks include:

- Duplicate detection
- Primary key validation
- NULL validation
- Unwanted spaces
- Date validation
- Sales validation
- Country standardization
- Gender standardization
- Product cost validation
- Business rule verification

---

## ETL Procedure

The Silver layer is refreshed using a stored procedure.

```
sp_load_silver()
```

Features include:

- Table truncation
- Data transformation
- Progress logging
- Execution time measurement
- Row count reporting
- Error handling

---

## Output

The Silver layer produces clean, standardized datasets that serve as the foundation for the Gold layer.
