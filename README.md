# Employee Payroll Management System

A MySQL-based database project for managing employee information,
departments, attendance, and monthly payroll records. The project
demonstrates relational database design and commonly used SQL concepts
through a practical employee payroll scenario.

## Project Team

-   **Kondapali Uday Kumar**
-   **Chinni Bhanu Prakash**

## Project Objective

The objective is to design and implement a relational database that
helps an organization maintain employee and department details, record
daily attendance and overtime, manage monthly salary information, track
payment status, and generate useful reports for HR and finance teams.

## Problem Statement

Managing employee details, attendance, deductions, and salary payments
manually can be difficult and error-prone. This project organizes those
records in a MySQL database so that information can be stored
consistently and retrieved through SQL queries.

## Database Structure

The database is named `sql_project` and contains four main tables:

  -----------------------------------------------------------------------
  Table                               Purpose
  ----------------------------------- -----------------------------------
  `Departments`                       Stores department names and their
                                      locations.

  `Employees`                         Stores employee contact details,
                                      job titles, hire dates, salaries,
                                      department references, and
                                      employment status.

  `Attendance`                        Stores daily attendance status and
                                      overtime hours for employees.

  `Payroll`                           Stores monthly salary details,
                                      allowances, deductions, net salary,
                                      payment date, and payment status.
  -----------------------------------------------------------------------

### Relationships

-   One department can have multiple employees.
-   One employee can have multiple attendance records.
-   One employee can have multiple payroll records.
-   Foreign keys connect employees to departments and connect attendance
    and payroll records to employees.

### Simplified ER relationship

``` text
Departments (1) ───── (M) Employees
                           │
                    ┌──────┴──────┐
                    │             │
                   (M)           (M)
                Attendance     Payroll
```

## Technologies Used

-   **Database:** MySQL
-   **SQL environment:** MySQL Workbench (as used during project
    development)
-   **Project assets:** SQL script, ER diagram, project report, and
    presentation

## Repository Files

  ------------------------------------------------------------------------------
  File                                       Description
  ------------------------------------------ -----------------------------------
  `sql_project.sql`                          SQL script containing database
                                             creation, table definitions, sample
                                             data, and project queries.

  `Employee_payroll system.pdf`              Project report describing the
                                             objective, database design, sample
                                             data, and business-report
                                             requirements.

  `Employee_Payroll_System_PPT_Final.pptx`   Project presentation covering the
                                             database design and demonstrated
                                             SQL concepts.

  `erdplus.png`                              Entity Relationship Diagram image
                                             for the database.
  ------------------------------------------------------------------------------

## Getting Started

### 1. Install MySQL

Install MySQL Server and, optionally, MySQL Workbench.

### 2. Download or clone the repository

``` bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd SQL_PROJECT_REPOSITORY
```

Replace `<YOUR_GITHUB_REPOSITORY_URL>` with the URL of this GitHub
repository.

### 3. Open the SQL script

Open `sql_project.sql` in MySQL Workbench or another MySQL client.

### 4. Execute the script

Run the script in order. It creates and selects the database, creates
the tables, inserts sample records, and runs the SQL statements included
in the file.

The database setup begins with:

``` sql
CREATE DATABASE sql_project;
USE sql_project;
```

### 5. Verify the tables and sample data

After executing the relevant statements, you can inspect the tables
with:

``` sql
SHOW TABLES;

SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Attendance;
SELECT * FROM Payroll;
```

> **Note:** Execute the script in sequence because later statements
> depend on tables and records created earlier. If you run it more than
> once, existing database objects or records may need to be removed or
> reset first.

## SQL Concepts Demonstrated

The project covers the following SQL topics:

-   **DDL:** Creating the database and tables, defining primary keys and
    foreign keys.
-   **DML:** Inserting, updating, and deleting records.
-   **DQL:** Retrieving data using `SELECT`, filtering, and
    sorting-related query patterns.
-   **CRUD operations:** Create, Read, Update, and Delete.
-   **Constraints and relationships:** Primary keys and foreign keys.
-   **Operators:** `IN`, `BETWEEN`, `AND`, and `OR`.
-   **Aggregate functions:** `COUNT()`, `SUM()`, `AVG()`, `MAX()`, and
    `MIN()`.
-   **Grouping:** `GROUP BY` and `HAVING`.
-   **Numeric functions:** `CEIL()`, `FLOOR()`, and `ROUND()`.
-   **String functions:** `UPPER()`, `LOWER()`, `CONCAT()`, `LENGTH()`,
    and `SUBSTRING()`.
-   **Date functions:** `CURDATE()`, `MONTH()`, `DAY()`, and
    `TIMESTAMPDIFF()`.
-   **Set operations:** `UNION`, with set-difference and intersection
    requirements included in the project exercises.
-   **Joins:** Combining employee, department, attendance, and payroll
    data.
-   **Subqueries:** Single-result and correlated-query patterns.
-   **Views:** Creating reusable views for employee details and monthly
    payroll.
-   **TCL:** `START TRANSACTION`, `COMMIT`, `SAVEPOINT`, and `ROLLBACK`.
-   **Stored procedures and triggers:** Included as project requirements
    and procedure/trigger examples in the presentation.

## Example Queries

### Display employees with their department names

``` sql
SELECT
    e.emp_name,
    d.dept_name,
    d.location
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.dept_id = d.dept_id;
```

### Display the employee count and salary statistics by department

``` sql
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    AVG(basic_salary) AS average_salary,
    MAX(basic_salary) AS highest_salary,
    MIN(basic_salary) AS lowest_salary
FROM Employees
GROUP BY dept_id;
```

### Generate a monthly payroll report

``` sql
SELECT
    e.emp_name,
    d.dept_name,
    p.pay_month,
    p.basic_salary,
    p.allowances,
    p.deductions,
    p.net_salary,
    p.payment_status
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.dept_id = d.dept_id
INNER JOIN Payroll AS p
    ON e.emp_id = p.emp_id;
```

## Reports and Use Cases

The project SQL exercises cover practical questions such as:

-   Listing employees by department and employment status.
-   Finding salary ranges and department-wise salary statistics.
-   Calculating total payroll expenditure and each employee's
    contribution.
-   Displaying attendance dates, statuses, and overtime hours.
-   Preparing employee and monthly payroll reports using joins.
-   Finding employees without payroll records.
-   Comparing employee salaries with organization-wide or
    department-wise averages.
-   Managing payroll changes using transactions.

## Important Implementation Notes

-   The SQL script is the source of truth for the statements currently
    included in the repository. The PDF and PowerPoint provide
    supporting project documentation.
-   The SQL file contains calls to stored procedures such as
    `Get_Employees_By_Dept`, `Get_attendance_details`, and
    `Get_Dept_Payroll`; ensure their `CREATE PROCEDURE` definitions are
    present in the script or create them before running those calls.
-   The project exercises mention `INTERSECT` and `EXCEPT`. Check
    compatibility with your MySQL version before using these operators;
    equivalent queries can also be written with joins or
    `EXISTS`/`NOT EXISTS`.
-   The sample data is for demonstration and learning purposes, not real
    employee or payroll information.

## Future Enhancements

-   Add a user interface for HR staff to manage employee records.
-   Add role-based access for HR and finance users.
-   Automate payroll calculations from attendance and salary rules.
-   Generate downloadable monthly payslips.
-   Add validation rules and audit history for payroll changes.

## Contributors

-   **Kondapali Uday Kumar**
-   **Chinni Bhanu Prakash**

