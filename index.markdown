---
layout: default
---
# SURFsara HPC Cloud documentation

> **NOTE:**
>
> This _wiki_ collects the documentation for the **HPC Cloud** at SURFsara. The documentation pages here are heavily under construction and you can expect frequent changes.  We welcome your comments or corrections at [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl?subject=HPC%20Cloud%20documentation%20comments) or see the bottom of this page on how to contribute directly to help us improve the documentation.

## Operational

- [Maintenance calendar HPC Cloud](maintenance)

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
* Licences
* [User management](usermanagement)

### GPU

* [Attaching a GPU to a VM](gpu-attach)
* [Deep learning use case](gpu-deep-learn)
* [Remote GPU visualization](gpu-visualization)

### Disk Images
* [Image Storage](image_storage)
* [Image Persistence](image_persistence)
* [Extra storage: datablocks](create-datablocks)
* [Scratch Disk Images](scratch_disk)
* [Download an image](image_download)
* [Create an Image on your own laptop](image-on-own-laptop)
* [Create a copy of a disk in a running VM](storage_snapshot)

### Networks
* Virtual Network
* Lightpaths

### Security
> **NOTE:**
>
> You are strongly advised to set up your **own firewall** inside your virtual machines. OpenNebula offers now the so-called `Security Groups` instead of the old `Network filters`. However, they do not work in the current implementation, so we are pursuing other ways to provide a form of external firewall.

* [Installing `fail2ban`](fail2ban)

### Inside the VM
* MySQL server
* [Grid Storage](grid-storage)
* Pilot Jobs
* [NFS](NFS) &ndash; Share Data between Virtual Machines
* [SoftDrive](softdrive)

### Automation
* [Getting started with the XML-RPC API](xmlrpc-start)

### AppMarket
* [AppMarket Appliances Configuration](appliances-configuration)

### Troubleshooting

* [VM not reacting to Shutdown](vm-not-reacting-to-shutdown)

## Tutorials
* [HPC Cloud workshop 2016-06-15](UvA-course-20160615/index) (part of the [UvA HPC and Big Data course](http://hpc.uva.nl))
* [SURF Research Bootcamp 2016-04-21](bootcamp-20160421/index)
* [TUDelft workshop 2016-04-13](TUDelftcourse-20160413/index)
* [HPC Cloud workshop 2016-01-25](UvAworkshop-2016-01-25/UvAworkshop-2016-01-25) (part of the UvA HPC and Big Data course)
* [UNESCO-IHE workshop - 11 Dec 2015](wshop-uihe-2015-12-11)
* [Surfcursus - 15 Oct 2015](surfcursus-2015-Oct-15)

## Service implementation
* [Available resources](resources-available)
* [Resource usage](https://ui.hpccloud.surfsara.nl/oneinsight) [⚠ **WARNING:** under construction]

## Contributing to the documentation

If you have any comments, please let us know by sending us an e-mail at [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl?subject=HPC%20Cloud%20documentation%20comments). Alternatively, you are welcome to contribute to this documentation directly. For this, you can fork our repository on GitHub and submit a pull request to inform us of your changes.

Please find our [contribution guidelines](markdown-best-practice) before more information about forking, contributing updates, bug fixes, or other corrections.
