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

Oliver has asked you for help. Being a good friend of yours, you are really excited to help!

>**Your assignment:**
>
>Describe a system, using the HPC Cloud, that will allow you to estimate _&pi;_ using a naïve Monte Carlo approach such that:
>
> * A master machine starts the calculation: it must compute _&pi;_ using a given _N_ amount of points
> * The master is aware of an amount, _W_, of worker machines
> * The master splits the _N_ points into _W_ workers; each worker gets its own _N'_ points.
> * A worker accepts a work-order from the master to:
   * generate a given amount of points, _N'_
   * and deliver the amount of points that it found, _M'_, back to the master
> * The master retrieves all these _M'_ numbers back from the workers
> * The master computes _M_ as the sum of all the _M'_ numbers it received: _M_ = &sum;_M'_<sub>i</sub>, i = 1.._W_
> * The master computes _&pi;_ as: _&pi;_ &cong; 4 × _M_ / _N_

We split the assignment in different exercises to guide you through the process.
