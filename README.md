# Loan-Risk-Dashboard

# Credit Risk Dashboard: Analyzing Problem Loans in a Bank Portfolio

An SQL + Power BI project that analyzes problem loans (Defaulted or Written Off) in a bank's loan portfolio.

![Dashboard page 1](GambaranUmum.png)
![Dashboard page 2](FaktorRisiko.png)

## Problem
About 1 in 10 loans ends up Defaulted or Written Off. It is unclear how large the exposure is, where it sits, and whether customer indicators can tell risky borrowers apart.

## What I Did
- Explored the raw tables in SQL and checked data quality (orphan keys, duplicates, date logic).
- Joined loans, customers, and branches into one analysis table and grouped credit score, income, and interest rate with CASE WHEN.
- Built a 2-page Power BI dashboard with DAX measures and slicers.
- Tested group differences with chi-square tests before writing insights.

## Key Findings
- 2,159 of 21,382 loans (10.1%) are Defaulted or Written Off.
- Problem-loan rates differ little across cities, loan types, and years.
- Average interest is about 11.5% in every credit-score band.

## Files
- `sql/loan_analysis.sql`: query that builds the analysis table
- `Dashboard_Loan_Risk.pdf`: dashboard export

## Data
Banking Transactions Dataset: [https://www.kaggle.com/datasets/vivekmali1436/banking-transactions-dataset]. The dataset appears to be synthetic. Raw data is not included because of its size.

## Tools
SQL (SQLite), Power BI, DAX
