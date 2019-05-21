---
layout: default
---

# Good practices for HPC and Cloud 2019-05-23  <br/> Extras - Kubernetes

<div style="float:right;max-width:205px;" markdown="1">
![NLeSC logo](/images/escience_center_logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

<div class="alert alert-danger" style="max-width:50%" markdown="1">
<i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
Watch out!

This is a section we are preparing and is **NOT** part of the course yet. In fact, our preliminary tests show that the steps described here do **NOT** work.

Project _Baklava_ from the [Netherlands e-Science Center](https://www.esciencecenter.nl/) may help. In GitHub: https://github.com/NLeSC/baklava
</div>


This is an exercise from the [Extras](extras) part of the Tutorial [Good practices for HPC and Cloud 2019-05-23](.).

In this advanced part of our HPC Cloud tutorial we ask you to play around with [Kubernetes](https://kubernetes.io/).

>**NOTE:**
>
>You are now in the advanced section of the workshop. You have your laptop and an Internet connection. We expect you will be able to find out more on your own about things that we hardly/don't explain but which you think you need. For example, if we were you, at this point we would've already googled for several things: 
>
>1. Docker containers
>1. Why Kubernetes
>1. Kubernetes cheatsheet
>1. OpenNebula and Kubernetes

### a) Importing the Kubernetes app

OpenNebula's on-line ecosystem includes a generally available [marketplace](http://marketplace.opennebula.systems/appliance) which the broad Internet community can benefit from. For historical reasons, we have removed that marketplace from the HPC Cloud, but you can still import into your HPC Cloud project apps from the general marketplace. 

In particular, they offer a **Kubernetes `App`** (we invite you to search for it now) which can be handy to simply pull to start working with. We will be importing that Kubernetes `App` as an example on how to work with _Apps_ stored somewhere else.

The steps we will follow are:

* i. Importing the `image`
* ii. Importing the `template`

>**Note**:
>
>There's an accompanying documentation page from OpenNebula's team on how to use the Kubernetes `App` from the marketplace. You can find the documentation [here](http://marketplace.opennebula.org/docs/service/kubernetes.html).

#### i. Importing an existing `image`

1. To import the `image` from the marketplace, in your web browser, open the [Kubernetes `App`](http://marketplace.opennebula.systems/appliance/edc648b6-5958-4370-9b66-555fd5846182) page. Read the information about the `App`. Then go to the _Files_ tab. You will see a green _Download_ button-like link there. Right-click on that green button and copy the URL to your clipboard. 
2. Back in the HPC Cloud's UI, go to your _Storage_ tab, and click the _Images_ menu item. That should open your Images' list.
3. Click the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button to start creating a new `image`.
4. Fill in a name and a description. Leave the Type as _Operating System image_. You can mark it as persistent. Select the datastore _147: Courses\_img_. 
5. Under the _Image location_ heading, select the option that reads 'Path in OpenNebula server'. Then paste in the _Path_ field the URL which you copied in the first step.
6. At the top of that screen, click on the green _Create_ button.

The HPC Cloud will start downloading the `image` for you. You can see that the image will appear on your list already, and it will remain in status _LOCKED_ until it is ready for you to use. 

### ii. Importing an existing `template`

In your web browser, at the [Kubernetes `App`](http://marketplace.opennebula.systems/appliance/edc648b6-5958-4370-9b66-555fd5846182) web page, you can go to the _Template_ tab. You can click on the right-hand green button to copy the text of the `template`.

1. However, the `template` text that you see there cannot simply be imported as-is into the HPC Cloud. We need to replace the curly brackets by square brackets, the colon by equals, remove some commas, and add a context variable. You can do that yourself as an exercise, but you can also copy the text that we have prepared from you here:

```
"CONTEXT"= [
  "NETWORK"= "YES",
  "ONEAPP_K8S_ADDRESS"= "$ONEAPP_K8S_ADDRESS",
  "ONEAPP_K8S_ADMIN_USERNAME"= "$ONEAPP_K8S_ADMIN_USERNAME",
  "ONEAPP_K8S_HASH"= "$ONEAPP_K8S_HASH",
  "ONEAPP_K8S_NODENAME"= "$ONEAPP_K8S_NODENAME",
  "ONEAPP_K8S_PODS_NETWORK"= "$ONEAPP_K8S_PODS_NETWORK",
  "ONEAPP_K8S_PORT"= "$ONEAPP_K8S_PORT",
  "ONEAPP_K8S_TOKEN"= "$ONEAPP_K8S_TOKEN",
  "REPORT_READY"= "$ONEGATE_ENABLE",
  "SSH_PUBLIC_KEY"= "$USER[SSH_PUBLIC_KEY]",
  "TOKEN"= "$ONEGATE_ENABLE",
  USERNAME = "kuber" 
]
"CPU"= "2"
"VCPU"= "2"
"GRAPHICS"= [
  "LISTEN"= "0.0.0.0",
  "TYPE"= "vnc"
]
"INPUTS_ORDER"= "ONEGATE_ENABLE,ONEAPP_K8S_ADDRESS,ONEAPP_K8S_TOKEN,ONEAPP_K8S_HASH,ONEAPP_K8S_NODENAME,ONEAPP_K8S_PORT,ONEAPP_K8S_PODS_NETWORK,ONEAPP_K8S_ADMIN_USERNAME"
"MEMORY"= "3096"
"OS"= [
  "ARCH"= "x86_64"
]
```

The following is for reference only:

```
"USER_INPUTS"= [
  "ONEGATE_ENABLE"= "M|boolean|Enable OneGate reporting? (req. for multi-node)| |NO",
  "ONEAPP_K8S_ADDRESS"= "O|text|K8s master node address/network (CIDR subnet)",
  "ONEAPP_K8S_ADMIN_USERNAME"= "O|text|UI dashboard admin account (default admin-user)",
  "ONEAPP_K8S_HASH"= "O|text|K8s hash (to join node into the cluster)",
  "ONEAPP_K8S_NODENAME"= "O|text|K8s master node name",
  "ONEAPP_K8S_PODS_NETWORK"= "O|text|K8s pods network in CIDR (default 10.244.0.0/16)",
  "ONEAPP_K8S_PORT"= "O|text|K8s API port (default 6443)",
  "ONEAPP_K8S_TOKEN"= "O|password|K8s token (to join node into the cluster)"
]
```

2. Back in the HPC Cloud's UI, go to your _Templates_ tab, and click the _VMs_ menu item. That should open your Templates list.
3. Click the green _<i class="fa fa-plus" style="background-color:#43AC6A;border-color:#368a55;color:#fff;padding:1px 1ex 1px 1ex;"></i>_ button to start creating a new `template`.
4. Fill in a name for the `template`. Then click on the _Advanced_ tab on the top-right corner of the screen. Paste the template text that you copied in the first step.
5. Click on the green _Create_ button to save the template.
6. You will see the new `template` on your list. Select it and click on the blue _Update_ button to edit the `template` you just created. Go back to the _Wizard_ tab on the top-right corner of the screen. 
7.  Choose the _Storage_ tab. Click on the _Disk 0_ entry to the left of the screen, then choose the `image` you imported in the previous section. 
8.  Click on the _Network_ tab. Add the _Internet_ network.
9.  Click on the _OS Booting_ tab. Under _Boot order_ choose **disk0**.
10. Click on the _Context_ tab. **Uncheck** the option 'Add OneGate token'.
11. Click on the green _Update_ button to save the changes.


> **_Food for brain:_**
>
> * What version does the API reply with?

### c) Run a second example

* Run the example from the presentation that shows a list of your VMs.

> **_Food for brain:_**
>
> * Can you now modify the VM list to show **only** the running VMs?
> * Can you make a program that will shutdown all your VMs but leaving intact the one you are running the program from?

## <a name="xml_print"></a> Helping code
 
  * [Helper XmlUtil class](./code/xml_util.py)
