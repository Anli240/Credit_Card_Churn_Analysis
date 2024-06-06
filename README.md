# Credit_Card_Churn_Analysis
Here is my sql project on credit card churn analysis


Analysing bank credit card data and predict which group of customers are more likely to get churned so that we can target them to provide better services and turn customers' decisions in the opposite direction using MySQL and Tableau

Credit cards play an essential role in the banking world. As customers, we might scratch credit cards with the best offers and financial security.



Objectives

1). Analysis based on Demographic Variables

2). Analysis based on Product Variables


**Data Cleaning**

Checking for misssing values

(SELECT *
FROM bankmain
WHERE CLIENTNUM is NULL OR Attrition_Flag IS NULL OR Customer_Age IS NULL OR Gender IS NULL OR Dependent_count is NULL OR Education_Level IS NULL OR Marital_Status IS Null;)

**-No missing values**


**Unique Customers**

(SELECT 
DISTINCT CLIENTNUM
FROM bankmain; )

**-There's a total of unique 10127 customers**

**Demographic Variables**

Column Manipulation

Transforming the Attrition flag column into 1 and 0 using CASE statement


(SELECT 
COUNT(Attrition_FLag) AS existing_customer_count
FROM bankmain
WHERE Attrition_Flag ='Existing Customer';)

**-There are 8500 existing customers**

SELECT 
COUNT(Attrition_Flag) AS churned_customer_count
FROM bankmain
WHERE Attrition_Flag ='Attrited Customer';

**-There are 1627 churned customers**

SELECT
Attrition_FLag,
CASE 
WHEN Attrition_FLag ='Attrited Customer' THEN 1 
ELSE 0 END AS attrited_customer
FROM bankmain
GROUP BY Attrition_Flag;
UPDATE bankmain

SET Attrition_Flag=CASE 
WHEN Attrition_FLag ='Attrited Customer' THEN 1 
ELSE 0 END;
SELECT 
Attrition_Flag
FROM bankmain
GROUP BY Attrition_Flag;

Customer Age

SELECT 
MAX(Customer_Age) AS max_age,
MIN(Customer_Age) AS min_age
FROM bankmain

**The eldest customer is 73 while the youngest is 26**

SELECT 
Customer_Age,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END))) * 100, 2), '%') AS retention_rate
FROM bankmain
GROUP BY Customer_Age
ORDER BY Customer_Age ASC;
