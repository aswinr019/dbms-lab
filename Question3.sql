SELECT emp_no , emp_name , salary  FROM Employee WHERE salary > ( SELECT AVG(salary) FROM Employee) ;

SELECT emp_no , emp_name , salary  FROM Employee WHERE salary = ( SELECT MIN(salary) FROM Employee) ;

SELECT  emp_name  FROM Employee WHERE designation = ( SELECT designation FROM Employee WHERE emp_name = "Arun") ;

SELECT  emp_no , emp_name  FROM Employee WHERE salary >  ( SELECT MAX(salary)FROM Employee WHERE dept_no = 1) ;

SELECT * FROM employee e LEFT JOIN department d ON e.dept_no = d.dept_no;


SELECT * FROM employee e RIGHT OUTER JOIN department d ON e.dept_no = d.dept_no;
