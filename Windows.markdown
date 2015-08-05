>**NOTE:**
>
> This page still needs to be re-shaped. We are working on it.

---

>**NOTE:**
>
>We do **not** have any Windows licence or Windows distribution available for you. You will need to have these yourself.

# Create a VM with Microsoft Windows

In order to run Windows on a VM, you will need to proceed with the full installation as if it would be a local physical machine (e.g.: your laptop). But then, with the extra overhead of making the necessary adjustments so that your VM will work in the virtual environment that the HPC Cloud offers. These are the steps that we will carry out to make it work:

1. Prepare the installation
1. Run the installation
1. Configure the contextualization
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
  * click on the gray _Reset_ button at the bottom of it
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
  * click on the gray _Reset_ button at the bottom of it
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
>You can read more about Windows contextualization for OpenNebula here: https://github.com/OpenNebula/addon-context-windows

On the HPC Cloud, VMs use the [contextualization](contextualization) mechanism to configure themselves. In particular, you will need to have 2 files on your VM so that it can actually configure itself. We will be making those available in this step so that, at a later step, we can make your VM use them. 

1. **On the UI:** On the _Files & Kernels_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `file`. A form will pop up.
1. **On the UI:** On the form that popped up:
  * type in a meaningful _Name_ (e.g.: **context.ps1**, we will use this name later)
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

### Create a template

Now that we have all components ready in the UI, we are ready to bring them together. On the HPC Cloud, we do that on a `template`.

1. **On the UI:** On the _Templates_ tab (under _Virtual Resources_), click on the green _[+]_ button (on the top-left corner of the screen) to start creating a new `template`. The page will change into the _Create Template_ screen.
1. **On the UI:** On the _Create Template_ screen, on the _General_ tab:
  * type in a meaningful _Name_ (e.g.: windows_setup)
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
  * make sure you check the check boxes for the files you created before; those are: **context.ps1** and **startup.vbs**
1. **On the UI:** We are ready defining the `template`, so click on the green _Create_ button at the top of the screen. A new `template` will show on the _Templates_ list.



---
---

## Introduction
The first step is to make an Windows installation disk with available on the HPCcloud. You can upload the disk directly or send a public URL to OpenNebula which is saved on the HPCcloud, where a virtual machine can read the image.

To install Windows you need you Windows installation image. SURFsara does not deliver licences or Windows
images due to legal issues: you need to arrange your windows images and licence yourself. 

Further more there are drivers needed to communicate between windows and the hardware in the most effective way. The drivers must be installed during installation of windows. The latest version of these driver can be found at https://fedoraproject.org/wiki/Windows_Virtio_Drivers#Direct_download (no
need to download this to your computer!). 

https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
To upload the images go to Virtual Resources --> Images. In here you
see a overview of the images that are now available. To create new
image hit the green button with a plus sign. With this form you can
create and upload your install new images.


## Upload and create windows installation image

To upload your windows installation disk/iso, file in the "Name" field
a descriptive name like e.g "windows_iso" This should be unique(no
other images should have the same name), the "Description" is
optional, Type should be "CDROM" (since the image was original a DVD) and Datastore
"Local_image_ssd". Choose between "Provide a path" if the installation
iso available by a public URL or otherwise "Upload" to upload from
your PC. Hit the green "Create" to upload the image.

## Create the virtIO disk

To create the virtIO image, go to the same procedure as before with
the windows option, except the name of this images should be different
e.g. "virtio_drivers" and choose in the image location box "provide
path" the url to the virtIO iso disk (copy the link from https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso )

## Create an image as a installation target

The images to install are there now, but you need to have a empty disk
to install windows on. This can be done in the same form as creating
the windows installation images and the virtIO images. 
* Name shoud be provided (e.g. "windows_os").  
* Type must be "OS". 
* Datastore:Local_Image_Ssd 
* Persistent: checked(otherwise the image will not be saved when you
shutdown the machine)
* Image Location:"Empty datablock"

The size of the Windows OS disk should be at least 32GB (or 34360MB)
and 64 GB (or 68720MB)




## Upload context files
## Create template
## Install windows

![windows01](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install01.png)
![windows02](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install02.png)
![windows03](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install03.png)
![windows04](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install04.png)
![windows05](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install05.png)
![windows06](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install06.png)
![windows07](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install07.png)


## Make contextualisation working

