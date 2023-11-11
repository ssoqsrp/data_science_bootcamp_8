## My first SQL program

.open restaurant.db
.mode box
.table
-- Drop tables to prevent duplicates
DROP TABLE customers;
DROP TABLE menus;
DROP TABLE ingredients;
DROP TABLE menu_ingre;
--CREATE TABLE 1
CREATE TABLE IF NOT EXISTS customers
  (
  customersid int, 
  name text, 
  city text
  ); 

--CREATE TABLE 2
CREATE TABLE IF NOT EXISTS menus
  (
  menuid int, 
  name text, 
  price real, 
  customersid int
  );

--CREATE TABLE 3
CREATE TABLE IF NOT EXISTS ingredients
  (
  ingredientid int,
  name text, 
  price real
  );

--CREATE TABLE 4
CREATE TABLE IF NOT EXISTS menu_ingre
  (
  menuid int, 
  ingredientid int
  );

--INSERT DATA to customers table
INSERT INTO customers VALUES
  (1, 'fluke', 'bangkok'),
  (2, 'louis', 'paris'),
  (3, 'bank', 'bangkok');

--INSERT DATA to menus table
INSERT INTO menus VALUES
  (1, 'spicy pork steak', 139, 1),
  (2, 'pepper pork steak', 139, 3),
  (3, 'kurobuta pork chop', 199, 2),
  (4, 'panna cotta', 45, 1),
  (5, 'pudding', 40, 3);

--INSERT DATA to ingredients table
INSERT INTO ingredients VALUES
  (1, 'pork loin', 20),
  (2, 'kurobuta loin', 40),
  (3, 'milk', 5),
  (4, 'cream', 5),
  (5, 'strawberries', 5),
  (6, 'egg', 5),
  (7, 'ketchup', 5),
  (8, 'pepper sauce', 5);

--INSERT DATA to menu_ingre table
INSERT INTO menu_ingre VALUES
  (1, 1),
  (1, 7),
  (2, 1),
  (2, 8),
  (3, 2),
  (3, 8),
  (4, 3),
  (4, 4),
  (4, 5),
  (5, 3),
  (5, 6);


--Select all tables to show data
SELECT * FROM customers;
SELECT * FROM ingredients;
SELECT * FROM menus;
SELECT * FROM menu_ingre;

-- WITH
--CREATE VIEW
CREATE VIEW IF NOT EXISTS today AS
WITH sub1 AS (
  SELECT * FROM customers
  WHERE city = 'bangkok'),
     sub2 AS (
  SELECT * FROM menus
  WHERE price >= 45),
     sub3 AS (
  SELECT * FROM ingredients
  WHERE price <= 40)

SELECT 
  sub1.name AS cus,
  sub2.name AS menu,
  sub2.price
FROM sub1
JOIN sub2
ON sub1.customersid = sub2.customersid
JOIN sub3
ON sub2.menuid = sub3.ingredientid;


SELECT * FROM today;


SELECT 
  sum(price) AS Total_income
FROM today;

SELECT 
  MAX(price) AS max_total,
  MIN(price) AS min_total,
  COUNT(menu) AS count_total,
  ROUND(AVG(price), 2) AS avg_total
FROM today;


/*SELECT * FROM
(SELECT * FROM customers
  WHERE city = 'bangkok') AS sub1
JOIN (SELECT * FROM menus
  WHERE price >= 139) AS sub2
ON sub1.customersid = sub2.customersid
JOIN (SELECT * FROM ingredients
  WHERE price <= 40) AS sub3
ON sub2.menuid = sub3.ingredientid;*/
