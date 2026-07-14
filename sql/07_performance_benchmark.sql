-- Benchmark query on the non-partitioned table.

SELECT
  category,
  SUM(amount) AS total_sales
FROM cleaned.orders_clean
WHERE order_date BETWEEN DATE '2024-07-01' AND DATE '2024-07-15'
GROUP BY category
ORDER BY total_sales DESC;


-- Run the same query on the partitioned table and compare
-- the amount of data processed in the BigQuery execution details.

SELECT
  category,
  SUM(amount) AS total_sales
FROM cleaned.orders_partitioned
WHERE order_date BETWEEN DATE '2024-07-01' AND DATE '2024-07-15'
GROUP BY category
ORDER BY total_sales DESC;
