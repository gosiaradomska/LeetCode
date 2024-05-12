SELECT TO_CHAR(activity_date, 'YYYY-MM-DD') AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN ADD_MONTHS('2019-07-28', -1) AND '2019-07-27'
GROUP BY activity_date
ORDER BY day;