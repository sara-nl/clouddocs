# Grid storage certificates

For general information view [Grid Storage](Grid-storage).

## Grid certificates general

Before starting, make sure that you already have a grid certificate (see [Using the Grid](https://grid.sara.nl/wiki/index.php/Using_the_Grid/Getting_a_Grid_certificate):

## Install server certificates

The following procedure was tested in Ubuntu machines. For other linux distributions or extra information, please refer to [EGI IGTF Release](https://wiki.egi.eu/wiki/EGI_IGTF_Release)

* Install the EUGridPMA PGP key as root:
``` bash
VM$ curl https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3 | sudo apt-key add - ```
* Locate sources.list (*/etc/apt/sources.list*) and, as root, add the following lines in the file:
```
#### EGI Trust Anchor Distribution ####
deb http://repository.egi.eu/sw/production/cas/1/current egi-igtf core
```
# Update and install the meta-package:
``` bash
VM$ sudo apt-get update
VM$ sudo apt-get install ca-policy-egi-core
```
This will install a lot of packages (approx. 100).
The directory /etc/grid-security/certificates/ that is created includes all the certificates from approved Certification Authorities.

In case you encounter any problems see [here](https://wiki.egi.eu/wiki/EGI_IGTF_Release) or these steps and copy the whole */etc/grid-security/certificates/* directory from the user interface machine to your VM. 
Be aware that this directory is often updated.

## Install your certificate from a single .p12 file

* Install separate certificate and key .pem files

``` bash
VM$ openssl pkcs12 -in userkeycert.p12 -out ~/.globus/userkey.pem -nocerts
VM$ openssl pkcs12 -in userkeycert.p12 -out ~/.globus/usercert.pem -clcerts -nokeys
```

### Install single .pem with certificate and key

* Copy the p12 file to your VM.
* Export the p12 file to a pem file and protect access
``` bash 
VM$ openssl pkcs12 -in userkeycert.p12 -out userkeycert.pem -clcerts
Enter Import Password: ### type your p12 password
MAC verified OK
Enter PEM pass phrase: ### type a new pem password
Verifying - Enter PEM pass phrase: ### repeat
VM$ chmod go= userkeycert.*
VM$ ls -l userkeycert.pem
-rw-r--r-- 1 demo demo 5929 Jun 24 16:42 userkeycert.p12
-rw-r--r-- 1 demo demo 8240 Jun 24 16:42 userkeycert.pem
```
If you want to leave the password for the exported key blank, add "-keypbe none".

## Install your certificate from ~/.globus/ with userkey.pem and usercert.pem

# Copy the **userkey.pem** and **usercert.pem** from the **~/.globus** directory to your VM:
```
LAPTOP$ ssh ui.grid.sara.nl
UI$ scp ~/.globus/usercert.pem ~/.globus/userkey.pem username@145.100.xx.xxx:
```
* Login to your VM.
* Create a **~/.globus** directory (or any other name) and move your keys inside. Check that the permissions are correct:
``` bash
VM$ mkdir ~/.globus
VM$ chmod go= ~/.globus/
VM$ mv usercert.pem userkey.pem ~/.globus/
VM$ ls -la ~/.globus/
drwx------ 2 demo demo 4096 Jun 21 12:07 .
-rw-r--r-- 1 demo demo 1765 Jun 21 12:07 usercert.pem
-r-------- 1 demo demo 1743 Jun 21 12:07 userkey.pem
```

* with your key and certificate in a single pem file

Use a WebDAV client and connect to **bee34**.grid.sara.nl:
```
VM$ curl --capath /etc/grid-security/certificates/ --cert userkeycert.pem -L https://bee34.grid.sara.nl/pnfs/grid.sara.nl/data/VO_NAME/PATH -o LOCAL_NAME
```
