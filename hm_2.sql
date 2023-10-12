-- homework №1
-- теория https://western-appeal-39b.notion.site/DB-2-Oct-11-2023-8a885a306ff1495b801ecf6248ce16a3
-- 1. Вывести название и стоимость в USD одного самого дорогого проданного товара (не используя агрегацию)
SELECT
    DISTINCT Products.ProductName,
    Products.Price * 1.05 AS PriceUSD
FROM
    [Products]
    LEFT JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
ORDER BY
    Products.Price DESC
LIMIT
    1;

-- 2. Вывести два самых дорогих товара из категории Beverages из USA
SELECT
    DISTINCT Products.*
FROM
    [Products]
    LEFT JOIN Categories ON Categories.CategoryID = Products.CategoryID
    JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE
    Categories.CategoryName = 'Beverages'
    AND Suppliers.Country = 'USA'
ORDER BY
    Products.Price DESC
LIMIT
    2;

-- 3. Удалить товары с ценой менее 5 EUR
DELETE FROM
    [Products]
WHERE
    Price < 5;

-- 4. Вывести список стран, которые поставляют морепродукты
SELECT
    DISTINCT Suppliers.Country
FROM
    [Products]
    LEFT JOIN Categories ON Categories.CategoryID = Products.CategoryID
    JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE
    Categories.CategoryName = 'Seafood'
ORDER BY
    Suppliers.Country DESC;

-- 5. Очистить поле ContactName у всех клиентов не из China
UPDATE
    [Customers]
SET
    ContactName = ''
WHERE
    Country != "China";