# Introduction

SURFsara offers the HPC Cloud computing facility as a **IaaS** platform. 

IaaS (Infrastructure as a Service) means that you get your own (virtual) environment to provision your own processing, storage and networking resources, where you can deploy, configure and run arbitrary software (including your operating system of choice).

We have implemented the service relying on the [OpenNebula](http://opennebula.org) software. As a user, you interact with the HPC Cloud via the web interface that OpenNebula offers. 

You can **run programs on the HPC Cloud within the so-called VM** (short for `virtual machine`s). These behave like "normal" computers where you can log into, install your own operating system and your programs, upload your data and launch your experiments. If you _launch_ several of these VMs you can have a lot of flexibility by letting **multiple VMs cooperate**. For example, you can build your own cluster out of multiple VMs, or you can let VMs talk to each other to benefit from solving a big problem by letting each of them tackle their own part.

A peculiarity of VMs is that they are precisely that, virtual, which means you can easily **give your computer the shape you want**, because it does not have to match a physical computer in the real world. You specify how you want a VM to look like by defining its characteristics in a so-called `template`. You define there, for example, how many cores you want your VM to have, how much RAM memory, what storage drives, which network connections, etc. And all of this within your browser.

In particular, (storage) drives are called `image`s in OpenNebula. You can create them in OpenNebula itself, or you can also create them somewhere else and then upload them to the HPC Cloud. And you have a lot of storage space available because our underlying infrastructure is very big.

Once you have included your `image`s (along with the rest of the characteristics) into a `template`, you can _instantiate_ a VM out of the template and start working with it normally. You can check the rest of this documentation to learn more.

## Cloud characteristics
#TODOcument. Things like elasticity, self-service...

# Resource sharing
#TODOcument. Mention compute nodes and storage nodes, Ceph, and a best-effort basis.