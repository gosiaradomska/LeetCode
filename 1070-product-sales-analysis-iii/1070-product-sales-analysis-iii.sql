SELECT a.product_id, year AS first_year, quantity, price
FROM Sales a
INNER JOIN (
    SELECT product_id, MIN(year) AS min_year
    FROM Sales 
    GROUP BY product_id 
    ) b
ON a.product_id = b.product_id AND a.year = min_year;