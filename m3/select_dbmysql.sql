 use mysql;
 show tables;
 describe db;
 select Db from db;
 select User from db;
 select * from db where User = 'admin';
 select * from db group by User;
 select Grant_priv from db;
 select Host, Db, User from db;
 select Host, Db, User, Alter_priv from db;
 select Host, Db, Alter_priv from db group by user;