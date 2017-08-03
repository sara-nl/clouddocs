---
layout: default
---

# Recover VM in 'FAILURE' state

<div class="alert alert-info" markdown="1">
<i class="fa fa-info-circle fa-2x" aria-hidden="true">Note</i><br>

Not every user is able to access the _Recover_ menu at this stage. We are working on allowing all users who have the _group admin_ role to access this menu. 

In case of doubt, you can always e-mail the helpdesk to ask for help. They can figure out why the VM was in failure mode and help you with the recovery. If you know what you are doing or have no valuable data on the VM, proceed as described below.

</div>

When a VM is in 'FAILURE' state, most regular actions are no longer available. This includes shutting down and terminating (deleting) the VM. Group admins either already have, or can request, the possibility to 'recover' such VM's with the method described here:

1. Select the VM
2. From the buttons at the top of the page, choose the one with the three lines (as indicated in the screenshot below)
 ![grub_menu](images/restorebutton.png)
3. From the now showing menu, choose 'recover'
4. This will show you a dialog window with several options in a dropdown box. Select the appropriate action (see table below) and choose 'OK'

Possible options:

| retry | Will retry to start the VM. This is a relatively harmless option as it will not delete anything |
| delete | Will delete the VM immediately. This has the risk of losing data, though if the VM has never run, there can be no data on it, except what is already on the images |
| delete-recreate | Will delete the VM and recreates it with the same setting. You have the same risk of dataloss as with 'delete'. It does have a higher chance of success than just 'retry' |
