# Accessing your virtual machine

## Introduction

You have various options to access your virtual machine. To do things on your virtual machine, you can access your virtual machine using a SSH shell, the built-in VNC client, or you can get a full virtual desktop.  We strongly recommend to use the SSH shell and full virtual desktop for production purposes. The build in VNC client is great for troubleshooting in case of technical issues like crashing VM's or inaccessibility.
  

## Running commands on your virtual machine

### Built-in VNC client
#### Cloud view
![vnc_cloudview](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/uploads/df27f2603fbaf79aa6f83abffe87b167/vnc_cloudview.png)





#### User view






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
 



