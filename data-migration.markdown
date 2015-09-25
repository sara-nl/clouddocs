---
layout: default
---

# Introduction

In this page we will show you how to transfer your files from the old Cloud to Oort. The data on the old Cloud can be either stored in your image or Virdir. You can access your Virdir files through SFTP, scp or rsync.  In this guid we use rsync. 

The steps we will follow are the following:

1. Start your old Cloud VM
2. Attach a datablock to a VM on the new Cloud
3. Transfer files with rsync

## Start your old Cloud VM

1. *On the old HPC Cloud:* Start a VM. If you already have a running VM, skip to the next instruction. 
2. *On the old HPC Cloud:* If you want to transfer Virdir files, mount the virdir in the VM as described [here](https://www.cloud.sara.nl/projects/hpc-cloud-documentation/wiki/VirDir). If your Virdir is already mounted in your VM, skip to the next instruction. 

## Attach a datablock to a VM on the new Cloud

1. *On the new HPC Cloud:* Create a new `VM`.
2. *On the new HPC Cloud:* Create a datablock as described [here](create-datablocks)
3. *On the new HPC Cloud:* Check that your datablock is in [persistent state](image_persistence)

## Transfer your files with rsync

1. *On the new HPC Cloud:* Login to your VM with the datablock attached and mounted on the previous step.
2. *On the new HPC Cloud:* Start transferring your files or direcories to the mounted /data directory:
```sh
rsync -av [old-cloud-username]@[old-cloud-VM-publicIP]:[absolute-path-to-data] /data/
```
