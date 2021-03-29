use book_sc;
describe book_sc;
select name, city from customers;
select * from order_items;
select * from orders where customerid = 3;
select * from orders where customerid = 3 or customerid = 4;

select orders.orderid, orders.amount, orders.date 
from customers, orders
where customers.name = 'Yevhen Vieskov'
and customers.customerid = orders.customerid;

select customers.name
from customers, orders, order_items, books
where customers.customerid = orders.customerid
and orders.orderid = order_items.orderid
and order_items.isbn = books.isbn
and books.title like '%DevOps%';

select customers.customerid, customer.name, orders.orderid
from customers left join orders
on customers.customerid = orders.customerid;

select customers.customerid, customers.name
from customers left join orders
using (customerid)
where orders.orderid is null;

select name, address
from customers order by name;

/*calculation average order amount*/
select avg(amount)
from orders;

/*This query allows you to view the average order amount by group,
for example, by client number, which will allow you to find out which of the clients is placing
the largest orders are:*/
select customerid, avg(amount)
from orders
group by customerid;

/*clients have the average order amount exceeds $50*/
select customerid, avg(amount)
from orders
group by customerid
having avg(amount) > 50;

/*order in which the amount was the highest*/
select customerid, amount
from orders
where amount = (select max(amount) from orders);

/*query retrieves books that were never ordered.*/
select isbn, title
from books
where not exists
(select * from order_items where order_items.isbn = books.isbn);

update books
set price = price*1.1;

alter table orders
add tax float(6, 2) after amount;

alter table orders drop tax;

delete from customers
where customerid = 5;

