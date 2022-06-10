# MySQL - Relationships: Sub-Queries exercises
USE employees;

# Testing Curriculum Code to see results:
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

#1
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE employees.employees.emp_no = 101010
    )
LIMIT 69;

#2
SELECT DISTINCT title AS 'Titles', COUNT(title)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE employees.first_name = 'Aamod'
    )
GROUP BY title;

#3
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F' AND to_date > NOW()
        )
    );

# Bonus
SELECT first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    ORDER BY salary DESC
    LIMIT 1
    );