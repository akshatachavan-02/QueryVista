
-- QueryVista Advanced SQL Scripts
-- Author: Akshata Chavan
-- Description: This file contains advanced SQL scripts for customer journey, campaign insights, and sales analytics.

-- 01. Customer Journey Funnel
WITH customer_steps AS (
  SELECT
    customer_id,
    COUNT(*) AS total_transactions
  FROM fact_transactions
  GROUP BY customer_id
)
SELECT
  COUNT(*) FILTER (WHERE total_transactions = 1) AS one_time_buyers,
  COUNT(*) FILTER (WHERE total_transactions > 1) AS repeat_buyers
FROM customer_steps;

-- 02. Campaign Performance
SELECT 
  c.campaign_name,
  COUNT(DISTINCT t.customer_id) AS customers_reached,
  SUM(t.total_amount) AS revenue_generated,
  ROUND(SUM(t.total_amount) / COUNT(DISTINCT t.customer_id), 2) AS avg_spend_per_customer
FROM fact_transactions t
JOIN dim_campaign c ON t.campaign_id = c.campaign_id
GROUP BY c.campaign_name
ORDER BY revenue_generated DESC;

-- 03. Top Products by Revenue
SELECT 
  p.product_name,
  p.category,
  SUM(t.quantity) AS total_units_sold,
  SUM(t.total_amount) AS total_revenue
FROM fact_transactions t
JOIN dim_product p ON t.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- 04. Monthly Revenue Trends
SELECT 
  DATE_TRUNC('month', transaction_date) AS month,
  SUM(total_amount) AS monthly_revenue
FROM fact_transactions
GROUP BY month
ORDER BY month;

-- 05. Customer Lifetime Value (LTV)
SELECT 
  customer_id,
  COUNT(*) AS total_orders,
  SUM(total_amount) AS lifetime_value,
  ROUND(AVG(total_amount), 2) AS avg_order_value
FROM fact_transactions
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;

-- 06. Retention Cohort Analysis
WITH cohort AS (
  SELECT 
    customer_id,
    DATE_TRUNC('month', MIN(transaction_date)) AS cohort_month
  FROM fact_transactions
  GROUP BY customer_id
),
activity AS (
  SELECT 
    customer_id,
    DATE_TRUNC('month', transaction_date) AS activity_month
  FROM fact_transactions
)
SELECT 
  cohort.cohort_month,
  activity.activity_month,
  COUNT(DISTINCT activity.customer_id) AS active_users
FROM cohort
JOIN activity USING (customer_id)
GROUP BY 1, 2
ORDER BY 1, 2;

-- 07. RFM Segmentation
WITH rfm AS (
  SELECT
    customer_id,
    MAX(transaction_date) AS last_purchase_date,
    COUNT(*) AS frequency,
    SUM(total_amount) AS monetary
  FROM fact_transactions
  GROUP BY customer_id
)
SELECT *,
  CURRENT_DATE - last_purchase_date AS recency_days
FROM rfm
ORDER BY monetary DESC;
