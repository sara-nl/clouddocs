---
layout: default
---

# PuTTY tools

## Generate SSH key on Windows with PuTTYgen

A way to generate a SSH key under Windows is with help of PutTTY-gen. PuTTYgen can be downloaded at http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html or directly downloaded from http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe .

* Start PuTTYgen
* In the field "Type of key to generate", please select "SSH-2 RSA".

![puttygen_default](images/puttygen_default.png)

* Click on  "Generate".

![puttygen_random](images/puttygen_random.png)

* Move your pointer under the bar and move the mouse in this field until the bar is completely green.

![puttygen_done](images/puttygen_done.png)

* Fill in a passphrase in the "Key passphrase" field. A passphrase is the same as a password, but in general it contains more characters. Repeat the same passphrase in the  "Confirm passphrase" field. It is possible to not use a passphrase, but this is not considered as good practice in terms of security.
* Save your private key at a secure spot (never share this file!) with the "Save Private Key". The extension of the file must be `.ppk`. You need this file later on to login to your machine.
* Save also your public key with the "Save Pubilic Key". The extension of the file should be `.pub`. You need this file later on to copy to your UI profile.
* Select all text from the "Public key for pasting into OpenSSH authorized_keys file" and copy paste this in [OpenNebula UI](https://ui.hpccloud.surfsara.nl/) *profile*.


## SSH access from a Windows PuTTY client

A well known SSH client for Windows is PuTTY. 

>**Note:**
>You can download Putty [here](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). 
>
>This client only works with a terminal and does **not** support a graphical user interface out of the box.

To login to your VM:
1. start Putty  
2. Fill in the Host Name (or IP address) the Host Name (or IP address) e.g. vmname.projectname-institute.vm.surfsara.nl or 145.100.XX.XX  
3. Select _Connection ->Data_ on the left hand panel  
4. Fill in your user name at _Auto-login username_ (for the first time you start a VM this should be _root_ )  
5. Select _Connection->SSH->Auth_ on the left-hand panel  
6. Select your private key by selecting the _browse_ button and navigate to your private key (with the `.ppk` extension)  
7. Select _Session_ on the left-hand panel  
8. Save the session by giving it a name under _saved sessions_ and click on the _save_ button.  
9. Click the _Open_ button.  
10. In case you have set a passphrase on your certificate, you will have to fill it in.  
11. Now you are logged on to your VM  

>**Note:**
>The first time you start a session to a VM a warning is given that the machine is not cached. Select _yes_ to continue the session.
