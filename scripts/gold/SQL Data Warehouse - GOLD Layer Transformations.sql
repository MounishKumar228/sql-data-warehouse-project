use datawarehouse;
select
	ci.cst_id,
	ci.cst_key,
	ci.cst_firstname,
	ci.cst_lastname,
	ci.cst_marital_status,
	ci.cst_gndr,
	ci.cst_create_date,
	ca.bdate,
	ca.gen,
	la.cntry
from silver_crm_cust_info as ci
left join silver_erp_cust_az12 ca
on 		  ci.cst_key=ca.cid
left join silver_erp_loc_a101 la
on 		  ci.cst_key=la.cid;

-- Checking Duplicates
select cst_id, count(*)
from(
	select
		ci.cst_id,
		ci.cst_key,
		ci.cst_firstname,
		ci.cst_lastname,
		ci.cst_marital_status,
		ci.cst_gndr,
		ci.cst_create_date,
		ca.bdate,
		ca.gen,
		la.cntry
	from silver_crm_cust_info as ci
	left join silver_erp_cust_az12 ca
	on 		  ci.cst_key=ca.cid
	left join silver_erp_loc_a101 la
	on 		  ci.cst_key=la.cid)t
group by cst_id
having count(*)>1;

-- Data Integration, (cst_gen, gen)
-- Master(left) table data is correct
select distinct
	ci.cst_gndr,
	ca.gen,
    case when ci.cst_gndr != 'n/a' then ci.cst_gndr
		 else ca.gen
	end new_gen
from silver_crm_cust_info as ci
left join silver_erp_cust_az12 ca
on 		  ci.cst_key=ca.cid
left join silver_erp_loc_a101 la
on 		  ci.cst_key=la.cid
order by 1,2;
































































