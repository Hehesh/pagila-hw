/*
 * For each film, show the customer who most recently rented it.
 */
WITH rental_customers AS (
    SELECT f.film_id,
           f.title,
           first_value(r.customer_id) OVER (
               PARTITION BY f.film_id
               ORDER BY r.rental_date DESC
           ) AS customer_id,
           first_value(c.first_name || ' ' || c.last_name) OVER (
               PARTITION BY f.film_id
               ORDER BY r.rental_date DESC
           ) AS customer_name
    FROM film AS f
    JOIN inventory AS i
      ON i.film_id = f.film_id
    JOIN rental AS r
      ON r.inventory_id = i.inventory_id
    JOIN customer AS c
      ON c.customer_id = r.customer_id
)
SELECT title, customer_id, customer_name
FROM (
    SELECT DISTINCT ON (film_id)
        film_id, title, customer_id, customer_name
    FROM rental_customers
    ORDER BY film_id
) AS latest
ORDER BY title;
