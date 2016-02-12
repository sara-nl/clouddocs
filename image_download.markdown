---
layout: default
---
# Download an `image`

> **NOTE:**
>
> At the current stage it is **not** possible to download `image`s directly from the user interface. However, the instructions here allow you to fetch a copy of an `image` of yours off the HPC Cloud at your own pace. 
>
> If you find yourself struggling to succeed in following these instructions, you may ask the HPC Cloud operators to try to make an `image` available for you by sending an e-mail to our [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

You can download a copy of an `image` by attaching that image as if it were just another storage drive to a running VM. The following overview outlines the steps we will be following throughout this guide. We will be:

1. Making sure the `image` you want to download is **not** in use by any VM
1. Starting a VM **without** using the `image` you want to download (for example, create a new one from the _AppMarket_) Let's call this **Utility VM**
1. Attaching the `image` you want to download to the **Utility VM**
1. Making a file off the `image` you want to download
1. Downloading the file you just created
1. Clearing your footprints

Each section now goes into more detail for each of the previous steps.

## Preparing the image for download

You must make sure that the `image` you are willing to download is currently **not** in use by any running VM. 

1. **On the UI:** click on the `image` you want to download to display the extended information about that `image`. 
1. **On the UI:** Then click on the tab _VMs_ of the extended information, so that you can see the list of all VMs that are using the `image`. 
1. **On the UI:** For every VM that you see on the list of VMs that are using the `image`, click on that VM's line to see extended information about that VM, and shut that VM down.
1. **On the UI:** Go back to the _Info_ tab of the `image`'s extended information. Change now the _Type_ to _DATABLOCk_.

## Creating a utility VM

We will be using a VM as the central place of operations for the rest of the tasks. We will call it **Utility VM**.

We will be creating a file in the _Utility VM_ containing all the contents of the `image` you want to download. That file is what you will download in the end. Therefore, the Utility VM needs to have enough space to host that file.

> **NOTE:**
>
> Because the `image` you want to download is likely larger than the average space available in an _AppMarket_'s _appliance_ sole `image`, we will attach an extra Ceph _Datablock_ to the _Utility VM_ so that we can create the large file with the contents of the `image` in there. This means, in turn, that you must have enough quota available in the Ceph `datastore`. You can view your current quotas on the UI itself. From the [_User_ view](user-interface), click on the _Infrastructure_ tab from the main menu on the left, and then _Datastores_ under it. You should see there a list with all the `datastores` you have access to. If the quota you see there is not enough to fit a whole copy of the `image` you want to download, then please get in contact with us: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

1. **On the UI:** Go to the _AppMarket_ and import an _appliance_ you feel comfortable with (detailed instructions in [our General Start article](general-start)). We will be using CentOS 7 throughout this guide.
1. **On the UI:** Create a new empty `datablock image` in the Ceph `datastore` that is big enough to fit a copy of your `image` (detailed instructions in [our Datablocks article](create-datablocks)). Let's give this `datablock image` the name **wagon**.
1. **On the UI:** Make sure that you **edit the `template`** you have just imported from the _appliance_ so that you: 
 * **in the _Storage_ tab:** include a `disk` with the newly created empty `datablock image` (the _wagon_).
 * **in the _Network_ tab:** include a `nic` connected to the Internet
1. **On the UI:** Save the changes to the `template` you just edited
1. **On the UI:** Instantiate the `template`. Make sure you can log in to the _Utility VM_ via SSH. 

## Attaching the image to be downloaded

We will now hot-attach the `image` you want to download to the _Utility VM_. But first we need to know which drives you currently see in the _Utility VM_, so that we can more easily identify each of them.

1. **In your laptop:** Connect via SSH to the _Utility VM_
1. **In the _Utility VM_:** become the _root_ user. Run the command: `fdisk -l`. You can probably see plenty of output, and somewhere around there, two lines (not necessarily following one another) will read something like: `Disk /dev/vda: ...` and `Disk /dev/vdb: ...`. These indicate that you have two drives; namely: the Operating System disk is one, and the empty _wagon_ `datablock` is the other one. Probably, looking at their sizes, you can easily identify which is which. For the rest of this guide, let's assume the following (your case may just as well be the opposite):
 * `/dev/vda` is the Operating System image (the _Utility VM_'s Operating System, remember; it is **not** the one you may be willing to download)
 * `/dev/vdb` is the _wagon_ `datablock`
1. We will have to format and mount the _wagon_ `datablock`. Like this (for more details see [our Datablocks article](create-datablocks)):
 * **In the _Utility VM_:** Become _root_, with `sudo su -`
 * **In the _Utility VM_:** `mkdir /wagon`
 * **In the _Utility VM_:** `mkfs -t xfs /dev/vdb`
 * **In the _Utility VM_:** `mount /dev/vdb /wagon`
 * **In the _Utility VM_:** `touch /etc/rc.d/rc.local`
 * **In the _Utility VM_:** `echo "echo 4096 > /sys/block/vdb/queue/read_ahead_kb" > /etc/rc.d/rc.local`
 * **In the _Utility VM_:** `chmod 755 /etc/rc.d/rc.local`
1. **On the UI:** Go to the _Virtual Machines_ tab of the main menu, and click on the _Utility VM_'s line so that you can see its extended information.
1. **On the UI:** Click on the _Storage_ tab to see the `disks` currently attached to the VM.
1. **On the UI:** Click on the _Attach disk_ green button to bring up the _Attach new disk_ dialogue.
1. **On the UI:** On the _Attach new disk_ dialogue, look for the `image` you want to download. Click on the `image` to select it. Then finally click on the _Attach_ green button at the bottom of the dialogue. The dialogue will disappear and y our _Utility VM_ will come into the HOTPLUG status and it will remain so until the newly attached `disk` is ready for use. Then the _Utility VM_ will come back to status RUNNING.
1. **On the UI:** Wait until the _Utility VM_ is back in status RUNNING.
1. We want to find and see the `image` you want to download in the _Utility VM_. Therefore:
 * **In the _Utility VM_:** Become _root_, with `sudo su -`
 * **In the _Utility VM_:** Run again `fdisk -l`. You should see a new drive in the listing from that command, likely: `Disk /dev/vdc: ...`. For the rest of the guide we will assume that the `image` you want to download is located in `/dev/vdc`.

## Making a file off the image to be downloaded

We will be making a bit-by-bit copy of the `image` you want to download, and storing that copy into a plain file that you can then download. We will be using the command `dd` which does all of that for you (you can read more in [Wikipedia](https://en.wikipedia.org/wiki/Dd_(Unix)).

1. **In the _Utility VM_:** become the _root_ user. 
1. **In the _Utility VM_:** run the command to create the copy of the `image` into a file: `dd if=/dev/vdc of=/wagon/image_file.img`
1. **In the _Utility VM_:** Once the previous command finishes, verify that the file is properly created. You can issue a command that should return empty (or nothing) when comparing two files: `diff /dev/vdc /wagon/image_file.img`

## Downloading the file

1. **In your laptop:** You can now download the file via SSH. For example, you can use `scp` or `sftp`. Like this: `scp admincentos@145.100.XXX.YYY:/wagon/image_file.img`.

> **Hint:**
>
> If you are acquainted with different virtualisation technologies and know about things such us the _qcow2_ format and tools like _qemu_, then you may want to convert the raw image you have just created into any other format you may like. It may be worth looking into this because using a format with compression may save some bandwith and download time.

## Clearing your footprints

Once you have downloaded the `image_file.img` file, you can destroy all the scaffolding you rigged up to be able to download it. That means that you can:

1. Delete the _Utility VM_
2. Delete the `template` for the _Utility VM_
3. Delete the `image` for the _Utility VM_
4. Delete the _wagon_ `datablock image`.

Further, if you do **not** need the `image` you wanted to download in the UI, then you can delete it now as well. If you still want to use it, however, you may want to change its type back to _OS_.

