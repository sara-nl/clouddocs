---
layout: default
---

# UvA HPC course 2017-02-01 - Assignment

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

The following exercises are the assignment to qualify for your evaluation on the HPC Cloud session. After you have attended the presentations and followed the hands-on tutorial (including the extras), you should have understood all the concepts that will allow you to propose valid solutions to the exercises. You can contact your facilitators if you have any questions.

## General description of the exercise

Master chef Oliver needs to cook a _&pi;_ according to a recipe he has found on the Internet. It is a bit special, because the recipe only says: 

> ### The traditional way they cook _&pi;_ in Monte Carlo
>
> 1. On a plain, prepare a square of side length _SIDE_
> 1. Prepare a circle centered inside the previous square, whose _RADIUS_ is half the SIDE
> 1. Randomly generate _N_ points inside the square, of the form (_x_, _y_).
> 1. Check whether the points are inside the circle too (a point is within the circle when: _x_<sup>2</sup> + _y_<sup>2</sup> < _RADIUS_<sup>2</sup>)
> 1. Count _M_ as the amount of points that are within the circle
> 1. Finish the _&pi;_ as _&pi;_ &cong; 4 × _M_ / _N_

Oliver has asked you for help. Being a good friend of yours, you are really excited to help! You have just heard about the scalability options that the HPC Cloud has to offer. That is precisely what Oliver needs. It's great! It's true!

>**Your assignment:**
>
>Imagine you get your hands on a compiled program called `montecarlo`, which takes _N_ and provides _M_ and its estimation of _&pi;_ as output. 
>
>Describe a system, using the HPC Cloud, that will allow you to estimate _&pi;_ using a naïve Monte Carlo approach distributed among 1-core Virtual Machines, such that:
>
> * A master machine starts the calculation: it must compute _&pi;_ using a given _N_ amount of points
> * The master is aware of an amount, _W_, of worker machines
> * The master splits the _N_ points into _W_ workers; each worker gets its own _N'_ points.
> * A worker accepts a work-order from the master to:
   * run the `montecarlo` program with the amount of points, _N'_, that it receives from the master
   * and then deliver the amount of points that it found, _M'_, so that the master can retrieve those
> * The master retrieves all these _M'_ numbers back from the workers
> * The master computes _M_ as the sum of all the _M'_ numbers it gathered: _M_ = &sum;_M'_<sub>i</sub>, i = 1.._W_
> * The master computes _&pi;_ as: _&pi;_ &cong; 4 × _M_ / _N_

We split the assignment in different exercises to guide you through the process. We will compute your final mark by grading each of the exercises and adding all these marks together.

## Exercise 1

Explain Oliver what your idea is: tell him which features of the HPC Cloud you are going to use to tackle his problem. Tell him how beautiful your answer is because... do you need to change the `montecarlo` program?

## Exercise 2

Oliver's recipe is missing pictures. Draw a sketch that Oliver can keep next to his recipe forever, that illustrates what you came up with in the previous exercise. 

>**Hints:**
>
>At least, you should be able to draw some boxes for the master and the workers, depicting how they communicate and where they live. You can use a [UML Component diagram](https://en.wikipedia.org/wiki/Component_diagram) and/or a [UML Deployment diagram](https://en.wikipedia.org/wiki/Deployment_diagram), for example.

## Exercise 3

Sketch in [pseudocode](https://en.wikipedia.org/wiki/Pseudocode) what you think the programs look like for: 

* a) the master 
* b) the worker

## Exercise 4

Imagine that you are given a program that does the master's work, and the `montecarlo` program for thw worker. Also, imagine that you have access to the same scripts `makeme_master.sh` and `makeme_worker.sh` that you used in the MPI example.

Write down the relevant steps that you must follow in the HPC Cloud UI to run those programs with 1 master and 3 workers. 

>**Note:**
>
> We assume all VMs use only 1 core and 1GB of RAM, so need to give details on how you configure the Templates. 

## Exercise 5

Having to create all workers by hand is very tedious. Make the same as in exercise 1, now describing a solution where the master will create the workers on demand. The master now receives the amount of workers, _W_, as a parameter.

## Exercise 6

