-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
	from employees INNER JOIN salaries ON salaries.emp_no=employees.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name,employees.last_name,employees.hire_date
	from employees WHERE hire_date BETWEEN DATE('01/01/1986') AND DATE('12/31/1986');

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name 
	from dept_manager 
	INNER JOIN departments ON departments.dept_no=dept_manager.dept_no
	INNER JOIN employees ON dept_manager.emp_no=employees.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT dept_emp.dept_no,employees.emp_no,employees.last_name,employees.first_name,
	departments.dept_name
	from employees
	INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
	INNER JOIN departments ON departments.dept_no=dept_emp.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT * from employees WHERE first_name='Hercules' AND SUBSTRING(last_name, 1, 1)='B';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_emp.emp_no,employees.last_name,employees.first_name from dept_emp 
	INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
	WHERE dept_emp.dept_no='d007';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name from dept_emp 
	INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
	WHERE dept_emp.dept_no='d005' OR dept_emp.dept_no='d007';

--8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) AS Frequency
	from employees
	GROUP by last_name
	ORDER BY COUNT(last_name) DESC;
