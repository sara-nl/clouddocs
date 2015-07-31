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

SURFsara has been operating an HPC Cloud as `IaaS` (Infrastructure as a Service) for several years. Since recently we have launched a new HPC Cloud with a powerful new user interface and a complete new cluster with faster compute nodes and high-performant big storage volumes. The user interface and cloud software relies on [OpenNebula 4](http://opennebula.org/) and our new cluster is called [Ooort](https://en.wikipedia.org/wiki/Oort_cloud).

This particular course aims to introduce SURF employees to the HPC Cloud by providing a set of lectures and hands-on examples to run on the real **`Oort`** infrastructure. Here is a summary of the course outline:

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

The rest of this page is dedicated to the section **Hands-on HPC Cloud**. 

## <a name="preparation"></a>Prepare your laptop 
What you need for this tutorial:
* A computer with full Internet access.
* A browser (Chrome or Firefox will do nicely).
* A **demo account**. Pick the account that corresponds to your team's rank from [here](https://docs.google.com/spreadsheets/d/1zUVq5VrZLHhoFs3YCwDGGeDGLXDYBhF7dRFPCDDIppg/edit?usp=sharing).
* An SSH client.
  * Linux and Mac users have an SSH client on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * Windows users should install 
    * [PuTTY](http://www.putty.org/) (screen based) or [OpenSSH](http://sshwindows.sourceforge.net/) for Windows (command-line only). 
    * [PutTTY-gen](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) (screen based).

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
* Click on Settings, you will see the option to update your password. 
* Click on the `Update password` button.
* On the new screen, type your new password twice and click the button to submit it.

#### Logout

* Click the *buddy* icon that represents your user `cloudcursus-sXX` at the top-right corner of the screen on the UI. 
* Choose the option Sign Out.

From now on you can use your new password to login again to your Cloud account.

#### Menu and UI features

Click on each of the tabs below to inspect what is available on the UI:

* Login to the [UI](https://ui.hpccloud.sara.nl/) with your demo account.
* Dashboard: gives an overview of the project status, like running machines or usage statistics. 
* Virtual Resources
 * Virtual Machines: manage your machines (i.e.: create, start, shutdown, e.t.c.) and see all the actual running machines.
 * Templates: this gives your computer the shape you want. A template is just a recipe, not the machine itself. You define there, for example, how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc.
 * Images: this is the equivalent of a hard drive. Your OS and user data can be stored on this image.
* Infrastructure
 * Datastores: shows the available storage options and your quotas compared to full capacity.
 * Virtual Networks: shows the available networks you can use for your project's VMs.
* AppMarket 
 * Appliances: these are ready-made images that you can import into your project and instantiate VMs. We have pre-made appliances for CentOS and Ubuntu.

#### Add ssh keys to your profile

Before launching your [first VM](#2.-My-first-VM), there is a last step to prepare in your user profile: adding an SSH key to your profile. But what does this mean and why needed?

The [SSH key](https://en.wikipedia.org/wiki/Secure_Shell#Key_management) mechanism allows you to access a remote machine securely without typing in passwords. The ready-made images in *AppMarket* do not provide a password for the root user. This means that the only way to login in as root on your virtual machine is using the ssh keys.

Follow the steps below to add an ssh key to your profile: 

* First [Generate an SSH key](https://doc.hpccloud.surfsara.nl/oortdoc/docs/wikis/SSHkey). If you already have one stored in your laptop, you may skip this step.
* 

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