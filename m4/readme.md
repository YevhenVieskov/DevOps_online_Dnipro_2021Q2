EPAM University Programs
DevOps external course
Module 4 Networking Fundamentals
TASK 4.1
1. Assemble the following project (Fig. 1), which contains: 4 PC type PC-
PT, Hub-PT. Every computer must be connected to
concentrator with twisted pair (Copper Straight-through).
Figure 1 - Topology 1
2. Save the project and its screenshot.
3. Assign a unique IP address to each PC. For its purpose
you need to go to the PC configuration menu by clicking once on
left-click it and select the Config / Interface tab. In the field ip
address you must enter the appropriate address, and in the Subnet Mask field - accordingly
this address mask (Fig. 2).
Figure 2 - Assign the address of the local machine
The values ​​of the IP address for each machine are given in the table:
PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
The value of the mask for the address: 255.255.255.0.
4. Check the performance of the received network by implementation
Internet requests (ICMP packets) from one PC to another. For assignment
For such a PC package, use the ADD SIMPLE PDU button on the right
working window. Then left-click on the local one
the source machine, then the recipient machine. Check performance
network.
5. Switch to Simulation mode and use the Event List button
call the window to display events in the Simulation Panel network.
Use the Auto Capture / Play button to start the simulation
ICMP packet operation. Track the promotion of packets over the network and save
this screenshot.
6. Follow the order and path of packets in the window
Simulation Panel (Fig. 3). Save this screenshot.
7. View information about packages from the Simulation Panel window and them
matching the OSI model by double-clicking on the package in the window (Fig.
4). Save the results as a screenshot.
Figure 3 - Simulation Panel
Figure 4 - OSI model package compliance
8. Delete the IP address from each local machine PC0 - PC3.
Repeat steps 5 - 10. Analyze the differences in the network.
9. Assemble the next project (Fig. 5). It includes: PC0-PC5, Server,
2 Hubs. Devices of the same name are connected by a crossover cable
(Copper Cross-over).
Figure 5 - Topology 2
10. Assign an IP address to each network component from the following
tables:
PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
PC4 192.168.0.6
PC5 192.168.0.7
Server 192.168.0.5
The value of the mask for the address: 255.255.255.0.
11. Check the network performance.
12. Create a new project, which includes: 4 PCs such as PC-PT,
Switch. Every computer must be connected to
concentrator with twisted pair (Copper Straight-through) (Fig.
6).
Figure 6 - Topology 3
13. For this topology, repeat steps 3-9. Analyze
differences in the operation of the network Topology 1 and Topology 3.
14. Expand the project to this form (Fig. 7). It includes: 8 PCs
type PC-PT, 2 switches (Switch). Each computer must be connected
with the switch by means of twisted pair (Copper Straight-through),
switches are interconnected by a crossover cable (Copper
Cross-over).
15. If necessary, add additional ports to the switches. For this
you need to drag each of them in the Physical / MODULES tab
the Ethernet port is available in the empty slot by first turning off the switch
using the power button.
Figure 7 - Topology 4
16. Assign an IP address to each network component from the following
tables:
PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
PC4 192.168.0.5
PC5 192.168.0.6
PC6 192.168.0.7
PC7 192.168.0.8
The value of the mask for the address: 255.255.255.0.
17. Check the network performance.
18. Divide the existing network into two subnet levels. And connect them by
using a Router-PT router with multiple ports (Fig. 8).
Connect the router and switches together using fiber optics
(Fiber).
Figure 8 - Topology 5
19. Assign IP addresses to PC4 - PC7 computers from the following
tables:
PC4 192.168.1.1
PC5 192.168.1.2
PC6 192.168.1.3
PC7 192.168.1.4
The value of the mask remains the same: 255.255.255.0.
20. Router ports should be enabled (On) and assigned an IP
addresses in the range of the selected subnet.
21. On each of the computers (PC0 - PC7) it is necessary to mark the gateway.
To assign it, go to the Desktop / Ip Configuration menu and
in the Default Gateway field, enter the port address of the router through which to
it connects the subnet that includes this PC.
22. Check the network.
23. Analyze the differences in the network Topology 4 and Topology
5. Evaluate the opportunities provided by the use of the router. 


EPAM University Programs
DevOps external course
Module - Networking Fundamentals
TASK 4.2
Task 1.
It is necessary to model the corporate network of the organization that contains
2 houses with 2 floors in each. Horizontal floor subsystem
consists of one working group of 5 computers.
Analyze the performance of the network and its traffic.
Task 2.
It is necessary to model the corporate network of the organization that contains
1 house with four floors. Horizontal floor subsystem
consists of two working groups of 3 and 5 computers, respectively.
Carry out logical structuring of the network into 8 subnets (respectively
to the number of working groups). Conduct an analysis of the network and its performance
traffic.
Task 3.
It is necessary to model the local network of the complex of 5
one-storey buildings. One building - 1 working group of 6 computers.
The network is based on a router with one port. 


Виды перевода
Перевод текстов
Исходный текст
EPAM University Programs DevOps external course Module - Networking Fundamentals TASK 4.3 Zavdannya: Pobuduvaty lokalʹnu merezhu, shcho skladayetʹsya z sehmenta na osnovi komutatora z 5 komp'yuteriv i servera. Komutator z'yednanyy z marshrutyzatorom, do yakoho takozh pidklyuchenyy server. Neobkhidno zadaty statychni IP adresy merezhnykh interfeysiv marshrutyzatoriv, lokalʹnykh komp'yuteriv i serveriv. Nalashtuvaty marshrutyzatsiyu po protokolu RIP. Domohtysya mozhlyvosti peresylannya danykh po protokolu ICMP mizh usima ob'yektamy merezhi. 1. Rozstavlyayemo na robochomu poli neobkhidni vuzly, vykorystovuyuchy brauzer v nyzhniy chastyni vikna (rys. 1). Z'yednuyemo vuzly vidpovidno do zavdannya za dopomohoyu kruchenoyi pary. Rys. 1.Rabochee pole 2. Zadamo ip-adresy vuzliv sehmenta v diapazoni 192.168.0.kh, a servera, pidklyuchenoho do marshrutyzatora - 192.168.1.1. Maska pidmerezhi - 255.255.255.0. (Rys. 2) Rys. 2. IP konfihuratsiya robochoyi stantsiyi. 3. Zadamo vidpovidni ip adresy na interfeysakh marshrutyzatora i vklyuchymo tsi porty. (Rys. 3). Rys.3 IP konfihuratsiya marshrutyzatora. 4. Zaydemo v Command Line Interface marshrutyzatora i za dopomohoyu komandy enable secret zadamo parolʹ dlya dostupu i zberezhemo konfihuratsiyu. (Rys.4) Rys. 4 Robota v Command Line Interface. 5. Dlya nalashtuvannya marshrutyzatsiyi po protokolu RIP vidkryyemo vkladku Config u vikni vlastyvostey marshrutyzatora i vyberemo punkt RIP. Zadamo tam adresy vsikh pidmerezh, yakym dozvoleno spilkuvannya. (Rys. 5). Rys 5 Nalashtuvannya marshrutyzatsiyi po protokolu RIP Pereviryayemo dostupnistʹ robochykh stantsiy. Dlya tsʹoho v praviy kolontsi vybyrayemo instrument Add simple PDU i vybyrayemo stantsiyu-vidpravnyk i stantsiyu-oderzhuvach. Perekonuyemosya, shcho peredacha zavershena uspishno. (Rys. 6) Rys. 6. Perevirka dostupnosti vuzliv v merezhi.
Ещё
1738 / 5000
Результаты перевода
EPAM University Programs
DevOps external course
Module - Networking Fundamentals
TASK 4.3
Task:
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
Fig. 1. Workspace
2. Set the ip-addresses of the nodes of the segment in the range 192.168.0.x, and the server,
connected to the router - 192.168.1.1. Subnet Mask -
255.255.255.0. (Fig. 2)
Fig. 2. IP configuration of the workstation.
3. Set the appropriate ip addresses on the interfaces of the router and
turn on these ports. (Fig. 3).
Fig.3 IP configuration of the router.
4. Go to the Command Line Interface of the router and with
command enable secret set the password for access and save the configuration.
(Fig.4)
Fig. 4 Work in Command Line Interface.
5. To configure RIP routing, open
Config tab in the router properties window and select RIP.
We will set there the addresses of all subnets that are allowed to communicate. (Fig. 5).
Figure 5 RIP routing settings
We check the availability of workstations. To do this, in the right column
select the Add simple PDU tool and select the sending station and
receiving station. We make sure that the transfer is completed successfully. (Fig.
6)
Fig. 6. Check the availability of nodes in the network. 

EPAM University Programs
DevOps external course
Module - Networking Fundamentals
TASK 4.4 bonus
1. The bonus task is optional.
We take as a basis any task task 4.2 or 4.3 and in your existing
add a router to the network so that there are at least two of them in the network. And it is necessary
configure traffic between two networks.
If you already have 2 routers and traffic in your existing network
configured, you do not need to perform this task.
2. The bonus task is optional.
Organize 2 subnets. Configure DNS on servers. 





