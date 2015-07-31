---
layout: default
---
## MarkDown best practice for SURFsara HPC Cloud documentation

Please consult the following guidelines before contributing updates, bug fixes, 
or other corrections.

### Submit changes
You can contribute to the HPC Cloud documentation by submitting _fork & 
pull_ requests to push your changes. The changes will be reviewed and merged if 
the request is finally accepted.

> **NOTE:**
>
> _This section is still under construction. As we need your feedback to keep 
improving the documentation, we encourange you to send your remarks at 
helpdesk@surfsara.nl._

### Text emphasis conventions

* Highlight text  
Highlight important text in **bold letters**. Have a look at the source and 
notice the double asterisks wrapping the emphasised text.

* OpenNebula keywords  
We want to distinguish `OpenNebula` keywords, such as `Virtual Machine` or 
`Template`. Have a look at the source and notice the accents wrapping the keywords.

* Menu items  
We want to emphasise user interface menu items, such as _Sign Out_. Have a look 
at the source and notice the underscore wrapping the keyword.

* Important notice  
Callouts and text blocks of high attention should be different to body text.  
Here is an example. 

> **NOTE**
>
>VMs are created by instantiating a `template`.

Have a look at the source and notice the character `>`.

### Command lines and output

We want command lines without leading prompt, so that the user may tripple-click and copy/paste it.

To stimulate non-root access, prefix with `sudo` if needed.

Output should be visually different from the command by block-quoting it.

Here is an example.

---

Please execute the following command:
```sh
sudo rm -rf * .o
```

Expected output:

>
```
rm: .o: No such file or directory
```

---

Have a look at the source and notice the blank line between `Expected output:` and the `>`.
This seems to be the only way to have different editord and renderers create the same output. 

### Other

Please add more best practise.
