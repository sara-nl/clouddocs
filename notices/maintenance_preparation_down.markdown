---
layout: default
---

# HPC Cloud maintenance downtime

## Introduction

During a maintenance downtime we will work on the hardware that powers the HPC Cloud.
VMs cannot run during that time.

### What do you need to do?

Make sure that all your VMs are properly terminated.

> **Your list of `instances` &rarr; `VMs` must be empty before maintenance starts.**

See below: [Instructions to prepare for the downtime](#instructions-to-prepare-for-the-downtime).

### Will my data be safe?
 
If your VM list is empty the data on your disk images is just as safe as during normal operation.
See our [backup policy](https://userinfo.surfsara.nl/systems/hpc-cloud/backup-policy).

> **Any VMs remaining in the `instances` &rarr; `VMs` list, will be removed by us and this will probably result in data loss or data corruption.**

### Links

- [Maintenance calendar HPC Cloud](/maintenance)
- [System status](https://userinfo.surfsara.nl/systems/status)

### Questions?  

If you have questions or need assistance, please contact our helpdesk: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

## Instructions to prepare for the downtime

You need to prepare for the downtime by `terminate`-ing your VMs in time.
If not, your VM will probably be lost or damaged during the maintenance.

### Non-persistent disks

Changes to data on non-persistent disks are lost when the VM terminates.

> Make sure you copy valuable data on non-persistent disks to another location before you terminate the VM.

For more information on (non-) persistency, see [Image Persistence](http://doc.hpccloud.surfsara.nl/image_persistence).

How can you check your disks for persistency?

- log in to the Cloud user interface
- go to the list of VMs
- click on the row for a running VM
- you now see the VM's details
- Select the "storage" tab. 
- you should see a display similar to this (look at the "Persistent" column.)

![vm disk tab](../images/vm-storage.png)
 

### Terminate procedure

`Terminate` will end your VM and write the persistent disks back to storage.
Changes to non-persistent disks are lost, so you need to download anything you want to keep before terminating.

_Important: do not 'shut down' using a command or button inside your VM._
This will leave your VM alive in "power down" mode.

- log in to the Cloud user interface
- go to the list of VMs
- click on the row of a running VM
- you now see the VM's details: check that "State" is "ACTIVE" and "LCM State" is "RUNNING"
- open the drop-down menu of the trashcan (upper right)
- click on `Terminate`
- terminate is complete when the VM is no longer in the list

![vm terminate button](../images/vm-terminate.png)

Check that the VM proceeds with the termination: use the refresh button (upper left ![chasing arrows](../images/reload-symbol.png)).
Inside the VM, the OS should take no more than a few minutes to perform a proper shutdown, after which the Cloud will copy your disks back to the disk storage.

If you see, after a few minutes, that the VM is running again ("State" is "ACTIVE" and "LCM State" is "RUNNING"), 
then your VM did not react correctly on the BIOS signal to shut down. See [VM not reacting to the Terminate button
](../troubleshooting/vm-not-reacting-to-shutdown) for a solution. 

Repeat this for the other running VMs.
VMs that are suspended, stopped or otherwise alive but not running (or shutting down) need to be made running and then shut down as described above.
