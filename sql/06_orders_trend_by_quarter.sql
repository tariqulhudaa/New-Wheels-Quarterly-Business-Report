-- Q6: Trend of the number of orders by quarter
SELECT
    quarter_number,
    COUNT(order_id) AS num_of_orders
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    num_of_orders DESC;

-- Result: Q1: 310 | Q2: 262 | Q3: 229 | Q4: 199
-- Insight: Order volume is decreasing every quarter, with Q1 the highest and Q4 the lowest.
