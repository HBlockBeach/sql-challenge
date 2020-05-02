# Schema
CREATE TABLE  departments  (<br>
     dept_no  varchar(10)   NOT NULL,<br>
     dept_name  varchar(100)   NOT NULL,<br>
    CONSTRAINT  pk_departments  PRIMARY KEY (<br>
         dept_no <br>
     )<br>
);<br>

CREATE TABLE  employee_department  (<br>
     emp_no  bigint   NOT NULL,<br>
     dept_no  varchar(10)   NOT NULL,<br>
     from_date  date   NOT NULL,<br>
     to_date  date   NOT NULL<br>
);<br>

CREATE TABLE  department_manager  (<br>
     dept_no  varchar(10)   NOT NULL,<br>
     emp_no  bigint   NOT NULL,<br>
     from_date  date   NOT NULL,<br>
     to_date  date   NOT NULL<br>
);<br>

CREATE TABLE  employee  (<br>
     emp_no  bigint   NOT NULL,<br>
     DOB  date   NOT NULL,<br>
     first_nm  varchar(100)   NOT NULL,<br>
     last_nm  varchar(100)   NOT NULL,<br>
     gender  varchar(10)   NOT NULL,<br>
     hire_date  date   NOT NULL,<br>
    CONSTRAINT  pk_employee  PRIMARY KEY (<br>
         emp_no <br>
     )<br>
);<br>

CREATE TABLE  salaries  (<br>
     emp_no  bigint   NOT NULL,<br>
     salary  float   NOT NULL,<br>
     from_date  date   NOT NULL,<br>
     to_date  date   NOT NULL<br>
);<br>

CREATE TABLE  titles  (<br>
     emp_no  bigint   NOT NULL,<br>
     title  varchar(100)   NOT NULL,<br>
     from_date  date   NOT NULL,<br>
     to_date  date   NOT NULL<br>
);<br>

ALTER TABLE  employee_department  <br>ADD CONSTRAINT  fk_employee_department_emp_no <br> FOREIGN KEY( emp_no )<br>
REFERENCES  employee  ( emp_no );<br>

ALTER TABLE  employee_department  <br>ADD CONSTRAINT  fk_employee_department_dept_no <br> FOREIGN KEY( dept_no )<br>
REFERENCES  departments  ( dept_no );<br>

ALTER TABLE  department_manager  <br>ADD CONSTRAINT  fk_department_manager_dept_no <br> FOREIGN KEY( dept_no )<br>
REFERENCES  departments  ( dept_no );<br>

ALTER TABLE  department_manager  <br>ADD CONSTRAINT  fk_department_manager_emp_no <br> FOREIGN KEY( emp_no )<br>
REFERENCES  employee  ( emp_no );<br>

ALTER TABLE  salaries  <br>ADD CONSTRAINT  fk_salaries_emp_no  <br>FOREIGN KEY( emp_no )
REFERENCES  employee  ( emp_no );<br>

ALTER TABLE  titles  <br>ADD CONSTRAINT  fk_titles_emp_no <br> FOREIGN KEY( emp_no )
REFERENCES  employee  ( emp_no );


