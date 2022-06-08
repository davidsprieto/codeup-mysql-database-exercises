USE employees;

SELECT * FROM employees WHERE hire_date = '1985-01-01';

SELECT * FROM employees WHERE hire_date LIKE '1985%';

SELECT DISTINCT hire_date, birth_date FROM employees WHERE hire_date LIKE '1985%' ORDER BY hire_date DESC;

SELECT DISTINCT hire_date, birth_date
FROM employees
WHERE hire_date LIKE '1985%'
ORDER BY hire_date DESC, birth_date DESC;

SELECT * FROM employees WHERE hire_date LIKE '%12-25';

SELECT * FROM employees WHERE hire_date LIKE '%-06-%';

SELECT * FROM employees WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

SELECT * FROM employees WHERE last_name = 'Herber' AND hire_date LIKE '199%';

SELECT * FROM employees WHERE hire_date LIKE '%12-25' OR hire_date LIKE '%10-31';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND ( last_name IN ('Herber','Baek')
        OR first_name = 'Shridhar'
    );

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Munenori'
LIMIT 9 OFFSET 18;