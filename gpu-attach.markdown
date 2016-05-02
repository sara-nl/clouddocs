---
layout: default
---
# Attaching a GPU to a VM

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

### Using an existing image

When you already have an image that you want to use on the GPU nodes, you will have to create a clone in the correct datastore:

 1. Go to 'Virtual Resources' > 'Images' for an overview of your images
 2. Select the image you want to copy
 3. Click on 'Clone' at the top right of the table with images.
 4. Click on the 'Advanced options' button. This will show you a screen like this:
 ![Clone image to GPU datastore](images/gpu/gpu_clone_image.png)
 5. Select the correct datastore 'images_ssd_gpu'
 6. Optionally, change the name of the image
 7. Click the 'Clone' button
 8. Optionally, you can now delete the old image. This is not necessary, but note that changes in one image will not affect the other!

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

To make full use of the GPU capabilities please install the corresponding drivers and toolkit for you distro from the official Nvidia repositories which can be found [here](https://developer.nvidia.com/cuda-downloads). From there please follow the post installation [instructions](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#package-manager-installation) 

## Example for installing CUDA 7.5 on Ubuntu 14.04

* Download CUDA installer: 

```wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run```

* Prepare the environment and run:

```bash
sudo apt-get install gcc make g++
sudo service lightdm stop
sudo sh cuda_7.5.18_linux.run
```

* Space to scroll to the end and type `accept`
<pre>
Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 352.39? ((y)es/(n)o/(q)uit): yes
Do you want to install the OpenGL libraries? ((y)es/(n)o/(q)uit) [ default is yes ]: yes
Install the CUDA 7.5 Toolkit? ((y)es/(n)o/(q)uit): yes
Enter Toolkit Location [ default is /usr/local/cuda-7.5 ]: Enter
Do you want to install a symbolic link at /usr/local/cuda? ((y)es/(n)o/(q)uit): yes
Install the CUDA 7.5 Samples? ((y)es/(n)o/(q)uit): yes
Enter CUDA Samples Location [ default is /home/ubuntu ]: Enter
Installing the NVIDIA display driver...Driver:   Reboot required to continue Toolkit:  Installation skipped Samples: Installation skipped
</pre>

* Reboot: ```sudo reboot```
* ssh to VM
* Resume the installation: `sudo service lightdm stop && sudo sh cuda_7.5.18_linux.run`
* Launch: `nvidia-smi`

<pre>
Mon May  2 09:29:08 2016    

+------------------------------------------------------+                       
| NVIDIA-SMI 352.39     Driver Version: 352.39         |                       
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K2             Off  | 0000:00:05.0     Off |                  Off |
| N/A   24C    P0    43W / 117W |     11MiB /  4095MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   1  GRID K2             Off  | 0000:00:06.0     Off |                  Off |
| N/A   27C    P0    37W / 117W |     11MiB /  4095MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+

</pre>

>**NOTE:**
>
>Don't forget to add the libaries and binaries paths to your environment, like:
> - `export PATH=$PATH:/usr/local/cuda-7.5/bin`
> - `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64`


### Running a Hello World

* Download, uncompress and compile NVidia's Hello World example:
```bash
wget http://developer.download.nvidia.com/compute/developertrainingmaterials/samples/cuda_c/HelloWorld.zip
unzip HelloWorld.zip
nvcc hello.cu
```

* Run the compiled program, which if the compilation succeeded will be called `a.out`:
```bash
./a.out
```
 That yields the output:

 <pre>
$ ./a.out
H
E
L
L
O

W
O
R
L
D
!
 </pre>
