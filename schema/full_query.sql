CREATE DATABASE IF NOT EXISTS sql_health;
USE sql_health;

CREATE TABLE IF NOT EXISTS cdc_data (
  YearStart VARCHAR(100),
  YearEnd VARCHAR(100),
  LocationAbbr VARCHAR(10),
  LocationDesc VARCHAR(100),
  DataSource VARCHAR(100),
  Topic VARCHAR(255),
  Question TEXT,
  Response TEXT,
  DataValueUnit VARCHAR(50),
  DataValueType VARCHAR(50),
  DataValue VARCHAR(100),
  DataValueAlt VARCHAR(100),
  DataValueFootnoteSymbol VARCHAR(10),
  DataValueFootnote TEXT,
  LowConfidenceLimit VARCHAR(100),
  HighConfidenceLimit VARCHAR(100),
  StratificationCategory1 VARCHAR(100),
  Stratification1 VARCHAR(100),
  StratificationCategory2 VARCHAR(100),
  Stratification2 VARCHAR(100),
  StratificationCategory3 VARCHAR(100),
  Stratification3 VARCHAR(100),
  Geolocation VARCHAR(100),
  LocationID VARCHAR(100),
  TopicID VARCHAR(20),
  QuestionID VARCHAR(20),
  ResponseID VARCHAR(20),
  DataValueTypeID VARCHAR(20),
  StratificationCategoryID1 VARCHAR(20),
  StratificationID1 VARCHAR(20),
  StratificationCategoryID2 VARCHAR(20),
  StratificationID2 VARCHAR(20),
  StratificationCategoryID3 VARCHAR(20),
  StratificationID3 VARCHAR(20)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cdc_data.csv'
INTO TABLE cdc_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM cdc_data;

SELECT * FROM cdc_data
LIMIT 10;

SELECT COUNT(*) AS Missing_Questions
FROM cdc_data
WHERE Question IS NULL OR TRIM(Question) = '';

SELECT DISTINCT DataSource FROM cdc_data LIMIT 10;

-- Exploratory SQL Queries (EDA)
-- How many records per year
SELECT YearStart, COUNT(*) AS record_count
FROM cdc_data
GROUP BY YearStart
ORDER BY YearStart;

-- Top 10 most frequent Topics
SELECT Topic, COUNT(*) AS freq
FROM cdc_data
GROUP BY Topic
ORDER BY freq DESC
LIMIT 10;

-- Distinct Stratification Categories
SELECT DISTINCT StratificationCategory1, Stratification1
FROM cdc_data
WHERE StratificationCategory1 IS NOT NULL
LIMIT 20;

-- Sample location distribution
SELECT LocationAbbr, COUNT(*) AS entries
FROM cdc_data
GROUP BY LocationAbbr
ORDER BY entries DESC
LIMIT 10;

-- File: queries/01_chronic_trend.sql
SELECT
  YearStart,
  Topic,
  COUNT(*) AS RecordCount
FROM cdc_data
WHERE Topic IN ('Cardiovascular Disease', 'Diabetes')
GROUP BY YearStart, Topic
ORDER BY YearStart, Topic;


-- File: queries/02_gender_disparity.sql
SELECT
  Stratification1 AS Gender,
  Topic,
  COUNT(*) AS RecordCount
FROM cdc_data
WHERE StratificationCategory1 = 'Sex'
  AND Stratification1 IN ('Male', 'Female')
GROUP BY Gender, Topic
ORDER BY Topic, Gender;


-- File: queries/03_state_top_topics.sql

WITH StateTopicCounts AS (
  SELECT
    LocationAbbr,
    Topic,
    COUNT(*) AS RecordCount,
    RANK() OVER (PARTITION BY LocationAbbr ORDER BY COUNT(*) DESC) AS topic_rank
  FROM cdc_data
  WHERE LocationAbbr != 'US'
  GROUP BY LocationAbbr, Topic
)
SELECT *
FROM StateTopicCounts
WHERE topic_rank <= 3
ORDER BY LocationAbbr, topic_rank;




