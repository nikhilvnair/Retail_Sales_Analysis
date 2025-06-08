
-- TOTAL KPIs
SELECT 
  ROUND(SUM(sales), 2) AS total_sales,
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(DISTINCT customer_id) AS total_customers,
  COUNT(DISTINCT product_id) AS total_products
FROM superstore;

-- SALES & PROFIT BY SHIP MODE
SELECT 
  ship_mode,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- SALES & PROFIT BY SEGMENT
SELECT 
  segment,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment;

-- SALES BY REGION WITH PERCENTAGE
SELECT 
  region,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(100.0 * SUM(sales) / (SELECT SUM(sales) FROM superstore), 2) AS percentage_of_total
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- SALES & PROFIT BY CATEGORY
SELECT 
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category;

-- SALES BY STATE
SELECT 
  state,
  ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;

-- SALES BY SUB-CATEGORY
SELECT 
  sub_category,
  ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC;
