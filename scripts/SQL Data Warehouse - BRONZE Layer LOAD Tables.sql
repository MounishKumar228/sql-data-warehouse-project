use datawarehouse;


/*
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'local_infile';

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW SESSION VARIABLES LIKE 'local_infile';
select version();
SHOW VARIABLES LIKE 'secure_file_priv';
*/


	-- CRM Customer Information
    TRUNCATE TABLE bronze_crm_cust_info;

	LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_crm/cust_info.csv'
	INTO TABLE bronze_crm_cust_info
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		@cst_id,
		cst_key,
		cst_firstname,
		cst_lastname,
		cst_marital_status,
		cst_gndr,
		@cst_create_date
	)
	SET
		cst_id = NULLIF(@cst_id, ''),
		cst_create_date = NULLIF(@cst_create_date, '');
	
     -- CRM Product Information
    TRUNCATE TABLE bronze_crm_prd_info;
    
	LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_crm/prd_info.csv'
	INTO TABLE bronze_crm_prd_info
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		@prd_id,
		prd_key,
		prd_nm,
		@prd_cost,
		prd_line,
		@prd_start_dt,
		@prd_end_dt
	)
	SET
		prd_id = NULLIF(@prd_id, ''),
		prd_cost = NULLIF(@prd_cost, ''),
		prd_start_dt = NULLIF(@prd_start_dt, ''),
		prd_end_dt = NULLIF(@prd_end_dt, '');
		
	 -- CRM Sales Details
    TRUNCATE TABLE bronze_crm_sales_details;

    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_crm/sales_details.csv'
	INTO TABLE bronze_crm_sales_details
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		sls_ord_num,
		sls_prd_key,
		@sls_cust_id,
		@sls_order_dt,
		@sls_ship_dt,
		@sls_due_dt,
		@sls_sales,
		@sls_quantity,
		@sls_price
	)
	SET
		sls_cust_id = NULLIF(@sls_cust_id, ''),
		sls_order_dt = NULLIF(@sls_order_dt, ''),
		sls_ship_dt = NULLIF(@sls_ship_dt, ''),
		sls_due_dt = NULLIF(@sls_due_dt, ''),
		sls_sales = NULLIF(@sls_sales, ''),
		sls_quantity = NULLIF(@sls_quantity, ''),
		sls_price = NULLIF(@sls_price, '');
		
	-- DESCRIBE bronze_erp_cust_az12;
	
	-- ERP Customer
    TRUNCATE TABLE bronze_erp_cust_az12;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_erp/CUST_AZ12.csv'
	INTO TABLE bronze_erp_cust_az12
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		cid,
		@bdate,
		@gen
	)
	SET
		bdate = NULLIF(@bdate, ''),
		gen = NULLIF(@gen, '');

    -- ERP Location
    TRUNCATE TABLE bronze_erp_loc_a101;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_erp/LOC_A101.csv'
	INTO TABLE bronze_erp_loc_a101
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		cid,
		cntry
	);

	-- ERP Product Category
    TRUNCATE TABLE bronze_erp_px_cat_g1v2;
    
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/source_erp/PX_CAT_G1V2.csv'
	INTO TABLE bronze_erp_px_cat_g1v2
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS
	(
		id,
		cat,
		subcat,
		maintenance
	);



select * from bronze_crm_cust_info;
select count(*) from bronze_crm_cust_info;
-- Check Duplicates
SELECT cst_id, COUNT(*) AS occurrences
FROM bronze_crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1;



