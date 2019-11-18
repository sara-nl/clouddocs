---
layout: default
---

# An introduction to SURF HPC Cloud 2019-11-19

<div style="float:right;max-width:205px;" markdown="1">
![KNMI logo](/images/knmi_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

* [General Information](#general) <br>
* [Preparation](#preparation) <br>
* [Hands-on](#hands-on) <br>
  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)

## <a name="general"></a>General Information

SURFsara has been operating the HPC Cloud in an Infrastructure as a Service (`IaaS`) model for several years. The HPC Cloud service offers users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. The underlying cluster [Oort](https://en.wikipedia.org/wiki/Oort_cloud) is managed by the [OpenNebula](http://opennebula.org/) cloud management software.

This workshop aims to introduce the participants to the HPC Cloud, by providing a general presentation and hands-on examples to be run on the _Oort_ infrastructure.

>**Agenda:**
>
>19th November 2019, KNMI, Utrechtseweg 297, 3731GA, De Bilt
>
> * 13:00 Welcome
> * 13:10 Presentation: An introduction to SURF HPC Cloud (Nuno Ferreira)
> * 13:45 Demonstration ()
> * 14:00 Hands-on: Part A
> * 15:00 Break
> * 15:15 Hands-on: Parts B & C  
> * 17:00 End  


## <a name="preparation"></a>Preparation

Participants are expected to bring a laptop with Internet connection and a browser installed. Prior experience with [Linux commands](http://cli.learncodethehardway.org/book/) will help but not it is no mandatory prerequisite.

For this workshop you will need:

* A computer with Internet access (SURFsara provides WiFi via eduroam)
* A browser (Chrome or Firefox will do nicely)
* An SSH client
  * _Linux and Mac users:_ don't have to install anything. The SSH client is on board, try "ssh" in a [terminal](http://askubuntu.com/questions/38162/what-is-a-terminal-and-how-do-i-open-and-use-it).
  * _Windows users:_ download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between the `-32-bit.exe` or the `-64-bit.exe`.
* An X-window client
  * _Linux and Mac users:_ usually don't need to install anything as X11 is on board. However, the newest Mac OS releases might not have X11.app installed. In such a case, install [XQuartz](http://xquartz.macosforge.org/landing/).
  * _Windows users:_ install [Xming](http://sourceforge.net/projects/xming/).

> **NOTE for Windows users:**
>
> You may need to start a graphical window in your laptop that is connected to your HPC Cloud machine. To make this work, you need to adjust the following:  
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

  * [Part A](partA)
  * [Part B](partB)
  * [Part C](partC)

## <a name="presentations"></a> Presentation

  * [An introduction to SURF HPC Cloud](20191119_hpcc.pdf)

<div style="display:none;float:right;max-width:205px;" markdown="1">
## Note

Access to the HPC Cloud service will remain available to the participants until the **26th Nov. 2019**.

</div>
