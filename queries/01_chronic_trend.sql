-- File: queries/01_chronic_trend.sql

SELECT
  YearStart,
  Topic,
  COUNT(*) AS RecordCount
FROM cdc_data
WHERE Topic IN ('Cardiovascular Disease', 'Diabetes')
GROUP BY YearStart, Topic
ORDER BY YearStart, Topic;
