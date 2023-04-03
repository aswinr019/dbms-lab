SELECT emp_no , emp_name , salary  FROM Employee WHERE salary > ( SELECT AVG(salary) FROM Employee) ;

SELECT emp_no , emp_name , salary  FROM Employee WHERE salary = ( SELECT MIN(salary) FROM Employee) ;

SELECT  emp_name  FROM Employee WHERE designation = ( SELECT designation FROM Employee WHERE emp_name = "Arun") ;
