---
layout: default
---

# AppMarket appliances configuration

SURFsara provides pre-made _appliances_ to their HPC Cloud users. These appliances are available via the _AppMarket_ in the HPC Cloud user interface and are meant to help users instantiating secure Vm's quickly. Currently we provide a set of basic _appliances_ for CentOS and Ubuntu.

The _AppMarket_ _appliances_ are endorsed by SURFsara HPC Cloud team and are kept up to date. In order to provide our customers with a secure working environment, a set of configurations are applied to the images at boot time via `cloud-init` contextualization. Here bellow you can find the configuration details.

1. **Root account**

    The root account is not accessible via SSH. There is also no password for the root account, and only accessible locally (from inside the VM).

2. **Access to the VM**

    To access the Virtual Machine, an SSH public key needs to be injected to the VM. The ssh access to the VM is granted via a super user account.

3. **Firewall**

    A firewall is active at boot time with all ports closed with exception of the port for SSH access. CentOS based images are configured with [iptables](https://wiki.centos.org/HowTos/Network/IPTables), whereas Ubuntu firewall is configured with [ufw](https://wiki.ubuntu.com/UncomplicatedFirewall).

4. **SSH server**

    An ssh server is installed and auto-starts upon boot time.

5. **Software updates**

    The images are configured to auto-update the OS and packages. It can be disabled by the user afterwards.

6. **Intrusion prevention**

    [fail2ban](http://www.fail2ban.org/) is installed and will protect the image from brute-force break-in attempts via ssh / http(s) protocols. A jail ban of 15 min. is applied. 

7. **Image template**

    The image template has basic settings to instantiate and operate correctly a VM, namely:

    - acpi = yes
    - memory = 1GB
    - (v)CPU = 1
    - localtime = no
    - internet connection

8. **Network connectivity**

    The images come with a default internet connection, and a static IP will be assigned to your VM. In case you need to have multiple VM's that need to communicate with each other, please update the template and add a second network with your internal range.

> **Note:**
>
> More details are described in the appliances themselves at the _AppMarket_.
