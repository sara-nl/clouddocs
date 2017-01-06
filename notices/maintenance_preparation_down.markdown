---
layout: default
---

# HPC Cloud maintenance downtime

## Introduction

During a maintenance downtime we will work on the hardware that powers the HPC Cloud.
VMs cannot run during that time.

### What do you need to do?

Make sure that all your VMs are properly shut down: your list of VMs should be empty before the downtime starts.
See below: [Instructions to prepare for the downtime](#instructions-to-prepare-for-the-downtime).

If you feel you really need to keep some VM instances, you should be aware of the risk of data loss.

### Will my data be safe?
 
If your VM list is empty, the data on your disk images is just as safe as during normal operation.
See our [backup policy](https://userinfo.surfsara.nl/systems/hpc-cloud/backup-policy).

If you bring a VM to `stopped` or `poweroff` state, its disks will have an increased risk of data loss. This risk is small, but not negligible.

If you leave a VM runnng, it will experience a sudden loss of power and its disks will probably be corrupred.

### Links

- [Maintenance calendar HPC Cloud](/maintenance)
- [System status](https://userinfo.surfsara.nl/systems/status)

### Questions?  

If you have questions or need assistance, please contact our helpdesk: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

## Instructions to prepare for the downtime

The safe way to prepare for the move is to shut down your VMs in time.
"Shut down" means using the button from the Cloud's user interface and check that the VM is gone.
As part of the shut down procedure, the persistent disks of the VM will be copied back to our Ceph cluster.

### Non-persistent disks

If your VM changed valuable data on non-persistent disks,
you should copy that to another location before shutting down: 
changes to data on non-persistent disks is lost when the VM shuts down.
  
For more information on (non-) persistency, see [Image Persistence](http://doc.hpccloud.surfsara.nl/image_persistence).

How can you check your disks for persistency?


- log in to the Cloud user interface
- go to the list of VMs
- click on the row for a running VM
- you now see the VM's details
- Select the "storage" tab. 
- you should see a display similar to this (look at the "Persistent" column.)

![vm disk tab](../images/vm-storage.png)
 

### Shut down procedure

_Important: do not shut down using a command or button inside your VM._
This will leave your VM alive in "power down" mode.

- log in to the Cloud user interface
- go to the list of VMs
- click on the row for a running VM
- you now see the VM's details: check that "State" is "ACTIVE" and "LCM State" is "RUNNING"
- open the drop-down menu of the trashcan (upper right)
- click on "Shutdown" 

![vm shutdown button](../images/vm-shutdown.png)

Check that the VM proceeds with shutdown: use the refresh button (upper left ![chasing arrows](../images/reload-symbol.png)).
The VM should take no more than a few minutes to shut itself down, after which the Cloud will copy your disks back to the disk storage.

If, after a few minutes, the VM is running again ("State" is "ACTIVE" and "LCM State" is "RUNNING"), 
then your VM did not react correctly on the BIOS signal to shut down. See [VM not reacting to Shutdown](http://doc.hpccloud.surfsara.nl/vm-not-reacting-to-shutdown) for a solution. 

Repeat this for the other running VMs.
VMs that are suspended, stopped or otherwise alive but not running (or shutting down) need to be made running and then shut down as described above.
