CREATE DATABASE ORG;

USE ORG;

CREATE TABLE  Department( dept_no INT PRIMARY KEY, 
dept_name VARCHAR(50) NOT NULL,
 location VARCHAR(50) NOT NULL);

CREATE TABLE Employee( emp_no INT PRIMARY KEY,
 emp_name VARCHAR(50) NOT NULL, dob VARCHAR(10) NOT NULL,
 address VARCHAR(255) NOT NULL, doj VARCHAR(10) NOT NULL, 
 FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
 salary BIGINT NOT NULL);
 
 
 INSERT INTO Department VALUES(1,"HR","Kollam"),(2,"Sales","Kollam"),(3,"IT","Ernakulam");
 
 INSERT INTO Employee VALUES(110,"Ayash M","20/02/2000","Kunnikode , Punalur","22/03/2023",1,1000000),
 (111,"Nidal Basheer","15/10/2000","Vadakara, Kozhikode","25/03/2023",3,1200000),
 (112,"Devika Krishnan","10/01/2000","Ayathil , Kollam","28/03/2023",2,2000000);
 
 
 
