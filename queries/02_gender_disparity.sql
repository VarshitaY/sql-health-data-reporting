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
