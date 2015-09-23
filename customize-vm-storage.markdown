---
layout: default
---
## Editing _Storage_ options of a template

>**Remember:**
>
>VMs are created by instantiating a `template`, which is where you specify which `image`s the VM will need. Multiple VMs can **share** `image`s (regardless of any `template`s that the VMs or `image`s may be related to) only when the `image`s are **not _persistent_**.

Storage for a VM is specified in terms of `disk`s (which are `image`s linked to `template`s). On the _Storage_ tab of the `template`-editing screen, you can see two columns:

* on the left, the list of all `disk`s already defined on that `template`
* on the right, the particularities for a `disk` selected from the left.

You can add as many `disk`s as you need to a given `template`, each referring to an existing `image` or to a _volatile_ `disk`. 

>**NOTE:**
>
> When you import an _appliance_ from the AppMarket, that action usually downloads one `image` along with a `template`, that relates to it. You can still personalise that `template` on this _Storage_ tab of the `template`.

### Edit a `disk` for a `template`

When you click on a `disk` of a `template` (on the left column of the _Storage_ tab), or when you click on _+Add another disk_, you will select that `disk` for editing (it will get a blue line on the left of its name and its options will show on the right column). 

The options you have for a `disk` are: 

* _Image_: to attach an existing `image` to the `template` you are editing
* _Volatile Disk_: to create a storage place _on the fly_ whenever a VM is instantiated from the `template` you are editing. A practical usage is to add (arbitrarily big) extra scratch space to your VM, while keeping a basic core OS image that is easy to move around in the system.

#### Choosing an `image` as a `disk` in a `template`

When you select _Image_ as the storage option for a `disk` in a `template`, you see a table where you get to choose the `image` you want from the list of your existing `image`s. You can sort and filter that table to help you find the `image` you want to use. When you find the `image` you want and you click on it, its name will appear in blue under that table.

#### Choosing a _volatile_ `disk` in a `template`

>**⚠ WARNING:**
>
>_Volatile_ `disk`s are only available as long as a VM is running with them attached, and everything stored on _Volatile_ `disk`s is lost once their associated VM is shut down. 
>
>Furthermore, _volatile_ `disk`s **cannot** be _saved-as_. 
>
Make sure you understand these facts and, therefore, place in _volatile_ `disk`s only data that you are ready to loose after the VM is gone.

>**NOTE:**
> By default all the projects get 10GB volatile quota. Please [contact us](mailto:helpdesk@surfsara.nl) if you need more quota than the default.

When you select _Volatile Disk_ as the storage option for a `disk` in a `template`, you must specify the _Size_ you want for the `disk`. You can also specify the combination of _Type_ and/or _Format_. 

>**NOTE:**
>
>It does not really matter what you choose for _FS_ and _Format_, because you can format your drives via the operating system tools.

#### Deleting a `disk` from a `template`

Next to the name of each `disk` on the list of `disk`s when editing a `template`, you can see a black _(x)_ button. If you click on it, the `disk` will be removed from the `template`.

---

>**NOTE on _Advanced options_**:
>
>The _Advanced options_ that you can see on the screen are very specific ones that we do not use  every day. If you think you need to use them, we recommend you try and learn about them on the official OpenNebula [documentation](http://docs.opennebula.org/) (for example, [here](http://docs.opennebula.org/4.12/user/virtual_resource_management/vm_guide.html)). And if you find benefits in using them, please send us an e-mail to let us know: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).
