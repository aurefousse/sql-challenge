DROP TABLE salaries
CREATE TABLE salaries (
		emp_no INT,
		salary INT
);
DROP TABLE titles
CREATE TABLE titles (
		title_id VARCHAR(20),
		title VARCHAR(30)
);
DROP TABLE departments
CREATE TABLE departments (
		dept_no VARCHAR(20),
		dept_name VARCHAR(30)
);
DROP TABLE dept_emp
CREATE TABLE dept_emp (
		emp_no INT,
		dept_no VARCHAR(5)
);
DROP TABLE dept_manager
CREATE TABLE dept_manager (
		dept_no VARCHAR(5),
		emp_no INT
);
DROP TABLE employees
CREATE TABLE employees (
		emp_no INT PRIMARY KEY,
		emp_title_id VARCHAR(10),
		birth_date VARCHAR(20),
		first_name VARCHAR(30),
		last_name VARCHAR(30),
		sex VARCHAR(20),
		hire_date DATE
);
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE( 
		hire_date BETWEEN '1986-01-01'
		AND '1986-12-31'
)
ORDER BY hire_date ASC;

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
INNER JOIN employees AS e ON
e.emp_no = dm.emp_no;

SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_emp AS de ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
e.emp_no = de.emp_no;

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE( 
		e.first_name = 'Hercules'
		AND e.last_name LIKE 'B%'
);


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departments AS d
	INNER JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
	INNER JOIN employees AS e ON
	e.emp_no = de.emp_no
	WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departments AS d
	INNER JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
	INNER JOIN employees AS e ON
	e.emp_no = de.emp_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;