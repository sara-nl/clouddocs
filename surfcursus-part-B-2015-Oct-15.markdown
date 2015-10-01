---
layout: default
---

⚠ **WARNING** under construction

# SURFcursus - part B

* [Hands-on part B](#hands-on) <br>
  * [3. Persistence](#3.-Persistence) <br>
  * [4. Scale-up to a multicore VM](#4.-Scale-up-to-a-multicore-VM) <br>
  * [5. Wrap up](#5.-Wrap-up) <br> 


### <a name="3.-Persistence"></a> 3. Persistence

Disk images can be "persistent" or not and you can switch that flag.

*What does "persistent" mean?*
- changes by the VM are copied back to the original disk image
- if a VM runs with a persistent disk, you cannot launch a second VM using that disk

*What does "non-persistent" mean?*
- changes by a VM are lost at shutdown and not copied back to the original disk image
- it possible to run multiple VMs using the same non-persistent disk

> **NOTE:**
>
> The *AppMarket* image we created was set to **non-persistent** by default.

#### Make your image persistent
* Go to *Images* tab under Virtual Resources and click on your *Cursus Image*
* Under the Information section, find the "Persistent" entry. It says "no".
* Switch the value to "yes".

#### Deploy a persistent VM
* Start your machine again. 
* Login and check your changes made during the previous run. *Are your files still there?* 

> During the previous run the VM's disk was "non-persistent".

#### Install & Run Mandelbrot

The disk image is now marked as **persistent**. This means that we can install our software or store data in the VM and make sure that everything will remain in the VM once it is shutdown and re-instantiated.

Let's install and run an example to investigate the HPC Cloud capabilities. The code was taken from [mandelbrot-rmi](https://code.google.com/p/mandelbrot-rmi/), a distributed Manderbrot renderer based on [Java RMI](https://en.wikipedia.org/wiki/Java_remote_method_invocation), with some small improvements.

>**NOTE:**
>
> For the rest of the tutorial we will omit `root@surfsara-Desktop:~#` prompt in the instructions, in order to allow you copy-paste the commands directly in your terminal.

* Login to the running VM again.
* First update your system:

```sh
apt-get update
apt-get upgrade
```

* Install *java* as it is required for running the example (optionally try `java -version` to verify that is it is missing):

```sh
apt-get install default-jre
```

* Download the example: 

```sh
wget https://doc.hpccloud.surfsara.nl/assets/mandelbrot-rmi-bin.tgz
```

**Run the example**

* Create a blank directory and extract the tar:

```sh
mkdir mandelbrot-rmi
cd mandelbrot-rmi
tar xvzf ../mandelbrot-rmi-bin.tgz
```

* Launch the first server that will pose as the RMI registry with an arbitrary name argument, e.g. _apple_:
  * Start a new local terminal and log in to your virtual machine, see [above](#login-to-the-vm).
  * run the following commands:

```sh
cd ~/mandelbrot-rmi
./startserver.sh apple
```

* Return to the first terminal window (connected to the VM with `ssh -X`), start a client and pass it the _apple_ server name:

```sh
cd ~/mandelbrot-rmi
./startclient.sh apple
``` 
  A window should pop up on your laptop displaying a full _mandelbrot set_.

* Interact with the display:

> **NOTE:**
>
>Left click will zoom in to the yellow rectangle.  
Right click will zoom out.  
Dragging will change the size of the rectangle.  

Client and server both log the time of the computation.

You can kill the client or servers anytime with _Ctrl+C_.

* Kill the client now.

* Launch additional servers with different names. 
Start the new servers and the client, all in different terminals:  

```sh
# new terminal, ssh to VM, then:
cd ~/mandelbrot-rmi
./startserver.sh banana
```

Repeat for _coconut_ or make up your own names.

* In the client window, start the client with the names of your running servers.

```sh
./startclient.sh apple banana coconut # or your names
```
Observe the performance when adding extra servers.

* Before moving to the next exercise, *remember to Shutdown your VM*.

### <a name="4.-Scale-up-to-a-multicore-VM"></a> 4. Scale-up to a multicore VM

In this section, we will run the same example on a four-core VM, using the exact same image, the *Cursus Image*.  

#### Edit the Template

The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your Virtual Machines (VMs) the form that you need them to have.

You can customise your VMs by editing the templates you instantiate the VMs from.

* In order to edit an existing template, under the Virtual Resources menu, choose the `Templates` item. 
* Click on the *Cursus Template* to edit. Extended information about that image will be displayed within two tabs: Info and Template.
* Above this extended information area, there are 3 buttons. One of them says Update. If you click there, you will be able to edit the template: this the *Wizard mode*.
* In the *General* tab edit the number of CPU and VCPU as:
  * CPU: **4**
  * VCPU: **4**
* Whenever you are finished customising your template, make sure you click on the green Update button so that your changes are actually saved. 

That was it. From now on you will get a 4-core VM running using the same *Cursus Image* (where the mandelbrot example is saved).

#### Run the example on the four-core VM

* Instantiate a VM from the updated template.
* Login to the VM. *Is your mandelbrot data there?*

> **NOTE:**
>Your VM's image was (and is) persistent.

* Run the [same example](#install-amp-run-mandelbrot) with a single server.
* Start a new terminal and connect to the VM. Type the following command:

```sh
ps -eo pid,psr,pcpu,args | sed -n -e '1p' -e '/java/p'
```
  This shows the running Java processes and the CPU number on which it runs (column `PSR`).
* Stop server(s) and client.
* Launch multiple servers on different CPUs:
  * Start new terminals as needed and run variations on the following command:

```sh
cd ~/mandelbrot-rmi
taskset -c 2 ./startserver.sh mango # replace '2' with the CPU number and 'mango' with your server name
```
* Start the client on a separate processor:

```sh
taskset -c 0 ./startclient.sh pineapple grape mango # use your server names. duh.
```

* Observe the performance. *What is the gain?*
### <a name="5.-Wrap-up"></a> 5. Wrap up

* Play around, make your checks and don't forget to [shut down](#first-shut-down) all the running VMs when you are finished.

>Remember: Your running VMs are consuming quota whether they are doing something useful or are idle.
