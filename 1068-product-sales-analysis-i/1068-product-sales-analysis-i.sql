SELECT product_name, year, price 
FROM Sales
INNER JOIN Product
ON Product.product_id = Sales.product_id;