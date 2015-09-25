---
layout: default
---

# Create an Image on your own laptop

You can prepare `image`s on your own laptop (or local machine, but we will call it laptop from now on), that you can later upload to the HPC Cloud. 

## Using VirtualBox

One piece of software we often see around is VirtualBox. VirtualBox is a virtualisation solution that you can install on your laptop. You can run virtual machines locally, and that should make it easy enough for you to set up your software and basic environment, without having to depend on the HPC Cloud. 

Once you are ready configuring your environment in your VirtualBox VM, shut your VM down. Then you can export it as a VMDK file. 

### Directly using VMDK
VirtualBox uses its own `image` format, so you will have to tell the HPC Cloud how to use the file you exported from VirtualBox. To do so, when you start creating a new `image` on the HPC Cloud, you will choose to _Upload_ the file you exported from VirtualBox, and on the _Advanced options_ of the _Create Image_ form, on the _Device prefix_ box type `vd` and on the _Driver_ box type `vmdk`. 

### Converting to QCOW2
Alternatively, you can convert the VMDK file you exported to the QCOW2 format. 

>**Note:**
>
>Do **not** use VirtualBox's option to export to QCOW2 format, because that QCOW2 format will **not** work on the HPC Cloud.
>
>You can use the [QEMU utilities](http://qemu.org) (in particular, `qemu-img`), to convert your images among different formats. You can install these utilities in your laptop to perform the conversions. The instructions to install the QEMU utilities depend on your laptop's operating system. For most Linux distributions, you can usually find a package in your package management system (i.e.: you can easily install them with some sort of `sudo apt-get install` or `yum install` or any analogous commands). For Mac OS or Windows, you can find some hints on their _Links_ page: http://wiki.qemu.org/Links.

Once you have qemu-img installed on your laptop, converting your VMDK to QCOW2 is just a breeze. Run (replace _file_ and _image_ for paths that make sense to you):

```sh
qemu-img convert -O qcow2 file.vmdk image.qcow2
```
