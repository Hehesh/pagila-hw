/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customers have paid for the film.
 */
SELECT f.title,
       sum(p.amount) AS profit
FROM payment AS p
JOIN rental AS r
  ON r.rental_id = p.rental_id
JOIN inventory AS i
  ON i.inventory_id = r.inventory_id
JOIN film AS f
  ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY profit DESC;
