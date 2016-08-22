---
layout: default
---

# Remote Visualization Guide for HPC Cloud
In this guide we will describe how to use remote visualization on the HPC Cloud.


## OpenGL rendering
Normally, an OpenGL-based visualization application running on your local machine will send OpenGL rendering commands to the GPU and let it handle the rendering and displaying of the output. On the Cloud, this is slightly different in this respect, as the rendered output needs to be transfered back to the user. To accomplish this in a fairly user-transparent manner the packages VirtualGL and TurboVNC are used. VirtualGL provides a way to intercept the rendering output of an OpenGL-based application with high performance, while TurboVNC is capable of compressing and serving that output on-thy-fly. OpenGL applications do not have to be modified in any way in this scheme, but the user does need to use an extra command when starting applications, which will be described below.

## Getting access

By default, you will not have access to the GPU nodes of the HPC Cloud. In order to get this, please send an e-mail to [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

If GPU access was enabled for your account, you will have to use a [datastore](image_storage) that is enabled on the GPU nodes. This datastore is called `images_ssd_gpu` and behaves the same way as the `local_images_ssd` datastore, except that it is accessible on the GPU nodes only. In other words, using this datastore, makes sure that your VM is run on the nodes which have GPU's installed on them.

Note that the `ceph` datastore is also enabled on the GPU nodes. However, as described [here](image_storage), it is best to put your OS image on either the `local_images_ssd` or the `images_ssd_gpu` datastore. `ceph` can still be used for larger, data images and for persistent data.

## Setting up Remote Visualization on the HPC cloud

## Attaching a GPU to a VM

Using GPU devices to do (part of) your computation on, enables a form of parallisation that could be much faster than multiple CPU core usage. However, the software you are using must be enabled to use GPU's and programming for GPU's is difficult and often not ideal for novice programmers. If you are not sure whether or not you could profit from using GPU's, please feel free to contact us at [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

This page teaches how to attach a GPU device to a VM. It does not show you how to get or write software that uses GPU's.

For more information on our hardware, see our [resource overview](resources-available).

## Getting access

By default, you will not have access to the GPU nodes of the HPC Cloud. In order to get this, please send an e-mail to [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

If GPU access was enabled for your account, you will have to use a [datastore](image_storage) that is enabled on the GPU nodes. This datastore is called `images_ssd_gpu` and behaves the same way as the `local_images_ssd` datastore, except that it is accessible on the GPU nodes only. In other words, using this datastore, makes sure that your VM is run on the nodes which have GPU's installed on them.

Note that the `ceph` datastore is also enabled on the GPU nodes. However, as described [here](image_storage), it is best to put your OS image on either the `local_images_ssd` or the `images_ssd_gpu` datastore. `ceph` can still be used for larger, data images and for persistent data.

### Import appliances from the AppMarket

If you want to import an appliances from the AppMarket for use on the GPU nodes, you can follow the normal instructions as described on [this page](general-start).

The only exception is that you have to select a different datastore. In the screen shown below, make sure you choose the 'images_ssd_gpu' datastore.

![GPU import from appmarket](images/gpu/gpu_appliance_import.png)


## Adding a GPU device to your VM

GPU devices are attached to VM using 'pci passthrough'. This means that your VM will have direct access to the hardware, instead of through a virtualisation layer. This should give an optimal performance.

> **NOTE:**
>
> Before proceeding, make sure that your OS image is on the `images_ssd_gpu` datastore and possible extra images are on the `ceph` datastore.

To attach a GPU device to your VM, either create a new template or edit an existing template as described [on this page](customize-your-vm). Then:

 1. Go to the 'Other' tab while editing the template. You should see a screen like below:
 ![Add GPU to template](images/gpu/gpu_add_pci.png)
 2. Click on the '+ Add PCI device' button. This adds a line to the table above it (already visible in the screenshot above).
 3. In the new line, under 'Device name', choose the GPU in the dropdown list. The 'Vendor', 'Device' and 'Class' will automatically be set.
 4. If no other changes to the template are needed, click on the green 'Create' or 'Update button (depending on whether you are creating a new template or editing an existing one) will save the template.

You are all set now and can launch the VM.

## Inside your VM
