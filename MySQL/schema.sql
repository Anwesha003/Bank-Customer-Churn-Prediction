CREATE DATABASE IF NOT EXISTS bank_churn_db;
USE bank_churn_db;

DROP TABLE IF EXISTS churn_predictions;

CREATE TABLE churn_predictions (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    credit_score INT NOT NULL,
    country INT NOT NULL,               
    gender INT NOT NULL,                
    age INT NOT NULL,
    tenure INT NOT NULL,
    balance DECIMAL(12, 2) NOT NULL,
    products_number INT NOT NULL,
    credit_card TINYINT(1) NOT NULL,    
    active_member TINYINT(1) NOT NULL,  
    estimated_salary DECIMAL(12, 2) NOT NULL,
    actual_churn TINYINT(1) NOT NULL,   
    predicted_risk_score DECIMAL(5, 2) NOT NULL
);

SELECT * FROM bank_churn_db.churn_predictions;