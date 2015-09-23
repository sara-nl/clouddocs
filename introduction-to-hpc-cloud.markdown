---
layout: default
---
# Introduction

SURFsara offers the HPC Cloud computing facility as a **IaaS** platform. 

IaaS (Infrastructure as a Service) means that you get your own (virtual) environment to provision your own processing, storage and networking resources, where you can deploy, configure and run arbitrary software (including your operating system of choice). All you need is a **computer with Internet access**.

We have implemented the Cloud service relying on the [OpenNebula](http://opennebula.org) software. As a user, you interact with the HPC Cloud via the web interface that OpenNebula offers. 

## Virtual Machines (VM)
You can **run programs on the HPC Cloud within the so-called VM** (short for `virtual machine`s). These behave like "normal" computers where you can log into, install your own operating system and your programs, upload your data and launch your experiments. Depending on your problem requirements, you can prepare a single multi-core or high-memory VM, or even multiple VMs. If you _launch_ several of these VMs you can have a lot of flexibility by letting **multiple VMs cooperate**. For example, you can build your own cluster out of multiple VMs, or you can let VMs talk to each other to benefit from solving a big problem by letting each of them tackle their own part.

### Templates and images
A peculiarity of VMs is that they are precisely that, virtual, which means you can easily **give your computer the shape you want**, because it does not have to match a physical computer in the real world. You specify how you want a VM to look like by defining its characteristics in a so-called `template`. The `template` is just a recipe for building your VM, not the machine itself. You define there, for example, how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc. And all of this within your browser.

In particular, **storage drives** are called `image`s in OpenNebula. You can create them in OpenNebula itself, or you can also create them somewhere else and then upload them to the HPC Cloud. And you have a lot of storage space available because our underlying infrastructure has very high capacity.

Once you have included your `image`s (along with the rest of the characteristics) into a `template`, you can _instantiate_ a VM out of the template and start working with it normally. You can check the rest of this documentation to learn more.

## Cloud characteristics
We say that our service is an HPC Cloud system. But what do we mean by cloud? Largely taken out of _[The NIST Definition of Cloud Computing](http://csrc.nist.gov/publications/nistpubs/800-145/SP800-145.pdf)_, a system can be called a cloud when it shows the following characteristics:

* On-demand self-service: you can provision compute capabilities as you need them
* Broad network access: you can access compute capabilities over the network through standard mechanisms
* Resource pooling: our (physical) resources are pooled, to serve users in a multi-tenant model, with resources dynamically assigned and reassigned according to consumer demand
* Elasticity: you can acquire and release capabilities (even automatically) to scale rapidly to cope with your demands and when you need it to happen
* Measured service: the system measures and reports back to you on how much you have used. 

# Resource sharing
The HPC Cloud basically makes two kinds of hardware available to you: a) **compute nodes** and b) **storage space**. These, of course, are physical machines that we have set up and configured to run the cloud software which allows you to see your virtual environment and operate within it. In general, you do not need to trouble yourself with all the nitty-gritty details of the real world, but we expect you to understand that the physical resources that we have are limited. Therefore, we expect of you to work responsibly with them. 

Within the scientific community, we aim at helping as many people's research projects as possible. The HPC Cloud offers you a lot of flexibility, and that means you can do a lot of things you usually cannot do in other traditional HPC environments: you can complete long-running computations, you can book large RAM memory spaces, you can dynamically link working processes, you can store a lot of data... But we demand that you do so responsibly. Our service is purposefully run as a **best-effort basis**, so we strive to deliver the best service possible we can at each moment to satisfy as many users as possible. When you claim some resources (say, some CPUs and some disk space), then they are assigned to you, and only to you. Please, make sure you make the most out of them, because that means that other users are kept away from those resources until you free them. Therefore, please, do release them once you are done with them; you will be facilitating someone else's research by doing so.

> **NOTE:** 
>
> If you would like to know more details about the resources that are available, you can have a look at the [available resources page](resources-available).
