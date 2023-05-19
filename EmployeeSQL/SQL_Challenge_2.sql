-- DATA ANALYSIS
-- 1. List the employee number, last name, first name, sex and salary of each employee.
SELECT e.emp_no as Employee_Number, e.last_name, e.first_name, e.sex, s.salary
FROM salaries as s
INNER JOIN employees as e 
	ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for employees hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = '1986';

-- 3. List the manager of each department and their department and their department number, department name, employee number, 
-- 	  last name, and first name.
SELECT d.dept_no as Department_Number, d.dept_name as Department_Name, e.emp_no as Employee_Number, e.last_name, e.first_name
FROM dept_manager
INNER JOIN employees as e
	ON e.emp_no = dept_manager.emp_no
INNER JOIN departments as d
	ON d.dept_no = dept_manager.dept_no;

-- 4. List the department number for each employee and the employee's number, last name, first name, and department name.
SELECT de.dept_no as Department_Number, e.emp_no as Employee_Number, e.last_name, e.first_name, d.dept_name as Department_Name
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no;

-- 5. List the first name, last name, and sex of each employee with the first name Hercules and last name beginning with B.
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.first_name = 'Hercules' 
	AND e.last_name LIKE 'B%';

-- 6. List each employee in the sales department and their employee number, last name, first name, and department name.
SELECT e.emp_no as Employee_Number, e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the sales and development departments and their employee number, last name, first name, and 
--    department name.
SELECT e.emp_no as Employee_Number, e.last_name, e.first_name, d.dept_name as Department_Name
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';

-- 8. List the frequency counts (descending order) of all employee last names - who shares a last name.
SELECT COUNT(e.emp_no), e.last_name
FROM employees as e
GROUP BY e.last_name
ORDER BY COUNT(e.emp_no) DESC;
