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
