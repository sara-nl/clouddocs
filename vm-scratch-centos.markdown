---
layout: default
---
# Creating a VM from scratch - CentOS

Although a number of useable _appliances_ are available in the AppMarket to allow easily creating VMs from the UI, sometimes you may need a specific distribution or a different version that you can find on the AppMarket. In that case, you can resort to installing the operating system from scratch, as you would install it on your own laptop.

The following instructions explain how to make a VM installing the operating system from scratch, and we will be using CentOS 7 as an example.

>**NOTE:**
>The VM that you will be making following this guide will be using contextualization. Make sure you have your public ssh-key configured either in your user profile or in the template, before you create your VM. That way you will be able to log into your VM with your private key.

The steps you require to create a VM from scratch are:

1. Prepare the installation
2. Run the installation
3. Configure contextualization
4. Prepare the VM for production

We will be developing these topics in the following subsections

## Prepare the installation

In this section we will be setting up the environment within your project (or _Group_) space in the HPC Cloud. It involves:

1. Creating an `image` that will be empty in the beginning, which will work as an empty hard drive where you will install CentOS
2. Creating an `image` with the CentOS installation media, by fetching the distribution ISO
3. Creating a `template` where you bring all these components together, which you can use to start a VM from

### Creating the destination hard drive

Analogously to your laptop, your VM needs a hard drive where the operating system can be installed and where it will live. We will create one here.

1. **On the UI:** Go to the _Images_ tab (under _Virtual Resources_), and click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `image`. A form will pop up.
2. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **centos_drive**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _DATABLOCK_
  * leave _Datastore_ with _104: local_images_ssd_
  * check the _Persistent_ checkbox
  * on the _Image location:_ group, choose radio button _Empty datablock_
  * and give it a _Size_ that is meaningful to you (e.g.: in our test we used 10GB)
3. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `image` will show on the _Images_ list, and it will keep in status _LOCKED_ while it is being created. When it is created it will come to status _READY_.

### Fetching the CentOS ISO

1. **On the UI:** On the _Images_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `image`. A form will pop up.
2. **On the UI:** On the form that popped up:
  * click on the gray _Reset_ button at the bottom of it
  * type in a meaningful _Name_ (e.g.: **centos_iso**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CDROM_
  * leave _Datastore_ with _104: local_images_ssd_
  * leave the _Persistent_ checkbox unchecked
  * on the _Image location:_ group, choose radio button _Provide a path_; then, underneath, paste the URL of the ISO in the _Path_ text box (e.g.: in our case, we used this one: http://ftp.nluug.nl/ftp/pub/os/Linux/distr/CentOS/7/isos/x86_64/CentOS-7-x86_64-DVD-1503-01.iso)
3. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `image` will show on the _Images_ list, and it will keep in status _LOCKED_ while it is being created. When it is created it will come to status _READY_.

### Create a template

Now that we have all components ready in the UI, we are ready to bring them together. On the HPC Cloud, we do that on a `template`.

1. **On the UI:** On the _Templates_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `template`. The page will change into the _Create Template_ screen.
2. **On the UI:** On the _Create Template_ screen, on the _General_ tab:
  * type in a meaningful _Name_ (e.g.: **centos_setup**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose a _Logo_ that you like
  * type in (or drag the slider) 8GB of _Memory_
  * type in (or drag the slider) 1 CPU
3. **On the UI:** On the same _Create Template_ screen, on the _Storage_ tab:
  * for the _Disk 0_ (on the left column of the screen), choose the **centos_drive** `image` (from the table on the right of the screen) that you created as the first `image` of this guide
  * click on the _+ Add another disk_ button (that will make a new _Disk 1_), and then choose the **centos_iso** `image` you created as a second `image` of this guide
4. **On the UI:** On the same _Create Template_ screen, on the _Network_ tab:
  * for the _Interface 0_ (on the left column of the screen), choose the **internet** `network` (from the table on the right of the screen)
  * click on the _+ Add another nic_ button (that will make a new _Interface 1_), and then choose your internal `network` (it will be the only other `network ` that you can see on the right that is not called **internet**)
5.  **On the UI:** On the same _Create Template_ screen, on the _OS Booting_ tab (note! use the following boot order, otherwise, changes are not saved due to a bug in opennebula):
  * for the _1st Boot_ field, **choose _HD_**
  * for the _2nd Boot_ field, **choose _CDROM_** 
6.  **On the UI:** On the same _Create Template_ screen, on the _Input/Output_ tab:
  * click on the _VNC_ radio button
  * on the _Inputs group_, choose _Tablet_ on the first dropdown menu, then _USB_ on the second dropdown menu and finally click on the _Add_ button. A new entry will appear below those dropdowns with what you just selected.
7.  **On the UI:** On the same _Create Template_ screen, on the _Context_ tab:
  * click on _Files_ on the left column of the screen
  * make sure you check the check box for the `file` **one-context_4.14.1.rpm**
8. **On the UI:** We are ready defining the `template`, so click on the green _Create_ button at the top of the screen. A new `template` will show on the _Templates_ list.

## Run the CentOS installation

We will now create a VM and run the CentOS installation on it.

1. **On the UI:** Go to the _Virtual Machines_ tab (under _Virtual Resources_). Click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new VM. A form will pop up.
2. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **centos_first**)
  * choose the template you defined before (i.e.: centos_setup)
3. **On the UI:** We are ready defining the VM, so click on the green _Create_ button at the bottom of the form. A new VM will show on the _Virtual Machines_ list. It will go through several states (e.g.: PENDING, PROLOG...) until it reaches the RUNNING state. 
4. **On the UI:** You can then start operating within your VM. Click on the _screen_-like button that you can see to the right of your VM on the list. It will pop-up the VNC console, so you should be able to see the welcome screen of your CentOS installation.

Now you need to install CentOS, by following the steps you would normally follow (note, however, that at this point you have no network connection unless you define it manually).

## Configure contextualization

Once your freshly installed CentOS starts, we will configure your VM so that it auto-configures itself on start up (e.g.: at this point, you can see that there is no active network connection, so you cannot even browse the web). OpenNebula deliver their own .rpm to allow contextualization, and you are able to read that .rpm from the _CONTEXT_ CD-ROM because you added that file to the template in the previous section.

1. **On the VM:** Open a file explorer, and browse the _CONTEXT_ CD-ROM. You should be able to see at least 2 files on that CD-ROM. One of them should be the one we manually added to the _Context_ tab of the `template` some steps ago, called: _one-context-4.14.1.rpm_.
2. **On the VM:** Open a terminal and mount the _CONTEXT_ CD-ROM: 

```sh
mount -t iso9660 -L CONTEXT -o ro /mnt
```
 
3. **On the VM:** On the same terminal, install the .rpm file: 

```sh
yum install /mnt/*.rpm
```

4. **On the VM:** You can reboot your CentOS now. When it boots up, you should be able to browse the Internet now. You can also test SSH-ing into your VM with your private key.
5. **On the UI:** You can now shut your VM down. We will remove all the installation media and prepare your VM for production.

>**NOTE:**
>
>Alternatively, you can use [cloud-init](http://cloudinit.readthedocs.org/en/latest/index.html) as a contextualization configurer. CentOS has support for it via the standard yum repos, so you can install it via `yum install cloud-init`. Our tests indicate that network works, but there does not seem to be a default user configured to use public/private keys to SSH to the VM.
>
>A possible way to do it: you can first use the one-context-XXX.rpm package, reboot to let the network be contextualised, then install cloud-init and after that uninstall the one-context-XXX.rpm package.

## Prepare the VM for production

Once you have installed and configured your CentOS, you do not need the installation media or `file`s around any more. We will make a new `template` to use only the disk that we need.

1. **On the UI:** First change the image where you installed the OS from `datablock` to `OS`. From the `images` tab, click on the **centos_drive** row and then switch *Type: `OS`*.
2. **On the UI:** Begin creating a new `template` the usual way.
3. **On the UI:** On the _Create Template_ screen, on the _General_ tab:
  * type in a meaningful _Name_ (e.g.: **my_research_run**)
  * give it as much memory and as many CPU's as you need
4. **On the UI:** On the same _Create Template_ screen, on the _Storage_ tab:
  * for the _Disk 0_ (on the left column of the screen), choose the **centos_drive** `image` (from the table on the right of the screen) that you created as the first `image` of this guide, and where you have installed CentOS
5. **On the UI:** On the same _Create Template_ screen, on the _Network_ tab:
  * for the _Interface 0_ (on the left column of the screen), choose the **internet** `network` (from the table on the right of the screen)
  * click on the _+ Add another nic_ button (that will make a new _Interface 1_), and then choose your internal `network` (it will be the only other `network ` that you can see on the right that is not called **internet**)
6.  **On the UI:** On the same _Create Template_ screen, on the _Input/Output_ tab:
  * click on the _VNC_ radio button
  * on the _Inputs_ group, choose _Tablet_ on the first dropdown menu, then _USB_ on the second dropdown menu and finally click on the _Add_ button. A new entry will appear below those dropdowns with what you just selected.
7.  **On the UI:** On the same _Create Template_ screen, on the _OS Booting_ tab, you want to set some _Features_ (click on _Features_ on the left column):
  * set in _ACPI_: _yes_
  * set in _Localtime_: _no_
8. **On the UI:** We are ready defining the `template`, so click on the green _Create_ button at the top of the screen. A new `template` will show on the _Templates_ list.

From now on, you will use this `template` to run your VM.
