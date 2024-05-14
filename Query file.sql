USE employees;

#Question 1;
SELECT 
	d.dept_name,
    e.gender,
    AVG(s.salary) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY e.gender, d.dept_no
ORDER BY dept_name;

#Question 2;
SELECT MIN(dept_no) AS lowest_dept_num, MAX(dept_no) AS highest_dept_num
FROM dept_emp;

#Question 3;
SELECT 
	d.emp_no,
	d.dept_no,
	(CASE WHEN emp_no <=10020 THEN 110022 
		WHEN emp_no >= 10021 AND emp_no <= 10040 THEN 110039
	END) AS manager
FROM 
	(SELECT MIN(dept_no) AS dept_no, emp_no 
	FROM dept_emp GROUP BY emp_no) AS d
WHERE emp_no <= 10040;

#Question 4;
SELECT emp_no, hire_date 
FROM employees 
WHERE YEAR(hire_date) = 2000;

#Question 5;
SELECT * FROM titles
WHERE title LIKE "%Engineer%";

SELECT * FROM titles 
WHERE title LIKE "%Senior Engineer%";

#Question 6;
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_emp_no INT)
BEGIN 
	SELECT e.emp_no, d.dept_no, d.dept_name
    FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    WHERE de.emp_no = p_emp_no AND 
     de.from_date = (SELECT MAX(from_date) FROM dept_emp WHERE emp_no = p_emp_no)
	GROUP BY emp_no, dept_no;
END$$

DELIMITER ;

CALL emp_info(10010);

#Question 7;
SELECT COUNT(emp_no)
FROM salaries 
WHERE salary >= 100000 AND 
	DATEDIFF(to_date, from_date) > 365;
	
#Question 8;
DROP TRIGGER IF EXISTS hire_date_check;

DELIMITER $$
CREATE TRIGGER hire_date_check 
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	DECLARE today DATE;
    SELECT date_format(SYSDATE(),'YY-mm-dd') INTO today;
    
	IF NEW.hire_date > today THEN 
		SET NEW.hire_date = today;
	END IF;
END $$

DELIMITER ;

# Question 9;
DROP FUNCTION IF EXISTS high_contract_value;

DELIMITER $$
CREATE FUNCTION high_contract_value (f_emp_no INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE high_con_value DECIMAL(10,2);
    SELECT MAX(s.salary) 
    INTO high_con_value
    FROM salaries s
    JOIN employees e ON s.emp_no = e.emp_no
    WHERE e.emp_no = f_emp_no
    GROUP BY e.emp_no;
    RETURN high_con_value;
END$$
DELIMITER ;

SELECT high_contract_value(11356);

DROP FUNCTION IF EXISTS low_contract_value;

DELIMITER $$
CREATE FUNCTION low_contract_value (p_emp_no INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE low_con_value DECIMAL(10,2);
    
    SELECT MIN(s.salary)
    INTO low_con_value
    FROM salaries s
    JOIN employees e ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no
    GROUP BY e.emp_no;
    RETURN low_con_value;
END$$
DELIMITER ;

SELECT low_contract_value(11365);

#Question 10;
DROP FUNCTION IF EXISTS new_salary;

DELIMITER $$
CREATE FUNCTION new_salary(p_emp_no INT, min_max VARCHAR(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE new_salary_info DECIMAL(10,2);
    
    SELECT CASE
		WHEN min_max = 'min' THEN MIN(s.salary)
        WHEN min_max = 'max' THEN MAX(s.salary)
        ELSE MAX(s.salary)-MIN(s.salary)
        END AS info
	INTO new_salary_info
    FROM salaries s
    JOIN employees e ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no;
    RETURN new_salary_info;
END$$
DELIMITER ;

SELECT new_salary(11356,'min');
SELECT new_salary(11356,'max');