CREATE DATABASE bank_loan_analysis;
USE bank_loan_analysis;
CREATE TABLE bank_loan (
    person_age INT,
    person_gender VARCHAR(10),
    person_education VARCHAR(50),
    person_income INT,
    person_emp_exp INT,
    person_home_ownership VARCHAR(20),
    loan_amnt INT,
    loan_intent VARCHAR(50),
    loan_int_rate DECIMAL(5,2),
    loan_percent_income DECIMAL(5,2),
    cb_person_cred_hist_length INT,
    credit_score INT,
    previous_loan_defaults_on_file VARCHAR(5),
    loan_status TINYINT
);


SELECT COUNT(*) FROM bank_loan;
SELECT * FROM bank_loan LIMIT 5;

SELECT 
    COUNT(*) AS total_loans,
    SUM(loan_status) AS approved_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan;

SELECT 
    person_gender,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan
GROUP BY person_gender;


SELECT 
    CASE 
        WHEN credit_score < 600 THEN 'Low'
        WHEN credit_score BETWEEN 600 AND 699 THEN 'Medium'
        ELSE 'High'
    END AS credit_score_group,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan
GROUP BY credit_score_group;

SELECT 
    previous_loan_defaults_on_file,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan
GROUP BY previous_loan_defaults_on_file;


SELECT 
    CASE
        WHEN person_income < 30000 THEN 'Low Income'
        WHEN person_income BETWEEN 30000 AND 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan
GROUP BY income_group;

SELECT 
    loan_intent,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_status)/COUNT(*)*100,2) AS approval_rate_percent
FROM bank_loan
GROUP BY loan_intent
ORDER BY approval_rate_percent DESC;





