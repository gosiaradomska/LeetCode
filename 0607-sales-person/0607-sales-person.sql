SELECT name
FROM SalesPerson sp
WHERE name NOT IN(
    SELECT sp.name
    FROM SalesPerson sp
    LEFT JOIN Orders o ON sp.sales_id = o.sales_id
    LEFT JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED');