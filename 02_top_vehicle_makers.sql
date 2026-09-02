-- Q2: Top 5 vehicle makers preferred by customers
SELECT
    p.vehicle_maker,
    COUNT(DISTINCT customer_id) AS num_of_customers
FROM
    product_t p
JOIN order_t o
    USING(product_id)
JOIN customer_t c
    USING(customer_id)
GROUP BY
    p.vehicle_maker
ORDER BY
    num_of_customers DESC
LIMIT 5;

-- Result: Chevrolet (83), Ford (63), Toyota (52), Pontiac (50), Dodge (50)
-- Insight: Chevrolet, Ford, Toyota, Pontiac, and Dodge are the top 5 preferred makers;
-- Austin, Citroen, Daewoo, MG, and Ram are among the least preferred.
