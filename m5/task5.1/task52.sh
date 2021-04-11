#!usr/bin/bash
#2.1
man tree
touch tree_results.txt tree_root_results.txt
tree -P '*c*' --prune ~ -o tree_results.txt
tree -d -L 2 /root -o tree_root_results.txt
#2.2
file tree_results.txt 
#2.3
#cd ../
#cd ./Documents
#cd ~/task5
#cd ~
#cd ~/task5
#2.4
echo " ls -lR  results:" > task5.2.4.txt
ls -lR >> task5.2.4.txt
echo " ls -R  results:" >> task5.2.4.txt
ls -R >> task5.2.4.txt
echo " ls -l  results:" >> task5.2.4.txt
ls -l >> task5.2.4.txt
echo " ls -al  results:" >> task5.2.4.txt
ls -al >> task5.2.4.txt
#2.5
mkdir ~/subdir
touch ~/subdir/dirinfo.txt
tree -av /root -o dirinfo.txt
cat ~/subdir/dirinfo.txt
cp ~/subdir/dirinfo.txt ~/dirinfo1.txt
cd ~
cp ./subdir/dirinfo.txt ../dirinfo2.txt
rm -r ~/subdir
rm ~/dirinfo1.txt
rm ~/dirinfo2.txt
#2.6
mkdir -p ~/test
cp ~/.bash_history ~/test/labvork2
ln ~/test/labvork2 hardlink
ln -s ~/test/labvork2
ls -li ~/test >> task5.2.6.txt
echo "Hello world!" >>~/test/softlink
cat softlink
mv ~/test/hardlink ~/test/hard_lnk_labwork2
mv ~/test/softlink ~/test/soft_lnk_labwork2
rm labwork2
cat hard_lnk_labwork2
cat symb_lnk_labwork2
#2.7
locate -i squid traceroute > task5.2.7.txt
#2.8
df -T > task5.2.8.txt
#2.9 
grep  bashrc /etc/.bashrc -c
grep bashrc /etc/.bashrc | wc -c
#2.10
find /etc -name "*.*" | grep host > task5.2.10.txt
#2.11????
ls /etc | grep ss > task5.2.11.txt
#2.12??????
tree /etc | less
#2.13
ls -l /dev > task5.2.13.txt
#2.14
file /bin/tar
file /etc/passwd
ls -l /bin/ | grep "^ - "  > task5.2.13.txt   #normal files
ls -l /bin/ | grep "^ b "  >> task5.2.13.txt  #block files
ls -l /bin/ | grep "^ c "  >> task5.2.13.txt  #character files
ls -l /bin/ | grep "^ l "  >> task5.2.13.txt  #symbolic link files
ls -l /bin/ | grep "^ p "  >> task5.2.13.txt  #pipes
ls -l /bin/ | grep "^ s "  >> task5.2.13.txt  #sockets
ls -l /bin/ | grep "^ d "  >> task5.2.13.txt  #directories
#1.2.15

mkdir -p /etc/mydir1 /etc/mydir2 /etc/mydir3 /etc/mydir4 /etc/mydir5 /etc/mydir6 /etc/mydir7 /etc/mydir8
touch /etc/myfile1 /etc/myfile2 /etc/myfile3 /etc/myfile4 /etc/myfile5 /etc/myfile6 /etc/myfile7 /etc/myfile8

find /etc -type f -mmin 30 > task5.2.15.txt  # file search
find /etc -type d -mmin 30 >> task5.2.15.txt # directory search
ls /etc -lt | head -n 5 >> task5.2.15.txt



bin/tar: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=76d3a7dafbd5404630d64e7fb43a38922f680fdc, stripped
/etc/passwd: ASCII text


