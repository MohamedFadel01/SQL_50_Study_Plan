# Write your MySQL query statement below
SELECT P.product_id, 
    IF((ROUND(SUM(P.price * U.units) / SUM(U.units), 2) IS NULL), 
        0, ROUND(SUM(P.price * U.units) / SUM(U.units), 2)) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U
ON (U.purchase_date BETWEEN P.start_date AND P.end_date) AND P.product_id = U.product_id
GROUP BY P.product_id
ORDER BY P.product_id