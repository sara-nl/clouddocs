# `Security group`s (former _network filters_)

Security groups work as a way to externally specify what kind of network traffic can go in or out specific ports (or ranges) through an interface of a VM. You can consider it a basic firewall.

Every `Virtual Network` can have `Security Group`s attached. That way, when you attach a `nic` to a VM, the `Virtual Network` that you choose fort hat `nic` will bring those default `Security Group`s along.

As a user, you can create and modify your own `Security Group`s, but you *cannot* edit `Virtual Network`s. Therefore, the `Virtual Network`s we provide you with have *NO* `Security Group`s attached, so no traffic can reach or leave your VMs by default.

You must personalise every `nic` you define by attaching the `Security Group`s that you need.