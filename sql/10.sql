/*
 * Use a JOIN to list each film and the number of actors who are listed for that film.
 * Use tables film and film_actor.
 */
SELECT f.title,
       f.film_id,
       count(fa.actor_id) AS actor_count
FROM film AS f
JOIN film_actor AS fa
  ON fa.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY actor_count, f.title, f.film_id;
