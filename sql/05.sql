/*
 * Count the total number of G rated films.
 */
SELECT count(*)
FROM film
WHERE rating = 'G';
