-- Write your PostgreSQL query statement below
SELECT E.name
FROM (
    SELECT managerId, COUNT(id) AS no_of_employees
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
) AS SUB, Employee E
WHERE E.id = SUB.managerId AND SUB.no_of_employees >= 5;