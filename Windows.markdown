>**NOTE:**
>
> This page still needs to be re-shaped. We are working on it.

# Create a VM with Microsoft Windows
## Introduction
The first step is to make an Windows installation disk with available on the HPCcloud. You can upload the disk directly or send a public URL to OpenNebula which is saved on the HPCcloud, where a virtual machine can read the image.

To install Windows you need you Windows installation image. SURFsara does not deliver licences or Windows
images due to legal issues: you need to arrange your windows images and licence yourself. 

Further more there are drivers needed to communicate between windows and the hardware in the most effective way. The drivers must be installed during installation of windows. The latest version of these driver can be found at https://fedoraproject.org/wiki/Windows_Virtio_Drivers#Direct_download (no
need to download this to your computer!). 

https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
To upload the images go to Virtual Resources --> Images. In here you
see a overview of the images that are now available. To create new
image hit the green button with a plus sign. With this form you can
create and upload your install new images.


## Upload and create windows installation image

To upload your windows installation disk/iso, file in the "Name" field
a descriptive name like e.g "windows_iso" This should be unique(no
other images should have the same name), the "Description" is
optional, Type should be "CDROM" (since the image was original a DVD) and Datastore
"Local_image_ssd". Choose between "Provide a path" if the installation
iso available by a public URL or otherwise "Upload" to upload from
your PC. Hit the green "Create" to upload the image.

## Create the virtIO disk

To create the virtIO image, go to the same procedure as before with
the windows option, except the name of this images should be different
e.g. "virtio_drivers" and choose in the image location box "provide
path" the url to the virtIO iso disk (copy the link from https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso )

## Create an image as a installation target

The images to install are there now, but you need to have a empty disk
to install windows on. This can be done in the same form as creating
the windows installation images and the virtIO images. 
* Name shoud be provided (e.g. "windows_os").  
* Type must be "OS". 
* Datastore:Local_Image_Ssd 
* Persistent: checked(otherwise the image will not be saved when you
shutdown the machine)
* Image Location:"Empty datablock"

The size of the Windows OS disk should be at least 32GB (or 34360MB)
and 64 GB (or 68720MB)




## Upload context files
## Create template
## Install windows

![windows01](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install01.png)
![windows02](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install02.png)
![windows03](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install03.png)
![windows04](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install04.png)
![windows05](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install05.png)
![windows06](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install06.png)
![windows07](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/windows_install07.png)


## Make contextualisation working

