-- Write your PostgreSQL query statement below
SELECT SUB.machine_id, ROUND(AVG(SUB.processing_time)::numeric, 3) AS processing_time
FROM (
    SELECT machine_id, process_id, 
            (MAX(Activity.timestamp) - MIN(Activity.timestamp))  as processing_time
    FROM Activity
    GROUP BY machine_id, process_id
) SUB
GROUP BY SUB.machine_id;
