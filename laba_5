--1
SELECT
    category,
    COUNT(product_id) AS products_in_category
FROM Products
GROUP BY category;
--2
SELECT
    SUM(quantity * price_per_unit) AS total_summ
FROM Order_Items

--3
SELECT 
    c.full_name,
    COUNT(o.order_id) AS orders_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name

--4
SELECT 
    AVG(order_total) AS avg_order_total
FROM (
    SELECT 
    order_id,
    SUM(quantity * price_per_unit) AS order_total
    FROM Order_Items
    GROUP BY order_id
) AS order_totals

--5
SELECT
    status,
    COUNT(order_id) AS orders_count
FROM Orders 
GROUP BY status

--6
SELECT 
    category,
    COUNT(product_id) AS all_products
FROM Products 
GROUP BY category
HAVING  COUNT(product_id) > 1

--7
SELECT 
    c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.full_name
HAVING  COUNT(*) > 1

--8
SELECT 
    product_name,
    SUM(oi.quantity) AS totalsum_product
FROM Order_Items oi
JOIN Products p ON p.product_id = oi.product_id
GROUP BY product_name
HAVING COUNT(quantity) > MAX(quantity)
