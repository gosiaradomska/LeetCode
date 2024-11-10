SELECT Department, Employee, Salary
FROM (
    SELECT 
        d.name AS Department, 
        e.name AS Employee, 
        e.salary AS Salary, 
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS sal_rank
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
    ) sub
WHERE sal_rank <= 3;