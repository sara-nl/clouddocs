---
layout: default
---

# Microarchitectural Data Sampling

|Table of Contents|
|-----|
|[What is MDS?](#what-is-mds)|
|[Is your VM at risk?](#is-your-vm-at-risk)|
|[What should you do?](#what-should-you-do)|
|[What did SURFsara do?](#what-did-surfsara-do)|

## Introduction

### What is MDS?

> The Microarchitectural Data Sampling (MDS) vulnerabilities are a set of weaknesses in Intel x86 microprocessors that leak data across protection boundaries that are architecturally supposed to be secure. The vulnerabilities have been labeled Fallout, RIDL (Rogue In-Flight Data Load) and ZombieLoad.
> _([Wikipedia](https://en.wikipedia.org/wiki/Microarchitectural_Data_Sampling))_

Hackers may exploit MDS to steal information processed by your VM's CPU.
This could include sensitive data.
For this to succeed, the hacker must have gained access to a VM next to yours.

Further txternal technical documentation:

- [Wikipedia](https://en.wikipedia.org/wiki/Microarchitectural_Data_Sampling)
- [The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html)
- [Intel advisory](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00233.html)


### Is your VM at risk?

Now that we implemented the mitigations described below, your VMs are no longer at risk.

If you need more information, please send an email to helpdesk@surfsara.nl with your question.

## What should you do?

_As always,_ keep your VM’s operating system and applications up to date and at least install all security updates. In case of a kernel update you need to reboot as well.


## What did SURFsara do?

SURFsara follows the developments closely and we implemented all known mitigations against MDS. 

### we installed all known patches against MDS on the hardware of the HPC Cloud

Unfortunately, his has a noticeable impact on the performance.

### we switched hyper threading off

Hyper threading is a way to double the CPU count with a small performance drop
and we have to switch this off as part of the mitigation against MDS.

This means, however, that the number of available CPUs has halved.

### we started overcommitting

In order to service more users at the same time, we consider overcommitting CPUs.
We did not do this in the past, but with hyper threading off the capacity has halved.

Please note that overcommitting is considered safe w.r.t. MDS.

### we updated the ready-made apps

We continually update the apps with the latest security patches.
When in doubt, please download a fresh app and build on that.
After downloading, keep it up to date (see [What should you do?](#what-should-you-do)).
