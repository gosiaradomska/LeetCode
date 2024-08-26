WITH categories AS (
    SELECT 'Low Salary' AS category FROM DUAL
    UNION ALL
    SELECT 'Average Salary' FROM DUAL
    UNION ALL
    SELECT 'High Salary' FROM DUAL
)
SELECT c.category, COUNT(a.account_id) AS accounts_count 
FROM categories c
LEFT JOIN (
    SELECT account_id, 
    CASE 
    WHEN income < 20000 THEN 'Low Salary'
    WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
    ELSE 'High Salary'
    END AS category
    FROM accounts
) a ON c.category = a.category
GROUP BY c.category;

