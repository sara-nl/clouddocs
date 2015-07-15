A VM can find itself on a number of different states. Each of those states have a name and a meaning. The state a VM is in also determines the set of states it can move to. Example state names are: PROLOG, BOOT, RUNNING...

The triggers to change state are _action_s. These actions can be triggered by a user on the UI or by the environment itself. Example action names are: create, shutdown, resume... You can see most of these on the UI:

![vm_actions_img](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/vm_actions.png)

##  The pause button

Under the pause button you can find the following actions:

* Suspend
* Power Off
* Power Off hard

#### Suspend

Can only be triggered when the VM is in state RUNNING.

_Suspend_ brings the VM to the SUSPENDED state, but first going through the SAVE state. The context of the VM is saved in the node where it is running. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. The OS and processes will continue running from the point they were left.

#### Poweroff

Can only be triggered when the VM is in state RUNNING.

_Poweroff_ brings the VM to the POWEROFF state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. And the OS will boot again.

#### Poweroff hard

Can only be triggered when the VM is in state RUNNING.

_Poweroff_ brings the VM to the POWEROFF state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **keeps blocking the resources** that the VM holds, so your quota keeps ticking.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is immediately restored: first it will go to BOOT and then RUNNING. And the OS will boot again.

##  The stop button

Under the stop button you can find the following actions:

* Stop
* Undeploy
* Undeploy hard

#### Stop

Can only be triggered when the VM is in state RUNNING.

_Stop_ brings the VM to the STOPPED state, but first going through the EPILOG state. The context of the VM is saved in the system datastore. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is **not** immediately restored: the scheduler must allocate resources again (the PROLOG state), then it will go to BOOT and then RUNNING. The OS and processes will continue running from the point they were left.

#### Undeploy

Can only be triggered when the VM is in state RUNNING.

_Undeploy_ brings the VM to the UNDEPLOYED state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM receives the corresponding **ACPI** signal, so that it can shut down gracefully. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

When you _Resume_ the VM (with the _Play_ button), it is **not** immediately restored: the scheduler must allocate resources again (the PROLOG state), then it will go to BOOT and then RUNNING. And the OS will boot again.

#### Undeploy hard

Can only be triggered when the VM is in state RUNNING.

_Undeploy_ brings the VM to the UNDEPLOYED state, but first going through the SHUTDOWN state. The context of the VM is **not** saved. 

This state **releases the resources** that the VM holds, so your quota does **not** tick. You keep your IP addresses.

The OS running on the VM does **not** notice anything. Persistent and non-persistent images will keep their changes for the next _Resume_ action. If the VM is deleted in this status, non-persistent images will loose their changes, but persistent images will keep their changes.

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