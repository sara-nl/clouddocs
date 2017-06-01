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

### Import appliances from the Apps option

If you want to import an appliances from the Apps option of the Storage section for use on the GPU nodes, you can follow the normal instructions as described on [this page](general-start).

The only exception is that you have to select a different datastore. In the screen shown below, make sure you choose the 'gpu_images_ssd' datastore.

![GPU import from apps](images/gpu/rvs_image_name.png)

### Using an existing image

When you already have an image that you want to use on the GPU nodes, you will have to create a clone in the correct datastore:

 1. Go to 'Storage' > 'Images' for an overview of your images
 2. Select the image you want to copy
 3. Click on 'Clone' at the top of the table with images.
 4. Click on the 'Advanced options' button. This will show you a screen like this:
 ![Clone image to GPU datastore](images/gpu/gpu_clone_image.png)
 5. Select the correct datastore 'gpu_images_ssd'
 6. Optionally, change the name of the image
 7. Click the 'Clone' button
 8. Optionally, you can now delete the old image. This is not necessary, but note that changes in one image will not affect the other!

## Adding a GPU device to your VM

GPU devices are attached to VM using 'pci passthrough'. This means that your VM will have direct access to the hardware, instead of through a virtualisation layer. This should give an optimal performance.

> **NOTE:**
>
> Before proceeding, make sure that your OS image is on the `gpu_images_ssd` datastore and possible extra images are on the `ceph` datastore.

To attach a GPU device to your VM, either create a new template or edit an existing template as described [on this page](customize-your-vm). Then:

 1. Go to the 'Other' tab while editing the template. You should see a screen like below:
 ![Add GPU to template](images/gpu/gpu_add_pci.png)
 2. Click on the '+ Add PCI device' button. This adds a line to the table above it (already visible in the screenshot above).
 3. In the new line, under 'Device name', choose the GPU in the dropdown list. The 'Vendor', 'Device' and 'Class' will automatically be set.
 4. If no other changes to the template are needed, click on the green 'Create' or 'Update button (depending on whether you are creating a new template or editing an existing one) will save the template.

You are all set now and can launch the VM.

## Inside your VM

To make full use of the GPU capabilities please install the corresponding drivers and toolkit for you distro from the official Nvidia repositories which can be found [here](https://developer.nvidia.com/cuda-downloads). From there please follow the post installation [instructions](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#package-manager-installation) 

## Example for installing CUDA 8.0 on Ubuntu 16.04

* Prepare the drivers:

```bash
sudo apt purge nvidia-* libcuda1-*
sudo apt install build-essential libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.35/NVIDIA-Linux-x86_64-367.35.run
sudo sh NVIDIA-Linux-x86_64-367.35.run
```

* Check witn `nvidia-smi` that the card is detected. Should show something like this:


```
Thu Jun  1 10:33:21 2017
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.35                 Driver Version: 367.35                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K2             Off  | 0000:01:01.0     Off |                  Off |
| N/A   37C    P0     1W / 117W |      0MiB /  4036MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

* Now, reboot the OS and try `nvidia-smi` again:

```
reboot
nvidia-smi
```

> You should get the same 

* Download CUDA installer: 

```bash
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
```

* Prepare the environment and run:

```bash
sudo apt-get install gcc make g++
sudo apt-get install build-essential linux-headers-`uname -r` dkms
sudo service lightdm stop
sudo sh cuda_8.0.61_375.26_linux-run
```

* Space to scroll to the end and type `accept`

* Give the **right** answers (notably, **NO** to the driver)

<pre>
Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 375.26?
(y)es/(n)o/(q)uit: n
Install the CUDA 8.0 Toolkit?
(y)es/(n)o/(q)uit: y
Enter Toolkit Location
 [ default is /usr/local/cuda-8.0 ]: press enter
Do you want to install a symbolic link at /usr/local/cuda?
(y)es/(n)o/(q)uit: y
(Optional)
Install the CUDA 8.0 Samples?
(y)es/(n)o/(q)uit: y
(Optional)
Enter CUDA Samples Location
 [ default is /root ]: /usr/local/cuda-samples
</pre>

* Reorganise the execution environment

```bash
sudo su -
echo "export PATH=/usr/local/cuda-8.0/bin:$PATH" >> /etc/profile.d/nvidia.sh
echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH" >> /etc/profile.d/nvidia.sh
chmod 755 /etc/profile.d/nvidia.sh
```

* Reboot: ```sudo reboot```
* ssh to VM
* Launch again `nvidia-smi`

>**NOTE:**
>
>Don't forget to add the libaries and binaries paths to your environment, like:
> - `export PATH=$PATH:/usr/local/cuda-8.0/bin`
> - `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64`


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
