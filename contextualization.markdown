>**NOTE:**
>
>We are working on writing this documentation page. In the meantime, you are advised to have a look at the official OpenNebula documentation pages:
> * [basic contextualisation](http://docs.opennebula.org/4.12/user/virtual_machine_setup/bcont.html)
> * [advanced contextualisation](http://docs.opennebula.org/4.12/user/virtual_machine_setup/cong.html)

## Contextualization explained

_Contextualization_ in OpenNebula refers to:
* the act and effect of OpenNebula making information from the environment available meant for a VM to configure itself. This information is called the _context_.
* the system that enables the former

In summary, OpenNebula provides out-of-the-box facilities to tell a VM about:
* SSH authentication: what certificates or passwords should the VM recognise to allow SSH access to it
* Network configuration: how each `nic` on the VM must be configured (e.g.: IP addresses, network masks...)
* Other variables: the VM receives a file with a list of ⟨key, value⟩ pairs that you specify in the `template`
* Init scripts: what programs the VM must run upon start-up (e.g.: auto-configuration scripts)
* Other files: you can provide files to your VM for your own purposes

### External point of view
The way this information is provided to your VM is by means of a **virtual CD-ROM** (or _contextualization CD-ROM_). OpenNebula builds an `image` (that you do **NOT** get to see on the UI) for each VM for which you have enabled _contextualization_, and it makes it available via the IDE driver so that you can mount it in your operating system. 

### Internal point of view
Some very useful [standard (read .deb and .rpm) packages](https://github.com/OpenNebula/addon-context-linux) are also delivered by the OpenNebula developers, that you can install in your VM. These packages set the booting sequence of the VM up in such a way that the _context information_ is used to configure the VM even before the operating system will prompt for normal login. The packages mount the _context CD-ROM_, then process the files found there to configure the root user to require a private-public key pair to SSH into the VM. They also configure the network according to the _context_, which is very handy because your VM must use the MAC and IP addresses that the HPC Cloud grants them (otherwise, the VM will have no network connectivity).

>**In short:**
>
>* OpenNebula is ready to deliver a _context_ to your VMs. You define in your `template` what you would like to include in this _context_. Standard _context_ information includes SSH keys and network information. The VM can read the _context_ as a CD-ROM.
>
>* You **must adapt your VM** to benefit from this _context_: your VM needs to actively read and interpret the _context_, or otherwise it will ignore the context. 
>
>* In general, **VMs from Marketplace** appliances are set up to use _contextualization_.

## Contextualization in practice

### Standard packages for your VM

On **Debian-based** operating systems (e.g.: Ubuntu, Mint), you can install the standard .deb _contextualization_ package. 

1. Download the .deb file from https://github.com/OpenNebula/addon-context-linux/releases/latest.
1. Bring the .deb to your VM
1. Install the .deb by running (change the <package_name.deb> placeholder by the right file and path):
```sh
dpkg -i <package_name.deb>
```

On **RedHat-based** operating systems (e.g.: CentOS, Fedora), you can install the standard .rpm _contextualization_ package.

1. Download the .rpm file from https://github.com/OpenNebula/addon-context-linux/releases/latest.
1. Bring the .rpm to your VM
1. Install the .deb by running (change the <package_name.rpm> placeholder by the right file and path):
```sh
dpkg -i <package_name.rpm>
```

### SSH key for root
You can let your VM require the root user to log in only with a valid [SSH key](https://en.wikipedia.org/wiki/Secure_Shell#Key_management). This option is the preferred way in the usual Marketplace appliances.

TODOcument: say where to look for it in the template

### Network configuration
You can let your VM configure its `nic`s from the _context_. This option is the preferred way in the usual Marketplace appliances.

TODOcument: say where to look for it in the template

### Init scripts
You can have one (or more) scripts configure other aspects of your VM. For example, you can run a script that will check whether a given non-root user exists, and if it does not, then have the script create one for you.