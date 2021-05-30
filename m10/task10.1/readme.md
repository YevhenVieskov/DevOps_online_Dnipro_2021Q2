# EPAM University Programs

# DevOps external course

# Module 10  10 Configuration Manager Ansible

# TASK 10.1



Ansible configuration.

[ansible.cfg](./ansible.cfg)




AWS instances is created. Connection to hosts is verified.

![alt task10.1.1.jpg](task10.1.1.jpg)

![alt task10.1.2.jpg](task10.1.2.jpg)

![alt task10.1.3.jpg](task10.1.3.jpg)

![alt task10.1.4.jpg](task10.1.4.jpg)

Ansible ad-hoc commands.

`ansible-inventory --list` command used to display or dump the configured inventory as Ansible sees it.
Output all hosts info, works as inventory script.

![alt task10.1.5.jpg](task10.1.5.jpg)

`ansible-inventory --graph` create inventory graph, if supplying pattern it must be a valid group name.

![alt task10.1.6.jpg](task10.1.6.jpg)

`ansible staging -m setup` 

![alt task10.1.7.jpg](task10.1.7.jpg)

`ansible all -m shell -a uptime` 

![alt task10.1.8.jpg](task10.1.8.jpg)

`ansible all -m shell -a "ls /home"`

![alt task10.1.9.jpg](task10.1.9.jpg)

`ansible all -m copy -a "src=hello.txt dest=/home"`

![alt task10.1.10.jpg](task10.1.10.jpg)

`ansible all -m copy -a "src=hello.txt dest=/home" -b`

![alt task10.1.11.jpg](task10.1.11.jpg)

`ansible all -m copy -a "src=hello.txt dest=/home" -b`

![alt task10.1.12.jpg](task10.1.12.jpg)

`ansible all -m shell -a "ls -la /home"`

![alt task10.1.13.jpg](task10.1.13.jpg)

`ansible all -m copy -a "path=/home/hello.txt state=absent" -b`

![alt task10.1.14.jpg](task10.1.14.jpg)

`ansible all -m yum -a "name=httpd state=latest" -b`

![alt task10.1.15.jpg](task10.1.15.jpg)

`ansible test -m service -a "name=httpd state=started enabled=yes" -b`

![alt task10.1.16.jpg](task10.1.16.jpg)

`ansible production -m yum -a "name=httpd state=removed" -b`

![alt task10.1.17.jpg](task10.1.17.jpg)



make info more structured using groups_var

![alt task10.2.1.jpg](task10.2.1.jpg)

Task: Test connection to all servers, owned by your organization.
Assumed, that you have credentials to do this action

[playbook1.yml](./playbook1.yml) results.

![alt task10.2.2.jpg](task10.2.2.jpg)

Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.

[playbook2.yml](./playbook2.yml) results.

![alt task10.2.3.jpg](task10.2.3.jpg)

Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.
Also needed to change default index.html.

[playbook3.yml](./playbook3a.yml) results.

![alt task10.2.4.jpg](task10.2.4.jpg)


[playbook3b.yml](./playbook3b.yml) results.

![alt task10.2.5.jpg](task10.2.5.jpg)

`ansible all -m yum -a "name=httpd state=removed"`

![alt task10.2.6.jpg](task10.2.6.jpg)

Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.
Also needed to change default index.html. Servers are on different Linux-based OS.

[playbook3b.yml](./playbook3b.yml) results. 

![alt task10.2.7.jpg](task10.2.7.jpg)



Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.
Also needed to change default index.html. Servers are on different Linux-based OS.

![alt task10.2.8.jpg](task10.2.8.jpg)

[playbook3.yml](./playbook3b.yml) results.

![alt task10.2.9.jpg](task10.2.9.jpg)

Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.
Also needed to change default index.html. Servers are on different Linux-based OS.

[playbook3c.yml](./playbook3c.yml) results.

![alt task10.2.10.jpg](task10.2.10.jpg)

Task: Install Apache Web Server on all servers, owned by your organization.
Also needed to start Apache Web Server and enable it during boot.
Also needed to change default index.html. Servers are on different Linux-based OS

[playbook4.yml](./playbook4.yml) results.

![alt task10.2.11.jpg](task10.2.11.jpg)



[playbook_loop1.yml](./playbook_loop1.yml) results.

![alt task10.2.12.jpg](task10.2.12.jpg)

Task: Make some actions on remote server,
Results should be viewed by output console

[playbook_loop1.yml](./playbook_loop1.yml) 

![alt task10.2.13.jpg](task10.2.13.jpg)

Task: Copy WebPage (some files) to remote server using loop.

[playbook5.yml](./playbook5.yml) results.

![alt task10.2.14.jpg](task10.2.14.jpg)

Task: Customize WebPage on remote servers using
template and jinja.

[playbook5a.yml](./playbook5a.yml) results.

![alt task10.2.15.jpg](task10.2.15.jpg)


`deploy_apache` ansible role is created.

![alt task10.3.1.jpg](task10.3.1.jpg)

Playbook [playbook5a.yml](./playbook5a.yml) is transformed to [deploy_apache](./deploy_apache) role.

![alt task10.3.2.jpg](task10.3.2.jpg)

![alt task10.3.3.jpg](task10.3.3.jpg)

Playbook for playing role is created.

![alt task10.3.4.jpg](task10.3.4.jpg)










