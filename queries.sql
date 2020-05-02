
--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
 emp.emp_no 
,emp.last_nm
,emp.first_nm
,emp.gender
,sal.salary

FROM 
public.employee as emp

JOIN public.salaries as sal
    ON emp.emp_no = sal.emp_no
    
ORDER BY emp.emp_no;

--List employees who were hired in 1986.

SELECT 
 emp.emp_no 
,emp.last_nm
,emp.first_nm
,emp.hire_date

FROM public.employee AS emp

WHERE EXTRACT(YEAR FROM emp.hire_date) = '1986';

--List the manager of each department with the following information: 
    --department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT 
 dept.dept_no
,dept.dept_name
,emp.emp_no 
,emp.last_nm
,emp.first_nm
,man.from_date
,man.to_date

FROM public.employee AS emp

JOIN public.department_manager AS man
    ON man.emp_no = emp.emp_no

JOIN public.departments AS dept
    ON man.dept_no = dept.dept_no;


--List the department of each employee with the following information: 
    --employee number, last name, first name, and department name.

SELECT 
dept.dept_name
,emp.emp_no 
,emp.last_nm
,emp.first_nm

FROM public.employee AS emp

JOIN public.employee_department AS emp_dept
    ON emp.emp_no = emp_dept.emp_no
    
JOIN public.departments AS dept
    ON emp_dept.dept_no = dept.dept_no;

--list all employees whose first name is "Hercules" and last names begin with "B."

SELECT 
 emp.first_nm
,emp.last_nm

FROM public.employee AS emp

WHERE (emp.first_nm = 'Hercules' AND emp.last_nm like 'B%');

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
dept.dept_name
,emp.emp_no 
,emp.last_nm
,emp.first_nm

FROM public.employee AS emp

JOIN public.employee_department AS emp_dept
    ON emp.emp_no = emp_dept.emp_no
    
JOIN public.departments AS dept
    ON emp_dept.dept_no = dept.dept_no
    
WHERE dept.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
    --employee number, last name, first name, and department name.
    
SELECT 
dept.dept_name
,emp.emp_no 
,emp.last_nm
,emp.first_nm

FROM public.employee AS emp

JOIN public.employee_department AS emp_dept
    ON emp.emp_no = emp_dept.emp_no
    
JOIN public.departments AS dept
    ON emp_dept.dept_no = dept.dept_no
    
WHERE (dept.dept_name = 'Sales' OR dept.dept_name = 'Development');

-- descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 

 last_nm
,COUNT(last_nm)

FROM public.employee

GROUP BY last_nm

ORDER BY last_nm DESC

