### Generate Secure Shell (SSH) key on Linux or MacOS



### Generate Secure Shell (SSH) key on Windows

A way to generate a SSH key under Windows is with help of PutTTY-gen. PuTTYgen can be downloaded at http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html or directly downloaded from http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe .

* Start PuTTYgen
* In the field "Type of key to generate", please select "SSH-2 RSA".

![puttygen_default](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_default.png)

* Click on  "Generate".

![puttygen_random](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_random.png)

* Move your pointer under the bar and move the mouse in this field until the bar is completely green.

![puttygen_done](https://doc.hpccloud.surfsara.nl/oortdoc/docs/raw/master/images/puttygen_done.png)

* Fill in a passphrase in the "Key passphrase" field. A passphrase is the same as a password, but in general it contains more characters. Repeat the same passphrase in the  "Confirm passphrase" field. It is possible to not use a passphrase, but this is not considered as good practice in terms of security.
* Save your private key at a secure spot with the "Save Private Key".
* Save your public key at with the "Save Pubilic Key".
* Select all text from the "Public key for pasting into OpenSSH authorized_keys file" and copy paste this in OpenNebula [link link]