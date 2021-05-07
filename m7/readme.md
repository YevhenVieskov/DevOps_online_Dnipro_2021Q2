# EPAM University Programs

# DevOps external course

# Module 7  Linux administration with bash

# TASK 7.1

A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
3. The --target key displays a list of open system TCP ports.

Script for task 7a: [task7a.sh](task7a.sh)

Results for task 7a: [task7a_res_all](task7a_res_all), [task7a_target](task7a_target)



The code that performs the functionality of each of the subtasks must be placed in a separate function
B. Using Apache log example create a script to answer the following questions:
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)

Script for task 7b: [task7b.sh](task7b.sh)

Results for task 7b: [task7a_res_all](task7a_res_all), [task7a_target](task7a_target)


C. Create a data backup script that takes the following data as parameters:
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
In case of adding new or deleting old files, the script must add a corresponding entry to the log file
indicating the time, type of operation and file name. [The command to run the script must be added to
crontab with a run frequency of one minute]

Script for task 7c: [task7c.sh](task7c.sh)
Crontab file : [crontab.sh](crontab.sh)






