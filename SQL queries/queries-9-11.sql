/*9. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent*/

-- Creating a CTE for joining track,album and artist table
WITH track_details AS
(
	SELECT 
		track_id,
		track.name AS track_name,
		artist.name AS artist_name
	FROM track
	JOIN album USING(album_id)
	JOIN artist USING(artist_id)
),
-- CTE for joining customer, invoice and invoice_line table
customer_invoice AS
(
	SELECT
		*
	FROM customer
	JOIN invoice USING(customer_id)
	JOIN invoice_line USING(invoice_id)
)

-- Now Joining both results of CTEs and calculating total sum of spent and grouping my customer details and artist_name
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	t.artist_name,
	ROUND(SUM(c.unit_price*c.quantity)::numeric,2) AS total_spent
FROM customer_invoice AS c
JOIN track_details AS t
USING(track_id)
GROUP BY 1,2,3,4
ORDER BY total_spent DESC;



/* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

/*Method: 
- First joined invoice, invoice_line, track and genre table on respective id columns
- Grouped the data by country and genre
- Counted the invoice lines to calculate total purchases
- Added ranking at country level on total purchases, so that max will be ranked as 1
- Fitered the data where rank is 1, in this way We determine the most popular genre as the genre 
with the highest amount of purchases.*/

SELECT *
FROM
(
	SELECT
		billing_country,
		genre.name AS genre,
		COUNT(invoice_line_id) AS total_purchases,
		RANK() OVER(PARTITION BY billing_country ORDER BY COUNT(invoice_line_id) DESC) AS ranking
	FROM invoice
	JOIN invoice_line USING(invoice_id)
	JOIN track USING(track_id)
	JOIN genre USING(genre_id)
	GROUP BY genre.name, billing_country
	ORDER by billing_country, total_purchases DESC
)
WHERE ranking = 1;

/*
3. Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount
*/

WITH customer_rankings_by_country AS
(
	SELECT 
		country,
		customer_id,
		first_name,
		last_name,
		SUM(total) AS total_spent,
		RANK() OVER(PARTITION BY country
					ORDER BY SUM(total) DESC) AS ranking
	FROM invoice
	JOIN customer USING(customer_id)
	GROUP BY 1,2,3,4
	ORDER BY country, total_spent DESC
)

SELECT
	country,
	customer_id,
	first_name,
	last_name,
	ROUND(total_spent::numeric,2) AS spent
FROM customer_rankings_by_country
WHERE ranking = 1
ORDER BY spent DESC;






