---
layout: default
---
# Storage snapshot

While running a VM, you make several changes to the image(s) of the VM: you'll install or update software, add, remove files and change the contents of files. If your image is non-persistent, these changes will not be remembered after the VM is shutdown. If you start a new VM with the same (non-persistent) image, all delete files will be there, all installed software will be missing etc. Please see the page about [image persistence](image_persistence) for more information.

In case you have a non-persistent image, but decide you want to store your changes anyway, you can take a snapshot of it. This will create a new image as a copy of the image, but in the state it is in the VM. This means it will have all changes you've made. To create a snapshot:

1. Click on the VM and then on the 'Storage' icon. You should now see a page like in this snapshot:
![storage_snapshot](images/storage_snapshot_1.png)
2. Click on the 'snapshot' link behind the image you want to store. If this link is not here, OpenNebula did probably not see any changes to the image yet. After clicking on the link, you should see a window like this:
![storage_snapshot](images/storage_snapshot_2.png)
3. Fill out a name you want the new image to have. In the screenshot, I named it 'New copy'.
4. Choose a snapshot type. 'Deferred' is the most sensible default. It means it will take the snapshot after shutdown. This way, the file system will be in a consistent state. Alternatively you can choose 'hot', which will create the snapshot immediately, but this could mean that your operating system might not stored all the changes in it and the file system can be in an inconsistent state.
5. Click on the green button 'Take snapshot'
6. If you choose for the 'deferred' snapshot type, you must not forget to shutdown your VM gracefully. This can wait until you're done with the VM, but remember that the snapshot cannot be used until the machine is shutdown. To gracefully shutdown the VM, select it and click on the red icon of a garbage bin. Then choose 'Shutdown'. OpenNebula will now let your VM know that it has to shutdown and after a certain amount of time, the VM will disappear from your list of VM's.
