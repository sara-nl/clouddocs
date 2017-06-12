---
layout: default
---

# SURF Research Boot Camp 2017-06-15 <br/> Part A

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
* On the pop-up dialog displayed fill in a new password (twice) and click the *Change* button.

#### Logout

Let's check whether changing the password worked.

* Click your *buddy* icon  <i class="fa fa-user"></i>.
* Choose *<i class="fa fa-power-off"></i> Sign Out*.

From now on, you can use your new password to log in to the [UI](https://ui.hpccloud.surfsara.nl/). Please login again.

### <a name="add-your-public-ssh-key"></a> 2. Add your public SSH key

To complete the setup of your HPC Cloud account, you need to **add a Secure Shell (SSH) public key to your profile**. This is a one-time task. 

* An SSH public/private key pair must be created in your local computer. In the previous session "Introduction to UNIX" of this Compute Track, you created such a key pair. If you are not familiar with the process of creating the key pair, you can read about it in the [public/private keys](/SSHkey) documentation page.
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

Let's create your first VM to be run on the HPC Cloud Oort!

#### Import an appliance from the AppMarket

SURFsara HPC Cloud provides ready-made `appliances` to their users. These appliances are available in the `Apps` option of the Storage menu in the HPC Cloud UI. This is meant to help users instantiating secure VM’s quickly. Proceed as follows:

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

* Go to the _Storage_ tab on the UI left menu and then _Apps_ option <i class="fa fa-cloud-download" aria-hidden="true"></i>.
* Click anywhere on the row for the `image` you created before **Course Image** (with exception of the tick-box).
* On the _<i class="fa fa-info-circle"></i> Info_ tab, under the _Information_ section find the _Persistent_ attribute. It says _No_, at the moment.
* Switch the value to _Yes_ by clicking on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i> by selecting from the drop-down list.
* Finally, click anywhere else so that the change is set.

As mentioned earlier, a `template` is just a description of the virtual machine that we want to build. Let's create the actual virtual machine from it.

* Go to the _VMs_ section below _Instances_ on the left menu. 
  An overview of all existing VMs that you have the priviledges to see, are displayed.
  This list is (probably) empty at the moment, because you have not yet started any VM.
* Click the button _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ to bring up a "Create Virtual Machine" screen.
* Select the *Course Template* by clicking once at it. Since this is your first `template`, there is only one item in the list. You can see the feedback:  
![select_template](/images/select_template2.png)
* Find the input box for _VM name_ and give your virtual machine a name: **My First VM**. This name is also used as the VM's host name.
* Inspect the remaining `template` attributes, for the time being do not change them **(leave "Number of instances" at 1)**.
* Click on the green _Create_ button at the top of the screen.
* Refresh the VM status by clicking button <i class="fa fa-refresh"></i> at the top.

#### What happened?

Congratulations! You have just created a fresh, clean virtual machine!

Let's summarise what you have seen so far. Click on each of the tabs on the left side menu and inspect the information provided. The most important ones at this point in time are described here:

* _Dashboard_ <i class="fa fa-tachometer"></i>: shows an overview of the project status, like the number of running machines or usage statistics.
* _Instances_ &gt; _<i class="fa fa-th"></i> VMs_: here you can manage your VMs (i.e.: create, start, shutdown). Click anywhere on a running VM's row (except the tick-box). Inspect the information present in the different tabs providing you extended details.
* _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_: the `template` gives your VM the shape you want. A `template` is just a recipe; not the machine itself.
* _Storage_ &gt; _<i class="fa fa-download"></i> Images_: this is the equivalent of a hard drive. Your OS is stored on this `image`.
* _Storage_ &gt; _<i class="fa fa-cloud-download"></i> Apps_: a list of `appliances` endorsed by SURFsara HPC Cloud team that you can use.

> **NOTE:**  
>Your VM will appear in the list of virtual machines. At first, it will have the state `PENDING`. This indicates that the HPC Cloud is looking for a place where your virtual machine can actually run. Finding the right place depends on the amount of resources (cores, memory, and disk) you requested in the associated `template`. Keep refreshing the list by clicking button <i class="fa fa-refresh"></i>. When the required capacity becomes available, your VM will show the status `RUNNING`. Only then you actually use your VM.

#### Log in to the VM

You can interact with your VM in several ways: command-line (e.g.: SSH), VNC (UI in your browser) or a remote desktop. We will use SSH in a terminal for the time being.

The way to log in to your virtual machine is making use of the SSH key pair that you [stored in your profile](#add-your-public-ssh-key) earlier.

**Commandline access - SSH**  

* First find your VM's IP address. It is shown in the _IPs_ column from the virtual machines list on the UI and also in the _Network_ tab of the VM's details page.

* On your laptop, start a terminal (in Mac/Linux). For windows users, a terminal can be started from the MobaXterm toolbox.

* Type the following command on the terminal to establish a connection with your VM:

>**NOTE:**
>
>Replace 145.100.5X.YZT with your IP address!

```sh
ssh ubuntu@145.100.5X.YZT
```

#### First login

If everything went well, the first time you try to log in, your terminal will ask you to add the VM's IP to the list of known hosts. Type *Yes*, in that case.

You should now see a similar line in your terminal: `ubuntu@145...:~$`

This means that you have logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system:

```sh
ubuntu@145...:~$ ls ~
ubuntu@145...:~$ whoami
```

* Create a file:

```sh
ubuntu@145...:~$ echo "Some text ..." > myfile
ubuntu@145...:~$ cat myfile
```

* Logout by typing `logout` or `ctrl-D` in your terminal (do **not** issue any shutdown command):

```sh
ubuntu@145...:~$ logout
```

> **Food for brain:**
>
> Log in to your VM again. *Is your file still there?*


#### First shutdown

Let's shutdown your VM. Whenever you do not need your VM running, you should shut it down to stop consuming the resources that your VM is holding.

* Go to the list of running VMs in the Cloud UI (_Instances_ &gt; _<i class="fa fa-th"></i> VMs_).
* Tick the box to the left on the row with your VM.
* At the upper right corner of the screen, click the red button <i class="fa fa-trash-o" style="background-color:#f04124;border-color:#cf2a0e;color:#fff;padding:1px 1ex 1px 1ex;"></i> and click _Terminate_. A confirmation action is needed, click OK.
* Refresh the list of VMs (_<i class="fa fa-refresh"></i>_) until your VM is gone. You can always boot the "same" VM again whenever you need it.

> **Food for brain:**
>
> When the VM has been shut down and disappeared from the list, check and refresh the _Storage_ &gt; _<i class="fa fa-download"></i> Images_ and _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_ tabs. *Are your `image` and `template` still there?*

> **Note:**
>
> Your running VMs get exclusive access to their resources whether they are doing something useful or are idle. Because the HPC Cloud is offered on a fair-share basis and other users may actually be needing resources that you may be holding, before you move to the next part of this workshop, please **remember to shut all your VMs down**.

### <a name="Bonus"></a> Bonus food for brain

This section is meant as extra questions that we thought would be nice for you to investigate, and we invite you to do/think about them even after the workshop is finished.

**Bonus:** The HPC Cloud has hundreds of users. Many of them have common questions. In order to address these we have put together a web site with some documentation for users. We call it the HPC Cloud Documentation. Do you know the URL of this web site? Make sure you find out!!!


### Next: Calculate _&pi;_
You have completed part A of the Tutorial [SURF Research Boot Camp 2017-06-15](.). Please continue with part [Calculate _&pi;_](extraPI).

>**NOTE:**
>
>Before you move to the next sections, remember to shut your VMs down.
