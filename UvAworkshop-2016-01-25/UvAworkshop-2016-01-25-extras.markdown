---
layout: default
---

# SURFcursus - Extras

This is part one of the Tutorial [SURFcursus - 15 Oct 2015](surfcursus-2015-Oct-15).
**You should have completed (and understood)** [SURFcursus - part A](surfcursus-part-A-2015-Oct-15) and [SURFcursus - part B](surfcursus-part-B-2015-Oct-15),  before trying these extras.

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
