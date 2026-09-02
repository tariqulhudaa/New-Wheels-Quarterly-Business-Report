-- Q4: Overall average customer rating, and average rating per quarter
-- Rating mapping: Very Bad = 1, Bad = 2, Okay = 3, Good = 4, Very Good = 5
SELECT
    quarter_number,
    AVG(rate_value) AS overall_avg_rating,
    AVG(rate_value) AS avg_rating_per_quarter
FROM (
    SELECT
        quarter_number, customer_feedback,
        CASE
            WHEN customer_feedback = 'Very Bad' THEN 1
            WHEN customer_feedback = 'Bad' THEN 2
            WHEN customer_feedback = 'Okay' THEN 3
            WHEN customer_feedback = 'Good' THEN 4
            WHEN customer_feedback = 'Very Good' THEN 5
        END AS rate_value
    FROM
        order_t
) AS x
GROUP BY
    quarter_number
ORDER BY
    quarter_number;

-- Result: Q1: 3.55 | Q2: 3.35 | Q3: 2.96 | Q4: 2.40 (overall average: 3.13)
-- Insight: Average rating fell below 3 ("Okay") starting in Q3 -- a steady quarter-over-quarter decline.
