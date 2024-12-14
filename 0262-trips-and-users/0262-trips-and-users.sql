WITH NotBanned AS (
    SELECT t.id, t.client_id, t.driver_id, t.status, t.request_at
    FROM Trips t
    LEFT JOIN Users u1
    ON t.client_id = u1.users_id
    LEFT JOIN Users u2
    ON t.driver_id = u2.users_id
    WHERE u1.banned = 'No' AND u2.banned = 'No' AND request_at BETWEEN "2013-10-01" AND "2013-10-03"
    )

SELECT 
    request_at AS Day, 
    ROUND(SUM(CASE WHEN status = 'completed' THEN 0 ELSE 1 END)/COUNT(*), 2) AS "Cancellation Rate"
FROM NotBanned
GROUP BY request_at
;