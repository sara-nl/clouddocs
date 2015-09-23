---
layout: default
---
## Editing _Network_ options of a template

You can add virtual network cards (called `nic`s in OpenNebula) so that your VM gets network access. On the _Network_ tab of the `template`-editing screen, you can see two columns:

* on the left, the list of all `nic`s already defined on that `template`
* on the right, the particularities for a `nic` selected from the left

You can add as many `nic`s as you need to a given template, each referring to an existing `network`. You have two different networks available: 

* the Internet
* your own private internal network

>**NOTE:**
>
> When you import an _appliance_ from the _AppMarket_, that action usually downloads one `template` along with an `image`. However, you usually have to add networks to the template after you have downloaded it. This is the place to do it.

The assignment of hostnames and IP addresses to VMs is covered in [Accessing your virtual machine](access-your-VM).

### Edit a `nic` for a `template`

When you click on a `nic` of a `template` (on the left column of the _Network_ tab), or when you click on _+Add another nic_, you will select that `nic` for editing (it will get a blue line on the left of its name and its options will show on the area to the right of it). 

The option you can set for a `nic` is just which network of the two that you have available you want to attach your `nic` to.

When you find the `network` you want to attach to your `nic` and you click on it, its name will appear in blue under the available `network`s' table.

>**NOTE:**
>
> The order that you specify your `nic`s matters. If you use internet, then select this first to Interface 0.

![nic_order_img](images/nic_order.png)

#### Deleting a `nic` from a `template`

Next to the name of each `nic` on the list of `nic`s when editing a `template`, you can see a black _(x)_ button. If you click on it, the `nic` will be removed from the `template`.

---

>**NOTE on _Advanced options_**:
>
>The _Advanced options_ that you can see on the screen are very specific ones that we do not use  every day. If you think you need to use them, we recommend you try and learn about them on the official OpenNebula [documentation](http://docs.opennebula.org/) (for example, [here](http://docs.opennebula.org/4.12/user/virtual_resource_management/vm_guide.html)). And if you find benefits in using them, please send us an e-mail to let us know: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).
