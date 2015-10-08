---
layout: default
---

⚠ **WARNING** under construction

# SURFcursus - part A

This is part one of the Tutorial [SURFcursus - 15 Oct 2015](surfcursus-2015-Oct-15).

* [Hands-on part A](#hands-on) <br>
  * [1. Access the user interface](#1.-Access-the-user-interface) <br>
  * [2. My first VM](#2.-My-first-VM) <br>

### <a name="1.-Access-the-user-interface"></a> 1. Access the User Interface

#### Login to the UI

* Pick the **`demo account`** account that corresponds to your team from [here](https://drive.google.com/open?id=1zUVq5VrZLHhoFs3YCwDGGeDGLXDYBhF7dRFPCDDIppg). 
  * The password will be provided by the workshop organizers.  
  * The accounts will remain active until `23rd of October`.

The UI (short for User Interface) is the web site that allows you to manage your virtual machines in the HPC Cloud.  

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/)
* Log in with the username and password assigned to your team (demo account).

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

* First we will generate an `SSH key` pair. 
  * Check if you already have an SSH key pair stored in your laptop. Start a terminal (in Mac/Linux) or GitBash (in Windows) and type:

```sh
ls -l ~/.ssh/
```

  * If you see the files `id_rsa.pub` and `id_rsa`, continue to the next step. If not, then generate a new SSH key pair by typing the following command (you may leave empty all the fields that show):
  
```sh
ssh-keygen -t rsa -b 4096
```

This will generate two files: a public and a private key. The private key will stay safe in your laptop, the public key will be copied to the [UI](https://ui.hpccloud.surfsara.nl/).  

If you have problems in any of the steps above, have a look in the detailed guide to [Generate an SSH key](SSHkey).
  
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
  * Select the `Network` tab which shows the network interfaces (or nics) for your VM. Click once on **Name: internet** row. You will see the feedback below:  
![youselectednetwork](images/youselectednetwork.png)
  * Select the `OS Booting` tab and then *Features*. Set: **ACPI to "Yes"** and **Localtime to "No"**.
* Click *Update* on top to save your changes.

#### Start the VM

A template is a description of a virtual machine. The template we have been editing in this guide is now ready to create a virtual machine from it.

* Go to the *Virtual Machines* section. This displays an overview of all running VMs. This list is empty for now.
* Click on the *green plus sign*.
* Give your virtual machine a name: **My-First-VM** (no spaces).  
This name is also used as the host name of your machine. 
* Number of instances: **1**.
* Select the template we just edited. Since this is your first template, there is only one item in the list. Select the *Cursus Template*. You will see the feedback below:  
![select_template](images/select_template.png)
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
The way to login in as *root* on your virtual machine is using the ssh keys that you [stored in your profile](#add-ssh-keys-to-your-profile) previously.

**Command-line access - SSH**  

* First find the IP address of your virtual machine.  
Your VM IP address is shown on in the `IPs` column from the virtual machines list, under the Virtual Resources tab of the UI.

#### Login from a UNIX system

If you use a Linux or a Mac OSX operating system, open a terminal window, and type  
**on your laptop**:  
```sh
ssh -X -i ~/.ssh/id_rsa root@145.100.59.102 # replace id_rsa and IP address!
```

The `-X` flag connects your X11 display to the VM so that the VM can open a window on your laptop.

#### Login from Windows

If you use a Windows operating system, open PuTTY, and fill in (see [here](access-your-VM#from-a-windows-client) for detailed instructions):
* Host Name: root@145.100.59.102 *-- replace IP address!* 
* SSH key: *-- browse to the location where you saved the private key.*
* Enable X11 display so that the VM can open a window on your laptop: Unfold Connection -> SSH -> X11 -> tick the box **Enable x11 forwarding**.

#### First login

If everything went well, the first time you login you will be asked to add the VM to the list of known hosts: type "Yes".

You should now see this line in your terminal: `root@surfsara-Desktop:~#`

This means that you are logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system. 
* Create a file (see: [touch command](https://en.wikipedia.org/wiki/Touch_(Unix)#Examples))
* Logout by typing `exit` or `ctrl-D` in your terminal. (see: [exit command](https://en.wikipedia.org/wiki/Exit_(command)), do not use shutdown command):

```sh
exit
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

