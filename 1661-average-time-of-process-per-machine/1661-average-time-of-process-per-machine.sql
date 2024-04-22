# Write your MySQL query statement below
SELECT act2.machine_id, round(avg(act2.timestamp - act1.timestamp),3) as processing_time
FROM activity act1
JOIN activity act2
ON (act1.machine_id = act2.machine_id) AND (act1.process_id = act2.process_id)
WHERE act1.activity_type = 'start' AND act2.activity_type = 'end'
GROUP BY machine_id;

## ROUND, AVG, MINUS, ONE - TWO table 이용 => JOIN, WHERE, GROUP BY
