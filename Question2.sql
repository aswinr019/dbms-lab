
 INSERT INTO Department VALUES(1,"HR"),(2,"Sales"),(3,"IT"),(3,"Marketing"),(4,"Operations"),(5,"Operations");

 INSERT INTO Employee VALUES(110,"Ayash M","20/02/2000","Kunnikode , Punalur",1234567890,"22/03/2023",1,1000000,"HR Manager"),
 (111,"Nidal Basheer","15/10/2000","Vadakara, Kozhikode",1234512345,"25/03/2023",3,1200000,"IT Admin"),
 (112,"Devika Krishnan","10/01/2000","Ayathil , Kollam",0099887766,"28/03/2023",2,2000000,"Sales Representative"),
 (113,"Deva P Lal","25/06/2000","Pathanapuram , Kollam",1122334455,"03/04/2023",4,2000000,"Marketing Manager"),
 (114,"Athira Mohan","10/03/2002","Kottiyam , Kollam",0987654321,"20/01/2023",4,2000000,"Operations Assistant");
 
 
 
SELECT * FROM Employee as e INNER JOIN department as d ON e.dept_no = d.dept_no;

SELECT emp_no, emp_name FROM Employee WHERE dept_no = 2;

SELECT emp_no, emp_name, designation, dept_no, salary FROM Employee ORDER BY salary DESC;

SELECT emp_no, emp_name FROM Employee WHERE salary BETWEEN 1000000 AND 1300000;

SELECT DISTINCT designation FROM Employee;

SELECT dept_name, SUM(salary) FROM Employee e INNER JOIN department d ON e.dept_no = d.dept_no GROUP BY e.dept_no;

UPDATE Employee SET salary = 1800000 WHERE designation = 'Marketing Manager';

UPDATE Employee SET mobile_no = '1234567890' WHERE emp_name = 'Athira Mohan';

DELETE * FROM Employee WHERE salary = 1200000;

SELECT dept_name FROM Employee e INNER JOIN Department d ON e.dept_no = d.dept_no GROUP BY e.dept_no HAVING SUM(salary) > 1000000;
