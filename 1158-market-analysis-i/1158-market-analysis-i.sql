WITH OrderCount (buyer_id, orders) AS (
    SELECT buyer_id, COUNT(*) AS orders
    FROM Orders
    WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY buyer_id
    )

SELECT u.user_id AS buyer_id, u.join_date, COALESCE(oc.orders, 0) AS orders_in_2019
FROM Users u
LEFT JOIN OrderCount oc
ON u.user_id = oc.buyer_id;