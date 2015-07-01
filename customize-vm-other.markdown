## Editing _Other_ options of a template

There is a tab on the `template`-editing screen that is labeled as _Other_. This allows you to add raw text for the hypervisor to interpret.

For example, for running a VM with Windows that will have Windows recognise and use 8 cores, you can add the following:

* _TYPE_: kvm
* _DATA_: `<cpu><topology sockets='1' cores='8' threads='1' /></cpu>`

Further, you can add _Custom Tags_, which are no more than ⟨key, value⟩ pairs that will be included in your VM's metadata. You can use them as you wish.