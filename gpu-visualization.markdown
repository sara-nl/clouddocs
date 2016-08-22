---
layout: default
---

# Remote Visualization Guide for HPC Cloud
In this guide we will describe how to setup and use remote interactive visualization on the HPC Cloud. It allows the user of the HPC cloud to fully use Virtual machines equiped with GPUs for interactive rendering, with the result being transfered over the internet to their own local laptop or desktop.

![Remote interactive visualization](images/gpu/rvs_cloud.png)

## Getting access

By default, you will not have access to the GPU nodes of the HPC Cloud. In order to get this, please send an e-mail to [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl).

If GPU access was enabled for your account, you will have to use a [datastore](image_storage) that is enabled on the GPU nodes. This datastore is called `images_ssd_gpu` and behaves the same way as the `local_images_ssd` datastore, except that it is accessible on the GPU nodes only. In other words, using this datastore, makes sure that your VM is run on the nodes which have GPU's installed on them.

Note that the `ceph` datastore is also enabled on the GPU nodes. However, as described [here](image_storage), it is best to put your OS image on either the `local_images_ssd` or the `images_ssd_gpu` datastore. `ceph` can still be used for larger, data images and for persistent data.

## OpenGL rendering
Normally, an OpenGL-based visualization application running on your local machine will send OpenGL rendering commands to the GPU and let it handle the rendering and displaying of the output. On the Cloud, this is slightly different in this respect, as the rendered output needs to be transfered back to the user. To accomplish this in a fairly user-transparent manner the packages VirtualGL and TurboVNC are used. VirtualGL provides a way to intercept the rendering output of an OpenGL-based application with high performance, while TurboVNC is capable of compressing and serving that output on-thy-fly. OpenGL applications do not have to be modified in any way in this scheme, but the user does need to use an extra command when starting applications, which will be described below.


## Setting up Remote Visualization on the HPC cloud
You can either set up your own image, or use an image provided by SURFsara. In this guide we will use one of the standard images provided by SURFsara. 

1. In the Dashboard on https://ui.hpccloud.surfsara.nl/, under AppMarket--> Appliances, select the Ubuntu 14.04 image with GPU (Ubuntu 14.04 GPU CI) and import it with the import button in the upper right.
![import AppMarket Appliance] (images/gpu/rvs_select_image.png)
2. In the next screen, make sure to select “images_ssd_gpu” as your datastore, and give both your images and template a distinctive name.
![import AppMarket Appliance] (images/gpu/rvs_image_name.png)
3. Under Virtual Resources-> images, select the image you just created, and with the “dots” button in the upper right corner, set your image to persistent state. After this, refresh the list and make sure the status of your image is “ready”
![Make image persistant] (images/gpu/rvs_make_persistent.png)
4. Under Virtual Resources->Templates, select the template you created, and click the “Update” button. This will open the properties of your VM template.  Here you can set memory and cores of your virtual machine. A good default is 16GB memory, and 4 CPU&VCPU.
![Make image persistant] (images/gpu/rvs_update_vm.png)
5. Next, under the “other” tab, click “+ Add PCI Device”, and select the Grid K2 GPU.
Make sure to click the green “update” button to save your changes to the VM
 ![Add GPU to template](images/gpu/gpu_add_pci.png)
6. Under Virtual Resources->Templates, select your  template, and click “instantiate”, followed by the green “instantiate”, to start your VM.
6. Under Virtual Resources->Virtual Machines, wait for your machine to boot. If the status is “running”, you can proceed with the next step. Note the IP address your machine received.
7. Using SSH, login to your new machine, using ubuntu@<ip address>
8. You need to configure the VirtualGL context: sudo /opt/VirtualGL/bin/vglserver_config
Answer in order 1, n, n y, X.
9. The VM comes with a default firewall. Use the command sudo ufw allow from <your home IP address>  to any  to allow access from your own client IP address. If you have a dynamic IP address, you can specify a range using the / syntax, e.g. 145.100.1.0/24, which allows all ip adresses starting with 145.100.1. 
10. Reboot using the command sudo reboot for the changes to come into effect
11. On your own local machine, you need a VNC client. We advice TurboVNC (https://sourceforge.net/projects/turbovnc/) but any other VNC client will suffice.

## Workflow 
You only need to do the previous steps once. For every subsequent worksession, you need only need to reinstate your VM and start your virtual desktop. 

1. Log in onto your VM using SSH. Note that you have a different IP address each time you reinstated your VM
2. Start your virtual desktop with /opt/TurboVNC/bin/vncserver -geometry 1920x1200. You can vary the resolution as desired.
3. Start the VNC client on your local machine, and login to your VNCserver: Vncviewer <your VM's ip address>:1
4. You should now have access with your VNC viewer to the remote desktop on the node assigned to you 
5. (Optional) To test if everything works correctly, you can use the application glxgears located in the mesa-utils package (on Ubuntu).  You run the command “vglrun glxgears”, and if you see three red, green a blue cogs, everything works correctly.




## Inside your VM
