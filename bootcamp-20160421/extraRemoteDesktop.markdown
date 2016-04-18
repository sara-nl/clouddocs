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

- Run a VM.
- Log in using SSH.
- Create a simple script file `example.sh`, using your favourite editor, with these lines:

```bash
#!/bin/bash
while sleep 2
do
  date
done
```

- Make the script executable:

```bash
chmod u+x example.sh
```

- Run the script:

```bash
./example.sh
```

- After a while, terminate the script by typing `ctrl-C`

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

- diconnect the terminal with the running example by closing its window
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

## Using `screen`

You will use a program called `screen`. Similar programs are:  `tmux`, `dtach`+`dtvm`.

