# HPC Cloud documentation

> **NOTE:**
>
> This _wiki_ collects SURFsara's upcoming **new HPC Cloud** documentation. That new service is currently in **_beta_** status, and this documentation is heavily under construction. You can expect frequent changes in these pages.

## Basics
1. [Introduction to HPC Cloud](introduction-to-hpc-cloud)  
1. [Estimate your resources] (estimate-your-resources)  
1. [User Interface](user-interface)  
1. [General start](general-start)  
1. [Access your Virtual Machine](access-your-VM)

## Advanced Topics

### General

1. [Customise your Virtual Machine](customize-your-vm)
 * [General options](customize-vm-general)
 * [Storage options](customize-vm-storage)
 * [Network options](customize-vm-network)
 * [OS Booting options](customize-vm-boot)
 * [Input/Output options](customize-vm-io)
 * [Context options](customize-vm-context)
 * [Other options](customize-vm-other)
1. Virtual Machine from Scratch  
1. Contextualization  
1. Dynamic Virtual Machine Management  
1. Sharing OpenNebula Objects  
1. [Install Windows](windows)  
1. Backup  
1. Licences  

### Disk Images
1. Scratch Disk Images  
1. [Download an image](image_download)  
1. Create an Image on your own Machine  

### Networks
1. Virtual Network  
1. Lightpaths 

### Security
> **NOTE:**
>
> You are strongly advised to set up your **own firewall** inside your virtual machines. OpenNebula offers now the so-called `Security Groups` instead of the old `Network filters`. However, they do not work in the current implementation, so we are pursuing other ways to provide a form of external firewall. 


### Inside the VM
1. MySQL server  
1. [Grid Storage](grid-storage)    
1. Pilot Jobs  
1. [NFS](NFS) &ndash; Share Data between Virtual Machines

## Service implementation
1. [Available resources](resources-available)
