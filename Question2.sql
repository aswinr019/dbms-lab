
 INSERT INTO Department VALUES(1,"HR"),(2,"Sales"),(3,"IT"),(4,"Marketing"),(5,"Operations");

 INSERT INTO Employee VALUES(110,"Ayash M","2000-02-20","Kunnikode , Punalur",1234567890,"2023-03-22",1,1000000,"HR Manager"),
 (111,"Nidal Basheer","2000-10-15","Vadakara, Kozhikode",1234512345,"2023-03-25",3,1200000,"IT Admin"),
 (112,"Devika Krishnan","2000-01-10","Ayathil , Kollam",0099887766,"2023-0-28",2,2000000,"Sales Representative"),
 (113,"Deva P Lal","2000-01-26","Pathanapuram , Kollam",1122334455,"2023-04-03",4,2000000,"Marketing Manager"),
 (114,"Athira Mohan","2002-03-10","Kottiyam , Kollam",0987654321,"2023-01-20",4,2000000,"Operations Assistant");
 
 
 SELECT * FROM Employee ;
 SELECT * FROM Department;
 
--SELECT * FROM Employee as e INNER JOIN department as d ON e.dept_no = d.dept_no;

SELECT emp_no, emp_name FROM Employee WHERE dept_no = 2;

SELECT emp_no, emp_name, designation, dept_no, salary FROM Employee ORDER BY salary DESC;

SELECT emp_no, emp_name FROM Employee WHERE salary BETWEEN 2000 AND 5000;

SELECT DISTINCT designation FROM Employee;

SELECT dept_name, SUM(salary) FROM Employee e INNER JOIN department d ON e.dept_no = d.dept_no GROUP BY e.dept_no;

UPDATE Employee SET salary = 25000 WHERE designation = 'Typist';

UPDATE Employee SET mobile_no = 1234567890 WHERE emp_name = 'Athira Mohan';

DELETE * FROM Employee WHERE salary = 7000;

SELECT dept_name FROM Employee e INNER JOIN Department d ON e.dept_no = d.dept_no GROUP BY e.dept_no HAVING SUM(salary) > 25000;
