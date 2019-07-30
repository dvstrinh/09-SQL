-- Reference Tables
SELECT * FROM "Departments";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no , e.last_name, e.first_name, e.gender, s.salary 
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no);

-- 2. List employees who were hired in 1986.
SELECT * FROM "Employees"
WHERE CAST(hire_date AS text) LIKE '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM "Dept_manager" dm
JOIN "Departments" d 
ON (dm.dept_no = d.dept_no)
JOIN "Employees" e
ON (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" de
JOIN "Employees" e
ON (de.emp_no = e.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" de
JOIN "Employees" e
ON (de.emp_no = e.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" de
JOIN "Employees" e
ON (de.emp_no = e.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;

