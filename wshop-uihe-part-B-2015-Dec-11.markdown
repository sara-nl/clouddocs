---
layout: default
---

⚠ **WARNING** under construction

>**NOTE:**
>
> This is the **second** (and advanced) part of the [UNESCO-IHE tutorial](wshop-uihe-2015-12-11) about the HPC Cloud. 
>
> These exercises require basic knowledge of the HPC Cloud that you can get if you have completed and understood the [**first** part](wshop-uihe-part-A-2015-Dec-11). Please follow it before attempting this one.

In this advanced part of our HPC Cloud tutorial we ask you to play around with a parallel processing technique (multiprocessing): message-passing (MPI). For this UNESCO-IHE tutorial, we also want to give you a taste of how tools that you can use in the water management field can be used on the HPC Cloud. In particular, we have prepared an exercise for you to run XBeach with multiple processors over multiple VMs.

## Running a real tool in parallel: XBeach

From the [XBeach website](http://oss.deltares.nl/web/xbeach/):
> XBeach is a two-dimensional model for wave propagation, long waves and mean flow, sediment transport and morphological changes of the nearshore area, beaches, dunes and backbarrier during storms.

Several of your colleagues have repeatedly mentioned to SURFsara that they are using it for their research/work projects, so we figure it is a rather commonplace tool in your field. It is written largely in the FORTRAN programming language, and it has built-in MPI capabilities. This exercise will let you use XBeach, see it run in parallel, first with several processors within a single VM and then over multiple VMs.

> **NOTE:**
>
>Your tutorial facilitators today are no experts on the tool itself. We do not know how to interpret the inputs or the results (we do not even know if the results are correct!). We will be happy to hear feedback from you on this matter ;-).
Hopefully, you will be able to run it successfully with all the knowledge you have gathered so far, and see
that, at least for a reduced number of processors, when you add more of them it tends to takes less to solve the problem.

### a) Setting up a VM with XBeach

We have prepared a cloud image (from now on simply _an image_) where we have compiled and installed XBeach for a user called `clouder` (short for CLOUD usER). You can find the image on your images list. It's called `xbeach_centos_7`.

**Exercise a1:** Make a 2-core VM out of the provided XBeach image.
  1. Create a 2-core template that will use the provided XBeach image, and connect it to both the internet and your private project's internal network.
  2. Launch a VM from that template
  3. Connect to the VNC console so that you can follow the first-run wizard that the image is configured to run upon first start-up. It will ask you to set up a password for users `root` and `clouder`. Make sure you remember the passwords you set up.
  4. Connect via SSH to the VM with user `clouder` (this image has SSH root access disabled) so that you can work more comfortably. Can you see where XBeach is installed?

### b) Simply running XBeach

**Exercise b1:** Simply run XBeach in a VM
  1. On `clouder`'s home directory, you have a directory called `w`, within it another called `xbeach`, and within it another called `examples`. We found these examples on the source code distribution of XBeach. You can read the readme.txt file there to find some description of the different examples.
  2. Let us focus on the base example. Change directory to it:
  
  ```sh
  cd ~/w/xbeach/examples/base
  ```
  3. Run the command `xbeach` there:
  
  ```sh
  xbeach
  ```
  
> **_Food for brain b1:_**
>
> * How many processes is XBeach using? Where can you see that? (hint, look at the beginning of the output of XBeach, where a lot of information about the run is printed)
* XBeach requires that you have a file parameters.txt on the directory where you run the xbeach command, with instructions it will use for input, output, etc. (look for the user manual and search within it).
* For future reference, you should write down somewhere how long it takes to run.

### c) Running XBeach with multiple cores

MPI (Message-Passing Interface) is a parallel programming paradigm in which multiple OS processes are able to communicate among themselves to cooperatively perform a computation. If your program it to benefit from this paradigm, it must be able to support it, of course; and it just so happens that XBeach does. Because you created a VM with 2 cores in section a), you can benefit from allowing two independent processes to work on their own share of the problem.

We have installed OpenMPI (one MPI implementation; others exist, such as MPItch) on the VM. We can leverage the power of MPI to allow XBeach to work with 2 processes. MPI provides a program which allows to run another program (in this case, XBeach) with multiple MPI processes; is called `mpirun`. Check the man pages for it: `man mpirun`. Have a look at the different flags (options) it can take. How can you tell `mpirun` which program to run? And how can you tell the amount of processes it must create?

**Exercise c1:** Run XBeach with 2 processes in the previous VM
  1. Make sure you are at the **`base`** example directory:
  
  ```sh
  cd ~/w/xbeach/examples/base
  ```
  3. Run XBeach via `mpirun` with 2 processes:
  
  ```sh
  mpirun -np 2 xbeach
  ```

> **_Food for brain c1:_**
>
> * How many processes is XBeach using? How can you make sure you are running 2 processes and not any more or any less? Where can you see that? (hint: look at the beginning of the output of XBeach, and also, on a different terminal, see what the command `top` can tell you; you may want to look at the man pages for `top`, like: `man top`)
* How long does it take to run the  example? And in the previous exercise? Does it take more, less, or about the same time when you use 1 more process?

**Exercise c2:** Run XBeach with 4 and 6 processes in the same VM
  1. Run XBeach via `mpirun` with 4 processes:
  
  ```sh
  mpirun -np 4 xbeach
  ```
  
  2. Run XBeach via `mpirun` with 6 processes:
  
  ```sh
  mpirun -np 6 xbeach
  ```

> **_Food for brain c2:_**
>
> * How about running the example with more processes than cores are available in the VM? Does it overall take more, less or about the same time as during the 1 or 2-core runs?
* Can you explain the running time differences?
* Can you make a (mental) picture of how the different processes are working on the input data and communicating among themselves?
* Do you think that how the program we are running (in this case, XBeach) is made (written, compiled) affects how better it gets when you add more processes to fulfill the task? And the input data, does it influence that?


