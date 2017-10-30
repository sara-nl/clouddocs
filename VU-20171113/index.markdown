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

SURFsara has been operating the HPC Cloud as an Infrastructure as a Service (`IaaS`) for several years. The HPC Cloud service offers its users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. 

The user interface and cloud software relies on [OpenNebula 5](http://opennebula.org/) and our new cluster is called _Oort_, after the [Oort cloud](https://en.wikipedia.org/wiki/Oort_cloud).

This particular course aims to introduce the workshop participants to the HPC Cloud by providing a set of lectures and hands-on examples to run on the real **`Oort`** infrastructure.

The session today is part of a broader schedule of the VU HPC Course, which you can find [here](http://hpc.labs.vu.nl/program/).

Here is a summary of the course outline:

>**Agenda:**
>
>13th November 2017, VU, [Mathematics and Physics building (W&N building)](https://science.vu.nl/en/about-the-faculty/contact-route/index.aspx)
>
> * 10:00 Welcome & coffee  
> * 10:05 Presentation and Demo: HPC Cloud at SURFsara (Nuno Ferreira)
> * 10:25 Hands-on: Parts A & B
> * 12:00 Lunch   
> * 13:00 Presentation: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Extras  
> * 18:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](http://cli.learncodethehardway.org/book/) will help but not a prerequisite.

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
The hands-on tutorial consists of three parts. Parts *A & B* provide exercises for you to grasp the `basic` concepts on how to operate in the HPC Cloud environment. The *Extras* part will focus on `advanced` topics, namelly parallel programming and automation, where you will exercise yourself on the HPC Cloud.

  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)
  
## <a name="presentations"></a> Presentations

<div markdown="1">

  * Morning presentation: [Introduction to the HPC Cloud](2017-07-03-Introduction.pdf)
  * Afternoon presentation: [Cloudy systems](20170703_parallelism.pdf)

</div>

