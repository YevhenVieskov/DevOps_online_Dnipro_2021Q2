# EPAM University Programs
# DevOps external course
# Module 6  Networking with Linux
# TASK 6.2

Networking with Linux
1. Create virtual machines connection according to figure 1:

![alt task61figure1.jpg](task61figure1.jpg)



Virtual machine VM2 is cloned from VM1 from task 5.3.

![alt task6.1.1clone.jpg](task6.1.1clone.jpg)

2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network
interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).


VM1 and VM2 settings is edited.


![alt task6.1.2vm1settings.jpg](task6.1.2vm1settings.jpg)

![alt task6.1.2vm1settings2.jpg](task6.1.2vm1settings2.jpg)


![alt task6.1.2vm2settings.jpg](task6.1.2vm2settings.jpg)


VM1 and VM2 network interfaces is edited.

`sudo nano /etc/network/interfaces`
`sudo systemctl restart networking`
`ip a`


VM1:

![alt task6.1.2vm1interfaces.jpg](task6.1.2vm1interfaces.jpg)

![alt task6.1.2vm1interfaces2.jpg](task6.1.2vm1interfaces2.jpg)

VM2:

![alt task6.1.2vm2interfaces.jpg](task6.1.2vm2interfaces.jpg)

![alt task6.1.2vm2interfaces2.jpg](task6.1.2vm2interfaces2.jpg)


IP forwarding is permitted.


![task6.1.2ipforward.jpg](task6.1.2ipforward.jpg)

`iptables` is configured.

![alt task6.1.2vm1iptables.jpg](task6.1.2vm1iptables.jpg)

`iptables` settings is saved. 

![task6.1.2saveiptables.jpg](task6.1.2saveiptables.jpg)




3. Check the route from VM2 to Host.

See next screenshot.

4. Check the access to the Internet, (just ping, for example, 8.8.8.8).

![alt task6.1.3_4routeping.jpg](task6.1.3_4routeping.jpg)


5. Determine, which resource has an IP address 8.8.8.8.


`host 8.8.8.8`

8.8.8.8 is a domain name pointer dns.google.

![alt task6.1.5.jpg](task6.1.5.jpg)

6. Determine, which IP address belongs to resource epam.com.



`host www.epam.com`

![alt task6.1.6host.jpg](task6.1.6host.jpg)

`dig www.epam.com`

![alt task6.1.6dig.jpg](task6.1.6dig.jpg)

`nslookup www.epam.com`

![alt task6.1.6nslookup.jpg](task6.1.6nslookup.jpg)



7. Determine the default gateway for your HOST and display routing table.

`netstat -r`


Default gateway for your HOST and display routing table:


![alt task6.1.7.jpg](task6.1.7.jpg)

8. Trace the route to google.com.

`traceroute www.google.com`


![alt task6.1.8.jpg](task6.1.8.jpg)





