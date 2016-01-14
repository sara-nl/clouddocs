---
layout: default
---

# UvA workshop 2016-01-25 - part B

> ## Warning: Under construction

This is part B of the Tutorial [UvA workshop 2016-01-25](UvAworkshop-2016-01-25).  
**If you have not completed (and understood)** [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA), please do so first.

* [Hands-on part B](#hands-on) <br>
  * [3. Persistence](#3.-Persistence) <br>
  * [4. Scale-up to a multicore VM](#4.-Scale-up-to-a-multicore-VM) <br>
  * [5. Wrap up](#5.-Wrap-up) <br> 


### <a name="3.-Persistence"></a> 3. Persistence

Disk images can be `persistent` or not and you can switch that flag. 

* What does `persistent` mean?
  *  changes by the VM are copied back to the original disk image
  *  if a VM runs with a persistent disk, you cannot launch a second VM using that disk

* What does `non-persistent` mean?
  * changes by a VM are lost at shutdown and not copied back to the original disk image
  * it possible to run multiple VMs using the same non-persistent disk

> **Food for brain:**
>
> Was the first image that you imported `persistent` or not?

In this section you will work with persistent images to install an application in your VM. You will go through these steps: 

> 
* Make your image persistent.
* Deploy a VM using the persistent image.
* Install and Run Mandelbrot in your VM.

#### Make your image persistent
* Go to *Images* tab under Virtual Resources and click on the **Cursus Image**.
* Under the Information section, find the *Persistent* entry. It says "no".
* Switch the value to "yes".

#### Start a persistent VM
* Start your virtual machine again. 
* Login and check the files you made during the previous run. 

> During the previous run the VM's disk was *non-persistent*.

#### Install and Run Mandelbrot

The disk image is now marked as **persistent**. This means that you can install your software or store your data in the VM and make sure that everything will remain in the VM once it is shutdown and re-instantiated.

Let's install and run an example to investigate the HPC Cloud capabilities. The code was taken from [mandelbrot-rmi](https://code.google.com/p/mandelbrot-rmi/), a distributed Manderbrot renderer based on [Java RMI](https://en.wikipedia.org/wiki/Java_remote_method_invocation), with some small improvements.

>**NOTE:**
>
> For the rest of the tutorial we will omit `ubuntu@ip-145-100-59-102:~$` prompt in the instructions, in order to allow you copy-paste the commands directly in your terminal.

* Login to the running VM again.

* Install *java* as it is required for running the example (optionally try `java -version` to verify that is it is missing):

```sh
sudo apt-get install default-jre
```

* Download the example: 

```sh
wget https://doc.hpccloud.surfsara.nl/assets/mandelbrot-rmi-bin.tgz
```

**Run the example**

* Create a blank directory and extract the tar:

```sh
mkdir mandelbrot-rmi
cd mandelbrot-rmi
tar xvzf ../mandelbrot-rmi-bin.tgz
ls
```

* Launch the first Mandelbrot server that will pose as the RMI registry with an arbitrary name argument, e.g. *apple*. To do this:
  * Start a new local terminal (Linux or Mac users) or Gitbash (Windows) and log in to the same virtual machine.
  * Run the following commands:

```sh
cd $HOME/mandelbrot-rmi
./startserver.sh apple
```

* Return to the first terminal window (connected to the VM with `ssh -X`). You will now start a Mandelbrot client and pass it the _apple_ server name:

```sh
cd $HOME/mandelbrot-rmi
./startclient.sh apple
``` 
  A window should pop up on your laptop displaying a full *Mandelbrot* set.

* Interact with the display:

> **NOTE:**
>
>Left click will zoom in to the yellow rectangle.  
Right click will zoom out.  
Dragging will change the size of the rectangle.  

> **Food for brain:**
>
> The Mandelbrot client and server both display logging info and the computation time. Zoom in on the mandelbrot and inspect this inforamtion.

You can stop the Mandelbrot client or server applications anytime with _Ctrl+C_.

* Terminate the client now.

* Launch additional Mandelbrot servers with different names. 
Start the new servers and the client, all in different terminals:  

```sh
# new terminal, ssh to VM, then:
cd ~/mandelbrot-rmi
./startserver.sh banana
```

Repeat for _coconut_ or make up your own names.

* In the client window, start the client with the names of your running servers.

```sh
./startclient.sh apple banana coconut # or your names
```

> **Food for brain:**
>
> Observe the performance in the terminals when adding extra servers.

* Before moving to the next exercise, *remember to Shutdown your VM*.

### <a name="4.-Scale-up-to-a-multicore-VM"></a> 4. Scale-up to a multicore VM

The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your Virtual Machines (VMs) the form that you need them to have. In this section, you will run the same Mandelbrot example on a *four-core* VM, using the exact same image, the *Cursus Image*. To scale-up your VM to use multiple cores you need to:

> 
* Edit your Template.
* Re-instantiate a VM from the modified Template.

#### Edit the Template

You can customise your VMs by editing the templates you instantiate the VMs from.

* In order to edit your existing template, choose the `Cursus Template` item and then *Update* buttons on the top right.
* In the *General* tab edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* When you are done, click on the green *Update* button so that your changes are actually saved. 

That was it. From now on you will get a 4-core VM running using the same *Cursus Image* (where the mandelbrot example is saved).

#### Run the example on the four-core VM

* Instantiate a VM from the updated template.
* Login to the VM. *Is your mandelbrot data there?*

> **NOTE:**
>Your VM's image was (and is) persistent.

* Run the [same example](#install-and-run-mandelbrot) with a single Mandelbrot server.
* Start a new terminal and connect to the VM. Type the following command:

```sh
ps -eo pid,psr,pcpu,args | sed -n -e '1p' -e '/java/p'
```

This shows the running Java processes and the CPU number on which it runs (column `PSR`).

* Stop Mandelbrot server(s) and client.
* Launch multiple servers on different CPUs. To do this:
  * Start new terminals as needed and run variations on the following command:

```sh
cd $HOME/mandelbrot-rmi
taskset -c 2 ./startserver.sh mango # replace '2' with the CPU number and 'mango' with your server name
```

* Start the client on a separate processor:

```sh
taskset -c 0 ./startclient.sh pineapple grape mango # use your server names. duh.
```

> **Food for brain:**
>
> Observe the performance. *Is there any gain?*


### <a name="5.-Wrap-up"></a> 5. Wrap up

* Play around, make your checks and don't forget to [shut down](UvAworkshop-2016-01-25-partA#first-shut-down) all the running VMs when you are finished.

>Remember: Your running VMs are consuming quota whether they are doing something useful or are idle.


* [Hands-on Extras](#hands-on) <br>
  * [Working with Storage](#Working-with-storage) <br>

The current HPC Cloud offers two storage types: `Ceph` and `SSD`. Data stored on Ceph is replicated, to protect against data loss in case of hardware failure. The best practice is to run your operating system on a small `SSD image` and store your bulk data on `Ceph datablock`(s). 

### <a name="Working-with-storage"></a> Working with Storage

When you create a disk image, you must choose where it is stored, under the heading `Datastore`. You have the choice between `local_images_ssd` and `ceph`.  The first appliance you imported, created the OS image on `local_images_ssd`. In this section you will use the `ceph` *Datastore* option, by following these steps: 

>
* Create a new empty datadisk
* Add the new datadisk to the template
* Mount the datadisk in the VM

At this point you should not have any running VMs. Let's create a new disk.

#### Create a new empty datadisk

* From the [UI](https://ui.hpccloud.surfsara.nl) menu at the left pane, select the *Images* page under *Virtual Resources*.
* Click on the green [+] button on the top. 
* In the *Create image* window, fill in the form as:  
  * Name: **my data**. You will use this name later in your `Template`.
  * Type: **DATABLOCK**.
  * Datastore: **106: ceph**.
  * Check the **Persistent** checkbox.
  * On the _Image location:_ group, choose radio button _Empty datablock_.
  * Give it a _Size_ in MB: **2000** (is 2GB).
  * Keep _FS Type_: raw. 
* Click the green button *Create* on the form, to submit it. 

>**NOTE:**
>
>A new image will show on the `Images` list, and it will keep in status LOCKED while it is being created. When it is created it will come to status READY. Then you *still* have to format and mount the disk.

#### Add the new datadisk to the template

In order to let you VM know about the new datablock, you need to add it to your VM's `template`:

* Open your *Template* (or create a new).
* Select the *Storage* tab from the menu bar.
* Click on the _+ Add another disk_ button (that will make a new _Disk 1_), and then choose the **my data** `image` you created as a second `image`.
* Finish with the *Update* button on the top to submit it.

#### Mount the datadisk in the VM

Let's start using the new disk.

* Create a new `VM` from the `Template` you created in the previous step. 
* Once the `VM` is in RUNNING state, login and check if your new datablock is there:

```sh
sudo fdisk -l 
``` 

* You need to format the drive now. To format it with the XFS file system install `xfsprogs`: 

```sh
sudo apt-get install xfsprogs
```

* Mount the datadisk in the VM:

```sh
sudo mkdir /data  
sudo mkfs -t xfs /dev/vdb  
sudo mount /dev/vdb /data  
```

* Arrange the permissions to allow non-root access to the /data directory:

```sh
sudo chown ubuntu:ubuntu -R /data
```

>**Food for brain:**
>
> Create new files or folders in your in `/data` directory. Logout and login again. *Are your changes still there?*
> Shutdown the VM and start it again. *Do you see the files on the datablock?* 
> Hint: when you start the VM the datadisk is not automatically mounted.

* From now on, you can transfer files from your laptop on the newly created disk. 

>**Food for brain:**
>
> Try to copy a file from your laptop to `/data`, e.g. with `scp myfile ubuntu@145.100.59.197:/data`. Then login to the VM and inspect the changes.

>**Note:**
>
> Shut down all the VMs when you are done



### Next: Extras
You have completed the Tutorial [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB). If you want more of the HPC Cloud, see [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras).
