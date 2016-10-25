---
layout: default
---
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
1. **On the _Bridge VM_:** As root on the SSH connection you opened on the previous step, download the script we have prepared, that will share your VirDir to the new HPC Cloud only, and then run it. Just run these commands for that:

```sh
cd
wget https://doc.hpccloud.surfsara.nl/assets/setup_bridge_vm.sh
chmod +x ./setup_bridge_vm.sh
```

**On the _Bridge VM_:** Run this file giving your _Group_ name as a parameter: `./setup_bridge_vm.sh <group_name>`

### Bring your image to the new HPC Cloud
1. **On the new HPC Cloud:** Using the _user_ view, go to the _Images_ tab, and click on the green _[+]_ button to add a new `image`. A from will pop up.
1. **On the new HPC Cloud:** On the _Create Image_ form:
 * fill in a _Name_
 * choose Type: OS
 * make sure that, for field _Datastore_, you chose _104: local-images-ssd_
 * choose whether you want the `image` to be _Persistent_
 * in the _Image location:_ area, mark the _Provide a path_ radio button
 * fill in the _Path_ to the `image` file, pointing to the web server running in your _Bridge VM_, which will be something like: `http://145.100.X.X/vd/2015MMDD:hh:mm_sometext` (you need to use the right IP instead of the _X.X_ and the actual name of the file, including the colons)
 * Click on the _Advanced options_ dropdown area. There, you must fill in:
  * In _Device prefix_, type `vd`
  * In _Driver_, type `qcow2`
1. **On the new HPC Cloud:** Click on the green _Create_ button at the bottom of the form, and an `image` with the name you wrote on the form will appear on the images table, in status LOCKED. It will remain in that status until the UI has finished copying the file from your _Bridge VM_ to the new HPC Cloud. Then it will change to READY.

>**NOTE:**
>
>Once your `image` on the **new HPC Cloud** shows as READY, if you do not need to bring any more images over, then now is a good time to **destroy your _Bridge VM_**. You can delete it along with its associated `image` and `template`.

## Make a `template` using that `image`

You need to put that `image` that you imported into a `template`. We will do that now.

1. **On the new HPC Cloud:** In the _Templates_ tab, click on the green _[+]_ button to begin making a new `template`.
1. **On the new HPC Cloud:** In the _General_ tab, give it a _name_, the amount of _Memory_ that you want, the amount of _CPU_ and _VCPU_ you need, etc.
1. **On the new HPC Cloud:** In the _Storage_ tab, choose your `image` for the _Disk 0_ disk.
1. **On the new HPC Cloud:** In the _Network_ tab, choose network _internet_ for `nic` _Interface 0_, and add a new `nic`, which will get name _Interface 1_ to assign it to your internal network.
1. **On the new HPC Cloud:** In the Input/Output tab, select the VNC radio button in order to be able to use noVNC via the browser.
1. **On the new HPC Cloud:** In the _Context_ tab, look for `Files` whose name begins with _one-context_. You should see 2 of them: one ending in _.deb_ and another one ending in _.rpm_. If your `image` is a CentOS one (or another Red-Hat-based one), you will want to check the box next to the _.rpm_ `file`. If your `image` is a Ubuntu one (or another Debian-based one), you will want to check the box next to the _.deb_ `file`.
1. **On the new HPC Cloud:** We are done preparing the `template`. Click on the green _Create_ button on the top-left of the screen.

## Start a VM and set contextualization up

1. **On the new HPC Cloud:** Instantiate the `template`. This creates what we will further call _new VM_. On the VNC console, make sure the _new VM_ boots.
1. **On the new HPC Cloud:** On the VNC console, log into your _new VM_ with your credentials, just as you were able to do on the old HPC Cloud. 
1. **On the new VM:** Become root.
1. **On the new VM:** Mount the contextualization CD-ROM, by running this command: `mount -t iso9660 -L CONTEXT -o ro /mnt`
1. **On the new VM:** Install the contextualization package that is appropriate for your VM:
 * if you are running CentOS (or a Red-Hat-based OS), use command: `yum install /mnt/one-context*.rpm`
 * if you are running Ubuntu (or a Debian-based OS), use command: `dpkg -i /mnt/one-context*.deb`
1. **On the new VM:** Restart your VM (run `reboot now`). Your VM should now be in a useable state (among other things, the network should be working).

>**Note:**
>
>When you see that the contextualization is working (e.g.: the network works on the new VM), and if you made the `image` persistent, then you can delete the _one-context*_ _.deb_ or _.rpm_ `file` from the `template`. That `file` will still be visible in your VM until you re-create the VM. 
