---
layout: default
---
## Editing _Input/Output_ options of a template

>**Remember:**
>
>VMs are created by instantiating a `template`, and they will run as a KVM process on a physical computer. KVM delivers an environment to the VM where it emulates the typical functionality you would expect from a PC: a BIOS, a boot-up sequence... 

### VNC

**spice is not supported at this time**

A basic I/O set including a «screen», a «keyboard» and a «mouse» is available as if you were using directly-attached peripherals to your VM, by means of a VNC connection. You can operate on VNC sessions via your browser. You do **not** need any specific software on your VM to enable this. 

You can configure the VNC connections that de HPC Cloud will serve for VMs instantiated out of the `template` you are editing. Relevant options are:

>**NOTE:**
>
> Our tests suggest that the _Password_ option does **not** work

* _Keymap_: keyboard layout you would like VNC to understand. By default you get an en-us layout. See at the end of this page all supported key maps.
* _Password_: to require every VNC connection to type in a password

### Inputs

If you plan on using a graphical environment through VNC (such as GNOME or KDE; or Windows), then you are advised to add the following _Input_ record, so that the mouse pointer will work properly:

* _TYPE_: Tablet
* _BUS_: USB

---

> **Appendix - List of supported keymaps for VNC**
>
> You can write one of the following values in the _Keymap_ field:
* ar
* bepo
* cz
* da
* de
* de-ch
* en-gb
* en-us
* es
* et
* fi
* fo
* fr
* fr-be
* fr-ca
* fr-ch
* hr
* hu
* is
* it
* ja
* lt
* lv
* mk
* nl
* nl-be
* no
* pl
* pt
* pt-br
* ru
* sl
* sv
* th
* tr
