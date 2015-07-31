# HPC Cloud documentation

> **NOTE:**
>
> This _wiki_ collects the documentation for the **new HPC Cloud** at SURFsara. The documentation pages here are heavily under construction and you can expect frequent changes.  We welcome your comments or corrections at helpdesk@surfsara.nl to help us improve the documentation.  


## Migrating from the old HPC Cloud
* [Replacing the VirDir](replacing-virdir)
* [Migration guide - Run your old HPC Cloud images on the the new HPC Cloud](vm-migration-guide)

## Basics
- [Introduction to HPC Cloud](introduction-to-hpc-cloud)  
- [Estimate your resources] (estimate-your-resources)  
- [User Interface](user-interface)  
- [General start](general-start)  
- [Access your Virtual Machine](access-your-VM)
- [Cloud Resource Usage](https://ui.hpccloud.surfsara.nl/oneinsight)

## Advanced Topics

### General

* [Customise your Virtual Machine](customize-your-vm)
 * [General options](customize-vm-general)
 * [Storage options](customize-vm-storage)
 * [Network options](customize-vm-network)
 * [OS Booting options](customize-vm-boot)
 * [Input/Output options](customize-vm-io)
 * [Context options](customize-vm-context)
 * [Other options](customize-vm-other)
* [Contextualization](contextualization)
* A Virtual Machine from Scratch
* [Virtual Machine states](vm-states)  
* [Sharing OpenNebula Objects](sharing-objects)  
* Install Windows  
* Licences  

### Disk Images
* [Image Storage](image_storage)
* [Image Persistence](image_persistence)
* [Scratch Disk Images](scratch_disk)
* [Download an image](image_download)  
* Create an Image on your own Machine

### Networks
* Virtual Network  
* Lightpaths 

### Security
> **NOTE:**
>
> You are strongly advised to set up your **own firewall** inside your virtual machines. OpenNebula offers now the so-called `Security Groups` instead of the old `Network filters`. However, they do not work in the current implementation, so we are pursuing other ways to provide a form of external firewall. 


### Inside the VM
* MySQL server  
* [Grid Storage](grid-storage)    
* Pilot Jobs  
* [NFS](NFS) &ndash; Share Data between Virtual Machines

## Tutorials
* [Surfcursus - 5 Aug 2015](surfcursus-5-Aug-2015)

## Service implementation
* [Available resources](resources-available)
