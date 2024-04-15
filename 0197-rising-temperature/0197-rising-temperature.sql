# Write your MySQL query statement below
SELECT distinct w2.id
FROM weather as w1, weather as w2
WHERE w1.temperature < w2.temperature AND w2.recorddate = DATE_ADD(w1.recorddate, interval 1 day);