# Accessing your virtual machine

## Introduction

You have various options to access your virtual machine. To do things on your virtual machine, you can access your virtual machine using a SSH shell, the built-in VNC client, or you can get a full virtual desktop.  We strongly recommend to use the SSH shell and full virtual desktop for production purposes. The build in VNC client is great for troubleshooting in case of technical issues like crashing VM's or inaccessibility.

## Find IP-adres or hostname

Before accessing your machine you need to find out the address of your VM. There are two addresses you can use:
* IP adres
* Hostname

The IP adress can be found under `Virtual Resources->Virtual Machines`. The external IP to connect to starts with 145.100.XX.XX. If there is no IP address or only an IP address starting with 100.XX.XX.XX, please add a external network device to the VM.

The hostname can be found in the log of your VM. Goto `Virtual Resources->Virtual Machines`, click on your VM, `log` and on top of the log you will find the DNS address. 

For example:
  
```sh
Wed Jun 24 17:54:18 2015 [Z0][HKM][I]: Success executing Hook: SurfSARA_Dns: Added
DNS record: vmname.projectname-institute.vm.surfsara.nl -> 145.100.68.93. 
```

In this cause the hostname of the server is vmname.projectname-institute.vm.surfsara.nl which points to IP-adres 145.100.68.93.

You can predict the hostname: `${vmname}.${projectname}.vm.surfsara.nl`
## SSH access


### From a Linux or MacOS client

MacOS and Linux comes with a build-in SSH client. To use this client open a terminal


### From a Windows client

#### Terminal only
http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
#### Terminal with Graphical User Interface
http://mobaxterm.mobatek.net/


### Getting a virtual desktop on a Linux machine

With Xrdp you can remotely log in on a virtual machine, giving you a full virtual desktop. Moreover, you can close the RDP window and pick up the session later, allowing you to continue to work on a graphical desktop while switching off your own work computer.

First, you need to set up your Linux machine, using the following steps. These steps describe the steps for Centos version 6, which is currently offered by the virtual machine wizard.

create a network filter which allows inbound connections to your virtual machines on port 3389 
configure your virtual machine template to use this network filter  
modify the firewall settings to allow new inbound connections to your virtual machine on port 3389, for example by adding the following line to /etc/sysconfig/iptables:
``` bash
  -A INPUT -m state --state NEW -m tcp -p tcp --dport 3389 -j ACCEPT
```
 reload the firewall configuration, using
``` bash
  service iptables reload
```
 install tigervnc-server and xrdp:
``` bash
  yum install -y tigervnc-server xrdp
```
 start the xrdp service and make them start at boot time:
``` bash
  chkconfig --levels 5 xrdp on
  service xrdp start
```
On newer Fedora systems, use
``` bash
  systemctl enable xrdp
  systemctl start xrdp
  systemctl enable xrdp-sesman
  systemctl start xrdp-sesman
```
 You can now log in on the virtual machine using RDP. From Windows or Mac OSX, use "Remote Desktop Connection", sometimes supplied as an additional package to Microsoft Office. On a Linux desktop, use Rdesktop. **Important**: make sure to set the display to "millions of colors" (Mac OsX) or "high color (16-bits)" (Windows), because "thousands of colors" (Mac OsX) or "high color (15-bits)" (Windows) will give you a non-descriptive error.
 


### Built-in VNC client
#### Cloud view
![vnc_cloudview](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/uploads/df27f2603fbaf79aa6f83abffe87b167/vnc_cloudview.png)





#### User view



