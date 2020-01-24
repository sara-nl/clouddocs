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
 <div style="float:right;max-width:80px;margin-top:-10px;" markdown="1">
  <div style="max-width:80px;margin-left:10px;" markdown="1">
![UvA logo]({{relative}}images/UvA-logo.png)
  </div>
  <div style="max-width:80px;margin-left:10px; margin-bottom:10px;" markdown="1">
![SURFsara logo]({{relative}}images/SURFsara_logo.png)
  </div>
 </div>
 <i class="fa fa-bookmark-o fa-2x" aria-hidden="true"></i>
 <br/>
 <span style="color:red;">TODAY!</span>  <br/>[An introduction to SURF HPC Cloud](UvA-20200123)
 <br/>
</div>

<div style="display:none;" class="alert alert-success" markdown="1">
<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
The HPC Cloud service is in [maintenance](maintenance).
</div>

</div>

## Operational

- [Maintenance calendar HPC Cloud](maintenance)
- [Changelog HPC cloud](changelog)
- [Security policy](security_policy)

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
* [Virtual Machine states](vm-states)
* [Sharing OpenNebula Objects](sharing-objects)
* [Install Windows](Windows)
* [User management](usermanagement)
* [Remote Desktop via XRDP](xrdp)

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

* [Microarchitectural Data Sampling (MDS)](notices/mds)
* [L1 Terminal Fault (L1TF), a.k.a. Foreshadow](notices/L1TF)
* [Installing `fail2ban`](fail2ban)

### Inside the VM
* [Grid Storage](grid-storage)
* [NFS](NFS) &ndash; Share Data between Virtual Machines
* [SoftDrive](softdrive)

### Automation
* [Getting started with the XML-RPC API](xmlrpc-start)


### Apps
* [Apps Appliances Configuration](appliances-configuration)

### Troubleshooting

* [VM "pending" because of VNC port problem](troubleshooting/vnc-problem) 
* [Recovery access](troubleshooting/vnc_recovery_access); how to get root access to your VM without a root password
* [VM not reacting to Shutdown](troubleshooting/vm-not-reacting-to-shutdown)
* [Connection problem with resumed ubuntu 14.04 virtual machine](troubleshooting/connection_problem_ubuntu1404)


## <a name="tutorials"></a> Tutorials
* [HPC Cloud tutorials](tutorials/)
* [An introduction to SURF HPC Cloud, 2019-11-19](knmi-20191119)
* [HPC Cloud workshop at _Good practices for High Performance Computing and Cloud_, 2019-05-23](home-20190523)
* [UvA HPC course, HPC Cloud session, 2019-01-30](UvA-20190130/index)



<!---
* [VU HPC course, 2018-11-16](VU-20181116)
* [SURF Research Bootcamp, HU, 2018-11-02](bootcamp-20181102/index)
* [UvA HPC course, HPC Cloud session, 2018-06-13](UvA-20180613/index)
* [SURF Research Bootcamp, HvA/UvA, 2018-04-10](bootcamp-20180410/index)
* [IHE Delft symposium, 2018-02-21](uihe-20180221/index)
* [UvA HPC course, HPC Cloud session, 2018-01-31](UvA-20180131/index)
* [VU HPC course, HPC Cloud session, 2017-11-13](VU-20171113/index)
* [UvA HPC course, HPC Cloud session, 2017-07-03](UvA-20170703/index)
* [SURF Research Bootcamp at TU Eindhoven, 2017-06-15](bootcamp-20170615/index)
* [UNESCO-IHE symposium, 2017-03-30 & 31](uihe-20170330/index)
* [UvA HPC course, HPC Cloud session, 2017-02-01](UvA-20170201/index)
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
