---
layout: default
---

# UvA HPC course 2021-01-22

<div style="float:right;max-width:205px;" markdown="1">
<img alt="UvA logo" src="../images/UvA-logo.png" />
</div>
<div style="float:right;max-width:205px;" markdown="1">
<img alt="SURF logo" src="../images/surf_logo.png" />
</div>


* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)
  * [Extras](extras)

## <a name="general"></a>General Information

SURF has been operating the HPC Cloud as an Infrastructure as a Service (`IaaS`) for several years. The HPC Cloud service offers users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. The underlying cluster [Oort](https://en.wikipedia.org/wiki/Oort_cloud) is managed by the [OpenNebula](http://opennebula.org/) cloud management software.

In [this webinar](https://www.surf.nl/en/agenda/webinar-introduction-hpc-cloud) you will learn how to start your own virtual machine and coordinate different environments using the web interface. You learn to design your own infrastructure and to run your applications in the cloud. The presentation of the platform is combined with hands-on exercises that help you become familiar with the environment.

The session is co-jointly organized by the University of Amsterdam & SURF, and is part of:
* UvA course series [High Performance Computing and Big Data](https://hpc.uva.nl/)
* SURF [training for research course series](https://www.surf.nl/en/agenda/webinar-introduction-hpc-cloud)

>**Agenda:**
>
> 22nd January 2021, Webinar
>
> * 09:00 Welcome
> * 09:05 Presentation and Demo: Introduction to SURF HPC Cloud (Nuno Ferreira)
> * 09:45 Hands-on: Parts A & B (at your discretion, also C)
> * 12:00 Lunch break  
> * 13:00 Morning recap  
> * 13:05 Presentation and Demo: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Part C & Extras  
> * 17:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](http://cli.learncodethehardway.org/book/) will help but not a prerequisite.

For this webinar you will need:

* A computer with Internet access
* A browser (Chrome or Firefox will do nicely)
* An SSH client
  * _Linux and Mac users:_ don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * _Windows users:_ download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.
* An X-window client
  * _Linux and Mac users:_ usually don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In such a case, install [XQuartz](http://xquartz.macosforge.org/landing/).
  * _Windows users:_ install [Xming](http://sourceforge.net/projects/xming/).

> **NOTE for Windows users:**
>
> For the Extras part, you may need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following:  
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
  * Part *C* helps rounding off a few recommendations.
  * The *Extras* part will focus on `advanced` topics, namelly parallel programming and automation, where you will exercise yourself on the HPC Cloud.

  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)
  * [Extras](extras)

## <a name="presentations"></a> Presentations
  * Morning presentation: <span style="display:inline;" markdown="1"><a href="20210122_hpcc_basics.pdf">Introduction to the HPC Cloud</a></span>
  * Afternoon presentation: <span style="display:inline;" markdown="1"><a href="20200122_hpcc_advanced.pdf">Cloudy systems</a></span>
