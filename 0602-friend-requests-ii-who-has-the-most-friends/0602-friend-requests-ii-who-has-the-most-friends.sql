SELECT id, num
FROM (
    SELECT id, COUNT(*) AS num, RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM (
        SELECT requester_id AS id
        FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id
        FROM RequestAccepted
        ) sub1
    GROUP BY id
    ) sub2
WHERE rnk = 1;
