---
layout: default
---

# VU HPC course 2017-11-13 <br/> Part A

<div style="float:right;max-width:205px;" markdown="1">
![VU logo](/images/VU_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is part A of the tutorial [VU HPC course 2017-11-13](.) and covers the following topics:

1. [Access the user interface](#access-the-user-interface)
2. [Add your public SSH key](#add-your-public-ssh-key)
3. [My first VM](#my-first-vm)

### <a name="access-the-user-interface"></a> 1. Access the User Interface

The User Interface (UI) is the web site that allows you to manage your _Virtual Machines_ (_VMs_) on the HPC Cloud.

#### Log in to the UI

>**Note**
>
>You will receive your access credentials from the workshop facilitators.

* Open the UI page in your browser: [https://ui.hpccloud.surfsara.nl/](https://ui.hpccloud.surfsara.nl/)
* Enter the username & password provided
* Hit the `Login` button

<!---
#### Switch to "user view"

The interface supports several so-called views, which are a way to arrange information on the screen. For this course you should use the _user view_.

* Locate the *buddy* icon <i class="fa fa-user"></i> with your user name at the top-right corner of the screen and click it.
* In the drop-down menu, move to *<i class="fa fa-eye"></i> Views* and in that sub-menu select *user*.
-->

#### Change your password

Once you login to the UI for the first time, it is a good practice to change the initial password.

* Locate the *buddy* icon <i class="fa fa-user"></i> with your user name at the top-right corner of the screen
* Click it and select *<i class="fa fa-cog"></i> Settings*
* Click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i> to the right on the *Password* field
* On the pop-up dialog displayed fill in a new password (twice) and click the *Change* button

#### Logout

Let's check whether your new set of access credentials work. Sign-out from the UI:

* Click your *buddy* icon  <i class="fa fa-user"></i>
* Choose *<i class="fa fa-power-off"></i> Sign Out*

From now on, you can use your new password to log in to the [UI](https://ui.hpccloud.surfsara.nl/). Please login again.

### <a name="add-your-public-ssh-key"></a> 2. Add your public SSH key

To complete the setup of your HPC Cloud account, you need to **add a Secure Shell (SSH) public key to your UI account**. This is a one-time task!

>**Note**
>
>If you are not familiar with the SSH authentication method, please read about it on our [documentation page](/SSHkey).

First, you need to own an SSH private/public key pair.

* An SSH public/private key pair must be created in your local computer and is usually stored in your `~/.ssh/` directory
* Check with the command `ls ~/.ssh`; you should see the files `id_rsa` and `id_rsa.pub` (default names)
* Create an SSH key pair now if needed

Next, you need to copy the public SSH key (`id_rsa.pub`) to the UI. The matching private key (`id_rsa`) remains safe in your laptop.

* Copy the content of your **public** SSH key to the clipboard (e.g. `cat ~/.ssh/id_rsa.pub`, then select and copy all the text)
* Go to the [UI](https://ui.hpccloud.surfsara.nl/) and select *<i class="fa fa-cog"></i> Settings* from the *buddy* icon  <i class="fa fa-user"></i>
* Locate the section _Public SSH Key_ and click on the blue edit icon <i class="fa fa-pencil-square-o" style="color:#0098c3;"></i>
* Paste the content of your public SSH key file into the text box
* There is no _Save_ button. Click outside the text box to complete your action
* Briefly check the contents of the text box against your public key and verify they match: it should start with `ssh-rsa AAAAB`...


### <a name="my-first-vm"></a> 3. My first VM

Working with the HPC Cloud service mostly revolves around building and destroying Virtual Machines. This section will guide you through the process of building a VM running Linux. Here's an overview of the main steps you will be taking:

* Importing a SURFsara pre-made `image` with a Linux operating system installed
* Reviewing the VM attributes defined in the `template`
* Instantiating the `template` to run your first VM
* Accessing your VM and gracefully shut it down

Let's create your first VM to be run on the HPC Cloud Oort!

#### <a name="import_appliance_from_Marketplace"></a> Importing an appliance from the Marketplace

SURFsara HPC Cloud provides ready-made `appliances` (aka `app`) to their users. These appliances are available in the `Apps` option of the *Storage* menu in the HPC Cloud UI. This is meant to help users instantiating secure VM’s quickly. Proceed as follows:

* Log in to the [UI](https://ui.hpccloud.surfsara.nl/)
* Choose the *Storage* tab on the left menu of the screen and then _<i class="fa fa-cloud-download"></i> Apps_

You will see a list of 'all' the `apps` we have available. For the purposes of this course, we will make use of an Ubuntu desktop 14.04.5 `app`.

* Select the `appliance` with the name **ubuntu-14.04.5-desktop-20171102** (ID 99) by clicking on the tick-box next to it
* Click on the OpenNebula button at the top of the screen
* A dialogue will pop up asking you for a few details. Edit as follows:
  * Name: **First Image**
  * VM Template Name: **First Template**
  * Select the Datastore to store the resource: **147: Courses_img**

Under section _Select the Datastore to store the resource_, choose the entry displaying **147: _Courses\_img_** by clicking anywhere in the entry row. It should now read, right above the entry you just clicked: `You selected the following datastore: Courses_img`.

* Finally, click the blue *Download* button. This step will import the `appliance` from the Marketplace to your work environment

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> When you import an `app`, an `image` and a `template` are created as explained during the introductory presentation. In the UI you have an _<i class="fa fa-download"></i> Images_ tab under _Storage_ and a _<i class="fa fa-file-o"></i> VMs_ tab under _Templates_ on the left menu. You have just imported an `app`, you should now see your new `image` and `template` there.
>* Can you see them?
>* What is the STATUS of the `image` just after you started importing it?
>* Refresh the images list <i class="fa fa-refresh"></i> until the Status is READY.

#### Reviewing the Template  

A `template` consists of a set of attributes that define how a Virtual Machine should look like. For example, how many cores do you want your VM to have? How much RAM memory? What storage drives to attach? Which network connections, etc. ? You will have to adapt the `template` you imported from the _Apps_ list, so that the VM(s) you create out of it meet the requirements you have.

For this part of the course, we would like you to edit the imported `template` following these steps:

* Go to the _<i class="fa fa-file-o"></i> VMs_ tab under _Templates_ on the left menu
* Find the `template` created previously and check the tick-box
* Click on the blue _Update_ button to start editing the template
* Browse through the different tabs there (i.e. _General_, _Storage_, _Network_, ...) to get acquainted with their contents
* Verify that your VM will have internet access:
  * Select the _<i class="fa fa-globe"></i> Network_ tab which shows the network interfaces (`NIC`) for your VM
  * The feedback below tells that the internet interface `NIC 0` on the left pane is mapped to `internet`  

![youselectednetwork](/images/youselectednetwork.png)
* Check the _<i class="fa fa-exchange"></i> Input/Output_ tab:
    * In the _Graphics_ section, the _VNC_ radio button must be selected
    * In the _Inputs_ section, make sure an entry _table USB_ is listed

If this is not the case, then under the _Inputs_ section select _Type_ **Tablet** and _Bus_ **USB** from the drop-down lists, and finally click the _Add_ button next to those drop-down lists.

* If you made any changes to the `template`, click the green button _Update_ at the top, to save your changes.

#### Starting the VM

As mentioned earlier, a `template` is just a description of the Virtual Machine that we want to build. Let's create the actual VM from it.

* Go to the _VMs_ section below _Instances_ on the left menu

An overview of all existing VMs, that you have the priviledges to see, are displayed.
This list is (probably) empty at the moment, because you have not yet started any VM.

* Click the button _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ to bring up a "Create Virtual Machine" screen
* Select the *First Template* by clicking once on it
* Find the input box for _VM name_ and give your virtual machine a name: **My First VM**
* Inspect the remaining `template` attributes, for the time being do not change them (in particular, leave _Number of instances_ at 1)
* Click on the green _Create_ button at the top of the screen
* Refresh the list of VMs by clicking button <i class="fa fa-refresh"></i> at the top. You will see the _status_ of the VM change


#### What happened?

Congratulations! You have just created a fresh, clean Virtual Machine!

> **Note**  
>Your VM will appear in the list of Virtual Machines. At first, it will have the state `PENDING`. This indicates that the HPC Cloud is looking for a place where your VM can actually run. Finding the right place depends on the amount and types of resources (cores, memory, disk...) you requested in the `template`. Keep refreshing the list by clicking the _refresh_ button <i class="fa fa-refresh"></i>. When the required resources become available, your VM will show the status `RUNNING`. Only then you will be able to make use of it.

Let's summarise what you have seen so far. Click on each of the tabs on the left menu and inspect the information provided. The most important ones at this point are:

* _Instances_ &gt; _<i class="fa fa-th"></i> VMs_: here you can manage your VM(s) (e.g.: create, terminate, ...). When you click anywhere on a running VM row (except the tick-box) you can inspect the extended information for that VM in the different tabs. You can even change some VM features from these tabs.
* _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_: here you can manage your templates. The `template` gives your VM the shape you want. It is just a recipe, and not the machine itself.
* _Storage_ &gt; _<i class="fa fa-download"></i> Images_: here you can manage storage places. You can look at `images` as hard drives.
* _Storage_ &gt; _<i class="fa fa-cloud-download"></i> Apps_: here you can see the list of `appliances` endorsed by SURFsara HPC Cloud team. One `app` of course is a bundle of an `image` and a `template`, which provide a basic working set of installed software and configured properties that allow you to easily create and use a VM.


#### <a name="logging_in_to_the_virtual_machine"></a> Logging in to the Virtual Machine

You can interact with your VM in several ways: command-line (e.g.: SSH), VNC (UI in your browser) or a remote desktop. We will use SSH in a terminal for the time being.

In order to log in to your VM, you will make use of the SSH public key [stored in your profile](#add-your-public-ssh-key) earlier. Proceed as follows:

* **On the UI:** find the VM IP address

The IP address of a VM is shown in the _IPs_ column on the VM list, and in the _Network_ tab of the VM details page.

* **On your laptop:** start a terminal

* **On your laptop:** type the following command on the terminal to establish a connection with your VM

>**Note**
>
>Replace 145.100.5Q.RST with your IP address!

```sh
ssh ubuntu@145.100.5Q.RST
```

If everything went well, the first time you try to log in your terminal will ask you to add the VM IP to the list of known hosts. Type *Yes*, in that case.

You should now see a similar line in your terminal: `ubuntu@packer-ubuntu-14:~$`.
This is the prompt of your VM and is waiting for your input.
You have logged in successfully!

* Look around a bit, make yourself familiar with the system:

```sh
ubuntu@packer-ubuntu-14:~$ ls /
ubuntu@packer-ubuntu-14:~$ whoami
```

* Create a file:

```sh
ubuntu@packer-ubuntu-14:~$ echo "Hello HPC Cloud!" > myfile
ubuntu@packer-ubuntu-14:~$ cat myfile
```

* Logout by typing `logout` or `ctrl-D` in your terminal (do **not** issue any shutdown command):

```sh
ubuntu@packer-ubuntu-14:~$ logout
```

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> Log in to your VM again. *Is your file still there?*


#### <a name="first_shutdown"></a> First shutdown

Let's shutdown your VM. Whenever you do not need your VM running, you should shut it down to stop consuming the resources allocated.

* Go to the list of running VMs in the Cloud UI (_Instances_ &gt; _<i class="fa fa-th"></i> VMs_)
* Tick the box to the left on the row with your VM
* At the upper right corner of the screen, click the red button <i class="fa fa-trash-o" style="background-color:#f04124;border-color:#cf2a0e;color:#fff;padding:1px 1ex 1px 1ex;"></i> and click _Terminate_
* A confirmation action is needed, click OK
* Refresh the list of VMs (_<i class="fa fa-refresh"></i>_) until your VM is gone

You can always boot the "same" VM again whenever you need it, from the corresponding `template`.

> <i class="fa fa-question-circle" aria-hidden="true"></i> **Food for brain**
>
> When the VM has been shut down and disappeared from the list, check and refresh the _Storage_ &gt; _<i class="fa fa-download"></i> Images_ and _Templates_ &gt; _<i class="fa fa-file-o"></i> VMs_ tabs. *Are your `image` and `template` still there?*
>
> The HPC Cloud has hundreds of users. Many of them have common questions. In order to address these we have put together a web site with some documentation, we call it the HPC Cloud Documentation. Do you know the URL of this web site? Make sure you find out!

### Next: part B
You completed part A of the Tutorial [VU HPC course 2017-11-13](.). Awesome! Before proceeding with [Part B](partB), please carefully read the following:

> <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i> **Important**
>
> Your running VMs get exclusive access to their resources, whether they are doing something useful or not. Because the HPC Cloud is offered on a fair-share basis and other users may actually be needing resources that you may be holding, please **remember to terminate all your VMs** before you move to the next part of this workshop.
