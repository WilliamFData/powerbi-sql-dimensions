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


| Colume Name       | Description       |
|----------------|----------------|
| DATE_DIM_ID  | Intended for use with large fact tables to optimize storage. For standard joins, prefer using the DATE column.  |
| DATE  | Actual date (YYYY-MM-DD  |
| DAY_OF_MONTH  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |
| DATE  | Row 2, Cell 2  |




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

