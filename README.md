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

| Colume Name    | Description    |
|----------------|----------------|
| DATE_DIM_ID  | Intended for use with large fact tables to optimize storage. For standard joins, prefer using the DATE column.  |
| DATE  | Actual date (YYYY-MM-DD)  |
| DAY_OF_MONTH  | Day number within the month  |
| MONTH  | Month number (1-12)  |
| MONTH_NAME_SHORT  | Abbreviated month name (e.g., Jan)  |
| MONTH_NAME_FULL  | Full month name (e.g., January)  |
| YEAR  | Calendar year  |
| DAY_OF_WEEK_NUM  | Day of week number (e.g., 1 = Monday)  |
| DAY_OF_WEEK_DESC  | Day name (e.g., Mon)  |
| ISO_WEEK  | ISO 8601 week number  |
| START_OF_WEEK  | Date of the Monday of the week  |
| END_OF_WEEK  | Date of the Sunday of the week  |
| QUARTER  | Calendar quarter (1–4)  |
| FIN_YEAR  | Financial year (e.g., 2023 for July 2022–June 2023)  |
| ISO_YEAR  | ISO 8601 year  |
| MONTH_YEAR  | Concatenated month and year (e.g., Jan-2023)  |
| FIN_YEAR_DESC  | Financial year label (e.g., FY23)  |
| DAY_OFFSET*  | Daily offset from today (eg., Yesterday = -1)  |
| WEEK_OFFSET*  | Weekly offset from today  |
| MONTH_OFFSET*  | Monthly offset from today  |
| YEAR_OFFSET*  | Yearly offset from today  |

\* The Power BI file would have to update daily for these to be up to date.


### Dim_Date_Period
- Parent of Dim_Date
- Used for defaults in Power BI

| Colume Name    | Description    |
|----------------|----------------|
| DATE_DIM_ID  | Used to join to Dim_Date  |
| DATE_PERIOD  | Date period description  |
| PERIOD_ORDER  | Order of periods used in Power BI  |

### Dim_Geography
- TBC

### Dim_Weather
- TBC


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

