/*
 * Use a JOIN to count the number films in each category in the specified language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(TEXT)
RETURNS TABLE(name TEXT, count BIGINT) AS
$$
    SELECT c.name::TEXT,
           count(f.film_id)::BIGINT
    FROM category AS c
    JOIN film_category AS fc
      ON fc.category_id = c.category_id
    JOIN film AS f
      ON f.film_id = fc.film_id
    JOIN language AS l
      ON l.language_id = f.language_id
    WHERE l.name = $1
    GROUP BY c.category_id, c.name
    ORDER BY c.name
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');
