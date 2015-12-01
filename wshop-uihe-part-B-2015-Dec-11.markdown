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
  
> **_Food for brain:_**
>
> * How many processes is XBeach using? Where can you see that? (hint, look at the beginning of the output of XBeach, where a lot of information about the run is printed)
* XBeach requires that you have a file parameters.txt on the directory where you run the xbeach command, with instructions it will use for input, output, etc. (look for the user manual and search within it).
* For future reference, you should write down somewhere how long it takes to run.
