-- Q8: Trend of gross revenue and order count by quarter
SELECT
    quarter_number,
    SUM(vehicle_price * quantity) AS gross_revenue,
    COUNT(order_id) AS num_of_orders
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    gross_revenue DESC;

-- Result: Q1: $39.64M / 310 orders | Q2: $32.91M / 262 orders
--         Q3: $29.44M / 229 orders | Q4: $23.50M / 199 orders
-- Insight: Both gross revenue and order count are falling in lockstep every quarter -- the company is losing business.
