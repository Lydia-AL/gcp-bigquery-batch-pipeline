-- Create the datasets used by the pipeline.
-- The raw dataset contains ingested and intermediate data.
-- The cleaned dataset contains transformed and optimized data.

CREATE SCHEMA IF NOT EXISTS raw
OPTIONS (
  location = 'europe-west9'
);

CREATE SCHEMA IF NOT EXISTS cleaned
OPTIONS (
  location = 'europe-west9'
);
