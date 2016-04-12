---
layout: default
---

# TUDelft course 2016-04-13 - part B

<div style="float:right;max-width:205px;" markdown="1">
![TUDelft logo](/images/TUDelft_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part B of the Tutorial [TUDelft course 2016-04-13](.).

**If you have not completed (and understood)** [Part A](partA), please do so first.

* [Hands-on part B](#hands-on) <br>
1. [Persistence](#persistence) <br>
2. [Scale up to a multicore VM](#scale-up-to-a-multicore-vm) <br>
3. [Working with Storage](#working-with-storage) <br>

>**NOTE:**
>
> For the rest of the tutorial we will omit the `ubuntu@ip-...:~$` prompt in the instructions, in order to allow you copy-n-paste the commands directly in your terminal.

### 1. Persistence

`Images` can be **persistent** or **non-persistent** and you can change this mode at will.

* What does **persistent** mean?
  *  Changes by the VM are copied back to the original `image` (upon normal VM shutdown)
  *  If a VM is running with a **persistent** disk, you cannot launch a second VM using that `image`

* What does **non-persistent** mean?
  * Changes by a VM are lost at shutdown and not copied back to the original `image`
  * It **is** possible to run multiple VMs using the same single **non-persistent** `image`

> **Food for brain:**
>
> Was the first image that you imported `persistent` or wasn't it?

In this section you will work with **persistent** images. You will go through these steps:

* Making your image persistent.
* Starting a VM using the persistent image.

#### Make your image persistent
* Go to `Images` tab under _<i class="fa fa-cloud"></i> Virtual Resources_ on the left menu, and click anywhere except the tick-box on the row for the `image` you created before that you called **Course Image** .
* On the _<i class="fa fa-info-circle"></i> Info_ tab, under the _Information_ section, find the _Persistent_ attribute. It says _No_, at the moment.
* Switch the value to _Yes_.

#### Start a persistent VM
* Start your virtual machine again.
* Log in and check the files you created during the previous run [(Part A)](partA).

> **Food for brain:**
> During the previous run, the VM's disk was *non-persistent*. From now on, you can store data in your VM that will be written on the backing `image` even if you restart your VM. Try it.


### 2. Scale up to a multicore VM

The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your Virtual Machines (VMs) the form that you need them to have. In this section, you will start a _four-core_ VM, using the exact same image, the _Cursus Image_. To scale-up your VM to use multiple cores you will be:

* Editing your `template`.
* Re-instantiating a VM from the modified `template`.

#### Edit the template

You can customise your VMs by editing the `templates` you instantiate the VMs from.

* In order to edit your existing `template`, choose the **Course Template** from the _Templates_ list on the left menu, and then click on the _Update_ button on the top right of the screen.
* In the _<i class="fa fa-laptop"></i> General_ tab edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* When you are done, click on the green _Update_ button so that your changes are actually saved.

That was it. From now on you will get a 4-core VM running using the same *Cursus Image*.

#### Instantiate the four-core VM

* Instantiate a VM from the updated `template`.
* Login to the VM. *Is your data there?*
* You can verify that you are logged in on a four-core VM with the command: `cat /proc/cpuinfo`


> **NOTE:**
>Your VM's `image` was (and is) persistent.


### 3. Working with Storage

The current HPC Cloud offers two storage types: **Ceph** and **SSD**. Data stored on `Ceph` is replicated to protect against data loss in case of hardware failure. The best practice is to run your operating system on a small `SSD image` and store your bulk data on `Ceph datablock(s)`.

When you create an `image`, you must choose where it is stored, under the heading _Datastore_. You have the choice between `local_images_surfcursus` (SSD) and `ceph`.  The first `appliance` you imported, created the OS image on `local_images_surfcursus` (SSD). In this section you will use the `ceph` `datastore` option, by following these steps:

* Creating a new empty `image` for bulk data
* Adding the new `image` to the `template`
* Mounting the `image` in the VM

At this point you should **not** have any running VMs. If you do, shut them down.
Let's create a new `image`.

#### Create a new empty `image` for bulk data

* On the [UI](https://ui.hpccloud.surfsara.nl), from the menu on the left, select the _Images_ page under _<i class="fa fa-cloud"></i> Virtual Resources_.
* Click on the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button on the top.
* In the *Create image* window, fill in the form as:  
  * Name: **my data**. You will use this name later in your `template`.
  * Type: **DATABLOCK**.
  * Datastore: **106: ceph**.
  * Check the **Persistent** checkbox.
  * On the _Image location:_ group, choose radio button _Empty datablock_.
  * Give it a _Size_ in MB: **2000** (is 2GB).
  * Leave the _FS Type_ empty.
* Click the green button *Create* on the form, to submit it.

>**NOTE:**
>
>A new `image` will show on the _Images_ list, and it will keep in status LOCKED while it is being created. When it is created it will come to status READY. Then you *still* have to format and mount the disk.

#### Add the new image to the template

In order to let you VM know about the new datablock, you need to add it to your VM's `template`:

* Open the screen to edit the `template` (or create a new one from scratch).
* Select the _<i class="fa fa-tasks"></i> Storage_ tab.
* Click on the _+ Add another disk_ button (that will make a new _Disk 1_), and then choose the **my data** `image` you created, as a second `image`.
* Finish with the *Update* button on the top to submit it.

#### Mount the image in the VM

Let's start using the new disk.

* Create a new `VM` from the `Template` you created in the previous step.
* Once the `VM` is in RUNNING state, login and check if your new datablock is there:

```sh
sudo fdisk -l
```

>**Note:** The `sudo` commands will display you the message `sudo: unable to resolve host ip-145-100-...`. Ignore this.

* Create the directory where you will mount the Ceph datablock and format the drive (`xfsprogs` is installed on the image):

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

>**Food for brain:**
>
> Create new files or folders in your in `/data` directory. Logout and login again. *Are your changes still there?* Check with `ls /data/`.
> Shut the VM down and start it again. *Do you see the files on the datablock?*
> Hint: when you start the VM the datablock is not automatically mounted. You should issue the mount command once again.

* From now on, you can transfer files from your laptop on the newly created disk.

>**Food for brain:**
>
> Try to copy a file from your laptop to `/data`, e.g. with `scp myfile ubuntu@145.100.58.XYZ:/data`. Then log in to the VM and inspect the changes.


### BONUS _food for brain_

This section is meant as extra questions that we thought would be nice for you to investigate, and we invite you to do/think about them even after the workshop is finished.

**Bonus:** In Parts A & B of the workshop you have explored the UI and learnt how to import an _appliance_ from the AppMarket. However, many people come to the HPC Cloud because they can install and run their own operating system. In particular, Windows is very popular among our users.

  * Can you think of (and sketch) the steps that you would need to follow to create a VM running your favourite operating system?
  * Can you find three articles in the HPC Cloud Documentation that show how to install different operating systems from scratch?

>**Note:**
>
>  Play around, make your checks and shut down all the VMs when you are done. Your running VMs are consuming quota whether they are doing something useful or are idle.


### Next: Extras
You have completed part B of the Tutorial [TUDelft course 2016-04-13](.). If you want more of the HPC Cloud, see the [Extras part](extras).
