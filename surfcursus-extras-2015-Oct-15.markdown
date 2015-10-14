---
layout: default
---

⚠ **WARNING** under construction

# SURFcursus - Extras

This is part one of the Tutorial [SURFcursus - 15 Oct 2015](surfcursus-2015-Oct-15).
**You should have completed (and understood)** [SURFcursus - part A](surfcursus-part-A-2015-Oct-15) and [SURFcursus - part B](surfcursus-part-B-2015-Oct-15),  before trying these extras.

* [Hands-on Extras](#hands-on) <br>
  * [6. Install a virtual Desktop](#6.-Install-a-virtual-Desktop) <br>
  * [7. Add a datablock](#6.-Add-a-datablock) <br>


### <a name="6.-Install-a-virtual-Desktop"></a> 6. Install a virtual Desktop


### <a name="7.-Add-a-datablock"></a> 7. Add a datablock

When you create a disk image, you must choose where it is stored, under the heading `Datastore`. You have the choice between `local_images_ssd` and `ceph`. The best practise to run your operating system on a small `SSD image` and store your bulk data on `Ceph datablock`(s). 

The first appliance you imported, created the OS image on `local_images_ssd`. In this section you will use the othe *Datastore* option, namely `ceph`, by following these steps: 

>
* Create a new empty datadisk
* Add the new datadisk to the template
* Mount the datadisk in the VM

At this point you should not have any running VMs. Let's create a new disk.

#### Create a new empty datadisk

* From the  [UI](https://ui.hpccloud.surfsara.nl) menu at the left pane, select the *Images* page under *Virtual Resources*.
* Click on the green [+] button on the top. 
* In the *Create image* window, fill in the form as:
 * Name: **my data**. You will use this name later in your `Template`.
	* Type: **DATABLOCK**.
 * Datastore: **106: ceph**.
 * Check the **Persistent** checkbox.
 * On the _Image location:_ group, choose radio button _Empty datablock_.
 * Give it a _Size_ in MB: **2000** (2GB).
 * Keep _FS Type_: raw. 
* Click the green button *Create* on the form, to submit it. 

>**NOTE:**
>
>A new image will show on the `Images` list, and it will keep in status LOCKED while it is being created. When it is created it will come to status READY. Then you *still* have to format and mount the disk.

#### Add the new datadisk to the template

In order to let you VM know about the new datablock, you need to add it to your VM's `template`:

* Open your *Template* (or create a new).
* Select the *Storage* tab from the menu bar.
* Click on the _+ Add another disk_ button (that will make a new _Disk 1_), and then choose the **output data** `image` you created as a second `image`.
* Finish with the *Update* button on the top to submit it.

#### Mount the datadisk in the VM

Let's start using the new disk.

* Create a new `VM` from the `Template` you created in the previous step. 
* Once the `VM` is in RUNNING state, login and check if your new datablock is there.

```sh
sudo su
fdisk -l 
``` 

* You need to format the drive now. To format it with the XFS file install `xfsprogs`: 

```sh
apt-get install xfsprogs
```

* Mount the datadisk in the VM:

```sh
mkdir /data  
mkfs -t xfs /dev/vdb  
mount /dev/vdb /data  
```

>**Food for brain:**
>
> Create a file in your in `/data` directory. Logout and login again. Is your file still there? Shutdown the VM and start it again, do you see your changes on the datablock?

* From now on, you can transfr files from e.g. your laptop on the newly created disk. 

>**Food for brain:**
>
> Try to copy a file from your laptop to `/data`, e.g with `scp myfile ubuntu@145.100.59.233:/data`. Does it work? Do you have the permissions to do so? 


>**Note:**
>
> Shut down all the VMs when you are done
