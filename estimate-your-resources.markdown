---
layout: default
---
## Quota estimation

When you come to use the HPC Cloud you do so in the context of a project. A project is set to solve a problem, defined as some goals that you want to achieve. You must also have a plan on how you think you are going to tackle the problem to achieve those goals. You can work together with several people in a project. And every project gets a quota assigned.

A quota is a budget that the users within a project can benefit from. It is set so that it gives an idea of the size of the project, and it involves:

* an amount of compute time, measured in core·hours
* an amount of storage space, measured in (multiples of) bytes
* a begin and start date within which you can operate in the HPC Cloud

In order to allocate a project, thus, we need to establish a quota for it. And we can only do so by knowing what you want to do. That is why it is important that you understand how to **estimate your needed quota**.

We always recommend that you have run several tests of your programs somewhere else (e.g.: your laptop) before you request [access to the HPC Cloud](https://www.surf.nl/en/services-and-products/hpc-cloud/access/index.html). It would be ideal if you could try running several representative (input) samples and with several different amounts of CPU cores. That way you can see (and know in advance):

* how long it takes to run a few input scenarios
* how the running time varies when you have more cores or more memory available
* how much space you need to store input, output and intermediate data

### Example
With these results in mind, we can help you estimate your project's quota. We have some rules of thumb. For example, if you see that your program does not really finish much faster when you add more processors, then do not create VMs with more processors. Say you found out that 4 cores is what your program really benefits from. Then, every hour that you have a VM **running** (that is regardless of whether you are doing anything useful or not within it), your quota will "tick" 4 core·hours. Now, say that running your program for a given (sample) input on your laptop with 4 cores took 7 hours, and let us assume that the processors on our HPC Cloud would require the same time as in your laptop. The amount of compute time your program would need would then be 7 hours × 4 cores = 28 core·hours. If you will need to run 100 of these tests you will then require 100 times that, therefore: 100 × 28 core·hours = 2800 core·hours. This could be your compute time quota.

Now, about storage space, let us say that your input data is very simple (a couple of kilobytes) and that your output is a something more substantial, like 100GB. If this output is not something you will have to further process on the HPC Cloud, there may be no need to keep more than a couple of these outputs at the same time. So your required storage space could be about 200GB or 250GB. But you also need to count the space that your operating system and your installed software require, say 20GB. Then your storage quota could be 270GB, which could be rounded off to 300GB.

The start and end dates from your quota are something you can tell us: when do you plan to start working on the HPC Cloud and when do you expect to have finished. An extension for accessing the HPC Cloud can be arranged upon request, including justification of the additional time or resources and an update of the work that has been done.
