---
layout: default
---

# TUDelft course 2016-04-13 - part A

<div style="float:right;max-width:205px;" markdown="1">
![TUDelft logo](/images/TUDelft_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part A of the Tutorial [TUDelft course 2016-04-13](.).

This tutorial will touch the following topics:

1. [Access the user interface](#access-the-user-interface)
2. [Add your public SSH key](#add-your-public-ssh-key)
3. [My first VM](#my-first-vm)

### 1. Access the User Interface

The UI (User Interface) is the web site that allows you to manage your _Virtual Machines_ (or _VM_ s) on the HPC Cloud.

#### Log in to the UI

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/)
* Your username is **surfcursusXY**, replace `XY` with the number assigned to you.
* You will receive the password from the workshop facilitators.
* Hit the `Login` button.

#### Change your password

Once you login to the UI, it is a best practice to change the initial password.

* Locate the *buddy* icon <i class="fa fa-user"></i> with your user name at the top-right corner of the screen.
* Click it, select *<i class="fa fa-cog"></i> Settings* and then use the _Update password_ button.
* On the new screen, fill in a new password (twice) and click the *Change* button to submit it.

#### Logout

Let's check whether it worked.

* Click your *buddy* icon  <i class="fa fa-user"></i>.
* Choose *<i class="fa fa-power-off"></i> Sign Out*.

From now on you can use your new password to log in to the [UI](https://ui.hpccloud.surfsara.nl/). Do so now.

### 2. Add your public SSH key

To complete the setup of your HPC Cloud account, you need to **add an SSH public key to your profile**. This is a one-time task.

* First, read about SSH and public keys on the [private/public keys](/SSHkey) page.<br />
If you are already familiar with SSH public keys, you can skip reading this page.
* You need a private/public key pair in your `~/.ssh/` directory. Create one now if needed.
* Check with the command `ls ~/.ssh`: you should see files `id_rsa` and `id_rsa.pub`.

Next, you will copy the public SSH key (`id_rsa.pub`) to the UI, but you will keep the matching private key (`id_rsa`) safe in your laptop.

* Copy the content of your **public** SSH key to the clipboard (for example, by doing `cat ~/.ssh/id_rsa.pub`, then selecting and copying all of that text).
* Go to the [UI](https://ui.hpccloud.surfsara.nl/) and select *<i class="fa fa-cog"></i> Settings* from the *buddy* icon  <i class="fa fa-user"></i>.
* Locate the section _Public SSH Key_ (if needed, click the *<i class="fa fa-info-circle"></i> Info* icon) and click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>.
* Paste the content of your public SSH key file into the text box.
* There is no _Save_ button; click outside the text box to complete your action (e.g.: on the words "Public SSH Key").
* Check the contents of box against your public key and verify they match: it should start with `ssh-rsa AAAAB`...

### 3. My first VM

Using the HPC Cloud revolves around making Virtual Machines (VM). We provide the HPC Cloud **AppMarket** to facilitate creating simple VMs. The AppMarket contains common ready-made `appliances` for you to pick and use. In this section you will use the AppMarket to build your first VM with the following steps:

* Importing a pre-made `image`, with a Linux operating system installed.
* Reviewing the shape of the VM (so-called `template`) to match what you want.
* Instantiating the `template` to run your first VM.
* Accessing your VM and shutting it down.

Let's run your first VM on the HPC Cloud.

#### Import an appliance from the AppMarket

* Log in to the [UI](https://ui.hpccloud.surfsara.nl/).
* Choose the *<i class="fa fa-truck"></i> AppMarket* tab on the left menu of the screen and then *Appliances*.
* Select the `appliance` **Ubuntu 14.04 Desktop CI** by clicking on the tick-box next to it.
* Click on the _Import_ button at the top-right corner of the screen.
* A dialogue will pop up, asking you for a few details. Edit as follows:
  * Select the Datastore for the images: **125: local_images_surfcursus**. (drop-down menu)
  * Image Name: **Course Image**.
  * Template Name: **Course Template**.
* Finally, click the blue *Import* button. This will start importing the `appliance` from the AppMarket. You can close this dialogue.

> **Food for brain:**
>
> * When you click on an `appliance` (anywhere on the row except for the tick-box), then you can see detailed information about that `appliance`. Can you see this detailed information about the `appliance` we are using in this exercise?
> * When you import an `appliance`, this will create one `image` and one `template`, as explained during the introductory presentation. In the UI you have an _Images_ tab and another _Templates_ tab under the _<i class="fa fa-cloud"></i> Virtual Resources_ entry on the left menu. You should see your new `image` and `template` there.
  * Can you see them?
  * What is the STATUS of the `image` just after it you import it?
  * Refresh with the symbol of the two arrows chasing each other, <i class="fa fa-refresh"></i>, next to the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button until it is READY.

#### Review the Template  

When you imported the `appliance` from the AppMarket, it created an `image` and a `template` for you. In the `template` you can define how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc. Following the instructions of the extended information of the `appliance` that you imported, we will have to adapt the `template` before we can use it to create VMs out of it.

Edit the imported `template` with these steps:

* Go to the _Templates_ tab under _<i class="fa fa-cloud"></i> Virtual Resources_ on the left menu.
* Find the `template` you just imported (*Course Template*), and click on it (anywhere **except** the tick-box).
* Click on the _Update_ button on the top-right of the screen to start editing the template.
* Browse through the different tabs there (i.e. _General_, _Storage_, _Network_...) and leave the default values. Check for example if your VM will have internet access: 
  * Select the _<i class="fa fa-globe"></i> Network_ tab which shows the network interfaces (or `nics`) for your VM. 
  * The feedback below tells that the internet interface `NIC 0` on the left pane is mapped to `internet`.   
![youselectednetwork](/images/youselectednetwork.png)
* If you made any changes, click the green button _Update_ at the top, to save your changes.

#### Start the VM

A `template` is just a description of the virtual machine that we want to build. Let's create the actual virtual machine from it.

* Go to the _Virtual Machines_ section on the left menu. This displays an overview of all the existing VMs that you have the right to see. This list is (probably) empty at the moment.
* Click on the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button to bring up a screen to create a VM.
* Select the *Course Template* (click once on it). Since this is your first `template`, there is only one item in the list. You can see the feedback below:  
![select_template](/images/select_template2.png)
* Give your virtual machine a name: **My First VM**. This name is also used as the VM's host name.
* Number of instances: **1**.
* Click on the green _Create_ button at the top of the screen.
* Refresh the VM status by clicking on the symbol of the two arrows chasing each other, <i class="fa fa-refresh"></i>, next to the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button.

#### What happened?

Congratulations! You have just created a fresh, clean virtual machine!

Let's summarise what you have seen so far. From the menu on the left side, click on each of the tabs to inspect the information. A vertical blue bar to the left of one (and only one) tab tells you which one you are currently seeing.

* _<i class="fa fa-tachometer"></i> Dashboard_: shows an overview of the project status, like the amount of running machines or usage statistics.
* _<i class="fa fa-cloud"></i> Virtual Resources_:  
  * _Images_: this is the equivalent of a hard drive. Your OS is stored on this `image`.  
  * _Templates_:  the `template` gives your VM the shape you want. A `template` is just a recipe; not the machine itself.   
  * _Virtual Machines_: here you can manage your VMs (i.e.: create, start, shutdown). Click anywhere on a running VM's row (except the tick-box, that is). Inspect the information tables that appear, which show extended details.

> **NOTE:**  
>Your VM will appear in the list of virtual machines. At first, it will have the state PENDING. That indicates that the HPC Cloud is looking for a place where your virtual machine can actually run. Finding the right place depends on the amount of cores, memory, and disk that you asked in the `template`. Keep refreshing the list by clicking on the symbol of the two arrows chasing each other, <i class="fa fa-refresh"></i>, next to green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button. When the required capacity becomes available, your VM will show the status **RUNNING**. Only then can you actually use your VM.

#### Log in to the VM

You can interact with your VM in several ways: command-line (e.g.: SSH), VNC (UI in your browser) or a remote desktop. We will use SSH in a terminal for the time being.

The way to log in to your virtual machine is the SSH key pair that you [stored in your profile](#add-your-public-ssh-key) earlier.

**Commandline access - SSH**  

* First find the your VM's IP address. Your VM's IP address is shown on in the _IPs_ column from the virtual machines list on the UI.

* On your laptop, start a terminal (in Mac/Linux) or GitBash (in Windows).

* In your terminal, type the following command to connect to your VM:

>**NOTE:**
>
>Replace 145.100.5X.YZT with your IP address!

```sh
ssh ubuntu@145.100.5X.YZT
```

#### First login

If everything went well, the first time you try to log in, your terminal will ask you to add the VM's IP to the list of known hosts. Type *Yes*, in that case.

You should now see a similar line in your terminal: `ubuntu@ip-145-100-5X-YZT:~$`

This means that you are logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system:

```sh
ubuntu@ip-...:~$ ls /
ubuntu@ip-...:~$ cd /home/ubuntu/
```

* Create a file:

```sh
ubuntu@ip-...:~$ echo "Some text ..." > myfile
ubuntu@ip-...:~$ cat myfile
```

* Logout by typing `logout` or `ctrl-D` in your terminal (do **not** issue any shutdown command):

```sh
ubuntu@ip-...:~$ logout
```

> **Food for brain:**
>
> Log in to your VM again. *Is your file still there?*


#### First shutdown

Let's shut your first VM down. Anytime you expect your VM to be doing nothing useful, you should shut it down to stop consuming the resources that your VM is holding.

* In the cloud UI, tick the box to the left on the row with your VM.
* At the upper right corner of the screen, under the red dust bin drop-down button <i class="fa fa-trash-o" style="background-color:#f04124;border-color:#cf2a0e;color:#fff;padding:1px 1ex 1px 1ex;"></i>, click _Shutdown_.
* Refresh (by clicking on the two arrows chasing each other, _<i class="fa fa-refresh"></i>_, next to the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button) until your VM is gone from the list. It will be removed from the display, but you can start it again whenever you need it.

> **Food for brain:**
>
> When the VM has been shut down and disappeared from the list, check and refresh the _Images_ and _Templates_ tabs. *Are your `image` and `template` still there?*

> **Note:**
>
> Your running VMs book resources exclusively (and hence, consuming quota from your group even though we haven't explicitly made you aware of it in the course material) whether they are doing something useful or are idle. Because the HPC Cloud is offered on a fair-share basis and other users may actually be needing resources that you may be holding, before you move to the next part of this workshop, please **remember to shut all your VMs down**.

### BONUS _food for brain_

This section is meant as extra questions that we thought would be nice for you to investigate, and we invite you to do/think about them even after the workshop is finished.

**Bonus:** The HPC Cloud has hundreds of users. Many of them have common questions. In order to address these we have put together a web site with some documentation for users. We call it the HPC Cloud Documentation. Do you know the URL of this web site? Make sure you find out!!!


### Next: part B
Now that you completed part A of the Tutorial [TUDelft course 2016-04-13](.). Please continue with Tutorial [Part B](partB).

>**NOTE:**
>
>Before you move to the next sections, remember to shut your VMs down.
