# MySQL - Functions exercises
USE employees;

#2
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';

SELECT *
FROM employees;

#3
SELECT *
FROM employees
WHERE birth_date LIKE '%%%%-12-25';

# Same as above solution - but using month() and day() functions
SELECT *
FROM employees
WHERE month(birth_date) = '12'
    AND day(birth_date) = '25';

#4 & #5
SELECT *
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
    AND month(birth_date) = '12'
    AND day(birth_date) = '25'
ORDER BY hire_date DESC, birth_date DESC;

#6
SELECT first_name, last_name, CONCAT(DATEDIFF(curdate(), hire_date)) AS 'days_in_company'
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = '12'
  AND day(birth_date) = '25';