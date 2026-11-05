
-- PostgreSQL Date and Time Functions Practice

CREATE TABLE IF NOT EXISTS employee_dates (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    joining_date DATE,
    last_login TIMESTAMP
);

-- Insert sample records
INSERT INTO employee_dates VALUES
(1, 'Rahul', '2022-01-15', '2026-11-05 09:30:00'),
(2, 'Aman', '2023-06-20', '2026-11-04 18:45:00'),
(3, 'Priya', '2021-03-10', '2026-11-03 12:15:00');

-- 1. Current date and time
SELECT NOW();

-- 2. Current date
SELECT CURRENT_DATE;

-- 3. Current time
SELECT CURRENT_TIME;

-- 4. Extract year, month and day
SELECT
    employee_name,
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    EXTRACT(MONTH FROM joining_date) AS joining_month,
    EXTRACT(DAY FROM joining_date) AS joining_day
FROM employee_dates;

-- 5. Calculate employee experience
SELECT
    employee_name,
    AGE(CURRENT_DATE, joining_date) AS experience
FROM employee_dates;

-- 6. Extract date parts
SELECT
    employee_name,
    DATE_PART('year', AGE(CURRENT_DATE, joining_date))
    AS experience_years
FROM employee_dates;

-- 7. Add an interval
SELECT
    employee_name,
    joining_date,
    joining_date + INTERVAL '6 months' AS six_months_later
FROM employee_dates;

-- 8. Calculate days since last login
SELECT
    employee_name,
    CURRENT_DATE - last_login::DATE AS days_since_login
FROM employee_dates;

-- 9. Filter employees who joined after 2022
SELECT *
FROM employee_dates
WHERE joining_date > DATE '2022-01-01';

-- 10. Format dates
SELECT
    employee_name,
    TO_CHAR(joining_date, 'DD Mon YYYY') AS formatted_date
FROM employee_dates;
