-- Write your PostgreSQL query statement below

(
    SELECT E.employee_id, E.department_id
    FROM Employee E
    JOIN (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(department_id) = 1
    ) Sub
    ON E.employee_id = Sub.employee_id
)

UNION

(
    SELECT employee_id, department_id
    FROM Employee
    WHERE primary_flag = 'Y'
)