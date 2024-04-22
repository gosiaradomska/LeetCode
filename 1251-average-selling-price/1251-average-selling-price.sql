SELECT Prices.product_id, 
       COALESCE(CAST(SUM(Prices.price * COALESCE(UnitsSold.units, 0)) / NULLIF(SUM(COALESCE(UnitsSold.units, 0)), 0) AS              DECIMAL(10, 2)), 0.00) AS average_price
FROM Prices
LEFT JOIN UnitsSold 
ON Prices.product_id = UnitsSold.product_id
AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;
