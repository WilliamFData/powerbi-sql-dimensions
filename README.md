# SQL Dimension Tables for Power BI

## Overview
This repository contains reusable **SQL scripts for building common dimension tables** designed for use in **Power BI**

Dimension tables are a core part of **star schema design**, enabling clean relationships, easier DAX, and consistent reporting across multiple fact tables.

This project demonstrates:
- SQL skills in designing and generating dimension tables.
- Data modeling best practices for Business Intelligence (BI)

## Repository Structure


---


## Dimensions Included
### Dim_Date
- Covers 2000-2050 (easily extendable)
- Supports **financial year starting in July**
- Can be marked as the **offical Date Table** in Power BI
- Columns: DATE_DIM_ID, DATE, DAY_OF_MONTH, MONTH, MONTH_NAME_SHORT, MONTH_NAME_FULL, YEAR, DAY_OF_WEEK_NUM, DAY_OF_WEEK_DESC, ISO_WEEK, START_OF_WEEK, END_OF_WEEK, QUARTER, FIN_YEAR, ISO_YEAR, MONTH_YEAR, FIN_YEAR_DESC, DAY_OFFSET, WEEK_OFFSET, MONTH_OFFSET, YEAR_OFFSET

### Dim_Date_Period

### Dim_Geography


---

## Example in Power BI
*(placeholder - add a screenshot of your model-diagram.png)*

- The Date Dimension is marked as the **Date Table**
- Dimensions connect to the Fact table in a **star schema** layout
- Simplifies time intelligence (MTD, YTD, FYTD, etc.) and improved report performance.

---

## Example Usage
Query combining multiple dimensions:
```sql
SELECT *
FROM FACT;

```



## Useful Links
- https://docs.snowflake.com/en/sql-reference/functions/year

