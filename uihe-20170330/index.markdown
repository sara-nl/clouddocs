---
layout: default
---

# UNESCO-IHE symposium 2017-03-30&31

<div style="float:right;max-width:205px;" markdown="1">
![UNESCO-IHE logo](/images/Unesco-Ihe-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Extras](extras)

## <a name="general"></a>General Information

SURFsara has been operating the HPC Cloud as an Infrastructure as a Service (`IaaS`) for several years. The HPC Cloud service offers its users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. The underlying infrastructure cloud cluster [Oort](https://en.wikipedia.org/wiki/Oort_cloud) is managed by [OpenNebula](http://opennebula.org/) cloud computing platform.

This workshop aims to introduce the participants to the HPC Cloud, by providing a set of lectures and hands-on examples to be run on the _Oort_ infrastructure. The session is part of the [UNESCO-IHE mini-symposium](https://www.unesco-ihe.org/mini%C2%AD-symposium-and-workshop-high-performane-computing-helping-solve-water-%C2%ADrelated-problems) which covers various topics on High-Performance Computing helping to solve water-related problems.

>**Agenda:**
>
>30th and 31st March 2017, UNESCO-IHE, [Westvest 7](https://www.unesco-ihe.org/how-reach-unesco-ihe), Room: A1b
>
> **Thursday, 30th**
> * 14:30 Presentation and Demo: Introduction to the HPC Cloud (Ander Astudillo)
> * 15:00 Hands-on: Parts A & B (Ander Astudillo & Natalie Danezi)
> * 17:30 End
>
> **Friday, 31st**
> * 10:00 Presentation: Cloudifying - parallelism & API (Ander Astudillo)
> * 10:30 Hands-on: Extras (Ander Astudillo & Natalie Danezi)
> * 12:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](http://cli.learncodethehardway.org/book/) will help but not a prerequisite.

For this workshop you will need:

* A computer with Internet access (UNESCO-IHE provides WiFi via eduroam)
* A browser (Chrome or Firefox will do nicely)
* An SSH client
  * _Linux and Mac users:_ don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * _Windows users:_ download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.
* An X-window client
  * _Linux and Mac users:_ usually don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In such a case, install [XQuartz](http://xquartz.macosforge.org/landing/).
  * _Windows users:_ install [Xming](http://sourceforge.net/projects/xming/).

> **NOTE for Windows users:**
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
 
  * Thursday - [SURFsara introduction](https://doc.hpccloud.surfsara.nl/uihe-20170330/20170330_surfsara.pdf)
  * Thursday - Hands-on presentation: [Introduction to the HPC Cloud](https://doc.hpccloud.surfsara.nl/uihe-20170330/20170330_cloud.pdf) 
  * Friday - Hands-on presentation: [Parallelism](https://doc.hpccloud.surfsara.nl/uihe-20170330/20170331_parallelism.pdf)


