>**NOTE:**
>
>We are working on writing this documentation page. In the meantime, you are advised to have a look at the official OpenNebula documentation pages:
> * [basic contextualisation](http://docs.opennebula.org/4.12/user/virtual_machine_setup/bcont.html)
> * [advanced contextualisation](http://docs.opennebula.org/4.12/user/virtual_machine_setup/cong.html)

## Contextualization explained

_Contextualization_ in OpenNebula refers to:
* the act and effect of OpenNebula making information from the environment available meant for a VM to configure itself. This information is called the _context_.
* the system that enables the former

In practice, OpenNebula provides out-of-the-box facilities to tell a VM about:
* SSH authentication: what certificates or passwords should the VM recognise to allow SSH access to it
* Network configuration: how each `nic` on the VM must be configured (e.g.: IP addresses, network masks...)
* Other variables: the VM receives a file with a list of ⟨key, value⟩ pairs that you specify in the `template`
* Init scripts: what programs the VM must run upon start-up (e.g.: auto-configuration scripts)
* Other files: you can provide files externally to your VM for your own purpose

The way this information is provided to your VM is by means of a **virtual CD-ROM** (or _contextualization CD-ROM_). OpenNebula builds an `image` (that you do **NOT** get to see on the UI) for each VM for which you have enabled _contextualization_, and it makes it available via the IDE driver so that you can mount it in your operating system. 

Some very useful [standard (read .deb and .rpm) packages](https://github.com/OpenNebula/addon-context-linux) are also delivered by the OpenNebula developers, that you can install in your VM. These packages set the booting sequence of the VM up in such a way that the _context information_ is used to configure the VM even before the operating system will prompt for normal login. The packages mount the _context CD-ROM_, then process the files found there to configure the root user to require a private-public key pair to SSH into the VM. They also configure the network according to the _context_, which is very handy because your VM must use the MAC and IP addresses that the HPC Cloud grants them (otherwise, the VM will have no network connectivity).

