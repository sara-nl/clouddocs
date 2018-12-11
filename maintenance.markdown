---
layout: default
---

## Maintenance windows HPC Cloud

### Current

Up and running.

### Future maintenance windows

Note that not every maintenance window will actually include that we will do maintenance. Please see the policy below for more information.

|   Status    |   Date (start / end)       | comment
|:------------|:----------------------------|:----
|   Scheduled   |   11-12-2018 / 12-12-2018 | Security maintenance. UI & API not available. VMs are down with exception for the dedicated clusters.
|   Scheduled   |   08-01-2019 / 09-01-2019 
{: class="table"}

### Policy

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

### Past

(most recent first)

|   Status    |   Date (start / end)        |   |
|:------------|:----------------------------|:--|
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
