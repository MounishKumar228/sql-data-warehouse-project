use datawarehouse;

-- =======================================
-- SOURCE TABLE: source_crm
-- Extracting to the SILVER LAYER
-- =======================================
-- In the middle of the project, if you have to change the datatype or change the column in a table, you can use the ALTER TABLE syntax. 

CREATE TABLE silver_crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(100),
    cst_lastname VARCHAR(100),
    cst_marital_status VARCHAR(20),
    cst_gndr VARCHAR(20),
    cst_create_date DATE,
    dwh_create_date datetime default current_timestamp
);

CREATE TABLE silver_crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(200),
    prd_cost DECIMAL(10,2),
    prd_line VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date datetime default current_timestamp
);

CREATE TABLE silver_crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales DECIMAL(12,2),
    sls_quantity INT,
    sls_price DECIMAL(12,2),
    dwh_create_date datetime default current_timestamp
);

-- ============================================
-- SOURCE TABLE: source_erp
-- ============================================

CREATE TABLE silver_erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(20),
    dwh_create_date datetime default current_timestamp
);

CREATE TABLE silver_erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(100),
    dwh_create_date datetime default current_timestamp
);

CREATE TABLE silver_erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(100),
    subcat VARCHAR(100),
    maintenance VARCHAR(20),
    dwh_create_date datetime default current_timestamp
);