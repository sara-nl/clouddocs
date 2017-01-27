---
layout: default
---

# Resuming stopped VMs from OpenNebula 4 in OpenNebula 5

Problem: VMs that were started in OpenNebula 4 and STOPPED, get stuck in state PENDING when resuming.

### Diagnosis

The underlying problem seems to be that the VNC port range used by OpenNebula has changed between v4 and v5 and that OpenNebula 5 refuses to schedule an VM with a 'old' VNC port.

### Workaround

* You can change the configuration of a PENDING VM. You can go to the _Conf_ tab and click the green _Update Configuration_ button.
<div style="max-width:640px;" markdown="1">
![Update configuration](/images/update_config.png)
</div>

* Go to the _Input/Output_ subtab and change the _Graphics_ radio button from **VNC** to **none**. 
<div style="max-width:640px;" markdown="1">
![Update configuration](/images/update_no_vnc.png)
</div>

* After clicking _Update_ the VM should be rescheduled and change to state PROLOG in a few seconds/minutes.
