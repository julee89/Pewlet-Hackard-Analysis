-- Query to get list of all retiring employees
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Count of retiring employees
SELECT COUNT(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- list of employees born in 19522
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- list of employees born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- list of employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- list of employees born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count of employee eligible for retirement
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a table with the retirement info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Query the retirement_info table for output
SELECT *
FROM retirement_info;

-- Dropping table retirement_info to make edits
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name, dm.emp_no, dm.from_date, dm.to_date
FROM departments d
INNER JOIN dept_manager dm
ON d.dept_no = dm.dept_no;


-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
FROM retirement_info ri
LEFT JOIN dept_emp de
ON ri.emp_no = de.emp_no;

-- Check retirement list for current employees
SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
INTO current_emp
FROM retirement_info ri
LEFT JOIN dept_emp de
ON ri.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';

SELECT *
FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee count by department number - Creating table for output
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee salary data
SELECT *
FROM salaries
ORDER BY to_date DESC;

-- new filterd employee data table
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- create a new emp_info table
DROP TABLE emp_info;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary,
		de.to_date
INTO emp_info
FROM employees e
INNER JOIN salaries s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no, d.dept_name, dm.emp_no, ce.last_name, ce.first_name,
        dm.from_date, dm.to_date
INTO manager_info
FROM dept_manager  dm
INNER JOIN departments  d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp  ce
ON (dm.emp_no = ce.emp_no);

-- List of department retirees
SELECT ce.emp_no, ce.first_name, ce.last_name, d.dept_name
INTO dept_info
FROM current_emp  ce
INNER JOIN dept_emp  de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments  d
ON (de.dept_no = d.dept_no);

-- Sales team requested query
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
AND d.dept_name = 'Sales';


-- Sales & Development team requested query
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
AND d.dept_name in ('Sales', 'Development');
