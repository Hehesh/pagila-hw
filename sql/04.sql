/*
 * Count the total number of films whose rental price is less than $1.
 */
SELECT count(*)
FROM film
WHERE rental_rate < 1;
