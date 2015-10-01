---
layout: default
---
# Creating a Fedora VM - the easy way

Fedora offer images that are ready to use _on the cloud_. You can find them [here](https://getfedora.org/en/cloud/download/)

The following instructions explain how to use one of their prepared images to (astonishingly easily) create a running VM out of it in the HPC Cloud.

>**NOTE:**
>The VM that you can start from this image will be automatically making use of contextualization with cloud-init. Make sure you have your public ssh-key configured either in your user profile or in the template, before you create your VM. That way you will be able to ssh into your VM with the username **fedora** and your private key.

## Importing the Image
1. **On the Fedora web page:** On the _Cloud_ section of the downloads page, locate the link to their Qcow2 image and copy it to the paperclip (at the time of writing this article, the URL is this one: https://download.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-22-20150521.x86_64.qcow2)
1. **On the HPC Cloud UI:** On the _Images_ subsection of the _Virtual Resources_ section, click on the green _[+]_ button to start creating a new `image`. The _Create Image_ form pops up.
1. **On the HPC Cloud UI:** On the _Create Image_ form:
 * fill in a _Name_
 * choose _Type_:OS
 * make sure that, for field _Datastore_, you chose _104: local-images-ssd_
 * choose whether you want the `image` to be _Persistent_
 * in the _Image location:_ area, mark the _Provide a path_ radio button
 * fill in the _Path_ to the `image` file, by pasting the URL you copied in the first step of this recipe
 * Click on the _Advanced options_ dropdown area. There, you must fill in:
  * In _Device prefix_, type `vd`
  * In _Driver_, type `qcow2`
1. **On the HPC Cloud UI:** Click on the green _Create_ button at the bottom of the form, and an `image` with the name you wrote on the form will appear on the images table, in status LOCKED. It will remain in that status until the UI has finished copying the file from Fedora's servers to the HPC Cloud. Then it will change to READY.

## Make a `template` using that `image`

You need to put that `image` that you imported into a `template`. We will do that now.

1. **On the HPC Cloud UI:** In the _Templates_ tab, click on the green _[+]_ button to begin making a new `template`.
1. **On the HPC Cloud UI:** In the _General_ tab, give it a _name_, the amount of _Memory_ that you want, the amount of _CPU_ and _VCPU_ you need, etc.
1. **On the HPC Cloud UI:** In the _Storage_ tab, choose the `image` you created in the previous step for the _Disk 0_ disk.
1. **On the HPC Cloud UI:** In the _Network_ tab, choose network _internet_ for `nic` _Interface 0_, and add a new `nic`, which will get name _Interface 1_ to assign it to your internal network.
1. **On the HPC Cloud UI:** In the _Input/Output_ tab, make sure the _VNC_ radio button is checked.
1. **On the HPC Cloud UI:** In the _Features_ tab, choose:
  * _ACPI_ as _Yes_
  * _Localtime_ as _No_
1. **On the HPC Cloud UI:** We are done preparing the `template`. Click on the green _Create_ button on the top-left of the screen.

## Start a VM and set contextualization up

* **On the HPC Cloud UI:** Instantiate the `template`. This creates a new VM. On the VNC console, make sure the _new VM_ boots. 

At some point during the boot-up sequence (almost at the end), you will see a couple of tables showing what Cloud-init has managed to configure for you, and your network should be working. 

* You can now connect to your VM via SSH with username **fedora** and your private key, like:
```sh
ssh -i ~/.ssh/my_cloud_key.rsa fedora@145.100.59.xxx
```

And you can become **root** by using `sudo su`; it won't require a password for that.
