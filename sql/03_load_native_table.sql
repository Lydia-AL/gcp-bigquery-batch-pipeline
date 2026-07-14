-- Load the CSV file stored in GCS into a native BigQuery table.

LOAD DATA OVERWRITE raw.orders_raw
(
  order_id STRING,
  order_date STRING,
  customer_id STRING,
  product_id STRING,
  category STRING,
  amount STRING,
  status STRING
)
FROM FILES (
  format = 'CSV',
  uris = ['gs://YOUR_BUCKET_NAME/orders_1m_dirty_simple.csv'],
  skip_leading_rows = 1
);
