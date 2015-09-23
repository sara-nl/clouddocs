---
layout: default
---
## Editing _Context_ options of a template

>**NOTE:**
>
>There is a specific [documentation page](contextualization) to explain more about the concepts of _Contextualisation_. 
>
>Contextualisation on this page refers to what information is made available from OpenNebula to your VM. It is up to your VM to take this information and do something useful with it. Some packages exist for certain operating systems that may help, such as a `.deb` or an `.rpm` version.

You can personalise the way you want contextualisation applied to your VM. The options are split into 4 subsections:

* _Network & SSH_: to configure contextualisation aspects related to network and SSH
* _Files_: to include files in the contextualisation CD-ROM
* _User Inputs_: to require the user to fill in values upon VM creation
* _Custom vars_: to add variables to the contextualisation file on the CD-ROM

### _Network & SSH_ options

Under the _Network & SSH_ subsection, you can choose to:

* enable/disable the contextualisation features for SSH
  * If you enable the tick-box and you paste a [public key](https://en.wikipedia.org/wiki/Public-key_cryptography) on the _Public Key_ box, then this public key will become available on the VM and you will be able to log into your VM with the private-public key pair for that public key. If you enable the tick-box but leave the _Public Key_ box empty on the template, then the VM will receive the user's _Public SSH Key_.
* enable/disable the contextualisatation features for networking
  * If you enable the _Add Network Contextualization_ check-box, then the contextualisation file on the CD-ROM will include configuration parameters for the `nic`s defined in the `template`. 
* enable/disable OneGate
  * If you enable the _Add OneGate token_ check-box, then OpenNebula will assign a token-value to your VM and make that value available on the contextualisation file. Programs in your VM can then use this token to communicate information to OpenNebula.

> **NOTE:**
> 
> Our first release of OpenNebula has **OneGate not enabled**.

### _Files_ options

On the _user_ `view`, under the _Virtual Resources_ menu, there is an item called _Files & Kernels_. You can create `file`s of _Type_ _Context_ there. Then, you can link them to the `template` you are editing under the _Files_ subsection of the _Context_ tab. These files will then be made available on the contextualisation CD-ROM so that the VM can access them, and you can use them in your programs on your VM right away.

Alternatively, or at the same time, on the _FILES_DS_ field you can write the raw line that should be copied into the `template` describing `file`s to include.

The _Init scripts_ field allows you to specify scripts (programs) that must be run on the VM when the operating system within your VM is booting. You can specify several of them and in which order like: `init.sh set_up_my_user.sh set_up_my_web_server.sh`

### _User Inputs_ options

You can add a list of variables you want to ask the user to fill in when she creates a VM out of the `template` you are editing. When she instantiates the `template`, a form will pop-up asking her to fill the variables you have specified. The values she provides will become available in the contextualisation CD-ROM as ⟨key, value⟩ pairs.

### _Custom vars_ options

You pre-define extra ⟨key, value⟩ pairs of your own that will be included in the contextualisation CD-ROM.
