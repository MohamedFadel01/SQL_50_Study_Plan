# Write your MySQL query statement below
SELECT contest_id, ROUND(((COUNT(user_id) / SUB.total) * 100), 2) AS percentage
FROM (SELECT COUNT(user_id) AS total FROM Users) SUB, Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC