---
layout: default
---
# User management

As a group administrator you can create users, change their passwords and set and change their quotas for number VM's running, CPU usage and memory usage. 

> For user management, you need to change to the `groupadmin` view. See the page on the [user interface](user-interface#switch-views) for more information on how to do this.

All user specific operations can be done from the _System/Users_ section.
One user operation is group specific: managing group administrators needs to be done from the _System/Groups_ section.

Procedures explained below:

- [New user](#new-user)
- [Reset password](#reset-password)
- [User quota](#user-quota)
- [Make user group admin](#make-user-group-admin)
- [Delete user](#delete-user)	

## New user

Purpose: create a new user login for your project in the HPC Cloud.

- make sure you use the `groupadmin` view
- go to the  _System/Users_ section
- click on the green `+` icon to start  
  ![new user start](images/new_user_start.png)
- fill in username and (strong!) password
- click the green `create` button
- communicate the login and password to the user
  ![new user form](images/new_user_form.png)

On the 'Users' page, all users if your project are visible, including you yourself. You can select the user to edit it. There are three main options:

 * _Quotas_ button: Clicking on this icon allows you to change the user quotas
 * _Password_ button: Clicking on this will let you change the password
 * One with a garbage bin on a red button. With this, you can delete the account.

## Select user

As a group administrator you can change several settings connected to the user.
In these cases you must first select the user.

- make sure you use the `groupadmin` view
- go to the  _System/Users_ section
- select the user by clicking on e.g. the name
  ![user selection](images/user-select.png)

## Reset password

If a user has forgotten his login password you can assign a new one.

- select the user (see [above](#select-user))
- click the blue `Password` button in the top row
- fill in a (strong!) password, twice, and click `Change`
- communicate the new password to the user
  ![](images/user-change-passwd.png)

## User quota

The project has hard quota restriction on disk image storage.
In addition, you can further restrict the use of resources per user.

- select the user (see [above](#select-user))
- click the `Quota` tab.
- check the current limits for this user: display is _usage/max_, `-` means not restricted (Example: `0/-` means no usage, not restricted.)
- edit the quota with the blue `Quota` button, use `Apply` when done

Quota can be set on max simultaneous VMs, cores and more.
No quota can be set on Core Hours consumed.

## Make user group admin

You can give a user the same rights as you (as a group admin) have, this is done through the _System/Groups_ section.

> _Note:_ Additional steps must be taken by SURFsara after you promoted a user to group admin.  
>  Email helpdesk@surfsara.nl that "the group admin rights for _myproject-name_ need to be updated".

- make sure you use the `groupadmin` view
- go to the  _System/Groups_ section
- select the group by clicking on e.g. the name
  ![user selection](images/group-select.png)
- select the `Users` tab: Users marked with a star are administrators
- use the `Edit administrators` button to update administrator rights
  ![user selection](images/group-admins.png)
- click on a user to toggle administrator rights, use `Apply` when done
- _remember:_ additional step needed by SURFsara, see [above](#make-user-group-admin)



## Delete user

- make sure that no resources are owned by the user login
  - check _Instances/VMs_, _Templates/VMs_
  - check _Storage/Images_ (need to switch to `user` view)
- select the user (see [above](#select-user))
- use the red trash can symbol to delete the user permanently
  ![delete user](images/user-delete.png)

