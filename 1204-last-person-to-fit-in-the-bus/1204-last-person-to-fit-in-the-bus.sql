SELECT person_name
FROM (
    SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS total_weight
    FROM Queue
    ) sub1
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;