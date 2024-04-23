# Write your MySQL query statement below
SELECT students.student_id, students.student_name, subjects.subject_name, count(examinations.subject_name) as attended_exams
FROM students
CROSS JOIN subjects
LEFT OUTER JOIN examinations
ON students.student_id = examinations.student_id AND subjects.subject_name = examinations.subject_name
GROUP BY students.student_id, students.student_name, subjects.subject_name
ORDER BY students.student_id, subjects.subject_name;