-- create titles table
CREATE TABLE titles (
	title_id VARCHAR(225),
	title VARCHAR(225),
	PRIMARY KEY (title_id)
);

-- import titles.csv data
SELECT * FROM titles;

-- create departments table
CREATE TABLE departments (
	dept_no VARCHAR(225),
	dept_name VARCHAR(225),
	PRIMARY KEY (dept_no)
);

-- import departments.csv data
SELECT * FROM departments;

-- create employees table
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR(225),
	birth_date DATE,
	first_name VARCHAR(225),
	last_name VARCHAR(225),
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- import employees.csv data
SELECT * FROM employees;

-- create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(225),
	emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- import dept_manager.csv data
SELECT * FROM dept_manager;

-- create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(225),
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- import dept_emp.csv data
SELECT * FROM dept_emp;

-- create salaries table
CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- import salaries.csv data
SELECT * FROM salaries;



