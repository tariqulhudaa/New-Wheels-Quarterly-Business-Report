-- Q1: Total number of customers who have placed orders, and their distribution across states
SELECT
    (SELECT COUNT(DISTINCT customer_id) FROM order_t) AS total_customer_placed_order,
    state,
    COUNT(DISTINCT customer_id) AS customer_distribution
FROM
    customer_t
GROUP BY
    state
ORDER BY
    customer_distribution DESC
LIMIT 5;

-- Result (top 5 of 994 total customers who placed orders):
-- Texas: 97 | California: 97 | Florida: 86 | New York: 69 | District of Columbia: 35
-- Insight: Texas and California lead customer distribution (high population density states);
-- Maine, Vermont, and Wyoming have the lowest distribution.
