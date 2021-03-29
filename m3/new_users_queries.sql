/*test user privilegies */
use new_users;
select user();

create table orders
(
  orderid int unsigned not null auto_increment primary key,
  customerid int unsigned not null,
  amount float(6,2),
  date date not null,
  order_status char(10),
  ship_name char(60) not null,
  ship_address char(80) not null,
  ship_city char(30) not null,
  ship_state char(20),
  ship_zip char(10),
  ship_country char(20) not null
);


create table books
(
   isbn char(13) not null primary key,
   author char(80),
   title char(100),
   catid int unsigned,
   price float(4,2) not null,
   description varchar(255)
);


insert into books values
  ('0-672-31697-8', 'Michael Morgan', 'Java  for Professional Developers',1, 34.99, ' '),
  ('0-672-31745-1', 'Thomas Down', 'Installing Debian GNU/Linux', 2, 24.99, ' '),
  ('0-672-31509-2', 'Pruitt, et al.', 'Teach Yourself GIMP in 24 Hours', 5, 24.99, ' '),
  ('0-672-31769-9', 'Thomas Schenk', 'Caldera OpenLinux System Administration Unleashed', 2,  49.99, ' '),
  ('8-761-78829-5', 'Thomas Uphill et al.', 'DevOps: Puppet, Docker, and Kubernetes learning Path', 4, 54.99, ' ');

insert into orders values
  (NULL, 3, 69.98, '2021-03-02', 'ok ', 'Michelle Arthur', '357 North Road', 'Yarraville', 'Kansas', 67890,'USA'),
  (NULL, 1, 49.99, '2021-03-15', 'ok ', 'Julie Smith', '25 Oak Street', 'Airport West','Ohio','32456','USA'),
  (NULL, 2, 74.98, '2021-03-19', 'ok ', 'Alan Wong', '1/47 Haines Avenue', 'Box Hill', 'Utah', '12345','USA'),
  (NULL, 3, 24.99, '2021-03-01', 'ok ', 'Michelle Arthur', '357 North Road', 'Yarraville', 'Kansas', 67890,'USA'),
  (NULL, 4, 54.99, '2021-03-02', 'ok', 'Yevhen Vieskov', '25 Gagarin street', 'Dnipro', 'Dnipro region', '34521', 'Ukraine');
  

update books
set price = price*1.1;

alter table orders
add tax float(6, 2) after amount;

alter table orders drop tax;

drop table books;

drop user if exists 'test_user'@'localhost';
flush privileges;
create user 'test_user'@'localhost' identified by 'test';
grant select, insert, update, delete, index, alter, create, drop on *.* to 'test_user'@'localhost'; 
flush privileges;


