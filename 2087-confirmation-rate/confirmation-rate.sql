# Write your MySQL query statement below
SELECT 
    total.id AS user_id, 
    IF(
        ISNULL(ROUND(sub.count_of_confirmations / total.count_of_actions, 2)), 
        0, 
        ROUND(sub.count_of_confirmations / total.count_of_actions, 2)
    ) AS confirmation_rate
FROM (
    SELECT s.user_id AS id, COUNT(c.action) AS count_of_actions
    FROM Signups s
    LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
    GROUP BY s.user_id
) total
LEFT JOIN (
    SELECT s.user_id AS id, COUNT(c.action) AS count_of_confirmations
    FROM Signups s
    LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
    WHERE c.action = 'confirmed'
    GROUP BY s.user_id
) sub
ON total.id = sub.id
ORDER BY confirmation_rate



