/*look at user table*/
use mysql
select user,host from user;
/*
delete users if they exists,
bug prevention:  ERROR 1396 (HY000): Operation CREATE USER failed for 'user'@'localhost',
https://stackoverflow.com/questions/598190/mysql-check-if-the-user-exists-and-drop-it,
https://dev.mysql.com/doc/refman/5.7/en/drop-user.html
*/


drop user if exists 'admin'@'localhost';
drop user if exists 'petrov'@'localhost';
drop user if exists 'ivanov'@'localhost';
drop user if exists 'sidorov'@'localhost';
flush privileges;

/*create new users*/
create database new_users;
use new_users;

create user 'admin'@'localhost' identified by 'password1';
grant all on *.* to 'admin'@'localhost' ;

create user 'petrov'@'localhost' identified by 'password2';
grant select, insert, update on *.* to 'petrov'@'localhost' ;

create user 'ivanov'@'localhost' identified by 'password3';
grant select, insert, update, delete, index, alter, create, drop on *.* to 'ivanov'@'localhost'; 

create user 'sidorov'@'localhost' identified by 'password4';
grant select on *.* to 'sidorov'@'localhost' ;

flush privileges;






