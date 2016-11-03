---
layout: default
---

# Dirty Cow exploit

<div style="float:right;max-width:300px;" markdown="1">
![Dirty Cow logo](https://dirtycow.ninja/cow.svg)
</div>

The [Dirty Cow exploit](https://en.wikipedia.org/wiki/Dirty_COW) that affects the Linux kernel may affect your VM. If you allow multiple users to log into your VMs and you do not expect them to have root access, they may use thie Dirty Cow exploit to gain root access anyway. You may want to prevent that.

Our AppMarket images have been updated on 26-10-2016.

## Ubuntu

As explained in their [security/upgrades pagina](https://wiki.ubuntu.com/Security/Upgrades), you are advised to run at least:

```bash
sudo apt-get update && sudo apt-get dist-upgrade
```

If you are running a 14.04 version of Ubuntu with a 4.2 kernel (check the output of `uname -rv`) you will also need to upgrade to the xenial kernel stack:

```bash
sudo apt-get install --install-recommends linux-generic-lts-xenial
```

When the upgrades are finished, you will have to reboot so that you start using the new kernel.

Details on Ubuntu-related pages: 

* [Question at AskUbuntu.com](http://askubuntu.com/questions/839919/what-is-dirty-cow-bug-that-allows-local-user-to-gain-administrative-access)
* [Ubuntu Security Notices](https://www.ubuntu.com/usn/)

## CentOS

For both Centos 6.x and 7.x updated kernels have been made available by RedHat. you will be able to install it with:

```bash
sudo yum update
```

---

## More links

* [dirtycow.ninja](https://dirtycow.ninja/)
