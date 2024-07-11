SELECT product_name, SUM(unit) AS unit FROM Products
INNER JOIN Orders
ON Products.product_id = Orders.product_id
WHERE  EXTRACT(month FROM order_date) = 2 AND  EXTRACT(year FROM order_date) = 2020
GROUP BY product_name, EXTRACT(month FROM order_date)
HAVING SUM(unit) >= 100;

