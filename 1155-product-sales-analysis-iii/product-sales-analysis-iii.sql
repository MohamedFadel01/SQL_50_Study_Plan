-- Write your PostgreSQL query statement below
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) first_year_sales
ON s.product_id = first_year_sales.product_id And s.year = first_year_sales.first_year