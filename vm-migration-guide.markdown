>**NOTE:**
>
>This page is **still being written**: you can expect frequent changes here until the information, the text and overall style settle down. Please bear with us.

# VM migration guide

This guide aims at helping you if you find yourself in the situation that you need to bring an existing `image` from the old HPC Cloud to the new one. Among other changes, the most notable one is that you are likely to have to [contextualise](contextualization) your VM so that it will have its network configured.

The steps we will follow are the following:
1. Export your `image` on the old HPC Cloud
1. Import that `image` into the new HPC Cloud
1. Make a `template` using that `image`
1. Start a VM and set contextualization up

## Export your image on the old HPC Cloud

1. **On the old HPC Cloud:** You have decided which `image` you are going to bring over. Make sure that there are no VM(s) running at the moment that may be using that `image`. Shut VM(s) down that may be using your intended `image` before you proceed any further. Once the VM(s) have disappeared from the list of VMs, proceed to the next step.
1. **On the old HPC Cloud:** Go to the _Images_ tab. Locate your `image` on the table of `image`s.
1. **On the old HPC Cloud:** Click anywhere (**except for** the checkbox on the left of it) on the row for that `image`, so that a panel with extended information shows at the bottom of the screen.
1. **On the old HPC Cloud:** Click on the button _Copy to VirDir_ from the extended-information panel.

The `image` will now be copied to VirDir. Depending on its size, it may take quite some time. A pop-up dialogue will tell you this and which name your `image` will have.

## Import your `image` into the new HPC Cloud

>**NOTE:**
>
>In these steps you will be **exposing your VirDir** to the outside world. Make sure you understand the risks, and destroy the new VM you will be making as soon as you are finished importing the `image`.

### Expose your image via a web server
1. **On the old HPC Cloud:** From the wizard (tab _Create VM_), create a small new Ubuntu server VM. In further steps, we will call this the _Bridge VM_. Make sure you choose _yes_ on both questions from _Step 3_, so that your VM has ports open for the web server. Once the VM boots, on the noVNC console, wait for the first-run wizard to start; then provide there a password for root and create a non-root user. After the first-run wizard is complete, you will be prompted to log in.
1. **On your laptop:** Make sure you can browse the landing page of the web server that is running on your _Bridge VM_ (i.e.: navigate to the external IP address of your _Bridge VM_, which has the form: 145.100.X.X).
1. **On your laptop:** SSH into your _Bridge VM_ (remember, you need to use your **non-**root user. Once you are logged in as the plain user, become root by running the command `su -`.
1. **On the _Bridge VM_:** As root on the SSH connection you opened on the previous step, make a new directory in which to mount VirDir. We will call it `/virdir`. The command is:
```
mkdir /virdir
```
1. **On the old HPC Cloud UI:** Find out your internal network IP. It will be of the form `10.0.Y.Z`. You will need to remember the value for that `Y`. Write down also the name of your project, which is the value for column _Group_ on the list of VMs.
1. **On the _Bridge VM_:** You will mount VirDir. In the following commands, substitute the values for `Y` and `<group>` you gathered in the previous step:
```
mount -t nfs4 10.0.Y.4:/<group> /virdir
```
1. **On the _Bridge VM_:** Make sure you can see a `/Scratch` directory under `/virdir` now. That way you make sure you have successfully mounted your VirDir. You can use the following command:
```
ls /virdir/Scratch
```
1. **On the _Bridge VM_:** The previous command should show the files that you have in your `/virdir/Scratch` directory. Among them, you should see the file for the `image` you _copied to VirDir_ in previous steps. Note the name.
1. **On the _Bridge VM_:** Expose VirDir via the web server. You can run the following commands: 

```sh
sed -i '/^<\/VirtualHost>/c\
        Alias /vd /virdir\
       <Directory /virdir>\
               Options Indexes FollowSymLinks MultiViews\
               AllowOverride None\
               Require ip 145.100.56.19\
       </Directory>\
</VirtualHost>
' /etc/apache2/sites-available/000-default.conf

service apache2 restart
```

### Bring your image to the new HPC Cloud
1. **On the new HPC Cloud:** Using the _user_ view, go to the _Images_ tab, and click on the green _[+]_ button to add a new `image`. A from will pop up.
1. **On the new HPC Cloud:** On the _Create Image_ form:
 * fill in a _Name_. 
 * in the _Image location:_ area, mark the _Provide a path_ radio button
 * fill in the _Path_ to the `image` file, pointing to the web server running in your _Bridge VM_, which will be something like: `http://145.100.X.X/vd/Scratch/2015MMDD:hh:mm_sometext` (you need to use the right IP instead of the _X.X_ and the actual name of the file, including the colons)
1. **On the new HPC Cloud:** Click on the green _Create_ button at the bottom of the form, and an `image` with the name you wrote on the form will appear on the images table, in status LOCKED. It will remain in that status until the UI has finished copying the file from your _Bridge VM_ to the new HPC Cloud. Then it will change to READY.
