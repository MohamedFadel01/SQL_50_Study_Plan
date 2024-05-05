# Write your MySQL query statement below

SELECT 
    ROUND(
        (SUM(CASE WHEN first_order = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*) * 100)
        ,2) AS immediate_percentage
FROM (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order,
        MIN(customer_pref_delivery_date) AS customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
) AS first_orders;
