---
layout: default
---
# Image Persistence

In many cases, changes to a VM's disk should survive a shutdown an be present when it is launched again.
In some cases, you want an unchanged copy of a disk for each instantiation of the template. This behavior is controlled by a property called _persistent_ with values _yes_ or _no_.

## Image: persistent = no

When you import an appliance from the AppMarket, the disk image(s) normally have `persistent=no`.  
This means, in short, that __changes are lost__.

At each instantiation of the template, a copy of the image is made and attached as a disk to the VM. Any changes to the VM's disk are discarded when terminating the VM.

If you want to run multiple VMs with a disk from the same image, you need `persistent=no`, because one disk image cannot be connected to more than one VM. Compare this to a real hard drive that can only be connected to one PC at a time. `Persistent=no` creates a copy for each VM. This implies that changes to the disk are not shared with or propagated to the other VMs.

You can change the `persistent` property by selecting a disk and using the pencil icon to the right of the property
or the drop down menu to the right of the `clone` button.

If you have a non-persistent disk, but found that you have made changes you do want to keep. Please refer to the page about [storage snapshots](storage_snapshot).

![persistent_no](images/persistent_no.png)

## Image: persistent = yes

A disk image with `persistent=yes` will keep its changes after shutdown of the VM.

`Persistent=yes` implies that you cannot connect this disk image to more than one VM at the same time. 
Compare this to a real hard drive that can only be connected to one PC at a time.
It is possible to have the image in more than one template, as long as at most one template is instantiated.
This can be useful when a template with 32 cores needs a software update: use a similar template with only one core.

You can change the `persistent` property by selecting a disk and using the pencil icon to the right of the property
or the drop down menu to the right of the `clone` button.

![persistent_yes](images/persistent_yes.png)
