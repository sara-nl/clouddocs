---
layout: default
---
# Sharing OpenNebula objects

## Introduction

Most of the objects you create in the cloud web interface can be shared with the members of your project (or group), or everybody. The objects can be `Images`, `Templates`, `Virtual Machines` or `Files & Kernels`.

## Setting permissions

To change the permissions, select the object in the interface and click anywhere on the row. This will pop up a window where you see _Info_ for the selected item and can set the sharing permissions.

![sharing_object](images/sharing_object.png)

There are three levels of permissions: _Owner, Group, Other_. And there are three types of permissions you can grant: _Use, Manage, Admin_.

Granting _Use_ permission means that the object may be used but its attributes may not be modified. Granting _Manage_ on an object indicates that the object attributes may be modified. The _Admin_ permission is not a permission that you will typically grant since it is only usable by the SURFsara cloud administrators.

> **Note**
>
> If you set *Other* to any of your objects (e.g. your VM), then your VM will be public and visible to every user on the HPC Cloud. Therefore, better avoid this option unless you know exaclty what you do.

Most of the time, you will grant _Use_ permissions to your group members so they can use the objects you provide while keeping the _Manage_ permission to yourself.

> **Note**
>
> Persistent Images: granting _Use_ on a disk image will allow the other party to use your image in a virtual machine. Once this images is mounted, the other party is able to modify it as they see fit. Do not confuse the _Manage_ permission, which allows the other party to modify the attributes of the image object, with the _Use_ permission which allows the other party to mount the Image file. To avoid problems, better not share a persistent image with the group or others.

### Do not remove your own permissions

The interface will allow you to remove permissions from the "Owner". This will make it so that you can no longer use or manage your own object. You will need to contact [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl) to regain your permissions.

