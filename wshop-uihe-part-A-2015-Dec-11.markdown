---
layout: default
---

⚠ **WARNING** under construction


# UNESCO-IHE workshop - part A

This is part A of the Tutorial [UNESCO-IHE workshop - 11 Dec 2015](wshop-uihe-2015-12-11).

* [Hands-on part A](#hands-on) <br>
  * [1. Access the user interface](#1.-Access-the-user-interface) <br>
  * [2. My first VM](#2.-My-first-VM) <br>
  * [3. Persistence](#3.-Persistence) <br>

### <a name="1.-Access-the-user-interface"></a> 1. Access the User Interface

The UI (short for User Interface) is the web site that allows you to manage your `Virtual Machines` (`VM`s) on the HPC Cloud. In this section you will personalise your UI account in these steps: 

> 
1. Logging in and changing your UI password.  
1. Adding an "SSH key" to your profile. This will enable secure access in your VMs.    

Let's start.


#### Login to the UI

* Pick the **`demo account`** account that corresponds to your team from [here](https://docs.google.com/spreadsheets/d/1zUVq5VrZLHhoFs3YCwDGGeDGLXDYBhF7dRFPCDDIppg/edit?usp=sharing). 
  * You will receive the password by the workshop organizers.  
  * Your account will remain active until `21st of December`.

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/)
* Log in with your `demo` username and password.

> **NOTE:** 
> 
> Your project for this tutorial is called `wshop-uihe`.

#### Change your password

Let's change now the initial password:

* Click the *buddy* icon that represents your account `wshop-sXX` (top-right corner of the screen). 
* Click on *Settings*, then `Update password` button.
* On the new screen, type your new password twice and click the *Change* button to submit it.

#### Logout

* Click your *buddy* icon. 
* Choose *Sign Out*.

From now on you can use your new password to login to the UI.
Do so now.

#### Add ssh keys to your profile

Before launching your [first VM](#2.-My-first-VM), there is a last thing to arrange in your [UI](https://ui.hpccloud.surfsara.nl/) account: **add an SSH key to your profile**.  
*But what does this mean and why is it needed?*

As an HPC Cloud user you have full control of your virtual machines (IaaS). This means that you are administrator in your own VMs, in other words `root` user. 

In general, root users can access a machine with a password. However, passwords are not secure because they are easy to forget or be cracked. The [SSH keys](https://en.wikipedia.org/wiki/Secure_Shell#Key_management) authentication is a method to allow you access a remote machine securely, without passwords. 

Follow the steps below to add an ssh key to your profile: 

* First generate an `SSH key` pair of files: 
  * Start a terminal (in Mac/Linux) or GitBash (in Windows). 
  * Check if you already have an SSH key pair stored in your laptop. Type:

```sh
ls -l $HOME/.ssh/
```

  * If you see the files `id_rsa.pub` and `id_rsa`, skip the next command. If not, type the following command to generate a new SSH key pair:
  
```sh
# just press enter in every question that shows
ssh-keygen -t rsa -b 4096
```

> **NOTE:**
>
> This command will generate two files: a public key (`id_rsa.pub`) and a private key (`id_rsa`). You should see now the files in your $HOME/.ssh/ directory.  

If you have problems creating the SSH keys, get help from the detailed guide [Generate an SSH key](SSHkey).

Next, you will copy the public key (`id_rsa.pub`) to the [UI](https://ui.hpccloud.surfsara.nl/), but you will keep the matching private key (`id_rsa`) safe in your laptop: 

* Open your **public** ssh key file (id_rsa.pub) and copy the content to clipboard, e.g. `cat  $HOME/.ssh/id_rsa.pub`
* Go to your user profile and select *Settings* from the *buddy* icon. In the dialogue that pops up, go to the *Info* page.
* Locate the section `Public SSH Key`, and click on the blue edit icon. Paste the content of your **public** ssh key (id_rsa.pub) file.
* Close the window. There is no *Save* button, but your public key is automatically stored in your profile.  

> **NOTE:** 
> 
> Adding an SSH key to you profile is a one-time task. It is possible to use multiple keys for different VMs but there is no need to repeat this procedure for the rest of the tutorial. 


### <a name="2.-My-first-VM"></a> 2. My first VM

To start a virtual machine easily, we provide the HPC Cloud `AppMarket`. This repository contains common appliances for you to pick and use. In this section you will use the AppMarket to build your first VM with the following steps:

>
* Importing a pre-made disk, called `Image`, which includes a Linux operating system.
* Creating the description of your VM, called `Template`, which gives your VM the shape you want. 
* Instantiating the *Template* to run your first `Virtual Machine`.
* Accessing your `Virtual Machine` and shut it down.

Let's run the first machine on the HPC Cloud.

#### Import a pre-made image from the AppMarket

* Login to the [UI](https://ui.hpccloud.surfsara.nl/).
* Choose the *AppMarket* tab on the left menu of the screen and then *Appliances*.
* Choose the image: **Ubuntu 14.04 Desktop**. Click on the tick-box next to it.
* Click on the `Import` button at the top-right corner of the screen. 
* A dialogue will pop up, asking you for a few details. Edit as follows:
  * Select the Datastore for the images: **104: local images ssd**. 
  * Image Name: **Course Image**.
  * Template Name: **Course Template**.
* Finally, click the *Import* button. This will start importing the appliance from the AppMarket. You can close this window.

> **Food for brain:**
>
> You can verify that the process is complete by inspecting the `Images` tab under the `Virtual Resources` on left menu. You should see your new image there. *What is the STATUS of the image?* Refresh with the sign next to the *green plus button* until it is READY.

#### Edit the Template  

When you imported the appliance from the AppMarket, it created an `Image` and a `Template` for you. In the *Template* you can define how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc.

Edit the created *Template* with these steps:

* Go to the Templates tab under the `Virtual Resources` on the left menu.
* Find the template you just created, and click on it. Next we will modify it.
* Click on *Update* on the top-right of the screen to start editing the template. 
* Browse through the different options (i.e. General, Storage, Network). Leave the default values, **except** for the following:  
  * Select the `Network` tab which shows the network interfaces (or nics) for your VM. Select the row **Name: internet** (click once on it). You will see the feedback below:  
![youselectednetwork](images/youselectednetwork.png)
* Click the green button *Update* on top to save your changes.

#### Start the VM

A template is just a description of a virtual machine that we want to build. Let's create the actual virtual machine from it.

* Go to the *Virtual Machines* section. This displays an overview of all *running* VMs. This list is empty for now.
* Click on the *green plus sign*.
* Give your virtual machine a name: **My First VM**.  
This name is also used as the host name of your machine. 
* Number of instances: **1**.
* Select the *Course Template* (click once on it). Since this is your first template, there is only one item in the list. You will see the feedback below:  
![select_template](images/select_template.png)
* Click on the `Create` button at the bottom of the screen.
* Refresh the VM status by clicking on the two arrows chasing each other next to "+" button.

> **NOTE:**  
>Your VM will appear in the list of virtual machines. At first, it will have the state PENDING. The cloud system is looking for a place where your virtual machine can actually run. This depends on the amount of cores, or memory, or disk that you asked in the template. Refresh with the sign next to the *green plus button*. When the required capacity becomes available, your VM will appear in Status: **RUNNING**. 


#### What happened?

You have just created a fresh, clean machine!

Let's summarise what you have seen so far. From the menu on the left side, click on each of the tabs to inspect the information. A vertical blue bar to the left of the tab tells which one is selected.

* *Dashboard*: shows an overview of the project status, like running machines or usage statistics. 
* *Virtual Resources:*  
  * `Images`: this is the equivalent of a hard drive. Your OS is stored on this image.  
  * `Templates`:  the template gives your computer the shape you want. A template is just a recipe, not the machine itself.   
  * `Virtual Machines`: here you can manage your machines (i.e.: create, start, shutdown). Click anywhere on the running VM row. Inspect the Information tables that appear.

#### Login to the VM

You can interact with your VM with several ways: Command-line (SSH), VNC (UI browser window) or a remote desktop server. We will use SSH in a terminal.

The way to login into your virtual machine is the ssh keys that you [stored in your profile](#add-ssh-keys-to-your-profile) previously.

**Command-line access - SSH**  

* First find the IP address of your virtual machine.  
Your VM IP address is shown on in the `IPs` column from the virtual machines list on the UI.

* Start a terminal (in Mac/Linux) or GitBash (in Windows).

* To connect to your VM, type:

```sh
ssh ubuntu@145.100.59.197 # replace with your IP address!
```

#### First login

If everything went well, the first time you login you will be asked to add the VM to the list of known hosts: type *Yes*.

You should now see a similar line in your terminal: `ubuntu@ip-145-100-59-102:~$` 

This means that you are logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system: 

```sh
ubuntu@ip-145-100-59-102:~$ ls /
ubuntu@ip-145-100-59-102:~$ cd /home/ubuntu/
```

* Create a file:

```sh
ubuntu@ip-145-100-59-102:~$ echo "Some text ..." > myfile
ubuntu@ip-145-100-59-102:~$ cat myfile
```

* Logout by typing `logout` or `ctrl-D` in your terminal ( do not use shutdown command):

```sh
ubuntu@ip-145-100-59-102:~$ logout
```

> **Food for brain:**
>
> Login to your VM again. *Is your file still there?* 

 
#### First shut-down

Let's shutdown your first VM. Anytime the VM is idle, you should shut it down to stop consuming unused resources.

* Tick the box to the left on the row with your VM.
* At the upper right corner of the screen, under the dust bin drop-down button, click `Shutdown`. 
* Refresh (by clicking on the two arrows chasing each other next to + button) until your VM is gone from the list. It will be removed from the display, but you can start it any time.

> **Food for brain:**
>
> Check and refresh the *Images* and *Templates* tabs. *Is your image and your template still there?*

### <a name="3.-Persistence"></a> 3. Persistence

Disk images can be `persistent` or not and you can switch that flag. 

* What does `persistent` mean?
  *  changes by the VM are copied back to the original disk image
  *  if a VM runs with a persistent disk, you cannot launch a second VM using that disk

* What does `non-persistent` mean?
  * changes by a VM are lost at shutdown and not copied back to the original disk image
  * it possible to run multiple VMs using the same non-persistent disk

> **Food for brain:**
>
> Was the first image that you imported `persistent` or not?

In this section you will work with persistent images. You will go through these steps: 

> 
* Making your image persistent.
* Deploying a VM using the persistent image.

#### Make your image persistent
* Go to *Images* tab under Virtual Resources and click on the **Course Image**.
* Under the Information section, find the *Persistent* entry. It says "no".
* Switch the value to "yes".

#### Start a persistent VM
* Start your virtual machine again. 
* Login and check the files you created during the previous run ([first VM](#2.-My-first-VM)). 

> During the previous run the VM's disk was *non-persistent*.

> **Note:**
>
> Your running VMs are consuming quota whether they are doing something useful or are idle. So before you move to the next part, **remember to shutdown the VMs**. 

### Next: part B
Now that you completed the Tutorial [UNESCO-IHE - Part A (morning)](wshop-uihe-part-A-2015-Dec-11), please continue with Tutorial [UNESCO-IHE - Part B (afternoon)](wshop-uihe-part-B-2015-Dec-11).
