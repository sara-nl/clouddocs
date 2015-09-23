---
layout: default
---
## Editing _OS Booting_ options of a template

>**Remember:**
>
>VMs are created by instantiating a `template`. When you create a VM, the HPC Cloud looks for a place to run it where there actually is enough room. Then it copies the `image`s there and it starts a hypervisor (in our case, KVM); that is your VM. The hypervisor will look at the drives that exist within the `image`s and try to boot an operating system from them.

On the _OS Booting_ tab of the `template`-editing screen you can specify information that you want KVM to know so that your VM boots according to that.

There are 4 subsections on this tab:

* _Boot_: for general booting options
* _Kernel_: to boot from specific `kernel`s
* _Ramdisk_: to attach `ramdisk`s
* _Features_: other low-level virtual hardware-related options

Our recommendation on this _OS Booting_ tab is that in the _Features_ subsection you check for _ACPI_: Yes and _Localtime_: No. That way, your VM will take the time from the hardware where it is running, and it may help it recover the time after you STOP it.

---

>**NOTE on the _OS Booting_ options**:
>
>The _OS Booting_ options that you can see on the screen are very specific ones that we do not use  every day. If you think you need to use them, we recommend you try and learn about them on the official OpenNebula [documentation](http://docs.opennebula.org/) (for example, [here](http://docs.opennebula.org/4.12/user/virtual_resource_management/vm_guide.html)). And if you find benefits in using them, please send us an e-mail to let us know: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).
