## Editing _Network_ options of a template

You can add virtual network cards (called `nic`s in OpenNebula) so that your VM gets network access. On the _Network_ tab of the `template` editing screen, you can see two columns:
* on the left, the list of all `nic`s already defined on that `template`
* on the right, the particularities for a `nic` selected from the left.

You can add as many `nic`s as you need to a given template, each referring to an existing `network`. You have two different networks available: 
* the Internet
* your own private internal network

>**NOTE:**
>
> When you import an _appliance_ from the _Marketplace_, that action usually downloads one `template` along with an `image`. However, you usually have to add networks to the template after you have downloaded it. This is the place to do it.

### Edit a `nic` for a `template`

When you click on a `nic` of a `template` (on the left column of the _Network_ tab), or when you click on _+Add another nic_, you will select that `nic` for editing (it will get a blue line on the left of its name and its options will show on the right column). 

The options you have for a `nic` are just which network of the two that you have available you want to attach your `nic` to.

When you find the `network` you want to attach to your `nic`and you click on it, its name will appear in blue under the available `network`s' table.

#### Deleting a `nic` from a `template`

Next to the name of each `nic` on the list of `nic`s when editing a `template`, you can see a black _(x)_ button. If you click on it, the `nic` will be removed from the `template`.