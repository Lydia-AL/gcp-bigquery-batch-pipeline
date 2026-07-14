-- Count the rows ingested into the raw table.

SELECT COUNT(*) AS total_rows
FROM raw.orders_raw;


-- Check the number of missing values in important columns.

SELECT
  COUNTIF(order_id IS NULL OR TRIM(order_id) = '') AS missing_order_ids,
  COUNTIF(order_date IS NULL OR TRIM(order_date) = '') AS missing_order_dates,
  COUNTIF(amount IS NULL OR TRIM(amount) = '') AS missing_amounts
FROM raw.orders_raw;


-- Identify duplicated order identifiers.

SELECT
  order_id,
  COUNT(*) AS occurrences
FROM raw.orders_raw
WHERE order_id IS NOT NULL
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;


-- Inspect and standardize the different status values.

SELECT
  UPPER(TRIM(status)) AS standardized_status,
  COUNT(*) AS occurrences
FROM raw.orders_raw
GROUP BY standardized_status
ORDER BY occurrences DESC;
