-- Q5: Percentage distribution of feedback per quarter -- are customers getting more dissatisfied over time?
SELECT
    quarter_number,
    COUNT(customer_feedback) AS customer_feedback_count,
    (SUM(CASE WHEN customer_feedback = 'Very Bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS very_bad_percentage,
    (SUM(CASE WHEN customer_feedback = 'Bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS bad_percentage,
    (SUM(CASE WHEN customer_feedback = 'Okay' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS okay_percentage,
    (SUM(CASE WHEN customer_feedback = 'Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS good_percentage,
    (SUM(CASE WHEN customer_feedback = 'Very Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS very_good_percentage
FROM
    order_t
GROUP BY
    quarter_number
ORDER BY
    quarter_number;

-- Result (Good + Very Good combined):
-- Q1: 58.7% positive | Q2: 50.8% positive | Q3: 37.6% positive | Q4: 20.1% positive
-- Insight: Q1 has the best satisfaction, Q4 the lowest -- customers are getting more dissatisfied over time.
