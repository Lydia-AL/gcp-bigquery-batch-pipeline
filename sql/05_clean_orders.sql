-- Clean and standardize the raw orders data.
-- SAFE_CAST returns NULL instead of failing when a value cannot be converted.

CREATE OR REPLACE TABLE cleaned.orders_clean AS

SELECT
  SAFE_CAST(order_id AS INT64) AS order_id,
  SAFE_CAST(order_date AS DATE) AS order_date,
  TRIM(customer_id) AS customer_id,
  TRIM(product_id) AS product_id,
  TRIM(category) AS category,
  SAFE_CAST(amount AS NUMERIC) AS amount,
  UPPER(TRIM(status)) AS status
FROM raw.orders_raw
WHERE SAFE_CAST(order_id AS INT64) IS NOT NULL
  AND SAFE_CAST(order_date AS DATE) IS NOT NULL
  AND SAFE_CAST(amount AS NUMERIC) IS NOT NULL;
