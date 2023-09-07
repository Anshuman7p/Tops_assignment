#1. Write a query to display the last name, department number, department name for all employees. 

select department_id, last_name, department_name
from employees join departments
on employees.department_id = departments.department_id;

#2. Create a unique list of all jobs that are in departments. Include the location of the department in the output. 

select distinct department_name, street_address
from departments join locations
on departments.location_id = locations.location_id
group by department_id;

#3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select employees.last_name, departments.department_name, departments.location_id,locations.city
from employees join departments using(department_id) join locations using(location_id)
where commission_pct is not null;

#4. Display the employee last name and department name of all employees who have an 'a' in their last name 

select employees.last_name, departments.department_name
from employees join departments
on employees.department_id=departments.department_id
where last_name like '%a%';

#5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.

select employees.last_name, departments.department_id, departments.department_name
from employees join departments using(department_id) join locations using(location_id) join countries using(country_id)
where country_name = ATLANTA;

#6. Display the employee last name and employee number along with their manager's last name and manager number.

select employees.last_name,employees.employee_id,employees.manager_id
from employees;

#7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 


#8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 

select departments.department_name, employees.last_name, employees.employee_id
from employees join departments using (department_id)
order by department_name;

#9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

alter table employees add grade varchar(20);
select employees.first_name,employees.last_name, jobs.job_title, departments.department_name, employees.salary
from departments join employees using (department_id) join jobs using (job_id)
where grade('a') like salary >= 50000; 



#1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 

select concat(upper(substring(employees.last_name,2,1)),lower(substring(employees.last_name,3,4))) as modified
from employees;

#2. Write a query that displays the employee's first name and last name along with a " in 
#between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined

select concat(first_name,'-',last_name) as full_name, hire_date
from employees;

#3. Write a query to display the employee's last name and if half of the salary is greater than 
#ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
#1500 each. Provide each column an appropriate label. 

select employees.last_name,
case when (salary/2)>10000 then (salary+ (salary *10/100) +1500)
else(salary + (salary *11.5/100) + 1500)
end as sal
from employees;

#4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
#department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 

select concat(substring(employee_id,2),'00',substring(employee_id,3),'E') as newemp_id,
upper(substring(department_name,1, length(department_name))) as dep_name, salary
from employees join departments using(department_id)
order by newemp_id;

#5. Write a query that displays the employee's last names with the first letter capitalized and 
#all other letters lowercase, and the length of the names, for all employees whose name 
#starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 

select concat(upper(substring(last_name,1,1)), lower(substring(last_name,2,length(last_name)))) as new_name,
case when last_name like 'j%' or last_name like 'a%' or last_name like 'm%' then length(last_name)
else null
end as lenth_name
from employees
order by new_name;

#6. Create a query to display the last name and salary for all employees. Format the salary to 
#be 15 characters long, left-padded with $. Label the column SALARY 

select last_name, lpad(concat('$', salary),15, '$') as SALARY
from employees

#7. Display the employee's name if it is a palindrome.

select first_name
from employees
where first_name = reverse(first_name);

#8. Display First names of all employees with initcaps. 

select concat(upper(substring(first_name,1,1)), substring(first_name,2, length(first_name))) as new_name
from employees;

#9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.

select substring_index(substring_index(street_address,' ',2), " ", -1) as extract_value
from locations;




