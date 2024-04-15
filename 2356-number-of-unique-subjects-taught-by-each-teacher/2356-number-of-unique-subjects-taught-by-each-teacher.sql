# Write your MySQL query statement below
SELECT teacher_id, count(distinct subject_id) as cnt
FROM teacher
GROUP BY teacher_id;