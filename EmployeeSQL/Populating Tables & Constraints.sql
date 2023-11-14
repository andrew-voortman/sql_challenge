SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;

-- Data Analysis no. 1: List the employee number, 
-- last name, first name, sex, & salary of each employee.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no;

-- Data Analysis no. 2: List the first name, last name, 
-- and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- DATA ANALYSIS NO. 3: List the manager of each department 
-- along with their department number, department name, employee 
-- number, last name, and first name.
SELECT departments.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
INNER JOIN dept_manager ON 
	employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no;

-- DATA ANALYSIS NO. 4: List the department number for each employee 
-- along with that employee’s employee number, last name, first name, 
-- and department name.
SELECT departments.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no;

-- DATA ANALYSIS NO. 5: List first name, last name, and sex of each 
-- employee whose first name is Hercules and whose last name begins 
-- with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- DATA ANALYSIS NO. 6: List each employee in the Sales department, 
-- including their employee number, last name, and first name.
SELECT	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- DATA ANALYSIS NO. 7: List each employee in the Sales and Development 
-- departments, including their employee number, last name, first name, 
-- and department name.
SELECT	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- DATA ANALYSIS NO. 8: LIst the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name,
	COUNT (employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT (employees.last_name) desc;
