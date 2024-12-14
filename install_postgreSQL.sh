#!/bin/bash

# Script to install PostgreSQL, create a 'report_traffic' table, and set up an 'admin' role on Ubuntu

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
CREATE ROLE admin WITH LOGIN PASSWORD 'your_secure_password' CREATEDB CREATEROLE;

-- Create a new database named 'traffic_db'
CREATE DATABASE traffic_db;

-- Set permissions: Allow 'admin' to access 'traffic_db' database
GRANT ALL PRIVILEGES ON DATABASE traffic_db TO admin;

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

EOF

# Print installation status
echo "PostgreSQL, report_traffic table, and admin role setup completed successfully."
