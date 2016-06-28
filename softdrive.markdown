---
layout: default
---

# SoftDrive on the HPC Cloud

[SoftDrive][1] is a service of the Dutch National e-infrastructure to
facilitate software distribution over many machines. It was developed for use
on the Grid infrastructure where managing your application environment is more
challenging than on the HPC Cloud. SoftDrive uses [CernVM-FS][2] (cvmfs).

## When to use SoftDrive?

You should probably consider using SoftDrive on the HPC Cloud if you want to make your software available on multiple platforms such as grids, classical clusters, and public or private clouds. Softdrive allows you to install and maintain only a single software tree while using it from various locations. 

## Instructions

The instructions here are tested in the standard Ubuntu 14.04 Server appliance
from the AppMarket. They are probably also valid for other Ubuntu versions and
Debian-derived distributions. The setup consists of the following steps:

 - Install dependencies
 - Create directories
 - Download and install cvmfs packages
 - Configure fuse
 - Configure cvmfs
 - Configure autofs

### Install dependencies

The following command installs six packages (and their dependencies) that are
needed for cvmfs:

     # apt-get install attr autofs gawk gdb uuid uuid-dev

### Create directories

You need to create the directories that will be used for the cvmfs mount point
and cache folder:

    # mkdir /cvmfs /var/lib/cvmfs

### Download and install cvmfs packages

Download the latest cvmfs and cvsmf-config-none `.deb` packages from the CernVM
website. At the time of writing:

    # wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-config/cvmfs-config-none_1.0-1_all.deb
    # wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.2.0/cvmfs_2.2.0_amd64.deb

Install the packages using `dpkg`:

    # dpkg --install cvmfs-config-none_1.0-1_all.deb cvmfs_2.2.0_amd64.deb

### Configure FUSE

Add a line with `allow_other` to `/etc/fuse.conf`.

Add the cvmfs user to the group fuse:

    # addgroup cvmfs fuse

### Configure cvmfs

Create the file `/etc/cvmfs/default.local` with the following contents:

    CVMFS_NFILES=32768
    CVMFS_REPOSITORIES=softdrive.nl
    CVMFS_QUOTA_LIMIT=2000
    CVMFS_HTTP_PROXY="http://squid.grid.sara.nl:3128"

Create the file `/etc/cvmfs/config.d/softdrive.nl.conf` with the following
contents:

    CVMFS_SERVER_URL=http://cvmfs01.nikhef.nl/cvmfs/@fqrn@
    CVMFS_PUBLIC_KEY=/etc/cvmfs/keys/softdrive.nl.pub

Finally, create the directory `/etc/cvmfs/keys` and add the file
`/etc/cvmfs/keys/softdrive.nl.pub` with the following contents:

    -----BEGIN PUBLIC KEY-----
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA481/kCXbrVtLuzcFZ2uO
    EmiAKx28qXIkonPwr/gSmqQ8k1zQA7dKK5YZwZSbVwgYqvhvW6i3vKWLGVDj+elH
    1u8uumPzzlAJHrS1XoR8rY4xUULjQBvV9HuJxE6OK4ZEZPvQmeGmjXd446c8J5cv
    BQFtaonRnrxAbtO+Z0KtzsNOzBNFegu9z+lT7/fxV17Qh10w5IKQjm/v6jPdj1ME
    CrG4QW2S9+Y+7YzbRP5QYaE4cl5cBI3Yb048ufgLJMfX3++uqwGM+rqNs/CzHvsW
    dO6Jznr9EbzqbIrTsFeUThNmsGPObxOT3VmB0BTTjrZSYjgf8oEE4hdhgNQgh7vs
    OwIDAQAB
    -----END PUBLIC KEY-----

### Configure autofs

Add a line with `/cvmfs /etc/auto.cvmfs` to `/etc/auto.master`.

Restart autofs to use the new settings:

    # service autofs restart

Autofs will automatically mount the SoftDrive diretory the first time you
access it. For example by doing `ls /cvmfs/softdrive.nl`.

### Using SoftDrive

Software installed on the SoftDrive service is now available on your VM in the
`/cvmfs/softdrive.nl` folder.

To add software to the SoftDrive directory you need to have a SURFsara account
with membership of the `cvmfs` group. Contact the [SURFsara Helpdesk][3] for
this. More information can be found on the [Grid documentation of
SoftDrive][1].

[1]: http://doc.grid.surfsara.nl/en/latest/Pages/Advanced/grid_software.html#softdrive
[2]: http://cernvm.cern.ch/portal/filesystem
[3]: mailto:helpdesk@surfsara.nl
