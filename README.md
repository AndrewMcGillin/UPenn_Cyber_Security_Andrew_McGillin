## ELK Stack Project #1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/AndrewMcGillin/UPenn_Cyber_Security_Andrew_McGillin/blob/14ecaffb2a2257cc57604637f922c9f0dfb87745/Diagrams/Project%201%20Diagram.drawio.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - /etc/ansible/install-elk.yml
  - /etc/ansible/roles/filebeat-playbook.yml
  - /etc/ansible/roles/metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting traffic to the network.
- Load balancers protect the availability of your Web Servers
- The Jump Box Machine allows for automating the provisioning of the machines on the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log data and system metrics.
- Filebeat monitors and visualizes changes to log data.
- Metricbeat records OS and application metrics.

The configuration details of each machine may be found below.

 | Name     | Function | IP Address | Operating System 

  Jump Box | Gateway   | 10.0.0.1  | Linux            
  Elk-VM   | Container | 10.1.0.4  | Linux            
  Web-1    | Web Server| 10.0.0.5  | Linux            
  Web-2    | Web Server| 10.0.0.6  | Linux           
  Web-3    | Web Server| 10.0.0.7  | Linux              

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
- 108.16.254.189


Machines within the network can only be accessed by Ansible Container (Hungry_Nobel).
- Elk VM machine can only accept connections from the Ansible Container (Hungry_Nobel).

A summary of the access policies in place can be found in the table below.


 | Name     | Publicly Accessible | Allowed IP Addresses 

 | Jump Box | Yes                 | 108.16.254.189       
 | Elk VM   | No                  | None                 
 | Web-1    | No                  | None                 
 | Web-2    | No                  | None                 
 | Web-3    | No                  | None                 


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automating allows us to easily manage OS and app updates and installs, start and stop services, security policy implementation, and other configuration jobs through a YAML script.

The playbook implements the following tasks:
1.	Installs apt packages docker.io (Docker engine) and python-pip (Python Software)
2.	Install pip packages necessary for ansible to control the state of docker containers (docker) and download version 761 of the elk container from sebp. 
3.	Configure the VM to increase max map count to 262,144 memory-mapped areas to ensure the ELK container has the memory it needs to run.
4.	Configure the container’s port mappings to enable the elk container to open port 5601 (Kibana), 9200 (Elastisearch), and 5044 (Logstash).
5.	Enable docker service to boot automatically when the ELK VM restarts.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
-	10.0.0.5
-	10.0.0.6
-	10.0.0.7

We have installed the following Beats on these machines:
-	Filebeat
-	Metricbeat

These Beats allow us to collect the following information from each machine:
-	Filebeat monitors log files or specified locations and collects log events. (i.e. audit logs, deprecation logs)
-	Metricbeat collects metrics from operating systems and services. (i.e. CPU to memory, Redis to NGINX)

### Using the Playbooks
In order to use the playbooks, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat Configuration file to /etc/ansible/filebeat-config.yml.
- Update the configuration file to include 
- Line #1106 replace the IP address with the IP address of your ELK machine
   output.elasticsearch:
   hosts: ["10.1.0.4:9200"]
   username: "elastic"
   password: "changeme"
- Line #1806 replace the IP address with the IP address of your ELK machine.
   setup.kibana:
   host: "10.1.0.4:5601"


- Run the playbook, and navigate to http://20.99.253.115:5601/app/kibana to check that the installation worked as expected.

-	The Filebeat configuration file is in the playbook, and needs to be copied to /etc/filebeat/filebeat.yml
-	The hosts file needs to be updated with the IP addresses of your web servers and elk machine. Your YAML script will specify on which hosts the playbook will be executed.
-	navigate to http://20.99.253.115:5601/app/kibana to check that the installation worked as expected.
 

The commands needed to run the Ansible configuration for the Elk-Server are:

- ssh azadmin@JumpBox(Public IP)
- sudo docker container list -a (locate your ansible container)
- sudo docker start container (name of the container)
- sudo docker attach container (name of the container)
cd /etc/ansible/ - ansible-playbook elk.yml (configures Elk-Server and starts the Elk container on the Elk-Server) wait a couple minutes for the implementation of the Elk-Server - cd /etc/ansible/roles/ - ansible-playbook filebeat-playbook.yml (installs Filebeat and Metricbeat) - open a new web browser (http://[your.ELK-VM.External.IP]:5601/app/kibana) This will bring up the Kibana Web Portal - check the Module status for file beat and metric beat to see their data receiving.

** You will need to ensure all files are properly placed before running the ansible-playbooks



