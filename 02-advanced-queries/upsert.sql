
-- PostgreSQL UPSERT Practice

-- Insert a new customer
INSERT INTO customers (name, email, city)
VALUES ('Mohit Singh', 'mohit@example.com', 'Mathura')
ON CONFLICT (email)
DO UPDATE SET
    city = EXCLUDED.city;

-- Try inserting the same email with a different city
INSERT INTO customers (name, email, city)
VALUES ('Mohit Singh', 'mohit@example.com', 'Delhi')
ON CONFLICT (email)
DO UPDATE SET
    city = EXCLUDED.city;

-- Check result
SELECT * FROM customers
WHERE email = 'mohit@example.com';
