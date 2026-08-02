/*
===============================================================================
                            Quality Checks - Silver Layer
===============================================================================

Script Purpose:
    This script performs data quality checks on the Silver layer to validate
    data consistency, completeness, and standardization after the ETL process.

    The script includes checks for:
    - Null or duplicate primary keys.
    - Unwanted leading or trailing spaces.
    - Data standardization and consistency.
    - Invalid date ranges and date orders.
    - Data consistency between related fields.
    - Invalid numeric values.

Usage Notes:
    - Execute this script after loading the Silver layer.
    - Any query returning rows indicates a potential data quality issue.
    - Investigate and resolve any discrepancies before proceeding to the Gold layer.

===============================================================================
*/

USE datawarehouse;

-- =============================================================================
-- Checking 'silver_crm_cust_info'
-- =============================================================================

-- Check 1: Nulls or Duplicates in Primary Key
-- Expectation: No Results

SELECT
    cst_id,
    COUNT(*) AS duplicates
FROM silver_crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1
    OR cst_id IS NULL;


-- Check 2: Unwanted Spaces in First Name
-- Expectation: No Results

SELECT
    cst_firstname
FROM silver_crm_cust_info
WHERE cst_firstname <> TRIM(cst_firstname);


-- Check 3: Unwanted Spaces in Last Name
-- Expectation: No Results

SELECT
    cst_lastname
FROM silver_crm_cust_info
WHERE cst_lastname <> TRIM(cst_lastname);


-- Check 4: Unwanted Spaces in Gender
-- Expectation: No Results

SELECT
    cst_gndr
FROM silver_crm_cust_info
WHERE cst_gndr <> TRIM(cst_gndr);


-- Check 5: Data Standardization
-- Expectation: Male, Female, n/a

SELECT DISTINCT
    cst_gndr
FROM silver_crm_cust_info;


-- =============================================================================
-- Checking 'silver_crm_prd_info'
-- =============================================================================

-- Check 1: Nulls or Duplicates in Primary Key
-- Expectation: No Results

SELECT
    prd_id,
    COUNT(*) AS duplicates
FROM silver_crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1
    OR prd_id IS NULL;


-- Check 2: Unwanted Spaces in Product Name
-- Expectation: No Results

SELECT
    prd_nm
FROM silver_crm_prd_info
WHERE prd_nm <> TRIM(prd_nm);


-- Check 3: Invalid Product Cost
-- Expectation: No Results

SELECT
    prd_cost
FROM silver_crm_prd_info
WHERE prd_cost IS NULL
   OR prd_cost < 0;


-- Check 4: Product Line Standardization
-- Expectation:
-- Mountain, Road, Touring, Other Sales, n/a

SELECT DISTINCT
    prd_line
FROM silver_crm_prd_info;


-- Check 5: Invalid Date Range
-- Expectation: No Results

SELECT
    *
FROM silver_crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- =============================================================================
-- Checking 'silver_crm_sales_details'
-- =============================================================================

-- Check 1: Invalid Order, Ship or Due Dates
-- Expectation: No Results

SELECT
    *
FROM silver_crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;


-- Check 2: Sales Amount Consistency
-- Expectation: No Results

SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver_crm_sales_details
WHERE sls_sales <> sls_quantity * sls_price
   OR sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantity <= 0
   OR sls_price <= 0
ORDER BY
    sls_sales,
    sls_quantity,
    sls_price;


-- =============================================================================
-- Checking 'silver_erp_cust_az12'
-- =============================================================================

-- Check 1: Future Birth Dates
-- Expectation: No Results

SELECT
    bdate
FROM silver_erp_cust_az12
WHERE bdate > NOW();


-- Check 2: Gender Standardization
-- Expectation:
-- Male, Female, n/a

SELECT DISTINCT
    gen
FROM silver_erp_cust_az12;


-- =============================================================================
-- Checking 'silver_erp_loc_a101'
-- =============================================================================

-- Check 1: Country Standardization
-- Expectation:
-- Germany, United States, n/a, ...

SELECT DISTINCT
    cntry
FROM silver_erp_loc_a101;

-- =============================================================================
-- Checking 'silver_erp_px_cat_g1v2'
-- =============================================================================

-- No quality checks required.
-- This table is copied from the Bronze layer without transformations.