---
layout: default
---

# UvA workshop 2016-01-25

> ## Warning: Under construction

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA)
  * [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB)
  * [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras)
* [Presentations](#presentations) <br>

## <a name="general"></a>General Information 

SURFsara has been operating the HPC Cloud as `IaaS` (Infrastructure as a Service) for several years. Since recently we have launched a new HPC Cloud with a powerful new user interface and a complete new cluster with fast compute nodes and high-performant big storage volumes. The user interface and cloud software relies on [OpenNebula 4](http://opennebula.org/) and our new cluster is called [Oort](https://en.wikipedia.org/wiki/Oort_cloud).

This particular course aims to introduce SURF employees to the HPC Cloud by providing a set of lectures and hands-on examples to run on the real **`Oort`** infrastructure. Here is a summary of the course outline:

**Date**: 25 January 2016  
**Location**: SURFsara VK1 & 2  

### Agenda
>09:00 Welcome & coffee  
09:15 Presentation in HPC Cloud at SURFsara & Demo  
10:00 Hands-on Part A  
12:30 Lunch   
13:30 Presentation in Parallel Applications  & Demo  
14:15 Hands-on Part B   
17:00 End  

## <a name="preparation"></a>Preparation

Participants should bring a laptop that is Internet connected and has a functioning browser. Prior experience in [Linux commands](http://cli.learncodethehardway.org/book/) will help but is not a prerequisite. 

So what you need for this tutorial:

* A computer with full Internet access.
* A browser (Chrome or Firefox will do nicely).
* Java, at least version 7 (a.k.a. 1.7)
* An X-window client.
  * Linux and Mac users normally don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In that case, install XQuarz from [here](http://xquartz.macosforge.org/landing/).
  * Windows users: install Xming from [here](http://sourceforge.net/projects/xming/).
* An SSH client.
  * Linux and Mac users: don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * Windows users: download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.


## <a name="hands-on"></a> Hands-on
The hands-on tutorial has two parts. The exercises in part A will give you a first grasp for the `basic` usage of HPC Cloud. Once you have completed and understood part A, then continue to part B with more `advanced` examples on the HPC Cloud. 

If you manage to finish both part A & B and wish to know more about the HPC Cloud, try also the additional exercises in `extras`.

  * [UvA workshop 2016-01-25 - Part A](UvAworkshop-2016-01-25-partA)
  * [UvA workshop 2016-01-25 - Part B](UvAworkshop-2016-01-25-partB)
  * [UvA workshop 2016-01-25 - Extras](UvAworkshop-2016-01-25-extras) (optional)

> **NOTE: only for Windows users**
>
> For the course purposes you will need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following setting:  
>
* Open GitBash (or git for windows).
* In the terminal that appears, copy and paste the following commands: 
>
```sh
# press enter to submit each command
echo "export DISPLAY=localhost:0.0" >> $HOME/.bashrc` 
source $HOME/.bashrc
```
>
* Close the Gitbash window.

## <a name="presentations"></a> Presentations

* [Introduction to Cloud Computing](assets/cloud_intro_20151015.pdf)
* [Introduction to SURFsara HPC Cloud](assets/2015.10.15_SURFcourse_oort.pdf)

