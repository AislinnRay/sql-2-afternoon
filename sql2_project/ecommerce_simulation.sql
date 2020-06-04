--Let's simulate an e-commerce site. We're going to need users, products, and orders.
    --users need a name and an email.
    --products need a name and a price
    --orders need a ref to product.
    --All 3 need primary keys.

--Instructions
    --Create 3 tables following the criteria in the summary.

create table users (
  id serial primary key,
  name text,
  email text
  );

create table products (
  id serial primary key,
  name text,
  price decimal
  );

create table orders (
  id serial primary key,
  product_ref int references products(id)
  );


--Add some data to fill up each table.
    --At least 3 users, 3 products, 3 orders.
insert into users (name, email)
values ('Ann','ann@email.com'), 
('Ben','ben@email.com'),
('Matt','matt@email.com');

insert into products (name, price)
values ('penicil',1.50),
('pen',2.50),
('marker',3.75);

-- insert into orders (product_ref)
-- values (1), (2), (3);

--Run queries against your data.
    --Get all products for the first order.
select p.id as pid
, p.name
, o.id as oid
from products p
, orders o 

where o.product_ref = p.id
AND o.id = 1
;

    --Get all orders.
select * from orders

    --Get the total cost of an order ( sum the price of all products on an order ).
select sum(p.price)
from products p
, orders o
where o.product_ref = p.id
AND o.id = 1
;

--Add a foreign key reference from orders to users.
alter table orders
ADD COLUMN user_ref int references users(id);

--Update the orders table to link a user to each order.
insert into orders (user_ref, product_ref)
values (1, 1), (1,2), (2, 1), (2,1), (2,3), (3,1), (3,3);

--Run queries against your data.
    --Get all orders for a user.
select u.name, o.id as order_id
from users u
join orders o
on o.user_ref = u.id
;

    --Get how many orders each user has.
select * from users;
select * from orders;

select u.name, count(o.id)
from users u
join orders o
on o.user_ref = u.id
group by u.name
;

--Black Diamond
    --Get the total amount on all orders for each user.

select u.name, sum(p.price) as total, count(o.id) as order_id
from users u
join orders o
on o.user_ref = u.id
join products p
on p.id = o.product_ref
group by u.name
;