---
layout: default
---

# HPC Cloud maintenance downtime

## Introduction

During a maintenance downtime we will work on the hardware that powers the HPC Cloud.
VMs cannot run during that time.

### What do you need to do?

Make sure that none of your VMs is running.

> **Your list of `instances` &rarr; `VMs` can only contain VMs in `UNDEPLOYED`state.**


See below: [Instructions to prepare for the downtime](#instructions-to-prepare-for-the-downtime).

### Will my data be safe?
 
If your VM is not running the data on your disk images is just as safe as during normal operation.
See our [backup policy](https://userinfo.surfsara.nl/systems/hpc-cloud/backup-policy).

> **Any VMs`RUNNING` in the `instances` &rarr; `VMs` list, will be stopped by us and this may result in data loss or data corruption.**
VMs XXXXXXX will end abruptly during the maintenance and will probably lose data. 


### Links

- [Maintenance calendar HPC Cloud](/maintenance)
- [System status](https://userinfo.surfsara.nl/systems/status)

### Questions?  

If you have questions or need assistance, please contact our helpdesk: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

## Instructions to prepare for the downtime

You need to prepare for the downtime by stopping your running VMs in time.
This can be done by the UI menu items `Terminate` or `Undeploy`.
VMs in a state other than `UNDEPLOYED` may be lost or damaged during the maintenance.

For more information on machine states and the effect on non-persistent disks, see [Virtual Machine states](../vm-states).  

### Non-persistent disks

Changes to data on non-persistent disks are lost when you `Terminate` the VM.
Otherwise, the disk is stored on the host or on external storage.

For more information on (non-) persistency, see [Image Persistence](http://doc.hpccloud.surfsara.nl/image_persistence).

How can you check your disks for persistency?

- log in to the Cloud user interface
- go to the list of VMs
- click on the row for a running VM
- you now see the VM's details
- Select the "storage" tab. 
- you should see a display similar to this (look at the "Persistent" column.)

![vm disk tab](../images/vm-storage.png)
 
