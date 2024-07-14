SELECT signups.user_id, 
    ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM signups
LEFT JOIN confirmations
ON signups.user_id = confirmations.user_id
GROUP BY signups.user_id;

    