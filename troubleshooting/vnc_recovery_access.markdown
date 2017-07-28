---
layout: default
---

# Recovering your VM through VNC

For Linux VM's, if you cannot log in to your VM through SSH, you will have to debug your network and SSH daemon. For this, you'll need root access to your VM, which is only possible through VNC. As there are no passwords set in the default images we provide, you have no way of logging in as root. Instead, you'll have to boot the VM in recovery mode:

1. Open de VNC viewer and press the button 'Send CtrlAltDel'
2. The machine will reboot and show you the (Grub) boot menu:
 ![grub_menu](images/grub_menu_1.png)
3. Select the Linux kernel you want to boot (in this example, the top one is default and will work fine), and press 'e' to edit the commands before booting. You will now see a screen like this:
 ![grub_edit_item](images/grub_menu_2.png)
4. With your cursor, move to the line that starts with 'linux' and press the 'end' button on your keyboard to go to the end of the line. This could appear as the end of the next line as in this example, this is because the line is to long to show on the screen otherwise.
5. Add " 1" to the end of the line (note the space; it should not be attached to the previous argument). In the screenshot above, there is a yellow marking around the '1'.
6. Press ctrl-x to boot the OS

Once booting is complete, you should now see a shell prompt as the root user.
