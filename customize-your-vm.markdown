The HPC Cloud is offered as an Infrastructure as a Service (IaaS). That allows you to give your Virtual Machines (VMs) the _form_ that you need them to have.

You can customise your VMs by editing the `template`s you instantiate the VMs from.

## Editing a template

In order to edit an existing template, under the _Virtual Resources_ menu, choose the _Templates_ item. This will show a list of available `template`s. Click on the one you want to edit. Extended information about that image will be displayed within two tabs: _Info_ and _Template_. 

Over this extended information area, there are 3 buttons. One of them says _Update_. If you click there, you will be able to edit the _template_. Do it now; the button will become green and, to its right, you will see 2 modes for editing the _template_: a _Wizard_ mode and an _Advanced_ one. 

> **NOTE:**
>
> We will talk about the _Wizard_ mode here. The _Advanced_ one can be handy to see a full summary of the template, and it is also a good view to copy-and-paste templates in case you need to.

### _General_ options of a template

When editing a template, the _General_ tab allows you to personalise:

> **NOTE:**
>
> On each option, if you hover your mouse over the _(?)_ mark, you will get a tooltip box with extra information.

* _Description_: it is a long text that you can use to write notes about the `template`. It is something for you (i.e.: human-readable).
* _Logo_: in several `view`s (like the _cloud_ one), in different places this logo is shown to visually help you identify VMs and `template`s. You can choose a meaningful image for each `template` and VM that will help you administer them.
* _Memory_: it refers to RAM memory. You can drag the slider (or simply type a value on the text box) to specify, in MB, how much RAM you want your VM to have.
* _CPU_: fraction of CPU time per time unit that you want your VM to have. If you want 4 cores available, then type 4. If you want to emulate the Small and Medium nodes we used to have in the past, type here 0.25 or 0.5 respectively. Your quota will tick proportionally.
* _VCPU_: amount of cores you want your VM to see. 
* _Do not allow to change capacity_: when using the _cloud_ `view`, it prevents from changing _Memory_, _CPU_ or _VCPU_.
* _Do not allow to modify network configuration_: when using the _cloud_ `view`, it prevents from changing `NIC`s on this template.