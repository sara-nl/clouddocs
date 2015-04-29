# `Security Group`s (former _network filters_)

```
IMPORTANT: my first test on 2015.05.29 indicates the filters DO NOT restrict as I would think!
```

`Security Group`s work as a means to protect your VM from the outside. They define what kind of network traffic can go in or out your VM through specific ports (or ranges) through an interface of a VM. You can consider `Security Group`s as a basic firewall.

Every `Virtual Network` can have `Security Group`s attached. That way, when you attach a `nic` to a VM, the `Virtual Network` that you choose for that `nic` will bring those default `Security Group`s along with her. As a user, however, you can create and modify your own `Security Group`s (and also use those that others may have made visible for you) the way it suits your needs, but you *cannot* edit `Virtual Network`s. Therefore, the `Virtual Network`s we set up for you have *NO* `Security Group`s attached. This also means no traffic can reach or leave your VMs by default.

You must personalise every `nic` you define by attaching the `Security Group`s that you need.