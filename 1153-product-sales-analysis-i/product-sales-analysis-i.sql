-- Write your PostgreSQL query statement below
SELECT P.product_name, S.year, S.price
FROM Product P
INNER JOIN Sales S
ON P.product_id = s.product_id