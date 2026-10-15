/*
 * Rank actors by how many films they appear in (most films first). Ties share a rank.
 */
SELECT a.actor_id,
       a.first_name,
       a.last_name,
       count(fa.film_id) AS films,
       rank() OVER (ORDER BY count(fa.film_id) DESC) AS rnk
FROM actor AS a
JOIN film_actor AS fa
  ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY films DESC, a.actor_id;
