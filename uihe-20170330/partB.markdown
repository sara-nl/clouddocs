---
layout: default
---

# UNESCO-IHE symposium 2017-03-30&31 <br/> Part B

<div style="float:right;max-width:205px;" markdown="1">
![UNESCO-IHE logo](/images/Unesco-Ihe-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part B of the tutorial [UNESCO-IHE symposium 2017-03-30&31](.) and covers the following topics:

1. [Persistence](#persistence)
2. [Scale up to a multicore VM](#scale-up-to-a-multicore-vm)
3. [Working with Storage](#working-with-storage)

>**NOTES:**
>
> If you have not completed (and understood) [Part A](partA), please do so first.
>
> For the rest of the tutorial we will omit the `ubuntu@ip-145...:~$` prompt in the instructions. It allows you to copy-n-paste the commands directly to your terminal.

### 1. Persistence

`Images` can be **persistent** or **non-persistent** and you can change this mode at will.

* What does **persistent** mean?
  *  Changes made by the VM are copied back to the original `image` (upon normal VM shutdown)
  *  If a VM is running with a **persistent** disk, you **cannot** launch a second VM using that same `image`

* What does **non-persistent** mean?
  * Changes made by a VM are lost at shutdown and not copied back to the original `image`
  * It **is** possible to run multiple VMs using the same single **non-persistent** `image`

> **Food for brain:**
>
> Was the first image that you imported `persistent`?

In this section you will work with **persistent** images. You will go through these steps:

* Making your image persistent.
* Starting a VM using the persistent image.

#### Make your image persistent
* Go to the _Images_ tab <i class="fa fa-download"></i> under _Storage_ on the left menu. Select the image by clicking anywhere, except the tick-box, on the row for the `image` you created before (**Course Image**).
* On the _Info_ tab <i class="fa fa-info-circle"></i>, under the _Information_ section, find the _Persistent_ attribute. It says _No_ at the moment.
* Switch the value to _Yes_ by clicking on the pencil icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>.

#### Start a persistent VM
* Start your virtual machine (VM) again.
* Log in and check the files you created during the previous run [(Part A)](partA).

<div class="alert alert-warning" markdown="1">
<i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true">Warning</i><br>

The Ubuntu Desktop 14.04 _App_ is affected by a [problem described in our documentation](/connection_problem_ubuntu1404). To correct it easily, please follow these steps now that you are connected via SSH:

```sh
wget https://github.com/sara-nl/clouddocs/raw/gh-pages/uihe-20170330/code/cloudinit_fix.sh
chmod +x cloudinit_fix.sh
sudo ./cloudinit_fix.sh
```

</div>

> **Food for brain:**
> 
>* Is/are the file(s) you created on your VM (part A) there?
>* During the previous run, the VM's disk was *non-persistent*. From now on, you can store data in your VM that will be written to the `image` even if you restart your VM. Try it.

You can now shut your VM down.

### 2. Scale up to a multicore VM

The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your VMs the form that you need them to have. In this section, you will start a _four-core_ VM, using the exact same image, the _Course Image_. To scale-up your VM to use multiple cores you will be:

* Editing your `template`.
* Re-instantiating a VM from the modified `template`.

#### Edit the template

You can customise your VMs by editing the `templates` you instantiate the VMs from.

* In order to edit your existing `template`, from the _VMs_ tab <i class="fa fa-file-o"></i> under _Templates_ on the left menu, choose the **Course Template**. Then click on the _Update_ button on the top left of the screen.
* In the _General_ tab <i class="fa fa-laptop"></i> edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* When you are done, click on the green _Update_ button so that your changes are actually saved.

From now on, whenever you instantiate this `template`, you will get a 4-core VM running using the same *Course Image*.

> **Food for brain:**
>
> After changing the `template` as described above, how many cores do you expected your VM to have? Does changing a `template` affects the currently running VM's that are based on it?

#### Instantiate the four-core VM

* Instantiate a VM from the updated `template`.
* Login to the VM. *Is your data there?*
* You can verify that you are logged in on a four-core VM with either of the following commands: 
  * `cat /proc/cpuinfo | grep processor`
  * `lscpu`


#### Shut down the four-core VM

* Choose the VM from your list
* Click on the red dust bin and, under that, click the option _Terminate_.


### 3. Working with Storage

The current HPC Cloud offers two storage types: **Ceph** and **SSD**. Data stored on `Ceph` is replicated to protect against data loss in case of hardware failure. Our recommended best practice is to run your operating system on a small `SSD image` and store your bulk data on `Ceph datablock(s)`.

When you create an `image`, you must choose where it is stored, under the heading _Datastore_. You have the choice between `wshop-uihe_img` (SSD) and `ceph`.  When you imported your first _App_ in tutorial Part A, you created an image containing an Ubuntu 14.04 OS on `wshop-uihe_img` (SSD). In this section we're introducing to you the `ceph` `datastore` option. You can create an `image` in `ceph` datastore by following these steps:

* Creating a new empty `image` for bulk data
* Adding the new `image` to the `template`
* Mounting the `image` in the VM

At this point you should **not** have any running VMs. If you do, shut them down.

#### Create a new empty `image` for bulk data

Let's create a new `image`.

* On the [UI](https://ui.hpccloud.surfsara.nl), from the menu on the left, under the _Storage_ option, select the _Images_ tab <i class="fa fa-download"></i>.
* Click the green button on the top _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_.
* In the *Create image* screen fill in the form as:  
  * Name: **my data**. You will use this name later in your `template`.
  * Type: **Generic storage datablock**.
  * Datastore: **106: ceph**.
  * Check the **This image is persistent** checkbox.
  * On the _Image location:_ group choose radio button **Empty datablock**.
  * Give it a _Size_ in MB: **2000** (is 2GB, approximately).
* Click the green button *Create* at the top to create it.

>**NOTE:**
>
>A new `image` will show on the _Images_ list <i class="fa fa-download"></i> and it will keep in status LOCKED while it is being created. Once it is created it will display status READY. Then you *still* have to format and mount the disk; you will be doing that just in a moment.

#### Add the new image to the template

In order to let your VM know about the new datablock, you need to add it to your VM's `template`:

* Open the screen to edit the `template` (or create a new one from scratch).
* Select the _Storage_ tab <i class="fa fa-tasks"></i>.
* Click on the blue button _<i class="fa fa-plus-circle" style="background-color:#4DBBDC;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_, that will make a new _Disk 1_, and then choose the **my data** `image` you created as a second `image`.
* Finish with the *Update* button on the top to submit the changes.

#### Mount the image in the VM

Let's start using the new disk.

* Instantiate a new `VM` from the `Template` you modified in the previous step.
* Once the `VM` is in RUNNING state, login and check that your new datablock is available there:

```sh
sudo fdisk -l
```

>**Note:** If above `sudo` command displays the message `sudo: unable to resolve host ip-145-100-...` just ignore it.

> **Food for brain:**
>
> You should see (probably, as a last line of the output of the previous command) something like: `Disk /dev/vdb doesn't contain a valid partition table`. The output should also inform that there is a Disk with approximately of the size you typed in the UI in the previous step. What is that Disk's name?


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
> Try to copy a file from your laptop to `/data`, e.g. with `scp myfile ubuntu@145.100.5Q.RST:/data`. Log in to the VM and inspect the changes.


### BONUS _food for brain_

This section is meant to propose extra questions we thought would be nice for you to investigate. We invite you to do/think about them even after the workshop has finished.

**Bonus:** In Parts A & B of the workshop you have explored the UI and learnt how to import an _appliance_ from the Apps Market. However, many people come to the HPC Cloud because they can install and run their own operating system. In particular, Windows is very popular among our users.

  * Can you think of (and sketch) the steps that you would need to follow to create a VM running your favourite operating system?
  * Can you find three articles in the HPC Cloud Documentation that show how to install different operating systems from scratch?

>**NOTE:**
>
>  Play around, make your checks and **shut down all the VMs when you are done**. Your running VMs are consuming quota whether they are doing something useful or are idle.


### Next: Extras
You have completed part B of the Tutorial [UNESCO-IHE symposium 2017-03-30&31](.). If you want more of the HPC Cloud proceed to the [Extras part](extras).
