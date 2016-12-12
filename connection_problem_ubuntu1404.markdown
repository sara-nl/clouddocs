---
layout: default
---

# Problem connecting to resumed ubuntu 14.04 VM

This is a step-by-step solution for solving the connection problem in an resumed ubuntu 14.04 VM. Because of the connection problem this solution can't be implemented through ssh. It has to be done via the HPC Cloud UI browser embedded VNC client. Because in the VNC console copy-paste functionality is not working everything has to be typed by hand.


Create a file `/etc/init.d/clear-cloud-init.sh` with the contents:

```bash
#!/bin/bash
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
rm -rf "/var/lib/cloud"
```

Make the file executable

```bash
suduo chmod +x /etc/init.d/clear-cloud-init.sh
```
Make the file run in different [runlevels](https://en.wikipedia.org/wiki/Runlevels):

```bash
sudo update-rc.d clear-cloud-init.sh defaults
```

Then reboot your operating system (e.g.: `sudo reboot now`). You should now have connection again.

> **Note:**
> All in one:
>```bash
sudo su -
>
cat <<EOF > /etc/init.d/clear-cloud-init.sh
>
#!/bin/bash
>
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
>
rm -rf "/var/lib/cloud"
>
EOF
>
chmod +x /etc/init.d/clear-cloud-init.sh
>
update-rc.d clear-cloud-init.sh defaults
>
reboot now
```
