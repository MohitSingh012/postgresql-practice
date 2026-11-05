
-- PostgreSQL Practice
-- Topic: Sequences and UUID

-- =====================================
-- 1. CREATE A SEQUENCE
-- =====================================

CREATE SEQUENCE IF NOT EXISTS employee_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1;

-- Generate IDs using NEXTVAL
SELECT NEXTVAL('employee_id_seq');
SELECT NEXTVAL('employee_id_seq');
SELECT NEXTVAL('employee_id_seq');

-- =====================================
-- 2. CURRVAL
-- =====================================

-- Returns the most recently generated value
-- in the current database session.

SELECT CURRVAL('employee_id_seq');

-- =====================================
-- 3. SETVAL
-- =====================================

-- Set sequence value to 100.
-- The next NEXTVAL will return 101.

SELECT SETVAL('employee_id_seq', 100);

SELECT NEXTVAL('employee_id_seq');

-- =====================================
-- 4. CREATE TABLE USING SEQUENCE
-- =====================================

CREATE TABLE IF NOT EXISTS sequence_employees (
    employee_id INT DEFAULT NEXTVAL('employee_id_seq') PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL
);

INSERT INTO sequence_employees (employee_name)
VALUES
('Rahul'),
('Aman'),
('Priya');

SELECT * FROM sequence_employees;

-- =====================================
-- 5. UUID
-- =====================================

-- Generate UUID values

SELECT GEN_RANDOM_UUID();

-- Create table using UUID

CREATE TABLE IF NOT EXISTS uuid_employees (
    employee_id UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

INSERT INTO uuid_employees (employee_name, email)
VALUES
('Rahul', 'rahul@company.com'),
('Aman', 'aman@company.com'),
('Priya', 'priya@company.com');

SELECT * FROM uuid_employees;

-- =====================================
-- 6. UUID VS INTEGER ID
-- =====================================

SELECT
    employee_id,
    employee_name
FROM uuid_employees;
