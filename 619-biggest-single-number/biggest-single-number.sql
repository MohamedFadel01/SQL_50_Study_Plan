-- Write your PostgreSQL query statement below
SELECT 
    MAX(single_nums.num) AS num
FROM (
    SELECT num, COUNT(num)
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) single_nums