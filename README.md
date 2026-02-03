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
│   └── Portfolio PBI.pbip        # This format can be used to track changes between pull requests
│   └── Portfolio PBI.pbix        # PBIX Format (Latest version)
├── SQL/                          # SQL scripts for dimension tables
│   ├── Dim_Date.sql              # Script to generate date dimension
│   └── Dim_Date_Period.sql       # Script for period-based date dimension
```

---

## Wiki Pages
# 📚 Navigation
- [Home](Home)
   - [Table of Contents](Home#Table-of-Contents)
   - [Dimensions](Home#Dimensions)
   - [Useful Links](Home#Useful-Links)

## 🔍 Core Sections
- [Data Dictionary](Data-Dictionary)
   - [Dim_Date](Data-Dictionary#dim_date)
   - [Dim_Date_Period](Data-Dictionary#dim_date_period)
- [DAX Library](DAX-Library)
- Example Model Usage

## 📈 Power Bi Showcases
- Cascading Date Filters
- SDLY vs SPLY
- [Using Figma for Power BI templates](Using-Figma-for-Power-BI-templates)
