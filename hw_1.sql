-- homework №1
    -- теория https://western-appeal-39b.notion.site/DB-1-Oct-9-2023-0951f6480b414cb089ce81d3b96cddf4
    
    -- №1 Приведите десять типовых бизнес-процессов для предметной области ВИДЕО-ХОСТИНГ (Youtube), а также их соответствие по CRUD.
        --  create - создание личного кабинета/регистрация нового пользователя
        --  read - auth пользователя
        --  update - изменения данных пользователя
        --  create - добавление видео на сайт
        --  read - просмотр видео на сайте
        --  create - добавление комментария к видео
        --  update - редактирование комментария к видео
        --  delete - удаление комментария к видео
        --  update - добавление/удаление лайка к видео
        --  update - подсчет просмотров видео
        --  read - поиск видео по словам/показ списка видео
    -- №2 Вывести название и стоимость товаров от 20 EUR.
    SELECT
        ProductName,
        Price
    FROM
        [Products]
    WHERE
        Price >= 20;

    -- №3 Вывести страны поставщиков.
    SELECT
        distinct Country
    FROM
        [Suppliers];

    -- №4 В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.
    SELECT
        ProductName,
        Price
    FROM
        [Products]
    WHERE
        NOT SupplierID = 1
    ORDER BY
        Price DESC;

    -- №5 Вывести контактные имена клиентов, кроме тех, что из France и USA.
    SELECT
        ContactName
    FROM
        [Customers]
    WHERE
        Country NOT IN ("France", "USA");