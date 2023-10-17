-- homework №4
-- теория https://western-appeal-39b.notion.site/DB-4-Oct-16-2023-1f69c6a91dfb44c293bab4ef62a055c2
-- №1 Найти мин/стоимость товаров для каждой категории
SELECT
    Categories.CategoryName,
    MIN(Products.Price) AS min_price
FROM
    [Products]
    JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY
    Products.CategoryID;

-- №2 Вывести названия категорий, в которых более 10 товаров
SELECT
    Categories.CategoryName,
    COUNT(*) AS total_products
FROM
    [Products]
    JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY
    Products.CategoryID
HAVING
    total_products > 10;

-- №3 Очистить тел/номер поставщикам из USA
UPDATE
    [Suppliers]
SET
    Country = ''
WHERE
    Country = 'USA';

-- №4 Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
    Employees.FirstName,
    Employees.LastName,
    COUNT(*) AS total_orders
FROM
    [Employees]
    JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY
    Orders.EmployeeID
HAVING
    total_orders > 15;

