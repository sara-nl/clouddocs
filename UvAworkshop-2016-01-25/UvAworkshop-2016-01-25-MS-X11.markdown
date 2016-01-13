---
layout: default
---

# UvA workshop 2016-01-25 preparation: X11 on Microsoft Windows

> **NOTE: only for Windows users**

For the course purposes you will need to start a graphical [X11](https://en.wikipedia.org/wiki/X_Window_System) window in your laptop that is connected to your HPC Cloud machine. 
To make this work in Microsoft Windows, you need to install an X11 server on your laptop:  

* Make sure you gave installed _git for windows_ (see [preparation](UvAworkshop-2016-01-25#preparation), third bullet)
* Install **Xming**, an X11 server for Microsoft Windows, from [here](http://sourceforge.net/projects/xming/).
* Open Git Bash.
* In the terminal that appears, copy and paste the following commands: 

```sh
# press enter to submit each command
echo "export DISPLAY=localhost:0.0" >> $HOME/.bashrc` 
source $HOME/.bashrc
```

* Close the Git Bash window.
