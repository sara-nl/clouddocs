---
layout: default
---

# UvA HPC course 2021-01-22 <br/> Part C

<div style="float:right;max-width:205px;" markdown="1">
<img alt="UvA logo" src="../images/UvA-logo.png" />
</div>
<div style="float:right;max-width:205px;" markdown="1">
<img alt="SURFsara logo" src="../images/SURFsara_logo.png" />
</div>


This is part C of the tutorial [UvA HPC course 2021-01-22](.) and covers the following topics:

1. [Basic security](#security)
2. [Detaching from work](#detaching-from-work)
3. [Remote desktop](#remote-desktop)

>**Disclaimer:**
>
> This part C is only meant to draw attention to a few best practices that we have been identifying and collecting through the years offering the HPC Cloud as a service. It is in no way meant to be followed blindly as an all-in authoritative source of truth. 

### 1. Security

When you create a VM, you become its system administrator. One of the topics which a system administrator must address is security. We would like to point out two basic elements you can tackle to begin securing your VM:

* a firewall
* intrusion prevention

#### Firewalls

As a summary, when you put a system on the Internet, it is globally addressable by every other Internet-connected device. You can therefore consider that anybody and everybody can (try to) access services available through the so-called ports from that system. When that system is your VM, you can limit who actually can reach services in your VM by installing a firewall in your VM. That piece of software will (among other things) monitor incoming connections and let them pass into their desired destination only when they meet certain conditions.

When you use one of our Apps from the Appmarket, they usually come configured with a firewall already. 

> **Food for brain:**
>
> * Is there a firewall running already on the VM that you have been working with so far? What is that software firewall's name?
> * Which ports are open to the Internet?

> **BONUS Food for brain:**
>
> * Write down the steps you would follow to set up and configure a software firewall on a VM running Linux whose purpose is to serve an Elasticsearch search engine instance to your institution's network.

#### Intrusion prevention

Once you secure your VM with a software firewall, you have already limited which ports are available and to which networks. However, somebody within that network may go rogue and try to gain illicit access to the service running on those ports. In order to prevent a few malicious patterns from successfully breaking into a service, you can configure a simple piece of software called [fail2ban](https://www.fail2ban.org). 

> **Food for brain:**
>
> Is fail2ban already running in your VM? If it is not, install it now.

> **BONUS Food for brain:**
>
> Can you devise a test to verify that fail2ban is working?

### 2. Detaching from work

Within an SSH connection, if you start an interactive program it is likely to stop working when you close your terminal. You can set up your VM so that the program will keep working after you close your connection. You can use a program called `screen` for that.

We have a documentation page in our general documentation site where you can experiment with it. 

> **Food for brain:**
>
> Follow the steps and exercises from the [page on our documentation about using `screen`](../detachFromWork).

### 3. Remote Desktop

Sometimes you want a full desktop environment to work in. Microsoft Remote Desktop is a client many users are used to, and you can install a server for that in your VM.

We have a documentation page in our general documentation site describing how to install it.

> **Food for brain:**
>
> Follow the steps and exercises from the [page on our documentation about using Remote Desktop](../xrdp).

### Next: Extras
You have completed part C of the Tutorial [UvA HPC course 2021-01-22](.). If you want more of the HPC Cloud proceed to the [Extras part](extras).
