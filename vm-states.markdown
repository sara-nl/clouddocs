---
layout: default
---

# Virtual Machine states

A VM can find itself on a number of different states. Each of those states have a name and a meaning. The state a VM is in also determines the set of states it can move to. Example state names are: PROLOG, BOOT, RUNNING...

An _action_ triggers a state change. 
These actions can be triggered by a user on the UI or by the environment itself. Example action names are: create, shutdown, resume...
You can see most of these on the UI:

![vm_actions_img](images/vm_actions.png)

>**Note:**
>
> We recommend you **mainly** use the following actions for managing your VMs: 
> * **Shutdown**: the VM will shut down gracefully. Click the dust bin button and then *Shutdown*.
> * **Stop**: the VM keeps its changes for the next *Resume* action. Click on the stop square button and then *Stop*. A VM in STOPPED state does not consume quota.
> * **Resume**: resumes a STOPPED VM. Click on the play button. It will bring the STOPPED to RUNNING state.
>
> If you ever find a VM in a status that these actions cannot trigger any further changes, you may want to contact us at helpdesk@surfsara.nl. 

## The play button

The play button can only be clicked when the VM is in state SUSPENDED or STOPPED. It _resumes_ the VM to bring it to RUNNING.

##  The pause button

Under the pause button you can find the following actions:

* Suspend
* Power Off
* Power Off hard

#### Suspend

Can only be triggered when the VM is in state RUNNING.

_Suspend_ brings the VM to the SUSPENDED state, but first going through the SAVE state. The context of the VM is saved in the node where it is running. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. The OS and processes will continue running from the point they were left.

#### Poweroff

Can only be triggered when the VM is in state RUNNING.

_Poweroff_ brings the VM to the POWEROFF state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. And the OS will boot again.

#### Poweroff hard

Can only be triggered when the VM is in state RUNNING.

_Poweroff_ brings the VM to the POWEROFF state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. And the OS will boot again.

> **Note:**
>
> You can use the state POWEROFF to change the capacity of your VM (if you have allowed this from the VM's template) by editing the CPU and RAM values under the _Capacity_ tab of the VM's extended information screen.

##  The stop button

Under the stop button you can find the following actions:

* Stop
* Undeploy
* Undeploy hard

#### Stop

Can only be triggered when the VM is in state RUNNING.

_Stop_ brings the VM to the STOPPED state, but first going through the EPILOG state. The context of the VM is saved in the system datastore. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is **not** immediately restored: the scheduler must allocate resources again (the PROLOG state), then it will go to BOOT and then RUNNING. The OS and processes will continue running from the point they were left.

#### Undeploy

Can only be triggered when the VM is in state RUNNING.

_Undeploy_ brings the VM to the UNDEPLOYED state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is **not** immediately restored: the scheduler must allocate resources again (the PROLOG state), then it will go to BOOT and then RUNNING. And the OS will boot again.

#### Undeploy hard

Can only be triggered when the VM is in state RUNNING.

_Undeploy_ brings the VM to the UNDEPLOYED state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will lose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is **not** immediately restored: the scheduler must allocate resources again (the PROLOG state), then it will go to BOOT and then RUNNING. And the OS will boot again.

##  The reset button

Under the reset button you can find the following actions:

* Reboot
* Reboot hard
* Delete and recreate

#### Reboot

Can only be triggered when the VM is in state RUNNING.

_Reboot_ leaves the VM in the RUNNING state. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Persistent and non-persistent images will keep their changes after the reboot because the VM is **not** deallocated. 

The OS will go through a graceful reboot sequence.

#### Reboot hard

Can only be triggered when the VM is in state RUNNING.

_Reboot hard_ leaves the VM in the RUNNING state. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes after the reboot because the VM is **not** deallocated. 

The OS will boot again.

#### Delete and recreate

Can be triggered when the VM is in **any** state.

_Delete and recreate_ leaves the VM in the RUNNING state, after going through a CLEANUP and PROLOG cycle.

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking. Resources are reallocated in the same node.

The OS running on the VM does **not** notice anything. Non-persistent images will lose their changes, and persistent images may become inconsistent if there are pending I/O operations that could not be flushed.

The OS will boot again.

##  The table button

Under the table button you can find the following actions:

* Hold
* Release
* Boot

#### Hold

Can only be triggered when the VM is in state PENDING. 

_Hold_ leaves the VM in the HOLD state. It is intended as a means to delay the starting of a VM.

This state does **not** grab any resources, so your quota does not tick.

The OS in your VM does not notice anything. No image will suffer any change.

>**Note:**
>
>You can create a VM directly in HOLD status upong instantiating a template, by checking the box _Hold_ checkbox on the _Create Virtual Machine_ dialog.

#### Release

Can only be triggered when the VM is in state HOLD.

_Release_ resumes the start-up of a VM, to bring it to the RUNNING state.

This state will grab resources normally and let the quota start ticking.

The OS will boot again.

#### Boot

Can only be triggered when the VM is in state UNKNOWN or BOOT.

_Boot_ tries to force a normal start-up of your VM by poking the hypervisor, to bring it to the RUNNING state.

This state will grab resources normally and let the quota start ticking.

The OS may boot again.

## The dust bin button

Under the dust bin button you can find the following actions:

* Shutdown
* Shutdown hard
* Delete

#### Shutdown

Can only be triggered when the VM is in state RUNNING.

_Shutdown_ eliminates the VM from the system in a controlled way, first going through the SHUTDOWN state. 

This state **frees resources** that the VM holds, so your quota does not tick.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Non-persistent images will lose their changes, but persistent images will keep their changes. 

The OS will go through a graceful shutdown sequence.

You cannot _resume_ this VM; you can only instantiate its template again.

>**Note:**
>
> If your VM is not reacting to the shutdown command from the cloud web interface, see [VM not reacting to Shutdown](http://doc.hpccloud.surfsara.nl/vm-not-reacting-to-shutdown).

#### Shutdown hard

Can only be triggered when the VM is in state RUNNING.

_Shutdown_ eliminates the VM from the system, first going through the SHUTDOWN state. 
No check is made if the VM actually reacts and shuts down.
The OS running on the VM is terminated immediately and does not get a chance to properly shut down. 
As usual with a shutdown, non-persistent images will lose their changes, but persistent images will keep their changes.
The state of the disk data may be corrupted, however, due to possible caching by the OS.


This state **frees resources** that the VM holds, so your quota does not tick.


You cannot _resume_ this VM; you can only instantiate its template again.

#### Delete

Can be triggered when the VM is in **any** state.

_Delete_ abruptly destroys the image.

This state **releases resources** that the VM holds, so your quota does not keep ticking.

The OS running on the VM does **not** notice anything. Non-persistent images will lose their changes, and persistent images may become inconsistent if there are pending I/O operations that could not be flushed. Persistent images may become in status ERROR.

You cannot _resume_ this VM; you can only instantiate its template again.
