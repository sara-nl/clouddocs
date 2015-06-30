

# Generate Secure Shell (SSH) key on Linux or MacOS

## Check if SSH key already exists

The first step is to check if you have already a SSH key. The default location is ~/.ssh/id_rsa for the private key and  ~/.ssh/id_rsa.pub for your public key. 

To check use ls `ls -l  ~/.ssh/`

For example, this user have already a key available and could jump to "Copy your SSH key"
```sh
$ ls -l  ~/.ssh/
total 72
-rw-------+ 1 user  staff    287 Mar 10 09:13 config
-rw-------+ 1 user  staff   1679 Nov 25  2014 id_rsa
-rw-r--r--+ 1 user  staff    409 Nov 25  2014 id_rsa.pub
-rw-r--r--+ 1 user  staff  17351 Jun 30 12:13 known_hosts
````

## Generate SSH key

Generation of a SSH key can be done with `ssh-keygen -t rsa -b 4096` 

After this ssh-keygen asks for a passphrase. A passphrase is the same as a password, but in general it contains more characters. It is possible not use a passphrase, but this is not considered as good practice in terms of security. After entering your password ssh-keygen ask for conformation of the passphrase.

For example:

```sh
$ssh-keygen -t rsa -b 4096 
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
## Copy your Public SSH key

You can copy paste your public key after displaying with cat
```sh
cat ~/.ssh/id_rsa.pub
```

or on MacOS you can copy it directly into the paste buffer with:
```sh
pbcopy < ~/.ssh/id_rsa.pub
```
After copying you can paste the public key into OpenNebula

# Generate Secure Shell (SSH) key on Windows

A way to generate a SSH key under Windows is with help of PutTTY-gen. PuTTYgen can be downloaded at http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html or directly downloaded from http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe .

* Start PuTTYgen
* In the field "Type of key to generate", please select "SSH-2 RSA".

![puttygen_default](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_default.png)

* Click on  "Generate".

![puttygen_random](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_random.png)

* Move your pointer under the bar and move the mouse in this field until the bar is completely green.

![puttygen_done](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_done.png)

* Fill in a passphrase in the "Key passphrase" field. A passphrase is the same as a password, but in general it contains more characters. Repeat the same passphrase in the  "Confirm passphrase" field. It is possible to not use a passphrase, but this is not considered as good practice in terms of security.
* Save your private key at a secure spot (never share this file!) with the "Save Private Key". The extension of the file must be `.ppk`. You need this file later on to login to your machine.
* Save your public key at with the "Save Pubilic Key".
* Select all text from the "Public key for pasting into OpenSSH authorized_keys file" and copy paste this in OpenNebula [link link]