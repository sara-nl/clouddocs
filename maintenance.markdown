---
layout: default
---

## Maintenance windows HPC Cloud

### <a name="current"></a> Current

Up & running.

### <a name="future"></a> Future maintenance windows

Note that not every maintenance window will actually include that we will do maintenance. Please see the policy below for more information.

|   Status    |   Date (start / end)       | Comment
|:------------|:----------------------------|:----
|   Scheduled   |   11-02-2020 / 12-02-2020
|   Scheduled   |   10-03-2020 / 11-03-2020
|   Scheduled   |   14-04-2020 / 15-04-2020
|   Scheduled   |   12-05-2020 / 13-05-2020
|   Scheduled   |   09-06-2020 / 10-06-2020
|   Scheduled   |   14-07-2020 / 15-07-2020
|   Scheduled   |   11-08-2020 / 12-08-2020
|   Scheduled   |   08-09-2020 / 09-09-2020
|   Scheduled   |   13-10-2020 / 14-10-2020
|   Scheduled   |   10-11-2020 / 11-11-2020
|   Scheduled   |   08-12-2020 / 09-12-2020
{: class="table"}
{: class="table"}

### <a name="policy"></a> Policy

Maintenance and changes can only be done during on of to the maintenance windows. This means that (part of) the service can be unavailable, for example the web UI.

All HPC Cloud users are notified at least one month in advance if:

 * more than short interruptions (> 5 minutes) are expected
 * if all user VMs have to be shutdown

If no changes are planned or only changes with some short interruptions expected (< 5 minutes), no notification will be send.

#### Exceptions

Exceptions to this policy are made in the following cases:

 * Urgent changes are needed for the continuity of the service
 * Patches for high-risk security issues

In these cases, the changes will be applied as soon as needed, even outside maintenance windows.

 * In case this results in an average to long interruption (> 15 minutes), users will be informed afterwards
 * In case VMs of users need to be shutdown or rebooted, affected users will be informed as soon as possible, preferrably before shutdown/reboot.

### <a name="past"></a> Past

(most recent first)

|   Status    |   Date (start / end)        |   |
|:------------|:----------------------------|:--|
|   Finished   |   12-02-2020 13:42 - 14:07 | Unscheduled outage due to a network issue. Impact: UI & VMs without connectivity to the Internet
|   Finished   |   14-01-2020 00:00 / 15-01-2020 17:00 | Security maintenance and replacement of network components. Impact: service unavailable, all VMs need to go down.
|   Finished   |   12-11-2019 08:00 - 09:00 | Security maintenance. Impact: UI/API downtime; VMs are not affected.
|   Cancelled  |   10-09-2019 / 11-09-2019 | Upgrade ONe to 5.8 and replace network components. Impact: service unavailable; all VMs need to go down.
|   Finished   |   31-07-2019 09:00 - 16:20 | Unscheduled maintenance. Impact: UI/API unreachable; major network outage affecting many VMs; Ceph backend unreachable.
|   Finished   |   31-07-2019 07:00 - 09:00 | Update network infrastructure components. Impact: short interruptions (+/- 1 min) for traffic can be expected; 'lightpath' link unavailable.
|   Finished   |   09-07-2019 13:00 - 15:24 | Maintenance scheduled to improve service backend resilience. Impact: UI/API will not be available. VMs are not affected.
|   Finished   |   27-06-2019 20:03 - 20:10 | Security maintenance (kernel vulnerability TCP Sack Panic). User's impact: none.
|   Finished  |   18-06-2019 17:00 - 18:13 | Maintenance scheduled to improve service backend resilience. Impact: UI/API will not be available. VMs are not affected.
|   Finished   |   04-06-2019 / 05-06-2019 |  Scheduled security maintenance downtime (MDS vulnerabilities) |
|   Finished   |   02-04-2019 07:00-12:00  | System maintenances & redundancy tests of SURFsara network components. No impact for running VMs.
|   Finished |   08-03-2019 12:00 - 13:00 | Unscheduled maintenance. Performance degradation of the hardware hosting UI and 2FA service components. Requires a reboot and consequent unavailability of these services. No impact for running VMs.
|   Finished  |   12-02-2019 08:20-08:40 | UI/API downtime for maintenance. VMs not affected.         |
|   Finished  |   11-12-2018 / 11-12-2018 | Scheduled downtime for security maintenance (L1TF)        |
| Finished | 10-07-2018 / 11-07-2018 | Scheduled downtime for security maintenance (Spectre/Meltdown) |
| Finished | 02-03-2018 / 05-03-2018 | Scheduled downtime for security maintenance (Spectre/Meltdown) |
|   Finished  |   10-11-2017 12:36-12:56 | Scheduler did not place virtual machines, running virtual machines not affected. |
|   Finished  |   11-10-2017 10:30-10:45 | The UI does not allow logins. |
|   Finished  |   02-10-2017 / 06-10-2017   | Scheduled maintenance. Major overhaul of the underlying network infrastructure. |
|   Finished  |   14-08-2017  | Solved: Outgoing SSH traffic was blocked since 26-07-2017.  |
|   Finished  |   26-07-2017 : 16:45 / 26-07-2017 : 21:15  | Unscheduled maintenance. Due to unexpected problems with one of our switches, the UI and part of the VMs on the HPC Cloud were disconnected from the internet. No network traffic in or out was possible. Internal network traffic, between VM's appear to have been unaffected. At 21.15 the problems were solved. |
|   Finished   |   27-06-2017 / 27-06-2017   | Scheduled maintenance; there were a few short interruptions of the UI. No influence on running VMs  |
|   Finished  |   21-06-2017 : 15:35 / 21-06-2017 : 16:49  | Unscheduled maintenance. During this period we experienced several disk issues causing requests being blocked in our storage systems. At 16:45 we removed the disks causing this issue, the storage systems became stable at 16:49. Running VMs were not affected.   |
|   Finished  |   18-04-2017 / 19-04-2017   | Scheduled maintenance |
|   Finished  |   20-02-2017 : 14:35 / 20-02-2017 : 15:30   | Unscheduled maintenance. At 14:35 we received alerts that one of our backends was failing due to memory errors. To reduce load on our environment we temporarily closed all logins. These services were moved to the other node at 15:00, after this was completed we checked the environment. We opened our HPC Cloud again for logins at 15:30. Running VM's are not affected. |
|   Finished  |   24-01-2017 / 25-01-2017   | Scheduled maintenance  |
|   Finished  |   02-09-2016 / 09-09-2016   | moved to new data center |
|   Finished  |   26-07-2016 / 27-07-2016   |   |
|   Finished  |   05-04-2016 / 06-04-2016   |   |
|   Finished  |   02-02-2016 / 03-02-2016   |   |
{: class="table"}
