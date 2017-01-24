---
layout: default
---
# Your first virtual machine

This page teaches how to create a `Virtual Machine` (VM) running Linux, by importing an _appliance_ from the `Apps` option of the `Storage` menu.

> **NOTE**
>
> This walk-through guide provides an introduction to the concepts of the HPC Cloud. If you are going to use a VM running Linux for your research, the steps described in this guide will produce a basic VM that you can use to install the software that you may need and where to process your data later on. If your goal is to use a VM running Windows, this chapter still gives you a good introduction and you are recommended to start here.
>
> More advanced and specialized topics are discussed separately.
>
> If you are not yet acquainted with terms such us `Virtual Machine`, `template` and `image`, please visit [the introduction to the HPC Cloud documentation page](introduction-to-hpc-cloud)

## Recap: templates, images and appliances

You use the HPC Cloud interface to build `virtual machine`s.

You build them by first describing all their parts. This description is called a `template`. You _instantiate_ a template to make a VM out of it.

Storage drives (like hard disks) are `images`. They do not physically exist, but rather, they only exist as files in a backing file server.

To make starting a virtual machine easier, we provide the Apps option, which has _appliances_ readily available for you to pick and use.

## Logging into the HPC Cloud User Interface

The HPC Cloud User Interface (UI) is the web site where you manage your VMs.

You can reach the UI at the following URL: [https://ui.hpccloud.surfsara.nl](https://ui.hpccloud.surfsara.nl)

After you are granted access to the HPC Cloud, you will receive a username and a password for this UI.

> **NOTE**
>
> If you would like an explanation about the options you can see on the UI, please visit [the User Interface documentation page](user-interface).

To start building a virtual machine, go to the UI and log in with the username and password you received.

> **NOTE**
>
> ... that the username and password are **not** for the VM you are going to create. You can set users and passwords later on, once you have created a VM.

## Importing an _appliance_ from the Apps option of the Storage menu

We are going to work with a pre-made `image` that is available in the `Apps` option.

> **NOTE**
>
> The `Apps` option contains  a collection of so-called _appliances_ maintained by the HPC Cloud team. It is a handy way to import, from within the UI, useful images that are ready to use. More information about the [_appliances_ configuration is available](appliances-configuration). There is also an OpenNebula marketplace, publicly available on the OpenNebula website, and anybody can contribute their _appliances_ to it.

Import the appliance by following these steps:

1. From the **user** `view`, choose the
   _Storage_ tab on the left menu of the screen and then _Apps_ (in the screen shot, it has been highlighted in red).
   
   ![appmarket step 1](images/appmarket_step_1.png)

2. Look for the **Ubuntu 14.04 Server** _appliance_ in the list and click on it.
   This will show details about `image`, `template` and other attributes (including a textual description) that conform the _appliance_. Please, read the `Description` now.
   The description mentions that there is no password for the root account and that you need to add an SSH public key to your user profile. We will do this in a later step.
   Read the extended information related to the _appliance_ (especially, the bit about the _contextualization_ and _configuration_ options).
   
   ![appmarket step 2](images/appmarket_step_2.png)

3. Click on the _OpenNebula_ button at the top of the screen.
   A dialogue will pop up, asking you for a few details.
   
   ![appmarket step 3](images/appmarket_step_3.png)

4. The first options are the name of the `image` and the `template`. You can change the names to something more descriptive to you. Once you have many `image` and `template` objects, it will pay off to have good descriptive names of what each of them is.

5. The next  setting is the datastore for images. Make sure that you select _local images ssd_. 

6. Finally, click _Download_. This will start importing the appliance from  the AppMarket. When the import is successful, it will create an `image` and a `template`.

You can verify that the process is complete by inspecting the _VMs_ sections in the _Templates_ tab and the _Images_ section in the _Storage_ tab of the UI. You should see your new `image` and `template` there.

## Adding an SSH key to your profile

If you remember from the description of the virtual machine, there is no password for the _root_ user. You have to add an SSH key to your user profile in order to be able to log in as root in your VM.

First, you need to create an SSH key in your own computer. This process is described in [a different article](SSHkey). This SSH key enables you to log in to your virtual machine with ```ssh```.

After you have created an SSH key, go to your _user profile_ by selecting the _buddy_ icon on the top-right of the screen, then select _Settings_. A dialogue pops up. In the dialogue, go to the _Info_ page; then locate the section _Public SSH Key_, and click on the blue _edit_ icon. You should now see an empty text area.

Find the file in your computer containing the public key you created (it is usually called ```id_rsa.pub``` and it is usually found in the ```.ssh``` directory in your ```$HOME```directory). Open the file, then copy the contents of the file (its contents are your public key) and paste it into the text area of the UI.

![import_ssh_key_img](images/import_ssh_key.png)

You can just close this dialogue now. Your public key is automatically stored in your profile.


## Starting your virtual machine

>**Note:**
>
> When you import an appliance from the Apps option, the disk image is normally non-persistent.
> This means, in short, that your changes are lost when you shut your VM down. Before starting your VM, always check
> whether [Image Persistence](image_persistence) is set to the desired mode (yes or no).

A `template` is a description of a virtual machine. The `template` we have been editing in this guide is now ready to create a virtual machine from it.

Go to the _VMs_ option of the _Instances_ section of the UI. This displays an overview of all running VMs. If this is your first virtual machine, this list will be empty.

Start your virtual machine using the following steps:

1. Click on the green plus sign, as shown in the screenshot. 

![startVM](images/startVM.png)

2. Select the `template` you created before from the presented list. This opens a dialogue with options where you will define the resources to be allocated to VM.

3. The first box in the dialogue is to give your virtual machine a name. Ideally, give your VM a name consisting *only* of lowercase letters, hyphens ('-') and digits, but *no other characters or spaces*.

4. The number of instances is 1, which is fine for now.

5. Click on the _Create_ button at the top of the screen.

Your VM will appear in the list of virtual machines. At first, it will have the state PENDING. That state means that the cloud system is looking for a place where your virtual machine can actually run.

When the required capacity becomes available, your virtual machine will go through a few other states, and eventually, it will appear as RUNNING. Refresh the VM status by clicking on the two arrows chasing each other next to “+” button.

![testVM](images/testVM.png)

The operating system on the machine will go through the boot process.

## Logging in on your virtual machine

After you have added your public key to your user profile, you should be able to log in on your virtual machine as user _ubuntu_, allowing you to perform maintenance tasks on your virtual machine by using `sudo`.

You will need to find the IP address of your virtual machine, first. The IP address of your virtual machine is shown on in the _IPs_ column from the virtual machines list, under the _Virtual Resources_ tab of the UI.

If you use Linux or Mac OSX open a terminal (if you are using Windows then open a GitBash terminal) and type:

```bash
  ssh ubuntu@145.100.mmm.nnn
```

where you should replace _mmm_ and _nnn_ to match the IP address of your virtual machine.

<!---
>**Note:**
>You can find out which username to use (in this case, 'ubuntu', but it could be a different one) by reading the description of the _Appliance_ you imported. Go to the _Apps_ tab on the UI and then click on the _appliance_ you chose. You can then read extended information for that appliance. Among other information, you will find usernames you can use.
>
-->
>**Note:**
>You can find out which username to use (in this case, 'ubuntu', but it could be a different one) by reading the description of the _Appliance_ you imported. Go to the _AppMarket_ tab on the UI, then _Appliances_ and then click on the _appliance_ you chose. You can then read extended information for that appliance. Among other information, you will find usernames you can use.
>
>**Note:**
>You may have to specify which of your (multiple) public keys you want to use to connect to your VM. The `ssh` command can take an argument of the following form for that:
 * the flag `-i`
 * a space
 * and the path to the public key file
>
>**Example:**
>
>In the screen shot below, the IP address is _145.100.59.30_. And suppose the public key we want to use from our laptop is ~/.ssh/id_rsa.pub. Then, the correct command in this case would be:

```bash
  ssh -i ~/.ssh/id_rsa ubuntu@145.100.59.30
```
>**Note for Windows:**
>
>If you are using _Putty_, then use the IP of your virtual machine as _host_, _ubuntu_ as _username_, and click _Connect_ (see instructions [here](putty-tools#ssh-access-from-a-windows-putty-client)).

If there were no errors, and if your firewalls allow making remote connections, you should now be logged in on your virtual machine, as user _ubuntu_.

>**Note: Operating as user _root_**
>
>Many tasks in Linux require your becoming user _root_. The recommended way of operating as _root_ in Ubuntu is to run your  commands prefixed by `sudo`. For example, to install a common text editor, you would run: `sudo apt-get install vim`.
>
>However, if what you would like is to become _root_ in a terminal so that you do not have to bother with the `sudo` prefix, then you can do that like this: `sudo su -`. From then on, everything you run in that terminal will take place as the _root_ user.

## Shut down and remove your machine

If you want to terminate your VM and stop consuming your quotas, perform the following steps:

1. Tick the box to the left on the row of your VM and click _Terminate_ (upper right corner of the screen, under the _dust bin_ drop-down button).
![shutdownVM](images/shutdownVM.png)

2. Refresh the Virtual Machines list (by clicking on the two arrows chasing each other next to _+_ button) until your VM is gone.

That was the shutdown. Once the operation is finished, your VM will be removed from the display and its resources freed. You can start a new VM from your existing `template` and `image` any time.
