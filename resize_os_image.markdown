---
layout: default
---
# Resizing OS images

Images in the Apps are deliberately made rather small. They are usually enough to hold the operating system and allow installing some few extra software packages. And you are advised to store data in a separate Ceph image.

That description is usually valid for most use cases, but occasionally you may need to have so many different programs installed that you may require some extra space in your OS partition.

> **IMPORTANT:**
>
> We created this page because some people think it is useful. We actually recommend *NOT* resizing OS images, because it is an error-prone process and may lead to data loss. We also recommend that you make a back-up of your image before attempting any of this.

The 1-2-3 summary to actually get your image resized is:

1. Attach the image you want to expand in another running VM.
2. In that VM, resize (and, maybe, repartition) the image.
3. Export (or save) the resized image as a different image.

The steps in this page will show in detail how to do it. 

## Preparing the image for resizing

You must make sure that the `image` you are willing to download is currently **not** in use by any running VM. 

1. **On the UI:** click on the `image` you want to download to display the extended information about that `image`. 
1. **On the UI:** Then click on the tab _VMs_ of the extended information, so that you can see the list of all VMs that are using the `image`. 
1. **On the UI:** For every VM that you see on the list of VMs that are using the `image`, click on that VM's line to see extended information about that VM. Then shut that VM down.
1. **On the UI:** Go back to the _Info_ tab of the `image`'s extended information. Click on the _Clone_ button to make a backup of the `image` and name it appropriately (e.g.: with the suffix _.backup_).
1. **On the UI:** Go back to the _Info_ tab of the original `image`'s extended information. Change now:
  * the _Type_ to _DATABLOCK_
  * the _Persistent_ to **_non-persistent_**
  
> **NOTE:**
>
> It is important that you make the `image` you want to resize **non-persistent** at this point, because the new size you want to give the VM will come at the point when you create a VM later. And a new size can only be given to images that are non-persistent.

## Creating a utility VM

We will be using an extra VM as the central place of operations for the rest of the tasks. We will call it **Utility VM**.

We will be attaching the image you want to resize in that _Utility VM_, then resizing the partitions in that image so that they expand to use the full available size of the image and then saving that resized image as a new image.

1. **On the UI:** Go to the _Apps_ option of the _Storage_ section and import an _appliance_ you feel comfortable with (detailed instructions in [our General Start article](general-start)). We will be using Ubuntu Desktop throughout this guide, so that you can use `gparted` to resize the partitions.
1. **On the UI:** Make sure that you **edit the `template`** you have just imported from the _appliance_ so that you: 
 * **in the _Storage_ tab:** include a `disk` with the _image_ you want to resize.
 * **in the _Network_ tab:** include a `nic` connected to the Internet
1. **On the UI:** Save the changes to the `template` you just edited
1. **On the UI:** Click on the _Instantiate_ button to show the screen that will allow you to give a name to the VM. Make sure:
 * That you provide a name for the VM
 * That you **give the new size** you require to the _image_ you want to resize
 * Then, click on the green _Instantiate_ button to create the VM.

Make sure you can log in to the _Utility VM_ via SSH using the `-X` flag. 

## Resizing and repartitioning the image

We will now resize the partition in the `image`. 

> **NOTE:**
>
> We cannot know in advance which kind of partitioning your _image_ will have, so we cannot describe a step-by-step guide that will always work for you. In this example we will be resizing an Ubuntu image from our Apps, because we actually know what the partitioning is there.

1. **In your laptop:** Connect via SSH to the _Utility VM_, using the **-X** flag so that you can display graphical windows.
1. **In the _Utility VM_:** become the _root_ user (`sudo su -`). Run the command to install gparted: `sudo apt-get install gparted`. 
1. **In the _Utility VM_:** launch the GParted program by running: `sudo gparted`. This will open a new graphical window for GParted.
1. **In _Gparted_:** On the top-right corner, next to a hard drive icon, you probably have selected, by default, the `/dev/vda` drive. That is **NOT** the one you want to resize. Look for the right one by click on the arrow to the right of that, and click then on the right one to start operating on it (as help to identify the right one, you can already see on the drop-down list of hard drives the size you typed on the UI).
1. **In _Gparted_:** Under the drop-down list where you have selected the right hard drive you now see a bar depicting the partitions that are available on that hard drive. You will probably see a dark-gray _unallocated_ area at the right of some other partitions (each partition shown as a different colour). Under that bar, you have the same partitions in a tree (or list) with some extra information like the size, etc. Assuming the latest Ubuntu _image_, you should see a big ext4 partition with a dark-blue border and a second smaller extended partition with a light-blue border. Within this extended partition you have another linux-swap partition with a red border. Finally you will see the unallocated space. We will have to:
 * **In _Gparted_:** Remove the linux-swap partition (right-click on it, then choose _Delete_)
 * **In _Gparted_:** Remove the extended partition (right-click on it, then choose _Delete_)
 * **In _Gparted_:** Expand the ext4 partition (right-click on it, then choose _Resize/Move_). In the dialog that appears, type in the _Free space **following**_ field the size you want to leave for the swap-partition (i.e.: 512). That should automatically fill in the _New size_ field to fill in the rest of the unallocated space. Click on the _Resize/Move_ button.
 * **In _Gparted_:** Create a new extended partition (right-click on the unallocated space, then choose _New_). In the dialog that appears, for the the _Create as:_ field choose _Extended partition_. Click the _Add_ button.
 * **In _Gparted_:** Create a new linux-swap partition (right-click on the unallocated space, then choose _New_). In the dialog that appears, for the _File system:_ field choose _linux-swap_. Click the _Add_ button.
 * **In _Gparted_:** We have now the new layout in the main window of GParted. Click on the _Apply_ button to save the changes (and confirm if prompted, to actually make the changes). You can then quite GParted.

## Saving the resized image

The image is now ready with the new layout and everything. However, it is non-persistent, so if we shut the VM down we will lose the changes. On the other hand, because a VM is running, you cannot guarantee that all changes have been flushed to the image. We recommend that you use the UI's _Power off_ action to leave the VM in a controlled shutdown (but still living), so that you can save a copy of the attached _image_. 

1. **On the UI:** click on the _Utility VM_ to see its extended information. Click then on the _power_ drop-down button and choose option _Power off_. After several  states, your VM's status will be POWEROFF.
1. **On the UI:** in the extended information about the VM, go now to the _Storage_ tab. Next to the `image` you have resized, you should see a link that reads _Save as_. Click on the _Save as_ link for that `image`. Give the `image` you are going to create a new name (e.g.: add the suffix `.resized` to its original name). The state of the VM changes while the image is being copied. It can take a while before the image is copied. When the copy is finished, the VM's status is again POWEROFF. And then you will see a new `image` in the list of images with the resized `image` in status READY.
1. **On the UI:** Go back to the _Info_ tab of the resized `image`'s extended information. Change now:
  * the _Type_ to _OS_
  * the _Persistent_ to **_persistent_** (if you want your image to keep changes)

## Changing the original template

You now need to use the new resized `image` when you create a new VM. You need to change the `template` for that.

1. **On the UI:** In your templates list, locate the original template. Click on it to see the extended information.
1. **On the UI:** With the extended information of the VM in sight, click on the _Clone_ button. Give it a new name that describes that is the new one (e.g.: add the _.resized_ suffix to the original name). 
1. **On the UI:** In your templates list, locate the resized template. Click on it to see the extended information.
 * On the _Storage_ tab, change the original `image` for the **resized** one.
1. **On the UI:** Click on _Update_ to save the changes to the resized template.
1. **On the UI:** Click on the _Instantiate_ button to make a new VM out of the resized template (which now is pointing to the resized image).

If everything went well, your VM will boot normally and you will have more space in your OS partition.
