---
layout: default
---

# UvA HPC course 2019-01-30

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)
  * [Extras](extras)

## <a name="general"></a>General Information

SURFsara has been operating the HPC Cloud as an Infrastructure as a Service (`IaaS`) for several years. The HPC Cloud service offers users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. The underlying cluster [Oort](https://en.wikipedia.org/wiki/Oort_cloud) is managed by the [OpenNebula](http://opennebula.org/) cloud management software.

[This workshop](http://hpc.uva.nl/Workshops/article/110/8-HPC-Cloud) aims to introduce the participants to the HPC Cloud, by providing a set of lectures and hands-on examples to be run on the _Oort_ infrastructure. The session is part of the [UvA HPC Course](http://hpc.uva.nl/Workshops/) which covers various topics related to HPC and Big Data.

>**Agenda:**
>
>30th January 2019, UvA, Science Park SP G0.23-G0.25
>
> * 09:00 Welcome & coffee  
> * 09:05 Presentation and Demo: HPC Cloud at SURFsara (Maithili Kalamkar)
> * 09:45 Hands-on: Parts A & B (at your discression, also C)
> * 12:00 Lunch break  
> * 13:00 Morning recap  
> * 13:05 Presentation and Demo: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Part C & Extras  
> * 17:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](http://cli.learncodethehardway.org/book/) will help but not a prerequisite.

For this workshop you will need:

* A computer with Internet access (UvA provides WiFi via eduroam)
* A browser (Chrome or Firefox will do nicely)
* An SSH client
  * _Linux and Mac users:_ don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * _Windows users:_ download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.
* An X-window client
  * _Linux and Mac users:_ usually don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In such a case, install [XQuartz](http://xquartz.macosforge.org/landing/).
  * _Windows users:_ install [Xming](http://sourceforge.net/projects/xming/).

> **NOTE for Windows users:**
>
> For the Extras you may need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following:  
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
The hands-on tutorial consists of three parts:

  * Parts *A & B* provide exercises for you to grasp the `basic` concepts on how to operate in the HPC Cloud environment. 
  * Partc *C* helps rounding off a few recommendations. 
  * The *Extras* part will focus on `advanced` topics, namelly parallel programming and automation, where you will exercise yourself on the HPC Cloud.

  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)
  * [Extras](extras)

## <a name="presentations"></a> Presentations

  * Morning presentation: <span style="display:inline;" markdown="1">[Introduction to the HPC Cloud](20190130_cloud.pdf)</span>
  * Afternoon presentation: <span style="display:none;" markdown="1">[Cloudy systems](20180614_parallelism.pdf)</span>

<div style="display:none;" markdown="1">

## Assignment

[Download the assignment](assignment)

[Master students eligible to earn ECTS](http://hpc.uva.nl/Roadmaps/article/122/Distributed-systems-and-BigData-(6-ECTS)) must follow all the lectures and participate on all workshops associated to [UvA HPC Course](http://hpc.uva.nl/Workshops/). 
Access to the HPC Cloud service will remain available to the participants for **1 week** after the course. The [HPC Cloud course assignment](assignment) needs to be delivered by then via the UvA's Blackboard interface. Adam Belloum will then collect all assignments and make them available to the HPC Cloud team for evaluation.

Thus, make sure you have submitted your assignment before 23:59h next Thursday, 21st June.

</div>
