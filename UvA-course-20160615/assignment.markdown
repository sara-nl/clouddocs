---
layout: default
---

# UvA course 2016-06-15 - Assignment

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is the Assignment section of the Tutorial [UvA course 2016-06-15](.). 

Read carefully the following questions and send your answers to: Nuno Ferreira <nuno.ferreira@surfsara.nl> **by 24th of June 2016**. 

## Exercise [OpenMP: calculating _&pi;_](OpenMP) 

### **Question 1** (2.5 points):

Create a VM with 2 CPUs and 4GB memory. Run the exercises:

- b) Serial runs,
- c) Simple OpenMP version,
- d) Running the OpenMP optimised version and
- e) Running the OpenMP optimised alternative version. 

Answer the folowing:

- Do you see significant differences for the *real* and *user* time between the solutions b), c), d) and e)? 
- Which parts of the code runs in parallel for each solution?
- Explain.

### **Question 2** (2.5 points):

Create a VM with 4 CPUs and 4GB memory. Run again the exercises:

- b) Serial runs,
- c) Simple OpenMP version,
- d) Running the OpenMP optimised version and
- e) Running the OpenMP optimised alternative version. 

Play around with the parameter POINTS_ON_AXIS in the source files. 
Explain your measurements in words or with a graph.

## Exercise [MPI: Wave equation](MPI)

### **Question 3** (2.5 points):

Create a VM with 2 CPUs and 4GB memory. Run the exercises:

- c) Serial runs,
- d) Prepare for multi-VM and
- e) Multicore version.

Do you see any significant improvement in the run time between c) and e)?
Explain the improvement (or lack thereof).

### **Question 4** (2.5 points):

Run the exercise:

- f) Scaling out to multiple VMs.

In this exercise you run the program over 2 VMs (1 master and 1 worker). 
Add 2 more workers with 2 CPUs and 4GB memory each. 
Then run the program among them. 

Answer the following:

- What do you need to do to make more workers available? 
- Does the run time reduce and is it worth parallelising a lot? Where do you think is the optimum? 
