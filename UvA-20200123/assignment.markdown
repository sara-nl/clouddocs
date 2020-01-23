---
layout: default
---

# UvA HPC course 2020-01-23 - Assignment

<div style="float:right;max-width:205px;" markdown="1">
<img alt="UvA logo" src="{{relative}}images/UvA-logo.png" />
</div>
<div style="float:right;max-width:205px;" markdown="1">
<img alt="SURFsara logo" src="{{relative}}images/SURFsara_logo.png" />
</div>


The following exercises are the assignment to score points on the HPC Cloud session. After you have attended the presentations and followed the hands-on tutorial (including the Extras), you understand all the concepts that will allow you to propose valid solutions to the exercises. You can contact your facilitators if you have any questions.

> **NOTE:**  
> Access to the HPC Cloud User Interface will remain available for one week after the date of the HPC Cloud session. The assignment needs to be delivered by then too.

## General description of the exercise

[Baloo](https://en.wikipedia.org/wiki/TaleSpin) always keeps a sharp weather eye open for improving his adventure possibilities. He has spotted a possibility to improve on-time delivery by looking into some historical airplane data.

He is now convinced that Principal Component Analysis is the key to his new enterprise.

Keeping himself busy in the cockpit, he has called you for help on the ground to crunch some data and provide some recommendations. Here is the telegram he wrote to you:

> ### Telegram:
>
> Use data from [here](https://www.transtats.bts.gov/DL_SelectFields.asp?DB_Short_Name=On-Time&Table_ID=236) STOP
>
> Run PCA STOP 
>
> Recommend STOP

## Your assignment:

<div style="float:right;max-width:205px;margin:5px;" markdown="1">
![delay-no-more](../images/Delay_No_More.jpg)
</div>

Deliver recommendations fast!

Imagine that, browsing the Internet, you get your hands on a compiled program called `pca_on_planes`, which follows exactly Baloo's indications: it takes the dataset _csv_ file and a list of column numbers to analyse as inputs, and it provides each column's contribution to the PCA of the selected columns as outputs. 

Describe a system, using the HPC Cloud, that will allow you to find the best contributing set of columns using a naïve PCA approach distributed among 1-core Virtual Machines, such that:

 * A master machine starts the calculation: it is responsible for starting PCA analysis and delivering the best set of columns as an answer
 * The master is aware of an amount, _W_, of worker machines
 * The master divides work among _W_ workers; each worker should be kept equally busy as the rest as long as there is work to do
 * A worker accepts an order from the master to:
   * run the `pca_on_planes` program. Which dataset and columns to work with are given to him by the master
   * deliver the results of PCA back to the master
 * The master retrieves all these individual PCA's numbers back from the workers
 * The master decides the best set of columns based on all the results from the workers 
 * All workers are completely independent from one another; they can work in parallel, at their own pace, in their own time

We split the assignment in different exercises to guide you through the process. 

### Marks:

Leaving the bonus exercises aside:

* we will compute your final mark by grading each of the exercises and adding all these marks together
* all exercises are equally complex, so they all contribute equally to the final mark
* we do not expect that you take more than a couple of hours to complete the exercises (drawing can take a bit longer)

If you answer all exercises (except for the bonus) correctly, then you will get the maximum grade that you can get. We will value creative and smart solutions.

The bonus exercises allow you to score additional points, to complement the rest of the exercises. If you provide nice solutions, we will give you credits when we use them as examples (if you allow us to).

## Exercise 1

Explain to Baloo what your idea is: tell him which features of the HPC Cloud you are going to use to tackle his problem. Tell him how beautiful your answer is because... do you need to change the `pca_on_planes` program?

## Exercise 2

Baloo's telegram is rather sparing with words, and you like pictures. Draw a sketch that Baloo can understand, which illustrates what you came up with in the previous exercise. 

>**Hints:**
>
>At least, you should be able to draw some boxes for the master and the workers, depicting how they communicate and where they live. You can use a [UML Component diagram](https://en.wikipedia.org/wiki/Component_diagram) and/or a [UML Deployment diagram](https://en.wikipedia.org/wiki/Deployment_diagram), for example.

## Exercise 3

Sketch in [pseudocode](https://en.wikipedia.org/wiki/Pseudocode) what you think the programs look like: 

* a) the master 
* b) the worker

## Exercise 4

Imagine that you are given a program that does the master's work, and the `pca_on_planes` program for the worker. Also, imagine that you have access to the same scripts `makeme_master.sh` and `makeme_worker.sh` that you used in one of the Extras exercises.

Write down the relevant steps that you must follow in the HPC Cloud UI to run those programs with 1 master and 3 workers. 

>**Note:**
>
> We assume all VMs use only 1 core and 1GB of RAM, so you do not need to give details on how you configure the Templates. 

## Exercise 5

Having to create all workers by hand is very tedious. You are so happy that you can show Baloo how to let the master create the workers on demand!!!

Thus, for a solution where the master will create the workers on demand (the master now receives the amount of workers, _W_, as an extra parameter):

* a) What extra components from the HPC Cloud do you need to let the master create the workers?
* b) Do the same as in exercise 3: write pseudocode for what the master looks like. Does the worker change? Think of releasing resources when the computation is finished!
* c) Do the same as in exercise 4: write the relevant steps that you must follow in the UI to run the new version of the master (yes, assume again that you get a program with this version of the master's work) and workers; again, 1 master and 3 workers

## Exercise 6 - Bonus

Implement a solution for the master and the worker according to the original description (thus, without the master creating the workers). Send us the code with comments on what you did.

>**Hints:**
>
> * You may be able to reuse the code for calculating PCA for the serial version that you get from the PCA exercise in the Extras, and both the configuring scripts for the master-workers configuration from the MPI exercise.
> * Some useful information: you can run a command on a remote machine using the `ssh` command, as in: `ssh <username>@<remote-IP> '<command>'` (do NOT write the less-than and greater-than signs from that previous line)

## Exercise 7 - Bonus

Implement a solution where the master creates (and releases) workers.
