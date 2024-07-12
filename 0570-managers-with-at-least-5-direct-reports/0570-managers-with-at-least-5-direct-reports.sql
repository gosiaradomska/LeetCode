SELECT name
FROM (
    SELECT DISTINCT m.id, m.name AS name
    FROM Employee e
    LEFT OUTER JOIN Employee m
    ON e.managerId = m.id
    WHERE m.id IN (
        SELECT managerId
        FROM Employee
        GROUP BY managerId
        HAVING COUNT(*) >= 5)
    );