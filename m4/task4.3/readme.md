# EPAM University Programs
# DevOps external course
# Module - Networking Fundamentals
# TASK 4.3
## Task:
Build a local area network consisting of a segment based on
switch with 5 computers and a server. The switch is connected to
the router to which the server is also connected.
You must specify static IP addresses for the routers' network interfaces,
local computers and servers. Configure routing on
RIP protocol.
Achieve the ability to transfer data via ICMP between
all network objects.
1. Place the necessary nodes on the work area, using
browser at the bottom of the window (Fig. 1). Connect the nodes according to
task with a twisted pair.
![alt pic.4.3.1.jpg](pic.4.3.1.jpg)
Fig. 1. Workspace
2. Set the ip-addresses of the nodes of the segment in the range 192.168.0.x, and the server,
connected to the router - 192.168.1.1. Subnet Mask -
255.255.255.0. 
3. Set the appropriate ip addresses on the interfaces of the router and
turn on these ports. 
4. Go to the Command Line Interface of the router and with
command enable secret set the password for access and save the configuration.

5. To configure RIP routing, open
Config tab in the router properties window and select RIP.
We will set there the addresses of all subnets that are allowed to communicate. 
We check the availability of workstations. To do this, in the right column
select the Add simple PDU tool and select the sending station and
receiving station. We make sure that the transfer is completed successfully. 
Cisko PacketTracer Project: [task4.3.pkt](./task4.3.pkt)
Network video:  [task4.3.mp4](./task4.3.mp4)




