-- List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.gender,
	salaries.salary
from employees
join salaries on 
employees.emp_no = salaries.emp_no;

-- List employees who were hired in 1986.
select * from employees
where hire_date like '1986%'

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT 
  departments.dept_no,
  departments.dept_name,
  dept_manager.emp_no,
  employees.first_name,
  employees.last_name,
  dept_manager.from_date,
  dept_manager.to_date
  
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN dept_manager ON
dept_emp.emp_no = dept_manager.emp_no
INNER JOIN employees ON
dept_manager.emp_no =employees.emp_no
ORDER BY departments.dept_name;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
INNER JOIN dept_manager ON
	employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no;
	
-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
INNER JOIN dept_manager ON
	employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no
WHERE dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
INNER JOIN dept_manager ON
	employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no
WHERE dept_name LIKE 'Sales'
OR dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;