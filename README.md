# End-to-End Bank Customer Churn Prediction & Analytics

An end-to-end data analytics and machine learning solution designed to identify customer attrition risks, analyze churn drivers across key demographic and behavioral segments, and present actionable insights via interactive dashboards and production SQL queries.

---

##  Summary

Customer churn is one of the most critical challenges in retail banking, as acquiring new customers is significantly more expensive than retaining existing ones. 

| Analytical Pillar | Technology Stack | Key Focus & Deliverables |
| :--- | :--- | :--- |
| **1. Machine Learning Pipeline** | **Python** *(Pandas, Scikit-Learn)* | Predicts individual customer churn probabilities and audits model performance using classification metrics. |
| **2. Operational Dashboard** | **Microsoft Excel** *(Pivots, Slicers)* | Interactive executive reporting featuring KPI cards, slicers, and risk heatmaps. |
| **3. Relational Database Analytics** | **MySQL** *(Workbench, Production SQL)* | Production queries engineered to audit predictions, calculate confusion matrices, and segment high-value/high-risk cohorts. |

---

## Repository Structure

```text
Bank-Customer-Churn-Prediction/
│
├── Excel/
│   ├── Dashboard.xlsx                 # Interactive dashboard with slicers & KPIs
│   └── Output_Analysis.xlsx           # Model output exploratory analysis
├── ML/
│   ├── CustomerChurnProject.ipynb     # Jupyter Notebook with ML model training & evaluation
│   └── churn_predictions_output.csv   # Predicted risk scores exported from ML pipeline
├── MySQL/
│   ├── schema.sql                     # Database schema definition
│   ├── churn_queries.sql              # Production SQL analytical queries
│   ├── query1_high_risk_customers.csv # Query outputs & exported result sets
│   ├── query2_ChurnRate_&_AverageRiskScore.csv
│   ├── query3_active_vs_inactive_risk.csv
│   ├── query4_confusion_matrix.csv
│   └── query5_AgeGroup_Risk.csv
├── .gitignore                         # Excludes cache and temporary files
├── Bank Customer Churn Prediction.csv # Raw source dataset
└── README.md                          # Project documentation

## Tech Stack & Tools

| Domain | Tools & Technologies |
| :--- | :--- |
| **Programming & ML** | Python 3.x, Pandas, NumPy, Scikit-Learn, Jupyter Notebook |
| **Database & SQL** | MySQL Server 8.0, MySQL Workbench |
| **BI & Reporting** | Microsoft Excel *(Pivot Tables, Calculated Fields, Slicers, Conditional Formatting)* |
| **Version Control** | Git, GitHub |
```
---

## Key Insights

* **Product Holding Friction:** Customers holding **3 or 4 bank products** exhibit significantly higher churn rates compared to those holding 1 or 2 products, indicating potential feature fatigue or misaligned cross-selling strategies.
* **Engagement Vulnerability:** Inactive members have an average predicted churn risk score **over 1.5x higher** than active members, emphasizing the need for targeted re-engagement campaigns.
* **High-Value Account Exposure:** High-balance accounts (> $100,000) flagged with a predicted risk score above $70\%$ represent the highest potential revenue loss, prioritizing them for VIP retention outreach.

---

## **Key Learnings & Skill Takeaways** :

| Analytical Component | Key Learning & Insights Gained |
| :--- | :--- |
| **1 Machine Learning (Python)** | Learned how feature selection—specifically removing demographic variables like `Gender` and `Country`—improved the model's ROC-AUC score while simultaneously eliminating algorithmic bias and ensuring fairness in churn predictions. |
| **2 Database Analytics (SQL)** | Constructed a production SQL confusion matrix query to audit ML model classifications directly inside MySQL, reinforcing machine learning evaluation concepts in a relational database setting. |
| **3 Business Intelligence (Excel)** | Learned to build dynamic, interactive dashboards using Slicers for user filtering, alongside Conditional Formatting heatmaps to instantly highlight high-risk cohorts and key KPIs at a glance. |
