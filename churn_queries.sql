use customerchurn;

SELECT * FROM customer_churn;

SELECT COUNT(*) AS total_rows FROM customer_churn;

/* Overall Churn Rate */
SELECT COUNT(*) AS Total_customers,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn;

/* Churn by Gender */
SELECT Gender,
	COUNT(Gender) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Gender;

/* Churn by Senior Citizens */
SELECT IF(Senior_Citizen = 1, "Senior Citizen", "Not a Senior Citizen") Senior_Citizen,
	COUNT(*) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Senior_Citizen;

SELECT * FROM customer_churn;

/* Churn by Tenure */
SELECT 
	CASE 
    WHEN Tenure_in_Months BETWEEN 0 AND 12 THEN '0-1 year'
    WHEN Tenure_in_Months BETWEEN 13 AND 24 THEN '1-2 years'
    WHEN Tenure_in_Months BETWEEN 25 AND 48 THEN '2-4 years'
    ELSE '4+ years'
    END AS Tenure_Group,
	COUNT(*) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Tenure_Group;

SELECT * FROM customer_churn;

/* Churn by Contract Type */
SELECT Contract AS Contract_Type,
	COUNT(*) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Contract_Type;

/* Churn by Internet Service Type */
SELECT Internet_Type,
	COUNT(*) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Internet_Type;

SELECT * FROM customer_churn;

/* Monthly charges vs. Churn  */
SELECT Churn, ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge
FROM customer_churn
GROUP BY Churn;

/* Churn by Payment Method */
SELECT Payment_Method,
	COUNT(*) AS Total_Customer,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_customer,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS Churn_Rate
FROM customer_churn
GROUP BY Payment_Method;

/* Churned customer with highly monthly charges */
SELECT COUNT(*) AS High_Charge_Churn_Customers
FROM customer_churn
WHERE Churn = 'Yes' AND Monthly_Charge > 80;

SELECT * FROM customer_churn;

/* Total charges summary */ 
SELECT Churn,
    ROUND(AVG(Total_Charges), 2) AS Avg_Total_Charges,
    ROUND(MIN(Total_Charges), 2) AS Min_Total_Charges,
    ROUND(MAX(Total_Charges), 2) AS Max_Total_Charges
FROM customer_churn
GROUP BY Churn;