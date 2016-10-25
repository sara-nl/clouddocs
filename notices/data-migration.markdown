---
layout: default
---

# Introduction

In this page we will show you how to transfer your files from the old Cloud to Oort. The data on the old Cloud can be either stored in your OS image or Virdir. You can access your Virdir files through SFTP, scp or rsync. In this guid we use rsync. 

The steps to migrate your data to the new Cloud are the following:

1. Start your old Cloud VM
2. Create a new Cloud VM with a datablock attached 
3. Transfer files from the old to the new Cloud with rsync

## Start your old Cloud VM

1. **On the old HPC Cloud UI:** Start a VM. If you already have a running VM, skip to the next instruction. 
2. **On the old HPC Cloud UI:** If you want to transfer Virdir files, mount the virdir in the VM as described [here](https://www.cloud.sara.nl/projects/hpc-cloud-documentation/wiki/VirDir). If your Virdir is already mounted in your VM, skip to the next section. 

## Create a new Cloud VM with a datablock attached 

1. **On the new HPC Cloud UI:** [Create a new VM](general-start) from our `appliances`.
2. **On the new HPC Cloud UI:** [Create a new datablock](create-datablocks) on `Ceph` Datastore.
3. **On the new HPC Cloud UI:** Check that your datablock is in [persistent state](image_persistence).

## Transfer files from the old to the new Cloud with rsync

1. **On the new HPC Cloud UI:** Login to your VM with the datablock attached and mounted on the previous step.
2. **On the new HPC Cloud UI:** Start transferring your files or direcories to the mounted /data (or other mount point of your choice) directory. Replace [old-cloud-VM-username] with your own VM username (not the UI username), [old-cloud-VM-publicIP] with the external 145.100.XX.XX IP, [absolute-path-to-data] with the directory on your old cloud VM that you want to migrate:

```sh
rsync -av [old-cloud-VM-username]@[old-cloud-VM-publicIP]:[absolute-path-to-data] /data/
```
>**Note:**
> 
>Before removing any useful data from the old Cloud VM , make sure that the transfer was successful and copied on a [persistent](image_persistence) Ceph datablock.

