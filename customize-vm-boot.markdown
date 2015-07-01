## Editing _OS Booting_ options of a template

>**Remember:**
>
>VMs are created by instantiating a `template`. When you create a VM, the HPC Cloud looks for a place to run it where there actually is enough room. Then it copies the `image`s there and it starts a hypervisor (in our case, KVM); that is your VM. The hypervisor will look at the drives that exist within the `image`s and try to boot an operating system from them.

On the _OS Booting_ tab of the `template`-editing screen you can specify information that you want KVM to know so that your VM boots according to these.

There are 4 subsections on this tab:
* _Boot_: for general booting options
* _Kernel_: to boot from specific `kernel`s
* _Ramdisk_: to attach `ramdisk`s
* _Features_: other low-level virtual hardware-related options

### The _Boot_ subsection:
* _Arch_: specify the machine architecture
* _Machine type_: the _machine type_ for libvirt
* _Root_: the device to be mounted as root
* _1st Boot_, _2nd Boot_, _3rd Boot_: order in which drives must be checked to boot from