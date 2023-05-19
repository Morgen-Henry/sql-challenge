-- DATA ENGINEERING
-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR (5) Primary Key,
	title VARCHAR NOT NULL
);

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) Primary Key,
	dept_name VARCHAR NOT NULL
);

-- Create employees table (DEPENDENT ON TITLES)
CREATE TABLE employees (
	emp_no INTEGER Primary Key,
	emp_title_id VARCHAR (5),
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE,
	Foreign Key(emp_title_id) REFERENCES titles(title_id)
);

-- Create employee/department table (DEPENDENT ON EMPLOYEES & DEPARTMENTS)
CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR (4) NOT NULL,
	Primary Key (emp_no, dept_no),
	Foreign Key(emp_no) REFERENCES employees(emp_no),
	Foreign Key(dept_no) REFERENCES departments(dept_no)
);

-- Create department/manager table (DEPENDENT ON EMPLOYEES & DEPARTMENTS)
CREATE TABLE dept_manager (
	dept_no VARCHAR (4) NOT NULL,
	emp_no INTEGER,
	Primary Key (dept_no, emp_no),
	Foreign Key(dept_no) REFERENCES departments(dept_no),
	Foreign Key(emp_no) REFERENCES employees(emp_no)
);

-- Create salary table (DEPENDENT ON EMPLOYEES)
CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	Foreign Key(emp_no) REFERENCES employees (emp_no)
);
