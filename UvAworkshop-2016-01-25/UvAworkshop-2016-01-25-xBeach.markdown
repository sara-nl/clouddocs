---
layout: default
---

# UvA workshop 2016-01-25 - MPI: xBeach

This is an exercise in the Extras of Tutorial [UvA workshop 2016-01-25](UvAworkshop-2016-01-25).
**You should have completed (and understood)** [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA) and [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB) before trying this exercise.

<div style="float:right;" markdown="1">

![XBeach logo](/images/XBeach_logo.png)

</div>

In this advanced part of our HPC Cloud tutorial we ask you to play around with a parallel processing technique (multiprocessing): message-passing (MPI). For this puspose, we will use a tool from the water management field, called `xBeach`. In particular, we have prepared few exercises for you to run XBeach with multiple processors over multiple VMs.

## Running a real tool in parallel: XBeach

From the [XBeach website](http://oss.deltares.nl/web/xbeach/):

> XBeach is a two-dimensional model for wave propagation, long waves and mean flow, sediment transport and morphological changes of the nearshore area, beaches, dunes and backbarrier during storms. It is written largely in the FORTRAN programming language, and it has built-in MPI capabilities. 

This exercise will let you use XBeach, see it run in parallel, first with several processors within a single VM and then over multiple VMs.

### a) Setting up a VM with XBeach

We have prepared a cloud image where we have compiled and installed XBeach for a user called `clouder` (short for CLOUD usER). You can find the image on your images list. It's called `xbeach`.

**Exercise a1:** Make a 2-core VM out of the provided XBeach image.

* On the UI, create a 2-core template that will use the provided XBeach image:
  * On the Templates tab (under Virtual Resources), click on the green [+] button to create a new template
  * Edit the *General* tab: type in a meaningful Name e.g. **xbeach setup**, type in **2 CPUs**, type in **4GB Memory** 
  * Edit the *Storage* tab: for the Disk 0, choose the **xbeach** (from the table on the right of the screen) 
  * Edit the *Network* tab: for the Interface 0, choose the **internet network**. Click on the + Add another nic button (that will make a new Interface 1), and then choose **demouva.int** 
  * Edit the *Input/Output* tab: click on the **VNC** radiobutton
  * Finally, click on the green *Create* button at the top of the screen

* Launch a VM from that template (xbeach setup)

* Connect to the VNC console so that you can follow the first-run wizard that the image is configured to run upon first start-up. It will ask you to set up a password for users `root` and `clouder`. Make sure you remember the passwords you set up.

* Connect via SSH to the VM with user `clouder` as `ssh clouder@145.100.58.XYZ` (this image has SSH root access disabled) so that you can work more comfortably. Can you see where XBeach is installed?

### b) Simply running XBeach

**Exercise b1:** Simply run XBeach in a VM

* On `clouder`'s home directory, you have a directory called `w`, within it another called `xbeach`, and within it another called `examples`. We found these examples on the source code distribution of XBeach. You can read the readme.txt file there to find some description of the different examples.

* Let us focus on the base example. Change directory to it:

```bash
cd ~/w/xbeach/examples/base
```
  
* Run the command `xbeach` there:

```bash
xbeach
```
  
> **_Food for brain b1:_**
>
> * How many processes is XBeach using? Where can you see that? (hint, look at the beginning of the output of XBeach, where a lot of information about the run is printed)
* XBeach requires that you have a file parameters.txt on the directory where you run the xbeach command, with instructions it will use for input, output, etc. What information is in the file? 
* For future reference, you should write down somewhere how long it takes to run.

### c) Running XBeach with multiple cores

MPI (Message-Passing Interface) is a parallel programming paradigm in which multiple OS processes are able to communicate among themselves to cooperatively perform a computation. Your program must be able to support this paradigm in order to benefit from it, of course; and it just so happens that XBeach does. Because you created a VM with 2 cores in section a), you can benefit from allowing two independent processes to work on their own share of the problem.

We have installed OpenMPI (one MPI implementation; others exist, such as MPItch) on the VM. We can leverage the power of MPI to allow XBeach to work with 2 processes. MPI provides a program which allows to run another program (in this case, XBeach) with multiple MPI processes; is called `mpirun`. Check the man pages for it: `man mpirun`. Have a look at the different flags (options) it can take. How can you tell `mpirun` which program to run? And how can you tell the amount of processes it must create?

**Exercise c1:** Run XBeach with 2 processes in the previous VM

* Make sure you are at the **`base`** example directory:
  
```sh
cd ~/w/xbeach/examples/base
```

* Run XBeach via `mpirun` with 2 processes:

```sh
mpirun -np 2 xbeach
```

> **_Food for brain c1:_**
>
> * How many processes is XBeach using? How can you make sure you are running 2 processes and not any more or any less? Where can you see that? (hint: look at the beginning of the output of XBeach, and also, on a different terminal, see what the command `top` can tell you; you may want to look at the man pages for `top`, like: `man top`)
* How long does it take to run the  example? And in the previous exercise? Does it take more, less, or about the same time when you use 1 more process?

**Exercise c2:** Run XBeach with 4 and 6 processes in the same VM

* Run XBeach via `mpirun` with 4 processes:

```sh
mpirun -np 4 xbeach
```

* Run XBeach via `mpirun` with 6 processes:

```sh
mpirun -np 6 xbeach
```

> **_Food for brain c2:_**
>
> * How about running the example with more processes than cores are available in the VM? Does it overall take more, less or about the same time as during the 1 or 2-core runs?
* Can you explain the running time differences?
* Can you make a (mental) picture of how the different processes are working on the input data and communicating among themselves?
* Do you think that how the program we are running (in this case, XBeach) is made (written, compiled) affects how better it gets when you add more processes to fulfill the task? And the input data, does it influence that?

### d) Running XBeach with multiple cores among multiple VMs

MPI is able to communicate within processes that may physically by running on different (virtual) machines. We are going to make this happen now.

There is a fair amount of configuration that needs to happen among all the machines involved in cooperating for running MPI jobs. We have prepared a couple of scripts that you can use for that, and you can find those on `clouder`'s following directory: `~/w/ssh`

#### Master-workers concept

A typical way of considering a cluster is to have a **master** node (or host) where you can externally log into and launch the programs, along with a set of **worker** nodes that the master knows about and where it delegates computing workload.

In our exercises, we will consider one master and one worker node. Both will compute (so the master will not be just a passive node, but it will also contribute to the output). We will not consider any job-submitting queues, but rather, we will let MPI communicate over SSH. For that, both the master and the worker need to be able to SSH to each-other without requiring a password (a.k.a. **passwordless ssh**). We provide you with a script that you can run in each of the machines (in this case just one master an one worker) to do this interactively in a, hopefully, easy way.

To make it easier, all nodes where MPI will run a program must have that program installed the same way in the same path. Because we only provide you with one image with all installed, that is already done.

Also, usually the worker nodes are protected (inaccessible) from the outside world, so you can only reach them normally from within the internal network. We will simulate this as well. We have provided a script to configure the master and another for the worker node, which will change the hostname and also shutdown the external network interface on the worker node.

#### Launch a 2-core worker VM
**Exercise d1:** Launch another VM that will become a worker

* On the UI, create a 2-core template that will use the provided XBeach image, and connect it to both the internet and your private project's internal network.

* Launch a VM from that template

* Connect to the VNC console so that you can follow the first-run wizard that the image is configured to run upon first start-up. It will ask you to set up a password for users `root` and `clouder`. Make sure you remember the passwords you set up.

#### Configure master and worker VMs
**Exercise d2:** Configure the **master** node

* Make sure you have an SSH connection to the VM we have been playing with so far (so, not the one you just created). This will become the master from now on.

* Write down the **internal** ip address of the master node.

* Run our configuration script to turn the VM into the master:
 
```sh
cd ~/w/ssh && ./makeme_master.sh
```

> **_Food for brain d2:_**
>
> * What has just happened!?

**Exercise d3:** Configure the **worker** node

* Open a VNC console to the second VM you launched (the worker-to-be).

* Write down the **internal** ip address of the worker node.

* Become root

```sh
su -
```

* Run our configuration script to make the VM the worker. You will need the master's **INTERNAL** ip address

```sh
cd /home/clouder/w/ssh && ./makeme_worker.sh 1 <master_internal_ip>
```

> **_Food for brain d3:_**
>
> * Why do we recommend you to use the VNC console on this VM?
* What has just happened!? Why do you need to become root? Why does the script require those parameters?

**Exercise d4:** Configure passwordless-ssh between the pair of VMs

* **On the master**, make sure you are logged in as `clouder`. Run the script we provide you with to enable passwordless-ssh, so that the `clouder` user on the worker node can connect to the master node without requiring a password. You will need to type in the **INTERNAL** ip address of the worker: 

```sh
cd ~/w/ssh && ./set_passwordless_ssh.sh <worker_internal_ip>
```

* **On the worker**, make sure you are logged in as `clouder`. Run the script we provide you with to enable passwordless-ssh, so that the `clouder` user on the master node can connect to the worker node without requiring a password. You will need to type in the **INTERNAL** ip address of the master: 

```sh
cd ~/w/ssh && ./set_passwordless_ssh.sh <master_internal_ip>
```

* **On the master**, try to SSH to the worker's internal ip address. Does it require a password? If it does, repeat the first step of this exercise.

* **On the worker**, try to SSH to the master's internal ip address. Does it require a password? If it does, repate the second step of this exercise.

**Exercise d5:** Configure the firewall

MPI needs to communicate through the network between master and worker. They are both running a firewall. To avoid problems and because this is just a test scenario, we will trust all traffic coming from our **internal** interfaces.

* **On the master**, make sure you are logged in as `root`: 

```sh
su -
```

* **On the master**, Trust the internal interface: 

```sh
firewall-cmd --zone=trusted --change-interface=eth1
```

* **On the worker**, make sure you are logged in as `root`: 

```sh
su -
```

* **On the worker**, Trust the internal interface: 

```sh
firewall-cmd --zone=trusted --change-interface=eth1
```

**Exercise d6:** Run XBeach over master and worker

* **On the master**, make sure you are logged in as `clouder`. Change directory to the `base` example.

* **On the master**, run XBeach with 4 processors over the 2 nodes (pay attention to the comma separating the master and the worker's ip addresses):

```sh
mpirun -np 4 -H <master_INTERNAL_ip>,<worker_INTERNAL_ip> xbeach
```

> **_Food for brain d6:_**
>
> * How long does it take to run the same example you run on a the previous exercises? Does it take more, less, or about the same as before?

### d) BONUS _food for brain_

This section is meant as extra questions that we thought would be nice for you to investigate, and we invite you to do/think about them even after the workshop is finished.

**Bonus 1:** What do you need to do to make more workers available? Is our image enough? Go ahead: try to have 2 workers of 1 core each. Run XBeach among them. Does the run time of the example reduce? And if you have 2 workers, 2 cores each? And 3 workers, 2 cores each? And... Is it worth parallelising a lot?

**Bonus 2:** We have configured everything regarding MPI for you. How can you install it yourself? What do you need? Is it available for your favourite operating system? Go ahead and install it.

**Bonus 3:** It can become a problem when you have to copy and install your program "everywhere" in the same place. This can be alleviated by sharing your `/home` folder via NFS. Can you set that up?

**Bonus 4:** We have downloaded the source code of XBeach, compiled it, and installed it. Can you do that yourself as well?

**Bonus 5:** Having to dowload, compile yourself the source code of the tool you need, and install it, is a very common workflow. Do you have a tool in this situation? Can it benefit from MPI? Please, let us know. Can you successfully get it running? Can you parallelise it?

**Bonus 6:** Using SSH might be a way to go along, but when you have multiple things to run at a time, ensuring users' access, passwordless permissions... There exist cluster-building tools based on job queues, like Sun (now Oracle) Grid Engine, Torque, etc. Can you find out more? Can you set it up?

**Bonus 7:** MPI is an implementation of a technique for parallelising computations. Another common technique is _shared memory_. One implementation for that technique is OpenMP. You can read more about it at their website: http://openmp.org/wp/. 

  * Can you set up a VM and run a program that benefits from OpenMP? See _calculate pi_ example in [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras).
  * Does it make any sense to mix MPI and OpenMP? Are OpenMP-enabled MPI processes the same as MPI-enabled OpenMP programs?

 If you want more of the advanced exercises on the HPC Cloud, see [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras).
