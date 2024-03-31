-- 6. Write query to return the email, first name, last name, & Genre of all Rock Music
-- listeners. Return your list ordered alphabetically by email starting with A
WITH track_genre AS
(
	SELECT
		track_id,
		track.name,
		genre.name AS genre
	FROM track
	JOIN genre
	USING(genre_id)
)

SELECT DISTINCT
	first_name,
	last_name,
	email,
	genre
FROM customer
JOIN invoice USING(customer_id)
JOIN invoice_line USING(invoice_id)
JOIN track_genre USING(track_id)
WHERE genre LIKE '%Rock%'
ORDER BY email;

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */


SELECT
	artist.name as artist,
	COUNT(DISTINCT track_id) as total_tracks
FROM track
JOIN album USING(album_id)
JOIN artist USING(artist_id)
WHERE genre_id IN
(
	SELECT genre_id
	FROM genre
	WHERE name = 'Rock'
)
GROUP BY artist.name
ORDER BY total_tracks DESC
LIMIT 10;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
SELECT DISTINCT
	name,
	ROUND(milliseconds::numeric/(1000*60),2) as minutes
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds)
	FROM track
)
ORDER BY minutes DESC;
