-- Write your PostgreSQL query statement below
SELECT b.customer_id 
FROM (
    SELECT COUNT(product_key) AS total_products FROM Product
) a, (
    SELECT Customer.customer_id, COUNT(Customer.product_key) AS total_purchased
    FROM (
        SELECT DISTINCT * FROM Customer
    ) Customer
    GROUP BY Customer.customer_id
) b
WHERE a.total_products = b.total_purchased