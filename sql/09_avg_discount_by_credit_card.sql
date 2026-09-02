-- Q9: Average discount offered by credit card type
SELECT
    c.credit_card_type,
    AVG(o.discount) AS avg_discount
FROM
    customer_t c
JOIN order_t o
    USING (customer_id)
GROUP BY
    c.credit_card_type
ORDER BY
    avg_discount DESC
LIMIT 5;

-- Result: laser (0.644), mastercard (0.629), maestro (0.624), visa-electron (0.623), china-unionpay (0.622)
-- Insight: Laser, Mastercard, and Maestro cardholders receive the highest average discounts;
-- Diners-Club-International has the lowest discount rate.
