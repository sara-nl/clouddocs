---
layout: default
---

# VU HPC course 2018-11-16 <br/> Part B

<div style="float:right;max-width:205px;" markdown="1">
![VU logo](/images/VU_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part B of the tutorial [VU HPC course 2018-11-16](.) and covers the following topics:

1. [Persistence](#persistence)
2. [Scale up to a multicore VM](#scale-up-to-a-multicore-vm)
3. [Working with Storage](#working-with-storage)

>**Notes**
>
>If you have not completed and understood [Part A](partA), please take your time before moving forwards.
>
>Do you have any Virtual Machine(s) running? [Terminate](partA#first_shutdown) them now.
>
>For the rest of the tutorial we will omit the terminal prompt `ubuntu@packer-ubuntu-14:~$` in the instructions. It allows you to copy-n-paste the commands directly to your terminal.

### 1. Persistence

`Images` can be either **persistent** or **non-persistent** and you can change this mode at will.

* What does **persistent** mean?
  *  Changes made by the VM are copied back to the original `image` upon normal VM shutdown
  *  If a VM is running with a **persistent** disk, you **cannot** launch a second VM using that same `image`

* What does **non-persistent** mean?
  * Changes made by a VM are lost at shutdown and not copied back to the original `image`
  * It is possible to run multiple VMs using the same single **non-persistent** `image`

Take a couple of minutes to read again above statements and fully understand its implications. The persistency concept is crucial at early stages, when you are starting to build a VM that meets your needs, by installing software, pushing data, etc. At this stage, your aim might well be to preserve all your changes! At later stages of your work, you might want to profit from the capability of instantiating multiple Virtual Machines from the same 'pristine' image you have prepared so diligently.

In this section you will work with **persistent** images. We will guide through the following steps:

* Making your image persistent
* Starting a VM using the persistent image

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> Was the first image that you imported in [Part A](partA#import_appliance_from_Marketplace) `persistent`?

#### Making your image persistent

No Virtual Machine should be running at this point and making use of the `image` we want to change the _Persistent_ attribute. Otherwise, the following procedure will not work.

* Go to the _Images_ tab <i class="fa fa-download"></i> under _Storage_ on the left menu
* Select the image by clicking anywhere on the row, except the tick-box, for the `image` you created before (**First Image**)
* On the _Info_ tab <i class="fa fa-info-circle"></i> under the _Information_ section, find the _Persistent_ attribute
* Change the value of the _Persistent_ attribute from _No_ to _Yes_ by clicking on the pencil icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>

#### Starting a persistent VM

You already have the knowledge on how to start a VM. Make use of the `template` you created before (**First Template**).

* Start a new VM and call it **My Second VM**
* Log in and check the files you created during the previous run [(Part A)](partA#logging_in_to_the_virtual_machine)
* Create another file now (just because)

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
>* Why there was no need to edit the `template` before instantiating the VM?
>* Is/are the file(s) you created in your VM (in part A) still there?
>* In the previous VM run the disk (`image`) attached was *non-persistent*. From now on, you can safely store data in your VM! It will be written to the `image` attached to the VM, even if you restart it. Try it.

You can now shutdown the VM. Remember, use the _Terminate_ button on the UI.

### 2. Scale up to a multicore VM

From the course introduction presentation, you gained the insight that SURFsara HPC Cloud operates as an Infrastructure as a Service (IaaS). This cloud computing model brings flexibility to our users, such as the ability to scale-up. In this section, you will start a **4-core** VM using the exact same `image` as before.

To scale-up your VM to use multiple cores you will be:

* Editing your `template`
* Re-instantiating a VM from the modified `template`

#### Editing the template

You can customise your VM(s) by editing the `template` you instantiate the VM(s) from. Proceed as follows:

* From the _VMs_ tab <i class="fa fa-file-o"></i> under _Templates_ on the left menu, choose the **First Template** (tick box)
* Click on the _Update_ button on the top left of the screen
* In the _General_ tab <i class="fa fa-laptop"></i> edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* Click on the green _Update_ button so that your changes are saved

From now on, whenever you instantiate this `template`, you will get a 4-core VM running using the same *First Image* you have been using so far.

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> Imagine that a VM is already running instantiated from the **First Template**. What will happen with that VM if you edit the same `template`?

#### Instantiating the four-core VM

* Instantiate a VM from the updated `template` and call it **My Third VM**
* Login to the VM
* Confirm that your VM has four-cores available, e.g. by suing either of the following commands:
  * `cat /proc/cpuinfo | grep processor`
  * `lscpu`

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> Since we are in the VM again ... are your files there now? All? None? Can you explain?

#### Shut down the four-core VM

Before moving forward, please **remember to terminate all your VMs**. Again, use the _Terminate_ button on the UI.

### 3. Working with storage types

The current HPC Cloud setup offers two storage types: **SSD** and **Ceph**. SSD storage is available as Solid State Drive (SSD) disks in the compute nodes where the VMs run. The available SSD storage per node is limited. On the other hand, [Ceph](http://ceph.com/) is a robust and flexible storage system that aims for high performance. Ceph can store rather big files, and data placed in our Ceph storage cluster is replicated throughout the cluster to protect against data loss in case of hardware failure. As a guiding note, we advise our users to run the operating system in a small `SSD image`, while bulk data should be stored in `Ceph datablock(s)`.

For each `image` in your Cloud environment, you need to choose which storage type you want to use. This is achieved by placing the `image` on either of the two `datastores` you have available: `Courses_img` (which provides the SSD storage type) and `ceph`.

When you imported your first `app` in [Part A](partA#import_appliance_from_Marketplace) of this tutorial, you created an `image` which you assigned to the *Courses_img* datastore. The `image` has Ubuntu desktop 14.04.5 installed and will be running on the SSD storage of the computing nodes.

In this section you will be exploring the `ceph` `datastore`. You can create and make use of an `image` stored in the `ceph` datastore, by following these steps:

* Creating a new `image` for bulk data
* Adding the new `image` to the `template`
* Mounting the `image` in the VM

At this point you should **not** have any running VMs. If you have, shut them down now.

#### Creating a new empty `image` for bulk data

Let's create a new `image` via the HPC Cloud [UI](https://ui.hpccloud.surfsara.nl).

* From the menu on the left under the _Storage_ option, select the _Images_ tab <i class="fa fa-download"></i>
* Click the green button on the top _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_
* In the *Create image* screen fill in the form as:  
  * Name: **my data** (you will use this name later in your `template`)
  * Type: **Generic storage datablock**
  * Datastore: **106: ceph**
  * Check the **This image is persistent** checkbox
  * On the _Image location_ group choose the radio button **Empty disk image**
  * Give it a _Size_ in MB: **2048** (i.e. 2 GB)
* Click the green button *Create* at the top to create it

>**Note**
>
>A new `image` will show on the _Images_ list <i class="fa fa-download"></i> and it will keep in status LOCKED while it is being created. Once it is created it will display status READY.

#### Adding the new image to the template

In order to let your VM know about the new datablock, you need to add it to your VM's `template`:

* Open the screen to edit the `template` (or create a new one from scratch)
* Select the _Storage_ tab <i class="fa fa-tasks"></i>
* Click on the blue button _<i class="fa fa-plus-circle" style="background-color:#4DBBDC;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_, that will make a new _Disk 1_
* Choose the **My Data** `image` that you have just created
* Finish with the *Update* button on the top to submit the changes

#### Mounting the image in the VM

Let's start using the new disk.

* Instantiate a new VM from the `template` you modified in the previous step, and call it **My Fourth VM**
* Log in and check that your new datablock is available:

```sh
sudo fdisk -l
```

<!---
>**NOTE:**
>
>The following `sudo` command(s) may displays the message `sudo: unable to resolve host ip-145-100-...`. You can safely disregard that error message.
-->

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
>From the output of the previous command:
>   * can you identify the two disks attached to your VM?
>   * can you explain the `Disk /dev/vdb doesn't contain a valid partition table` statement?

* Create the directory where you will mount the Ceph datablock and format the drive:

> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> **Warning**
>
> Creating a file system in a disk (to format) is a dangerous operation. Make sure you format the correct disk device!

```sh
sudo mkdir /data  
sudo mkfs -t xfs /dev/vdb
```

* Mount the datadisk in the VM:

```sh
sudo mount /dev/vdb /data  
```

* Arrange the permissions to allow non-root access to the /data directory:

```sh
sudo chown ubuntu:ubuntu -R /data
```

><i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain:**
>
>1. Create new files or folders in your `/data` directory. Logout and login again. Are your changes still there?.
>2. Shut down the VM and start it again. Do you see the files on the Ceph datablock?
> Hint: when you start the VM the datablock is not automatically mounted.
>3. Copy a file from your laptop to `/data`, e.g. with `scp filename ubuntu@145.100.5Q.RST:/data`. Log in to the VM and inspect the changes.

### <i class="fa fa-question-circle" aria-hidden="true"></i> Bonus food for brain

In [Parts A](partA) & [B](.) of the workshop you have explored the UI and learnt how to import an _appliance_ from the Apps Marketplace. You also played with different storage solutions to hold data. Many users come to the HPC Cloud because they can install and run their favorite operating system. For example, Windows is very popular for some of our users.

* Can you think of (and sketch) the steps that you would need to follow to create a VM running your favourite operating system?
* Can you find three articles in the HPC Cloud Documentation that show how to install different operating systems from scratch?
* Can you sketch the steps required if you would like to have a datablock sharing data with multiple Virtual Machines?

### Next: Extras
You have completed part B of the Tutorial [VU HPC course 2018-11-16](.). If you want more of the HPC Cloud proceed to the [Extras part](extras).

> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> **Important**
>
> Your running VMs get exclusive access to their resources, whether they are doing something useful or not. Because the HPC Cloud is offered on a fair-share basis and other users may actually be needing resources that you may be holding, please **remember to terminate all your VMs** before you move to the next part of this workshop.
