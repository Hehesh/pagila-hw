/*
 * For each film, show how many actors appear in it.
 */
SELECT f.title,
       count(*) OVER (PARTITION BY fa.film_id) AS actor_count
FROM film AS f
JOIN film_actor AS fa
  ON fa.film_id = f.film_id
ORDER BY actor_count DESC, f.film_id;
