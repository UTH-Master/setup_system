#!/bin/bash

# Updating and Upgrading dependencies
sudo apt-get update -y
sudo apt-get upgrade -y

# Installing SQLite
sudo apt-get install sqlite3 libsqlite3-dev -y

# Verifying the installation
echo "SQLite version:"
sqlite3 --version

# Creating a directory for SQLite databases
mkdir -p ~/sqlite_dbs
echo "Directory for SQLite databases created at ~/sqlite_dbs."

# Creating the SQLite database and table
sqlite3 ~/sqlite_dbs/traffic.db <<EOF
-- This command creates the 'report_traffic' table within the SQLite database
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

echo "Installation complete. Database and table are set up. You can now use SQLite!"
