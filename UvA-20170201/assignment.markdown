---
layout: default
---

# UvA HPC course 2017-02-01 - Assignment

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

The following exercises are the assignment qualify for your evaluation regarding the attendance of the HPC Cloud session. After you have attended the presentations and followed the hands-on tutorial (including the extras), you should have understood all the concepts that will allow you to propose valid solutions to the exercises. You can contact your facilitators if you have any questions.

## General description of the exercise

Master chef Oliver needs to cook a _&pi;_ according to a recipe he's found on the Internet. It is a bit special, because the recipe only says: 

> ### The traditional way they cook _&pi;_ in Monte Carlo
>
> 1. On a plain, prepare a square of side length SIDE
> 1. Prepare a circle centered inside the previous square, whose RADIUS is half the SIDE
> 1. Randomly generate N points inside the square, of the form (x, y).
> 1. Check whether the points are inside the circle too (a point is within the circle when: x^2 + y^2 < RADIUS^2)
> 1. Count M as the amount of points that are within the circle
> 1. Finish the _&pi;_ as &pi; &cong; 4 × M / N

Being a good friend of yours, Oliver has asked you for help. 

>**Your assignment:**
>
>Describe a system, using the HPC Cloud, that will allow you to estimate _&pi;_ using a naïve Monte Carlo approach such that:
>
> * A master machine starts the calculation: it must compute _&pi;_ using a given N amount of points
> * The master is aware of an amount, W, of worker machines
> * The master splits the N points into W workers; each worker gets its own N' points.
> * A worker accepts a work-order from the master to:
   * generate a given amount of points, N'
   * and deliver the amount of points that it found, M', back to the master
> * The master retrieves all these M' numbers back from the workers
> * The master computes M as the sum of all the M' numbers it received
> * The master computes _&pi;_ as: &pi; &cong; 4 × M / N

We split the assignment in different exercises to guide you through the process.
