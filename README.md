
# Employee Analysis using MySQL


## Purpose of the Project

The MySQL project has a variety of goals, one of which is to investigate the intricacies of the present organisational personnel landscape. The project looks for priceless insights by closely analysing pay structures in different departments and figuring out the hierarchical relationships between workers and their managers. The goal is to improve and optimise the analytical process so that more thorough and efficient analysis is possible by utilising the power of triggers, functions, and procedures. At the end of the day, the project aims to provide insight into current conditions while also clearing the path for future strategic planning and well-informed decisions.


## Database Overview

The Employee database is a relational database which contains 7 tables which has all the information about the employees and managers.

Table 1: departments

- dept_no : It contains the department number.
- dept_name : It contains the department name of each department.

Table 2: dept_emp

- emp_no : It contains the employee number of each employee.
- dept_no : It contains the department number.
- from_date : It contains the start date of each employee in that department.
- to_date : It contains the end date of each employee in that department.

Table 3: dept_manager

- emp_no : It contains the employee number of each employee.
- dept_no : It contains the department number.
- from_date : It contains the start date of each manager in that department.
- to_date : It contains the end date of each manager in that department.

Table 4: employees

- emp_no : It contains the employee number of each employee.
- birth_date : It contains birth date of employees.
- first_name : It contains first name of employees.
- last_name : It contains last name of employees.
- gender : It contains gender of employees.
- hire_date : It contains the date when the employee was first hired.

Table 5: emp_manager

- emp_no : It contains the employee number of each employee.
- dept_no : It contains the department number.
- manager_no : It contains a manager number of each manager.

Table 6: salaries

- emp_no : It contains the employee number of each employee.
- salaries : It contains the salary of each employee.
- from_date : It contains the start date of each employee on that salary package.
- to_date : It contains the end date of each employee on that salary package.

Table 7: titles

- emp_no : It contains the employee number of each employee.
- titles : It contains the title of each employee.
- from_date : It contains the start date of each employee on that title.
- to_date : It contains the end date of each employee on that title.

## Analysis of Problems

### Problem 1:

Find the average salary of the male and female employees in each department.

Answer: 

<img width="263" alt="Screenshot 2024-05-14 at 5 35 00 PM" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/5829d507-0a98-46d6-bf07-e4ad7652dcc5">


### Problem 2: 

Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.

Answer:

<img width="152" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/cdb6e65a-e63c-493f-9811-84ec18f25848">


### Problem 3:

Obtain a table containing the following three fields for all individuals whose employee number is not greater than 10040: 
- employee number 
- the lowest department number among the departments where the employee has worked in
- assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020, and '110039' to those whose number is between 10021 and 10040 inclusive. 
Use a CASE statement to create the third field. 

Answer:

<img width="108" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/02cfba83-d908-4e8f-8888-85682675f372">


### Problem 4:

Retrieve a list of all employees that have been hired in 2000.

Answer:

<img width="84" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/9736c015-886b-4c9b-b86e-073b3fb49606">


### Problem 5:

Retrieve a list of all employees from the ‘titles’ table who are engineers. Repeat the same thing, this time retrieving a list of all employees from the ‘titles’ table who are senior engineers. 

Answer:
(Following image is the initial part of the solution.)

<img width="191" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/c39183bc-f4e1-4b09-8564-c1053609ef60">


### Problem 6:

Create a procedure that asks you to insert an employee number and that will obtain an output containing the same number, as well as the number and name of the last department the employee has worked in. 
Finally, call the procedure for employee number 10010. 

Answer: 

<img width="150" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/a11487fa-f749-4b3c-8bc4-17d136a13d35">


### Problem 7:

How many contracts have been registered in the ‘salaries’ table with a duration of more than one year and of value higher than or equal to $100,000? 

Answer:

<img width="85" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/04465117-8854-40a5-bfde-f3c28fddd39a">


### Problem 8:

Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the hire date to equal the current date. Format the output appropriately (YY-mm-dd). 
Extra challenge: You can try to declare a new variable called 'today' which stores today's data, and then use it in your trigger! 
After creating the trigger, execute the following code to see if it's working properly.


Answer:

Please check the code from the file.


### Problem 9:

Define a function that retrieves the largest contract salary value of an employee. Apply it to employee number 11356. 
In addition, what is the lowest contract salary value of the same employee? You may want to create a new function to obtain the result.

Answer:

<img width="122" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/b01b3dbd-af6e-4882-8d89-e603c96d63bf">

<img width="130" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/8a42c743-965e-4da3-afdc-0df930d8f045">


### Problem 10:

Based on the previous exercise, you can now try to create a third function that also accepts a second parameter. Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on that retrieve either the lowest or the highest salary, respectively (using the same logic and code structure from question 9). If the inserted value is any string value different from ‘min’ or ‘max’, let the function return the difference between the highest and the lowest salary of that employee.

Answer:

<img width="108" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/341bcfa2-a1b8-4cd0-adbf-2e8d41f791af">

<img width="108" alt="image" src="https://github.com/prathameshrode/Employee-Analysis-using-MySQL/assets/137455491/48d13091-ddca-4df7-bea7-037997744c52">
