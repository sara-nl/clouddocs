---
layout: default
---
>**NOTE:**
>
>SSH private/public key pairs are great for allowing passwordless access to a remote system, and also more secure than traditional passwords. You can find abundant information on the Internet about how it all works, but as a summary, you need to have a file on your local computer (say, your laptop) with the private key, and you need to make a matching public key available on the remote computer (say, your VM). Then, when you are going to connect to the remote machine from your laptop, these keys will be compared and, if they successfully relate to one-another, your SSH connection will be established. 

The mechanism to allow connecting with SSH private/public key pairs is already configured (and recommended) on the appliances you can get from the AppMarket. Therefore, you need to have (otherwise, generate) a working private/public key pair on your laptop in order to be able to connect to a VM created from the AppMarket.

# Preparation

To apply the following instructions you need a terminal. 

* Linux and Mac users have one installed by default. 
* Windows users can download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between `Git-XXX-32-bit.exe` or `Git-XXX-64-bit.exe`. 
  * For Windows users that want to use PuttyGen, see the instructions for [Putty tools](putty-tools#generate-ssh-key-on-windows-with-puttygen).

# Generate a Secure Shell (SSH) key on Linux or MacOS or Windows (GitBash)

## Check if an SSH key already exists

The first step is to check if you have already a SSH key. Start a terminal (in Mac/Linux) or GitBash (in Windows). The default location is ~/.ssh/id_rsa for the private key and  ~/.ssh/id_rsa.pub for your public key. 

To check use ls 

```sh
ls -l  ~/.ssh/
```

For example, this user already has a key available and could jump to section "Copy your SSH key"

```bash
$ ls -l  ~/.ssh/
total 72
-rw-------+ 1 user  staff    287 Mar 10 09:13 config
-rw-------+ 1 user  staff   1679 Nov 25  2014 id_rsa
-rw-r--r--+ 1 user  staff    409 Nov 25  2014 id_rsa.pub
-rw-r--r--+ 1 user  staff  17351 Jun 30 12:13 known_hosts
```

## Generate an SSH key

Generation of a SSH key can be done with `ssh-keygen -t rsa -b 4096` 

>**NOTE:**
>
>After this ssh-keygen asks for a passphrase. A passphrase is the same as a password, but in general it contains more characters. It is possible not use a passphrase, but this is not considered as good practice in terms of security. After entering your password ssh-keygen asks for confirmation of the passphrase.

For example:

```bash
$ ssh-keygen -t rsa -b 4096 
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/user/.ssh/id_rsa
Your public key has been saved in /home/user/.ssh/id_rsa.pub
The key fingerprint is:
40:1f:33:78:32:51:b5:c4:51:56:99:b6:6a:3d:18:8b user@computer.surfsara.nl
The key s randomart image is:
+--[ RSA 4096]----+
|      o=B+++.o   |
|     .+oo*. +    |
|      .++. = .   |
|       .E o o    |
|        V  o .   |
|          o .    |
|         .       |
|                 |
|                 |
+-----------------+
```

### Extra requirements for Mac OS

On Mac OS you still need some extra commands:

```bash
cd ~/.ssh
ssh-keygen -y -f id_rsa > id_rsa.pub
chmod 600 id_rsa.*
ssh-add -K
```

## Copy your Public SSH key

You can copy paste your public key after displaying with cat

```bash
cat ~/.ssh/id_rsa.pub
```

or on MacOS you can copy it directly into the paste buffer with:

```bash
pbcopy < ~/.ssh/id_rsa.pub
```
After copying you can paste the public key into OpenNebula

