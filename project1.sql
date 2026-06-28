select 
 customers.name,
 products.product_name,
 products.category,
 orders.quantity,
 orders.quantity*products.price as total_price
from orders
join customers
on customers.id=orders.customer_id
join products
on products.id = orders.product_id

select 
customers.name,
SUM(quantity * price) as total_money_spent
from orders
join customers
on customers.id=orders.customer_id
join products
on products.id = orders.product_id
group by customers.name
order by total_money_spent desc

select 
products.category,
SUM(quantity * price) as revenue
from orders
join customers
on customers.id=orders.customer_id
join products
on products.id = orders.product_id
group by products.category
order by revenue desc

select 
customers.name,
count(*) as total_orders
from orders
join customers
on customers.id=orders.customer_id
group by customers.name  
having count(*) > 1

select 
product_name,
sum(quantity) as total_sold,
rank() over 
(order by sum(quantity)desc
) as rank_level
from orders
join products
on products.id = orders.product_id
group by product_name



