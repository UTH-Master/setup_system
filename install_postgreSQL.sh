#!/bin/bash

# Script to install PostgreSQL, create a 'report_traffic' table, set up 'admin' role, and user permissions on Ubuntu

# Update system repositories
sudo apt update

# Install PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Start PostgreSQL service
sudo systemctl start postgresql

# Enable PostgreSQL service to start on boot
sudo systemctl enable postgresql

# Switch to the PostgreSQL user and run the psql commands
sudo -u postgres psql <<EOF

-- Create a new role named 'admin'
CREATE ROLE admin WITH LOGIN PASSWORD adminadmin123 CREATEDB CREATEROLE;

-- Create a new database named 'traffic_db'
CREATE DATABASE traffic_db;

-- Grant permissions: Allow 'admin' to access 'traffic_db' database
GRANT ALL PRIVILEGES ON DATABASE traffic_db TO admin;

-- Create user 'user_report' with password
CREATE USER user_report WITH PASSWORD userreport123;

-- Connect to the database
\c traffic_db

-- Create the 'report_traffic' table in 'traffic_db'
CREATE TABLE report_traffic (
    id INTEGER PRIMARY KEY,
    id_camera TEXT,
    id_picture TEXT,
    count_all INT,
    street_name TEXT,
    img TEXT,
    created_at TIMESTAMP,
    count_car INT,
    count_truck INT,
    count_bus INT,
    count_motorcycle INT,
    count_bicycle INT,
    other INT,
    latitude FLOAT,
    longitude FLOAT,
    date DATE
);

-- Grant SELECT, INSERT, UPDATE, DELETE permissions to 'user_report' on 'report_traffic'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE report_traffic TO user_report;

EOF

# Print installation status
echo "PostgreSQL, report_traffic table, admin role, and user_report permissions setup completed successfully."
