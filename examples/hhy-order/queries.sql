-- 1. Which terms did the buyer accept? Follow the order's stored revision.
SELECT o.order_id, o.quote_id, o.revision, q.colour, q.metres,
       printf('%.2f', q.unit_cents / 100.0) AS usd_per_m,
       r.pricing_basis
FROM sales_order AS o
JOIN quote_revision AS r USING (quote_id, revision)
JOIN quote_line AS q USING (quote_id, revision)
WHERE o.order_id = 'SO-42'
ORDER BY q.colour;

-- 2. How many metres have shipped, and how many are still owed?
SELECT o.order_id, q.colour, q.metres AS ordered_m,
       COALESCE(SUM(d.metres), 0) AS shipped_m,
       q.metres - COALESCE(SUM(d.metres), 0) AS open_m
FROM sales_order AS o
JOIN quote_line AS q USING (quote_id, revision)
LEFT JOIN dispatch AS d
    ON d.order_id = o.order_id AND d.colour = q.colour
WHERE o.order_id = 'SO-42'
GROUP BY o.order_id, q.colour, q.metres
ORDER BY q.colour;

-- 3. Where did receipt RC-7 go? Invoice balances include every receipt applied.
WITH paid AS (
    SELECT invoice_id, SUM(amount_cents) AS paid_cents
    FROM allocation
    GROUP BY invoice_id
)
SELECT a.receipt_id, a.invoice_id,
       printf('%.2f', i.amount_cents / 100.0) AS invoice_usd,
       printf('%.2f', a.amount_cents / 100.0) AS from_receipt_usd,
       printf('%.2f', (i.amount_cents - paid.paid_cents) / 100.0) AS still_due_usd
FROM allocation AS a
JOIN invoice AS i USING (invoice_id)
JOIN paid USING (invoice_id)
WHERE a.receipt_id = 'RC-7'
ORDER BY a.invoice_id;
