---
layout: default
---

# UNESCO-IHE symposium 2017-03-30&31 - Assignment

<div style="float:right;max-width:205px;" markdown="1">
![UNESCO-IHE logo](/images/Unesco-Ihe-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

The following exercises are the assignment to score points on the HPC Cloud session. After you have attended the presentations and followed the hands-on tutorial (including the extras), you understand all the concepts that will allow you to propose valid solutions to the exercises. You can contact your facilitators if you have any questions.

> **NOTE:**  
> Access to the HPC Cloud User Interface will remain available until the **10th Feb. 2017**.  The assignment needs to be deleivered by then via email to the facilitators: helpdesk@surfsara.nl (cc to ander.astudillo@surfsara.nl).

## General description of the exercise

Master chef Oliver needs to cook a _&pi;_ according to a recipe he has found on the Internet. It is a bit special, because the recipe only says: 

> ### The traditional way they cook _&pi;_ in Monte Carlo
>
> 1. On a plane, prepare a square of side length _SIDE_ centered in the origin; i.e.: coordinates (0,0)
> 1. Prepare a circle centered inside the previous square, whose _RADIUS_ is half the SIDE
> 1. Randomly generate _N_ points inside the square, of the form (_x_, _y_), where _x_ and _y_ are in the range (&minus;_RADIUS_, +_RADIUS_)
> 1. Check whether the points are inside the circle too (a point is within the circle when: _x_<sup>2</sup> + _y_<sup>2</sup> < _RADIUS_<sup>2</sup>)
> 1. Count _M_ as the amount of points that are within the circle
> 1. Finish the _&pi;_ as _&pi;_ &cong; 4 × _M_ / _N_

Oliver has asked you for help. Being a good friend of yours, you are really excited to help! You have just heard about the scalability options that the HPC Cloud has to offer. That is precisely what Oliver needs. It's great! It's true!

## Your assignment:

<div style="float:right;max-width:205px;margin:5px;" markdown="1">
![Pi pie](https://upload.wikimedia.org/wikipedia/commons/9/9b/Apple_pie_Pi_Day_2011.JPG)
</div>

Cook _&pi;_ fast!

Imagine that, browsing the Internet, you get your hands on a compiled program called `montecarlo`, which follows exactly Oliver's recipe. In other words: it takes _N_ and _RADIUS_ as inputs, and provides _M_ and its estimation of _&pi;_ as outputs. 

Describe a system, using the HPC Cloud, that will allow you to estimate _&pi;_ using a naïve Monte Carlo approach distributed among 1-core Virtual Machines, such that:

 * A master machine starts the calculation: it must compute _&pi;_ using a given _N_ amount of points and a _RADIUS_
 * The master is aware of an amount, _W_, of worker machines
 * The master divides _N_ among _W_ workers; each worker gets its own _N'_ amount of points to generate
 * A worker accepts an order from the master to:
   * run the `montecarlo` program with the amount of points, _N'_, and the _RADIUS_, that it receives from the master
   * deliver the amount of points that it found, _M'_ (and _&pi;_, but you discard it), so that the master can retrieve that number afterwards
 * The master retrieves all these _M'_ numbers back from the workers
 * The master computes _M_ as the sum of all the _M'_ numbers it gathered: _M_ = &sum;_M'_<sub>i</sub>, i = 1.._W_
 * The master computes _&pi;_ as: _&pi;_ &cong; 4 × _M_ / _N_
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

Explain Oliver what your idea is: tell him which features of the HPC Cloud you are going to use to tackle his problem. Tell him how beautiful your answer is because... do you need to change the `montecarlo` program?

## Exercise 2

Oliver's recipe is missing pictures. Draw a sketch that Oliver can keep next to his recipe forever, that illustrates what you came up with in the previous exercise. 

>**Hints:**
>
>At least, you should be able to draw some boxes for the master and the workers, depicting how they communicate and where they live. You can use a [UML Component diagram](https://en.wikipedia.org/wiki/Component_diagram) and/or a [UML Deployment diagram](https://en.wikipedia.org/wiki/Deployment_diagram), for example.

## Exercise 3

Sketch in [pseudocode](https://en.wikipedia.org/wiki/Pseudocode) what you think the programs look like: 

* a) the master 
* b) the worker

## Exercise 4

Imagine that you are given a program that does the master's work, and the `montecarlo` program for the worker. Also, imagine that you have access to the same scripts `makeme_master.sh` and `makeme_worker.sh` that you used in the MPI example.

Write down the relevant steps that you must follow in the HPC Cloud UI to run those programs with 1 master and 3 workers. 

>**Note:**
>
> We assume all VMs use only 1 core and 1GB of RAM, so you do not need to give details on how you configure the Templates. 

## Exercise 5

Having to create all workers by hand is very tedious. You are so happy that you can show Oliver how to let the master create the workers on demand!!!

Thus, for a solution where the master will create the workers on demand (the master now receives the amount of workers, _W_, as an extra parameter):

* a) What extra components from the HPC Cloud do you need to let the master create the workers?
* b) Do the same as in exercise 3: write pseudocode for what the master looks like. Does the worker change? Think of releasing resources when the computation is finished!
* c) Do the same as in exercise 4: write the relevant steps that you must follow in the UI to run the new version of the master (yes, assume again that you get a program with this version of the master's work) and workers; again, 1 master and 3 workers

## Exercise 6 - Bonus

Implement a solution for the master and the worker according to the original description (thus, without the master creating the workers). Send us the code with comments on what you did.

>**Hints:**
>
> * You may be able to reuse the code for calculating _&pi;_ for the serial version that you get from the OpenMP exercise and both the configuring scripts for the master-workers configuration from the MPI exercise.
> * The `montecarlo` program does not actually need to provide _M_ as output, because you can isolate _M_ = _&pi;_ × _N_ / 4
> * Some useful information: you can run a command on a remote machine using the `ssh` command, as in: `ssh <username>@<remote-IP> '<command>'` (do NOT write the less-than and greater-than signs from that previous line)

## Exercise 7 - Bonus

Implement a solution where the master creates (and releases) workers.
