CREATE DATABASE details_db;

USE details_db;

CREATE TABLE Department(
dept_no INT PRIMARY KEY AUTO_INCREMENT,
dept_name VARCHAR(50) NOT NULL,
location VARCHAR(255));

Create TABLE Employee(
emp_id INT PRIMARY KEY  AUTO_INCREMENT,
emp_name VARCHAR(30) NOT NULL,
date_of_join DATE NOT NULL,
mobile BIGINT NOT NULL,
CONSTRAINT employee FOREIGN KEY (dept_no) REFERENCES department (dept_no),
salary INT NOT NULL
);



ALTER TABLE Employee ADD COLUMN designation VARCHAR(50) NOT NULL;

INSERT INTO  Department VALUES ();
INSERT INTO Employee VALUES ();

SELECT * FROM Department;
SELECT * FROM Employee;

