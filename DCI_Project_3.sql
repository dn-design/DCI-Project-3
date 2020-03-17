--QUESTION 1: How many employees earn more than the average salary?

--This query reveals the average salary of all employees in this database
SELECT round(avg(salary)) as Avg_Salary
FROM hr.employees;

--This query shows the number of employees who have a higher salary than the average
SELECT count(e.employee_id) as Above_Avg_Salary
FROM hr.employees e
WHERE e.salary > (SELECT avg(e.salary) FROM hr.employees e); -- The code in parentheses gives us the average salary of all employees, in order to compare it to each employee's salary to see if it's above or below average

--This query shows the salaries, names, departments, and jobs of all employees with above-average salaries
SELECT e.salary, e.first_name, e.last_name, d.department_name, j.job_title
FROM hr.employees e
--The 2 statements that start with JOIN are necessary to get the department names and job titles on the list   
JOIN hr.jobs j ON e.job_id = j.job_id
JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT avg(e.salary) FROM hr.employees e)
ORDER BY e.salary desc;

--QUESTION 2: What month generates the most sales, and what sells the most in that month?

SELECT p.prod_name, t.calendar_month_name, sum(s.amount_sold)
FROM sh.times t
JOIN sh.sales s ON s.time_id = t.time_id
JOIN sh.products p ON p.prod_id = s.prod_id
GROUP BY p.prod_name, t.calendar_month_name
ORDER BY sum(s.amount_sold) desc;
