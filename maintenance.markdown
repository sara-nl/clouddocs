---
layout: default
---

## Maintenance windows HPC Cloud

### Current

|   Status    |   Date (start / end)        |   |
|:------------|:----------------------------|:--|
| Running     |   02-10-2017 / 06-10-2017   | Major overhaul of the underlying network infrastructure. Total power down of infrastructure, all VMs must be terminated.  |

### Future

|   Status    |   Date (start / end)        |   |
|:------------|:----------------------------|:--|
|   Planned   |   16-01-2018 / 17-01-2018   |   |
{: class="table"}

### Past

(most recent first)

|   Status    |   Date (start / end)        |   |
|:------------|:----------------------------|:--|
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
