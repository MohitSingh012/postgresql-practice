
-- PostgreSQL Practice
-- Topic: Indexes and Query Performance

-- =====================================
-- 1. CREATE A SAMPLE TABLE
-- =====================================

CREATE TABLE IF NOT EXISTS index_employees (
    employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary NUMERIC(10,2),
    city VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

-- Insert sample data
INSERT INTO index_employees
(employee_name, department, salary, city, is_active)
VALUES
('Rahul', 'IT', 50000, 'Delhi', TRUE),
('Aman', 'HR', 35000, 'Mumbai', TRUE),
('Priya', 'IT', 60000, 'Pune', TRUE),
('Karan', 'Finance', 45000, 'Delhi', FALSE),
('Neha', 'IT', 70000, 'Mumbai', TRUE),
('Rohan', 'HR', 40000, 'Pune', TRUE);

-- =====================================
-- 2. CREATE A BASIC INDEX
-- =====================================

CREATE INDEX IF NOT EXISTS idx_employee_city
ON index_employees(city);

-- Search using city
SELECT *
FROM index_employees
WHERE city = 'Delhi';

-- =====================================
-- 3. UNIQUE INDEX
-- =====================================

CREATE UNIQUE INDEX IF NOT EXISTS
idx_employee_unique_name
ON index_employees(employee_name);

-- =====================================
-- 4. COMPOSITE INDEX
-- =====================================

CREATE INDEX IF NOT EXISTS
idx_department_salary
ON index_employees(department, salary);

-- Search using both columns
SELECT *
FROM index_employees
WHERE department = 'IT'
AND salary > 50000;

-- =====================================
-- 5. PARTIAL INDEX
-- =====================================

CREATE INDEX IF NOT EXISTS
idx_active_employees
ON index_employees(employee_id)
WHERE is_active = TRUE;

-- Query active employees
SELECT *
FROM index_employees
WHERE is_active = TRUE;

-- =====================================
-- 6. EXPLAIN
-- =====================================

EXPLAIN
SELECT *
FROM index_employees
WHERE city = 'Delhi';

-- =====================================
-- 7. EXPLAIN ANALYZE
-- =====================================

EXPLAIN ANALYZE
SELECT *
FROM index_employees
WHERE city = 'Delhi';

-- =====================================
-- 8. VIEW EXISTING INDEXES
-- =====================================

SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename = 'index_employees';

-- =====================================
-- 9. DROP AN INDEX
-- =====================================

-- Uncomment when you want to remove an index:
-- DROP INDEX idx_employee_city;
