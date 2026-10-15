/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have paid.
 */
SELECT co.country,
       sum(p.amount) AS profit
FROM payment AS p
JOIN rental AS r
    ON r.rental_id = p.rental_id
JOIN customer AS c
    ON c.customer_id = r.customer_id
JOIN address AS a
  ON a.address_id = c.address_id
JOIN city AS ci
  ON ci.city_id = a.city_id
JOIN country AS co
  ON co.country_id = ci.country_id
GROUP BY co.country_id, co.country
ORDER BY co.country;
