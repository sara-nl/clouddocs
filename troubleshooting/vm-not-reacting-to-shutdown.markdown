---
layout: default
---

# VM not reacting to the Terminate button

### How `Terminate` _should_ work

When you click the Terminate button in the cloud web interface, the cloud interface will send an ACPI shutdown signal to your VM and keeps on monitoring the process. This event is very similar to when you press the power button on your PC. If your VM has an `acpid` daemon running, then the daemon will capture the signal and perform the requested power down.
After a few minutes, the cloud interface will notice that your VM has powered down and the VM will disappear from the list of running VMs.
Also, any persistent images that were used by this VM will return to a READY status.

### What if `Terminate` _does not_ work

If your VM does not have a running `acpid` daemon, the signal sent by the cloud interface will be ignored.
Even if the `acpid` daemon receives the signal, it could choose to ignore it for some reason.
The cloud interface will notice that the VM does not power down and will, after waiting about five minutes, set the VM back to a "RUNNING" state.

### How to gracefully `Terminate`

The way to perform a successful Terminate in the latter case is to power down the VM manually.
Try the following:

* prepare a terminal connection to the VM and log in as root (e.g. use `sudo`)
* click the "Terminate" button in the Cloud user interface, as explained in [Terminate](https://github.com/sara-nl/clouddocs/blob/gh-pages/vm-states.markdown#terminate)
* manually power down the VM: in the terminal, as root, issue the command
```
shutdown -h now
```

If the VM shuts down within five minutes of you pressing the button in the Cloud UI, the cloud interface will notice an "expected disappearance" of the VM and all will be well.
