---
layout: default
---

> **Note:**
>
> Comes from [the general notice](dirtycow) on the Dirty Cow exploit.

# Dirty Cow exploit on RedHat and CentOS 

Your VM running CentOS may be affected by the [Dirty Cow exploit](dirtycow).

RedHat have released a patch that fixes this bug, which is applicable for CentOS 7 and a recent CentOS 6.

Here are the update instructions for your VM running CentOS.

### Persistency of the OS disk

First of all, make sure your OS disk is [persistent](../image_persistence).
Otherwise, your security update will be lost when you start another VM booting from this disk.

### Download and run the test

- Log in to your VM.
- Download the test: 
  `wget https://access.redhat.com/sites/default/files/rh-cve-2016-5195_2.sh`
- Run the test to see if your OS version is vulnerable or not:
  `bash rh-cve-2016-5195_2.sh`

Expected output for CentOS 7:

> Your kernel is 3.10.0-327.el7.x86_64 **which IS vulnerable**.

Expected output for CentOS 6:

>Your kernel is 2.6.32-642.el6.x86_64 **which IS vulnerable**.

### Prepare for update

Make sure you do not use a mirror, but access source repository.

- Become root in your VM.
- Edit the repo config file `/etc/yum.repos.d/CentOS-Base.repo` and make sure the `updates` section has a has in front of the `mirrorlist` and no hash in front of the `baseurl`:

```
[updates]
name=CentOS-$releasever - Updates
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
```

### Update and reboot

With these settings, run an update and reboot.

- As root: `yum update`
- and `reboot`

The reboot will (of course) log you out of your SSH session.

### Check

Now run the test again and check that your OS is no longer vulnerable.

Expected output for CentOS 7:

> Your kernel is 3.10.0-327.36.3.el7.x86_64 **which is NOT vulnerable**.

Expected output for CentOS 6:

> Your kernel is 2.6.32-642.6.2.el6.x86_64 **which is NOT vulnerable**.

### Shutdown

The security update is complete, you now need to shutdown the VM in order to save the disk image back to the storage.

Log in to the OpenNebua UI, select the running VM and use the red drop-down to "Terminate" your VM.

After a successful shutdown you can make the OS disk non-persistent again if needed.

### Test again

_Advice:_ Test with the vulnerebility with a fresh VM to convince yourself that new VMs are indeed protected.
