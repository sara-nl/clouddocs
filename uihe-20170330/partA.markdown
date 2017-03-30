---
layout: default
---

# UNESCO-IHE symposium 2017-03-30&31 <br/> Part A

<div style="float:right;max-width:205px;" markdown="1">
![UNESCO-IHE logo](/images/Unesco-Ihe-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part A of the tutorial [UNESCO-IHE symposium 2017-03-30&31](.) and covers the following topics:

1. [Access the user interface](#access-the-user-interface)
2. [Add your public SSH key](#add-your-public-ssh-key)
3. [My first VM](#my-first-vm)

### 1. Access the User Interface

The User Interface (UI) is the web site that allows you to manage your _Virtual Machines_ (_VMs_) on the HPC Cloud.

#### Log in to the UI

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/).
* Your username is **s-uiheXZ**, replace `XZ` with the number assigned to you.
* You will receive the password from the workshop facilitators.
* Hit the `Login` button.

#### Change your password

Once you login to the UI, it is a best practice to change the initial password.

* Locate the *buddy* icon <i class="fa fa-user"></i> with your user name at the top-right corner of the screen, click it and select *<i class="fa fa-cog"></i> Settings*.
* In the _Settings_ display, locate the _Password_ field and click the blue *edit* icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>.
* On the _Update Password_ pop-up dialog fill in a new password (twice) and click the *Change* button to submit it.

#### Logout

Let's check whether it worked.

* Click your *buddy* icon  <i class="fa fa-user"></i>.
* Choose *<i class="fa fa-power-off"></i> Sign Out*.

From now on you can use your new password to log in to the [UI](https://ui.hpccloud.surfsara.nl/). Do so now.

### 2. Add your public SSH key

To complete the setup of your HPC Cloud account, you need to **add a Secure Shell (SSH) public key to your profile**. This is a one-time task.

First, you need an SSH private/public key pair.

* Read about SSH and public keys on the [private/public keys](/SSHkey) page.<br />
If you are already familiar with SSH public keys, you can skip reading this page.
* You need a private/public key pair in your `~/.ssh/` directory. Create one now if needed.
* Check with the command `ls ~/.ssh`; you should see the files `id_rsa` and `id_rsa.pub`.

Next, you need to copy the public SSH key (`id_rsa.pub`) to the UI.
The matching private key (`id_rsa`) stays safe in your laptop.

* Copy the content of your **public** SSH key to the clipboard (for example, by doing `less ~/.ssh/id_rsa.pub`, then selecting and copying all of that text).
* Go to the [UI](https://ui.hpccloud.surfsara.nl/) and select *<i class="fa fa-cog"></i> Settings* from the *buddy* icon  <i class="fa fa-user"></i>.
* Locate the section _Public SSH Key_ (if needed, click the *<i class="fa fa-info-circle"></i> Info* icon) and click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>.
* Paste the content of your public SSH key file into the text box.
* There is no _Save_ button; click outside the text box to complete your action (e.g.: on the words "Public SSH Key").
* Check the contents of the text box against your public key and verify they match: it should start with `ssh-rsa AAAAB`...

### 3. My first VM

Using the HPC Cloud revolves around building Virtual Machines (VM). SURFsara provides several **Apps** readily available in  the HPC Cloud UI, to facilitate creating simple VMs.  Apps are ready-made `appliances` for you to copy and use. 

These are the steps to build your first VM from one of the Apps, detailed instructions will follow:

* Import a pre-made `image` with a Linux operating system installed.
* Review the shape of the VM (so-called `template`).
* Instantiate the `template` to create your first VM.
* Access your VM and shut it down.

Let's run your first VM on the HPC Cloud!

#### Import an app

* Log in to the [UI](https://ui.hpccloud.surfsara.nl/).
* Choose the *Storage* tab on the left menu of the screen and then _<i class="fa fa-cloud-download"></i> Apps_.
* Select the `app` **Ubuntu 14.04 Desktop CI** by clicking on the tick-box next to it.
* Click on the blue _OpenNebula_ button above the list of apps.
* A dialogue will pop up asking you for a few details. Edit as follows:
  * Name: **Course Image**.
  * VM Template Name: **Course Template**.
  * Below "Select the Datastore to store the resource", select **147: _wshop\-uihe\_img_**.
    It should now read "You selected the following datastore: wshop-uihe_img"
* Click the green *Download* button. This will copy the _app_ to your work environment, and return to the Apps list.

> **Food for brain:**
>
> When you import an `app`, an `image` and a `template` will be created, as explained during the introductory presentation. In the UI you have an _<i class="fa fa-download"></i> Images_ tab under _Storage_ and a _<i class="fa fa-file-o"></i> VMs_ tab under _Templates_ on the left menu. You should see your new `image` and `template` there.
> 
* Can you see them?
* What is the STATUS of the `image` just after you import it?
* Refresh the contents of the _Images_ tab page by clicking button <i class="fa fa-refresh"></i>, next to the button _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ until it is READY.

#### Review the Template  

A `template` consists of a set of attributes that defines a Virtual Machine. For example, how many cores you want your VM to have, how much RAM memory, what storage drives to attach, which network connections, etc. We will have to adapt the `template` to meet your requirements before you can use it to create VMs out of it.

Edit the imported `template` following these steps:

* Go to the _<i class="fa fa-file-o"></i> VMs_ tab under _Templates_ on the left menu.
* Find the `template` you just imported (*Course Template*), and click on it (anywhere **except** the tick-box).
* Click on the blue _Update_ button to start editing the template.
* Browse through the different tabs there (i.e. _General_, _Storage_, _Network_, ...) to get acquainted with their contents.
* Verify that your VM will have internet access: 
  * Select the _<i class="fa fa-globe"></i> Network_ tab which shows the network interfaces (or `nics`) for your VM. 
  * The feedback below tells that the internet interface `NIC 0` on the left pane is mapped to `internet`.   
![youselectednetwork](/images/youselectednetwork.png)
* Check the _<i class="fa fa-exchange"></i> Input/Output_ tab: 
    * In the _Graphics_ section, the _VNC_ radio button must be selected.
    * In the _Inputs_ section, make sure an USB tablet is listed. If not: select _Type_ **Tablet** and _Bus_ **USB**; then click the _Add_ button next to that.
* If you made any changes to the `template`, click the green button _Update_ at the top, to save your changes.

#### Start the VM

A `template` is just a description of the virtual machine that we want to build. Let's create the actual virtual machine from it.

* Go to the _VMs_ section below _Instances_ on the left menu. 
  An overview of all existing VMs, that you have the priviledges to see, are displayed.
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

* _Dashboard_: shows an overview of the project status, like the number of running machines or usage statistics.
* _Instances_ &gt; _<i class="fa fa-th"></i> VMs_: here you can manage your VMs (i.e.: create, start, shutdown). Click anywhere on a running VM's row (except the tick-box). Inspect the information present in the different tabs providing you extended details.
* _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_: the `template` gives your VM the shape you want. A `template` is just a recipe; not the machine itself.
* _Storage_ &gt; _<i class="fa fa-download"></i> Images_: this is the equivalent of a hard drive. Your OS is stored on this `image`.
* _Storage_ &gt; _<i class="fa fa-cloud-download"></i> Apps_: a list of `appliances` endorsed by SURFsara HPC Cloud team that you can use.

> **NOTE:**  
>Your VM will appear in the list of virtual machines. At first, it will have the state `PENDING`. This indicates that the HPC Cloud is looking for a place where your virtual machine can actually run. Finding the right place depends on the amount of resources (cores, memory, and disk) you requested in the associated `template`. Keep refreshing the list by clicking button <i class="fa fa-refresh"></i>. When the required capacity becomes available, your VM will show the status `RUNNING`. Only then can you actually use your VM.

#### Log in to the VM

You can interact with your VM in several ways: command-line (e.g.: SSH), VNC (UI in your browser) or a remote desktop. We will use SSH in a terminal for the time being.

The way to log in to your virtual machine is making use of the SSH key pair that you [stored in your profile](#add-your-public-ssh-key) earlier.

**Commandline access - SSH**  

* First find your VM's IP address. It is shown in the _IPs_ column from the virtual machines list on the UI and also in the _Network_ tab of the VM's details page.

* On your laptop, start a terminal (in Mac/Linux) or GitBash (in Windows).

* Type the following command on the terminal to establish a connection with your VM:

>**NOTE:**
>
>Replace 145.100.5Q.RST with your IP address!

```sh
ssh ubuntu@145.100.5Q.RST
```

#### First login

If everything went well, the first time you try to log in, your terminal will ask you to add the VM's IP to the list of known hosts. Type *Yes*, in that case.

You should now see a similar line in your terminal: `ubuntu@ip-145...:~$`

This means that you have logged in successfully to your Virtual Machine!

* Look around a bit, make yourself familiar with the system:

```sh
ubuntu@ip-145...:~$ ls /
ubuntu@ip-145...:~$ whoami
```

* Create a file:

```sh
ubuntu@ip-145...:~$ echo "Some text ..." > myfile
ubuntu@ip-145...:~$ cat myfile
```

* Logout by typing `logout` or `ctrl-D` in your terminal (do **not** issue any shutdown command):

```sh
ubuntu@ip-145...:~$ logout
```

> **Food for brain:**
>
> Log in to your VM again. *Is your file still there?*


#### First shutdown

Let's shut your first VM down. Anytime you expect your VM to be doing nothing useful, you should shut it down to stop consuming the resources that your VM is holding.

* Go to the list of running VMs in the Cloud UI (_Instances_ &gt; _<i class="fa fa-th"></i> VMs_).
* Tick the box to the left on the row with your VM.
* At the upper right corner of the screen, click the red button <i class="fa fa-trash-o" style="background-color:#f04124;border-color:#cf2a0e;color:#fff;padding:1px 1ex 1px 1ex;"></i> and click _Terminate_. A confirmation action is needed, click OK.
* Refresh the list of VMs (_<i class="fa fa-refresh"></i>_) until your VM is gone. You can always boot the "same" VM again whenever you need it.

> **Food for brain:**
>
> When the VM has been shut down and disappeared from the list, check and refresh the _Storage_ &gt; _<i class="fa fa-download"></i> Images_ and _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_ tabs. *Are your `image` and `template` still there?*

### BONUS _food for brain_

This section is meant to propose extra questions we thought would be nice for you to investigate. We invite you to do/think about them even after the workshop has finished.

**Bonus:** The HPC Cloud has hundreds of users. Many of them have common questions. In order to address these we have put together a web site with some documentation for users. We call it the HPC Cloud Documentation. Do you know the URL of this web site? Make sure you find out!

> **NOTE:**
>
> Your running VMs get exclusive access to their resources whether they are doing something useful or are idle. Because the HPC Cloud is offered on a fair-share basis and other users may actually be needing resources that you may be holding, before you move to the next part of this workshop, please **remember to shut all your VMs down**.

### Next: part B
You completed part A of the Tutorial [UNESCO-IHE symposium 2017-03-30&31](.). Please continue with Tutorial [Part B](partB).
