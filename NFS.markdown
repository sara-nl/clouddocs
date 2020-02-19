---
layout: default
---
You need to perform several steps to make NFS work, each step may be slightly different for your OS.
Below are the steps for CentOS 7, both server and clients.

## NFS server on CentOS 7 & 8

### Firewall

Open up the firewall on the project-private network:

```bash
sudo firewall-cmd --permanent --zone=trusted --add-source=10.0.0.0/8
sudo firewall-cmd --reload
```

Check with:

```bash
sudo firewall-cmd --zone=trusted --list-all
```
Expected output:

>
```bash
trusted (active)
  interfaces: 
  sources: 10.0.0.0/8
  services:
  [...]
```

### NFS server

Install the NFS SW:

```bash
sudo yum install nfs-utils
```

Create the root directory of the tree to export.
The name chosen here, `/export-nfs`, is an example: you are free to use a different path.

```bash
sudo mkdir /export-nfs
```

You will need the network address and mask of your project's private network.
If your VM's address on the private network is `10.X.Y.Z`, then the private network is `10.X.Y.0/255.255.224.0`.

Edit the configuration file `/etc/idmapd.conf`, line 5: uncomment and change to your domain name

>
```bash
Domain = server.world
```

Edit the configuration file `/etc/exports` and add a line for our export.
Replace `/export-nfs` with the root you have chosen,
replace `10.X.Y.0/255.255.224.0` with your project's private network address and mask.

>
```bash
/export-nfs  10.X.Y.0/255.255.224.0(rw,no_root_squash)
```

Start the daemon:

```bash
sudo systemctl enable rpcbind nfs-server
sudo systemctl restart rpcbind
sudo systemctl start nfs-server
```

### NFS clients

Optionally open the firewall.

Install the NFS package (see above).

Create a local mount point.
The name chosen here is arbitrary, you are free to chose a different path.

```bash
mkdir /mount-nfs
```

Mount the NFS volume manually:

```bash
# REPLACE
# 10.X.Y.S with the server's address,
# /export-nfs with the server's export root and
# /mount-nfs/ with your local mount point
mount -t nfs 10.X.Y.S:/export-nfs /mount-nfs/
```

Check the mount:

```bash
mount
```

Expected output:

>
```
[...]
10.X.Y.S:/export-nfs on /mount-nfs type nfs4 > (rw,relatime,vers=4.0,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,port=0,timeo=600,retrans=2,sec=sys,clientaddr=10.X.Y.C,local_lock=none,addr=10.X.Y.S)
```

Test by writing to a file in the client's `/mount-nfs` and reading on the server's `/export-nfs` and vice versa.

Make permanent over reboots by adding the following line to file `/etc/fstab`
but replace `10.X.Y.S` with the server's address:

>
```
10.X.Y.S:/export-nfs	/mount-nfs nfs4 defaults  0 0
```

See also: [www.unixmen.com/setting-nfs-server-client-centos-7](http://www.unixmen.com/setting-nfs-server-client-centos-7/)
