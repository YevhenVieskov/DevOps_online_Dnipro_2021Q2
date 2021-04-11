#!usr/bin/bash
#1.1
#su root
#1.2
#passwd root
#1.3
cat /etc/passwd > task5.1.3.log
cat /etc/group >> task5.1.3.log
cat /etc/sudoers >> task5.1.3.log
w >> task5.1.3.log
who >> task5.1.3.log
#1.4
finger -l root > task5.1.4.log
chfn
finger -l root >> task5.1.4.log
grep root /etc/passwd
usermod -c "root"
#1.5
man chfn
man usermod
#1.6
man more
man less
more -d .bashrc
less -d .bashrc
#1.7 
finger -l root
#1.8
ls -al --group-directories-first ~ > task5.1.8.log


