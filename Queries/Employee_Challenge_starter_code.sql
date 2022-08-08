-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;


DROP TABLE retirement_titles;

-- Create retirement_titles table
SELECT e.emp_no, e.first_name, e.last_name, ttl.title, ttl.from_date, ttl.to_date
INTO retirement_titles
FROM employees e
LEFT JOIN titles ttl
ON e.emp_no = ttl.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY 1;

DROP TABLE IF EXISTS unique_titles;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--Unique titles count
SELECT COUNT(emp_no) as "retiring_employees", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;


DROP TABLE IF EXISTS mentorship_elgibility;
-- Create mentorship table for only unique employees.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
		ttl.from_date, ttl.to_date, ttl.title
INTO mentorship_elgibility
FROM employees e
LEFT JOIN titles ttl
ON (e.emp_no = ttl.emp_no)
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND ttl.to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--Mentorship title count
SELECT COUNT(emp_no) as "mentorship_eligible_employees", title
INTO mentoring_titles
FROM mentorship_elgibility
GROUP BY title
ORDER BY 1 DESC;


select from_date
from  mentorship_elgibility
order by 1 DESC
