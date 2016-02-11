---
layout: default
---
>**NOTE:**
>
>We do **not** have any Windows licence or Windows distribution available for you. You will need to have these yourself.

# Create a VM with Microsoft Windows

In order to run Windows on a VM, you will need to proceed with the full installation as if it would be a local physical machine (e.g.: your laptop). But then, with the extra overhead of making the necessary adjustments so that your VM will work in the virtual environment that the HPC Cloud offers. These are the steps that we will carry out to make it work:

1. Prepare the installation
1. Run the Windows installation
1. Configure contextualization
1. Prepare your VM for production
  1. Enable Remote Desktop

Let us look into these steps with more detail.

## Prepare the installation

>**NOTE:**
>
>Make sure you have your Windows ISO available in your laptop, so that you can upload it to the HPC Cloud.

In this section we will be setting up the environment within your project (or _Group_) space in the HPC Cloud. It involves:

1. Creating an `image` that will be empty in the beginning, which will work as an empty hard drive where you will install Windows
1. Creating an `image` with the Windows installation media, by uploading your Windows ISO
1. Creating an `image` with the Virtio drivers for Windows, by fetching an ISO from the Internet
1. Creating a couple of `file`s on the UI by downloading them from the Internet and uploading them to the UI
1. Creating a `template` where you bring all these components together, which you can use to start a VM from

### Creating the destination hard drive

Analogously to your laptop, your VM needs a hard drive where the operating system can be installed and where it will live. We will create one here.

1. **On the UI:** Go to the _Images_ tab (under _Virtual Resources_), and click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `image`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **windows_drive**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _DATABLOCK_
  * leave _Datastore_ with _104: local_images_ssd_
  * check the _Persistent_ checkbox
  * on the _Image location:_ group, choose radio button _Empty datablock_
  * and give it a _Size_ that is meaningful to you (e.g.: our test with installing Windows 8.1 required already 10GB for Windows alone, so we filled in 20GB)
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `image` will show on the _Images_ list, and it will keep in status _LOCKED_ while it is being created. When it is created it will come to status _READY_.

### Uploading the Windows ISO

1. **On the UI:** On the _Images_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `image`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **windows_iso**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CDROM_
  * leave _Datastore_ with _104: local_images_ssd_
  * leave the _Persistent_ checkbox unchecked
  * on the _Image location:_ group, choose radio button _Upload_; then, underneath, click on _Choose file_ to have a dialogue pop up where you will look for the path on your laptop where you have your Windows .iso file and, finally, choose the .iso file to close the pop-up dialogue to return ton the original form 
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A progress bar will show at the bottom of the screen, which will advance as the upload of your .iso file evolves. When the upload is complete, a new `image` will show on the _Images_ list, and it will keep in status _LOCKED_ while it is being created. When it is created it will come to status _READY_.

### Fetching the Virtio drivers

The best way to make physical hardware (namely: hard drives and network adapters) available to VMs in the HPC Cloud is by using Virtio drivers. However, Windows does not natively support those drivers, but if we make them available to the Windows installer, we will have no problem using them. This requires making them available externally, and that is what we will do in this step.

1. **On the UI:** On the _Images_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `image`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **virtio_drivers_iso**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CDROM_
  * leave _Datastore_ with _104: local_images_ssd_
  * leave the _Persistent_ checkbox unchecked
  * on the _Image location:_ group, choose radio button _Provide a path_; then, underneath, type the following URL in the _Path_ field: https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `image` will show on the _Images_ list, and it will keep in status _LOCKED_ while data is being downloaded from the URL you wrote. When it is created it will come to status _READY_.

### Fetching the contextualization files

>**NOTE:**
>
>You can read more about Windows contextualization for OpenNebula here: 
>
> * [https://github.com/OpenNebula/addon-context-windows](https://github.com/OpenNebula/addon-context-windows)
> * [http://docs.opennebula.org/4.12/user/virtual_machine_setup/windows_context.html](http://docs.opennebula.org/4.12/user/virtual_machine_setup/windows_context.html)

On the HPC Cloud, VMs use the [contextualization](contextualization) mechanism to configure themselves. In particular, you will need to have 2 files on your VM so that it can actually configure itself. We will be making those available in this step so that, at a later step, we can make your VM use them. 

1. **On the UI:** On the _Files & Kernels_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `file`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in _Name_: **context.ps1** (we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CONTEXT_
  * leave _Datastore_ with _105: local_files_ssd_
  * on the _Image location:_ group, choose radio button _Provide a path_; then, underneath, type the following URL in the _Path_ field: https://raw.githubusercontent.com/OpenNebula/addon-context-windows/master/context.ps1
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `file` will show on the _Files_ list, and it will keep in status _LOCKED_ while data is being downloaded from the URL you wrote. When it is created it will come to status _READY_. 

Now, the other `file:

1. **On the UI:** On the _Files & Kernels_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `file`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **startup.vbs**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CONTEXT_
  * leave _Datastore_ with _105: local_files_ssd_
  * on the _Image location:_ group, choose radio button _Provide a path_; then, underneath, type the following URL in the _Path_ field: https://raw.githubusercontent.com/OpenNebula/addon-context-windows/master/startup.vbs
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `file` will show on the _Files_ list, and it will keep in status _LOCKED_ while data is being downloaded from the URL you wrote. When it is created it will come to status _READY_. 

If we leave it here, then you VM will be configured only once ever. If you want the VM to be reconfigured every time it boots, then you need to delete a _flag_ file that prevents contextualisation from happening ever again. We have added a script that will delete this file for you every time Windows shuts down or reboots. Here is how you add it:

1. **On the UI:** On the _Files & Kernels_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `file`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **shutdown.vbs**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose _Type_ _CONTEXT_
  * leave _Datastore_ with _105: local_files_ssd_
  * on the _Image location:_ group, choose radio button _Provide a path_; then, underneath, type the following URL in the _Path_ field: https://raw.githubusercontent.com/sara-nl/clouddocs/gh-pages/assets/shutdown.vbs
1. **On the UI:** Click the green button _Create_ on the form, to submit it. A new `file` will show on the _Files_ list, and it will keep in status _LOCKED_ while data is being downloaded from the URL you wrote. When it is created it will come to status _READY_. 

### Create a template

Now that we have all components ready in the UI, we are ready to bring them together. On the HPC Cloud, we do that on a `template`.

1. **On the UI:** On the _Templates_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `template`. The page will change into the _Create Template_ screen.
1. **On the UI:** On the _Create Template_ screen, on the _General_ tab:
  * type in a meaningful _Name_ (e.g.: **windows_setup**, we will use this name later)
  * type in a meaningful _Description_ (optional)
  * choose a _Logo_ that you like
  * type in (or drag the slider) 8GB of _Memory_
  * type in (or drag the slider) 1 CPU
1. **On the UI:** On the same _Create Template_ screen, on the _Storage_ tab:
  * for the _Disk 0_ (on the left column of the screen), choose the **windows_drive** `image` (from the table on the right of the screen) that you created as the first `image` of this guide
  * click on the _+ Add another disk_ button (that will make a new _Disk 1_), and then choose the **windows_iso** `image` you created as a second `image` of this guide
  * click again on the _+ Add another disk_ button (to make a new _Disk 2_), and then choose the **virtio_drivers_iso** `image`
1. **On the UI:** On the same _Create Template_ screen, on the _Network_ tab:
  * for the _Interface 0_ (on the left column of the screen), choose the **internet** `network` (from the table on the right of the screen)
  * click on the _+ Add another nic_ button (that will make a new _Interface 1_), and then choose your internal `network` (it will be the only other `network ` that you can see on the right that is not called **internet**)
1.  **On the UI:** On the same _Create Template_ screen, on the _OS Booting_ tab:
  * for the _1st Boot_ field, choose _CDROM_
  * for the _2nd Boot_ field, choose _HD_
1.  **On the UI:** On the same _Create Template_ screen, on the _Input/Output_ tab:
  * click on the _VNC_ radio button
  * on the _Inputs group_, choose _Tablet_ on the first dropdown menu, then _USB_ on the second dropdown menu and finally click on the _Add_ button. A new entry will appear below those dropdowns with what you just selected.
1.  **On the UI:** On the same _Create Template_ screen, on the _Context_ tab:
  * click on _Files_ on the left column of the screen
  * make sure you check the check boxes for the files you created before; those are: **context.ps1**,  **startup.vbs** and **shutdown.vbs**
1. **On the UI:** We are ready defining the `template`, so click on the green _Create_ button at the top of the screen. A new `template` will show on the _Templates_ list.

## Run the Windows installation

We will now create a VM and run the Windows installation on it.

1. **On the UI:** Go to the _Virtual Machines_ tab (under _Virtual Resources_). Click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new VM. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **windows_first**)
  * choose the template you defined before (i.e.: windows_setup)
1. **On the UI:** We are ready defining the VM, so click on the green _Create_ button at the bottom of the form. A new VM will show on the _Virtual Machines_ list. It will go through several states (e.g.: PENDING, PROLOG...) until it reaches the RUNNING state. 
1. **On the UI:** You can then start operating within your VM. Click on the _screen_-like button that you can see to the right of your VM on the list. It will pop-up the VNC console, so you should be able to see the welcome screen of your Windows installation.

Now you need to install Windows with **custom** installation, by following the steps you would normally follow. Only, with one caveat: you need to install the Virtio drivers, as pointed out before. 

### Installing the Virtio drivers

While running the Windows installer, you will reach a step in which you have to choose which disk (or drive) to install Windows on. It will be empty, because the disks are made available to your VM via Virtio, but you have not installed the Virtio drivers yet so your Windows installation cannot see the disk. This is how you do it:

1. **On the Windows VM:** At the step where you need to choose a disk on which to install Windows, click on the _Load driver_ button (under the big white empty area). A dialogue pops up.
1. **On the Windows VM:** On the pop-up dialogue, click on the _Browse..._ button. A _Browse for folder_ tree will pop-up now.
1. **On the Windows VM:** We will start with the network interfaces driver. On the chooser tree, you will see two entries that represent two CD-ROM drives. Click on the one that holds the Virtio drivers (therefore, **not** the one labeled CONTEXT), and open folder `NetKVM`, then the folder that matches your Windows version, and then the 64-bit or 32-bit version depending on your Windows as well.
1. **On the Windows VM:** After you chose the folder, a pop up will show the drivers that it could locate (or click on _Scan_ to refresh the list). Doubleclick the only entry that you should see, so that it is installed.
1. **On the Windows VM:** Now we will repeat the process for the disks driver. On the chooser tree, you will see two entries that represent two CD-ROM drives. Click again on the one that holds the Virtio drivers (therefore, **not** the one labeled CONTEXT), and open folder called `viostor`, then the folder that matches your Windows version, and then the 64-bit or 32-bit version depending on your Windows as well.
1. **On the Windows VM:** Again, on the next screen, click on _Scan_ if the list of detected drivers is not updated. Then install the driver. At this point, the originally white area shows one entry: your disk.
1. **On the Windows VM:** You can finally click on the drive to get Windows installed on it.

You can continue with the rest of the Windows installation process normally. Then, reboot so that your newly installed Windows starts up (make sure you do not start the installation again).

## Configure contextualization

Once your freshly installed Windows starts, we will configure your VM so that it auto-configures itself on start up (e.g.: at this point, you can see that there is no active network connection, so you cannot even browse the web).

1. **On the Windows VM:** Open a file explorer, and browse the _CONTEXT_ CD-ROM. You should be able to see at least 4 files on that CD-ROM. Three of them should be the ones we manually added to the _Context_ tab of the `template` some steps ago, called: _context.ps1_, _startup.vbs_ and _shutdown.vbs_.
1. **On the Windows VM:** From the _CONTEXT_ CD-ROM, copy the 3 files **context.ps1**, **startup.vbs** and **shutdown.vbs** to the `C:\` drive. They will thus become reachable at C:\context.ps1, C:\startup.vbs and C:\shutdown.vbs.
1. **On the Windows VM:** We must configure the C:\startup.vbs file as a start-up script, so that Windows runs it automatically upon booting. We must also configure the C:\shutdown.vbs file as a _shutdown script_, so that Windows runs it automatically upon shutting down. To do all of this, start by right-clicking on the Windows _Start_ button, and then choose option _Run_. A dialogue will pop up.
1. **On the Windows VM:** On the dialogue that just popped up, type the following in the _Open:_ field: `gpedit.msc`. A new window titled _Local Group Policy Editor_ will show.
1. **On the Windows VM:** On the _Local Group Policy Editor_, navigate to _Computer Configuration_ > _Windows Settings_ > _Scripts (Startup/Shutdown)_. Then doubleclick on _Startup_. A new _Startup Properties_ dialogue will pop up.
1. **On the Windows VM:** On the _Startup Properties_ dialogue, click on the _Add_ button. A new _Add a Script_ dialogue will pop up.
1. **On the Windows VM:** On the _Add a Script_ dialogue, click on the _Browse..._ button, and look there for the C:\startup.vbs file. A new entry will appear on the _Startup Properties_ dialogue indicating that you have added the new startup script. Click *OK*, then *Apply* and then *OK* again, to return to the _Scripts (Startup/Shutdown)_ window.
1. **On the Windows VM:** You can reboot your Windows now. When it boots up, and (probably) after a while after you log in, your network adapters will stop showing the yellow warning icon and you should be able to browse the Internet now.
1. **On the Windows VM:** We will now tackle the shutdown script. Doubleclick on _Shutdown_. A new _Shutdown Properties_ dialogue will pop up.
1. **On the Windows VM:** On the _Shutdown Properties_ dialogue, click on the _Add_ button. A new _Add a Script_ dialogue will pop up.
1. **On the Windows VM:** On the _Add a Script_ dialogue, click on the _Browse..._ button, and look there for the C:\shutdown.vbs file. A new entry will appear on the _Shutdown Properties_ dialogue indicating that you have added the new shutdown script. Click *OK* and *Apply*.
1. **On the Windows VM:** You can reboot your Windows again. Make sure you have internet again.
1. **On the UI:** You can now shut your VM down. We will remove all the installation media and prepare your VM for production.

## Prepare the VM for production

Once you have installed and configured your Windows, you do not need the installation media or files around any more. We will make a new `template` to use only the disk that we need.

1. **On the UI:** Begin creating a new `template` the usual way.
1. **On the UI:** On the _Create Template_ screen, on the _General_ tab:
  * type in a meaningful _Name_ (e.g.: **my_research_run**)
  * give it as much memory and as many CPU's as you need
1. **On the UI:** On the same _Create Template_ screen, on the _Storage_ tab:
  * for the _Disk 0_ (on the left column of the screen), choose the **windows_drive** `image` (from the table on the right of the screen) that you created as the first `image` of this guide, and where you have installed Windows
1. **On the UI:** On the same _Create Template_ screen, on the _Network_ tab:
  * for the _Interface 0_ (on the left column of the screen), choose the **internet** `network` (from the table on the right of the screen)
  * click on the _+ Add another nic_ button (that will make a new _Interface 1_), and then choose your internal `network` (it will be the only other `network ` that you can see on the right that is not called **internet**)
1.  **On the UI:** On the same _Create Template_ screen, on the _Input/Output_ tab:
  * click on the _VNC_ radio button
  * on the _Inputs_ group, choose _Tablet_ on the first dropdown menu, then _USB_ on the second dropdown menu and finally click on the _Add_ button. A new entry will appear below those dropdowns with what you just selected.
1.  **On the UI:** On the same _Create Template_ screen, on the _Other_ tab, you want to tell Windows how to use multiple cores:
  * within the _RAW data_ group, choose for the _Type_ dropdown menu _kvm_, then in the _DATA_ textfield to the right of it, write `<cpu><topology sockets='1' cores='4' threads='1'/></cpu>` (you should replace the `cores` number with the amount of them you need).
1. **On the UI:** We are ready defining the `template`, so click on the green _Create_ button at the top of the screen. A new `template` will show on the _Templates_ list.

From now on, you will use this `template` to run your VM.

### Enable Remote Desktop

Having to connect to the VM via the VNC console on the web UI is somewhat tedious and rather limited, so you probably want to access your VM via Remote Desktop. Here is how you can do that:

1. **In your local network:** Make sure your firewall (maybe in your home router) has port 3389 open for your laptop.
1. **On the Windows VM:** Right-click on the Windows _Start_ button, and then choose option _Run_. A dialogue will pop up.
1. **On the Windows VM:** On the dialogue that just popped up, type the following in the _Open:_ field: `gpedit.msc`. A new window titled _Local Group Policy Editor_ will show.
1. **On the Windows VM:** On the _Local Group Policy Editor_, navigate to _Computer Configuration_ > _Administrative Templates_ > _Windows Components_ > _Remote Desktop Services_ > _Remote Desktop Session Host_ > _Security_. 
1. **On the Windows VM:** Change the following two settings (doubleclick on each of them):
  * _Require use of specific security layer for remote (RDP) connections_ from _Not configured_ to _Enabled_, and then choose on the dropdown _Security Layer_, the value _RDP_.
  * _Require user authentication for remote connections by using Network Level Authentications_ from _Not configured_ to _Disabled_.
1. **On the Windows VM:** Restart your Windows.

You should now be able to connect to your VM using a Remote Desktop client.

---

## Appendix: Alternative CPU topology configuration

In the _Prepare your VM for production_ section, we wrote a way to configure your VM so that Windows will understand what to do with the cores the VM has available. However, some users have reported that the following helped them instead:

```
<vcpu placement='static'>4</vcpu>
<cputune>
<vcpupin vcpu='0' cpuset='1'/>
<vcpupin vcpu='1' cpuset='2'/>
<vcpupin vcpu='2' cpuset='3'/>
<vcpupin vcpu='3' cpuset='4'/>
</cputune>
<cpu mode='host-passthrough'>
<topology sockets='1' cores='4' threads='1'/>
</cpu>
```

>**NOTE:**
>
>Some users report suffering from very unstable (to the point of unuseable) systems with Windows **7** running on more than 16 cores.

## Appendix: Some Windows installation screenshots

![windows01](images/windows_install01.png)
![windows02](images/windows_install02.png)
![windows03](images/windows_install03.png)
![windows04](images/windows_install04.png)
![windows05](images/windows_install05.png)
![windows06](images/windows_install06.png)
![windows07](images/windows_install07.png)
