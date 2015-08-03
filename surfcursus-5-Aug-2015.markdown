> :warning: **WARNING** under construction

# SURFcursus - 5 Aug 2015

* [General Information](#general) <br>
* [Prepare your laptop](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [1. Access the user interface](#1.-Access-the-user-interface) <br>
  * [2. My first VM](#2.-My-first-VM) <br>
  * [3. Persistence](#3.-Persistence) <br>
  * [4. Scale-up to a multicore VM](#4.-Scale-up-to-a-multicore-VM) <br>
  * [5. Wrap up](#5.-Wrap-up) <br> 
* [Presentations](#presentations) <br>

## <a name="general"></a>General Information 

SURFsara has been operating the HPC Cloud as `IaaS` (Infrastructure as a Service) for several years. Since recently we have launched a new HPC Cloud with a powerful new user interface and a complete new cluster with faster compute nodes and high-performant big storage volumes. The user interface and cloud software relies on [OpenNebula 4](http://opennebula.org/) and our new cluster is called [Oort](https://en.wikipedia.org/wiki/Oort_cloud).

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
* A **demo account**. Pick the account that corresponds to your team from [here](https://docs.google.com/spreadsheets/d/1zUVq5VrZLHhoFs3YCwDGGeDGLXDYBhF7dRFPCDDIppg/edit?usp=sharing).
* Java, at least version 8 (a.k.a. 1.7)
* An SSH client.
  * Linux and Mac users don't need to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * Windows users need to install both: 
     * [PuTTY](http://www.putty.org/) (screen based) or [OpenSSH for Windows](http://sshwindows.sourceforge.net/) (command-line only). 
     * [PuTTY-gen](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) (screen based).

## <a name="hands-on"></a> Hands-on

### <a name="1.-Access-the-user-interface"></a> 1. Access the User Interface

#### Login to the UI

The UI (short for User Interface) is the web site that allows you to manage your virtual machines in the HPC Cloud.  
* Open the UI page in your browser: https://ui.hpccloud.surfsara.nl/
* Log in with the username and password assigned to your team. If you don't have a demo account yet, go back to [Prepare your laptop](#preparation) section.

> **NOTE:** 
> 
> Your project for this tutorial is called `cloudcursus`.

#### Change your password

Let's change now the initial password:

* Click the *buddy* icon that represents your account `cloudcursus-sXX` at the top-right corner of the screen on the UI. 
* Click on Settings, you will see the option to update your password. 
* Click on the `Update password` button.
* On the new screen, type your new password twice and click the button Change to submit it.

#### Logout

* Click your account's *buddy* icon at the top-right corner of the screen on the UI. 
* Choose the option Sign Out.

From now on you can use your new password to login to your Cloud account.
Do so now.

#### Add ssh keys to your profile

Before launching your [first VM](#2.-My-first-VM), there is a last step to take in the [UI](https://ui.hpccloud.surfsara.nl/): **add an SSH key to your profile**.  
*But what does this mean and why is it needed?*

As said, the HPC Cloud users have full control of their virtual machines (IaaS). This means that you are administrator in your own VMs, in other words **root** user. 

In general, *root* users can access a machine with a password. However, passwords are not secure because they are easy to forget or be cracked. The [SSH key](https://en.wikipedia.org/wiki/Secure_Shell#Key_management) or *public key authentication* is a mechanism to allow you access a remote machine more securely using a private key stored somewhere in your laptop as a file. 

Follow the steps below to add an ssh key to your profile: 

* First [Generate an SSH key](https://doc.hpccloud.surfsara.nl/oortdoc/docs/wikis/SSHkey). This will generate two files: a public and a private key. The private key will stay safe in your laptop, the public key will be copied to the [UI](https://ui.hpccloud.surfsara.nl/).    
If you already have an SSH key stored in your laptop, you may skip this step.
* Copy the contents of your **public** ssh key on your laptop (file ends in `.pub`).
* Go to your user profile by selecting the *buddy* icon on the top-right of the screen and select Settings. A dialogue pops up. In the dialogue, go to the Info page.
* Locate the section `Public SSH Key`, and click on the blue edit icon. Paste the **public** key contents.
* Close the window. Your public key is automatically stored in your profile.

> **NOTE:** 
> 
> Adding the SSH key to you profile is one time task. It is possible to use multiple keys for different VMs but there is no need to repeat this procedure for the rest of the tutorial. 


### <a name="2.-My-first-VM"></a> 2. My first VM

To make starting a virtual machine easier, we provide the `AppMarket`, which has appliances on available for you to pick and use. We will use the *AppMarket* to build a VM with the following steps:
>
* Import a pre-made disk or `Image` with a Linux Operating system.
* Edit the VM description or `Template` to give your VM the shape you want. 
* Instantiate the *Template* to run your first `Virtual Machine`.

#### Import pre-made image from the AppMarket

* Login to the [UI](https://ui.hpccloud.surfsara.nl/).
* Choose the *AppMarket* tab on the left menu of the screen and then *Appliances*.
* Choose the OS system: **Ubuntu 15.04 Desktop - KVM** and click on the tick-box left to it. 
* Click on the `Import` button at the top-right corner of the screen. 
* A dialogue will pop up, asking you for a few details. Edit as follows:
  * Datastore for images: **104: local images ssd**. 
  * Image Name: **Cursus Image**.
  * Template Name: **Cursus Template**.
* Finally, click the *Import* button. This will start importing the appliance from the AppMarket. You can close this window.

> **NOTE:**
You can verify that the process is complete by inspecting the *Images* tab under the `Virtual Resources` at the menu of the UI. You should see your new image there.

#### Edit the Template  

When you imported the appliance from the AppMarket, it also made a template available for you to make a virtual machine. In the *Template* you can define how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc.

Edit the created *Template* by following these steps:

* Go to the Templates tab under the `Virtual Resources` at the menu of the UI.
* Find the template you just created, and click on it. You now see an overview of the template settings.
* Click on Update on the top-right of the screen to start editing the template. 
* Browse through the different options (i.e. General, Storage, Network). Leave the default values, **except** for the following:  
  * Select the `Network` tab which shows the network interfaces (or nics) for your VM. Click once on **Name: internet** row. You will see the feedback below: ![youselectednetwork](https://doc.hpccloud.surfsara.nl/oortdoc/docs/uploads/6ee7badd9825a4f49f842e4aba02a061/youselectednetwork.png)
  * Select the `OS Booting` tab and then *Features*. Set: **ACPI to "Yes"** and **Localtime to "No"**.
* Click *Update* on top to save your changes.

#### Start the VM

A template is a description of a virtual machine. The template we have been editing in this guide is now ready to create a virtual machine from it.

* Go to the *Virtual Machines* section. This displays an overview of all running VMs. This list is empty for now.
* Click on the *green plus sign*.
* Give your virtual machine a name: **My-First-VM** (no spaces).  
This name is also used as the host name of your machine. 
* Number of instances: **1**.
* Select the template we just edited. Since this is your first template, there is only one item in the list. Select the *Cursus Template*.
* Click on the `Create` button at the bottom of the screen.
* Refresh the VM status by clicking on the two arrows chasing each other next to "+" button.

> **NOTE:**  
>Your VM will appear in the list of virtual machines. At first, it will have the state PENDING. That state means that the cloud system is looking for a place where your virtual machine can actually run.  
>  
>You can refresh with the sign next to the *green plus button*. When the required capacity becomes available, your VM will appear in Status: **RUNNING**. 


#### What happened?

You have just created a fresh, clean machine!

Let's summarise what you have seen so far. From the menu on the left side, click on each of the tabs to inspect the information. A vertical blue bar to the left of the tab tells which one is selected.

* *Dashboard*: shows an overview of the project status, like running machines or usage statistics. 
* *Virtual Resources:*  
  * `Images`: this is the equivalent of a hard drive. Your OS and user data can be stored on this image.  
  * `Templates`:  the template gives your computer the shape you want. A template is just a recipe, not the machine itself.   
  * `Virtual Machines`: here you can manage your machines (i.e.: create, start, shutdown). Click anywhere on the running VM row. Inspect the Information tables that appear.

#### Login to the VM

You can interact with your VM with several ways: SSH, VNC or a remote desktop server. 
The ready-made images in *AppMarket* do not provide a password for the root user. 
The way to login in as *root* on your virtual machine is using the ssh keys that you [stored in your profile](#1.-Access-the-user-interface) previously.

**Command-line access - SSH**  

* First find the IP address of your virtual machine.  
Your VM IP address is shown on in the `IPs` column from the virtual machines list, under the Virtual Resources tab of the UI.

#### Login from a UNIX system

If you use a Linux or a Mac OSX operating system, open a terminal window, and type  
**on your laptop**:  
```sh
ssh -X -i ~/.ssh/id_rsa root@145.100.59.102 # replace id_rsa and IP address!
```

#### Login from Windows

If you use a Windows operating system, open PuTTY, and fill in (see [here](https://doc.hpccloud.surfsara.nl/oortdoc/docs/wikis/access-your-VM#From%20a%20Windows%20client) for detailed instructions):

```
Host Name: root@145.100.59.102 <-- replace IP address! 
SSH key: browse to the location where you saved the private key.
```

#### First login

If everything went well, the first time you login you will be asked to add the VM to the list of known hosts: type "Yes".

You should now see this line in your terminal:

```sh
root@surfsara-Desktop:~#
```

This means that you are logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system. 
* Create a file (see: [touch command](https://en.wikipedia.org/wiki/Touch_(Unix)#Examples))
* Logout by typing `exit` or `ctrl-D` in your terminal. (see: [exit command](https://en.wikipedia.org/wiki/Exit_(command)), do not use shutdown command):

```sh
root@surfsara-Desktop:~# exit
```

* Login again. *Is your file still there?* 
 
#### First shut-down

Let's shutdown your first VM and stop consuming quotas.

* Tick the box to the left on the row with your VM.
* At the upper right corner of the screen, under the dust bin drop-down button, unfold.
* Click `Shutdown`. 
* Refresh the Virtual Machines list (by clicking on the two arrows chasing each other next to + button) until your VM is gone. 

> **NOTE:**
>
>That was the shutdown. Once the operation is finished, your VM will be removed from the display and its resources freed. You can start a new VM from your existing template and image any time.

### <a name="3.-Persistence"></a> 3. Persistence

Disk images can be "persistent" or not and you can switch that flag.

*What does "persistent" mean?*
- changes by the VM are copied back to the original disk image
- if a VM runs with a persistent disk, you cannot launch a second VM using that disk

*What does "non-persistent" mean?*
- changes by a VM are lost at shutdown and not copied back to the original disk image
- it possible to run multiple VMs using the same non-persistent disk

> **NOTE:**
>
> The *AppMarket* image we created was set to **non-persistent** by default.

#### Make your image persistent
* Go to *Images* tab under Virtual Resources and click on your *Cursus Image*
* Under the Information section, find the "Persistent" entry. It says "no".
* Switch the value to "yes".

#### Deploy a persistent VM
* Start your machine again. 
* Login and check your changes made during the previous run. *Are your files still there?* 

> During the previous run the VM's disk was "non-persistent".

#### Install & Run Mandelbrot

The disk image is now marked as **persistent**. This means that we can install our software or store data in the VM and make sure that everything will remain in the VM once it is shutdown and re-instantiated.

Let's install and run an example to investigate the HPC Cloud capabilities. The code was taken from [mandelbrot-rmi](https://code.google.com/p/mandelbrot-rmi/), a distributed Manderbrot renderer based on [Java RMI](https://en.wikipedia.org/wiki/Java_remote_method_invocation), with some small improvements.

>**NOTE:**
>
> For the rest of the tutorial we will omit `root@surfsara-Desktop:~#` prompt in the instructions, in order to allow you copy-paste the commands directly in your terminal.

* Login to the running VM again.
* First update your system:

```sh
apt-get update
apt-get upgrade
```

* Install *java* as it is required for running the example (optionally try `java -version` to verify that is it is missing):

```sh
apt-get install default-jre
```

* Download the example: 

```sh
wget https://doc.hpccloud.surfsara.nl/oortdoc/docs/uploads/f563e4302468a336c71aa013c337c636/mandelbrot-rmi-bin.tgz
```

**Run the example**

* Create a blank directory and extract the tar:

```sh
mkdir mandelbrot-rmi
cd mandelbrot-rmi
tar xvzf ../mandelbrot-rmi-bin.tgz
```

* Launch the first server that will pose as the RMI registry with an arbitrary name argument, e.g. _apple_:

```sh
./startserver.sh apple
```

* Launch a client on an X11 capable machine and pass it the _apple_ server name:

```sh
./startclient.sh apple
``` 

* Interact with the display:

>**NOTE:**
>
> Left click will zoom in to the yellow rectangle.  
Right click will zoom out.  
Dragging will change the size of the rectangle.  

You can kill the client or servers anytime with _Ctrl+C_.

* Repeat with different number of server names for the client. Launch additional servers with different names. Start the new servers and the client, all in different terminals:  

```sh
./startserver.sh apple
./startserver.sh banana
./startserver.sh coconut
./startclient.sh apple banana coconut
```

Observe the performance when adding extra servers.

* Before moving to the next exercise, *remember to Shutdown your VM*.

### <a name="4.-Scale-up-to-a-multicore-VM"></a> 4. Scale-up to a multicore VM

In this section, we will run the same example on a four-core VM, using the exact same image, the *Cursus Image*.  

#### Edit the Template

The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your Virtual Machines (VMs) the form that you need them to have.

You can customise your VMs by editing the templates you instantiate the VMs from.

* In order to edit an existing template, under the Virtual Resources menu, choose the `Templates` item. 
* Click on the *Cursus Template* to edit. Extended information about that image will be displayed within two tabs: Info and Template.
* Above this extended information area, there are 3 buttons. One of them says Update. If you click there, you will be able to edit the template: this the *Wizard mode*.
* In the *General* tab edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* Whenever you are finished customising your template, make sure you click on the green Update button so that your changes are actually saved. 

#### Run the example on the four-core VM

* Instantiate a VM from the updated template.
* Login to the VM. *Is your mandelbrot data there?*

> **NOTE:**
>Your VM was in a persistence mode.

* Run the [same example](#3.-Persistence) with a single and then three different servers.
* Repeat tests and observe the performance. *What is the gain?*

### <a name="5.-Wrap-up"></a> 5. Wrap up

* Play around, make your checks and don't forget to shut down all the running VMs when you are finished.

>Remember: Your running VMs are consuming quota whether they are doing something useful or are idle.


## <a name="presentations"></a> Presentations
* Introduction to Cloud Computing `<slides>`
* Introduction to SURFsara HPC Cloud `<slides>`
