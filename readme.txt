Notes for CEPM database
0) Download the following files.
a) cepm_schema_data.sql
b) cepm_views.sql 

1) Create a database in your MySQL instance.

create database cepm;

2) Install the database structure and data with the following command:

mysql -u root -p -h localhost cepm < cepm_schema_data.sql

3) Log into your database and connect to the cepm database.

4) Install the cepm views from source.

source cepm_views.sql

