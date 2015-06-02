## NFS server on CentOS 7

### Firewall

Open up the firewall on the project-private network (assumed to be on eth1 !)
```sh
[root]# firewall-cmd --permanent --zone=trusted --change-interface=eth1
[root]# systemctl stop firewalld
[root]# systemctl start firewalld
```
_Note:_ the `systemctl stop/start` is needed, other reload or reboots do not pick up the change(!)
Check with:
```sh
[root]# firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: eth0
  sources: 
  services: dhcpv6-client ssh
  [...]

[root]#  firewall-cmd --zone=trusted --list-all
trusted (active)
  interfaces: eth1
  sources: 
  services:
  [...]
```

### NFS

Install the NFS SW:
```sh
[root]# yum install nfs-utils
```

Create the root (or multile roots) to export:
```sh
[root]# mkdir /export-nfs
```

Edit the configuration files:
```sh
[root]# vi /etc/idmapd.conf
# line 5: uncomment and change to your domain name
Domain = server.world

[root]# vi /etc/exports
# add a line for each export, replace 10.X.Y.0/255.255.224.0 with your project's private network address and mask
/export-nfs  10.X.Y.0/255.255.224.0(rw,no_root_squash)
```

Start the daemon:
```sh
[root]# systemctl enable rpcbind nfs-server nfs-lock nfs-idmap
[root]# systemctl restart rpcbind
[root]# systemctl start nfs-server
```

See also: http://www.unixmen.com/setting-nfs-server-client-centos-7/