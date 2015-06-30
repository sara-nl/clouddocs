# Accessing your virtual machine

## Introduction

You have various options to access your virtual machine. To do things on your virtual machine, you can access your virtual machine using a shell, the built-in VNC client, or you can get a full virtual desktop. 

## Running commands on your virtual machine

### Built-in VNC client
#### Cloud view
![vnc_cloudview](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/uploads/df27f2603fbaf79aa6f83abffe87b167/vnc_cloudview.png)



### Generate Secure Shell (SSH) key on windows

A way to generate a SSH key under Windows is with help of PutTTY-gen. PuTTYgen can be downloaded at http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html or directly downloaded from http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe .

* Start PuTTYgen
* In the field "Type of key to generate", please select "SSH-2 RSA".
![puttygen_default](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_default.png)

* Click on  "Generate".
* Move your pointer under



![puttygen_random](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_random.png)

![puttygen_done](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_done.png)


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
 



