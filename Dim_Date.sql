-- ====================================================================================================================
-- Step 1. Generate Dates
-- ====================================================================================================================
CREATE OR REPLACE TABLE DATES AS
WITH DATE_RANGE AS 
(
  SELECT DATEADD(DAY, SEQ4(), DATE '2000-01-01') AS DATE
  FROM TABLE(GENERATOR(ROWCOUNT => 18628)) -- 1 year of dates is 365
)
SELECT * FROM DATE_RANGE

--SELECT * FROM DATES

-- ====================================================================================================================
-- Step 2. Create logic for date dimension
-- ====================================================================================================================
CREATE OR REPLACE TABLE DIM_DATE AS 
SELECT 
	  TO_NUMBER(TO_CHAR(DATE, 'YYYYMMDD')) AS DATE_DIM_ID
	, DATE
	, DAY(DATE) AS DAY_OF_MONTH
	, MONTH(DATE) AS MONTH
	, MONTHNAME(DATE) AS MONTH_NAME_SHORT
	, TO_CHAR(DATE, 'MMMM') AS MONTH_NAME_FULL
	, YEAR(DATE) AS YEAR
--Weeks (Can be used for Same Day Last Year Calculations)
	, DAYOFWEEKISO(DATE) AS DAY_OF_WEEK_NUM
	, TO_CHAR(DATE, 'DY') DAY_OF_WEEK_DESC
	, WEEKISO(DATE) AS ISO_WEEK
	, DATE_TRUNC('WEEK', DATE) AS START_OF_WEEK
	, DATEADD('DAY', 6, DATE_TRUNC('WEEK', DATE)) AS END_OF_WEEK
--Quarters
	, QUARTER(DATE) AS QUARTER
--Years
	, YEAR + CASE WHEN MONTH >= 7 THEN 1 ELSE 0 END AS FIN_YEAR
	, YEAROFWEEKISO(DATE) AS ISO_YEAR
--Display 
	, TO_CHAR(DATE, 'MON-YYYY') AS MONTH_YEAR
	, CONCAT('FY',FIN_YEAR) AS FIN_YEAR_DESC
--Offsets
	, DATEDIFF(DAY, DATE, GETDATE()::DATE) * -1 AS DAY_OFFSET
	, DATEDIFF(WEEK, DATE, GETDATE()::DATE) * -1 AS WEEK_OFFSET
	, DATEDIFF(MONTH, DATE, GETDATE()::DATE) * -1 AS MONTH_OFFSET
	, DATEDIFF(YEAR, DATE, GETDATE()::DATE) * -1 AS YEAR_OFFSET
FROM DATES
WHERE 1=1
	AND DATE <= DATEADD(DAY,-1,GETDATE()::DATE)--For if you only want historical dates
ORDER BY 1 DESC 

--SELECT * FROM DIM_DATE


