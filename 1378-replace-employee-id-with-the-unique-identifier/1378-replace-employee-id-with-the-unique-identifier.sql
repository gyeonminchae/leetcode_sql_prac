# Write your MySQL query statement below
SELECT EmployeeUNI.unique_id, name
FROM employees
LEFT JOIN employeeuni
ON employees.id = EmployeeUNI.id
ORDER BY unique_id;