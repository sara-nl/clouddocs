---
layout: default
---

# TUDelft course 2016-04-13  <br/> Extras - Wave simulation with MPI

<div style="float:right;max-width:205px;" markdown="1">
![TUDelft logo](/images/TUDelft_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is an exercise from the (extras) part of the Tutorial [TUDelft course 2016-04-13](.).

In this advanced part of our HPC Cloud tutorial we ask you to play around with a **parallel processing** technique on a **message-passing** system. For this puspose, we will be running wave simulations using MPI. We will approximate solutions for the wave differential equation in 2D, by using numerical methods. 

>**NOTE:**
>
>You are now in the advanced section of the workshop. You have your laptop and an Internet connection. We expect you will be able to find out more on your own about things that we hardly/don't explain but which you think you need. For example, if we were you, at this point we would've already googled for several things: 
>
>1. Numerical methods
>1. Wave differential equation
>1. MPI cheatsheet

We provide you with an implementation of that simulation using `MPI`. You will be asked to perform multiple runs of each program, so that fluctuations caused by e.g. network can be middled out. The output of each program includes results for run time in _wall-clock_, _user_ and _system_ time.

### a) Setting up a VM for the exercise

We will be creating a 2-core VM for this exercise.

* On the UI, import an Ubuntu `appliance` from the AppMarket:
  * On the _appliances_ tab (under _<i class="fa fa-truck"></i> AppMarket_), import another copy of the **Ubuntu Desktop** `appliance`. Give the `image` and `template` the name: **mpi_wave**

* Edit the `image` to make it **persistent**.

* Edit the `template` to make it a 2-core one:
  * On the _Templates_ tab (under _<i class="fa fa-cloud"></i> AppMarket_), locate the **mpi_wave** `template` and click anywhere on its row (except the checkbox) to show its extended information. Then click the _Update_ button.
  * Edit the _<i class="fa fa-laptop"></i> General_ tab: type in a meaningful Name e.g. **MPI wave**, type in **2 CPUs** and **2 VCPUs**, type in **4GB Memory** 
  * Edit the _<i class="fa fa-tasks"></i> Storage_ tab: for the _Disk 0_, choose the **mpi_wave** (from the table on the right of the screen) 
  * Edit the _<i class="fa fa-globe"></i> Network_ tab: 
    * for the _NIC 0_, choose the _Internet network_
    * add a second `nic`; for this second `nic`, _NIC 1_, choose the _surfcursus.int_ network
  * Edit the _<i class="fa fa-exchange"></i> Input/Output_ tab: click on the _VNC_ radiobutton
  * Finally, click on the green *Update* button at the top of the screen

* Launch a VM from that `template`

* Install the gcc compiler and gnu make:

```sh
sudo apt-get install build-essential 
# Optionally verify gcc and GNU make installation and version
gcc -v  
make -v 
```

* Install other dependencies that our program requires:

```sh
sudo apt-get install libhdf5-serial-dev libopenmpi-dev openmpi-bin openmpi-common hdf5-tools ImageMagick gnuplot
```

### b) Preparing the program

* Download the [code file](code/waveeq.tar.gz) to your VM and uncompress the file:

```sh
wget https://github.com/sara-nl/clouddocs/raw/gh-pages/TUDelftcourse-20160413/code/waveeq.tar.gz 
tar -zxf waveeq.tar.gz 
```

* Inspect what files are in the example directory:

```sh
cd waveeq/
ls -l 
```

---

### c) Serial runs

* The code in file **`gridpi-serial.c`** calculates _&pi;_ in a simple,
serial implementation. Have a look inside the file, e.g. `cat gridpi-serial.c`
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
> * Can you make a batch of several runs (e.g.: 100) and calculate the average runtime and standard deviation?


### c) Simple OpenMP version

* The file **`gridpi-mp-simple.c`** is a first turn over `gridpi-simple.c` to use OpenMP.
* Have a look at the differences in the code.
* Compile the `gridpi-mp-simple.c` program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-simple.c -lm -o gridpi-mp-simple 
```

* Run a few times

```sh
./gridpi-mp-simple
```

> **_Food for brain c1:_**
>
> * Can you make a batch of several runs (e.g.: 100) and calculate the average runtime and standard deviation?
> * How many threads are running?
> * Can you explain the differences in the code between this file and that of the previous exercise? In particular:
>   * What runs in parallel? What not?
>   * Which variables are used where?

### d) Running the OpenMP optimised version

* The file **`gridpi-mp-alt.c`** tries to optimise on `gridpi-mp-simple.c`
* Have a look at the differences in the code.
* Compile the `gridpi-mp-alt.c` program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-alt.c -lm -o gridpi-mp-alt
```

* Run a few times

```sh
./gridpi-mp-alt
```

> **_Food for brain d1:_**
>
> * Can you make a batch of several runs (e.g.: 100) and calculate the average runtime and standard deviation?
> * How many threads are running?
> * Can you explain the differences in the code between this file and those of previous exercises b) and c)? In particular:
>   * What runs in parallel? What not?
>   * Which variables are used where?


### e) Running the OpenMP optimised alternative version

* The file **`gridpi-mp-reduction.c`** uses another approach to optimise on `gridpi-mp-simple.c`
* Have a look at the differences in the code.
* Compile the `gridpi-mp-reduction.c` program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-reduction.c -lm -o gridpi-mp-reduction
```

* Run a few times

```sh
./gridpi-mp-reduction
```

> **_Food for brain e1:_**
>
> * Can you make a batch of several runs (e.g.: 100) and calculate the average runtime and standard deviation?
> * How many threads are running?
> * Can you explain the differences in the code between this file and those of previous exercises b) and c)? In particular:
>   * What runs in parallel? What not?
>   * Which variables are used where?

### f) Running the OpenMP optimised alternative version

* Replace your VM with one that has more cores (hint: make a new `template`). 
* Run some batches of each of the exercises b), c) and d) again. 

> **_Food for brain e2:_**
>
>How do times with more cores compare to those before? <br/> (hint: make a table where each row is each exercise, one column is the average time and deviation you measured before and the second column is what you measured now)
> * Play around with the parameters in the source files (e.g. POINTS_ON_AXIS) <br/> (hint: add an extra column to the table for each parameter you change)
> * Does the performance scale for all of the implementations? Do you see any number where it ceases to make sense to scale? Can you explain?
> * Can you draw some curves (graphs) with the measurements you have gathered? How do they compare?

> **NOTE:**
> Do not forget to shutdown your VM when you are done with your performance tests.

 If you want more of the advanced exercises on the HPC Cloud, see [Extras](extras).
