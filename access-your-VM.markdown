---
layout: default
---
# Accessing your virtual machine

## Introduction

You have various options to access your virtual machine:

* an SSH shell
* a full virtual desktop
* the built-in VNC client

We strongly recommend you use the SSH shell and full virtual desktop for production purposes. The built-in VNC client is great for troubleshooting in case of technical issues like crashing VMs or inaccessibility.

## Find IP-address or Host name

Before accessing your machine you need to find out the address of your VM. There are two methods you can use:

* IP address
* Host name

The IP address can be found under _Virtual Resources->Virtual Machines_. The external IP to connect to starts with 145.100.XX.XX. If there is no IP address or only an IP address starting with 10.100.XX.XX (which is an internal IP address you cannot reach through the Internet), please add an external `nic` to the VM.

For every VM that you launch, the HPC Cloud assigns it a public host name. The host name can be found your VM's log on the UI. Go to _Virtual Resources->Virtual Machines_, click on your VM, then on the _Log_ tab and, at the top of the log, you will find the DNS address. 

>For example:
> 
>```bash
>Wed Jun 24 17:54:18 2015 [Z0][HKM][I]: Success executing Hook: SurfSARA_Dns: Added
>DNS record: vmname.projectname-institute.vm.surfsara.nl -> 145.100.68.93. 
>```
>
>In this case the host name of the server is vmname.projectname-institute.vm.surfsara.nl which points to IP address 145.100.68.93.

You can predict the host name: `${vmname}.${projectname}.vm.surfsara.nl`

>For example:
>
>If you are working on a project called _analysys-acme_ and you want to have a VM reachable at host name _r-studio.analysys-acme.vm.surfsara.nl_, you just need to give your VM the name _r-studio_. And, of course, you need to make that VM have a `nic` connected to the Internet.

## SSH access

### From a Linux or MacOS  or Windows (GitBash) client 

* MacOS and Linux come with built-in SSH clients. To use these, open a terminal.
* Windows users can download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between `Git-XXX-32-bit.exe` or `Git-XXX-64-bit.exe`. 
  * For Windows users that want to use Putty, see the instructions for [Putty tools](putty-tools#ssh-access-from-a-windows-putty-client).

#### Terminal only

In a terminal type

```bash
ssh username@vmname.projectname-institute.vm.surfsara.nl
```

to connect to your Virtual Machine. You can replace the hostname with your VM's public IP-address and vice-versa.

#### Terminal with Graphical User Interface

If you have a full desktop environment on your VM and would like to run graphical programs there whose windows you want to view on your local computer, add an additional **`-X`** to the command.  

```bash
ssh -X username@vmname.projectname-institute.vm.surfsara.nl
```

>**Note:**
>
>You might need to install additional software on MacOS or Windows when using the `-X` flag.

>**Note:**
>The first time you start a session to a VM a warning is given that the machine is not cached. Select _yes_ to continue the session.

#### Terminal with Graphical User Interface for Windows only
If you want to have graphical programs running on the VM whose windows are displayed on your local computer and you are running Windows on your local computer, then you are advised to have a look at Mobaxterm, an application you can read about more at: [http://mobaxterm.mobatek.net/](http://mobaxterm.mobatek.net/)

## Getting a Remote Desktop on a Linux VM

With Xrdp you can remotely log in on a virtual machine, giving you a full virtual desktop. Moreover, you can close the RDP window and pick up the session later, allowing you to continue to work on a graphical desktop while switching off your own local computer.

Further instructions can be found at [ X-server Remote Desktop Protocol (Xrdp)](xrdp)


### Built-in VNC client

The built-in VNC console is accessible from your web browser, and you do **not** have to install anything on your VM for it to work. When you open it, you will see a screen as if a physical monitor would be connected to a computer.

However, the button to launch that VNC client is placed in different locations depending on the `view` you are using on the UI. Here is a list of known views:

#### Cloud view
![vnc_cloud1](images/vnc_cloud1.png)

![vnc_cloud2](images/vnc_cloud2.png)

#### User view and groupadmin view
To start VNC you can click the small display at the right side of your screen.

![vnc_userview](images/vnc_userview.png)

