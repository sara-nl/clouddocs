---
layout: default
---
>**NOTE:**
>
>This is a distilled summary. For more information, you are advised to have a look at the official OpenNebula documentation pages:
>
> * [basic contextualisation](http://docs.opennebula.org/4.14/user/virtual_machine_setup/bcont.html)
> * [advanced contextualisation](http://docs.opennebula.org/4.14/user/virtual_machine_setup/cong.html)

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


>**NOTE:**
>
>Pre-packaged .deb and .rpm packages are available on the [releases directory](https://github.com/OpenNebula/addon-context-linux/releases/) of the _OpenNebula/addon-context-linux_ project in GitHub.

Some very useful [standard (read .deb and .rpm) packages](https://github.com/OpenNebula/addon-context-linux) are also delivered by the OpenNebula developers, that you can install in your VM. These packages set the booting sequence of the VM up in such a way that the _context information_ is used to configure the VM even before the operating system will prompt for normal login. The packages mount the _context CD-ROM_, then process the files found there to configure the root user to require a private-public key pair to SSH into the VM. They also configure the network according to the _context_, which is very handy because your VM must use the MAC and IP addresses that the HPC Cloud grants them (otherwise, the VM will have no network connectivity).

>**In short:**
>
>* OpenNebula is ready to deliver a _context_ to your VMs. You define in your `template` what you would like to include in this _context_. Standard _context_ information includes SSH keys and network information. The VM can read the _context_ as a CD-ROM.
>
>* You **must adapt your VM** to benefit from this _context_: your VM needs to actively read and interpret the _context_, or otherwise it will ignore the context. 
>
>* In general, **VMs made from AppMarket** appliances are set up to use _contextualization_.

## Contextualization in practice

### Standard packages for your VM

On **Debian-based** operating systems (e.g.: Ubuntu, Mint), you can install the standard .deb _contextualization_ package. 

1. Download the .deb file from https://github.com/OpenNebula/addon-context-linux/releases/latest.
1. Bring the .deb to your VM
1. Install the .deb by running (change the <package_name.deb> placeholder by the right file and path):

```bash
dpkg -i <package_name.deb>
```

On **RedHat-based** operating systems (e.g.: CentOS, Fedora), you can install the standard .rpm _contextualization_ package.

1. Download the .rpm file from https://github.com/OpenNebula/addon-context-linux/releases/latest.
1. Bring the .rpm to your VM
1. Install the .rpm by running (change the <package_name.rpm> placeholder by the right file and path):

```bash
yum install <package_name.rpm>
```

### SSH key for root
You can let your VM require the root user to log in only with a valid [SSH key](https://en.wikipedia.org/wiki/Secure_Shell#Key_management). This option is the preferred way in the usual AppMarket appliances.

To enable SSH key _contextualization_, before you create your VM, on your `template`, on the template-editing screen, under the _Context_ tab, in the _Network & SSH_ subsection, make sure that the checkbox _Add SSH contextualization_ is checked.

Then, if you paste your public key on the _Public Key_ field, that one will be set. Otherwise, the public key from your user profile will be set.

### Network configuration
You can let your VM configure its `nic`s from the _context_. This option is the preferred way in the usual AppMarket appliances.

To enable network _contextualization_, before you create your VM, on your `template`, on the template-editing screen, under the _Context_ tab, in the _Network & SSH_ subsection, make sure that the checkbox _Add Network contextualization_ is checked.

### Init scripts
You can have one (or more) scripts configure other aspects of your VM upon OS boot. For example, you can run a script that will check whether a given non-root user exists, and if it does not, then have the script create one for you.

For that, you first need to create an (or several) `Init File`(s) on the _Files & Kernels_ section of the UI. Then, before you create your VM, on your `template`, on the template-editing screen, under the _Context_ tab, in the _Files_ subsection, you can refer to that (those) `Init File`(s) on the _Init scripts_ field (to include several of them, just type their names in the order you want them, separated by spaces).

>**NOTE:**
>
>OpenNebula only delivers _contextualisation_ upon VM startup (from the external point of view). Therefore, any modification of the `template` or the `file`s that you make while the VM is running, will **not** be visible to that running VM. Further, even when you add `nic`s to a running VM, these will **not** be contextualised.

#### Scripts caveats; cloud-init

Aside from OpenNebula's contextualisation scripts, an alternative de-facto standard is emerging called [cloud-init](https://cloudinit.readthedocs.org/en/latest/). 

> **NOTE:**
>
> OpenNebula's notes on cloud-init are available in [their documentation](  http://docs.opennebula.org/4.14/user/virtual_machine_setup/cloud-init.html)

It looks like cloud-init's scripts may suffer from having Python3 as the default Python interpreter. If you need to install Python3, you are using cloud-init and you notice that your VM suddenly fails to be properly contextualised, you may want to have an alternate Python2 installation and have the init scripts use this instead.

As a practical case, in Ubuntu, using all default Python2 and Python3 packages, a user reports having solved his problem by doing the following:

1. Open the file `/usr/bin/cloud-init` for editing.
2. Change the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) line to use the Python2 installation, like: `#!/usr/bin/python2.7`
3. Reboot the OS so that the changes take effect.
