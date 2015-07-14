A VM can find itself on a number of different states. Each of those states have a name and a meaning. The state a VM is in also determines the set of states it can move to. Example state names are: PROLOG, BOOT, RUNNING...

The triggers to change state are _action_s. These actions can be triggered by a user on the UI or by the environment itself. Example action names are: create, shutdown, resume... You can see most of these on the UI:

![vm_actions_img](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/vm_actions.png)