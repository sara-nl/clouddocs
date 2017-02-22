---
layout: default
---

# Storage Cluster problems

SURFsara strives to be transparent about incidents on the HPC Cloud infrastructure. This report discloses an issue that affected operations on the storage cluster on Sunday 19th through Monday 20th of February 2017.

## The story

* The storage cluster is built on Ceph (Software Defined Storage) and consists of 48 nodes with a current storage capacity of 2 PB (Petabyte). We use the standard replication factor, which means that all files/objects are replicated 3 times throughout the cluster.

* Sunday 19th at 19:25 the logs started to record problems on the storage nodes. Parts of the cluster were not able to reach each other and started to ask the Ceph monitor to remove them from the cluster. The monitor does not comply immediately but needs confirmation from different nodes that a certain disk is no longer behaving correctly.

* Sunday 19th at 19:27 the first disk (OSD in Ceph lingo) was removed from the cluster. The whole cluster started to behave erratically removing and adding OSD's the whole time.

* 30 Minutes later, 308 (out of 450) OSD's were left in the cluster and progressed until until 214 OSD's were operational. The cluster went to shutdown mode and no more client requests were processed.

* Monday 20th at 05:30 our engineers noticed the problem by logging in to the utility node. They immediately started all the missing OSD's manually.

* Monday 20th at 11:00 the cluster was back to a state (still in warning) where we could restart all services and VM's affected by this problem.

* The Ceph cluster was in a Healthy state at 13:36.


## Issues identified

* Ceph storage nodes cannot see each other (still investigating the how/why/what)
* Memory DIMM failure on one of our utility nodes (which runs all kinds of services to maintain our infrastructure), resulting in lack of general cluster status information (and, in particular, lack of alerts about services degrading).

## Lessons learned

* More monitor nodes (currently being worked on)
* Ceph OSD's will always be started again after being removed from the cluster; this is considered a workaround until we find the root cause of the failing OSD's

# Impact

* During Sunday and Monday, VM's running with images backed by Ceph may have felt slow read/write operations.
* Mount points backed by Ceph images may have turned into read-only mode.

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
