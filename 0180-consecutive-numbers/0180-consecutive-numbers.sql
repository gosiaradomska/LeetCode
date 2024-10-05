SELECT DISTINCT sub.num AS ConsecutiveNums
FROM (
    SELECT 
        id,
        num,
        LAG(num) OVER(ORDER BY id) AS previous,
        LEAD(num) OVER(ORDER BY id) AS next
    FROM Logs
    ) sub
WHERE sub.num = sub.previous AND sub.num = sub.next;