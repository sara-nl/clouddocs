---
layout: default
---

# L1 Terminal Fault (L1TF), a.k.a. Foreshadow

|Table of Contents|
|-----|
|[Is your VM at risk?](#is-your-vm-at-risk)|
|[What should you do?](#what-should-you-do)|
|[What does SURFsara do?](#what-does-surfsara-do)|
|[Security maintenance downtime ](#security-maintenance-downtime)|
|[Background information](#background)|

## Is your VM at risk?

Yes, because currently, the hosts in the HPC Cloud are not yet patched.

Your application, the VM, runs in a virtualised environment alongside VMs from other users. 
These other VMs might, with malicious software, try to read parts of your VM's memory that might contain sensitive information.

_Exception:_ In case a HPC Cloud host server is assigned exclusively to your project, your VMs are the only ones on it. This reduces the risk of malicious software dramatically.

We are waiting for the latest patches to settle down and plan a maintenance window.

If you need more information or help assessing the risk for your VMs, please write to the helpdesk@surfsara.nl.

## What should you do?

- _In general:_ always keep your VM’s operating system and applications up to date and at least install all security updates. In case of a kernel update you need to reboot as well.
- Prepare for the security maintenance downtime (see below) and make sure you or a colleague can stop your VMs in a controlled way.

## What does SURFsara do?

SURFsara follows the developments closely. 
We expect more updates to become available in the coming weeks. 

The HPC Cloud and all its VMs will have to go down to install the expected security update.

## Security maintenance downtime

We will have to bring all VMs in the HPC Cloud down to install the security updates on our hosts. 
Because this is a big inconvenience to you, our users, we will wait until pending solutions have been tested and released.
We expect the downtime to be a day, during our regular maintenance window, on 9 October.

## Background

### What is L1 Terminal Fault (L1TF), a.k.a. Foreshadow?

"L1 Terminal Fault" is a bug in Intel CPUs that may disclose data to attackers, possibly containing passwords or other information that should be kept secret. 
These bugs are not in the operating system, but in the CPU itself.
This implies that all operating systems are vulnerable, including your PC.
Note that the bug is currently only known to exist in Intel processors.

Some mitigations are available for BIOS and operating systems.

### Mitigation/Remediation

Complete mitigation of the L1 Terminal Fault requires three changes:

- Page Table Inversion: a kernel update
- Flushing the L1 Data Cache when switching between virtual machines
- Disable SMT (hyper threading)

Each of these changes independently provides some protection against different parts of an attack.

### Additional (technical) resources:

- [foreshadowattack.eu](https://foreshadowattack.eu/)
- [CVE-2018-3620](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3620),
  [CVE-2018-3646](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3646)
- [LWN.net](https://lwn.net/SubscriberLink/762570/92ac2482d8fb872f/)
- [RedHat vulnerabilities](https://access.redhat.com/security/vulnerabilities/L1TF)
- [RHSA-2018:2384 - Security Advisory](https://access.redhat.com/errata/RHSA-2018:2384)
