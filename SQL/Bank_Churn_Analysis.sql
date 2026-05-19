create database bank_project;
use bank_project
SELECT *
FROM Bank_Churn
LIMIT 10;

select count(*) from Bank_Churn;

select * from Bank_Churn
where age < 18 or age>100;

select CustomerId,count(*) from Bank_Churn
group by CustomerId
having count(*) >1;

select * from Bank_Churn 
limit500;

select Geography from Bank_churn;

select *,Balance from Bank_churn
where Balance = 0;

select Balance,count(*) from Bank_churn
where balance=0
group by balance;

select Surname, Geography, Gender,Balance from Bank_churn;

select Surname, Geography, Age,Balance from Bank_churn
where Geography="Germany" And Exited=1;

select round(avg(CreditScore),2),count(*) from Bank_churn
where Exited = 1;

select geography, round(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate from Bank_churn
group by geography
order by round(SUM(Exited) * 100.0 / COUNT(*)) desc;

select gender,round(avg(balance),2) as avg_balance from bank_churn
group by gender
having round(avg(balance),2) > 75000;

select gender,round(SUM(Exited) * 100.0 / COUNT(*),2) as churn_rate from bank_churn
group by gender 
having  churn_rate>20
order by churn_rate desc;

select geography,round(avg(age),2)  from bank_churn
where IsActiveMember = 1
group by geography 
order by avg(age) desc;

select geography,count(*) from bank_churn
where Exited=1
group by geography 
having count(*) > 300
order by count(*) desc;

#How many total customers do we have and how many have churned? Also show the overall churn rate %--

SELECT 
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM Bank_Churn;
 
 
 #Which country has the highest number of customers and which has the highest churn rate? Show total 
 #customers, churned customers and churn rate per country.
 
 select geography,count(*) as total_customers,sum(exited) as churned_customers, ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate 
 from bank_churn
 group by geography;
 
 #"What is the churn rate by Gender and Age group combined?
select case 
when age < 35 THEN 'Young'
when age <=50 Then 'Middle'
else 'Senior' end as age_group,
gender,ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate 
from bank_churn
group by age_group,gender;

#Find the average credit score, average balance and average salary of churned vs non churned customers. Round all to 2 decimals.
select round(avg(CreditScore),2) as avg_creditscore,round(avg(balance),2)as avg_balance,round(avg(EstimatedSalary),2) as avg_salary,exited from bank_churn
group by exited;

#Find the number of customers who have a credit card vs those who don't, and their churn rate

select hascrcard,count(*) as no_of_customers,round(sum(exited)*100/count(*),2) from bank_churn
group by hascrcard;

#Find the churn rate by number of products customers have (NumOfProducts). Which product count has highest churn?
select numofproducts,count(*) as no_of_customers,round(sum(exited)*100.0/count(*),2) from bank_churn
group by numofproducts
order by numofproducts desc;
#"Find the churn rate by Tenure (how many years customer has been with bank). Which tenure has highest churn?"
select tenure,round(sum(exited)*100.0/count(*),2) as churn_rate from bank_churn
group by tenure;

#Find the churn rate for active vs non active members. Is being active related to churn?"

select isactivemember,count(*) as total_customers,round(sum(exited)*100.0/count(*),2) as churn_rate from bank_churn
group by isactivemember;

#Find the top 5 customers with highest balance who have churned. Show their name, geography, age, balance and credit score
select* from bank_churn
where exited =1
order by balance desc
limit 5;

SELECT 
    Geography,
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited)*100.0/COUNT(*), 2) AS churn_rate,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(CreditScore), 2) AS avg_creditscore
FROM Bank_Churn
GROUP BY geography,gender
HAVING churn_rate > 20
ORDER BY churn_rate DESC;
