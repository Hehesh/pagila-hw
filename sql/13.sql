/*
 * Display the titles of movies starting with the letters K and Q whose language is English.
 */
SELECT f.film_id,
       f.title,
       l.language_id,
       l.name
FROM film AS f
JOIN language AS l
  ON l.language_id = f.language_id
WHERE l.name = 'English'
  AND (f.title ILIKE 'k%' OR f.title ILIKE 'q%')
ORDER BY f.title;
