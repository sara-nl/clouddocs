# HPC Cloud documentation

> **NOTE:**
>
> This _wiki_ collects SURFsara's upcoming **new HPC Cloud** documentation. That new service is currently in **_beta_** status, and this documentation is heavily under construction. You can expect frequent changes in these pages.

## Basics
- [Introduction to HPC Cloud](introduction-to-hpc-cloud)  
- [Estimate your resources] (estimate-your-resources)  
- [User Interface](user-interface)  
- [General start](general-start)  
- [Access your Virtual Machine](access-your-VM)

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
* Dynamic Virtual Machine Management  
* Sharing OpenNebula Objects  
* [Install Windows](windows)  
* Licences  

### Disk Images
* Scratch Disk Images  
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


## Migrating from the old HPC Cloud to the new HPC Cloud

* [Replacing the VirDir](replacing-virdir)


## Service implementation
* [Available resources](resources-available)
