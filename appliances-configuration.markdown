---
layout: default
---

# AppMarket appliances configuration

SURFsara provides pre-made _appliances_ to their HPC Cloud users. These appliances are available to the users via the _AppMarket_ in the HPC Cloud user interface and are meant to help users instantiating secure Vm's quickly.

We provide a set of basic _appliances_ for CentOS and Ubuntu and here bellow you can find the configuration details. The aim is to provide you with a secure environment at boot time.

**1. Root account**

    The root account is not accessible via SSH.

2. Firewall

    A firewall is active at boot time with all ports closed with exception of one for SSH access.

3. SSH server

    An ssh server is installed and auto-starts upon boot time.

4. Software updates

    The images are configured to auto-update the OS and packages.

5. Intrusion prevention

    `fail2ban` is installed and will protect the image from brute-force break-in attempts via ssh / http(s) protocols. A jail ban of 15 min. is applied.

6. Image template

    The image template has basic settings to instantiate correctly a VM, namely:

    - acpi=yes,
    - memory=1GB,
    - 1cpu, 1vcpu,
    - localtime=no/yes,
    - internet connection
