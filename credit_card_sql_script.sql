create database credit_card_churn
select * from bankmain

SELECT 
round(COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN Clientnum END) / COUNT(Clientnum),2) * 100 AS churn_rate,
round(COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN Clientnum END) / COUNT(Clientnum),2) * 100 AS retention_rate
FROM bankmain

SELECT *
FROM bankmain
WHERE CLIENTNUM is NULL OR Attrition_Flag IS NULL 
OR Customer_Age IS NULL OR Gender IS NULL OR Dependent_count is NULL 
OR Education_Level IS NULL OR Marital_Status IS Null;




select * from bankmain

select distinct count(clientnum) from bankmain



select count(attrition_flag) as exisiting_customer_count from bankmain where attrition_flag = "Existing Customer"


select count(attrition_flag) as attrited_customer_count from bankmain where attrition_flag = "Attrited Customer"



select attrition_flag case when attrition_flag = "attrited customer" then 1 else 0 end as attrited_customer from bankmain 
group by attrition_flag


SELECT
Attrition_FLag,
CASE 
WHEN Attrition_FLag ='Attrited Customer' THEN 1 
ELSE 0 END AS attrited_customer
FROM bankmain
GROUP BY Attrition_Flag;

update bankmain set attrition_flag = case when attrition_flag = "Attrited Customer" then 1 else 0 end

SET SQL_SAFE_UPDATES = 0;

UPDATE bankmain
SET Attrition_Flag=CASE 
WHEN Attrition_FLag ='Attrited Customer' THEN 1 
ELSE 0 END;

select attrition_flag from bankmain


select * from bankmain
select max(customer_age) as max_age , min(customer_age) as min_age from bankmain
SELECT 
Customer_Age,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END))) * 100, 2), '%') AS retention_rate
FROM bankmain
GROUP BY Customer_Age
ORDER BY Customer_Age ASC;

CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,

select customer_age, sum(case when attrition_flag = '1' then 1 else 0 end) as churned_customer,
sum(case when attrition_flag = '0' then 1 else 0 end) as exisiting_customer, 
concat(round((sum(case when attrition_flag = '1' then 1 else 0 end) / (sum(case when attrition_flag = '0' then 1 else 0 end) + sum(case when attrition_flag = '1' then 1 else 0 end))) * 100, 2), "%") as churn_rate, 
concat(round((sum(case when attrition_flag = '0' then 1 else 0 end) / (sum(case when attrition_flag = '1' then 1 else 0 end) + sum(case when attrition_flag = '0' then 1 else 0 end))) * 100, 2), "%") as retention_rate 
from bankmain group by customer_age order by customer_age asc


select * from bankmain

select gender, sum(case when attrition_flag = "1" then 1 else 0 end) as churned_customer,
 sum(case when attrition_flag = "0" then 1 else 0 end) as existing_customer,
 concat(round((sum(case when attrition_flag = "1" then 1 else 0 end)/ (sum(case when attrition_flag = '0' then 1 else 0 end) + sum(case when attrition_flag = '1' then 1 else 0 end))) * 100, 2), "%") as churn_rate
 from bankmain group by gender order by gender


SELECT 
Dependent_count,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Dependent_count
ORDER BY Dependent_count ASC;


SELECT 
Education_Level,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Education_Level
ORDER BY Education_Level ASC;

SELECT 
Marital_Status,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Marital_Status
ORDER BY Marital_Status ASC;

select * from bankmain


SELECT 
Total_Relationship_Count,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) -SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS difference,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END))) * 100, 2), '%') AS retention_rate
FROM bankmain
GROUP BY Total_Relationship_Count
ORDER BY Total_Relationship_Count ASC;


select income_category, sum(case when attrition_flag = "1" then 1 else 0 end) as churned_customer,
 sum(case when attrition_flag = "0" then 1 else 0 end) as existing_customer, sum(case when attrition_flag = "1" then 1 else 0 end) -
 sum(case when attrition_flag = "0" then 1 else 0 end) as difference, concat(round((sum(case when attrition_flag = "1" then 1 else 0 end) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Income_Category
order by income_category


SELECT 
Card_Category,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) -SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS difference,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Card_Category
ORDER BY Card_Category ASC;


SELECT 
Months_on_book,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) - SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS difference,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END))) * 100, 2), '%') AS retention_rate
FROM bankmain
GROUP BY Months_on_book
ORDER BY Months_on_book ASC;

SELECT 
Months_Inactive_12_mon,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END))) * 100, 2), '%') AS retention_rate
FROM bankmain
GROUP BY Months_Inactive_12_mon
ORDER BY Months_Inactive_12_mon ASC;

SELECT 
Contacts_Count_12_mon,
SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) AS churned_customer_count,
SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) AS existing_customer_count,
CONCAT(ROUND((SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / (SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) + SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END))) * 100, 2), '%') AS churn_rate
FROM bankmain
GROUP BY Contacts_Count_12_mon
ORDER BY Contacts_Count_12_mon ASC;

select * from bankmain

select attrition_flag, sum(total_trans_amt) as transaction_amt,
sum(case when attrition_flag = "1" then 1 else 0 end) as churned_customer,
sum(case when attrition_flag = "0" then 1 else 0 end) as exisiting_customer from bankmain group by attrition_flag order by transaction_amt


SELECT 
CONCAT(ROUND(SUM(CASE WHEN Attrition_Flag = '1' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS churned_customer_percentage,
CONCAT(ROUND(SUM(CASE WHEN Attrition_Flag = '0' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS existing_customer_percentage
FROM bankmain
