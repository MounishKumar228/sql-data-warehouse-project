# Bronze Layer

## Overview

The Bronze layer is the first stage of the data warehouse and serves as the landing zone for raw source data.

Its primary purpose is to ingest data from multiple source systems while preserving the original structure and values. No business transformations are applied at this stage, ensuring that the raw data remains available for auditing, troubleshooting, and reprocessing.

---

## Objectives

- Ingest data from multiple source systems.
- Preserve source data without modification.
- Maintain a historical copy of the original data.
- Provide a reliable foundation for downstream transformations.
- Enable data recovery and traceability.

---

## Source Systems

This project integrates data from two different operational systems.

### CRM Source

- Customer Information (`cust_info.csv`)
- Product Information (`prd_info.csv`)
- Sales Details (`sales_details.csv`)

### ERP Source

- Customer Information (`CUST_AZ12.csv`)
- Customer Location (`LOC_A101.csv`)
- Product Categories (`PX_CAT_G1V2.csv`)

---

## Bronze Tables

| Table | Description |
|---------|-------------|
| bronze_crm_cust_info | Raw customer data from CRM |
| bronze_crm_prd_info | Raw product data from CRM |
| bronze_crm_sales_details | Raw sales transactions from CRM |
| bronze_erp_cust_az12 | Raw customer demographic data from ERP |
| bronze_erp_loc_a101 | Raw customer location data from ERP |
| bronze_erp_px_cat_g1v2 | Raw product category data from ERP |

---

## Data Loading Process

The source CSV files are loaded into MySQL using the `LOAD DATA INFILE` command.

### Loading Steps

1. Create Bronze tables.
2. Copy source CSV files into the MySQL upload directory.
3. Load files using bulk loading.
4. Preserve all source records.
5. Handle empty values during loading where necessary.

---

## Characteristics

- Raw source data
- No business transformations
- Minimal validation
- High-performance bulk loading
- One table per source entity

---

## Output

The Bronze layer acts as the staging area for the Silver layer, where data cleansing and standardization begin.
