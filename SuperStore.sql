mysql> CREATE DATABASE Pro;
Query OK, 1 row affected (0.03 sec)

mysql> USE Pro;
Database changed
mysql> CREATE TABLE ShipMode (
    ->     ShipModeID INT AUTO_INCREMENT PRIMARY KEY,
    ->     ShipMode VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)


mysql> CREATE TABLE Region (
    ->     RegionID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Region VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Category (
    ->     CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Category VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE SubCategory (
    ->     SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    ->     SubCategory VARCHAR(50),
    ->     CategoryID INT,
    ->     FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
    -> );
Query OK, 0 rows affected (0.06 sec)

CREATE TABLE Sales (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    ShipModeID INT,
    SegmentID INT,
    RegionID INT,
    SubCategoryID INT,
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(3, 2),
    Profit DECIMAL(10, 2),
    FOREIGN KEY (ShipModeID) REFERENCES ShipMode(ShipModeID),
    FOREIGN KEY (SegmentID) REFERENCES Segment(SegmentID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
    FOREIGN KEY (SubCategoryID) REFERENCES SubCategory(SubCategoryID)
);


mysql> DESCRIBE ShipMode;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| ShipModeID | int         | NO   | PRI | NULL    | auto_increment |
| ShipMode   | varchar(50) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
2 rows in set (0.01 sec)

mysql> DESCRIBE Segment;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| SegmentID | int         | NO   | PRI | NULL    | auto_increment |
| Segment   | varchar(50) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE Region;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| RegionID | int         | NO   | PRI | NULL    | auto_increment |
| Region   | varchar(50) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE Category;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| CategoryID | int         | NO   | PRI | NULL    | auto_increment |
| Category   | varchar(50) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE SubCategory;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| SubCategoryID | int         | NO   | PRI | NULL    | auto_increment |
| SubCategory   | varchar(50) | YES  |     | NULL    |                |
| CategoryID    | int         | YES  | MUL | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Sales;
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| SalesID       | int           | NO   | PRI | NULL    | auto_increment |
| ShipModeID    | int           | YES  | MUL | NULL    |                |
| SegmentID     | int           | YES  | MUL | NULL    |                |
| RegionID      | int           | YES  | MUL | NULL    |                |
| SubCategoryID | int           | YES  | MUL | NULL    |                |
| Country       | varchar(50)   | YES  |     | NULL    |                |
| City          | varchar(50)   | YES  |     | NULL    |                |
| State         | varchar(50)   | YES  |     | NULL    |                |
| PostalCode    | varchar(10)   | YES  |     | NULL    |                |
| Sales         | decimal(10,2) | YES  |     | NULL    |                |
| Quantity      | int           | YES  |     | NULL    |                |
| Discount      | decimal(3,2)  | YES  |     | NULL    |                |
| Profit        | decimal(10,2) | YES  |     | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+
13 rows in set (0.00 sec)


mysql> INSERT INTO Segment (Segment) VALUES ('Consumer'), ('Corporate'), ('Home Office');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Region (Region) VALUES ('South'), ('West'), ('Central'), ('East');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Category (Category) VALUES ('Furniture'), ('Office Supplies'), ('Technology');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO SubCategory (SubCategory, CategoryID) VALUES
    -> ('Bookcases', 1), ('Chairs', 1), ('Tables', 1),
    -> ('Labels', 2), ('Storage', 2), ('Art', 2),
    -> ('Phones', 3), ('Accessories', 3);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Sales (ShipModeID, SegmentID, RegionID, SubCategoryID, Country, City, State, PostalCode, Sales, Quantity, Discount, Profit) VALUES
    -> (1, 1, 1, 1, 'United States', 'Henderson', 'Kentucky', '42420', 261.96, 2, 0, 41.9136),
    -> (1, 1, 1, 2, 'United States', 'Henderson', 'Kentucky', '42420', 731.94, 3, 0, 219.582),
    -> (1, 2, 2, 4, 'United States', 'Los Angeles', 'California', '90036', 14.62, 2, 0, 6.8714),
    -> (2, 1, 1, 3, 'United States', 'Fort Lauderdale', 'Florida', '33311', 957.5775, 5, 0.45, -383.031),
    -> (2, 1, 1, 5, 'United States', 'Fort Lauderdale', 'Florida', '33311', 22.368, 2, 0.2, 2.5164),
    -> (2, 1, 2, 6, 'United States', 'Los Angeles', 'California', '90032', 48.86, 7, 0, 14.1694),
    -> (2, 1, 2, 7, 'United States', 'Los Angeles', 'California', '90032', 7.28, 4, 0, 1.9656),
    -> (2, 1, 2, 8, 'United States', 'Los Angeles', 'California', '90032', 907.152, 6, 0.2, 90.7152),
    -> (2, 1, 2, 4, 'United States', 'Los Angeles', 'California', '90032', 18.504, 3, 0.2, 5.7825),
    -> (2, 1, 2, 5, 'United States', 'Los Angeles', 'California', '90032', 114.9, 5, 0, 34.47);
Query OK, 10 rows affected, 13 warnings (0.01 sec)



mysql> SELECT * FROM Sales;
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
| SalesID | ShipModeID | SegmentID | RegionID | SubCategoryID | Country       | City            | State      | PostalCode | Sales  | Quantity | Discount | Profit  |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
|       1 |          1 |         1 |        1 |             1 | United States | Henderson       | Kentucky   | 42420      | 261.96 |        2 |     0.00 |   41.91 |
|       2 |          1 |         1 |        1 |             2 | United States | Henderson       | Kentucky   | 42420      | 731.94 |        3 |     0.00 |  219.58 |
|       3 |          1 |         2 |        2 |             4 | United States | Los Angeles     | California | 90036      |  14.62 |        2 |     0.00 |    6.87 |
|       4 |          2 |         1 |        1 |             3 | United States | Fort Lauderdale | Florida    | 33311      | 957.58 |        5 |     0.45 | -383.03 |
|       5 |          2 |         1 |        1 |             5 | United States | Fort Lauderdale | Florida    | 33311      |  22.37 |        2 |     0.20 |    2.52 |
|       6 |          2 |         1 |        2 |             6 | United States | Los Angeles     | California | 90032      |  48.86 |        7 |     0.00 |   14.17 |
|       7 |          2 |         1 |        2 |             7 | United States | Los Angeles     | California | 90032      |   7.28 |        4 |     0.00 |    1.97 |
|       8 |          2 |         1 |        2 |             8 | United States | Los Angeles     | California | 90032      | 907.15 |        6 |     0.20 |   90.72 |
|       9 |          2 |         1 |        2 |             4 | United States | Los Angeles     | California | 90032      |  18.50 |        3 |     0.20 |    5.78 |
|      10 |          2 |         1 |        2 |             5 | United States | Los Angeles     | California | 90032      | 114.90 |        5 |     0.00 |   34.47 |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
10 rows in set (0.01 sec)

mysql> INSERT INTO Sales (ShipModeID, SegmentID, RegionID, SubCategoryID, Country, City, State, PostalCode, Sales, Quantity, Discount, Profit)
    -> VALUES
    ->     (1, 1, 1, 1, 'United States', 'Henderson', 'Kentucky', '42420', 261.96, 2, 0, 41.9136);
Query OK, 1 row affected, 1 warning (0.02 sec)

mysql>
mysql> INSERT INTO Sales (ShipModeID, SegmentID, RegionID, SubCategoryID, Country, City, State, PostalCode, Sales, Quantity, Discount, Profit)
    -> VALUES
    ->     (1, 1, 1, 2, 'United States', 'Henderson', 'Kentucky', '42420', 731.94, 3, 0, 219.582),
    ->     (1, 2, 2, 4, 'United States', 'Los Angeles', 'California', '90036', 14.62, 2, 0, 6.8714),
    ->     (2, 1, 1, 3, 'United States', 'Fort Lauderdale', 'Florida', '33311', 957.5775, 5, 0.45, -383.031),
    ->     (2, 1, 1, 5, 'United States', 'Fort Lauderdale', 'Florida', '33311', 22.368, 2, 0.2, 2.5164),
    ->     (2, 1, 2, 6, 'United States', 'Los Angeles', 'California', '90032', 48.86, 7, 0, 14.1694),
    ->     (2, 1, 2, 7, 'United States', 'Los Angeles', 'California', '90032', 7.28, 4, 0, 1.9656),
    ->     (2, 1, 2, 8, 'United States', 'Los Angeles', 'California', '90032', 907.152, 6, 0.2, 90.7152),
    ->     (2, 1, 2, 4, 'United States', 'Los Angeles', 'California', '90032', 18.504, 3, 0.2, 5.7825),
    ->     (2, 1, 2, 5, 'United States', 'Los Angeles', 'California', '90032', 114.9, 5, 0, 34.47);
Query OK, 9 rows affected, 12 warnings (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 12


mysql> SELECT * FROM Sales;
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
| SalesID | ShipModeID | SegmentID | RegionID | SubCategoryID | Country       | City            | State      | PostalCode | Sales  | Quantity | Discount | Profit  |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
|       1 |          1 |         1 |        1 |             1 | United States | Henderson       | Kentucky   | 42420      | 261.96 |        2 |     0.00 |   41.91 |
|       2 |          1 |         1 |        1 |             2 | United States | Henderson       | Kentucky   | 42420      | 731.94 |        3 |     0.00 |  219.58 |
|       3 |          1 |         2 |        2 |             4 | United States | Los Angeles     | California | 90036      |  14.62 |        2 |     0.00 |    6.87 |
|       4 |          2 |         1 |        1 |             3 | United States | Fort Lauderdale | Florida    | 33311      | 957.58 |        5 |     0.45 | -383.03 |
|       5 |          2 |         1 |        1 |             5 | United States | Fort Lauderdale | Florida    | 33311      |  22.37 |        2 |     0.20 |    2.52 |
|       6 |          2 |         1 |        2 |             6 | United States | Los Angeles     | California | 90032      |  48.86 |        7 |     0.00 |   14.17 |
|       7 |          2 |         1 |        2 |             7 | United States | Los Angeles     | California | 90032      |   7.28 |        4 |     0.00 |    1.97 |
|       8 |          2 |         1 |        2 |             8 | United States | Los Angeles     | California | 90032      | 907.15 |        6 |     0.20 |   90.72 |
|       9 |          2 |         1 |        2 |             4 | United States | Los Angeles     | California | 90032      |  18.50 |        3 |     0.20 |    5.78 |
|      10 |          2 |         1 |        2 |             5 | United States | Los Angeles     | California | 90032      | 114.90 |        5 |     0.00 |   34.47 |
|      21 |          1 |         1 |        1 |             1 | United States | Henderson       | Kentucky   | 42420      | 261.96 |        2 |     0.00 |   41.91 |
|      22 |          1 |         1 |        1 |             2 | United States | Henderson       | Kentucky   | 42420      | 731.94 |        3 |     0.00 |  219.58 |
|      23 |          1 |         2 |        2 |             4 | United States | Los Angeles     | California | 90036      |  14.62 |        2 |     0.00 |    6.87 |
|      24 |          2 |         1 |        1 |             3 | United States | Fort Lauderdale | Florida    | 33311      | 957.58 |        5 |     0.45 | -383.03 |
|      25 |          2 |         1 |        1 |             5 | United States | Fort Lauderdale | Florida    | 33311      |  22.37 |        2 |     0.20 |    2.52 |
|      26 |          2 |         1 |        2 |             6 | United States | Los Angeles     | California | 90032      |  48.86 |        7 |     0.00 |   14.17 |
|      27 |          2 |         1 |        2 |             7 | United States | Los Angeles     | California | 90032      |   7.28 |        4 |     0.00 |    1.97 |
|      28 |          2 |         1 |        2 |             8 | United States | Los Angeles     | California | 90032      | 907.15 |        6 |     0.20 |   90.72 |
|      29 |          2 |         1 |        2 |             4 | United States | Los Angeles     | California | 90032      |  18.50 |        3 |     0.20 |    5.78 |
|      30 |          2 |         1 |        2 |             5 | United States | Los Angeles     | California | 90032      | 114.90 |        5 |     0.00 |   34.47 |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+
20 rows in set (0.00 sec)



mysql> SELECT * FROM Category;
+------------+-----------------+
| CategoryID | Category        |
+------------+-----------------+
|          1 | Furniture       |
|          2 | Office Supplies |
|          3 | Technology      |
+------------+-----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Segment;
+-----------+-------------+
| SegmentID | Segment     |
+-----------+-------------+
|         1 | Consumer    |
|         2 | Corporate   |
|         3 | Home Office |
+-----------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM ShipMode;
+------------+----------------+
| ShipModeID | ShipMode       |
+------------+----------------+
|          1 | First Class    |
|          2 | Second Class   |
|          3 | Standard Class |
+------------+----------------+
3 rows in set (0.00 sec)


1054 (42S22): Unknown column 'SubCategoryName' in 'field list'
mysql> INSERT INTO SubCategory (SubCategory, CategoryID) VALUES
    ->     ('Bookcases', 1), ('Chairs', 1), ('Tables', 1),
    ->     ('Labels', 2), ('Storage', 2), ('Art', 2),
    ->     ('Phones', 3), ('Accessories', 3),
    ->     ('Furnishings', 1), ('Appliances', 2), ('Binders', 2),
    ->     ('Envelopes', 2), ('Fasteners', 2), ('Supplies', 2),
    ->     ('Machines', 2), ('Paper', 2), ('Copiers', 3),
    ->     ('Machines', 3), ('Supplies', 3), ('Furnishings', 3),
    ->     ('Bookcases', 3), ('Tables', 3), ('Chairs', 3),
    ->     ('Labels', 3), ('Appliances', 3), ('Art', 3);
Query OK, 26 rows affected (0.01 sec)
Records: 26  Duplicates: 0  Warnings: 0


mysql> SELECT * FROM SubCategory;
+---------------+-------------+------------+
| SubCategoryID | SubCategory | CategoryID |
+---------------+-------------+------------+
|             1 | Bookcases   |          1 |
|             2 | Chairs      |          1 |
|             3 | Tables      |          1 |
|             4 | Labels      |          2 |
|             5 | Storage     |          2 |
|             6 | Art         |          2 |
|             7 | Phones      |          3 |
|             8 | Accessories |          3 |
|             9 | Bookcases   |          1 |
|            10 | Chairs      |          1 |
|            11 | Tables      |          1 |
|            12 | Labels      |          2 |
|            13 | Storage     |          2 |
|            14 | Art         |          2 |
|            15 | Phones      |          3 |
|            16 | Accessories |          3 |
|            17 | Furnishings |          1 |
|            18 | Appliances  |          2 |
|            19 | Binders     |          2 |
|            20 | Envelopes   |          2 |
|            21 | Fasteners   |          2 |
|            22 | Supplies    |          2 |
|            23 | Machines    |          2 |
|            24 | Paper       |          2 |
|            25 | Copiers     |          3 |
|            26 | Machines    |          3 |
|            27 | Supplies    |          3 |
|            28 | Furnishings |          3 |
|            29 | Bookcases   |          3 |
|            30 | Tables      |          3 |
+---------------+-------------+------------+


mysql> INSERT INTO Category (Category) VALUES
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology'),
    ->     ('Furniture'), ('Office Supplies'), ('Technology');
Query OK, 27 rows affected (0.01 sec)
Records: 27  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Category;
+------------+-----------------+
| CategoryID | Category        |
+------------+-----------------+
|          1 | Furniture       |
|          2 | Office Supplies |
|          3 | Technology      |
|          4 | Furniture       |
|          5 | Office Supplies |
|          6 | Technology      |
|          7 | Furniture       |
|          8 | Office Supplies |
|          9 | Technology      |
|         10 | Furniture       |
|         11 | Office Supplies |
|         12 | Technology      |
|         13 | Furniture       |
|         14 | Office Supplies |
|         15 | Technology      |
|         16 | Furniture       |
|         17 | Office Supplies |
|         18 | Technology      |
|         19 | Furniture       |
|         20 | Office Supplies |
|         21 | Technology      |
|         22 | Furniture       |
|         23 | Office Supplies |
|         24 | Technology      |
|         25 | Furniture       |
|         26 | Office Supplies |
|         27 | Technology      |
|         28 | Furniture       |
|         29 | Office Supplies |
|         30 | Technology      |
+------------+-----------------+
30 rows in set (0.00 sec)


mysql> SELECT s.*, sc.SubCategory, c.Category
    -> FROM Sales s
    -> JOIN SubCategory sc ON s.SubCategoryID = sc.SubCategoryID
    -> JOIN Category c ON sc.CategoryID = c.CategoryID;
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+-------------+-----------------+
| SalesID | ShipModeID | SegmentID | RegionID | SubCategoryID | Country       | City            | State      | PostalCode | Sales  | Quantity | Discount | Profit  | SubCategory | Category        |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+-------------+-----------------+
|       1 |          1 |         1 |        1 |             1 | United States | Henderson       | Kentucky   | 42420      | 261.96 |        2 |     0.00 |   41.91 | Bookcases   | Furniture       |
|       2 |          1 |         1 |        1 |             2 | United States | Henderson       | Kentucky   | 42420      | 731.94 |        3 |     0.00 |  219.58 | Chairs      | Furniture       |
|       3 |          1 |         2 |        2 |             4 | United States | Los Angeles     | California | 90036      |  14.62 |        2 |     0.00 |    6.87 | Labels      | Office Supplies |
|       4 |          2 |         1 |        1 |             3 | United States | Fort Lauderdale | Florida    | 33311      | 957.58 |        5 |     0.45 | -383.03 | Tables      | Furniture       |
|       5 |          2 |         1 |        1 |             5 | United States | Fort Lauderdale | Florida    | 33311      |  22.37 |        2 |     0.20 |    2.52 | Storage     | Office Supplies |
|       6 |          2 |         1 |        2 |             6 | United States | Los Angeles     | California | 90032      |  48.86 |        7 |     0.00 |   14.17 | Art         | Office Supplies |
|       7 |          2 |         1 |        2 |             7 | United States | Los Angeles     | California | 90032      |   7.28 |        4 |     0.00 |    1.97 | Phones      | Technology      |
|       8 |          2 |         1 |        2 |             8 | United States | Los Angeles     | California | 90032      | 907.15 |        6 |     0.20 |   90.72 | Accessories | Technology      |
|       9 |          2 |         1 |        2 |             4 | United States | Los Angeles     | California | 90032      |  18.50 |        3 |     0.20 |    5.78 | Labels      | Office Supplies |
|      10 |          2 |         1 |        2 |             5 | United States | Los Angeles     | California | 90032      | 114.90 |        5 |     0.00 |   34.47 | Storage     | Office Supplies |
|      21 |          1 |         1 |        1 |             1 | United States | Henderson       | Kentucky   | 42420      | 261.96 |        2 |     0.00 |   41.91 | Bookcases   | Furniture       |
|      22 |          1 |         1 |        1 |             2 | United States | Henderson       | Kentucky   | 42420      | 731.94 |        3 |     0.00 |  219.58 | Chairs      | Furniture       |
|      23 |          1 |         2 |        2 |             4 | United States | Los Angeles     | California | 90036      |  14.62 |        2 |     0.00 |    6.87 | Labels      | Office Supplies |
|      24 |          2 |         1 |        1 |             3 | United States | Fort Lauderdale | Florida    | 33311      | 957.58 |        5 |     0.45 | -383.03 | Tables      | Furniture       |
|      25 |          2 |         1 |        1 |             5 | United States | Fort Lauderdale | Florida    | 33311      |  22.37 |        2 |     0.20 |    2.52 | Storage     | Office Supplies |
|      26 |          2 |         1 |        2 |             6 | United States | Los Angeles     | California | 90032      |  48.86 |        7 |     0.00 |   14.17 | Art         | Office Supplies |
|      27 |          2 |         1 |        2 |             7 | United States | Los Angeles     | California | 90032      |   7.28 |        4 |     0.00 |    1.97 | Phones      | Technology      |
|      28 |          2 |         1 |        2 |             8 | United States | Los Angeles     | California | 90032      | 907.15 |        6 |     0.20 |   90.72 | Accessories | Technology      |
|      29 |          2 |         1 |        2 |             4 | United States | Los Angeles     | California | 90032      |  18.50 |        3 |     0.20 |    5.78 | Labels      | Office Supplies |
|      30 |          2 |         1 |        2 |             5 | United States | Los Angeles     | California | 90032      | 114.90 |        5 |     0.00 |   34.47 | Storage     | Office Supplies |
+---------+------------+-----------+----------+---------------+---------------+-----------------+------------+------------+--------+----------+----------+---------+-------------+-----------------+
20 rows in set (0.00 sec)


mysql> INSERT INTO Region (Region) VALUES
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East'),
    ->     ('South'), ('West'), ('Central'), ('East');
Query OK, 28 rows affected (0.01 sec)
Records: 28  Duplicates: 0  Warnings: 0



mysql> SELECT * FROM Region;
+----------+---------+
| RegionID | Region  |
+----------+---------+
|        1 | South   |
|        2 | West    |
|        3 | Central |
|        4 | East    |
|        5 | South   |
|        6 | West    |
|        7 | Central |
|        8 | East    |
|        9 | South   |
|       10 | West    |
|       11 | Central |
|       12 | East    |
|       13 | South   |
|       14 | West    |
|       15 | Central |
|       16 | East    |
|       17 | South   |
|       18 | West    |
|       19 | Central |
|       20 | East    |
|       21 | South   |
|       22 | West    |
|       23 | Central |
|       24 | East    |
|       25 | South   |
|       26 | West    |
|       27 | Central |
|       28 | East    |
|       29 | South   |
|       30 | West    |
+----------+---------+
