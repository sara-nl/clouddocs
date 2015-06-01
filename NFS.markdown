## NFS server on CentOS 7

Install the NFS SW:
```sh
yum install nfs-utils
[root]# yum install nfs-utils
```

Edit the configuration files:
```sh
[root]# vi /etc/idmapd.conf
# line 5: uncomment and change to your domain name
Domain = server.world
[root]# vi /etc/exports
# write settings for NFS exports
/home 10.0.0.0/24(rw,no_root_squash)
```

Start the daemon:
```sh
[root]# systemctl enable rpcbind nfs-server nfs-lock nfs-idmap
[root]# systemctl restart rpcbind
[root]# systemctl start nfs-server nfs-lock nfs-idmap
```

See also: http://www.unixmen.com/setting-nfs-server-client-centos-7/