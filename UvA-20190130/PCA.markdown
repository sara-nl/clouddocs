---
layout: default
---

# UvA HPC course 2019-01-30  <br/> Extras - Principal Component Analysis (PCA)

<div style="float:right;max-width:205px;" markdown="1">
![UvA logo](/images/UvA-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is an exercise from the [Extras](extras) part of the Tutorial [UvA HPC course 2019-01-30](.).

In this advanced part of our HPC Cloud tutorial we ask you to run an exercise to look at the scale-out and scale-up scenarios. 
You will be using Principal Component Analysis to study flight delays where data can be analysed by scaling up one VM or scaling out across multiple VMs.

The original dataset is coming from [here](https://www.transtats.bts.gov/DL_SelectFields.asp?DB_Short_Name=On-Time&Table_ID=236), but we have already prepared some files. Among other preparation steps, we focused on a selection of dates and some variables, along with some cleaning steps to get more useful data. 

>**NOTE:**
>
>You are now in the advanced section of the workshop. You have your laptop and an Internet connection. We expect you will be able to find out more on your own about things that we hardly/don't explain but which you think you need. For example, if we were you, at this point we would've already googled for several things: 
>
>1. Principal Component Analysis
>1. R language
>1. R modules

### a) Setting up a VM for the exercise

Start a new single core VM with 1 GB memory (you are now in the advanced part; you should be able to do this on your own). The steps in this exercise assume that you are using an Ubuntu image.

### b) Prepare the VM for data analysis

In this part of the exercise you shall prepare the software and download data for analysis. After logging int othe VM:

* Install R analysis software package

```sh
sudo apt-get install r-base
```

* Test if the installation was successful. The following command should tell you which version of R has been installed

```sh
R --version
```

* Download the [data](code/airplane-delay.tar) to your VM and uncompress the file:

```sh
wget http://doc.hpccloud.surfsara.nl/UvA-20190130/code/airplane-delay.tar 
tar -xvf airplane-delay.tar 
```

> **_Food for brain:_**
>
> * What version or R do you have?
> * How can you inspect the files without opening them?

### c) Run the Principal Component Analysis

* The data represents airplane delays across US airports in the year 2018. In the first iteration, you will perform PCA on a single data set (data for January) on all variables that may have contributed to the flight delays.

```sh
cd ~/airplane-delay
Rscript airplane-delay-all-comp.r
```

You just ran an R script and saw the output. What do these numbers mean? Which variables (columns) were used to perform the PCA?

* Should all parameters be used for this? You can explore your dataset by looking for correlations in the dataset. Let's plot the various columns in the dataset

```sh
Rscript airplane-delay-plots.r
```
For simplicity we only plot a part of the data. You may use all the datapoints to create the plots.

> **_Food for brain:_**
>
> * How can you display these plots? (Hint: You can login with X11 forwarding enabled)

* Once you make a selection of which columns to use for PCA analysis, you can rerun the analysis with those select columns as shown below

```sh
Rscript airplane-delay-some-comp.r
```
How do these numbers compare to the previous analysis with the full dataset? A similar example can be found [here](https://gmaclenn.github.io/articles/airport-pca-analysis/) that can help you in the interpretation and further analysis of the results.

### Bonus food for brain: Scaling up or scaling out?

So far you worked on a single dataset on a single core VM with 1 GB memory. There are two datasets provided to you in the `airplane-delay.tar` file and data files ("delay-2018-*".csv) for another few months is available [here](https://github.com/sara-nl/clouddocs/tree/gh-pages/UvA-20190130/code) . How would you run the analysis for the whole year as a whole? 

* You can scale up your VM and run the analysis serially over multiple datasets and combine the results in the end. How big should the VM be to optimize the analysis?

* You may choose to scale out and run separate VMs for each dataset and combine the results in the end. How would you go about doing this?

* The data was downloaded from [here](https://www.transtats.bts.gov/DL_SelectFields.asp?DB_Short_Name=On-Time&Table_ID=236) taking only a few columns into account. You can use one of the above methods/both to run the same analysis for several years.
