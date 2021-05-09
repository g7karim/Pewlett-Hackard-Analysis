--------------------------- Deliverable 1: The Number of Retiring Employees by Title -------------------------

--Steps 1-8
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.titles,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
-- View table
SELECT * FROM retirement_titles;


-- Steps 8-14
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	titles
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
--View table
SELECT * FROM unique_titles;

-- Steps 15-20
SELECT COUNT(emp_no), titles
INTO retiring_titles
FROM unique_titles
GROUP BY titles
ORDER BY count(emp_no) DESC;
-- View table
SELECT * FROM retiring_titles;


-------------------------Deliverable 2: The Employees Eligible for the Mentorship Program-----------------------

SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.titles
INTO mentorship_eligibility 
FROM employees as e 
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti 
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
-- View table 
SELECT * FROM mentorship_eligibility;