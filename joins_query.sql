USE joins_db;

select c.customer_name, o.order_id, o.order_date
from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

select o.order_id, p.product_name, o.quantity
from orderItems as o
inner join products as p
on o.product_id = p.product_id;	

select *
from products as p
inner join vendors as v
on p.vendor_id = v.vendor_id;

select * 
from customers as c
left join orders as o
on c.customer_id = o.customer_id;

select * 
from products as p 
right join vendors as v
on p.vendor_id = v.vendor_id;

select v.vendor_id, v.vendor_name, p.product_name, p.price
from vendors as v
left join products as p
on v.vendor_id = p.vendor_id;


-- 6th query did not execute
select p.product_id, p.product_name, p.price
from products as p 
left join orderitems as oi
on oi.product_id = p.product_id
where oi.order_id is NULL; 

SELECT p.product_id, p.product_name, p.price, oi.order_id, oi.quantity
FROM products AS p 
LEFT JOIN orderitems AS oi ON oi.product_id = p.product_id;

select c1.customer_id, c2.customer_id, c1. customer_name, c2.customer_name, c1.city, c2.city
from customers as c1
inner join customers as c2
on c1.city = c2.city
where c1.customer_id != c2.customer_id;

-- so thinking like this, would remove all mirrored entries
select c1.customer_id, c2.customer_id, c1. customer_name, c2.customer_name, c1.city, c2.city
from customers as c1
inner join customers as c2
on c1.city = c2.city and c1.customer_id < c2.customer_id;

select o.order_id, c.customer_name, p.product_name, oi.quantity
from orders as o
inner join orderItems as oi on oi.order_id = o.order_id
inner join customers as c on c.customer_id = o.customer_id
inner join products as p on p.product_id = oi.product_id;

select o.order_id, count(*) as total_products
from orders as o
inner join orderItems as oi
on o.order_id = oi.order_id
group by o.order_id
order by o.order_id;

select c.customer_id, c.customer_name
from orders as o 
inner join customers as c on o.customer_id = c.customer_id
inner join orderItems as oi on o.order_id = oi.order_id
inner join products as p on p.product_id = oi.product_id
inner join vendors as v on v.vendor_id = p.vendor_id
where v.vendor_name = "Apple";

select c.customer_id, c.customer_name, count(*) as products_count
from orders as o 
inner join customers as c on o.customer_id = c.customer_id
inner join orderItems as oi on o.order_id = oi.order_id
inner join products as p on p.product_id = oi.product_id
inner join vendors as v on v.vendor_id = p.vendor_id
where v.vendor_name = "Apple"
group by c.customer_id;

-- we cannot use select * with group by
select c.customer_id, c.customer_name, count(*) as orders_count
from orders as o
join customers as c on c.customer_id = o.customer_id
group by c.customer_id
order by count(*) desc
limit 2;

select c.customer_id, c.customer_name, count(*) as orders_count
from orders as o
right join customers as c on c.customer_id = o.customer_id
group by c.customer_id
order by count(*) desc
limit 5;

# using count(*) will give 1 if there is null order_id in it, because rest of it may not be null, or count it as 1
# so use COUNT(o.order_id) it will specify to choose colummn
select c.customer_id, c.customer_name, count(o.order_id) as orders_count
from orders as o
right join customers as c on c.customer_id = o.customer_id
group by c.customer_id
order by count(o.order_id) desc
limit 5;

select p.product_id, p.product_name, count(p.product_id) as products_sold
from orderItems as oi
join products as p on p.product_id = oi.product_id
group by p.product_id;

select p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold
from orderItems as oi
join products as p on p.product_id = oi.product_id
group by p.product_id
having sum(oi.quantity) > 2;

select p.product_id, p.product_name, oi.quantity, oi.order_id, p.price * oi.quantity as revenu
from orderItems as oi
join products as p on p.product_id = oi.product_id;

