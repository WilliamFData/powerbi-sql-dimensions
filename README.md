# SQL Dimension Tables for Power BI

## Overview
This repository contains reusable **SQL scripts for building common dimesnion tables** designed for use in **Power BI**

Dimesnion tables are a core part of **star schema design**, enabling clean relationships, easier DAX, and consistent reporting across multiple fact tables.

This project demonstrates:
- SQL skills in designing and generating dimension tables.
- Data modeling best practices for Business Intelligence (BI)

## Repository Structure


---


## Dimensions Included
### Dim_Date
- Covers 2000-2050 (easily extendable)
- Attributes: 'DateKey', ...
- Supports **financial year starting in July**
- Can be marked as the **offical Date Table** in Power BI

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
- https://docs.snowflake.com/en/sql-reference/functions/year<img width="488" height="17" alt="image" src="https://github.com/user-attachments/assets/c4297b86-d570-4757-8c2d-6aab4d641dc1" />

