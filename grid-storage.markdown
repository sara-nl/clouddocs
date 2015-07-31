---
layout: default
---
# Grid storage

This documents the various ways to connect to Grid storage from a Cloud VM. 

**Note:** this page is a work in progress and might or might not work for you -- [YMMV](http://en.wiktionary.org/wiki/your_mileage_may_vary).

There are two ways to access Grid Storage from your virtual machines:
* with your CUA credentials or 
* with your Grid certificate: see [[Grid storage certificates]]

## Tools

* General about Grid data: http://www.globus.org/grid_software/data/

* [cURL](http://linuxcommand.org/man_pages/curl1.html): URL transfer
* [cadaver](http://www.webdav.org/cadaver): WebDAV client for linux
* [uberftp](https://github.com/JasonAlt/UberFTP): powerful GridFTP client
* [GSI-Enabled OpenSSH](http://grid.ncsa.illinois.edu/ssh/)
* [davfs2](http://savannah.nongnu.org/projects/davfs2) "Mount a WebDAV resource as a regular file system"

## CUA credentials and WebDAV

Use a WebDAV client and connect to **webdav**.grid.sara.nl:

```bash
VM$ curl -k -f -u USER -p -L https://webdav.grid.sara.nl/pnfs/grid.sara.nl/data/VO_NAME/PATH -o LOCAL_NAME
```

Explanation of the flags:

* **-k** do not complain about bad server certificate (HTTPS)
* **-f** if transfer fails, return a failure code, not the HTTP document describing the failure
* **-u user** authenticate with CUA account
* **-p** get password interactively from terminal
* **-L** follow redirects (needed!)
* **-o file** alternative to redirect "@>file@"
* **-v** (optional) verbose output

## Grid certificate and WebDAV

You need to complete step [Grid storage certificates](grid-storage-certificates) first.

## with your key and certificate in separate files

Use a WebDAV client and connect to **bee34**.grid.sara.nl:

```bash
VM$ curl --capath /etc/grid-security/certificates/ --key ~/.globus/userkey.pem --cert ~/.globus/usercert.pem -L https://bee34.grid.sara.nl/pnfs/grid.sara.nl/data/VO_NAME/PATH -o LOCAL_NAME
```

## Grid certificate and VOMS

**_WARNING: this section is not yet finished._**

You need to complete step [[Grid storage certificates]] first.

### Install and configure VOMS proxy support

Install the VOMS client software:

```bash
VM$ sudo apt-get install voms-clients
```

Create VOMS information files:

```bash
VM$ VOMSNAME="lsgrid"
VM$ sudo mkdir -p /opt/glite/etc/vomses/
VM$ scp ui.grid.sara.nl:/etc/vomses/${VOMSNAME}-voms.grid.sara.nl .
VM$ sudo cp ${VOMSNAME}-voms.grid.sara.nl /opt/glite/etc/vomses/
VM$ sudo mkdir -p /etc/grid-security/vomsdir
VM$ scp -r ui.grid.sara.nl:/etc/grid-security/vomsdir/${VOMSNAME}/ .
VM$ sudo cp -r ${VOMSNAME}/ /etc/grid-security/vomsdir/
```

### Create a VOMS proxy

```bash
VM$$  voms-proxy-init -vomses lsgrid-voms.grid.sara.nl --voms lsgrid
```


## Grid certificate and GridFTP

**_WARNING: this section is not yet finished._**

You need to complete step [[Grid storage certificates]] first.

### Install `globus-url-copy`

Ubuntu:

```bash
VM$ sudo apt-get install globus-gass-copy-progs
```

### Transfer a file

Create a VOMS proxy (see above).

```bash
VM$ globus-url-copy gsiftp://fly1.grid.sara.nl:2811/pnfs/grid.sara.nl/data/lsgrid/luuku/testfile pipo.f
```

## UberFTP

### CentOS

CentOS has a package uberftp which can be installed with:

```bash
VM$sudo yum install uberftp
```

### Ubuntu

For Ubuntu we made a Personal Package Archive(PPA), which contains a package to install uberftp. At the moment this is only tested for Ubuntu 14.04.

To add a PPA to your system install add-apt-repository with

```bash
VM$sudo apt-get install software-properties-common
```

then add the PPA and install UberFTP

```bash
VM$sudo add-apt-repository ppa:maarten-kooyman-6/ppa
VM$sudo apt-get update
VM$sudo apt-get install uberftp 
```

See also: [uberftp documentation](https://github.com/JasonAlt/UberFTP/wiki/User-Guide)
