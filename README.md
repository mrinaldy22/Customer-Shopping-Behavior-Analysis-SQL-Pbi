# 📊 Customer-Shopping-Behavior-Analysis-SQL-Pbi

![Dashboard Preview](Assets/dashboard.png)
*(Note: Please ensure the image path matches your folder structure)*

## 📌 Project Overview
This project focuses on **End-to-End Data Analysis**, starting from raw data processing using **SQL** to interactive visualization using **Power BI**. The main goal is to transform raw customer data into meaningful insights through logic-based segmentation and data cleaning.

## 🛠️ Tools & Technologies
- **SQL (Structured Query Language):** Used for Data Cleaning, Standardization, and Business Logic implementation.
- **Power BI:** Used for creating the interactive dashboard and reporting.
- **GitHub:** Version control and documentation.

## ⚙️ Data Transformation & Logic (SQL)
Before visualizing the data, I performed several data transformation steps to ensure data quality:
1.  **Standardized Columns:** Renamed and reformatted columns for consistency.
2.  **Handled NULL Values:** Implemented logic to manage missing data points.
3.  **Customer Segmentation:** Created a custom logic to categorize users into generations (Gen Z, Millennials, etc.).

### 🔍 Key SQL Logic Snippet
Here is the `CASE WHEN` statement used to segment the customers based on their generations:

```sql
alter table shopping_behavior
add Generations varchar(20);

update shopping_behavior
set Generations = case
  WHEN Age BETWEEN 61 AND 79 THEN 'Gen Boomers'
  WHEN Age BETWEEN 45 AND 60 THEN 'Gen X'
  WHEN Age BETWEEN 29 AND 44 THEN 'Gen Millenial'
  WHEN Age BETWEEN 13 AND 28 THEN 'Gen Z'
  WHEN Age BETWEEN 0 AND 12 THEN 'Gen Alpha'
  else 'Others'
end;
