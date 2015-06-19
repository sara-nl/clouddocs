# User Interface

## Access the user interface
You can find the UI here: https://ui.hpccloud.surfsara.nl

The UI (short for User Interface) is the web site that allows you to operate the HPC Cloud. Put simply: your way to manage (create/destroy) your Virtual Machines (VM). 

## Change your Password
> **IMPORTANT**
>
>To protect your account, you are advised to change the password that we give you upon your first login. 

This is how you change your password:

1. Look at the top-right corner of the screen on the UI. There is a _buddy_ icon that represents your user. Click on it.
2. Click on _settings_, you will see the option to change or update your password. 
3. On the new screen, type your new password and click the button to submit it.

## Logging out

Whenever you are ready to stop working for the day on the HPC Cloud, you are advised to log out of the UI (short for User Interface).

> **NOTE**
>
> We kindly request you free all resources whenever you are not using them. That way, other users may benefit from them in your absence. When you are about to log out, it is a good moment to reconsider what resources you need to release.

This is how you log out:

1. Look at the top-right corner of the screen on the UI. There is a _buddy_ icon that represents your user. Click on it.
2. Under the _buddy_, you will get an option to log out (you may also see the text _Sign Out_). Click there, and the welcome page will come up asking you to fill your username and password in again.

## Views 
OpenNebula's `view`s are a way to present functionality on the screen. The simpler the `view`, the less functionality it tends to offer, but the easier to understand and operate it tends to be. 

### What is a `view`

We have opted to assign `view`s to users depending on their role within projects. The HPC Cloud interface offers, therefore, different options to different types of users. 

Each `view` shows different information, tabs and action buttons. Users can access one or multiple `view`s depending on their role in their projects. In case of multiple `view`s, users can switch among them. The system remembers what `view` the user was using the last time she was logged in, and new sessions will show that one again. Further in this document we explain how that can be done.

### User types
We have established 3 roles for users in projects:

1. basic user
2. advanced user
3. group administrator user

A group administrator sees the most functionality (including administering other users), the basic user the least, and the advanced user can operate a bit more than the basic user.

#### Basic user
* Available view: **cloud**
* Description: simplified view for accessing pre-defined objects (images, templates, VMs). The other roles (advanced user and group administrator user) can create these pre-defined objects for basic users. 
* Possible Functions: 
  * Manage VMs
  * Display own quota
  * Display own accounting
  
![cloud_view_img](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/cloud_view.png)

#### Advanced user   
* Available views: **cloud** (and **user**)
* Description: more functional view for creating and managing objects (images, templates, VMs) 
* Possible Functions: 
  * Create/Modify/Delete Images
  * Create/Modify/Delete Templates
  * Manage ACLs (Access Control Lists)
  * All functions that **basic user** has
  
![user_view_img](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/user_view.png) 

#### Group Administrator user 
* Standard View: **groupadmin** (and **cloud** and **user**)
* Description: full control of the objects allocated to a project
* Possible Functions: 
  * Create/Modify/Delete users in the project
  * Define quotas for each user
  * Display accounting for each user
  * Display accounting for the whole project
  * All Possible Functions that **advanced user** has

![groupadmin_view_img](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/groupadmin_view.png) 

### Switch views
Users with the **group administrator** and **advanced** roles have access to multiple views, and can switch between these anytime. 

* Switching from **cloud** to **user** view:  
In the user interface, select the user icon at the top right (next to the Home icon). Then select the _Change view_ button, unfold the tab and switch the option to **user**. Finally click on the _Update view_ button as displayed below:

![switch_cloud_to_user_img](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/switch_to_user_view.png) 

* Switching from **user** to **cloud** view:  
In the user interface, click the _buddy_ icon at the top right (next to the Home icon). On the pop-up menu select _Settings_. On the new window that appears, click on the _Conf_ tab on top right menu. Then unfold _Views_ and switch the option to **cloud**. Finally click on the _Update config_ button as displayed below:

![switch_user_to_cloud_img](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/switch_to_cloud_view.png)  

### Menu

#### Dashboard
#### Virtual Resources
#### infrastructure
#### Marketplace