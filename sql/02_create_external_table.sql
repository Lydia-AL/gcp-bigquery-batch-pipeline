-- Create an external BigQuery table from a CSV file stored in GCS.
-- Replace the URI with your own bucket path when reproducing the project.

CREATE OR REPLACE EXTERNAL TABLE raw.orders_ext
OPTIONS (
  format = 'CSV',
  field_delimiter = ',',
  skip_leading_rows = 1,
  uris = ['gs://YOUR_BUCKET_NAME/orders_1m_dirty_simple.csv']
);
