-- ЗАДАНИЯ --
//1
SELECT 
    c.full_name,
    o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
//2
SELECT c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
//3
SELECT 
    p.product_name, 
    oi.quantity, 
    oi.price_per_unit
FROM Order_Items oi 
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;
//4
SELECT full_name
From Customers
WHERE customer_id IN(
    SELECT o.customer_id
    FROM Orders o 
    JOIN Order_items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Смартфон'
);
//5
SELECT 
    product_name, 
    price
FROM Products
WHERE price > (SELECT AVG(price) FROM Products);
//6
SELECT
    o.order_id, 
    o.order_date
FROM Orders o
WHERE EXISTS (
    SELECT *
    FROM Order_Items oi
    JOIN Products p ON oi.product_id = p.product_id
    WHERE oi.order_id = o.order_id
      AND p.price > 100000
);
//7.1
SELECT c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
LEFT JOIN Products p ON oi.product_id = p.product_id AND p.product_name = 'Ноутбук'
WHERE p.product_id IS NULL;
//7.2
SELECT full_name
FROM Customers
WHERE customer_id NOT IN (
    SELECT o.customer_id
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'
);
//8
SELECT p.product_name
FROM Order_Items oi
RIGHT JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_item_id IS NULL;
//9
SELECT 
    c.full_name, 
    p.product_name, 
    oi.quantity
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN Order_Items oi ON o.order_id = oi.order_id
FULL OUTER JOIN Products p ON oi.product_id = p.product_id;
//10.1
SELECT DISTINCT c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.price = (SELECT MAX(price) FROM Products);
//10.2
SELECT full_name
FROM Customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.price = (SELECT MAX(price) FROM Products)
);
//11
SELECT 
    c.full_name,
    p.category
FROM Customers c
CROSS JOIN (SELECT DISTINCT category FROM Products) p;
//12
SELECT
    customer.full_name AS new_customer,
    recommender.full_name AS recommended_by
FROM Customers customer
JOIN Customers recommender ON customer.recommended_by = recommender.customer_id;
