---
layout: default
---

# Storage Cluster problems

Sometimes, things go wrong at SURFSara. When that happens, we want to be transparent about it and own up to our mistakes. In that light, we are disclosing an issue that affected operations on the storage cluster on Sunday 19th through Monday 20th of February 2017.

## The story

The storage cluster is built on Ceph (Software Defined Storage) and consists of 48 Nodes with a total of 2.15 PB (Petabyte) storage. We use the standard 3x replication which means that all files/objects are replicated 3 times throughout the cluster. The first problems started to appear in the log files of the storage nodes around 19:25 on Sunday. It seemed that certain parts of the cluster were not able to reach eachother and started to ask the Ceph monitor to remove them from the cluster (the monitor does not comply immediately but needs confirmation from different nodes that a certain disk is no longer behaving correctly).

Around 19:27 the first disk (OSD in Ceph lingo) was removed from the cluster; after that, the whole cluster started to behave erratically, removing and adding OSD's the whole time.

30 Minutes later we only had 308 (of the 450) OSD's left in the cluster and this progressed until we only had 214 OSD's left. After that, the cluster went in shutdown mode and no client requests were processed anymore.

A few hours later (around 05:30) our engineers noted the problem when logging in to the utility node and soon noticed the problem with the ceph cluster as well, immediately starting all the missing OSD's manually. Around 11:00 on Monday the cluster was back in a state (still in warning) where we could begin restarting all services and VM's that were affected by this problem which lasted throughout Monday. The cluster itself was back in a Healthy state at around 13:36.

## Issues identified

* Ceph storage nodes cannot see each other (still investigating the how/why/what)
* Memory DIMM failure on one of our utility nodes (which runs all kinds of services to maintain our infrastructure), resulting in lack of general cluster status information (and, in particular, lack of alerts about services degrading).

## Lessons learned

* More monitor nodes (currently being worked on)
* Ceph OSD's will always be started again after being removed from the cluster, this is considered a workaround until we find the root cause of the failing OSD's

# Impact

* During Sunday and Monday, VM's running with images backed by Ceph may have felt slow read/write operations on disks backed by Ceph images.
* Mount points backed by Ceph images may have turned into read-only mode

## What to do (as a user)

* If you have mount points backed by Ceph, you may want to reboot your VM to ensure your images are mounted again.
  * Or, you can just re-mount your partitions backed by Ceph images yourself and run a health-checking tool like `fsck`.
* If you have trouble or questions, contact us at: helpdesk@surfsara.nl

## Timeline

* 2017-02-19 19:25:25 first OSD fail
* 2017-02-19 19:45 crash utility node (DIMM error)
* 2017-02-19 20:47:24 last OSD fail (214 OSD's left)
* 2017-02-19 21:04 Cluster in shutdown state (no more client connections)
* 2017-02-20 01:31 crash utility node (DIMM error)
* 2017-02-20 05:31 manual start of missing OSD's
* 2017-02-20 13:36:43 Cluster healthy back
