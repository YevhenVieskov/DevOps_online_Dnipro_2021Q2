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

![alt task5.3.11.jpg](task5.3.11.jpg)

12. What interactive commands can be used to control the top command? Give a couple of
examples.



13. Sort the contents of the processes window using various parameters (for example, the
amount of processor time taken up, etc.)
14. Concept of priority, what commands are used to set priority?
15. Can I change the priority of a process using the top command? If so, how?
16. Examine the kill command. How to send with the kill command
process control signal? Give an example of commonly used signals.
17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
demonstrate the process control mechanism with fg, bg.

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