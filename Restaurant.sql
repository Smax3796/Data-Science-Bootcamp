-- [sqlite3 file_name] to start sqlite3 on command Line
-- open our database
.open my_restaurent.db
-- create tables
CREATE TABLE IF NOT EXISTS menu (
  menu_id INT UNIQUE,
  menu_name TEXT,
  menu_price REAL);

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT UNIQUE,
  customer_name TEXT,
  customer_gender TEXT);

CREATE TABLE IF NOT EXISTS orders (
  order_id INT UNIQUE,
  order_date TEXT,
  customer_id INT,
  menu_id INT);

CREATE TABLE IF NOT EXISTS transactions(
  transaction_id INT UNIQUE,
  transaction_date TEXT,
  customer_id INT,
  order_id INT,
  total_price REAL);

CREATE TABLE IF NOT EXISTS ingredient(
  ingredient_id INT UNIQUE,
  ingredient_name TEXT,
  menu_id INT,
  ingredient_price REAL);

-- insert table data
INSERT INTO menu VALUES
  (1, "Chicken wrab", 60),
  (2, "Chicken burger size M", 60),
  (3, "Chicken burger size L", 80),
  (4, "Chicken pop", 60);

INSERT INTO customers VALUES
  (1, "tong", "M"),
  (2, "kim", "F"),
  (3, "lee", "M"),
  (4, "pure", "M"),
  (5, "aom", "F"),
  (6, "som", "F"),
  (7, "toy", "M"),
  (8, "pit", "M"),
  (9, "nong", "F"),
  (10, "Fon", "F");

INSERT INTO orders VALUES 
  (1, "2023-11-18", 1, 1),
  (2, "2023-11-18", 2, 1),
  (3, "2023-11-18", 2, 4),
  (4, "2023-11-18", 3, 2),
  (5, "2023-11-18", 9, 1),
  (6, "2023-11-19", 7, 3),
  (7, "2023-11-19", 4, 3),
  (8, "2023-11-19", 5, 2),
  (9, "2023-11-19", 6, 1),
  (10, "2023-11-19", 8, 4),
  (11, "2023-11-19", 9, 2),
  (12, "2023-11-19", 10, 1),
  (13, "2023-11-20", 1, 2),
  (14, "2023-11-20", 2, 1),
  (15, "2023-11-20", 3, 4),
  (16, "2023-11-20", 4, 3),
  (17, "2023-11-20", 5, 2),
  (18, "2023-11-20", 6, 1),
  (19, "2023-11-20", 7, 3),
  (20, "2023-11-20", 8, 4),
  (21, "2023-11-20", 9, 2),
  (22, "2023-11-20", 10, 1),
  (23, "2023-11-21", 1, 2),
  (24, "2023-11-21", 2, 1),
  (25, "2023-11-21", 3, 4),
  (26, "2023-11-21", 4, 3),
  (27, "2023-11-21", 5, 2);

INSERT INTO transactions VALUES
  (1, "2023-11-18", 1, 1, 60),
  (2, "2023-11-18", 2, 2, 60),
  (3, "2023-11-18", 2, 3, 60),
  (4, "2023-11-18", 3, 4, 60),
  (5, "2023-11-18", 9, 5, 60),
  (6, "2023-11-19", 7, 6, 80),
  (7, "2023-11-19", 4, 7, 80),
  (8, "2023-11-19", 5, 8, 60),
  (9, "2023-11-19", 6, 9, 60),
  (10, "2023-11-19", 8, 10, 60),
  (11, "2023-11-19", 9, 11, 60),
  (12, "2023-11-19", 10, 12, 60),
  (13, "2023-11-20", 1, 13, 60),
  (14, "2023-11-20", 2, 14, 60),
  (15, "2023-11-20", 3, 15, 60),
  (16, "2023-11-20", 4, 16, 80),
  (17, "2023-11-20", 5, 17, 60),
  (18, "2023-11-20", 6, 18, 60),
  (19, "2023-11-20", 7, 19, 80),
  (20, "2023-11-20", 8, 20, 60),
  (21, "2023-11-20", 9, 21, 60),
  (22, "2023-11-20", 10, 22, 60),
  (23, "2023-11-21", 1, 23, 60),
  (24, "2023-11-21", 2, 24, 60),
  (25, "2023-11-21", 3, 25, 60),
  (26, "2023-11-21", 4, 26, 80),
  (27, "2023-11-21", 5, 27, 60);

INSERT INTO ingredient VALUES  
  (1,"Chicken Thighs", 1, 7),
  (2,"Chicken Thighs", 2, 7),
  (3,"Chicken Thighs", 3, 14), 
  (4,"Chicken Thighs", 4, 7), 
  (5,"Oil", 1, 5),
  (6,"Oil", 2, 5),
  (7,"Oil", 3, 6),
  (8,"Oil", 4, 5),
  (9,"Package", 1, 4),
  (10,"Package", 2, 4),
  (11,"Package", 3, 4),
  (12,"Package", 4, 4),
  (13,"Burger Bun", 2, 6),
  (14,"Burger Bun", 3, 6),
  (15,"Tortilla Wrab", 1, 8),
  (16,"Mayonnaise Spicy", 1, 5),
  (17,"Mayonnaise", 1, 4),
  (18,"Mayonnaise", 2, 4),
  (19,"Mayonnaise", 3, 4),
  (20,"Iceberg Lettuce", 1, 3.5),
  (21,"Iceberg Lettuce", 2, 3.5),
  (22,"Iceberg Lettuce", 3, 3.5),
  (23,"Crispy Flour", 1, 5),
  (24,"Crispy Flour", 2, 5),
  (25,"Crispy Flour", 3, 5),
  (26,"Crispy Flour", 4, 5);

-- list tables in the db
.table

-- change display data in terminal/shell
.mode box

--1.What menu is the best seller? [JOIN]
SELECT
  t1.menu_name AS menu,
  SUM(t3.total_price) AS total_price
FROM menu t1
JOIN orders t2
  ON t1.menu_id = t2.menu_id
JOIN transactions t3
  ON t2.order_id = t3.order_id
GROUP BY 1
ORDER BY 2 DESC;

--2.Who is top customer ,spent > 100 and gender male  [WITH]
WITH sub1 AS (
  select * FROM customers
  WHERE customer_gender = "M"
),  sub2 AS (
  select * FROM transactions
)
SELECT
  sub1.customer_name AS name,
  sub1.customer_gender AS gender,
  SUM(sub2.total_price) AS total_price
FROM sub1
JOIN sub2 
ON sub1.customer_id = sub2.customer_id
GROUP BY 1
having  SUM(sub2.total_price) >= 150
ORDER BY 3 DESC;

--3.What costs of each menu? [JOIN]
SELECT
  menu_name AS menu,
  SUM(ingredient_price) AS costs
FROM menu 
JOIN ingredient
ON menu.menu_id = ingredient.menu_id
GROUP BY 1
ORDER BY 2 DESC;

--4.customers in "2023-11-18" [subquery in SELECT clause]
SELECT
  (SELECT customer_name FROM customers
   WHere customers.customer_id = transactions.customer_id) AS cutomer_2023_11_18,
   SUM(total_price) AS total_sell
FROM transactions
WHERE STRFTIME("%d", transaction_date) = "18"
GROUP BY 1
ORDER BY 2 DESC;

--5.customers in "2023-11-18" [subquery in WHERE clause]
SELECT 
  customer_name AS customer_2023_11_18
FROM customers
WHERE customer_id IN (
  SELECT customer_id FROM (SELECT customer_id,
                          SUM(total_price) AS total_price
                          FROM transactions
                          WHERE STRFTIME("%d", transaction_date) = "18"
                          GROUP BY 1
                          ORDER BY 2 DESC)
);

--6.profit each menu in 2023-11 [subquery in JOIN clause]
--FROM ตัวหลัก(PK) ต้องเชื่อมกับ FROM(FK) ใน subquery[JOIN](เเม้ว่าในsubจะมี join เเล้ว) ได้
SELECT
  t2.menu_id,
  t1.menu_name,
  total_sell,
  SUM(t3.ingredient_price) AS costs,
  (total_sell) - (SUM(t3.ingredient_price)) AS Profit
FROM menu t1
JOIN orders t2 ON(t1.menu_id = t2.menu_id)
JOIN ingredient t3 ON(t1.menu_id = t3.menu_id)
JOIN (SELECT
      t1.menu_id,
      sum(d2.total_price) AS total_sell
      FROM orders t1
      JOIN transactions d2 on t1.order_id = d2.order_id
      GROUP BY 1
      ORDER BY 2 DESC) t4
ON t4.menu_id = t1.menu_id

WHERE STRFTIME( "%Y-%m", t2.order_date) = "2023-11"
GROUP BY 1
ORDER BY 5 DESC;
