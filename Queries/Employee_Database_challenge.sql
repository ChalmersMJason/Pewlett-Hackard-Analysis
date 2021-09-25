--CREATE RETIREMENT TITLES
SELECT 
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no, ti.emp_no DESC

--CREATE UNIQUE TITLES TABLE
SELECT 
	DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC

--CREATE retiring_titles
SELECT 
	count(ut.title),
	ut.title
INTO retiring_titles
FROM unique_titles as ut

GROUP BY title 
ORDER BY 1 DESC

--Create mentorship_eligibility
SELECT
	DISTINCT ON (emp.emp_no) emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as emp
LEFT JOIN dept_emp as de 
	ON emp.emp_no = de.emp_no
LEFT JOIN titles as ti
	ON emp.emp_no = ti.emp_no
	
WHERE de.to_date = ('9999-01-01')
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

ORDER by emp.emp_no
