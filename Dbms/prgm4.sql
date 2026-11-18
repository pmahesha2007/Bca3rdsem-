mysql> CREATE USER 'student1'@'localhost'
    -> IDENTIFIED BY '12345';
Query OK, 0 rows affected (0.05 sec)

mysql> GRANT SELECT, INSERT
    -> ON college.*
    -> TO 'student1'@'localhost';
Query OK, 0 rows affected (0.08 sec)

mysql> SHOW GRANTS FOR 'student1'@'lacalhost';
ERROR 1141 (42000): There is no such grant defined for user 'student1' on host 'lacalhost'
mysql> REVOKE INSERT
    -> ON college.*
    -> FROM 'student1'@'localhost';
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE account (
    ->     acc_no INT PRIMARY KEY,
    ->     name VARCHAR(30),
    ->     balance INT
    -> );
Query OK, 0 rows affected (0.49 sec)

mysql> CREATE TABLE account (
    ->     acc_no INT PRIMARY KEY,
    ->     name VARCHAR(30),
    ->     balance INT
    -> );
ERROR 1050 (42S01): Table 'account' already exists
mysql> INSERT INTO account VALUES
    -> (101, 'Akash', 5000),
    -> (102, 'Ravi', 3000);
Query OK, 2 rows affected (0.05 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account
    -> SET balance = 6000
    -> WHERE acc_no = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> COMMIT;
Query OK, 0 rows affected (0.04 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account
    -> SET balance = 1000
    -> WHERE acc_no = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK;
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> SELECT * FROM account;
+--------+-------+---------+
| acc_no | name  | balance |
+--------+-------+---------+
|    101 | Akash |    6000 |
|    102 | Ravi  |    3000 |
+--------+-------+---------+
2 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account SET balance = 7000
    -> WHERE acc_no = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT s1;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account SET balance = 2000
    -> WHERE acc_no = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK TO s1;
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.04 sec)

mysql>