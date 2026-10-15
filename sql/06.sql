/*
 * List the last names of actors, as well as how many actors have that last name.
 */
SELECT last_name, count(*) AS last_name_count
FROM actor
GROUP BY last_name
ORDER BY count(*) DESC;
