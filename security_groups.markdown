# `Security Group`s (former _network filters_)

```
IMPORTANT: my first test on 2015.05.29 indicates the filters DO NOT restrict as I would think!
```

`Security Group`s work as a means to protect your VM from the outside. They define what kind of network traffic can go in or out your VM through specific ports (or port ranges) through each network interface (`nic`) of a VM. You can consider `Security Group`s as a **basic firewall**.

Every `Virtual Network` can have `Security Group`s attached. That way, when you attach a `nic` to a VM, the `Virtual Network` that you choose for that `nic` will bring those default `Security Group`s along with her. As a user, you can **create and modify your own `Security Group`s** (and also use those that others may have made visible for you) the way it suits your needs, but you **cannot modify `Virtual Network`s**. Therefore, the `Virtual Network`s that we set up for you have **NO** `Security Group`s attached, which also means that **no traffic can reach or leave your VMs by default**.

Therefore, in order to allow proper network usage, **you must personalise every `nic`** by attaching the `Security Group`s that you need.

```
TODOcument: 
1. How to edit security groups in nics in templates
2. How to attach/dettach nics on-the-fly to running VMs
3. Compile a paradigmatic example: have a VM with all close except ports 53, 22, 80 and 443
```

## `Security Group`s in `nic`s in `Template`s
```
TODOcument full section

2015.05.07 - It **doesn't** work:
* If you only add Security Group 103 to a nic (which should only allow port 22 to be reached), then you cannot SSH to that port!
* If you only add the Security Groups 103 and 0 to a nic (allowing por 22 in/out and all out), then you can ALSO reach port 80!
* If you only add Security Group 100 to a nic (which should only allow port 22 to be reached on virtual network 0), then you can ALSO reach port 80!
```

In your `Template` you can edit the `Network` section (you can select the `Template` you want to edit and then click on `Update`) and add/delete/modify `nic`s for that `Template`. For each `nic` on the left column (under the `+ Add another nic` button) you must choose a `Network` from the right, and you can also edit the `Security Group`s you want attached to that `nic` in the `Advanced Options` part of the `Network`.

## `Security Group`s in hot-plugging `nic`s to VMs
```
TODOcument full section

2015.05.07 - It **doesn't** work:
* For starters, contextualisation doesn't work: the newly attached nic gets recognised by the OS, but it doesn't get an IP. Even if you run `/etc/init.d/vmcontext start`
* If you start a VM without any nic attached and then you hot-plug one nic with only Security Group 103 attached, then...
```