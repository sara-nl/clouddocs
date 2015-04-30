# User Interface

## Access the UI

## Change your Password

## Views 

### What is a View

The HPC Cloud interface offers different display options or *views* to different types of users. Each view shows different information tabs and action buttons. Users can have one or multiple views depending on their role in the project. In case of multiple views, users can switch from one to another at will.

### Menu

#### Dashboard
#### Virtual Resources
#### infrastructure
#### Marketplace

### User types

#### Basic user
* Standard View: **cloud**
* Description: simplified view for accessing pre-defined objects (images, templates, VMs) 
* Possible Functions: 
  * VM management
  * Display own quota
  * Display own accounting
  
![tag_name](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/cloud_view.png)

#### Advanced user   
* Standard View: **cloud + user**
* Description: advanced view for creating and managing objects (images, templates, VMs) 
* Possible Functions: 
  * Create Images
  * Create Templates
  * ACL management for objects
  * All Possible Functions that *Basic User* has
  
![tag_name](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/user_view.png) 

#### Groupadmin user 
* Standard View: **groupadmin**
* Description: full control view of all the resources allocated to a project
* Possible Functions: 
  * Create new users in the project
  * Define quotas for each user
  * Display accounting for each user
  * Display accounting for the whole project
  * All Possible Functions that *Advanced User* has

![tag_name](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/groupadmin_view.png) 

### Switch views
The *Groupadmin* and *Advanced* users have access to multiple views and can switch between these anytime. 

* Switching from *cloud* to *user* view:  
In the user interface page, select the user icon at the top right (next to OpenNebula Home icon). Then select the "Change view" window, unfold the tab and switch the option to "user". Finally click on the "Update view" button as displayed below:

![tag_name](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/switch_to_user_view.png) 

* Switching from *user* to *cloud* view:  
In the user interface page, select the user icon at the top right (next to OpenNebula Home icon). Then unfold the tab and select "Settings". On the new window that appears, select the "Conf" tab on top right menu. Then unfold "Views" and switch the option to "cloud0". Finally click on the "Update config" button as displayed below:

![tag_name](https://git.osd.surfsara.nl/cloud-adm/OpenNebula-4.12-deployment/raw/master/images/switch_to_cloud_view.png)  

## Sign Out