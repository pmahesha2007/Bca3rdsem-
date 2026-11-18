mysql> USE college;
Database changed
mysql> CREATE TABLE employee(
    ->     emp_id INT,
    ->     emp_name VARCHAR(50),
    ->     salary INT
    -> );
ERROR 1050 (42S01): Table 'employee' already exists
mysql> USE COLLEGE;
Database changed
mysql> ALTER TABLE employee
    -> ADD COLUMN DEPARTMENT VARCHAR(30);
Query OK, 0 rows affected (1.32 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> RENAME TABLE employee TO staff;
Query OK, 0 rows affected (0.29 sec)

mysql> TRUNCATE TABLE staff;
Query OK, 0 rows affected (0.66 sec)

mysql> DROP TABLE staff;
Query OK, 0 rows affected (0.24 sec)

mysql>