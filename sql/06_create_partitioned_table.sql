-- Create a table partitioned by order date.
-- Partitioning limits the amount of data scanned for date-filtered queries.

CREATE OR REPLACE TABLE cleaned.orders_partitioned
PARTITION BY order_date AS

SELECT *
FROM cleaned.orders_clean;
