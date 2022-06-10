CREATE DATABASE IF NOT EXISTS database_design_test_db;

SHOW databases;

USE database_design_test_db;

SELECT database();

SHOW CREATE DATABASE database_design_test_db;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name CHAR(100) NOT NULL,
    last_name CHAR(100) NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE users;

INSERT INTO users(first_name, last_name, email, password) VALUES
    ('Jim', 'Halpert', 'jimhalpert@test.com', '******'),
    ('Pam', 'Halpert', 'pamhalpert@test.com', '******'),
    ('Dwight', 'Schrute', 'dwight@test.com', '******');

SHOW tables;

SELECT * FROM users;

CREATE TABLE IF NOT EXISTS ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title CHAR(25) NOT NULL,
    category CHAR(25) NOT NULL,
    description TEXT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SHOW tables;

SELECT * FROM ads;

INSERT INTO ads (user_id, title, category, description) VALUES
    ((SELECT id FROM users WHERE first_name = 'Jim' AND last_name = 'Halpert'),
     'Job', 'Help Wanted', 'Hiring an entry level salesman'),
    ((SELECT id FROM users WHERE first_name = 'Pam' AND last_name = 'Halpert'),
     'Giving Away Desk', 'Giveaway', 'Giving away a barely used office desk'),
    ((SELECT id FROM users WHERE first_name = 'Dwight' AND last_name = 'Schrute'),
     'Selling Used Couch', 'Furniture', 'Selling a mint condition office couch');

SELECT * FROM ads;

INSERT INTO ads (user_id, title, category, description) VALUES
    ((SELECT id FROM users WHERE first_name = 'Jim' AND last_name = 'Halpert'),
     'Giving Away Phone', 'Giveaway', 'Giving away a barely used office phone');

SELECT * FROM ads;
SELECT * FROM users;

INSERT INTO ads (user_id, title, category, description) VALUES
    ((SELECT id FROM users WHERE first_name = 'Jim' AND last_name = 'Halpert'),
    'Selling Used Chair', 'Furniture', 'Selling a mint condition office lounge chair');

SELECT * FROM ads;
SELECT * FROM users;

