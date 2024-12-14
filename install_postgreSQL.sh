#!/bin/bash

# Script to install PostgreSQL and create a 'report_traffic' table on Ubuntu

# Update system repositories
sudo apt update

# Install PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Start PostgreSQL service
sudo systemctl start postgresql

# Enable PostgreSQL service to start on boot
sudo systemctl enable postgresql

# Optional: Secure PostgreSQL by setting a password for the "postgres" user
sudo -u postgres psql -c "ALTER USER admin PASSWORD 'admin123';"

# Create the 'report_traffic' table
sudo -u postgres psql -c "CREATE TABLE report_traffic (
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
);"

# Print installation status
echo "PostgreSQL and report_traffic table installation completed successfully."
