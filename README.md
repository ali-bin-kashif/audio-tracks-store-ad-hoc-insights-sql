# Audio tracks store analysis and insights to business requests with SQL.

### Tools:
- SQL
- PostgreSQL Database

## Data Model:
<img src="schema and output/schema_diagram.png" width=600>

## SQL Queries:
- <a href="SQL queries/queries_1-5.sql" target="_blank">For 1-5</a>
- <a href="SQL queries/queries_6-8.sql" target="_blank">For 6-8</a>
- <a href="SQL queries/queries-9-11.sql" target="_blank">For 9-11</a>

## Insights:
1. Who is the senior most employee based on job title?
<br>
<img src="schema and output/output1.jpeg">

- Mohan Madan is the most senior employee at the level of Senior General Manager.
  
<hr>
2. Which countries have the most Invoices?
<br><br>
<img src="schema and output/output2.jpeg">

- The USA, Canada and Brazil have the most Invoices.

<hr>
3. What are the top 3 values of the total invoice?
<br><br>
<img src="schema and output/output3.jpeg">

- Top invoices are of approx 24K$ and 20K$

<hr>
4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals.
<br><br>
<img src="schema and output/output4.jpeg">

- Prague, the capital Czech Republic has the best customer base with total invoices of 273K $

<hr>
5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money
<br><br>
<img src="schema and output/output5.jpeg">

- R Madhav has spent the most amount of money.

<hr>
6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
<br><br>
<img src="schema and output/output6.jpeg">

<hr>
7. Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.
<br><br>
<img src="schema and output/output7.jpeg">

- Led Zeppelin and U2 have the most number of music tracks.

7. Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.
<br><br>
<img src="schema and output/output7.jpeg">

- Led Zeppelin and U2 have the most number of music tracks.
<hr>
8. Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

<br><br>
<img src="schema and output/output8.jpeg">
<hr>
9.Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent

<br><br>
<img src="schema and output/output9.jpeg">

- Hugh O'Reilly has spent the most on band Queen.

  <hr>
10. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres.

<br><br>
<img src="schema and output/output10.jpeg">

- Most of the countries have Rock genre as the most popular.

<hr>
11. Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount

<br><br>
<img src="schema and output/output11.jpeg">

<hr>


  



