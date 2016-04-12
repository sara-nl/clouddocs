---
layout: default
---

# Use Secure Shell (SSH) private/public keys (Linux/Mac/Windows)


## Summary

As an HPC Cloud user you have full control of your virtual machines (IaaS). This means that you are administrator in your own VMs, in other words `root` user.

Most authentication is done with a username/password, but passwords are easy to forget and often not strong enough to withstand cracking. Root access needs good security because it gives full control over the host and is a well known username. 

SSH offers [public key](https://en.wikipedia.org/wiki/Public-key_cryptography) authentication, a method to access a remote machine securely and with not much trouble.
This is great for allowing passwordless access to a remote system, and also more secure than traditional passwords.  You can find abundant information on the Internet about how it all works.

You need to have a file on your local computer (say, your laptop) with a private key, and you need to install its matching public key on the remote computers you want to access (say, your VM). Then, when you are going to connect to the remote machine from your laptop, the private and public keys will be compared and, if they successfully relate to one-another, your SSH connection will be established.

The mechanism to allow connecting with SSH private/public key pairs is already configured (and recommended) on the appliances you can get from the AppMarket. Therefore, you need to have a private/public key pair on your laptop in order to be able to connect to a VM created from the AppMarket.

## Preparation

To apply the following instructions you need a terminal on your local machine (laptop).

* Linux and Mac users have a terminal installed by default.
* Windows users can download and install [git for windows](https://git-for-windows.github.io/). Depending on your OS installation, choose between `Git-XXX-32-bit.exe` or `Git-XXX-64-bit.exe`.
  * Windows users who prefer PuttyGen should look at the instructions for [Putty tools](putty-tools#generate-ssh-key-on-windows-with-puttygen).

## Generate an SSH private/public key pair

### Check existing SSH keys

The first step is to check if you have already a SSH key. Start a terminal (in Mac/Linux) or GitBash (in Windows). The default location is `~/.ssh/id_rsa` for the private key and  `~/.ssh/id_rsa.pub` for your public key.

To check use `ls`:

```bash
ls -l  ~/.ssh/
```

If you see the following files in your output, you already have a key available and can skip to section [Add the key to the local ssh-agent](#add-the-key-to-the-local-ssh-agent)

```
total 72
-rw-------+ 1 user  staff   1679 Nov 25  2014 id_rsa
-rw-r--r--+ 1 user  staff    409 Nov 25  2014 id_rsa.pub
```

### Private key passphrase

When you create a private/public key pair, you will need a passphrase to **protect your local private key**. It is never sent to the remote host.

What is a good passphrase? Choose a long sentence, for example a quote that you like, of more than 35 characters. Because of the length, there is no need to substitute letters with symbols or leave out spaces or punctuation.

But, you say: __I don't want to enter a long passphrase every time I use the key!__
Neither do I, this has been taken care of. You type the passphrase once after logging on to your laptop and a local robot (ssh-agent) will remember your passphrase for the rest of your session.

For more information, please see [Working with SSH key passphrases](https://help.github.com/articles/working-with-ssh-key-passphrases/)

### Generate a private/public key pair

Open a terminal and type `ssh-keygen`. An example dialogue is shown below.
Notes:

1. Leave the output file name blank for the default file name, or type a variation of `~/.ssh/my_chosen_name`.
2. Do choose and remember an easy but long passphrase.
3. If you forget the passphrase, you need to generate a new key pair and replace the old public keys you installed on remote hosts.

Command:

```bash
ssh-keygen
```

Interaction:

```
Generating public/private rsa key pair.
Enter file in which to save the key (~/.ssh/id_rsa): ### see note 1
Enter passphrase (empty for no passphrase): ### see note 2
Enter same passphrase again:
Your identification has been saved in ~/.ssh/id_rsa
Your public key has been saved in ~/.ssh/id_rsa.pub
The key fingerprint is:
40:1f:33:78:32:51:b5:c4:51:56:99:b6:6a:3d:18:8b user@computer.surfsara.nl
The key s randomart image is:
+---[RSA 2048]----+
|                 |
|               ..|
|      .       .o.|
|       + +.o  o+ |
|      + S.B.o.+.o|
|       E =++oooo+|
|      . =oo= ++.=|
|       *....Bo = |
|      o.o..+o..  |
+----[SHA256]-----+
```

## Using `ssh-agent`

SSH-agent is a service on your laptop to remember your ssh passphrase during your local session (that is, until you log out from your laptop).
This way, you do not have to type in that loooong passphrase every time you unlock your private key.

### Add the key to the local ssh-agent

Command:

```bash
ssh-add ~/.ssh/id_rsa ### or the file name you provided to ssh-keygen
```

Interaction:

```
Enter passphrase for ~/.ssh/id_rsa: ### type it in
Identity added: ~/.ssh/id_rsa
```

If this fails because "Could not open a connection to your authentication agent", you need to start ssh-agent before you run the ssh-add command:

```bash
eval `ssh-agent -s`
```

### List keys currently in ssh-agent

Command:

```bash
ssh-add -l
```

Output will be one line for each key currently stored in the ssh-agent:

```
2048 SHA256:ajAxT3T3ZKl2rALBGGmMqufU0n6XAU15lj+fObZEvrI ~/.ssh/id_rsa (RSA)
```

## Copy your Public SSH key

You can copy/paste your public key after displaying with `cat`

```bash
cat ~/.ssh/id_rsa.pub
```

or on MacOS you can copy it directly into the paste buffer with:

```bash
pbcopy < ~/.ssh/id_rsa.pub
```

After copying you can paste the public key into your account on OpenNebula or into a user account of your VM.
