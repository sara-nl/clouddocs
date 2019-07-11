---
layout: default
---

# VM "pending" because of VNC port problem

Sometimes, a VM stays in "pending" mode forever because of a bug in OpenNebula, the cloud management software for the HPC Cloud.

This only affects VMs with a "VNC console" attached, because it is a bug with the network port allocation needed to connect to the VNC console.

If you do not need direct console access to your VM, but can work over an SSH connection, we advise to remove the VNC console from the template for your VM.

## How to detect

Detection is somewhat difficult.
When your VM stays pending without an obvious cause, the VNC port problem may be the cause.

First of all, check that your VM has a VNC console attached.
Without a VNC console, the problem cannot occur. 

- check the pending VM
- check the template

## How to fix 1: remove VNC console

### Remove the VNC console from the template

This will prevent future VMs from using a VNC console.

### Remove the VNC console from the pending VM

Here is how to remove the VNC console from a pending VM:

- in the OpenNebula UI, go to Instances/VMs and select the pending VM
- select tab “Conf”  
  ![x](images/vm-conf.png)
- click the green button "Update Configuration”  
  ![x](images/conf-update.png)
- select tab "Input/Output"
- in “Graphics", select radio button “None"  
  ![x](images/graphics-none.png)
- click “Update”

The VM should begin deploying, but without a VNC console.

## How to fix 2: VNC port roulette

You may or may not have the permission to "Hold" the deployment of a VM.
If you do, this is a way to try and make the VM work while keeping the VNC console.

1. "Hold" the deployment  
  ![x](images/vm-hold.png)
2. Remove the VNC port from the VM (see above)
3. Add a VNC port to the VM (as above, but select "VNC" again instead of "None", and check that you have a tablet as input)
4. "Release" the hold from step 1

This will assign a different VNC port to the VM and, with some luck, this new port does not have the problem.
