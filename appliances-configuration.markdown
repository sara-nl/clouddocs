---
layout: default
---
# Apps appliances configuration

SURFsara provides pre-made _appliances_ to their HPC Cloud users. These appliances are available via the _Apps_ option in the _Storage_ section in the HPC Cloud user interface and are meant to help users instantiating VM's quickly. Currently we provide some basic _Apps_ for CentOS and Ubuntu.

The _Apps_ are endorsed by the SURFsara HPC Cloud team and are kept up to date. In order to provide our customers with a secure working environment, a set of configurations are applied to the images at boot time via [`one-context`](https://github.com/OpenNebula/addon-context-linux) contextualization. Here you can find some of these configuration details.

1. **Root account**

    The root account is not accessible via SSH. There is also no password for the root account, and only accessible locally (from inside the VM).

1. **Access to the VM**

    To access the Virtual Machine, an SSH public key needs to be injected to the VM. Ssh access to the VM is granted via a user account which can become root once logged in. The username is specified in the App description.

1. **Firewall**

    A firewall is active at boot time with all ports closed with exception of the port for SSH access. CentOS based images are configured with [iptables](https://wiki.centos.org/HowTos/Network/IPTables), whereas Ubuntu/Debian firewall is configured with [ufw](https://wiki.ubuntu.com/UncomplicatedFirewall).

1. **SSH server**

    An ssh server is installed and auto-starts upon boot time.

1. **Software updates**

    The images are configured to auto-update the OS and packages. It can be disabled by the user afterwards.

1. **Intrusion prevention**

    [fail2ban](http://www.fail2ban.org/) is installed and will protect the image from brute-force break-in attempts via ssh / http(s) protocols. A jail ban of 15 min. is applied.

1. **Image template**

    The image template has basic settings to instantiate and operate correctly a VM, namely:

    - acpi = yes
    - memory = 1GB
    - (v)CPU = 1
    - localtime = no
    - internet connection

1. **Network connectivity**

    The images come with a default internet connection, and a static IP will be assigned to your VM. In case you need to have multiple VM's that need to communicate with each other, please update the template and add a second network with your internal range.

> **Note:**
>
> More details are described in the appliances themselves at the _Apps_.
