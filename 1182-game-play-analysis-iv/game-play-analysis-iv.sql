-- # Write your MySQL query statement below





SELECT ROUND(consecutive.consecutive_players_sum / total.total_players ,2) AS fraction
FROM (
    SELECT COUNT(DISTINCT player_id) AS total_players
    FROM Activity
) total, (
    SELECT COUNT(A1.player_id) AS consecutive_players_sum
    FROM Activity A1
    JOIN Activity A2
    ON A1.player_id = A2.player_id AND DATEDIFF(A1.event_date, A2.event_date) = 1
    JOIN (
        SELECT player_id, MIN(event_date) AS first_login
        FROM Activity
        GROUP BY player_id
    ) start
    ON (A1.event_date = start.first_login OR A2.event_date = start.first_login) AND A1.player_id = start.player_id
) consecutive
