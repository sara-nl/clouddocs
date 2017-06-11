---
layout: default
---

# SURF Research Boot Camp 2017-06-15
## Part A

<div style="float:right;max-width:205px;" markdown="1">
![TUEindhoven logo](/images/TUEindhoven_logo.png)

<div style="max-width:150px;" markdown="1">
![SURFsara logo](/images/SURFsara_logo.png)
</div>
</div>

This is part A of the HPC Cloud session of [SURF Research Boot Camp](.). Here are the topics to be covered:

1. [Access the user interface](#access-the-user-interface)
2. [Add your public SSH key](#add-your-public-ssh-key)
3. [My first VM](#my-first-vm)

### <a name="access-the-user-interface"></a> 1. Access the User Interface

The User Interface (UI) is the web site that allows you to manage your _Virtual Machines_ (VMs) on the HPC Cloud.

#### Log in to the UI

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/)
* Your username is **s-campXY**, replace `XY` with the number assigned to you.
* You will receive the password from the workshop facilitators.
* Hit the `Login` button.

Once you login, feel free to explore the menus and tabs offered by the OpenNebula UI. These will offer most of the functionatilities a user needs to manage and operate VM's.

#### Change your password

It is a good practice to change the initial password provided, to ensure the work environment is yours.

* Locate the *buddy* icon <i class="fa fa-user"></i> with your user name at the top-right corner of the screen.
* Click it and select *<i class="fa fa-cog"></i> Settings* 
* Click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i> to the right on the *Password* field
* On the new screen, fill in a new password (twice) and click the *Change* button.

#### Logout

Let's check whether changing the password worked.

* Click your *buddy* icon  <i class="fa fa-user"></i>.
* Choose *<i class="fa fa-power-off"></i> Sign Out*.

From now on, you can use your new password to log in to the [UI](https://ui.hpccloud.surfsara.nl/). Please login again.

### <a name="add-your-public-ssh-key"></a> 2. Add your public SSH key

To complete the setup of your HPC Cloud account, you need to **add a Secure Shell (SSH) public key to your profile**. This is a one-time task. 

* An SSH public/private key pair must be created in your local computer. In the previous session "Introduction to UNIX" of this Compute Track, you created such a key pair. If you are not familiar with the process of creating the key pair, you can read about it in the [public/private keys](/SSHkey) documenatation page.
* The public/private key pair is usually stored in your `~/.ssh/` directory. Check with the command `ls ~/.ssh`; you should see the files `id_rsa` and `id_rsa.pub`.

Next, you need to copy the public SSH key (`id_rsa.pub`) to the UI. The matching private key (`id_rsa`) remains safe in your laptop.

* Copy the content of your **public** SSH key to the clipboard (for example, by doing `cat ~/.ssh/id_rsa.pub`, then selecting and copying all the text).
* Go to the [UI](https://ui.hpccloud.surfsara.nl/) and select *<i class="fa fa-cog"></i> Settings* from the *buddy* icon  <i class="fa fa-user"></i>.
* Locate the section _Public SSH Key_ and click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>.
* Paste the content of your public SSH key file into the text box.
* There is no _Save_ button; click outside the text box to complete your action.
* Briefly check the contents of the text box against your public key and verify they match: it should start with `ssh-rsa AAAAB`...

### <a name="my-first-vm"></a>3. My first VM

Working with the HPC Cloud service mostly revolves around building and destroying VMs. This section will teach how to build a VM running Linux with the following steps:

* Import a SURFsara pre-made `image` with a Linux operating system installed.
* Review the VM attributes defined in the `template`.
* Instantiate the `template` to run your first VM.
* Access your VM and gracefully shut it down.

#### Import an appliance from the AppMarket

SURFsara HPC Cloud provides ready-made `appliances` to their users. These appliances are available in the 'Apps' option of the Storage menu in the HPC Cloud UI. This is meant to help users instantiating secure VM’s quickly.

Let's create your first VM to run on the HPC Cloud 'Oort'!

* (if needed) Log in to the [UI](https://ui.hpccloud.surfsara.nl/).
* Choose the Storage tab on the left menu of the screen and then _Apps_ option <i class="fa fa-cloud-download" aria-hidden="true"></i>.
* Select the `appliance` **Ubuntu 14.04 Desktop CI** by clicking on the tick-box next to it.
* Click on the OpenNebula button at the top of the screen. 
* A dialogue box will pop up asking you for a few details. Edit as follows:
  * Name: **Course Image**.
  * VM Template Name: **Course Template**.
  * Select the Datastore to store the resource: **147: Courses_img**.
* Finally, click the blue *Download* button. This step will import the appliance from the AppMarket to your work environment.

> **Food for brain:**
>
> * When you click on an `appliance` (anywhere on the row except for the tick-box), you can see detailed information about the `appliance`. Can you see the information about the `appliance` we are using in this exercise?
> * When you import an `appliance`, an `image` and a `template` are created as explained during the introductory presentation. You can verify that the process is complete by inspecting the Images section <i class="fa fa-download" aria-hidden="true"></i> in the Storage tab, and the VMs section <i class="fa fa-file-o" aria-hidden="true"></i> in the Templates tab. You should see your new image and template there.
>  * Can you see them?  
>   * What is the Status of the `image` just after you import it?   
>   * Refresh the images list <i class="fa fa-refresh"></i> until the Status is READY.

#### Review the Template

A `template` file consists of a set of attributes that define a Virtual Machine. For example, you can define how many cores you want your VM to have, how much RAM memory, what storage drives to attach, which network connections, etc. To get a general overview of the attributes that define a VM, proceed as follows:

* Go to the VMs section <i class="fa fa-file-o" aria-hidden="true"></i> under the _Templates_ tab on the left menu.
* Find the `template` created previously and check the tick-box.
* Click on the _Update_ button on the top of the screen to start editing the template.
* Browse through the different tabs there (i.e. _General_, _Storage_, _Network_...) to get a general overview of the attributes that define a VM. Leave all default values unchanged.
* No changes were made, you can click on the VMs section <i class="fa fa-file-o" aria-hidden="true"></i> to leave the `template` inspection mode. For your reference, if any changes would need to be made to the `template` file (e.g. increasing the amount of CPUs), you would click on the green button _Update_ instead.

#### Start the VM

When an appliance is imported from the _Apps_ <i class="fa fa-cloud-download" aria-hidden="true"></i>, the disk image is normally non-persistent (`persistency=no`). In simple words, image persistency is a property that controlls whether changes to the image are kept (`persistency = yes`) or not (`persistency = no`) when you shutdown the VM. Follow the next steps to make your `image` persistent:

-->

* Go to the _Images_ tab under _<i class="fa fa-cloud"></i> Virtual Resources_ on the left menu, and click anywhere except the tick-box on the row for the `image` you created before, which you called **Course Image** .
* On the _<i class="fa fa-info-circle"></i> Info_ tab, under the _Information_ section, find the _Persistent_ attribute. It says _No_, at the moment.
* Switch the value to _Yes_, by clicking on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i> and selecting _yes_ from the drop-down list.
* Finally click anywhere else so that the change is set.

A `template` is just a description of the virtual machine that we want to build. Let's create the actual virtual machine from it.

* Go to the _Virtual Machines_ section on the left menu. This displays an overview of all the existing VMs that you have the right to see. This list is (probably) empty at the moment.
* Click on the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button to bring up a screen to create a VM.
* Select the *Course Template* (click once on it). Since this is your first `template`, there is only one item in the list. You can see the feedback below:  
![select_template](/images/select_template2.png)
* Give your virtual machine a name: **My First VM**. This name is also used as the VM's host name.
* Number of instances: **1**.
* Click on the _Create_ button at the top of the screen.
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

The way to log in to your virtual machine is the SSH key pair that you [stored in your profile](#add-your-ssh-key) earlier.

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

### <a name="Bonus"></a> Bonus food for brain

This section is meant as extra questions that we thought would be nice for you to investigate, and we invite you to do/think about them even after the workshop is finished.

**Bonus:** The HPC Cloud has hundreds of users. Many of them have common questions. In order to address these we have put together a web site with some documentation for users. We call it the HPC Cloud Documentation. Do you know the URL of this web site? Make sure you find out!!!


### Next: Calculate _&pi;_
You have completed part A of the Tutorial [SURF Research Boot Camp 2017-06-15](.). Please continue with part [Calculate _&pi;_](extraPI).

>**NOTE:**
>
>Before you move to the next sections, remember to shut your VMs down.
