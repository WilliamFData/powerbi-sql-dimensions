# SQL Dimension Tables for Power BI

## Overview
This repository contains reusable **SQL scripts for building common dimension tables** designed for use in **Power BI**.

Dimension tables are a core part of **star schema design**, enabling clean relationships, easier DAX, and consistent reporting across multiple fact tables.

This project demonstrates:
- SQL skills in designing and generating dimension tables.
- Data modeling best practices for Business Intelligence (BI)

## Repository Structure
```text
powerbi-sql-dimension/
├── README.md                     # Project overview and documentation
├── Power BI/                     # Power BI report files
│   └── Portfolio PBI.pbix        # Main Power BI report
│   └── Portfolio PBI.pbip        # This format can be used to track changes between pull requests
├── SQL/                          # SQL scripts for dimension tables
│   ├── Dim_Date.sql              # Script to generate date dimension
│   └── Dim_Date_Period.sql       # Script for period-based date dimension
```
---


## Dimensions Included
### Dim_Date
- Covers 2000-2050 (easily extendable)
- Supports **financial year starting in July**
- Can be marked as the **offical Date Table** in Power BI


### Dim_Date_Period
- Parent of Dim_Date
- Used for defaults in Power BI


### Dim_Geography
- TBC

### Dim_Weather
- TBC

Data Dictionary: https://github.com/WilliamFData/powerbi-sql-dimensions/wiki/Data-Dictionary
---

## Example in Power BI
<img width="965" height="745" alt="image" src="https://github.com/user-attachments/assets/7f72526d-402c-4f4f-b231-c13671507713" />


- The Date Dimension is marked as the **Date Table**
- Dimensions connect to the Fact table in a **star schema** layout
- Simplifies time intelligence (MTD, YTD, FYTD, etc.) and improved report performance.
- The relationship between the Dim_Date and Dim_Date_Period runs both ways to allow for filtering

---

## Example Usage
Query combining multiple dimensions:
```sql
SELECT 
	  DD.DATE
	, FS.TRANSACTION_ID
	, PR.PRODUCT_NAME
	, SUM(FS.SALES_AMOUNT) AS SALES_AMOUNT
FROM FACT_SALES_TEST FS
	INNER JOIN DIM_DATE DD
		ON FS.DATE_DIM_ID = DD.DATE_DIM_ID
	INNER JOIN DIM_PRODUCT_TEST PR
		ON FS.PRODUCT_ID = PR.PRODUCT_ID
WHERE 1=1
GROUP BY ALL;

```

## Wiki Pages
- DAX Library: https://github.com/WilliamFData/powerbi-sql-dimensions/wiki/DAX-Library
- Data Dictionary: https://github.com/WilliamFData/powerbi-sql-dimensions/wiki/Data-Dictionary

## Useful Links
- https://docs.snowflake.com/en/sql-reference/functions/year
- https://www.abs.gov.au/statistics/standards/australian-statistical-geography-standard-asgs-edition-3/jul2021-jun2026/access-and-downloads/allocation-files
- https://data.gov.au/data/dataset/geocoded-national-address-file-g-naf
- https://www.abs.gov.au/census/find-census-data/datapacks?release=2021&product=GCP&geography=SAL&header=S
- https://github.com/HishamParol/Snowpark-bulk-loader/blob/main/snowpark_bulk_load.ipynb
- https://online.sqlfluff.com/

