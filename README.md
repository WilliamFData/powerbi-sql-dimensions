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

## Wiki Pages
- Data Dictionary: https://github.com/WilliamFData/powerbi-sql-dimensions/wiki/Data-Dictionary
- DAX Library: https://github.com/WilliamFData/powerbi-sql-dimensions/wiki/DAX-Library

