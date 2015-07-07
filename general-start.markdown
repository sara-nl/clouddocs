# Your first virtual machine

## Introduction

This chapter teaches you how you can create a `Virtual Machine` (from now on, VM) running Linux, by importing an _appliance_ from the Marketplace. 

> **NOTE**
>
> This walk-through gives a good introduction to the concepts of the HPC Cloud, and if you are going to use a  VM running Linux for your research, this will produce a basic VM you can keep working with to install the software that you may need and where to process your data later on. Even if you are going to use a VM running Windows, this chapter still gives you a good introduction, and you are recommended to start here.
>
> More advanced and specialized topics are discussed separately.
>
> If you are not yet acquainted with terms such us `Virtual Machine` (or VM), `template` and `image`, please visit [the introduction to the HPC Cloud documentation page](introduction-to-hpc-cloud)


## Terminology: templates, images and appliances

You use the HPC Cloud interface to build your virtual machines. Virtual
machines are just like real computers, except that you can build (and
remove) them in minutes.

You build virtual machines by first describing all the parts of your
virtual machine. this description is called a _template_. Just like a
real machine, your virtual machine contains CPUs, memory, one or more
hard disks, and it is attached to one or more networks. The template
describes how many CPUs and how much memory you machine has, which hard
disks are used, and to which networks your machine is connected.

The hard disks in your virtual machine are not real; instead, all
information on your hard disks are stored in big files on a file server.
These files are usually called _disk images_ or simply _images_.

To make starting a virtual machine easier, a _marketplace_ has been
provided with disk images which come pre-installed with an operating
system. The marketplace also contains simple templates with settings to
get you started quickly. The combination of a pre-installed hard disk
and a template is called an _appliance_.



## Logging into the HPC Cloud User Interface

The HPC Cloud User Interface (from now on, UI) is the web site where you manage your VMs, disks and networks. After your project is approved, you will receive a username and a password for the UI.

You can reach the UI at the following URL: https://ui.hpccloud.surfsara.nl 

> **NOTE**
>
> If you would like an explanation about the options you can see on the UI, please visit [the User Interface documentation page](user-interface).

To start building a virtual machine, go to the UI and log in with the username and password you received. 

> **NOTE**
>
> ...that the username and password are **not** for the VM you are going to create. You can set users and passwords later one, once you have created the VM.

## Importing an _appliance_ from the Marketplace
We are going to work with a pre-made `image` that is available on the Marketplace. 

> **NOTE**
>
> The Marketplace is a collection of so-called _appliances_. It is publicly available on the web of OpenNebula, and anybody can contribute their _appliances_ to it. It is a handy way to import, from within the well-known UI, useful images that are ready to use.
>
> However, because of these open possibilities, it may also be the case that, when you are reading this documentation, the _appliance_ we mention here has changed or been removed. 

Import the appliance by following the steps:

1. From the **user** `view` or the **groupadmin** `view`, choose the
   _Marketplace_ tab on the left menu of the screen, as shown in the
   screen shot; in the screen shot, it has been highlighted in red.
   ![marketplace step 1][marketplace_step_1]

2. Next, look for the **Ubuntu - KVM** _appliance_ in the list; you can
	 search for it by typing on the search box, and click on the name of
   the image in the list. This will show the details about the images.
   The description mentions that there is no password for the root
   account and that you need to add an SSH public key to your user
   file. We will do this in a later step.
   Read the extended information related to the _appliance_ (especially,
   the bit about the _contextualization_ and _configuration_ options.

3. Click on the _Import_ button at the top-right corner of the screen.
   A dialogue will pop up, asking you for a few details.

4. The first setting is the datastore for images. Make sure that you
	 select _104: local_images_ssd_.

5. The other options are the name of the `template`
	 and the `image`. You can change the template and image names to
   something more descriptive to you; once you have more templates and
   images, this will help you keep everything organized.

6. Finally, click _Import_. This will start importing the appliance from 
   the marketplace. When the import is succesful, it will create an
   image and a template.

You can verify that the process is complete by inspecting the _Template_
and _Image_ sections in the _Virtual Infrastructure_ tab of the HPC Cloud
user interface. You should see your new image and template.


## Adding an SSH key to your profile

If you remember from the description of the virtual machine, there is
no password for the _root_ user. You have to add an SSH to your user
profile. First, you need to create an SSH key; this process is described
in [SSHkey](SSHkey). This SSH key enables you to log in as root on your virtual
machine with ```ssh```.

After you have created an SSH key, go to your profile by selecting your
user name on the top-right of the screen, then select _Settings_. A
dialogue pops up.

In the dialogue, go to the _Info_ page; then locate the section _Public
SSH Key_, and click on the blue edit icon. You should now see an empty
area.

Find the public key on your system; copy your public key, usually called
```id_rsa.pub```, and paste the key into the text area.

You can close your profile; your public key is automatically stored in
your profile.


## Finishing the virtual machine configuration by editing the template

You now have a template for a working virtual machine. However, in its
current state, it is is not connected to the internet, so you cannot
connect to it remotely.


### Connecting your virtual machine to the internet

Connect your virtual machine to the internet by
following these steps:

1. Go to the _Templates_ section. Find the template you just created, and
click on it. You now see an overview of the template settings.

2. Click on _Update_ in the top-right of the screen to update the template.
This shows the different configuration options for your template. For
now, we'll leave most settings alone, but you can browse through the
different options. Select the _Network_ settings.

3. The network settings shows which network is connected to each network
	 interface. To connect interface 0 to the internet, select the network
   called "internet", as shown in the screen shot.
   
   Make sure that display shows that you have selected the "internet"
   network, as shown in the screen shot.

4. Click "Update"



## Starting your virtual machine

This template is a description of a virtual machine. Now you can create
a virtual machine.

Go to the _Virtual Machines_ section. This displays an overview of all
running machines. If this is your first virtual machine, this list is
empty.

Start your first virtual machine using the following steps:

1. click on the green plus sign, as shown in the screen shot. This opens
	 a dialogue with options for your virtual machine.

2. The first step in the dialogue is to give your virtual machine a
	 name. This name is also used in the host name of your machine later,
   ideally, give your machine a name consisting *only* of lowercase
   letters, hyphens ('-'), or digits, but *no other characters or
   spaces*. Note that the virtual machine name can be the same as the
   name of the template.

3. The number of instances is 1, which is fine for now.

4. The second step in the dialogue is to select a template. Since this
	 is your first template, there is only one template in the list.
   Select this template.

5. Click on the "Create" button at the bottom of the screen.

Your machine will appear in the list of virtual machines. At first, it
will have the state _PENDING_. Pending means that the cloud system is
looking for a place where your virtual machine can actually run.

When the required capacity becomes available your virtual machine will
go through a few states, and eventually, it will appear as _RUNNING_.
The operating system on the machine will go through the boot process.


## Logging in on your virtual machine

After you have added your public key to your user profile, you should be able to log in on your virtual machine as _root_, allowing you to maintain your virtual machine.

First, determine the ip-address of your virtual machine. The IP-address of your virtual machine
is shown in the virtual machine overview, in the _Virtual Infrastructure_ tab of the user interface.
The IP address is shown in the column titled _IPs_.

If you use a Linux or a Mac OSX operating system, open a terminal window, and type
```sh
  ssh root@145.100.mmm.nnn
```
where you should replace _mmm_ and _nnn_ to match the IP address of your virtual machine.
In the screen shot below, the IP address is _145.100.59.30_, so the correct command in this
case is
```sh
  ssh root@145.100.59.30
``` 
**Note that this is an examle and you should change it to match your IP address.**

If you use a Windows operating system, you should have imported your public and private keypair
into _Putty_ or other terminal program. Use the IP of your virtual machine as host, use _root_ as
username, and click _Connect_.

If there were no errors, and if your local firewalls allows making remote connections, you should now be logged in on your virtual machine, as _root_. 


## Powering off and removing your machine



[marketplace_step_1]:images/general-start/marketplace_step1.png