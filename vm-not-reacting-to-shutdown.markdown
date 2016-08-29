---
layout: default
---

# VM not reacting to Shutdown

### How Shutdown _should_ work

When you issue a shutdown command from the cloud web interface, the cloud interface will send an ACPI shutdown signal to your VM and keeps on monitoring the process. This event is very similar to when you press the power button on your PC. If your VM has an acpid daemon running, then the the daemon will capture the signal and perform the requested shutdown.
After a few minutes, the cloud interface will notice that your VM has shutdown and the VM will disappear from the list of running VMs.
Also, any persistent images that were used by this VM will return to a READY status.

### What if Shutdown _does not_ work

If your VM does not have a running acpid daemon, the signal sent by the cloud interface will be ignored.
Even if the acpid daemon receives the signal, it could choose to ignore it for some reason.
The cloud interface will notice that the VM is not disappearing and will, after waiting about five minutes, set the VM back to a "RUNNING" state.

### How to gracefully Shutdown

The way to perform a successful shutdown in this case is to make shutdown the VM manually.
Try the following:

* prepare a terminal connection to the VM and log in as root (e.g. use `sudo`)
* click the "Shutdown" button in the Cloud user interface, as explained in [Shutdown](https://github.com/sara-nl/clouddocs/blob/gh-pages/vm-states.markdown#shutdown)
* manually shutdown the VMs: in the terminal, as root, issue the command
```
shutdown -h now
```

If the VM shuts down within five minutes of you pressing the button in the Cloud UI, the cloud interface will notice an "expected disappearance" of the VM and all will be well.
