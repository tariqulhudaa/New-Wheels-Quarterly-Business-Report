-- Q3: Most preferred vehicle maker in each state
SELECT * FROM
    ( SELECT
        p.vehicle_maker,
        c.state,
        COUNT(c.customer_id) AS customer_count,
        RANK() OVER (PARTITION BY c.state ORDER BY COUNT(p.vehicle_maker) DESC) AS rnk
    FROM
        customer_t c
        JOIN order_t o USING(customer_id)
        JOIN product_t p USING(product_id)
    GROUP BY
        p.vehicle_maker, c.state
    ORDER BY
        customer_count DESC
    ) x
WHERE rnk = 1
LIMIT 5;

-- Result: Chevrolet leads in Texas (9 customers); Toyota leads in Florida (7 customers);
-- Audi, Chevrolet, and Dodge are tied as the top maker in California (6 customers each).
