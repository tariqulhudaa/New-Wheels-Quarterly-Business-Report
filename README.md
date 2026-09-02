# New-Wheels Quarterly Business Report | SQL Analytics

A SQL analytics case study built on a vehicle resale company's sales database — diagnosing a steady quarter-over-quarter decline in orders and customer satisfaction, then translating the findings into a CEO-ready quarterly business report with actionable recommendations.

## Background

New-Wheels is a used-vehicle resale platform that handles the full customer journey, from vehicle listing to shipping to post-sale feedback. Over the course of a year, both new orders and customer satisfaction ratings had been steadily falling quarter over quarter, and leadership needed a data-driven quarterly report to understand what was happening and why.

Working from the company's customer, order, and product tables, I wrote a series of SQL queries — using subqueries, joins, CTEs, and window functions (`RANK()`, `LAG()`) — to answer 10 leadership-level business questions and surface the root causes behind the decline.

## Tools Used

SQL (window functions, CTEs, subqueries, joins, aggregation) — queries written and tested against the `customer_t`, `order_t`, and `product_t` tables.

## Business Questions & Key Findings

| # | Question | Key Finding |
|---|----------|-------------|
| 1 | Customer count & distribution by state | 994 total customers; Texas and California lead with 97 each |
| 2 | Top 5 preferred vehicle makers | Chevrolet, Ford, Toyota, Pontiac, Dodge |
| 3 | Most preferred maker by state | Chevrolet leads in Texas, Toyota in Florida |
| 4 | Average rating overall & by quarter | Fell from 3.55 (Q1) to 2.40 (Q4) |
| 5 | Feedback distribution by quarter | Good/Very Good feedback fell from 58.7% (Q1) to 20.1% (Q4) |
| 6 | Order volume trend by quarter | Orders fell from 310 (Q1) to 199 (Q4) |
| 7 | Net revenue & QoQ % change | Revenue fell from $18.03M to $8.57M; sharpest drop was -32.3% in Q3 |
| 8 | Gross revenue & order trend by quarter | Gross revenue fell from $39.6M (Q1) to $23.5M (Q4), tracking order volume |
| 9 | Average discount by credit card type | Laser, Mastercard, and Maestro cardholders get the highest discounts |
| 10 | Average shipping time by quarter | Shipping time more than tripled, from 57.2 days (Q1) to 174.1 days (Q4) |

Full queries, results, and per-question insights are in [`/sql`](./sql).

## Business Metrics Overview

| Metric | Value |
|---|---|
| Total Revenue | $125,482,804.36 |
| Total Orders | 1,000 |
| Total Customers | 994 |
| Average Rating | 3.13 / 5 |
| Q4 Revenue | $23,496,008.21 |
| Q4 Orders | 199 |
| Average Days to Ship | 97.96 |
| % Good/Very Good Feedback | 21.5% |

## The Story the Data Tells

Revenue and order volume declined in tandem every single quarter, and the timing lines up closely with a parallel collapse in customer satisfaction — positive feedback (Good + Very Good) dropped from 58.7% in Q1 to just 20.1% by Q4. The clearest operational red flag is shipping performance: average delivery time more than tripled over the year, from 57 days in Q1 to 174 days in Q4, closely tracking the drop in satisfaction and, in turn, repeat orders.

## Recommendations

- **Fix fulfillment first.** Shipping delays are the single most dramatic metric in the dataset (a 3x increase) and the most plausible driver of the satisfaction collapse — this should be the top operational priority.
- **Investigate the Q3 revenue cliff.** The -32.3% QoQ revenue drop in Q3 is sharper than the surrounding quarters and worth a focused root-cause review (inventory, pricing, or a specific regional/maker issue).
- **Double down on what's working regionally.** Texas and California drive the largest share of customers — regional inventory and marketing decisions should weight toward the maker preferences seen in each state (e.g., Chevrolet in Texas, Toyota in Florida).
- **Monitor the leading indicator, not just the lagging one.** Since satisfaction decline (Q1→Q3) preceded the steepest revenue decline, quarterly reporting should treat customer feedback trend as an early-warning signal for the following quarter's revenue.

## Repo Structure

```
New-Wheels-Quarterly-Business-Report/
├── README.md
└── sql/
    ├── 01_customer_distribution_by_state.sql
    ├── 02_top_vehicle_makers.sql
    ├── 03_top_vehicle_maker_by_state.sql
    ├── 04_avg_rating_per_quarter.sql
    ├── 05_feedback_distribution_per_quarter.sql
    ├── 06_orders_trend_by_quarter.sql
    ├── 07_net_revenue_qoq_change.sql
    ├── 08_net_revenue_and_orders_trend.sql
    ├── 09_avg_discount_by_credit_card.sql
    └── 10_avg_shipping_time_by_quarter.sql
```

## About Me

Hi, I'm Tariqul Huda. This project is part of a broader data analytics portfolio built while pursuing Data Analyst I/II roles, alongside Power BI dashboards, a Python EDA project, and a SQL Server data warehouse built with a medallion architecture.

**Certifications:** Microsoft Certified: Power BI Data Analyst Associate (PL-300) · Google Data Analytics Professional Certificate · Microsoft Certified: Azure Data Fundamentals · Data Analytics Essentials (UT Austin McCombs) · AWS Cloud Practitioner Essentials

## License

This project (queries, analysis, and write-up) is shared under the MIT License. The underlying business scenario is a case-study dataset used for skills practice.
