create database sql_project;
use sql_project;

create table Departments(dept_id int primary key, dept_name varchar(50) , location varchar(50));

INSERT INTO Departments VALUES(1, 'Human Resources', 'Hyderabad'),(2, 'Finance',
'Bengaluru'), (3, 'Information Technology', 'Vijayawada'), (4, 'Marketing', 'Chennai');

select * from departments;

create table Employees(emp_id int Primary Key, emp_name varchar(50) , phone int, email varchar(50), job_title varchar(50), hire_date date, basic_salary decimal,
dept_id int, foreign key(dept_id) references departments(dept_id) , employment_status varchar(50));

INSERT INTO Employees VALUES
(101, 'Aarav Sharma', '9000000101', 'aarav@company.com', 'HR Executive', '2021-06-15',
45000, 1, 'Active'),
(102, 'Bhavya Reddy', '9000000102', 'bhavya@company.com', 'Accountant', '2020-03-10',
52000, 2, 'Active'),
(103, 'Charan Kumar', '9000000103', 'charan@company.com', 'Software Developer', '2022-01-20', 38000, 3, 'Active'),
(104, 'Divya Rao', '9000000104', 'divya@company.com', 'HR Manager', '2019-08-05', 60000,
1, 'Active'),
(105, 'Farhan Ali', '9000000105', 'farhan@company.com', 'Marketing Executive', '2023-04-12', 35000, 4, 'Active'),
(106, 'Geetha Nair', '9000000106', 'geetha@company.com', 'Financial Analyst', '2021-11-18', 42000, 2, 'Active'),
(107, 'Harish Varma', '9000000107', 'harish@company.com', 'System Administrator', '2020-07-22', 48000, 3, 'Active'),
(108, 'Ishita Singh', '9000000108', 'ishita@company.com', 'Marketing Manager', '2018-05-14', 55000, 4, 'Active'),
(109, 'Kiran Teja', '9000000109', 'kiran@company.com', 'HR Assistant', '2024-02-01',
40000, 1, 'Active'),
(110, 'Lavanya Devi', '9000000110', 'lavanya@company.com', 'Junior Accountant', '2023-09-11', 32000, 2, 'Active');

select * from employees;

create table Attendance(attendance_id int primary key, emp_id int, Foreign Key(emp_id) references employees(emp_id), attendance_date date, attendance_status varchar(50),
overtime_hours int);
INSERT INTO Attendance VALUES
(501, 101, '2026-10-01', 'Present', 1.5), (502, 101, '2026-10-02', 'Present', 0),(503, 102,
'2026-10-01', 'Present', 0), (504, 102, '2026-10-02', 'Absent', 0), (505, 103, '2026-10-01',
'Present', 2), (506, 103, '2026-10-02', 'Present', 0), (507, 104, '2026-10-01', 'Leave', 0), (508,
104, '2026-10-02', 'Present', 1), (509, 105, '2026-10-01', 'Present', 0),(510, 106, '2026-10-01', 'Present', 0.5), (511, 107, '2026-10-01', 'Absent', 0), (512, 108, '2026-10-01', 'Present',1), (513, 109, '2026-10-01', 'Present', 0), (514, 110, '2026-10-01', 'Present', 0), (515, 110,
'2026-10-02', 'Present', 2);
select * from Attendance;



create table Payroll(payroll_id int Primary Key, emp_id int, Foreign Key(emp_id) references employees(emp_id), pay_month date, basic_salary decimal, allowances decimal, 
deductions decimal,net_salary decimal, payment_date date, payment_status varchar(50));
INSERT INTO Payroll VALUES
(601, 101, '2026-10-01', 45000, 5000, 2000, 48000, '2026-10-31', 'Paid'),
(602, 102, '2026-10-01', 52000, 6000, 2500, 55500, '2026-10-31', 'Paid'),
(603, 103, '2026-10-01', 38000, 4000, 1500, 40500, '2026-10-31', 'Paid'),
(604, 104, '2026-10-01', 60000, 8000, 3000, 65000, '2026-10-31', 'Paid'),
(605, 105, '2026-10-01', 35000, 3500, 1000, 37500, '2026-10-31', 'Paid'),
(606, 106, '2026-10-01', 42000, 4500, 1800, 44700, '2026-10-31', 'Paid'),
(607, 107, '2026-10-01', 48000, 5000, 2200, 50800, '2026-10-31', 'Paid'),
(608, 108, '2026-10-01', 55000, 7000, 2800, 59200, '2026-10-31', 'Paid'),
(609, 109, '2026-10-01', 40000, 4000, 1200, 42800, '2026-10-31', 'Pending');
select * from payroll;

# -------------------------------     QUESTIONS AND ANSWERES -------------------------------------
#1. Display all employee details from the Employees table.
select * from employees;

# 2. Display employee names, job titles and basic salaries of employees belonging to department ID 2.
select emp_name, job_title, basic_salary from employees where dept_id = 2;

#3. Retrieve the distinct job titles available in the organization.
select distinct job_title from employees;

#4. Find employees whose employment status is either Active or Inactive using the IN operator.
select emp_name from employees where employment_status in ('active', 'inactive');

#5. Display employees whose basic salary is between ₹35,000 and ₹50,000 using BETWEEN.
select emp_name from employees where basic_salary between 35000 and 50000;

#6. Find employees who belong to department ID 1 or department ID 3 and whose basic salary is greater than ₹40,000.
select emp_name from employees where dept_id = 1 or dept_id = 3 and basic_salary > 40000;

# 7. Calculate the total number of employees working in each department.
select * from employees;
select dept_id, count(emp_id) from employees group by dept_id;

# 8. Find the average, maximum and minimum basic salary for each department.
select dept_id, avg(basic_salary), max(basic_salary),min(basic_salary) from employees group by dept_id;

# 9. Calculate the total salary expenditure of the organization using the net_salary column in the Payroll table.
select * from payroll;
select sum(net_salary) as total_salary from payroll;

# 10. Display the ceiling and floor values of each employee's net salary.
select ceil(net_salary), floor(net_salary) from payroll;

# 11. Calculate the percentage contribution of each employee's net salary towards the total monthly payroll expenditure. 
    # Round the result to two decimal places.
select * from employees;
select * from payroll;
select e.emp_name, e.emp_id, p.net_salary, round(net_salary/ (select sum(net_salary) from payroll) * 100,2) as total_contribution from payroll p join employees e
 on e.emp_id = p.emp_id;

# 12. Display employee names in uppercase and their email addresses in lowercase.
select upper(emp_name), lower(email) from employees;

# 13. Generate an employee identification display by concatenating the employee’s name and employee ID. Example: Aarav Sharma - 101.
select concat(emp_name, ' - ', emp_id) from employees;

# 14. Display the length of each employee's name and extract the first four characters of their name.
select emp_name,length(emp_name), substring(emp_name,1,4) from employees;

# 15. Display employee names along with their completed years of experience in the organization using an appropriate date function.
select emp_name, timestampdiff(year,hire_date,curdate()) as years_of_experience from employees;

# 16. Display attendance dates with their corresponding month names and day names.
select * from employees;
select * from departments;
select * from payroll;
select * from Attendance;
select attendance_date, month(attendance_date),day(attendance_date) from attendance;

# 17. Calculate the number of days each employee has been working in the organization from their hire date.
select emp_name, timestampdiff(day, hire_date, curdate()) as total_working_days from employees;

# 18. Display a combined list of employee names and department names using UNION.
select emp_name from employees union select dept_name from departments;

# 19. Display employee IDs who have both attendance records and payroll records using INTERSECT.
select * from Attendance;
select * from payroll;
select emp_id from attendance union select emp_id from payroll;

# 20. Find employee IDs who are present in the Employees table but do not have any payroll records using EXCEPT.
select emp_id from employees except select emp_id from payroll;
select e.emp_id from employees e left join payroll p on e.emp_id = p.emp_id where p.emp_id is null;

# 21. Display employee names along with their department names and locations.
select * from Attendance;
select * from employees;
select * from departments;
select * from payroll;

select e.emp_name, d.dept_name, d.location from employees e join departments d on e.dept_id = d.dept_id;

# 22. Display employee names, attendance dates and attendance statuses for all attendance records.
select e.emp_name, a.attendance_date, a.attendance_status from attendance a left join employees e on e.emp_id = a.emp_id;

# 23. Generate a monthly salary report displaying employee name, department name, basic salary, allowances, deductions and net salary.
select e.emp_name, d.dept_name, e.basic_salary, p.allowances, p.deductions, p.net_salary from employees e join departments d on e.dept_id = d.dept_id join payroll p 
on e.emp_id = p.emp_id;  

# 24. Display employee names, their attendance dates and overtime hours, including employees who do not have any attendance records.
select e.emp_name, a.attendance_date, a.overtime_hours from employees e left join attendance a on e.emp_id = a.emp_id ; 

# 25. Display department names along with the total number of employees and their combined basic salaries, including departments that have no employees.
select d.dept_name, count(e.emp_id), sum(e.basic_salary) from departments d left join employees e on e.dept_id = d.dept_id group by d.dept_name;

# 26. Find employees whose basic salary is greater than the average basic salary of all employees.
select emp_name,basic_salary from employees where basic_salary > (select avg(basic_salary) from employees);

# 27. Find the employee or employees who receive the highest net salary.
select emp_name from employees where emp_id in (select emp_id from payroll where net_salary = (select max(net_salary) from payroll));

# 28. Display employees whose net salary is greater than the average net salary of their respective departments.
select * from payroll;
select * from employees;
select e.emp_name,p.net_salary from employees e join payroll p on e.emp_id = p.emp_id where p.net_salary > 
(select avg(p2.net_salary) from payroll p2 join employees e1 on e1.emp_id = p2.emp_id where e.dept_id = e1.dept_id);

# 29. Find employees who have not received any payroll records using NOT EXISTS.
select e.emp_name from employees e where not exists(select 1 from payroll p where p.emp_id = e.emp_id);
select e.emp_name from employees e left join payroll p on e.emp_id = p.emp_id where p.payroll_id  is null; 

# 30. Find departments whose total monthly net salary expenditure is greater than the average department-wise salary expenditure.
select * from payroll;
select * from employees;
select * from departments;
select d.dept_name, sum(p.net_salary) from departments d join employees e on e.dept_id = d.dept_id join payroll p on e.emp_id = p.emp_id group by d.dept_name
having sum(p.net_salary) > (select avg(dept_total) from 
(select sum(p2.net_salary) as dept_total from employees e2 join payroll p2 on e2.emp_id = p2.emp_id group by e2.dept_id) as t);

# 31. Create a view named Employee_Details_View to display employee name, job title, department name, hire date and basic salary.
create view employee_details_view as 
select e.emp_name, e.job_title, d.dept_name,e.hire_date, e.basic_salary from employees e join departments d on e.dept_id = d.dept_id;
select * from employee_details_view;

# 32. Create a view named Monthly_Payroll_View to display employee name, department name, pay month, basic salary, allowances, deductions and net salary.
create view Monthly_Payroll_View as 
select e.emp_name, d.dept_name, p.pay_month, p.basic_salary, p.allowances, p.deductions, p.net_salary from employees e join departments d on e.dept_id = d.dept_id
join payroll p on e.emp_id = p.emp_id;
select * from Monthly_Payroll_View;

# 33. Demonstrate COMMIT by updating an employee's payroll allowance and corresponding net salary, then permanently save the changes.
select * from payroll;
start Transaction;
update payroll set allowances = allowances + 2000 , net_salary = net_salary + 2000 where emp_id = 101;
commit;

# 34. Demonstrate SAVEPOINT and ROLLBACK by performing two payroll updates within a single transaction. 
               #Use a savepoint to reverse the second update while retaining the firstupdate, and then commit the changes.
start transaction;
update payroll set allowances = allowances + 2000 , net_salary = net_salary + 2000 where emp_id = 107;
savepoint sp1;
update payroll set allowances = allowances + 2000 , net_salary = net_salary + 2000 where emp_id = 109;
rollback to sp1;
commit;

select * from PAYROLL;

# 35. Create a stored procedure that accepts a department ID as an IN parameter and displays all employees belonging to that department along with their
     # job titles and basic salaries.
select * from employees;
call Get_Employees_By_Dept(3);

     
# 36. Create a stored procedure that accepts an employee ID as an IN parameter and displays the employee's attendance details,
     # including present days, absent days and leave days.
select * from Attendance;
call Get_attendance_details(102);


# 37. Create a stored procedure that accepts a department ID as an IN parameter and returns the total monthly payroll expenditure of that department using an OUT parameter.
select * from payroll;
CALL Get_Dept_Payroll(3, @total);
SELECT @total AS total_monthly_expenditure;


# 38. Create a BEFORE INSERT trigger on the Payroll table to automatically set allowances to 2000 if the allowance value is NULL.
INSERT INTO Payroll
(emp_id, pay_month, basic_salary, allowances, deductions, net_salary)
VALUES
(101, '2026-11-01', 30000, NULL, 2000, 30000);

SELECT * FROM Payroll;

# 39. Create a BEFORE INSERT trigger on the Attendance table to automatically set the attendance status to 'Present' if no status is provided.
INSERT INTO Attendance
(emp_id, attendance_date, attendance_status, overtime_hours)
VALUES
(101, '2026-11-09', NULL, 0);
SELECT * FROM Attendance;


