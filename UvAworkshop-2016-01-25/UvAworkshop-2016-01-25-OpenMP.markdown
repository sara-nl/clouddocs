---
layout: default
---

# UvA workshop 2016-01-25 - OpenMP: calculate _pi_

This is an exercise in the Extras of the Tutorial [UvA workshop 2016-01-25](UvAworkshop-2016-01-25).
**You should have completed (and understood)** [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA) and [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB) before trying this exercise.

In this advanced part of our HPC Cloud tutorial we ask you to play around with a parallel processing technique (multithreading). For this puspose, we will use an implementation of _pi_ calculation using `OpenMP`. You will be asked to perform multiple runs of each program, so that fluctuations caused by e.g. network can be middled out. The output of each program includes results for run time in _wall-clock_, _user_ and _system_ time.

This exercise will let you use OpenMP, first with a serial implementation within a single multicore VM and then with diffrent parallel implementations. Please observe if the differences are significant or not for the scenarios below.

### a) Setting up a VM with `calculate _pi_` example

* On the UI, create a 2-core template that will use your existing `Course Image`:
  * On the Templates tab (under Virtual Resources), click on the green [+] button to create a new template
  * Edit the *General* tab: type in a meaningful Name e.g. **Openmp setup**, type in **2 CPUs** and **2 VCPUs**, type in **4GB Memory** 
  * Edit the *Storage* tab: for the Disk 0, choose the **Course Image** (from the table on the right of the screen) 
  * Edit the *Network* tab: for the Interface 0, choose the **internet network**.  
  * Edit the *Input/Output* tab: click on the **VNC** radiobutton
  * Finally, click on the green *Create* button at the top of the screen

* Launch a VM from that template (Openmp setup)

* Install the gcc compiler and gnu make:

```sh
sudo apt-get install build-essential 
# Optionally verify gcc and GNU make installation and version
gcc -v  
make -v 
```

* Download the example to your VM and uncompress the file:

```sh
wget https://doc.hpccloud.surfsara.nl/UvAworkshop-2016-01-25/exercises/gridpi-mp.tar 
tar -xvf gridpi-mp.tar 
```

* Inspect what files are in the example directory:

```sh
cd gridpi-mp/
ls -l 
```

### b) Simply running the serial example

* The file `gridpi-serial.c` contains a simple workload (calculate pi) in a simple,
serial implementation. Have a look inside the file, e.g. `cat gridpi-serial.c`
* Compile the gridpi-serial.c program:

```sh
gcc -std=c99 -Wall -Werror -pedantic gridpi-serial.c -o gridpi-serial
```

* Run the serial program a few times:

```sh
./gridpi-serial
```

### c) Running the OpenMP simple version

* The file gridpi-mp-simple.c is a first stab at using OpenMP on gridpi-simple.c
* Have a look at the differences in the code.
* Compile the gridpi-mp-simple.c program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-simple.c -lm -o gridpi-mp-simple 
```

* Run a few times

```sh
./gridpi-mp-simple
```

> **_Food for brain_**
>
> Observe the difference in performance compared to exercise b). Can you explain?

### d) Running the OpenMP optimized version

* The file gridpi-mp-alt.c tries to optimize on gridpi-mp-simple.c
* Have a look at the differences in the code.
* Compile the gridpi-mp-alt.c program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-alt.c -lm -o gridpi-mp-alt
```

* Run a few times

```sh
./gridpi-mp-alt
```

> **_Food for brain_**
>
> Observe the difference in performance compared to exercise b) and c). Can you explain?

### e) Running the OpenMP optimized alternative version

* The file gridpi-mp-reduction.c uses another approach to optimize on gridpi-mp-simple.c
* Have a look at the differences in the code.
* Compile the gridpi-mp-reduction.c program:

```sh
gcc -std=c99 -Wall -Werror -pedantic -fopenmp gridpi-mp-reduction.c -lm -o gridpi-mp-reduction
```

* Run a few times

```sh
./gridpi-mp-reduction
```

> **_Food for brain_**
>
> Compare the three implementations that use OpenMP again. Any insights?
>
> Replace your VM with one that has more cores (use the `Templates`).
> Play around with the parameters in the source files (e.g. POINTS_ON_AXIS).
> Does the performance scale for all of the implementations? Can you explain?

> **Note:**
> Do not forget to shutdown your VM when you are done with your performance tests.

 If you want more of the advanced exercises on the HPC Cloud, see [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras).
