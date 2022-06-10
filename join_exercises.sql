# MySQL - Relationships: Joins exercises
# Part 1: Join Example Database
#1
CREATE DATABASE IF NOT EXISTS join_test_db;

USE join_test_db;

CREATE TABLE roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
    ('bob', 'bob@example.com', 1),
    ('joe', 'joe@example.com', 2),
    ('sally', 'sally@example.com', 3),
    ('adam', 'adam@example.com', 3),
    ('jane', 'jane@example.com', null),
    ('mike', 'mike@example.com', null);

#2
INSERT INTO users (name, email, role_id) VALUES
    ('billy', 'billy@example.com', 2),
    ('jim', 'jim@example.com', 2),
    ('pam', 'pam@example.com', 2),
    ('dwight', 'dwight@example.com', null);

#3
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#4
SELECT COUNT(users.name) as number_of_users_with_role, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role_name;

# Part 2: Employees Database
USE employees;

#2
SHOW tables;
SELECT departments.dept_name FROM departments;
SELECT * FROM dept_manager;

SELECT departments.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
    JOIN dept_manager
        ON employees.emp_no = dept_manager.emp_no
    JOIN departments
        ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY dept_name ASC;

#3
SELECT departments.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
    JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
    JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND gender = 'F'
ORDER BY dept_name ASC;

#4
SELECT title AS 'Title', COUNT(*) AS 'Count'
FROM titles
    JOIN dept_emp
        ON titles.emp_no = dept_emp.emp_no
    JOIN departments
        ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service' AND dept_emp.to_date = '9999-01-01' AND titles.to_date = '9999-01-01'
GROUP BY title;

#5
SELECT departments.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager', salaries.salary AS 'Salary'
FROM employees
    JOIN dept_manager
    ON employees.emp_no = dept_manager.emp_no
    JOIN departments
    ON dept_manager.dept_no = departments.dept_no
    JOIN salaries
        ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
ORDER BY dept_name ASC;

# Bonus
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee', d.dept_name AS 'Department', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager'
FROM employees
    JOIN dept_emp AS de
        ON de.emp_no = employees.emp_no
    JOIN departments AS d
        ON de.dept_no = d.dept_no
    JOIN dept_manager AS m
        ON m.dept_no = d.dept_no
    JOIN employees AS managers
        ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW() AND m.to_date > NOW()
ORDER BY dept_name ASC;