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

We provide you with an implementation of that simulation using `MPI`. You will be asked to perform multiple runs of each program, so that fluctuations caused by e.g. network can be middled out. 

>**Tip:**
>
>We recommend you have a look at the end of this page for some hints on how to help measuring time, running a program multiple times and computing an average time out of multiple measurements.

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
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
sudo apt-get update

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

* Compile the program:

```sh
make wave4
```

### c) Serial runs

The code in file **`wave4.c`** is where the main routine is. It uses functionality from other `.c` and `.h` files, but the main loop is there. The main loop understands how many MPI processes must be created and it divides the space among them to distribute work.

When the program runs, it writes output to file `wave4.h5` in [HDF5](https://www.hdfgroup.org/HDF5/) format. 

* In the main routine you can find the main variables it uses:
  * `c` is the wave propagation speed
  * `zeta` is the damping coefficient
  * `m` and `n` are the spatial dimmensions; you can play with these to make a bigger/smaller surface
  * `nt` is the temporal dimmension; you can play with this to make a longer/shorter time simulation
  * `nt_i` is the _checkpoint_ interval: output will be written to file every so many `nt_i` time iterations. 

We invite you to explore the code to get familiar with it. If you change any of these values, please remember to compile the program again for the changes to make effect.

You can run the program in a single process with the following command:

```sh
./wave4
```

You can use the provided program `h5anim` to read from the output file of the `wave4` program (remember, called `wave4.h5`) and create an animated `wave4-anim.gif`. You do it so:

```sh
./h5anim wave4.h5 u
```

Then you can use any browser to view the animated gif, or install program `gifview` (with `sudo apt-get install gifsicle`) and see it so: `gifview --animate wave4-anim.gif`.

> **_Food for brain c1:_**
>
> * Can you make a batch of several runs (e.g.: 20) and calculate the average runtime and standard deviation?

d) Shut the VM down and prepare for multi-VM

We made the `image` persistent so that when shutting the VM down, changes would be saved and kept for the next run. But changes are only saved when you actually shut the VM down gracefully. Do so now **from the UI**, by shutting the VM down just as you learnt on [Part A](partA).

* Refesh the list of VMs (remember, the _<i class="fa fa-refresh"></i>_ icon) while you see your VM go through the different states: SHUTDOWN, EPILOG..., until it disappears.

We will want to show how to **scale out** later, and that will involve multiple VMs, as explained during the presentation. In order for multiple VMs to be able to run out of the same `image`, this must be non-persistent (as explained in [Part B](partB)). Let's do that now:

* Go to the _Images_ tab, open the extended information for the **mpi_wave** `image` and switch the value for field _Persistent_ to **no**.

>**IMPORTANT**
>
>Now that the `image` is non-persistent, no changes will be saved when you shut down a VM using it. If you require so at some point, you will have to make it persistent first!

### e) Multicore version

Because the program is ready for MPI, you can use `mpirun` to use multiple cores. 

**Exercse e1:** Try it now with 2 cores, like this:

* Start a new VM out of the **mpi_wave** `template`. 
* SSH into that VM. Remember to use the `-X` parameter for the `ssh` program (and before the `ubuntu` user name) so that you can visualise the .gif. Like: `ssh -X ubuntu@145.100...`. 
* Go to the `waveeq` directory: `cd waveeq`

You can now run the program with 2 processes like:

```sh
mpirun -n 2 ./wave4
```

> **_Food for brain e1:_**
>
> * Can you make a batch of several runs (e.g.: 20) and calculate the average runtime and standard deviation?
> * How many processes are running? (hint: use the `top` command on a different terminal)
> * Do you see any significant time improvement as compared to running it with one process? Can you explain the improvement (or lack thereof)?

**Exercise e2:** You can try to run now the program with more processes. For example, with 4:

```sh
mpirun -n 4 ./wave4
```

> **_Food for brain e2:_**
>
> * Can you make a batch of several runs (e.g.: 20) and calculate the average runtime and standard deviation?
> * How many processes are running? (hint: use the `top` command on a different terminal)
> * Do you see any significant time improvement as compared to the previous runs? Can you explain the improvement (or lack thereof)?

**Exercise e3:** Try now running the program with a couple more configurations, like 6 processors or 8. Any improvement in time?

### f) Scaling out to multiple VMs 

---

> **NOTE:**
> Do not forget to shutdown your VM when you are done with your performance tests.

 If you want more of the advanced exercises on the HPC Cloud, see [Extras](extras).


### Time measurement

In order to help measuring times, we can give you the hints in this section.

* You can use the `time` facility from `bash` to measure the time it takes to run a command, like: `time command`. It will return 3 lines via stderr with: overall time and the subparts for user time and system time. 

* The plain format for the output of `time` is not very helpful for operating with the values; you can redefine it with the environment variable `TIMEFORMAT`. The value `%R` asks `time` to return the amount of seconds and milliseconds; that is much easier to operate with.

* Given a set of lines containing a number each, the following one-liner will compute the average and deviation, and print them in 2 lines: `awk '{sum += $1; sumsq+=$1*$1 } END {print "   avg " (sum/NR) "\nstddev " sqrt(sumsq/NR - (sum/NR) * (sum/NR))}'`. 
  * For example, if you have a file called `my_nums.txt` containing one number per line, you can compute average and standard deviation for those numbers like: `cat my_nums.txt | awk '{sum += $1; sumsq+=$1*$1 } END {print "   avg " (sum/NR) "\nstddev " sqrt(sumsq/NR - (sum/NR) * (sum/NR))}`

* You can run and measure a same command a given number of times by using a _for-loop_, like: `for run in {1..3}; do time COMMAND_HERE; done 2>&1`

* All together, an example for running a our `wave4` program 20 times with 2 processors and then compute the average running time, using an intermediate output-collection file (while, at the same time, showing progress on screen), could be:

```sh
TIMEFORMAT=$'elapsed %R' bash -c 'for i in {1..20}; do echo [iter $i]; time mpirun -n 2 ./wave4; done 2>&1 | tee times_n2.txt'

cat times_n2.txt | grep ^elapsed | sed -e s/.*\ // | awk '{sum += $1; sumsq+=$1*$1 } END {print "   avg " (sum/NR) "\nstddev " sqrt(sumsq/NR - (sum/NR) * (sum/NR))}'
```

An explanation on the previous code listing:

* The first line runs the command in a loop and takes all output into the `times_n2.txt` file. Every iteration, the `time` command outputs a line like `elapsed ...`.

* The second line reads the `times_n2.txt` file; it filters all lines to take only those that start with `elapsed`. For each of these lines, `sed` takes only the number after the space. Finally, `awk` processes all these numbers and, when it is done, it prints out the average and standard deviation.
