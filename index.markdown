---
layout: default
---
# SURFsara HPC Cloud documentation

<div style="float:right;max-width:50%;" markdown="1">
<div class="alert alert-info" markdown="1">
<i class="fa fa-info-circle fa-2x" aria-hidden="true"></i> 
This _wiki_ collects the documentation for the **HPC Cloud** at SURFsara. The documentation pages are in constant review and you can expect **frequent changes**. You are welcome to contribute to **help us improve** the documentation (see bottom of this page).
</div>

<div style="display:none;" class="alert alert-success" markdown="1">
<i class="fa fa-bookmark-o fa-2x" aria-hidden="true"></i> 
<span style="color:red;">TODAY!</span> [2017-03-30 & 31 UNESCO-IHE symposium](uihe-20170330/index)
</div>

<div style="display:none;" class="alert alert-success" markdown="1">
<i class="fa fa-cog fa-spin fa-3x fa-fw"></i>
The HPC Cloud documentation **images are not being rendered correctly**. The service team is fixing the issue.
</div>
</div>

## Operational

- [Maintenance calendar HPC Cloud](maintenance)
- [Changelog HPC cloud](changelog)

## Basics
- [Introduction to HPC Cloud](introduction-to-hpc-cloud)
- [Estimate your resources](estimate-your-resources)
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
  * [CentOS using an ISO](vm-scratch-centos)
  * [Fedora using their ready-made images](vm-scratch-fedora-cloud)
* [Virtual Machine states](vm-states)
* [Sharing OpenNebula Objects](sharing-objects)
* [Install Windows](Windows)
* [User management](usermanagement)

### GPU

* [Attaching a GPU to a VM](gpu-attach)
* [Remote GPU visualization](gpu-visualization)

### Disk Images
* [Image Storage](image_storage)
* [Image Persistence](image_persistence)
* [Extra storage: datablocks](create-datablocks)
* [Scratch Disk Images](scratch_disk)
* [Download an image](image_download)
* [Create an Image on your own laptop](image-on-own-laptop)
* [Create a copy of a disk in a running VM](storage_snapshot)
* [Resize your OS image](resize_os_image)

### Security
> **NOTE:**
>
> You are strongly advised to set up your **own firewall** inside your virtual machines. OpenNebula offers now the so-called `Security Groups` instead of the old `Network filters`. However, they do not work in the current implementation, so we are pursuing other ways to provide a form of external firewall.

* [Installing `fail2ban`](fail2ban)
* [DirtyCOW vulnerability](notices/dirtycow)

### Inside the VM
* [Grid Storage](grid-storage)
* [NFS](NFS) &ndash; Share Data between Virtual Machines
* [SoftDrive](softdrive)

### Automation
* [Getting started with the XML-RPC API](xmlrpc-start)


### Apps
* [Apps Appliances Configuration](appliances-configuration)

### Troubleshooting
* [Recovery access](vnc_recovery_access); how to get root access to your VM without a root password
* [VM not reacting to Shutdown](vm-not-reacting-to-shutdown)
* [Connection problem with resumed ubuntu 14.04 virtual machine](connection_problem_ubuntu1404) 


## Tutorials
* [UNESCO-IHE symposium 2017-03-30 & 31](uihe-20170330/index)
* [UvA HPC Cloud workshop 2017-02-01](UvA-20170201/index) (part of the [UvA HPC and Big Data course](http://hpc.uva.nl))

<!---
* [SURF Research Bootcamp 2016-11-10](bootcamp-20161110/index)
* [VU HPC Cloud workshop 2016-10-19](VU-20161019/index)
* [UvA HPC Cloud workshop 2016-06-15](UvA-course-20160615/index) (part of the [UvA HPC and Big Data course](http://hpc.uva.nl))
* [SURF Research Bootcamp 2016-04-21](bootcamp-20160421/index)
* [TUDelft workshop 2016-04-13](TUDelftcourse-20160413/index)
* [HPC Cloud workshop 2016-01-25](UvAworkshop-2016-01-25/UvAworkshop-2016-01-25) (part of the UvA HPC and Big Data course)
* [UNESCO-IHE workshop - 11 Dec 2015](wshop-uihe-2015-12-11)
* [Surfcursus - 15 Oct 2015](surfcursus-2015-Oct-15)
-->

## Service implementation
* [Available resources](resources-available)
* [Resource usage](https://ui.hpccloud.surfsara.nl/oneinsight) [⚠ **WARNING:** under construction]

## Contributing to the documentation

If you have any comments, please let us know by sending an e-mail to [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl?subject=HPC%20Cloud%20documentation%20comments). Alternatively, you are welcome to contribute to this documentation directly. You can fork our repository on GitHub and submit a pull request to inform us of your changes.

Please find our [contribution guidelines](markdown-best-practice) before more information about forking, contributing updates, bug fixes, or other corrections.
