# `Security Group`s (former _network filters_)

>IMPORTANT: my first test on 2015.05.29 indicates the filters DO NOT restrict as I would think!

`Security Group`s work as a means to protect your VM from the outside. They define what kind of network traffic can go in and/or out of your VM through specific ports (or port ranges) through each network interface (`nic`) of a VM. You can consider `Security Group`s as a **basic firewall**.

Every `Virtual Network` can have `Security Group`s attached. That way, when you attach a `nic` to a VM, the `Virtual Network` for that `nic` will bring those default `Security Group`s along with it. As a user, you can **create and modify your own `Security Group`s** (and also use those that others may have made visible to you) the way it suits your needs, but you **cannot modify `Virtual Network`s**. Therefore, the `Virtual Network`s that we set up for you have **NO** `Security Group`s attached, which also means that **no traffic can reach or leave your VMs by default**.

Therefore, in order to allow proper network usage, **you must personalise every `nic`** by attaching the `Security Group`s that you need.

## Defining `Security Group`s

To view the `Security Group`s you have available, click on the _Infrastructure_ tab on the left menu, and then on the `Security Group`s item under that. 

![security_groups_screenshot](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/security_groups.png)

The `Security Group`s on that list are only those that you have the right to see. You can think of:
* `Security Group`s that we have defined for you to use
* `Security Group`s that someone from your project has shared with the whole project
* `Security Group`s that someone from a different project has shared with all the HPC Cloud users
* `Security Group`s that you have created yourself

> **NOTE** that you can see, for every `Security Group`, the option to _Update_ (or edit) it, and you can even click on it and start changing things around. However, don't be deceived: you are likely **not** to be able to actually save the changes on all of them. For example, you cannot edit the `Security Group`s we make available by default to everybody.

> When you click the green _Update_ button to try to submit your changes, your rights be checked. If you are trying to edit a `Security Group` that you don't have the right to edit, a red error message will pop up to notify you.

### Viewing/Understanding `Security Group`s

As in other tables within the OpenNebula user interface, clicking on a row will display detailed information about that row. In this case, when you click on a `Security Group`, you can see some general sections (_Information_ with a numeric _id_ and the _name_; _Permissions_; _Ownership_; and some _Attributes_ space for key-value pairs) and the relevant _Rules_ section. **The `Rule`s** are the actual contents of the `Security Group`** and they define what network traffic is allowed to go through. Because `Security Group`s are though of as a default-closed situation, so they can only be used to open things up (i.e.: you cannot have a `Security Group` to say "close this port"). The following example shows a typical example which opens port 22, with the intention of allowing SSH connections to a VM.

![security_group_screenshot_view](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/security_group_ssh.png)

Looking at the screenshot we see that `Security Group` with id `105`, named `any_ssh`, is composed of the following `Rule`s:

| Protocol | Type | Port Range | Network | ICMP Type |
| -------- | ---- | ---------- | ------- | --------- |
| TCP      | Inbound | 22      | Any     |           |
| TCP      | Outbound | 22     | Any     |           |

This tells us that the `Security Group` is composed of only 2 `Rule`s. The first `Rule` on the table states that _inbound_ network traffic over TCP destined to port 22 on any network, must be allowed in. The second `Rule` states that _outbound_ traffic over TCP from port 22 on any network should be allowed out.

In order to customise the ports you want to open, you can:
* set multiple ports in the _Range_ of a `Rule` of a `Security Group` (only if you have the rights to edit that particular `Security Group`)
* set multiple `Rule`s on the same `Security Group` (only if you have the rights to edit that particular `Security Group`)
* combine multiple `Security Group`s on the same `nic`

## `Security Group`s on `nic`s in `Template`s

>2015.05.07 - It **doesn't** work:
> * If you only add Security Group 103 to a nic (which should only allow port 22 to be reached), then you cannot SSH to that port!
> * If you only add the Security Groups 103 and 0 to a nic (allowing por 22 in/out and all out), then you can ALSO reach port 80!
> * If you only add Security Group 100 to a nic (which should only allow port 22 to be reached on virtual network 0), then you can ALSO reach port 80!

In order for a VM to have ports open on a `Network`, it must have a `nic` on that `Network` with the appropriate `Security Group`s. One place to define `nic`s for a VM is in its `Template`.

In your `Template` you can edit the `Network` section (you can select the `Template` you want to edit and then click on _Update_) and add/delete/modify `nic`s for that `Template`. For each `nic` on the left column (under the _+ Add another nic_ button) you must choose a `Network` from the right, and you can also edit the `Security Group`s you want attached to that `nic` in the _Advanced Options_ part of the `Network`.

## `Security Group`s in hot-plugging `nic`s to VMs

> **NOTE:** It is **NOT** possible to contextualise extra hot-plugged `nic`s, because the VM `context` (the virtual CD-ROM drive containing the contextualisation information) will **NOT** get updated to include extra information for the extra attached `nic`s.

## Typical `Security Group`s example

>TODOcument : Compile a paradigmatic example for a VM with all ports closed except 53, 22, 80 and 443

# Appendix
>TODO delete these comments

# Network contextualisation reference:

You can mount the contextualisation file with:
```
mount -t iso9660 -L CONTEXT -o ro /mnt
```

```
$ cat /mnt/context.sh
...
ETH0_IP='10.100.0.5'
ETH0_MAC='...'
ETH0_MASK='255.255.224.0'
ETH0_NETWORK='10.100.0.0'
ETH1_DNS='8.8.8.8'
ETH1_GATEWAY='145.100.56.1'
ETH1_IP='145.100.59.41'
ETH1_MAC='...'
ETH1_MASK='255.255.252.0'
ETH1_NETWORK='145.100.59.0'
...
```