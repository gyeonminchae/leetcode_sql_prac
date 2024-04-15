# Write your MySQL query statement below
SELECT project_id, round(avg(experience_years), 2) as average_years
FROM project, employee
WHERE project.employee_id = employee.employee_id 
GROUP BY project_id;