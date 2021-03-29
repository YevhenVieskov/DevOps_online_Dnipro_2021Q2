use book_sc;

insert into customers values
  (1, 'Julie Smith', '25 Oak Street', 'Airport West','Ohio','32456','USA'),
  (2, 'Alan Wong', '1/47 Haines Avenue', 'Box Hill', 'Utah', '12345','USA'),
  (3, 'Michelle Arthur', '357 North Road', 'Yarraville', 'Kansas', 67890,'USA'),
  (4, 'Yevhen Vieskov', '25 Gagarin street', 'Dnipro', 'Dnipro region', '34521', 'Ukraine');
  

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
  

insert into order_items values
  (1, '0-672-31697-8', 34.99, 2),
  (2, '0-672-31769-9', 49.99, 1),
  (3, '0-672-31769-9', 49.99, 1),
  (3, '0-672-31509-2', 24.99, 1),
  (4, '0-672-31745-1', 24.99, 3),
  (5, '8-761-78829-5', 54.99, 3);




insert into categories values (1,'Java Programming');
insert into categories values (2,'Linux');
insert into categories values (5,'Computer Graphics');
insert into categories values (4,'DevOps');

insert into admin values ('admin', sha1('admin'));
