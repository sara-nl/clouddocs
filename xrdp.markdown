---
layout: default
---
# X-server Remote Desktop Protocol (Xrdp)

With Xrdp you can remotely log in on a virtual machine, giving you a full virtual desktop. Moreover, you can close the RDP window and pick up the session later, allowing you to continue to work on a graphical desktop while switching off your own local computer.

First, you need to set up your Linux VM, using the following steps.

# Ubuntu 18

Simplified procedure:

* Create a VM out of our Ubuntu 18 Desktop App. Then, log in via SSH into that VM:

>**Note:**
>
>You will have to type in the user's password (by default, the same as the user name). Then type in a new password, repeat that when asked, and you are in a terminal on the remote VM.

```bash
ssh ubuntu@145.100...
```

* We will install a few packages now:

```bash
sudo apt update && sudo apt install -y xorgxrdp xrdp xfce4 tango-icon-theme
```

* Let's set the default manager:

```bash
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
```

* Finally, let's open the firewall:

```bash
sudo ufw allow 3389/tcp
```

* To make sure there are no astray sessions which may interfere, let's reboot our Ubuntu now:

```bash
sudo reboot now
```

After these steps, you should now be able to use your Remote Desktop client from your laptop to connect to the graphical environment. If, after logging in through the Remote Desktop client you are asked to choose a session type, the default "Xorg" should be fine.


#  Ubuntu 14.04, 16.04

The default Unity desktop does not support remote sessions as well as other desktop environments do. To create a virtual machine with a GUI, create a plain server VM and install the desktop environment of your choice, for example KDE or Xfce (which is used in the example below). This following example works under Ubuntu 14.04 server.

* Become root:

```bash
sudo su -
```

* Configure firewall to allow RDP and SSH to connect to your machine and enable the firewall

```bash
  ufw allow 3389
  ufw allow ssh
  ufw enable
```

* Create a normal user account add this user to the super users. (replace maarten by your own login name)

```bash
  USERNAME=maarten
  adduser $USERNAME
  adduser $USERNAME sudo
  sudo usermod -aG sudo,adm $USERNAME
```

* Update software repository and install necessary software

```bash
  sudo apt-get install xrdp xubuntu-desktop tightvncserver
  apt-get update
```

* login to a normal user account

```bash
  su $USERNAME
```

* Add settings to use right desktop environment

```bash
  echo xfce4-session >~/.xsession
```
* Restart xrdp to refresh settings set in previous line

```bash
  sudo service xrdp restart
```

Now you can connect to your machine. However, Ubuntu's default settings are to create a new session each time you log in instead of resuming your old session. Let us fix this. 

>**Note:**
>
>In the next step you will have to edit a file by using a text editor. For example, you can use `sudo nano /etc/xrdp/xrdp.ini` to edit the file we will tell you in a moment. To save the changes you can then press the key combination `Ctrl + X` (see then that at the bottom of the screen you get a question like _Save modified buffer [...]?_. Press then the `y` key, and finally hit `Enter`.

* Edit the file `/etc/xrdp/xrdp.ini` and change the items under the `[xrdp1]` header to:

```bash
[xrdp1]
  name=reconnect
  lib=libvnc.so
  username=ask
  password=ask
  ip=127.0.0.1
  port=ask5910
```

* Log into your VM with RDP and use port `-1` for the first session and start your virtual desktop.
* Exit the RDP client (the VM keeps running and keeps resuming resources)
* Log in again and use port `5910` (default value) and you will continue the previous session.



## CENTOS 6
>**Note:**
>
>The following steps describe the procedure for setting up Xrdp in CentOS 6. Other distributions may require some variation, but the guidelines should remain analogous.

* **Open your firewall:** On your VM, modify the firewall settings to allow new inbound connections on port 3389, for example by adding the following line to /etc/sysconfig/iptables:

```bash
  -A INPUT -m state --state NEW -m tcp -p tcp --dport 3389 -j ACCEPT
```

 reload the firewall configuration, using

```bash
  service iptables reload
```

* **Install the Xrdp server:** In our distribution, install packages _tigervnc-server_ and _xrdp_:

```bash
  yum install -y tigervnc-server xrdp
```

* **Configure the Xrdp service:** make the start at boot time, and start it for this session already:

```bash
  chkconfig --levels 5 xrdp on
  service xrdp start
```

>**Note:**
>
>On newer Fedora-based systems, use

```bash
  systemctl enable xrdp
  systemctl start xrdp
  systemctl enable xrdp-sesman
  systemctl start xrdp-sesman
```

You can now log in on the virtual machine using RDP. From Windows or Mac OSX, use the _Remote Desktop Connection_ client, sometimes supplied as an additional package to _Microsoft Office_. On a Linux desktop, use _Rdesktop_. 

>**Note:**
>
>Make sure to set the display to _millions of colors_ (Mac OsX) or _high color (16-bits)_ (Windows), because _thousands of colors_ (Mac OsX) or _high color (15-bits)_ (Windows) will give you a non-descriptive error.


## Windows

We have a [full page on installing Windows](Windows), where we explain how serve access to Remote Desktop from it.
