-- ===================================================================
-- Step 1. Generate Dates
-- ===================================================================
CREATE OR REPLACE TABLE DATES AS
WITH DATE_RANGE AS 
(
    SELECT DATEADD(DAY, SEQ4(), DATE '2000-01-01') AS DATE_ID
    FROM TABLE(GENERATOR(ROWCOUNT => 18628)) -- 1 year of dates is 365
)
SELECT * FROM DATE_RANGE

--SELECT * FROM DATES

-- ===================================================================
-- Step 2. Create logic for date dimension
-- ===================================================================
CREATE OR REPLACE TABLE DIM_DATE AS 
SELECT 
	  TO_NUMBER(TO_CHAR(DATE_ID, 'YYYYMMDD')) AS DATE_DIM_ID
	, DATE_ID
	, DAY(DATE_ID) AS DAY_OF_MONTH
	, MONTH(DATE_ID) AS MONTH
	, MONTHNAME(DATE_ID) AS MONTH_NAME_SHORT
	, TO_CHAR(DATE_ID, 'MMMM') AS MONTH_NAME_FULL
	, YEAR(DATE_ID) AS YEAR
--Weeks (Can be used for Same Day Last Year Calculations)
	, DAYOFWEEKISO(DATE_ID) AS DAY_OF_WEEK_NUM
	, TO_CHAR(DATE_ID, 'DY') DAY_OF_WEEK_DESC
	, WEEKISO(DATE_ID) AS ISO_WEEK
	, CONCAT(WEEKISO(DATE_ID), '-', DAYOFWEEKISO(DATE_ID)) AS SAME_DAY_KEY
	, DATE_TRUNC('WEEK', DATE_ID) AS START_OF_WEEK
	, DATEADD('DAY', 6, DATE_TRUNC('WEEK', DATE_ID)) AS END_OF_WEEK
--Quarters
	, QUARTER(DATE_ID) AS QUARTER
--Years
	, YEAR + CASE WHEN MONTH >= 7 THEN 1 ELSE 0 END AS FIN_YEAR
	, YEAROFWEEKISO(DATE_ID) AS ISO_YEAR
--Display 
	, TO_CHAR(DATE_ID, 'MON-YYYY') AS MONTH_YEAR
	, CONCAT('FY',FIN_YEAR) AS FIN_YEAR_DESC
--Offsets
	, DATEDIFF(DAY, DATE_ID, GETDATE()::DATE) * -1 AS DAY_OFFSET
	, DATEDIFF(WEEK, DATE_ID, GETDATE()::DATE) * -1 AS WEEK_OFFSET
	, DATEDIFF(MONTH, DATE_ID, GETDATE()::DATE) * -1 AS MONTH_OFFSET
	, DATEDIFF(YEAR, DATE_ID, GETDATE()::DATE) * -1 AS YEAR_OFFSET
FROM DATES
WHERE 1=1
	AND DATE_ID <= DATEADD(DAY,-1,GETDATE()::DATE)--For if you only want historical dates
ORDER BY 1 DESC 

--SELECT * FROM DIM_DATE
