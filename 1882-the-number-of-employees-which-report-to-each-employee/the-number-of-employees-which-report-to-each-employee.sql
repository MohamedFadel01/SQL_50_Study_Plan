-- -- Write your PostgreSQL query statement below
SELECT Sub.employee_id, Employees.name, Sub.reports_count, Sub.average_age
FROM (
    SELECT 
        DISTINCT reports_to AS employee_id, 
        COUNT(name) AS reports_count, 
        ROUND(AVG(age)) AS average_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
)Sub, Employees
WHERE Employees.employee_id = Sub.employee_id
ORDER BY Sub.employee_id