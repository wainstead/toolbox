-- this deletes my old orders more than two months old; with automated
--   testing, I can rack up a thousand orders in just a few months so
--   this is a useful utility script. It will take about three minutes
--   to run however.
-- $Id: delete_old_orders.sql,v 1.1 2007/06/04 16:28:24 swain Exp $

DELETE 
osc_orders,
osc_orders_products,
osc_orders_products_attributes,
osc_orders_total
FROM
osc_orders,
osc_orders_products,
osc_orders_products_attributes,
osc_orders_total
WHERE osc_orders.customers_id=2
AND osc_orders.date_purchased < date_sub(now(), interval 1 month)
AND osc_orders.orders_id=osc_orders_products.orders_id
AND osc_orders.orders_id=osc_orders_products_attributes.orders_id
AND osc_orders.orders_id=osc_orders_total.orders_id
;