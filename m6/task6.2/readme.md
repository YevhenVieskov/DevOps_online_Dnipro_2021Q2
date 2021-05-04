# EPAM University Programs
# DevOps external course
# Module 6  Networking with Linux
# TASK 6.2

## Configuring DHCP, DNS servers and dynamic routing using OSPF protocol

1. Use already created internal-network for three VMs (VM1-VM3). VM1 has NAT and internal,
VM2, VM3 – internal only interfaces.

Virtual machine VM3 is cloned from VM2 from task 6.1.

![alt task6.2.1clone.jpg](task6.2.1clone.jpg)

2. Install and configure DHCP server on VM1.
(3 ways: using VBoxManage, DNSMASQ and ISC-DHSPSERVER).
You should use at least 2 of them.




DHCP server on VM1 is installed (DNSMASQ).

![alt task6.2.2install.jpg](task6.2.2install.jpg)


DHCP server on VM1 is configured (DNSMASQ).


![alt task6.2.2dhcpconf1.jpg](task6.2.2dhcpconf1.jpg)


![alt task6.2.2dhcpconf2.jpg](task6.2.2dhcpconf2.jpg)

Interfaces on VM2 and VM3 is edited.

![alt task6.2.2interfacesVM2VM3.jpg](task6.2.2interfacesVM2VM3.jpg)


3. Check VM2 and VM3 for obtaining network addresses from DHCP server.

![alt task6.2.3checkVM2VM3.jpg](task6.2.3checkVM2VM3.jpg)

4. Using existed network for three VMs (from p.1) install and configure DNS server on VM1. (You can
use DNSMASQ, BIND9 or something else).

DNS server DNSMASQ is configured.

![alt task6.2.4enableDNS.jpg](task6.2.4enableDNS.jpg)

5. Check VM2 and VM3 for gaining access to DNS server (naming services).

![alt task6.2.5checkDNS.jpg](task6.2.5checkDNS.jpg)

6. ***Using the scheme which follows, configure dynamic routing using OSPF protocol.

![alt task6.2.6network.jpg](task6.2.6network.jpg)

7. Check results.

Result is checked (DNSMASQ)

![alt task6.2.7checkingresult.jpg](task6.2.7checkingresult.jpg)

