-- ====================================================================================================================
-- Dimension Date Period
-- ====================================================================================================================
CREATE OR REPLACE TABLE DIM_DATE_PERIOD AS 
WITH cteDates AS 
(
	SELECT 
		  DATEADD(DAY,-1, GETDATE()::DATE) AS YESTERDAY
--		  '11-Sep-2025'::DATE AS YESTERDAY--USED FOR TESTING
		, GETDATE()::DATE AS TODAY
--		, '12-Sep-2025'::DATE AS TODAY--USED FOR TESTING
		, DATE_TRUNC('WEEK', DATEADD('WEEK', -1, TODAY)) AS START_OF_PRIOR_WEEK
		, DATEADD('DAY', 6, DATE_TRUNC('WEEK', DATEADD('WEEK', -1, TODAY))) AS END_OF_PRIOR_WEEK
		, DATE_TRUNC(MONTH,YESTERDAY) AS START_OF_MONTH
		, DATE_TRUNC(MONTH,DATEADD(MONTH,-1,YESTERDAY)) AS START_OF_PRIOR_MONTH
		, LAST_DAY(DATEADD(MONTH,-1,YESTERDAY)) AS END_OF_PRIOR_MONTH
		, CASE WHEN MONTH(YESTERDAY) >= 7 THEN TO_DATE(YEAR(YESTERDAY) || '-07-01')
		  	   ELSE TO_DATE((YEAR(YESTERDAY) - 1) || '-07-01')
		  END AS START_OF_FIN_YEAR
		, CASE WHEN MONTH(YESTERDAY) < 7 THEN TO_DATE(YEAR(YESTERDAY) || '-06-30')
		  	   ELSE TO_DATE((YEAR(YESTERDAY) + 1) || '-06-30')
		  END AS END_OF_FIN_YEAR
		, DATEADD(YEAR,-1,START_OF_FIN_YEAR) AS START_OF_PRIOR_FY
		, DATEADD(YEAR,-1,END_OF_FIN_YEAR) AS END_OF_PRIOR_FY
		, DATE_FROM_PARTS(YEAR(YESTERDAY), 1, 1) AS START_OF_YEAR
)
--SELECT * FROM cteDates
-- ====================================================
-- Yesterday
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'Yesterday' AS DATE_PERIOD
	, 1 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE = (SELECT YESTERDAY FROM cteDates)
UNION ALL 
-- ====================================================
-- Prior Week
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'Prior Week' AS DATE_PERIOD
	, 2 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_PRIOR_WEEK FROM cteDates) AND (SELECT END_OF_PRIOR_WEEK FROM cteDates)
UNION ALL 
-- ====================================================
-- MTD
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'MTD'
	, 3 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_MONTH FROM cteDates) AND (SELECT YESTERDAY FROM cteDates)
UNION ALL 
-- ====================================================
-- Prior Month
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'Prior Month'
	, 4 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_PRIOR_MONTH FROM cteDates) AND (SELECT END_OF_PRIOR_MONTH FROM cteDates)
UNION ALL 
-- ====================================================
-- FYTD
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'FYTD'
	, 5 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_FIN_YEAR FROM cteDates) AND (SELECT END_OF_FIN_YEAR FROM cteDates)
	UNION ALL  
-- ====================================================
-- Prior Fin Year
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'Prior Fin Year'
	, 6 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_PRIOR_FY FROM cteDates) AND (SELECT END_OF_PRIOR_FY FROM cteDates)
	UNION ALL  
-- ====================================================
-- YTD
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'YTD'
	, 7 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE BETWEEN (SELECT START_OF_YEAR FROM cteDates) AND (SELECT YESTERDAY FROM cteDates)
	UNION ALL 
-- ====================================================
-- Custom (Make sure to clear the date filter before switching back)
-- ====================================================
SELECT 
	  DATE_DIM_ID
	, 'Custom'
	, 8 AS PERIOD_ORDER
FROM DIM_DATE
WHERE 1=1
	AND DATE <= (SELECT YESTERDAY FROM cteDates)

--SELECT * FROM DIM_DATE_PERIOD


