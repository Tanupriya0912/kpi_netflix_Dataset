CREATE DATABASE netflix_data;
USE DATABASE netflix_data;
CREATE SCHEMA ott_revenue;
USE SCHEMA ott_revenue;

CREATE TABLE netflix_revenue (
    date DATE,
    global_revenue FLOAT,
    ucan_streaming_revenue FLOAT,
    emea_streaming_revenue FLOAT,
    latm_streaming_revenue FLOAT,
    apac_streaming_revenue FLOAT,
    ucan_members INT,
    emea_members INT,
    latm_members INT,
    apac_members INT,
    ucan_arpu FLOAT,
    emea_arpu FLOAT,
    latm_arpu FLOAT,
    apac_arpu FLOAT,
    netflix_streaming_memberships INT
);
COPY INTO netflix_revenue
FROM @netflix_stage/netflix_revenue_updated.csv
FILE_FORMAT = (
    TYPE = 'CSV' 
    SKIP_HEADER = 1 
    DATE_FORMAT = 'DD-MM-YYYY'
);
select * from netflix_revenue;
ALTER TABLE netflix_revenue
DROP COLUMN Region;
