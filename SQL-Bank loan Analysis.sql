SELECT * FROM bank_loan_analysis.finance_2;

Select * from finance_1;
Select * from finance_2;



##Year wise loan amount Stats
##Grade and sub grade wise revol_bal
##Total Payment for Verified Status Vs Total Payment for Non Verified Status
##State wise and month wise loan status
##Home ownership Vs last payment date stats


#KPI 1

##issue_d
##loan_amnt

Select year(issue_d) as Year_of_issue_d, SUM(loan_amnt) as total_amount from finance_1
GROUP BY year(issue_d)
Order by  year(issue_d);

#KPI 2
##revol_bal  ##grade  ##sub_grade

Select grade, sub_grade from  finance_1;
select revol_bal from finance_2;

Select finance_1.grade, finance_1.sub_grade,
SUM(finance_2.revol_bal) as Total_revol_bal from finance_1
JOIN finance_2
ON finance_1.id=finance_2.id
GROUP BY finance_1.grade, finance_1.sub_grade
Order BY finance_1.grade, finance_1.sub_grade;


#KPI 3
##Total Payment for Verified Status Vs Total Payment for Non Verified Status
#verification_status

##Table 2---total_pymnt

select finance_1.verification_status,ROUND(SUM(finance_2.total_pymnt),2) as total_payment
from finance_1 JOIN 
finance_2
ON finance_1.id=finance_2.id
GROUP BY finance_1.verification_status;


#KPI 4
##State wise and month wise loan status
#addr_state, issue_d,loan_status

Select addr_state as state,  DATE_FORMAT(issue_d, '%Y-%m') AS month_year, loan_status, COUNT(*) as Total_loans
from finance_1
GROUP BY state, month_year, loan_status 
Order by state,month_year;

#KPI 5
##Home ownership Vs last payment date stats
##home_ownership, last_pymnt_d

Select finance_1.home_ownership, finance_2.last_pymnt_d
from finance_1
JOIN finance_2
ON finance_1.id=finance_2.id 
GROUP BY finance_1.home_ownership, finance_2.last_pymnt_d
Order by finance_1.home_ownership DESC, finance_2.last_pymnt_d DESC;











