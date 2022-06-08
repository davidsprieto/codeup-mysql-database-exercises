# MySQL - Clauses: Order By exercises
USE employees;

#2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

#3
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

#4
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

#5
SELECT *
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no; -- Default order is ASC;

#6
SELECT *
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;