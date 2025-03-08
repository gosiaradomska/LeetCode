SELECT sub.customer_number
FROM (
    SELECT customer_number, COUNT(*) AS orders_count
    FROM Orders 
    GROUP BY customer_number
    ORDER BY orders_count DESC) sub
LIMIT 1;