---
layout: default
---
# Attaching a GPU to a VM

Using GPU devices to do (part of) your computation on, enables a form of parallelization that could be much faster than multiple CPU core usage. However, the software you are using must be enabled to use GPU's and programming for GPU's is difficult and often not ideal for novice programmers. If you are not sure whether or not you could profit from using GPU's, please feel free to contact us at [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

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

>**Note:**
>
>Considering how support on NVidia's side has been evolving lately for our GPU's drivers, and how complex it has become to install the drivers successfully, we suggest that you remove the otherwise recommended automatic apt-get upgrades upon VM start while you are installing the drivers. You can do so by editing the template, then in the _Context_ tab you can empty the field _Start script_. And save the changes.

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

GPU devices are attached to VM using 'pci passthrough'. This means that your VM will have direct access to the hardware, instead of through a virtualisation layer. This should give an optimal performance. You have the option of attaching a Nvidia GRID K2 (1536 CUDA cores, 4GB) or Tesla P100 GPU (3584 CUDA cores, 12GB).

> **NOTE:**
>
> Before proceeding, make sure that your OS image is on the `gpu_images_ssd` datastore and possible extra images are on the `ceph` datastore.

To attach a GPU device to your VM, either create a new template or edit an existing template as described [on this page](customize-your-vm). Then:

 1. Go to the 'Other' tab while editing the template. You should see a screen like below:
 ![Add GPU to template](images/gpu/gpu_add_pci.png)
 2. Click on the '+ Add PCI device' button. This adds a line to the table above it (already visible in the screenshot above).
 3. In the new line, under 'Device name', choose the GPU in the dropdown list. The 'Vendor', 'Device' and 'Class' will automatically be set. Please note the chosen GPU type as the driver installation instructions differ for both types.
 4. If no other changes to the template are needed, click on the green 'Create' or 'Update button (depending on whether you are creating a new template or editing an existing one) will save the template.

## Inside your VM

To make full use of the GPU capabilities please install the corresponding drivers and toolkit for you distro from the official Nvidia repositories which can be found [here](https://developer.nvidia.com/cuda-downloads). From there please follow the post installation [instructions](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#package-manager-installation)

## Example for installing CUDA 8.0 on Ubuntu 16.04
* Remove the automatic installation of updates during startup from your _Template_ by opening the _Context_ tab and emptying the _Start script_ field.

* Launch your VM and force an installation of any security updates, reboot the VM afterwards:
```bash
sudo systemctl start apt-daily.service && sleep 60 && sudo reboot
```

* Check the version of your kernel with `uname -r`. If you have a version newer than 4.4.0-64, continue installing the GPU drivers for the chosen GPU type, otherwise repeat the previous step.
```bash
4.4.0-83-generic
```

### Grid K2

* Remove any old drivers, install prerequisites, then download and install the drivers:
```bash
sudo apt-get purge nvidia-* libcuda-*
sudo apt-get update && sudo apt-get install -y gcc make g++ libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.57/NVIDIA-Linux-x86_64-367.57.run
sudo sh NVIDIA-Linux-x86_64-367.57.run -s
```

### Tesla P100

* Remove any old drivers, add the Nvidia repository and install the drivers:
```bash
sudo apt purge nvidia-* libcuda1-*
wget http://us.download.nvidia.com/tesla/375.66/nvidia-diag-driver-local-repo-ubuntu1604_375.66-1_amd64.deb
sudo dpkg -i nvidia-diag-driver-local-repo-ubuntu1604_375.66-1_amd64.deb
sudo apt-get update && sudo apt-get install -y cuda-drivers
```

### All GPU types

* Check with `nvidia-smi` that the card is detected. It should show something like this:
<pre>
Wed Jul 12 16:36:24 2017       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.57                 Driver Version: 367.57                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K2             Off  | 0000:01:01.0      On |                  Off |
| N/A   29C    P8    18W / 117W |     17MiB /  4036MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|    0       802    G   /usr/lib/xorg/Xorg                              16MiB |
+-----------------------------------------------------------------------------+
</pre>

* Now, reboot the OS and run `nvidia-smi` again and check for a similar output:
```bash
sudo reboot
nvidia-smi
```

* Install CUDA prerequisites, download and install CUDA 8:
```bash
sudo apt-get install -y gcc make g++ build-essential dkms linux-headers-$(uname -r)
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
sudo service lightdm stop
sudo sh cuda_8.0.61_375.26_linux-run --silent --samples --toolkit
```

* Reboot your VM once more: `sudo reboot`

>**NOTE:**
>
>Make sure the libraries and binaries paths are part of your environment (these are added as part of the installation), if they are not they can be added with:
> - `export PATH=$PATH:/usr/local/cuda-8.0/bin`
> - `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64`

* CUDA should be ready to use, as a test we will compile and run one of the sample utilities:
```bash
cd NVIDIA_CUDA-8.0_Samples/1_Utilities/deviceQuery
make
./deviceQuery
```

* If everything is running as intended the result will look similar to this:

<pre>
./deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "Tesla P100-PCIE-12GB"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    6.0
  Total amount of global memory:                 12194 MBytes (12786073600 bytes)
  (56) Multiprocessors, ( 64) CUDA Cores/MP:     3584 CUDA Cores
  GPU Max Clock rate:                            1329 MHz (1.33 GHz)
  Memory Clock rate:                             715 Mhz
  Memory Bus Width:                              3072-bit
  L2 Cache Size:                                 3145728 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 1 / 1
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 8.0, CUDA Runtime Version = 8.0, NumDevs = 1, Device0 = Tesla P100-PCIE-12GB
Result = PASS
</pre>

> **NOTE:**
>
> During the installation the Nvidia drivers have been compiled for the current kernel version. The apt-daily service may upgrade your kernel if it's marked as a security update requiring you to reinstall the driver after a reboot. To prevent any (automatic) kernel upgrades, run `sudo apt-mark hold linux-image-generic linux-headers-generic`.

### Running a Hello World

* Download, uncompress and compile Nvidia's Hello World example:
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
