---
layout: default
---

# UvA workshop 2016-01-25 - OpenMP: calculate _pi_

> ## Warning: Under construction

This is an exercise in the Tutorial [UvA workshop 2016-01-25](UvAworkshop-2016-01-25).
**You should have completed (and understood)** [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA) and [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB) before trying this exercise.


a) Setting up a VM with `calculate _pi_` example

* Start a VM with 2 CPUs and a Linux distribution.
* Install the gcc compiler and gnu make if needed.
* Copy the example files to your VM from **here**
* Do not forget to shutdown your VM when finished.

b) Running the serial example

* Ther file `gridpi-serial.c` contains a simple workload (calculate pi) in a simple,
serial implementation. Have a look inside the file.
* Compile and run a few times.

c) Running the OpenMP simple version

* The file gridpi-mp-simple.c is a first stab at using OpenMP on gridpi-simple.c.
* Have a look at the differences in the code.

> **_Food for brain c:_**
>
> Compile and run a few times, observe the difference in performance. Can you explain?

(d) Running the OpenMP optimized version

* The file gridpi-mp-alt.c tries to optimize on gridpi-mp-simple.c,
* Have a look at the differences in the code.

> **_Food for brain d:_**
>
> Compile and run a few times, observe the difference in performance. Can you explain? 

(e) Running the OpenMP optimized alternative version

* The file gridpi-mp-reduction.c uses another approach to optimize on gridpi-mp-simple.c,
* Have a look at the differences in the code.
* Compile and run a few times, observe the difference in performance. Can you explain?

> **_Food for brain e1:_**
>
> Compile and run a few times, observe the difference in performance. Can you explain? 

> **_Food for brain e2:_**
>
> Compare the three implementations that use OpenMP again. Any insights?

> **_Food for brain e3:_**
>
> Replace your VM with one that has more cores (use the templates|new wizard).
> Play around with the parameters in the source files (e.g. POINTS_ON_AXIS).
> Does the performance scale for all of the implementations? Can you explain?

> **_Note:_**
> Do not forget to shutdown your VM.

