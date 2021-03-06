## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![image](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/Diagrams/ELK.png?raw=true)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

- [pentest.yml](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/Ansible%20Playbook/pentest.yml)
- [install-elk.yml](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/Ansible%20Playbook/install-elk.yml)
- [filebeat-playbook.yml](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/Ansible%20Playbook/filebeat-playbook.yml)
- [metricbeat-playbook.yml](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/Ansible%20Playbook/metricbeat-playbook.yml)


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network. Jump-Box provisioner is the only machine exposed to the public internet hence it sits in front of other machines within the virtual network. Jump-Box also controls access to the other machines by allowing connections from specific IP addresses and forwarding to those machines.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system information.

Filebeat collects logfiles including those that have been changed and when.
Metricbeat collects system metrics such as uptime, CPU and memory usage.


The configuration details of each machine may be found below.

| Name      | Function  | IP Address | Operating System |
|-----------|-----------|------------|------------------|
| Jump-Box  | Gateway   | 10.0.0.5   | Linux            |
| Web-1     | DVWA      | 10.0.0.6   | Linux            |
| Web-2     | DVWA      | 10.0.0.7   | Linux            |
| Web-3     | Redundancy| 10.0.0.8   | Linux            |
| ELK-Server| Monitoring| 10.1.0.4   | Linux            |
### Access Policies

The DVWA virtual machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine and ELK-Server can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

`localhost`

DVWA servers within the virtual network can only be accessed by the Jump-Box-Provisioner. This machine has a private IP address of 10.0.0.5 and is able to access the ELK-Server internally.


A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses |
|-----------|---------------------|----------------------|
| Jump-Box  |        Yes          |       localhost      |
| Web-1     |         No          |       10.0.0.5       |
| Web-2     |         No          |       10.0.0.5       |
| Web-3     |         No          |       10.0.0.5       |
| ELK-Server|  Yes via port 5601  |       localhost      |



### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this will ensure our provisioning scripts for FileBeat and MetricBeat run identically on the virtual network. This will further ensure our automated configurations will do exactly the same thing every time they run, eliminating as much variability between configurations as possible.
In addition, you can update configuration of an Ansible container and deploy applications in different servers in one instance. 



The playbook implements the following tasks:
* Installs docker.io
* Installs python3-pip
* Installs Docker python module
* Use more virtual memory
* Download and launch the Docker ELK container over ports 5601, 9200, and 5044.
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![image](https://github.com/jahnays/ELK-Stack-Project-1/blob/main/README/Images/sudo_docker_ps.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Web-1: 10.0.0.5
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:

Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:

Filebeat is often used to collect log files from very specific files, such as those generated by Apache, Microsoft Azure tools, the Nginx web server, and MySQL databases. 
Metricbeat collects machine metrics used for checking how ???healthy??? is the system.
In this project, Filebeat is used to collect logfiles whilst Metricbeat is used to collect specific information such as CPU and memory usage of the DVWA servers.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
* Copy the playbook files to the /etc/ansible/ folder of the container.
* Update the hosts file to include the private IP addresses of the DVWA servers as well as the private IP of the ELK-Server. 
* Run the playbook using??ansible-playbook install-elk.yml, and navigate to the public IP of the ELK-Server specifying the port number (in this case port 5601) to check that the installation worked as expected.


_As a **Bonus**, below are the specific commands the user will need to run to download the playbook, update the files, etc._

$ cd/etc/ansible

$ ansible-playbook pentest.yml

$ ansible-playbook install-elk.yml

$ ansible-playbook filebeat-playbook.yml

$ ansible-playbook metricbeat-playbook.yml
