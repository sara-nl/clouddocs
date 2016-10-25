---
layout: default
---

# Dirty Cow exploit

The Dirty Cow exploit that affects the Linux kernel may affect your VM. If you allow multiple users to log into your VMs and you do not expect them to have root access, they may use thie Dirty Cow exploit to gain root access anyway. You may want to prevent that.

Our AppMarket images so far can also be compromised. Here is what you can do to protect your running VMs.

## Ubuntu

As explained in their [security/upgrades pagina](https://wiki.ubuntu.com/Security/Upgrades), you are advised to run:

```bash
sudo apt-get update && sudo apt-get dist-upgrade
```

Details on Ubuntu-related pages: 
* [Question at AskUbuntu.com](http://askubuntu.com/questions/839919/what-is-dirty-cow-bug-that-allows-local-user-to-gain-administrative-access)
* [Ubuntu Security Notices](https://www.ubuntu.com/usn/)

## CentOS

They have **not** published proper patches yet. Latest news can be seen on [RedHat's vulnerability page](https://access.redhat.com/security/vulnerabilities/2706661).

There is a **temporary** _workaround_ described in [RedHat's Bugzilla](https://bugzilla.redhat.com/show_bug.cgi?id=1384344#c13). But keep a weather-eye open for an actual patch.

Once the patch has been released, you will be able to install it with:

```bash
sudo yum update
```

---

## More links

* [dirtycow.ninja](https://dirtycow.ninja/)
