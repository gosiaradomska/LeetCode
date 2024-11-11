WITH TopSalaries (Department, Employee, Salary, SalaryRank) 
AS (
        SELECT 
            d.name, 
            e.name, 
            e.salary, 
            DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS SalaryRank
        FROM Employee e
        JOIN Department d        
        ON e.departmentId = d.id
    )

SELECT Department, Employee, Salary 
FROM TopSalaries
WHERE SalaryRank = 1;