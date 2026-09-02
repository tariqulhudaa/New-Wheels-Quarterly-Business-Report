-- Q10: Average time taken to ship placed orders, by quarter
SELECT
    quarter_number,
    AVG(JULIANDAY(ship_date) - JULIANDAY(order_date)) AS avg_days_to_ship
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    avg_days_to_ship;

-- Result: Q1: 57.2 days | Q2: 71.1 days | Q3: 117.8 days | Q4: 174.1 days
-- Insight: Average shipping time more than tripled from Q1 to Q4 -- a likely driver of falling satisfaction.
