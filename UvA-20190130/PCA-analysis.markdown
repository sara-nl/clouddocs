---
layout: default
---

# UvA HPC course 2019-01-30  <br/> Extras - PCA Analysis

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is an exercise from the [Extras](extras) part of the Tutorial [UvA HPC course 2019-01-30](.).

In this advanced part of our HPC Cloud tutorial we ask you to run an exercise to study scale-out and scale-up scenario. 
You will be using principal component analysis to study flight delays where data can be analyzed by scaling-up a VM or across multiple VMs.

>**NOTE:**
>
>You are now in the advanced section of the workshop. You have your laptop and an Internet connection. We expect you will be able to find out more on your own about things that we hardly/don't explain but which you think you need. For example, if we were you, at this point we would've already googled for several things: 
>
>1. Principal Component Analysis
>1. R software package

### a) Setting up a VM for the exercise

Exercise: start a new VM (you are now in the advanced part; you should be able to do this on your own). The steps in this exercise assume 
 that you are using an Ubuntu image.

### b) Prepare the VM for data analysis

In this part of the exercise you shall prepare the software and download data for analysis:

* Install R analysis software package

```sh
sudo apt-get install r-base
```

* Test if the installation was successful. The following command should tell you which version of R has been installed

```sh
r --version
```

* Download the [data](code/airplane-delay.tar) to your VM and uncompress the file:

```sh
wget http://doc.hpccloud.surfsara.nl/UvA-20190130/code/airplane-delay.tar 
tar -xvf airplane-delay.tar 
```

> **_Food for brain:_**
>
> * What version or R do you have?
> * How can you inspect the data without opening the files?

### c) Run a second example

* Run the example from the presentation that shows a list of your VMs.

> **_Food for brain:_**
>
> * Can you now modify the VM list to show **only** the running VMs?
> * Can you make a program that will shutdown all your VMs but leaving intact the one you are running the program from?

## <a name="xml_print"></a> Helping code
 
  * [Helper XmlUtil class](./code/xml_util.py)
