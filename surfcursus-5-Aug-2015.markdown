---
layout: default
---
> :warning: **WARNING** under construction

# SURFcursus - 5 Aug 2015

* [General Information](#general) <br>
* [Prepare your laptop](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Access the user interface](#1.-Access-the-user-interface) <br>
  * [My first VM](#2.-My-first-VM) <br>
  * [Scale-up to a multicore VM](#3.-Scale-up-to-a-multicore-VM) <br>
  * [Scale-out to multiple VMs](#4.-Scale-out-to-multiple-VMs) <br>
* [Presentations](#presentations) <br>

## <a name="general"></a>General Information 

SURFsara has been operating an HPC Cloud service for several years. Since recently we have launched a new HPC Cloud with a powerful new user interface and a complete new cluster with faster compute nodes and high-performant big storage volumes. The user interface is supported by **`OpenNebula 4`** and our new cluster is called **`Ooort`**.

This particular course aims to introduce SURF employees to the HPC Cloud by providing a set of lectures and hands-on examples to run on the real `Oort` infrastructure.

**Date**: 5 August 2015  
**Location**: SURFsara  
**Program**:  
>
09:45 Welcome & coffee  
10:00 Presentation in Cloud Computing  
10:40 Presentation in HPC Cloud  
11:30 HPC Cloud Demo  
12:00 Lunch  
12:45 **Hands-on HPC Cloud**   
15:00 Wrap-up & questions  
15:30 End  

## <a name="preparation"></a>Prepare your laptop 
What you need for this tutorial:
* A computer with full Internet access.
* A browser (Chrome or Firefox will do nicely).
* A demo account. Choose any of the available accounts from [here](https://docs.google.com/spreadsheets/d/1zUVq5VrZLHhoFs3YCwDGGeDGLXDYBhF7dRFPCDDIppg/edit?usp=sharing) and `reserve it by assigning your name` next to it.
* An SSH client.
  * Linux and Mac users have an SSH client on board, try "ssh" in a terminal.
  * Windows users should install [PuTTY](http://www.putty.org/) (screen based) or [OpenSSH](http://sshwindows.sourceforge.net/) for Windows (command-line only). See also: http://openssh.com/windows.html

## <a name="hands-on"></a> Hands-on

### <a name="1.-Access-the-user-interface"></a> 1. Access the user interface

#### Login to the UI

The UI (short for User Interface) is the web site that allows you to interact with the HPC Cloud.  
* Open the UI page in your browser: https://ui.hpccloud.sara.nl/
* Log in with your personal demo username and password. If you don't have an account yet, go back to [Prepare your laptop](#preparation) section.

> **NOTE:** 
> 
> Your project for this tutorial is called `cloudcursus`.

#### Change your password

Let's change now the initial password:

* Click the *buddy* icon that represents your user `cloudcursus-sXX` at the top-right corner of the screen on the UI. 
* Click on Settings, you will see the option to change or update your password. 
* Click on the Change Password button.
* On the new screen, type your new password twice and click the button to submit it.

#### Logout

* Click the *buddy* icon that represents your user `cloudcursus-sXX` at the top-right corner of the screen on the UI. 
* Choose the option Sign Out.

From now on you can use your new password to login again to your Cloud account.

#### Menu and UI features

* Login to the [UI](https://ui.hpccloud.sara.nl/) with your demo account.
* Dashboard
* Virtual Resources
 * Virtual Machines: 
 * Templates: give your computer the shape you want
 * Images:


#### Add ssh keys to your profile


### <a name="2.-My-first-VM"></a> 2. My first VM
#### Import pre-made image from the AppMarket
#### Edit the Template  
Edit persistence, nics, acpi
#### Start the VM
#### Login to the VM
**Command-line access**  
**Window-based access**  
#### Install & Run [the example](surfcursus-5-Aug-2015/Distributed-Mandelbrot)
#### First shut-down

### <a name="3.-Scale-up-to-a-multicore-VM"></a> 3. Scale-up to a multicore VM
#### Add cores in Template
#### Run the example

### <a name="4.-Scale-out-to-multiple-VMs"></a> 4. Scale-out to multiple VMs
#### Start 2 VMs from a single image
#### Run the example

## <a name="presentations"></a> Presentations
* Introduction to Cloud Computing `<slides>`
* Introduction to SURFsara HPC Cloud `<slides>`