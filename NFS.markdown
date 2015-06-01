## NFS server on CentOS 7

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