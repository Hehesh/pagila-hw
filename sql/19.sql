/*
 * For each payment, show the customer's total amount paid overall.
 */
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       p.payment_id,
       p.amount,
       sum(p.amount) OVER (PARTITION BY p.customer_id) AS customer_total
FROM payment AS p
JOIN customer AS c
  ON c.customer_id = p.customer_id
ORDER BY c.customer_id, p.payment_id;
