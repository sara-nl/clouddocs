---
layout: default
---

# Spectre/Meltdown Jan 2018

## Introduction

### What are Spectre and Meltdown?

Spectre and Meltdown are bugs in the CPU that may disclose data to attackers, possibly containing passwords or other information that should be kept secret. These bugs are not in the operating system, but in the CPU itself. This implies that all operating systems are vulnerable, including your PC.

Spectre and Meltdown are also known as 
"Information leak via speculative execution side channel attacks".

There three separate vulnerabilities involved:

|Name|Variant|Description|NIST CVE|
|----|-------|-----------|---|
|Spectre|Variant 1|Bounds Check Bypass|[CVE-2017-5753](https://nvd.nist.gov/vuln/detail/CVE-2017-5753)|
|Spectre|Variant 2|Branch Target Injection|[CVE-2017-5715](https://nvd.nist.gov/vuln/detail/CVE-2017-5715)|
|Meltdown|Variant 3|Rogue Data Cache Load|[CVE-2017-5754](https://nvd.nist.gov/vuln/detail/CVE-2017-5754)|



### Is your VM at risk?

Yes, because there is no solution that fixes all Spectre and Meltdown vulnerabilities.

Your (the Cloud user's) application, the VM, runs in a virtualised environment.
This makes it a bit more complicated to determine the impact of Spectre and Meltdown.

As far as we know, the following is a reasonable summary of the various situations.

The size of the risk and the possible damage depends heavily on your situation. You should assess your situation and decide if the risk is acceptable. See the "useful links" below.
If you think the remaining risk is not acceptable, stop using the HPC Cloud until we have implemented the definitive solution against Spectre and Meltdown.

## What should you do?

In general: always keep your VM’s operating system and applications up to date and at least install all security updates. In case of a kernel update you need to reboot as well.

For Spectre and Meltdown in particular: run the tests to see if you are vulnerable. See the "useful links" below.

Prepare for the security maintenance downtime (see below) and make sure you or a colleague van stop your VMs in a controlled way.

## What does SURFsara do?

SURFsara follows the developments closely. 
We expect a major update to become available in the coming weeks. 
The HPC Cloud and all its VMs will have to go down to install the expected security update.

## Security maintenance downtime

We will have to bring all VMs in the HPC Cloud down to install the security updates on our hosts. Because this is a big inconvenience to you, our users, we will wait until pending solutions have been tested and released.
We expect the downtime to be a few days in the middle of Februari, outside our regular maintenance windows.

## Useful links

[2] https://spectreattack.com/  
[3] http://www.kb.cert.org/vuls/id/584653

