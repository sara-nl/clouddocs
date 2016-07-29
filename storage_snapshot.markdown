---
layout: default
---
# Save running disks as images

While running a VM, you make several changes to the image(s) of the VM: you'll install or update software, add, remove files and change the contents of files. If your image is non-persistent, these changes will not be remembered after the VM is shutdown. If you start a new VM with the same (non-persistent) image, all delete files will be there, all installed software will be missing etc. Please see the page about [image persistence](image_persistence) for more information.

In case you have a non-persistent image, but decide you want to store your changes anyway, you can save it as a separate image. This will create a new image as a copy of the disk, but in the state it is in the VM. This means it will have all changes you've made. To create a copy:

1. Put your VM in 'power off' state. You can do this by clicking on the VM and the choose 'power off' under the 'pause' button. For more advanced users: alternativelly you could unmount the disk within your VM's operating system. Or otherwise make sure that no changes are being made to the disk and any disk buffers are written to it.
2. Click on the VM and then on the 'Storage' icon. You should now see a page like in this snapshot:

![storage_snapshot](images/storage_snapshot_1.png)
3. Click on the 'save as' link behind the image you want to store. If this link is not here, OpenNebula did probably not see any changes to the image yet. After clicking on the link, you should see a window like this:

![storage_snapshot](images/storage_snapshot_2.png)
4. Fill out a name you want the new image to have. In the screenshot, I named it 'New copy'.
5. Click on the green button 'Save as'. Note that it can take some time before the copy is saved. It should appear with your other images in the OpenNebula interface. If not, please try again, or contact our helpdesk!
6. Once the disk is saved, you can restart your VM (press the 'play' button) if desired.
