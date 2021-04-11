# EPAM University Programs
# DevOps external course
# Module 5 05 Linux Essential
# TASK 5.1
## Task1.Part1
1) Log in to the system as root.
   `su root`
2) Use the passwd command to change the password. Examine the basic
parameters of the command. What system file does it change *?
  `passwd root`
3) Determine the users registered in the system, as well as what commands they
execute. What additional information can be gleaned from the command
execution?
   `cat /etc/passwd `
   `cat /etc/group `
   `cat /etc/sudoers `
   `w `
   `who `
   
   The /etc/passwd is a text file which contains a list of the system's accounts, giving for each account 
   some useful information like user ID, group ID, home directory, shell, and more.
   The /etc/group is a text file which defines the groups to which users belong under Linux 
   and UNIX operating system.
   The sudoers file is a file Linux and Unix administrators use to allocate system rights to system users.
   `w` command in Linux is used to show who is logged on and what they are doing.
   The `who` command displays the following information for each user currently logged in to the system 
   if no option is provided: login name of the users, terminal line numbers, login time of the users in
   to system, remote host name of the user.
   
   Results in the file:  [task5.1.3.txt](./task5.1.3.txt)
   
   
   4) Change personal information about yourself.
   `finger -l root `
   `chfn`
   `finger -l root `
   `grep root /etc/passwd`
   `usermod -c "root"`
   
   Results in the file:  [task5.1.4.txt](./task5.1.4.txt)
   
5) Become familiar with the Linux help system and the man and info commands.
Get help on the previously discussed commands, define and describe any two
keys for these commands. Give examples.
    `man chfn`
    `man usermod`
`chfn` is used to change your finger information. This information is stored in the /etc/passwd 
file, and is displayed by the finger program.

Change the full name on the account:

`chfn -f` 
 
Change the work phone number on the account:

`chfn -w`  

In Unix/Linux distributions, the command `usermod` is used to modify or change any attributes of a 
already created user account via command line.

The `-c` option is used to set a brief comment (information) about the user account. 
For example, let’s add information on ‘vieskov‘ user, using the following command.

`usermod -c "This is Vieskov" vieskov`

Change home directory from /home/tecmint to /var/www/:
`usermod -d /var/www/ vieskov`

6) Explore the more and less commands using the help system. View the contents
of files .bash* using commands.
    `man more`
    `man less`
    `more -d .bashrc`
    `less -d .bashrc`
7) * Describe in plans that you are working on laboratory work 1. Tip: You should
read the documentation for the finger command.
     `finger -l root`
	 
	 Superuser's  ' root' password has been changed. information about the users of the 
	 system has been obtained. Changed personal information about the user 'root'.
	 Information about  login name, user name, idle time, login time viewed using the `finger` command. 
	 
	 
	 
8) * List the contents of the home directory using the ls command, define its files
and directories. Hint: Use the help system to familiarize yourself with the ls
command.

     `ls -al --group-directories-first ~`
	 
Results in the file:  [task5.1.8.txt](./task5.1.8.txt)

Script in the file:  [task51.sh](./task51.sh)
	 
## Task1.Part2

1) Examine the tree command. Master the technique of applying a template, for
example, display all files that contain a character c, or files that contain a
specific sequence of characters. List subdirectories of the root directory up to
and including the second nesting level.

`man tree`
`touch tree_results.txt tree_root_results.txt`
`tree -P '*c*' --prune ~ -o tree_results.txt`
`tree -d -L 2 /root -o tree_root_results.txt`

Results in the files:  [tree_results.txt](./tree_results.txt), [tree_root_results.txt](./tree_root_results.txt)

2) What command can be used to determine the type of file (for example, text or
binary)? Give an example.

`file tree_results.txt`
Result: `ASCII Text`

3) Master the skills of navigating the file system using relative and absolute paths.
How can you go back to your home directory from anywhere in the filesystem?

`cd ../`
`cd ./Documents`
`cd ~/task5`
`cd ~   #you can go back to your home directory from anywhere in the filesystem` 
`cd ./task5`

4) Become familiar with the various options for the ls command. Give examples
of listing directories using different keys. Explain the information displayed on
the terminal using the -l and -a switches.

`ls -lR  #list all files and directories with their corresponding subdirectories `
`ls -R   #list all files and directories with their corresponding subdirectories ` 
```ls -l #list the contents of the directory in a table format with columns including:
          content permissions,  number of links to the content, owner of the content,
          group owner of the content,  size of the content in bytes,  last modified date / time of the content
          file or directory name```
`ls -lR  #combination of keys -l and -R `		  
```ls -al  #combination of keys -a and -l. -a list files or directories including hidden files or directories``` 

Results in the file:  [task5.2.4.txt](./task5.2.4.txt)

5) Perform the following sequence of operations:
- create a subdirectory in the home directory;
- in this subdirectory create a file containing information about directories
located in the root directory (using I/O redirection operations);
- view the created file;
- copy the created file to your home directory using relative and absolute
addressing.
- delete the previously created subdirectory with the file requesting removal;
- delete the file copied to the home directory.

`mkdir ~/subdir`
`touch ~/subdir/dirinfo.txt`
`tree -av /root -o dirinfo.txt`
`cat ~/subdir/dirinfo.txt`
`cp ~/subdir/dirinfo.txt ~/dirinfo1.txt`
`cd ~`
`cp ./subdir/dirinfo.txt ../dirinfo2.txt`
`rm -r ~/subdir`
`rm ~/dirinfo1.txt`
`rm ~/dirinfo2.txt`

6) Perform the following sequence of operations:
- create a subdirectory test in the home directory;
- copy the .bash_history file to this directory while changing its name to
labwork2;
- create a hard and soft link to the labwork2 file in the test subdirectory;
- how to define soft and hard link, what do these
concepts;
- change the data by opening a symbolic link. What changes will happen and
why
- rename the hard link file to hard_lnk_labwork2;
- rename the soft link file to symb_lnk_labwork2 file;
- then delete the labwork2. What changes have occurred and why?

`mkdir -p ~/test`
`cp ~/.bash_history ~/test/labvork2`
`ln ~/test/labvork2 hardlink`
`ln -s ~/test/labvork2`
`ls -li ~/test >> task5.2.6.txt`
`echo "Hello world!" >>~/test/softlink`
`cat softlink`
`mv ~/test/hardlink ~/test/hard_lnk_labwork2`
`mv ~/test/softlink ~/test/soft_lnk_labwork2`
`rm labwork2`
`cat hard_lnk_labwork2`
`cat symb_lnk_labwork2`


7) Using the locate utility, find all files that contain the squid and traceroute
sequence.
`locate -i squid traceroute`

Results in the file:  [task5.2.7.txt](./task5.2.7.txt)

8) Determine which partitions are mounted in the system, as well as the types of
these partitions.
`df -T` 

Results in the file:  [task5.2.8.txt](./task5.2.8.txt)


9) Count the number of lines containing a given sequence of characters in a given
file.

`grep  some_text /etc/.bashrc -c`
`grep some_text /etc/.bashrc | wc -c`

10) Using the find command, find all files in the /etc directory containing the
host character sequence.

`find /etc -name "*.*" | grep host`

Results in the file:  [task5.2.10.txt](./task5.2.10.txt)

11) List all objects in /etc that contain the ss character sequence. How can I
duplicate a similar command using a bunch of grep?
`ls /etc | grep ss`

Results in the file:  [task5.2.11.txt](./task5.2.11.txt)

12) Organize a screen-by-screen print of the contents of the /etc directory. Hint:
You must use stream redirection operations.

`tree /etc | less`

13) What are the types of devices and how to determine the type of device? Give
examples.

`ls -l /dev`

Results in the file:  [task5.2.13.txt](./task5.2.13.txt)

14) How to determine the type of file in the system, what types of files are there?
`file /bin/tar`
`file /etc/passwd`
`ls -l /bin/ | grep "^ - "   #normal files`
`ls -l /bin/ | grep "^ b "   #block files`
`ls -l /bin/ | grep "^ c "   #character files`
`ls -l /bin/ | grep "^ l "   #symbolic link files`
`ls -l /bin/ | grep "^ p "   #pipes`
`ls -l /bin/ | grep "^ s "   #sockets`
`ls -l /bin/ | grep "^ d "   #directories`

15) * List the first 5 directory files that were recently accessed in the /etc
directory.
`mkdir -p /etc/mydir1 /etc/mydir2 /etc/mydir3 /etc/mydir4 /etc/mydir5 /etc/mydir6 /etc/mydir7 /etc/mydir8`
`touch /etc/myfile1 /etc/myfile2 /etc/myfile3 /etc/myfile4 /etc/myfile5 /etc/myfile6 /etc/myfile7 /etc/myfile8`

`find /etc -type f -mmin 30  | head -n 5 # first 5 files that were recently accessed in the /etc`
`find /etc -type d -mmin 30  | head -n 5 # first 5 directories  that were recently accessed in the /etc`
`ls /etc -lt | head -n 5     # first 5 directories and files that were recently accessed in the /etc

Script in the file:  [task51.sh](./task51.sh)