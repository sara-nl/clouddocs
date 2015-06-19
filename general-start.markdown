# Your first virtual machine

## Introduction

This chapter teaches you how you can create a `Virtual Machine` (from now on, VM) running Linux, by importing an _appliance_ from the Marketplace. 

> **NOTE**
>
> This walk-through gives a good introduction to the concepts of the HPC Cloud, and if you are going to use a  VM running Linux for your research, this will produce a basic VM you can keep working with to install the software that you may need and where to process your data later on. Even if you are going to use a VM running Windows, this chapter still gives you a good introduction, and you are recommended to start here.
>
> More advanced and specialized topics are discussed separately.
>
> If you are not yet acquainted with terms such us `Virtual Machine` (or VM), `template` and `image`, please visit [the introduction to HPC Cloud page](introduction-to-hpc-cloud)


## Logging into the HPC Cloud User Interface

The HPC Cloud User Interface (from now on, UI) is the web site where you manage your VMs, disks and networks. After your project is approved, you will receive a username and a password for the UI.

You can reach the UI at the following URL: https://ui.hpccloud.surfsara.nl 

> **NOTE**
>
> If you would like an explanation about the options you can see on the UI, please visit [the User Interface documentation page](user-interface).

To start building a virtual machine, go to the UI and log in with the username and password you received. 

> **NOTE**
>
> ...that the username and password are **not** for the VM you are going to create. You can set users and passwords later one, once you have created the VM.

## Importing an _appliance_ from the Marketplace
We are going to work with a pre-made `image` that is available on the Marketplace. 

> **NOTE**
>
> The Marketplace is a collection of so-called _appliances_. It is publicly available on the web of OpenNebula, and anybody can contribute their _appliances_ to it. It is a handy way to import, from within the well-known UI, useful images that are ready to use.
>
> However, because of these open possibilities, it may also be the case that, when you are reading this documentation, the _appliance_ we mention here has changed or been removed. 

From the **user** `view` or the **groupadmin** `view`, choose the _Marketplace_ tab on the left menu of the screen. Then look for the **Ubuntu - KVM** _appliance_ on the list (or search for it by typing on the search box) and click on it. Read the extended information related to the _appliance_ (especially, the bit about the _contextualization_ and _configuration_ options. Then click on the _Import_ button at the top-right corner of the screen.

A dialogue will pop up asking you to give a name to the `template` and the `image`. 

## Configuring your virtual machine by editing the template


### Adding a network
 
### Setting the root key for *ssh* accesss

### Adding VNC access

### Setting the correct keyboard


## Starting your virtual machine


## Adding a data storage


## Powering off and removing your machine


