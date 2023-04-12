SELECT emp_no , emp_name , salary  FROM Employee WHERE salary > ( SELECT AVG(salary) FROM Employee) ;

SELECT emp_no , emp_name , salary  FROM Employee WHERE salary = ( SELECT MIN(salary) FROM Employee) ;

SELECT  emp_name  FROM Employee WHERE designation = ( SELECT designation FROM Employee WHERE emp_name = "Arun") ;

SELECT  emp_no , emp_name  FROM Employee WHERE salary >  ( SELECT MAX(salary)FROM Employee WHERE dept_no = 1) ;

SELECT * FROM Employee e LEFT JOIN Department d ON e.dept_no = d.dept_no;


SELECT * FROM Employee e RIGHT OUTER JOIN Department d ON e.dept_no = d.dept_no;
