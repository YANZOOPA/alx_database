-- create_table_script.sql

-- Check if a database name is provided as an argument
USE ?;

-- Create the table if it doesn't exist
CREATE TABLE IF NOT EXISTS first_table (id, name);
