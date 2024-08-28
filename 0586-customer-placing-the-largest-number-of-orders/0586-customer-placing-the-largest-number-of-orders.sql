SELECT customer_number 
FROM (
    SELECT customer_number, COUNT(order_number) AS order_count
    FROM Orders
    GROUP BY customer_number
    ORDER BY order_count DESC)
WHERE ROWNUM = 1;