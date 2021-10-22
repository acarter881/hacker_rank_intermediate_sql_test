SELECT
    customer.customer_name,
    AVG(invoice.total_price) AS average_price
FROM
    customer
INNER JOIN
    invoice
    ON customer.id = invoice.customer_id
WHERE
    invoice.total_price <= (SELECT AVG(invoice.total_price) * 0.25 FROM invoice)
GROUP BY
    customer.customer_name
