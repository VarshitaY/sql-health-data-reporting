# 🏥 SQL Health Data Reporting

**Analyzing U.S. Chronic Disease Trends, Gender Disparities, and State-Level Priorities Using MySQL**

---

## 📌 Overview

This project explores key patterns in chronic disease surveillance data from the CDC. By writing modular SQL queries on a large, multi-dimensional dataset, the analysis brings out meaningful trends related to time, gender, and geography in public health indicators across the United States.

---

## 🚨 Purpose

With rising chronic disease burden in the U.S., making sense of large public health datasets is essential. This project focuses on three core questions:

- How are certain chronic conditions trending over the years?
- Are there noticeable differences between male and female populations across various diseases?
- Which health topics dominate concern in different U.S. states?

The aim is to simplify complex health data into clear, evidence-backed insights using SQL.

---

## 💾 Dataset Details

- **Source:** CDC Chronic Disease Indicators (Publicly available dataset)
- **File Used:** `data/cdc_data.csv`
- **Size:** ~309,000 records across 34 columns
- **Tool Used:** MySQL Workbench

---

## 🧠 Insights Summary

### 1️⃣ Chronic Condition Trends (2019–2022)

- **Cardiovascular Disease** consistently has high reporting volumes, peaking in 2019 and again in 2021 after a dip in 2020.
- **Diabetes** shows a slight drop in reported entries by 2022, which could reflect either reduced screening or data lag.
- The shift in trends during 2020 aligns with the known impact of the COVID-19 pandemic on routine health monitoring.

### 2️⃣ Gender-Based Comparison

- Disease-wise reporting across male and female populations is nearly identical for each condition.
- Conditions like **Cardiovascular Disease**, **Diabetes**, **Cancer**, and **COPD** appear with equal frequency across genders — suggesting balanced public health reporting.
- Some topics like **Mental Health** and **Sleep** appear slightly more often in female records, which might warrant closer look in future analysis.

### 3️⃣ State-Wise Health Priorities

- In almost every U.S. state and territory, **Cardiovascular Disease** ranks as the top concern by frequency.
- **Chronic Obstructive Pulmonary Disease** and **Nutrition, Physical Activity, and Weight Status** often follow, forming the top 3 across states.
- Territories like **Guam**, **Puerto Rico**, and **U.S. Virgin Islands** show different patterns — focusing more on general **Health Status** and **Alcohol** use. This reflects regional variation in health challenges and priorities.

---

## 🛠️ Project Structure

sql-health-data-reporting/
│
├── data/
│ └── cdc_data.csv # Raw dataset 
│
├── schema/
│ └── create_table.sql # MySQL schema definition
│
├── queries/
│ ├── 01_chronic_trend.sql # Time-based trends query
│ ├── 02_gender_disparity.sql # Gender-based insights query
│ └── 03_state_priority.sql # State-level ranking query
│
├── outputs/
│ ├── chronic_trends.csv
│ ├── gender_disparity.csv
│ └── state_priorities.csv
│
└── README.md # You're here!


---

## 🚀 Tools & Workflow

- **SQL Platform:** MySQL Workbench (local setup)
- **Version Control:** Git + GitHub
- **Workflow:** Data imported into MySQL → Structured queries written → CSVs exported → Tracked in Git → Insights documented

---

## 👋 About Me

I'm someone who enjoys exploring real-world problems through data. Public health, in particular, fascinates me — not just for its numbers, but for the lives and systems behind them. This project was a way to bring together what I’ve learned about SQL, data thinking, and meaningful analysis.

Still learning. Always improving.

---

## 👤 Author

**Varshita Yeddula**  
Data / BI Analyst (Health-Tech Focus)  

📧 [Email me](varshitayeddula@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/varshita-reddy-yeddula-45102b254)

