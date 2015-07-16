# Image Persistence

In many cases, changes to a VM's disk should survive a shutdown an be present when it is launched again.
In some cases, you want an unchanged copy of a disk for each instantiation of the template. This behavior is controlled by a property called _persistent_ with values _yes_ or _no_.

## Image: persistent = no

When you import an appliance from the AppMarket, the disk image(s) normally have `persistent=no`.  
This means, in short, that __changes are lost__.

At each instantiation of the template, a copy of the image is made and attached as a disk to the VM. Any changes to the VM's disk are discarded when terminating the VM.

![persistent_no](https://doc.hpccloud.surfsara.nl/oortdoc/docs/uploads/707dc6b9bad33fa149319adc1dd46548/persistent_no.png)

## Image: persistent = yes

![persistent_yes](https://doc.hpccloud.surfsara.nl/oortdoc/docs/uploads/1608055fdce0fe9e41cc10176dbb9554/persistent_yes.png)
