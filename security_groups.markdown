# `Security Group`s (former _network filters_)

>IMPORTANT: my first test on 2015.05.29 indicates the filters DO NOT restrict as I would think!

`Security Group`s work as a means to protect your VM from the outside. They define what kind of network traffic can go in or out your VM through specific ports (or port ranges) through each network interface (`nic`) of a VM. You can consider `Security Group`s as a **basic firewall**.

Every `Virtual Network` can have `Security Group`s attached. That way, when you attach a `nic` to a VM, the `Virtual Network` that you choose for that `nic` will bring those default `Security Group`s along with her. As a user, you can **create and modify your own `Security Group`s** (and also use those that others may have made visible for you) the way it suits your needs, but you **cannot modify `Virtual Network`s**. Therefore, the `Virtual Network`s that we set up for you have **NO** `Security Group`s attached, which also means that **no traffic can reach or leave your VMs by default**.

Therefore, in order to allow proper network usage, **you must personalise every `nic`** by attaching the `Security Group`s that you need.

## Defining `Security Group`s

To view the `Security Group`s you have available, click on the *Infrastructure* tab on the left menu, and then on the `Security Group`s item under that. 

![security_groups_screenshot](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/security_groups.png)

## `Security Group`s on `nic`s in `Template`s

> TODOcument full section

>2015.05.07 - It **doesn't** work:
> * If you only add Security Group 103 to a nic (which should only allow port 22 to be reached), then you cannot SSH to that port!
> * If you only add the Security Groups 103 and 0 to a nic (allowing por 22 in/out and all out), then you can ALSO reach port 80!
> * If you only add Security Group 100 to a nic (which should only allow port 22 to be reached on virtual network 0), then you can ALSO reach port 80!


In your `Template` you can edit the `Network` section (you can select the `Template` you want to edit and then click on `Update`) and add/delete/modify `nic`s for that `Template`. For each `nic` on the left column (under the `+ Add another nic` button) you must choose a `Network` from the right, and you can also edit the `Security Group`s you want attached to that `nic` in the `Advanced Options` part of the `Network`.

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