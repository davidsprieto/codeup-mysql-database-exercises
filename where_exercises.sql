# MySQL - Clauses: Where exercises
USE employees;

# PART 1:
#2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

#3
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

#4
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# PART 2:
#1 & #2
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
    AND gender = 'M';

#3
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
    OR last_name LIKE '%E';

#4
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   AND last_name LIKE '%E';

#5
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%';
