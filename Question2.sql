
 INSERT INTO Department VALUES(1,"HR"),(2,"Sales"),(3,"IT"),(4,"Marketing"),(5,"Other");
 
  INSERT INTO Employee VALUES
  (110,'Ted J. Cloud', '1996-02-04', '4084 Lincoln Drive, Millerstown, PA 17062', '9829594246', '2022-04-23', '1', '50000', 'HR Recruiter'),
    (111,'Larry S. Ackerman', '1997-04-20', '1885 Frederick Street, Midland, TX 79701', '4117136606', '2020-03-16', '3', '60000', 'IT Admin'),
    (112,'John M. Patterson', '1995-09-12', '996 Simpson Square, Tonkawa, OK 74653', '8113899890', '2021-04-19', '2', '70000', 'Sales Head'),
    (113,'Marlon L. Brennan', '1997-10-08', '4039 Griffin Street, Phoenix, AZ 85040', '6934074979', '2022-06-05', '4', '100000', 'Marketing Manager'),
    (114,'Thomas C. Boston', '2000-11-03', '581 Michigan Avenue, New Castle, PA 16101', '6032868245', '2023-01-09', '5', '90000', 'Typist')
 
 
 SELECT * FROM Employee ;
 SELECT * FROM Department;

SELECT emp_no, emp_name FROM Employee WHERE dept_no = 2;

SELECT emp_no, emp_name, designation, dept_no, salary FROM Employee ORDER BY salary DESC;

SELECT emp_no, emp_name FROM Employee WHERE salary BETWEEN 2000 AND 5000;

SELECT DISTINCT designation FROM Employee;

SELECT dept_name, SUM(salary) FROM Employee e INNER JOIN department d ON e.dept_no = d.dept_no GROUP BY e.dept_no;

UPDATE Employee SET salary = 25000 WHERE designation = 'Typist';

UPDATE Employee SET mobile_no = 1234567890 WHERE emp_name = 'john';

DELETE * FROM Employee WHERE salary = 7000;

SELECT dept_name FROM Employee e INNER JOIN Department d ON e.dept_no = d.dept_no GROUP BY e.dept_no HAVING SUM(salary) > 25000;
