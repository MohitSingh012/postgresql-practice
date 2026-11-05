
-- PostgreSQL NULL Handling Practice

CREATE TABLE IF NOT EXISTS employees_null (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary NUMERIC(10,2),
    bonus NUMERIC(10,2)
);

-- Insert sample records
INSERT INTO employees_null VALUES
(1, 'Rahul', 'IT', 40000, 5000),
(2, 'Aman', 'HR', 35000, NULL),
(3, 'Priya', NULL, 45000, 7000),
(4, 'Karan', 'Finance', NULL, NULL);

-- 1. COALESCE
-- Returns the first non-NULL value
SELECT
    employee_name,
    COALESCE(department, 'Not Assigned') AS department
FROM employees_null;

-- 2. NULLIF
-- Returns NULL when both expressions are equal
SELECT NULLIF(100, 100) AS result;

-- 3. Handle NULL salary
SELECT
    employee_name,
    COALESCE(salary, 0) AS salary
FROM employees_null;

-- 4. Calculate total compensation
SELECT
    employee_name,
    COALESCE(salary, 0) +
    COALESCE(bonus, 0) AS total_compensation
FROM employees_null;

-- 5. Find records with missing salary
SELECT *
FROM employees_null
WHERE salary IS NULL;

-- 6. Replace NULL values in calculations
SELECT
    employee_name,
    salary,
    bonus,
    COALESCE(salary, 0) + COALESCE(bonus, 0) AS total
FROM employees_null;
