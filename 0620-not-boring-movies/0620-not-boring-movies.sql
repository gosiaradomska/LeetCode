# Write your MySQL query statement below
SELECT * FROM Cinema
WHERE NOT Cinema.description = 'boring' AND Cinema.id % 2 = 1
ORDER BY rating DESC;