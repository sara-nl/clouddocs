## Editing _Storage_ options of a template

Storage for a VM is specified in terms of `disk`s (which are `image`s linked to `template`s). On the _Storage_ tab of the `template` editing screen, you can see two columns:
* on the left, the list of all `disk`s already defined on that `template`
* on the right, the particularities for a `disk` selected from the left.

You can add as many `disk`s as you need to a given template, each referring to an existing `image` or to a _volatile_ `disk`. 

>**Remember:**
>
>VMs are created by instantiating a `template`. Multiple VMs can share `image`s (regardless of the VMs' or `image`s' `template`s) only when the `image`s are **not** _persistent_.

&nbsp;
>**NOTE:**
>
> When you import an _appliance_ from the _Marketplace_, that action usually downloads one `template` along with an `image`, that gets listed on this _Storage_ screen of the `Template`.

### Edit a `disk` for a `template`

When you click on a `disk` of a `template` (on the left column of the _Storage_ tab), or when you click on _+Add another disk_, you will select that `disk` for editing (it will get a blue line on the left of its name and its options will show on the right column). 

The options you have for a `disk` are: 
* _Image_: to attach an existing `image` to the `template` you are editing
* _Volatile Disk_: to create a storage place _on the fly_ whenever a VM is instantiated from the `template` you are editing. A practical usage is to add (arbitrarily big) extra scratch space to your VM, while keeping a basic core OS image that is easy to move around in the system.

#### Choosing an `image` as a `disk` in a `template`

When you select _Image_ as the storage option for a `disk` in a `template`, you see a table where get to choose the `image` you want from the list of your existing `image`s. You can sort and filter that table to help you find the `image` you want to see. When you find the `image` you want and you click on it, its name will appear in blue under that table.

#### Choosing a _volatile_ `disk` in a `template`

When you select _Volatile Disk_ as the storage option for a `disk` in a `template`, you must specify the _Size_ you want for the `disk`. You can also specify the combination of _Type_ and/or _Format_. 

>**NOTE:**
>
>It does not really matter what you choose for _FS_ and _Format_, because you can format your drives via the operating system tools

#### Deleting a `disk` from a `template`

Next to the name of each `disk` on the list of `disk`s when editing a `template`, you can see a black _(x)_ button. If you click on it, the `disk` will be removed from the `template`.