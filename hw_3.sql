-- homework №3
-- теория https://western-appeal-39b.notion.site/DB-3-Oct-13-2023-a3eeec078f0449f28c0b990f053c32b9
-- №1 Вывести ко-во поставщиков не из UK и не из China
SELECT
    count (*)
FROM
    [Suppliers]
WHERE
    Country NOT IN ('UK', 'China');

-- №2 Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
    AVG(Price) AS avg_price,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price
FROM
    [Products]
WHERE
    CategoryID IN ('3', '5');

-- №3 Вывести общую сумму проданных товаров
SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM
    OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- №4 Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, 
--     фамилия_менеджера, название_компании_перевозчика)
SELECT
    Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.LastName,
    Shippers.ShipperName
FROM
    [Orders]
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
    JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID;

-- №5 Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM
    [OrderDetails]
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Customers.Country = 'Germany';