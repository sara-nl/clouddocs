---
layout: default
---

# UvA course 2016-06-15

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)
* [Assignment](#assignment) <br>
* [Presentation](#presentation) <br>


## <a name="general"></a>General Information

SURFsara has been operating the HPC Cloud as an `IaaS` (Infrastructure as a Service) for several years.
We have launched recently a new HPC Cloud with a powerful user interface and a complete new cluster with fast compute nodes and high-performant big storage volumes.
The user interface and cloud software relies on [OpenNebula 4](http://opennebula.org/) and our new cluster is called _Oort_, after the [Oort cloud](https://en.wikipedia.org/wiki/Oort_cloud).

This particular course aims to introduce the workshop participants to the HPC Cloud by providing a set of lectures and hands-on examples to run on the real **`Oort`** infrastructure.
Here is a summary of the course outline:

>**Agenda:**
>
>15th June 2016, UvA
>
> * 09:30 Welcome
> * 09:35 Presentation: HPC Cloud at SURFsara (Nuno Ferreira)
> * 10:15 Hands-on: Parts A & B
> * 12:00 Lunch   
> * 13:00 Presentation: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Extras  
> * 17:00 End  


## <a name="preparation"></a>Preparation

Participants should bring a laptop with Internet connection and a proper browser.
Prior experience in [Linux commands](http://cli.learncodethehardway.org/book/) will help but is not a prerequisite.

For this tutorial you will need:

* A computer with Internet access (UvA provides WiFi).
* A browser (Chrome or Firefox will do nicely).
* An SSH client.
  * Linux and Mac users: don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * Windows users: download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.
* An X-window client.
  * Linux and Mac users normally don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In that case, install XQuarz from [here](http://xquartz.macosforge.org/landing/).
  * Windows users: install Xming from [here](http://sourceforge.net/projects/xming/).

> **NOTE: only for Windows users**
>
> For the course purposes you will need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following setting:  
>
* Open GitBash (or git for windows).
* In the terminal that appears, copy and paste the following commands:
>
```sh
# press enter to submit each command
echo "export DISPLAY=localhost:0.0" >> $HOME/.bashrc
source $HOME/.bashrc
```

## <a name="hands-on"></a> Hands-on
The hands-on tutorial has three parts. The exercises in part *A & B* will give you a first grasp for the `basic` usage of HPC Cloud. Once you have completed and understood this, then continue to the *Extras* part with more `advanced` examples on the HPC Cloud.

  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)

> The accounts will remain active until **24th of June 2016**.

## <a name="assignment"></a>Assignment

For those who submit an assignment on the HPC Cloud course, please run both exercises [OpenMP: calculating _&pi;_](OpenMP) and [MPI: Wave equation](MPI) and answer the [assignment questions](assignment).

Send your answers to: Nuno Ferreira <nuno.ferreira@surfsara.nl> **by 24th of June 2016**.

## <a name="presentations"></a>Presentations

* [Introduction to HPC Cloud](UvA.HPC.Cloud.Workshop.20160615.pdf)
* [Scaling](2016.06.15 - parallelism.pdf)
