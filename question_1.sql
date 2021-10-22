SELECT
    contact.user_account_id,
    user_account.first_name,
    user_account.last_name,
    customer.id,
    customer.customer_name,
    count(*) as number_of_contacts
FROM
    contact
INNER JOIN
    user_account
    ON contact.user_account_id = user_account.id
INNER JOIN
    customer
    ON contact.customer_id = customer.id
GROUP BY
    contact.user_account_id,
    user_account.first_name,
    user_account.last_name,
    customer.id,
    customer.customer_name
HAVING
    number_of_contacts > 1
ORDER BY
    user_account.id ASC;
