# EPAM University Programs
# DevOps external course
# Module 5 05 Linux Essential
# TASK 5.3


## Part1

1. How many states could has a process in Linux?

Linux has basically 5 states:

* Running/Runnable (R): running processes are processes using a CPU core right now, a runnable process is a process that has everything to run and is just waiting for a CPU core slot.

* Sleeping: a sleeping process is a process waiting for a resource to be available (for example, a I/O operation to complete) or an event to happen (like a certain amount of time to pass). The difference between process in Interruptible Sleep (S) state and Uninterruptible Sleep (D) is that the former will wake up to handle signals while the former won't. We'll talk about signals in a moment, but let's suppose that a process is waiting for a I/O operation to complete before wake up. If in the meantime, it receives a signal to terminate (SIGKILL), it will terminate before having the chance to handle the requested data. That's why I/O operations normally go to uninterruptible sleep while waiting for the result: they will wake up with when the operation is ready, handle the result and, only then, check for any pending signal to handle. Processes that can be terminated before the wake up condition is fulfilled without any consequence usually go to interruptible sleep instead.

* Stopped (T): a process becomes stopped when it receives the SIGSTOP signal (not unlike when you press <ctrl>+z in the shell, although <ctrl>+z sends a SIGTSTP instead). When stopped, the process execution is suspended and the only signals it will handle are SIGKILL and SIGCONT. The former will remove the process permanently, while the later will put the process back to the Running/Runnable state (like when you run fg or bg after pressing <ctrl>+z in the shell).

* Zombie (Z): when a process finishes with exit() system call, its state needs to be "reaped" by its parent (calling wait()); in the meantime, the child process remains in zombie state (not alive nor dead).

![alt task5.3.1.jpg](task5.3.1.jpg)


2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current
process.

`pstree -hp`

![alt task5.3.2.jpg](task5.3.2.jpg)

3. What is a proc file system?

Proc file system (procfs) is virtual file system created on fly when system boots
and is dissolved at time of system shut down. It contains the useful information
about the processes that are currently running, it is regarded as control and information
centre for kernel.

`ls -l /proc`

![alt task5.3.3.jpg](task5.3.3.jpg)

4. Print information about the processor (its type, supported technologies, etc.).

`mpstat 2 10`

or

`lscpu`

or

`lshw | grep cpu`

or 

`less /proc/cpuinfo`

![alt task5.3.4.1.jpg](task5.3.4.1.jpg)

![alt task5.3.4.2.jpg](task5.3.4.2.jpg)

![alt task5.3.4.3.jpg](task5.3.4.3.jpg)

![alt task5.3.4.3.jpg](task5.3.4.4.jpg)

5. Use the ps command to get information about the process. The information should be as
follows: the owner of the process, the arguments with which the process was launched for
execution, the group owner of this process, etc.

`ps -eF`

![alt task5.3.5.jpg](task5.3.5.jpg)

6. How to define kernel processes and user processes?

User-space processes have its own virtual address space.
Kernel processes or threads do not have their own address space,
they operate within kernel address space only. And they may be
started before the kernel has started any user process (e.g. init).

One way to recognize kernel processes is that they don't use any user memory,
so the vsz field is 0. This also catches zombies , which can be eliminated based on their status.

`ps axl | awk '$7 != 0 && $10 !~ "Z"'`

![alt task5.3.6.jpg](task5.3.6.jpg)


7. Print the list of processes to the terminal. Briefly describe the statuses of the processes.
What condition are they in, or can they be arriving in?

8. Display only the processes of a specific user.

`p -x`

![alt task5.3.6.jpg](task5.3.6.jpg)

9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps
command)?

awk, find, cut, grep and other utilities can be used to analyze existing running tasks

`ps axl | awk '$7 != 0 && $10 !~ "Z"'`

That is check for processes whose `/proc/<pid>/exe` is a link to a file:

`ps -p "$(find -L /proc/[0-9]*/exe ! -type l | cut -d / -f3 | paste -sd , -)"`

10. What information does top command display?

top command is used to show the Linux processes. It provides a dynamic real-time
view of the running system. Usually, this command shows the summary information of
the system and the list of processes or threads which are currently managed by the Linux Kernel.

11. Display the processes of the specific user using the top command.
    
`top -u bes` 

or press `u` interactively to shows processes for a particular user.
You are prompted to enter the username. Blank will show for all users.
It displays only processes with a user id or user name matching that given,
matches on effective user

![alt task5.3.11.jpg](task5.3.11.jpg)

12. What interactive commands can be used to control the top command? Give a couple of
examples.

First of all, you can press h or ? to display the help menu for interactive commands
or a condensed list of commands. We can see the roles of the differents key that
we can use in top command execution.

![alt task5.3.12.1.jpg](task5.3.12.1.jpg)



You can switch between 4 windows with `a` and `w` keys. a moves to next and `w` to previous window.
With `g` command, you can enter a number to select the current window.

![alt task5.3.12.2.jpg](task5.3.12.2.jpg)

Some important information is shown in bold characters. B command toggles use of bold.
This command will influence the use of the bold terminfo capability and alters both
the summary area and task area for the current window. When this toggle is 'ON' and
top is operating in monochrome mode, the entire display will appear as normal text.
Thus, unless the x and/or y toggles are using reverse for emphasis, there will be no
visual confirmation that they are even on.

![alt task5.3.12.3.jpg](task5.3.12.3.jpg)

`d` or `s` keys change the delay between refreshes. Prompt for new delay time, which should be in seconds.
Suppressed in secure mode. When `d` or `s` is pressed, you will be prompted to enter a value ( in seconds )
which will be set as display interval. If you enter 1 here, top will refresh every second.

![alt task5.3.12.4.jpg](task5.3.12.4.jpg)

`l`, `t` and `m` keys will toggle load average, task/cpu status and mem info respectively as discussed in Uptime
and Load Average, CPU State and Memory Usage.

![alt task5.3.12.5.jpg](task5.3.12.5.jpg)

`F` key used to choose what field you want to display on the output screen. To select a field to display,
press `SPACE` or `d` key on the name. The fields marked as * are selected.
Press q or ESC to quit when you have finished.

![alt task5.3.12.6.jpg](task5.3.12.6.jpg)

By default, the sorting is done in descending order. Pressing R shall reverse the sorting order
of the currently sorted column, using this interactive command displays pProcesses consuming the
least amount of cpu are shown first.

![alt task5.3.12.7.jpg](task5.3.12.7.jpg)

`c` displays the full command path along with the command line arguments in the `COMMAND` column.

![alt task5.3.12.8.jpg](task5.3.12.6.8.jpg)

`i` key does not show idle tasks Toggle idle tasks. It displays all tasks or just active tasks.
When this toggle is Off, tasks that have not used any CPU since the last update will not be
displayed. However, due to the granularity of the %CPU and TIME+  fields,  some process may
still be displayed that appear to have used no CPU.

![alt task5.3.12.9.jpg](task5.3.12.9.jpg)

`V` key will display the processes in a parent-child hierarchy as below

![alt task5.3.12.10.jpg](task5.3.12.10.jpg)

Pressing the `Z` key takes the user to a screen where the display color can be changed for
top command. You will be presented with a separate screen. That screen can be used to change
the colors in just the current window or in all four windows before returning to the top display.
When you issue the `Z` interactive command, you have 4 upper case letters to select a target
for 8 numbers to select a color

![alt task5.3.12.11.jpg](task5.3.12.11.jpg)

`z` turns on or off the colored display. it switches the current window between your last
used color scheme and the older form of black-on-white or white-on- black.
This command will alter both the summary area and task area

![alt task5.3.12.12.jpg](task5.3.12.12.jpg)

n or # set the maximum number of tasks displayed. It prompts to enter the number of tasks
to display.
The lessor of your number and available screen rows will be used. When used in alternate-display
mode, this is the command that gives you precise control over the size of each currently visible
task display, except for the very last. It will not affect the last window's size, as all prior
task displays will have already been painted.

Shows Absolute Path of Processes: Press ‘c‘ option in running top command, it will display absolute
path of running processes.

![alt task5.3.12.13.jpg](task5.3.12.13.jpg)

One of the most important commands of top. k is used to send signals to tasks (Usually kill tasks).
You will be prompted for a PID and then the signal to send. Entering no PID or a negative number
will be interpreted as the default shown in the prompt (the first task displayed).
A PID value of zero means the top program itself. The default signal, as reflected in the prompt,
is SIGTERM. However, you can send any signal, via number or name. If you wish to abort the kill process,
do one of the following depending on your progress: at the

*   at the pid prompt, type an invalid number
*   at the signal prompt, type 0 (or any invalid signal)
*   at any prompt, type <Esc>

![alt task5.3.12.14.jpg](task5.3.12.14.jpg)

13. Sort the contents of the processes window using various parameters (for example, the
amount of processor time taken up, etc.)

By default, we have the full screen display mode where the summary and the task data are
displayed in a single window. So, at any time, only one field group can be displayed.
There is also the Alternate Display Mode, where there can be a maximum of four windows,
each displaying a field group. These windows are named Def, Job, Mem and Usr

* Def: sorted by %CPU
* Job: sorted by PID
* Mem: sorted by %MEM
* Usr: sorted by User field

The Alternate Display Mode can be entered into using the A display mode toggle command.
Each of the 4 field groups has a unique separately configurable summary area and its own
configurable task area. Only one of these 4 windows will be the current window.
The current window is displayed on the top left corner.



![alt task5.3.13.jpg](task5.3.13.jpg)

14. Concept of priority, what commands are used to set priority?

The kernel stores a great deal of information about processes including process
priority which is simply the scheduling priority attached to a process. Processes
with a higher priority will be executed before those with a lower priority, while
processes with the same priority are scheduled one after the next, repeatedly.

There are a total of 140 priorities and two distinct priority ranges implemented in Linux.
The first one is a nice value (niceness) which ranges from -20 (highest priority value) to 19
(lowest priority value) and the default is 0, this is what we will uncover in this guide.
The other is the real-time priority, which ranges from 1 to 99 by default, then 100 to 139 are meant for user-space.

One important characteristic of Linux is dynamic priority-based scheduling, which allows the nice value
of processes to be changed (increased or decreased) depending on your needs, as we’ll see later on.


For example, instead of starting a program or command with the default priority,
you can start it with a specific priority using following nice command.

`sudo nice -n 5 tar -czf backup.tar.gz ./Documents/*`
or
`sudo nice --adjustment=5 tar -czf backup.tar.gz ./Documents/*`

![alt task5.3.14.jpg](task5.3.14.jpg)

As we mentioned before, Linux allows dynamic priority-based scheduling.
Therefore, if a program is already running, you can change its priority
with the renice command in this form:

`renice -n  -12  -p 1055`
`renice -n -2  -u apache`

15. Can I change the priority of a process using the top command? If so, how?

The r option is used to change the priority of the process. This operation is also called
renice a task to change the scheduling priority. You will be prompted for a PID and then the
value to nice it to. Entering no PID or a negative number will be interpreted as the default
shown in the prompt (the first task displayed). A PID value of zero means the top program itself.
A positive nice value will cause a process to lose priority. Conversely, a negative nice value
will cause a process to be viewed more favorably by the kernel.

As a general rule, ordinary users can only increase the nice value and are prevented from lowering it.
If you wish to abort the renice process, do one of the following depending on your progress:


*   at the pid prompt, type an invalid number
*   at the nice prompt, type <Enter> with no input
*   at any prompt, type <Esc>


![alt task5.3.15.jpg](task5.3.15.jpg)


16. Examine the kill command. How to send with the kill command
process control signal? Give an example of commonly used signals.

![alt task5.3.16.jpg](task5.3.16.jpg)

17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
demonstrate the process control mechanism with fg, bg.

![alt task5.3.16.jpg](task5.3.17.jpg)



## Part2
1. Check the implementability of the most frequently used OPENSSH commands in the MS
Windows operating system. (Description of the expected result of the commands +
screenshots: command – result should be presented)
2. Implement basic SSH settings to increase the security of the client-server connection (at least
3. List the options for choosing keys for encryption in SSH. Implement 3 of them.
4. Implement port forwarding for the SSH client from the host machine to the guest Linux
virtual machine behind NAT.
5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the
server using ssh, telnet, rlogin. Analyze the result.
