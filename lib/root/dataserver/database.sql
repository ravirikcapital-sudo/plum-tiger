-- Create the database (only once)
CREATE DATABASE registration_db;

-- Switch to the new database
\c registration_db;

-- Create the table to store form data
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mobile VARCHAR(20),
    city VARCHAR(100),
    gender VARCHAR(10)
);

SELECT * FROM users;
