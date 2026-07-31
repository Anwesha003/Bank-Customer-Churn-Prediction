-- =========================================================
-- FILE: churn_queries.sql
-- DESCRIPTION: Analytical Queries for Business & Risk Insights
-- =========================================================

USE bank_churn_db;

-- ---------------------------------------------------------
-- QUERY 1: Top 10 High-Risk & High-Value Customer Prioritization
-- Purpose: Extract top priority accounts for proactive retention outreach.
-- ---------------------------------------------------------
SELECT 
    customer_id,
    age,
    balance,
    products_number,
    active_member,
    predicted_risk_score
FROM churn_predictions
WHERE predicted_risk_score >= 70.0 
  AND balance > 50000
ORDER BY predicted_risk_score DESC, balance DESC
LIMIT 10;


-- ---------------------------------------------------------
-- QUERY 2: Churn Rate & Average Risk Score by Product Density
-- Purpose: Analyze how product usage affects churn likelihood.
-- ---------------------------------------------------------
SELECT 
    products_number,
    COUNT(*) AS total_customers,
    SUM(actual_churn) AS actual_churned_customers,
    ROUND(AVG(actual_churn) * 100, 2) AS actual_churn_rate_pct,
    ROUND(AVG(predicted_risk_score), 2) AS avg_predicted_risk_score
FROM churn_predictions
GROUP BY products_number
ORDER BY products_number ASC;


-- ---------------------------------------------------------
-- QUERY 3: Engagement vs. Financial Exposure Analysis
-- Purpose: Evaluate total bank balance tied up in inactive, high-risk accounts.
-- ---------------------------------------------------------
SELECT 
    CASE 
        WHEN active_member = 1 THEN 'Active Member'
        ELSE 'Inactive Member'
    END AS member_status,
    COUNT(*) AS total_customers,
    ROUND(SUM(balance), 2) AS total_balance_at_risk,
    ROUND(AVG(predicted_risk_score), 2) AS avg_risk_score
FROM churn_predictions
WHERE predicted_risk_score >= 50.0
GROUP BY active_member;


-- ---------------------------------------------------------
-- QUERY 4: Model Accuracy & Confusion Matrix Breakdown
-- Purpose: Audit ML performance directly within SQL using classification logic.
-- ---------------------------------------------------------
SELECT 
    CASE 
        WHEN predicted_risk_score >= 50.0 AND actual_churn = 1 THEN 'True Positive (Correct Churn)'
        WHEN predicted_risk_score < 50.0 AND actual_churn = 0 THEN 'True Negative (Correct Retained)'
        WHEN predicted_risk_score >= 50.0 AND actual_churn = 0 THEN 'False Positive (False Alarm)'
        ELSE 'False Negative (Missed Churn)'
    END AS classification_type,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM churn_predictions), 2) AS percentage_of_total
FROM churn_predictions
GROUP BY classification_type
ORDER BY customer_count DESC;


-- ---------------------------------------------------------
-- QUERY 5: Age Group Risk Segmentation (Window Functions / CTE)
-- Purpose: Rank age brackets by churn risk using Common Table Expressions.
-- ---------------------------------------------------------
WITH AgeGroupAnalysis AS (
    SELECT 
        CASE 
            WHEN age < 30 THEN 'Under 30'
            WHEN age BETWEEN 30 AND 45 THEN '30 - 45'
            WHEN age BETWEEN 46 AND 60 THEN '46 - 60'
            ELSE 'Over 60'
        END AS age_bracket,
        predicted_risk_score,
        actual_churn
    FROM churn_predictions
)
SELECT 
    age_bracket,
    COUNT(*) AS customer_count,
    ROUND(AVG(predicted_risk_score), 2) AS avg_risk_score,
    ROUND(AVG(actual_churn) * 100, 2) AS actual_churn_rate_pct
FROM AgeGroupAnalysis
GROUP BY age_bracket
ORDER BY avg_risk_score DESC;
