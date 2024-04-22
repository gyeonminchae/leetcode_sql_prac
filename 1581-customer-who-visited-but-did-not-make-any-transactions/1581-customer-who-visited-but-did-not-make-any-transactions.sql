SELECT customer_id, count(customer_id) as count_no_trans
FROM visits
LEFT JOIN transactions
ON transactions.visit_id = visits.visit_id
WHERE transaction_id is NULL
GROUP BY customer_id;