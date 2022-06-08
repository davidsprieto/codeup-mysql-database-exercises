# MySQL - Clauses: Limit exercises
USE employees;

#2
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT *
FROM salaries;

#3
SELECT emp_no
FROM salaries
ORDER BY salary DESC
LIMIT 5;

#4
SELECT DISTINCT emp_no, salary
FROM salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 45;