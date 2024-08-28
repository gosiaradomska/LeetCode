SELECT DISTINCT p.product_id, product_name
FROM Product p
WHERE p.product_id NOT IN (
    SELECT p.product_id
    FROM Product p
    LEFT JOIN Sales s
    ON p.product_id = s.product_id
    WHERE (sale_date < '2019-01-01' OR sale_date > '2019-03-31')
    OR sale_date IS NULL);

