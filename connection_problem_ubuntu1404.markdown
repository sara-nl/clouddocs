---
layout: default
---

# Problem connecting to resumed ubuntu 14.04 VM

This is a step-by-step solution for solving the connection problem in an resumed unbuntu 14.04 VM. Because of the connection problem this solution can't be implemented through ssh. It has to be implemented in buildin VNC client. Because in the VNC console copy-paste functionalty is not working everything has to be typed by hand.


Create a file `/etc/init.d/clear-cloud-init.sh` with the contents:

```bash
#!/bin/bash
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
rm -rf "/var/lib/cloud"
```
Make the file executable
```bash
chmod +x /etc/init.d/clear-cloud-init.sh
```
Make the file run in different runlevels:

```bash
sudo update-rc.d clear-cloud-init.sh defaults
```
