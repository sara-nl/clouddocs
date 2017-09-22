---
layout: default
---

# Problem connecting to resumed Ubuntu 14.04 VM

When using the Ubuntu 14.04 _Apps_ that we provide, you may run into the problem that, if you shut down your VM and you start it up again at a later point, your VM may not have proper network connectivity any longer. 


## Step by step explanation

These steps cannot be carried out through ssh because you do not have a network connection available. You must use the HPC Cloud UI browser embedded VNC client. You might also profit from reading our [VNC recovery access](vnc_recovery_access) page as well, which explains how to get root access to your VM without a root password.

> **Note:**
>
> Copy-paste functionality does not work through VNC, everything has to be typed by hand.

Create a file `/etc/init.d/clear-cloud-init.sh` with the contents:

```bash
#!/bin/bash
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
rm -rf "/var/lib/cloud"
```

Make the file executable

```bash
sudo chmod +x /etc/init.d/clear-cloud-init.sh
```
Make the file run in different [runlevels](https://en.wikipedia.org/wiki/Runlevels):

```bash
sudo update-rc.d clear-cloud-init.sh defaults
```

Then reboot your operating system (e.g.: `sudo reboot now`). You should now have connection again.

---

## In one go

You can type all of this in one go to actually do what is explained in the previous section:

```bash
sudo su -
cat <<EOF > /etc/init.d/clear-cloud-init.sh
#!/bin/bash
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
rm -rf "/var/lib/cloud"
EOF
chmod +x /etc/init.d/clear-cloud-init.sh
update-rc.d clear-cloud-init.sh defaults
reboot now
```
