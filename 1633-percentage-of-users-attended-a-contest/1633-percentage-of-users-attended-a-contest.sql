# Write your MySQL query statement below
SELECT Register.contest_id, 
    CASE 
         WHEN total_users > 0 THEN ROUND(COUNT(DISTINCT Register.user_id) / total_users * 100, 2)
         ELSE 0
    END AS percentage
FROM Users
INNER JOIN Register
ON Users.user_id = Register.user_id
CROSS JOIN (SELECT COUNT(*) AS total_users FROM Users) AS total
GROUP BY Register.contest_id
ORDER BY percentage DESC, contest_id ASC;
