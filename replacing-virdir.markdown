---
layout: default
---
# VirDir replacement for the new HPC Cloud

## Introduction

You may have used the VirDir network disk in the old HPC Cloud for different reasons:

* sharing files among multiple virtual machines
* automatic backup of files
* storing many files reliably
* direct access to your files with _sftp_, without a running virtual machine
* uploading and downloading of virtual machine images.

Because the new HPC Cloud will not have a _VirDir_, you probably need a replacement with at least the same functionality and performance of the old _VirDir_.

This section describes how to get the same functionality on the new HPC Cloud.


## Sharing files with multiple virtual machines

You can share files with multiple virtual machines by setting up a _File Server_. 

> **NOTE:** 
>
> The _VirDir_ was offered to users for various reasons. The most important
> reason for having a _VirDir_ was because the HPC Cloud team found that
> sharing files through NFS, on a virtual disk image, which itself resides on
> an NFS volume, had too many layers, and as a consequence, did not have
> enough performance. With the current setup, users can install their own
> file server, while the underlying architecture is no longer a bottleneck.

For sharing files with other Linux systems, you should use an _NFS_ or _NFS4_ file server; the section [NFS](NFS) describes how.

For sharing files between Windows systems, you can use the Windows file sharing.

For sharing files between Linux systems and Windows systems, you should set up an _SMB_ server.


## Automatic backup of files

The current HPC Cloud no longer offers an automatic backup service.
For long-term storage of important files, we recommend using the [SURFsara central archive](https://www.surf.nl/en/services-and-products/data-archive/index.html). 


## Storing many files reliably

The current HPC Cloud offers two storage types: Ceph and SSD. Data stored on Ceph is replicated, to protect against data loss in case of hardware failure. We recommend that you keep your operating images small, and store your bulk data on Ceph datablocks.

Ceph datablocks are used as local disks on virtual machines. Unlike the _VirDir_, they can be partitioned and formatted in any file system type, so they can be used on Linux or Windows systems, with full control of permissions and ownership of files.


## Direct access to your files using _SFTP_

The current HPC Cloud no longer offers direct access to your files. To access your files through _SFTP_, _scp_ or _rsync_, set up a _File Server_.


## Uploading and downloading of virtual machine disk images

The current HPC Cloud management interface now offers uploading virtual disk images either by uploading disk images directly, or specifying a _URL_ from which to obtain a disk image.

To upload an image:

1. Go to the _Virtual Resources_ page
2. Select _Images_
3. Click on the green _plus_ (+) button
4. Fill out the name and type of your disk image
5. At image location provide either:
   * a path; this is a url to an image; after selecting  _Create_, the image will be downloaded from a remote website.
   * upload; this allows you to select a file from your local system to be uploaded

To download an image:

Currently, [downloading virtual disk images](image_download) is not possible from the User Interface.

