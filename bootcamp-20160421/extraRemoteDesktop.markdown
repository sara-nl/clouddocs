---
layout: default
---

# SURF Research Boot Camp 2016-04-13  <br/> Detach from work 

<div style="float:right;max-width:205px;" markdown="1">
![SURF Academy logo](/images/surf_academy_logo.png)

<div style="max-width:150px;" markdown="1">
![SURFsara logo](/images/SURFsara_logo.png)
</div>
</div>

This exercise lets you experience the difference between local and remote computatyion: you can organize your work so that it continues after you close your laptop.

You will run a simple program that outputs a line each few seconds and experience what happens when you detach from the program in various ways.

## Set-up

- Create a new VM (you may be able to reuse the existing `images` and `templates` that you have created so far; but you can always import a new appliance from the AppMarket).
- Log into your VM using SSH.
- Let us now create a simple script file called `example.sh`. You can use your favourite editor. In our example we use nano, like this: 

```bash
nano example.sh
```

- Write (or copy-and-paste) these lines into the file:

```bash
#!/bin/bash
while sleep 2
do
  date
done
```

- Save the file and exit the editor. For example, in nano, you press `Ctrl+X` and then you press `Y` to confirm that you want to save your changes. Then you are back in the terminal.

- Make the script executable:

```bash
chmod u+x example.sh
```

- Run the script:

```bash
./example.sh
```

- After a while, terminate the script by typing `Ctrl+C`

## First detach

- Log in to you VM,
- run the example script:

```bash
./example.sh
```

- observe the output's progress
- log in with a second ssh session
- check with `ps` or `pstree` that your script runs,

```bash
pstree
# look for a line like this:
#  ... -example.sh---sleep
```

- disconnect the terminal with the running example by closing its window
- in the other session, use `ps` or `pstree` again to verify the the execution has stopped.

## Using `nohup`

- Log in to you VM,
- use `nohup` to run the example script in the background:

```bash
nohup example.sh &
```

The output will be:

```
nohup: ignoring input and appending output to ‘nohup.out’
```

- as before, check the process with `ps` or `pstree` and have a look at the progress:

```bash
tail -f nohup.out
```

- log out and log back in
- use `ps` or `pstree` to verify that your script is still running
- look at the output file(s) to see that output is still continuing

```bash
tail -f out
```

- kill the running script

```bash
killall example.sh
```

- check the output file again to verify the script is no longer running
- remove the output file.

## Using `screen`

You will use a program called `screen`. Similar programs are:  `tmux`, `dtach`+`dtvm`.

- start screen for the first time

```bash
screen
```

- after reading an initial message, you press the key
- you see the normal shell prompt
- use `pstree` to see that you are actually in a screen session: look for a line similar to

```
├─sshd───sshd───sshd───bash───screen───screen───bash───pstree

```

- start your example script

```bash
./example.sh
```

- wait a few seconds and observe the output, as expected
- detach from the screen session by typing `control-a` plus `d`
- the view is restored to the situarion before you started `screen` and line says something similar to
 
``` 
[detached from 14691.pts-0.ip-145-100-58-55]
```

- wait several seconds and reconnect: use the `-r` flag

```
screen -r
```

- you see that the output has accumulated while you were detached, the script continued to run. 
- detach again (`control-a` plus `d`)
- log out and back in
- reconnect to the screen session
- find the script still running

- terminate the script (`control-c`)
- terminate the shell inside screen (`control-d`)
- you are back with the extra line `[screen is terminating]`
- try `screen -r`

## Multiple `screen` sessions

