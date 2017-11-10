---
layout: default
---

# VU HPC course 2017-11-13

<div style="float:right;max-width:205px;" markdown="1">
![VU logo](/images/VU_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)

## <a name="general"></a>General Information

SURFsara is operating an HPC Cloud computing service using the model 'Infrastructure as a Service' (`IaaS`).
The HPC Cloud has a powerful user interface (UI) which grants access to high-performant compute and storage nodes.
The UI and cloud software relies on [OpenNebula](http://opennebula.org/) and the cluster of resources available is called _Oort_, after the [Oort cloud](https://en.wikipedia.org/wiki/Oort_cloud).

This course is part of the [VU HPC Course 2017](http://hpc.labs.vu.nl/program/) program.
It aims to introduce the participants to the HPC Cloud, by providing an introductory lecture to the service and a set of hands-on exercises to be run on the _Oort_ production infrastructure.

Here is a summary of the today's course outline:

>**Agenda:**
>
>13th November 2017, VU, [Mathematics and Physics building (W&N building)](https://science.vu.nl/en/about-the-faculty/contact-route/index.aspx), Room WN-C203
>
> * 09:30 Welcome & coffee  
> * 09:40 Presentation & Demo: Introduction to SURFsara HPC Cloud (Nuno Ferreira)
> * 10:10 Hands-on: Parts A & B
> * 12:00 Lunch   
> * 13:00 Presentation: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Extras  
> * 17:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](https://learncodethehardway.org/unix/) will help but not a prerequisite.

For this workshop you will need:

* A computer with Internet access (VU provides WiFi via eduroam)
* A browser (Chrome or Firefox will do nicely)
* An SSH client
  * _Linux and Mac users:_ don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * _Windows users:_ if you attended previous sessions, then you probably installed and configured [MobaXterm](https://mobaxterm.mobatek.net/). You should be able to use that. Alternatively, you can download and install [git for windows](https://git-for-windows.github.io/).
* An X-window client
  * _Linux and Mac users:_ usually don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In such a case, install [XQuartz](http://xquartz.macosforge.org/landing/).
  * _Windows users:_ if you attended previous sessions, then you probably installed and configured [MobaXterm](https://mobaxterm.mobatek.net/). You should be able to use that. Alternatively, install [Xming](http://sourceforge.net/projects/xming/).

> **NOTE for Windows using GitBash:**
>
> For the course purposes you will need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following:  
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
The hands-on tutorial consists of three parts. Parts *A & B* provide exercises for you to grasp the `basic` concepts on how to operate in the HPC Cloud environment. The *Extras* part will focus on `advanced` topics, namely parallel programming and automation.

  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)

## <a name="presentations"></a> Presentations

<div markdown="1">

  * Morning presentation: [Introduction to the HPC Cloud](20171113_introduction.pdf)
  * Afternoon presentation: [Cloudy systems](20171113_parallelism.pdf)

</div>
