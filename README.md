# QueryVista: Advanced SQL Analytics Project

**QueryVista** is a comprehensive SQL-based analytics project that simulates real-world data scenarios to explore customer behavior, campaign effectiveness, and product performance.
This project is designed to showcase advanced SQL skills using a 20,000+ row synthetic dataset.

---

## Project Objective

To demonstrate the ability to extract meaningful insights from relational databases using advanced SQL techniques. The project focuses on:
- Mapping customer journeys
- Analyzing campaign performance
- Segmenting users based on behavioral patterns
- Modeling data in a star schema for analytical queries

---

## Schema Design : A star schema structure was used to organize the data.

---

## Datasets

- `dim_customer.csv` – 20,000 customers with attributes like name, email, gender, and signup date
- `dim_product.csv` – 200 products with price and category
- `dim_campaign.csv` – 10 simulated marketing campaigns
- `fact_transactions.csv` – 20,000+ transactions joining customers, products, and campaigns

All data is synthetic and generated using [Faker](https://faker.readthedocs.io/en/master/).

---

## Key SQL Features Demonstrated

- Complex JOINs and filtering
- Window Functions (`ROW_NUMBER`, `LAG`, `LEAD`)
- CTEs and recursive queries
- CASE statements and conditional logic
- Subqueries and nested aggregations
- Cohort and funnel analysis
- Data modeling best practices

---

##  Sample Use Cases

### 1. Customer Journey Funnel
Identifies one-time vs. repeat buyers using `COUNT`, `GROUP BY`, and filtering logic.

### 2. Campaign ROI Analysis
Analyzes revenue generated per campaign, average spend, and customer reach.

### 3. Product Performance
Finds top-selling products by category and revenue using aggregation and ranking functions.

### 4. Retention Analysis
Cohort-based analysis using time-based grouping and DISTINCT user tracking.

---

## 🛠️ Tools Used

- **SQL Engine**: PostgreSQL (compatible with MySQL/SQLite)
- **Data Generation**: Python (Faker, NumPy, Pandas)
- **Optional Visualization**: Power BI / Streamlit (for dashboarding)

---

## 🚀 How to Run

1. Clone the repository
2. Load the `.csv` files into your SQL database
3. Use `schema.sql` to create tables
4. Run the provided SQL queries in your SQL IDE
5. (Optional) Use Power BI for dashboard visualization

---

## 📁 Folder Structure



