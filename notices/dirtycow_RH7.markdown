---
layout: default
---

# Dirty Cow exploit, RedHat 7

The Dirty Cow exploit that affects the Linux kernel may affect your VM. See [Dirty Cow exploit](dirtycow) for general information.

RedHat 7 has an update that fizes this bug, which is also applicable for CentOS 7.

## CentOS 7

First of all, make sure your OS disk is [persistent](../image_persistence).
Otherwise, your update will be reverted when you start another VM booting from this disk.

### Download and run the test

- Log in to your VM.
- Download the test: 
  `wget https://access.redhat.com/sites/default/files/rh-cve-2016-5195_2.sh`
- Run the test to see if your OS version is vulnerable or not:
  `bash rh-cve-2016-5195_2.sh`

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

### Check

Now run the test again and check that your OS is no longer vulnerable.
Expected output:

```
Your kernel is 3.10.0-327.36.3.el7.x86_64 which is NOT vulnerable.
```
