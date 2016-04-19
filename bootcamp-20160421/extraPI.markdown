---
layout: default
---

# SURF Research Boot Camp 2016-04-13  <br/> Extras - Calculating _&pi;_ 

<div style="float:right;max-width:205px;" markdown="1">
![SURF Academy logo](/images/surf_academy_logo.png)

<div style="max-width:150px;" markdown="1">
![SURFsara logo](/images/SURFsara_logo.png)
</div>
</div>

This is an exercise from the (extras) part of the Tutorial [SURF Research Boot Camp 2016-04-13](.).

In this advanced part of our HPC Cloud tutorial we ask you to play around with a **parallel processing** technique on a **shared-memory** system. For this puspose, we will be running a Monte Carlo simulation to calculate an approximation of the value of _&pi;_. 

>**NOTE:**
>
>You are now in the advanced section of the workshop. You have your laptop and an Internet connection. We expect you will be able to find out more on your own about things that we hardly/don't explain but which you think you need. For example, if we were you, at this point we would've already googled for several things: 
>
>1. Monte Carlo simulation
>1. Monte Carlo pi
>1. Parallel processing
>1. Shared-memory
>1. OpenMP cheatsheet
>
>If you are unable to find out enough on your own, please call any of the instructors for help :-).

One of the advantages of using an HPC System like the HPC Cloud is that you can run your program over multiple cores and multiple machines. That way, your compute work is spread among multiple processing items (cores) at the same time, which (hopefully) results in getting your results much sooner than when you run your program on a small computer.

We now propose 2 exercises so that you can see this effect. In the first exercise, you will run a program in a single thread, and see how long it takes. Then you will run it with more cores, and you can probably see that it takes less time. We recommend that you run each of the versions several times (e.g.: 10) and that you average the measured times.

### a) Setting up a VM for the exercise

* On the UI, create a 2-core `template` that will use your existing **Course Image**:
  * On the _Templates_ tab (under _<i class="fa fa-cloud"></i> Virtual Resources_), click on the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button to create a new `template`
  * Edit the _<i class="fa fa-laptop"></i> General_ tab: type in a meaningful Name e.g. **OpenMP setup**, type in **2 CPUs** and **2 VCPUs**, type in **4GB Memory** 
  * Edit the _<i class="fa fa-tasks"></i> Storage_ tab: for the _Disk 0_, choose the **Course Image** (from the table on the right of the screen) 
  * Edit the _<i class="fa fa-globe"></i> Network_ tab: for the _Interface 0_, choose the _Internet network_.  
  * Edit the _<i class="fa fa-exchange"></i> Input/Output_ tab: click on the _VNC_ radiobutton
  * Finally, click on the green *Create* button at the top of the screen

* Launch a VM from that `template`

* Install the gcc compiler and gnu make:

```sh
sudo apt-get install build-essential 
# Optionally verify gcc and GNU make installation and version
gcc -v  
make -v 
```

* Download the [code file](code/gridpi-mp.tar) to your VM and uncompress the file:

```sh
cd
wget https://doc.hpccloud.surfsara.nl/bootcamp-20160421/code/gridpi-mp.tar 
tar -xvf gridpi-mp.tar 
```

* Inspect what files are in the example directory:

```sh
cd gridpi-mp/
ls -l 
```

### b) Serial runs

* The code in file **`gridpi-serial.c`** calculates _&pi;_ in a simple, serial implementation. Have a look inside the file, e.g. `cat gridpi-serial.c`
* Compile the `gridpi-serial.c` program:

```sh
gcc -std=c99 -Wall -Werror -pedantic gridpi-serial.c -o gridpi-serial
```

* Run the serial program a few times:

```sh
./gridpi-serial
```

> **_Food for brain b1:_**
>
> * Can you make a batch of several runs (e.g.: 10) and calculate the average runtime and standard deviation?

### c) Running the OpenMP optimised alternative version

* The file **`gridpi-mp-reduction.c`** uses an approach to optimise on `gridpi-mp-simple.c`
* Have a look at the differences in the code.
* Compile the `gridpi-mp-reduction.c` program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-reduction.c -lm -o gridpi-mp-reduction
```

* Run a few times

```sh
./gridpi-mp-reduction
```

> **_Food for brain c1:_**
>
> * Can you make a batch of several runs (e.g.: 10) and calculate the average runtime and standard deviation?
> * How many threads are running?
> * Can you explain the differences in the code between this file and those of previous exercise b)? In particular:
>   * What runs in parallel? What not?
>   * Which variables are used where?

### d) More cores

* Replace your VM with one that has more cores (hint: make a new `template`). 
* Run some batches of exercise c) again. 

> **_Food for brain d1:_**
>
> * How do times with more cores compare to those before? <br/> (hint: make a table where each row is each exercise, one column is the average time and deviation you measured before and the second column is what you measured now)
> * Play around with the parameters in the source files (e.g. POINTS_ON_AXIS) <br/> (hint: add an extra column to the table for each parameter you change)
> * Does the performance scale for all of the implementations? Do you see any number where it ceases to make sense to scale? Can you explain?
> * Can you draw some curves (graphs) with the measurements you have gathered? How do they compare?

> **NOTE:**
> Do not forget to shutdown your VM when you are done with your performance tests.

### Next: Detach from work
You have completed the part of the tutorial where you experience scaling your compute capacity, of the Tutorial [SURF Research Boot Camp 2016-04-13](.). Please continue with part [Detach from work](extraDetachWork). 

>**NOTE:**
>
>Before you move to the next sections, remember to shut your VMs down.
