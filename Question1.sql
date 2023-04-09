


CREATE DATABASE ORG;

USE ORG;

CREATE TABLE  Department(dept_no INT PRIMARY KEY, 
dept_name VARCHAR(50) NOT NULL,
 location VARCHAR(50) NOT NULL);


CREATE TABLE Employee( emp_no INT PRIMARY KEY,
 emp_name VARCHAR(50) NOT NULL, dob DATE NOT NULL,
 address VARCHAR(255) NOT NULL,
 mobile_no BIGINT NOT NULL, doj DATE NOT NULL, 
 dept_no INT,
 FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
 salary BIGINT NOT NULL);
 
 
 
 SHOW TABLES;
 
 DESCRIBE Employee;
 
 
 SELECT * FROM Employee;
 SELECT * FROM Department;

ALTER TABLE Employee ADD COLUMN Designation  VARCHAR(255) NOT NULL;
ALTER TABLE Department DROP COLUMN loaction;

DROP TABLE Department, Employee;

DROP DATABASE ORG;

