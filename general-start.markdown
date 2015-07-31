---
layout: default
---
# Your first virtual machine

This page teaches how to create a `Virtual Machine` (from now on, VM) running Linux, by importing an _appliance_ from the `AppMarket`. 

> **NOTE**
>
> This walk-through gives a good introduction to the concepts of the HPC Cloud, and if you are going to use a  VM running Linux for your research, this will produce a basic VM you can keep working with to install the software that you may need and where to process your data later on. Even if you are going to use a VM running Windows, this chapter still gives you a good introduction, and you are recommended to start here.
>
> More advanced and specialised topics are discussed separately.
>
> If you are not yet acquainted with terms such us `Virtual Machine` (or VM), `template` and `image`, please visit [the introduction to the HPC Cloud documentation page](introduction-to-hpc-cloud)

## Recap: templates, images and appliances

You use the HPC Cloud interface to build `virtual machine`s. 

You build them by first describing all their parts. This description is called a `template`. You _instantiate_ a template to make a VM out of it.

Storage drives (like hard disks) are `images`. They do not physically exist, but rather, they only exist as files in a backing file server.

To make starting a virtual machine easier, we provide the AppMarket, which has _appliances_ on available for you to pick and use. 

## Logging into the HPC Cloud User Interface

The HPC Cloud User Interface (from now on, UI) is the web site where you manage your VMs. 

You can reach the UI at the following URL: https://ui.hpccloud.surfsara.nl

After you are granted access to the HPC Cloud, you will receive a username and a password for this UI. 

> **NOTE**
>
> If you would like an explanation about the options you can see on the UI, please visit [the User Interface documentation page](user-interface).

To start building a virtual machine, go to the UI and log in with the username and password you received. 

> **NOTE**
>
> ...that the username and password are **not** for the VM you are going to create. You can set users and passwords later on, once you have created a VM.

## Importing an _appliance_ from the AppMarket

We are going to work with a pre-made `image` that is available on the AppMarket. 

> **NOTE**
>
> The AppMarket is a collection of so-called _appliances_ that is maintained by the HPC Cloud team. It is a handy way to import, from within the well-known UI, useful images that are ready to use. There is also an OpenNebula marketplace, publicly available on the OpenNebula website, and anybody can contribute their _appliances_ to it.

Import the appliance by following these steps:

1. From the **user** `view` or the **groupadmin** `view`, choose the
   _AppMarket_ tab on the left menu of the screen and then _Appliances_ (in the screen shot, it has been highlighted in red).
   ![appmarket step 1](images/appmarket_step_1.png)

2. Next, look for the **Ubuntu - KVM** _appliance_ in the list; click on it. 
   This will show details about `image`s, `template`s and other attributes (including a textual description) that conform the _appliance_.
   The description mentions that there is no password for the root account and that you need to add an SSH public key to your user profile. We will do this in a later step.
   Read the extended information related to the _appliance_ (especially, the bit about the _contextualization_ and _configuration_ options).
   ![appmarket step 2](images/appmarket_step_2.png)

3. Click on the _Import_ button at the top-right corner of the screen.
   A dialogue will pop up, asking you for a few details.
   ![appmarket step 3](images/appmarket_step_3.png)

4. The first setting is the datastore for images. Make sure that you select _104: local images ssd_.

5. The other options are the name of the `template` and the `image`. You can change the names to something more descriptive to you. Once you have many `template`s and `image`s, it will pay off to have good descriptive names of what each of them is.

6. Finally, click _Import_. This will start importing the appliance from  the AppMarket. When the import is successful, it will create an `image` and a `template`.

You can verify that the process is complete by inspecting the _Template_
and _Image_ sections in the _Virtual Infrastructure_ tab of the UI. You should see your new `image` and `template` there.

## Adding an SSH key to your profile

If you remember from the description of the virtual machine, there is no password for the _root_ user. You have to add an SSH key to your user profile in order to be able to log in as root in your VM. 

First, you need to create an SSH key in your own computer. This process is described in [SSHkey](SSHkey). This SSH key enables you to log in as root on your virtual machine with ```ssh```.

After you have created an SSH key, go to your _user profile_ by selecting the _buddy_ icon on the top-right of the screen, then select _Settings_. A dialogue pops up. In the dialogue, go to the _Info_ page; then locate the section _Public SSH Key_, and click on the blue _edit_ icon. You should now see an empty text area.

Find the file in your computer containing the public key you created (it is usually called ```id_rsa.pub``` and it is usually found in the ```.ssh``` directory in your ```$HOME```directory). Open the file, then copy the contents of the file (those contents are your public key) and paste those contents into the text area of the UI.

You can close your profile now. Your public key is automatically stored in your profile.

## Finishing the virtual machine configuration by editing the template

When you imported the _appliance_ fromt he AppMarket, it made a `template` available for you to make a virtual machine. However, the VM would not be connected to the internet yet, so you cannot connect to it remotely.

### Connecting your virtual machine to the internet

Allow your virtual machine to connect to the internet by following these steps:

1. Go to the _Templates_ section. Find the `template` you just created, and click on it. You now see an overview of the `template` settings.

2. Click on _Update_ on the top-right of the screen to start editing the `template`.
This shows the different configuration options for your `template`. For now, we will leave most settings alone, but you can browse through the different options. Select the _Network_ tab.

3. The _Network_ tab shows which network interfaces (or `nic`s) your VM would have and to which networks they would be connected. To connect the only available `nic` at the moment (called _Interface 0_) to the internet, select the network called "internet", to the right of it, as shown on the screen shot. 
   ![template IP](images/template_IP.png)

4. Click _Update_ to save your changes.


## Starting your virtual machine

A `template` is a description of a virtual machine. The `template` we have been editing in this guide is now ready to create a virtual machine from it.

Go to the _Virtual Machines_ section of the UI. This displays an overview of all running VMs. If this is your first virtual machine, this list will be empty.

Start your virtual machine using the following steps:

1. Click on the green plus sign, as shown in the screenshot. This opens a dialogue with options for your virtual machine.
![startVM](images/startVM.png)

2. The first box in the dialogue is to give your virtual machine a name. This name is also used as the host name of your machine. Ideally, give your VM a name consisting *only* of lowercase letters, hyphens ('-') and digits, but *no other characters or spaces*. 

>**Note:**
>
>The name for the VM can be the same as that of the `template`.

3. The number of instances is 1, which is fine for now.

4. The second step in the dialogue is to select a `template`. Since this is your first `template`, there is only one item in the list. Select this `template`.

5. Click on the _Create_ button at the bottom of the screen.

Your VM will appear in the list of virtual machines. At first, it will have the state PENDING. That state means that the cloud system is looking for a place where your virtual machine can actually run.

When the required capacity becomes available, your virtual machine will go through a few other states, and eventually, it will appear as RUNNING.
![testVM](images/testVM.png)

The operating system on the machine will go through the boot process.

## Logging in on your virtual machine

After you have added your public key to your user profile, you should be able to log in on your virtual machine as _root_, allowing you to perform maintenance tasks on your virtual machine.

You will need to find the IP address of your virtual machine, first. The IP address of your virtual machine is shown on in the _IPs_ column from the virtual machines list, under the _Virtual Infrastructure_ tab of the UI. 

If you use a Linux or a Mac OSX operating system, open a terminal window, and type

```bash
  ssh root@145.100.mmm.nnn
```

where you should replace _mmm_ and _nnn_ to match the IP address of your virtual machine.

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
  ssh -i ~/.ssh/id_rsa.pub root@145.100.59.30
``` 

If you use a Windows operating system, you should have imported your public and private key pair into _Putty_ or other terminal program. Use the IP of your virtual machine as host, use _root_ as username, and click _Connect_.

If there were no errors, and if your firewalls allow making remote connections, you should now be logged in on your virtual machine, as _root_. 


## Shut down and remove your machine

If you want to shutdown your VM and stop consuming quotas, perform the following steps:

1. Tick the box to the left on the row with your VM and click _Shutdown_ (upper right corner of the screen, under the _dust bin_ drop-down button).
![shutdownVM](images/shutdownVM.png)

2. Refresh the Virtual Machines list (by clicking on the two arrows chasing each other next to _+_ button) until your VM is gone.
That was the shutdown. Once the operation is finished, your VM will be removed from the display and its resources freed. You can start a new VM from your existing `template` and `image` any time.
