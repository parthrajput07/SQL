USE shopease;

SELECT *
FROM superstore_raw
LIMIT 5;

CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50)
);

INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment,
    Country,
    City,
    State,
    Region
FROM superstore_raw;

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(200),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore_raw;

SELECT *
FROM products
LIMIT 5;

CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

INSERT INTO orders
SELECT
    `Order ID`,
    STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;

SELECT *
FROM orders
LIMIT 5;

SELECT *
FROM orders
WHERE sales >
(
    SELECT AVG(sales)
    FROM orders
);

SELECT o.*
FROM orders o
JOIN (
    SELECT customer_id, MAX(sales) AS max_sales
    FROM orders
    GROUP BY customer_id
) m
ON o.customer_id = m.customer_id
AND o.sales = m.max_sales;

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales;

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;

SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;


WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM
(
    SELECT
        customer_id,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
    FROM customer_sales
) ranked_customers
WHERE customer_rank <= 3;

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER (ORDER BY cs.total_sales DESC) AS customer_rank
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id;

SELECT
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC
LIMIT 5;

SELECT
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales ASC
LIMIT 5;

SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = 1;

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id
WHERE cs.total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);
-- The SQL analysis of the Superstore dataset helped identify the top-performing and low-performing customers based on total sales.
-- Customers with above-average sales were recognized as valuable customers, while customers with only one order highlighted opportunities for customer retention.
-- By using Subqueries, CTEs, Window Functions, and JOIN operations, meaningful business insights were generated, demonstrating how SQL can be used to analyze and support business decision-making.

