-- 1. Who is the senior most employee based on job title?

SELECT *
FROM employee
WHERE levels = (SELECT MAX(levels) FROM employee);

-- 2. Which countries have the most Invoices?

SELECT
	billing_country,
	COUNT(*) AS invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count DESC;

-- 3. What are top 3 values of total invoice?

SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;


-- 4. Which city has the best customers? We would like to throw a promotional Music
-- Festival in the city we made the most money. Write a query that returns one city that
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice
-- totals

SELECT
	billing_city,
	ROUND(SUM(total)::numeric,2) AS invoice_total
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
LIMIT 1;


-- Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money

SELECT 
	customer.customer_id,
	first_name,
	last_name,
	SUM(total) AS total_invoice
FROM invoice
JOIN customer
USING(customer_id)
GROUP BY customer.customer_id
ORDER BY total_invoice DESC;
