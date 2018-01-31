---
layout: default
---

# UvA HPC course 2018-01-31

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

## <a name="general"></a>General Information

SURFsara has been operating the HPC Cloud as an Infrastructure as a Service (`IaaS`) for several years. The HPC Cloud service offers users access to fast computing nodes and high-performant big storage volumes through a powerful graphical user interface. The underlying cluster [Oort](https://en.wikipedia.org/wiki/Oort_cloud) is managed by the [OpenNebula](http://opennebula.org/) cloud management software.

[This workshop](http://hpc.uva.nl/Workshops/article/110/8-HPC-Cloud) aims to introduce the participants to the HPC Cloud, by providing a set of lectures and hands-on examples to be run on the _Oort_ infrastructure. The session is part of the [UvA HPC Course](http://hpc.uva.nl/Workshops/) which covers various topics related to HPC and Big Data.

>**Agenda:**
>
>3rd July 2017, UvA, [Science Park 904](https://www.uva.nl/en/about-the-uva/the-uva-in-amsterdam/locations/locations/locations/content/folder/sciencepark/science-park.html), Room: G3.02
>
> * 10:00 Welcome & coffee  
> * 10:05 Presentation and Demo: HPC Cloud at SURFsara (Niek Bosch)
> * 10:25 Hands-on: Parts A & B
> * 12:00 Lunch   
> * 13:00 Presentation: Cloudifying - parallelism & API (Ander Astudillo)
> * 13:45 Hands-on: Extras  
> * 18:00 End  


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

We will add the presentations during the day of the course.

<div markdown="1">

  * Morning presentation: [Introduction to the HPC Cloud](20180131_cloud.pdf)
  * Afternoon presentation: [Cloudy systems](20180131_parallelism.pdf)

</div>



## Assignment

[Master students eligible to earn ECTS](http://hpc.uva.nl/Roadmaps/article/122/Distributed-systems-and-BigData-(6-ECTS)) must follow all the lectures and participate on all workshops associated to [UvA HPC Course](http://hpc.uva.nl/Workshops/). 
Access to the HPC Cloud service will remain available to the participants for **1 week** after the course. The [HPC Cloud course assignment](assignment) needs to be deleivered by then via the UvA's Blackboard interface. Adam Beloum will then collect all assignments and make them available to the HPC Cloud team for evaluation. 

Thus, make sure you have submitted your assignment by 00:00h next Thursday, 8th February.
