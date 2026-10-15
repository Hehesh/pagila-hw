/*
 * Use a JOIN to list all films in the "Family" category.
 */
SELECT f.title
FROM category AS c
JOIN film_category AS fc
  ON fc.category_id = c.category_id
JOIN film AS f
  ON f.film_id = fc.film_id
WHERE c.name = 'Family'
ORDER BY f.title;
