SELECT B.employee_id, B.name, COUNT(A.employee_id) AS reports_count, ROUND(AVG(A.age)) AS average_age
FROM employees B
INNER JOIN employees A ON B.employee_id = A.reports_to
GROUP BY B.employee_id, B.name
ORDER BY B.employee_id;