---
layout: default
---
# Installing `fail2ban`

`fail2ban` is a program which monitors access logs from different services and blocks access if the access pattern looks like a brute-force attack. If there more failed logins than allowed within a given time, `fail2ban` modifies the firewall to block access from the originating IP-address for some time.
This way, it provides an extra layer of security for services exposed to the internet.

Fail2ban has the concept of 'jails', which are daemons the service monitors, and procedures for each daemon to block access from an IP-address which has too many failed error logs.

> ** IMPORTANT **
> `fail2ban` does *NOT* protect against weak passwords or vulnerabilities in applications themselves.
> We *stronly* discourage you from exposing a services to the internet directly with only a
> password as protection. If you use passwords for authorization, we recommend you to also use an
> additional method for access control, such as whitelisting, or a strict firewall; preferably both.

## Installing and configuring fail2ban on Centos 7

### Installing fail2ban

To install fail2ban on Centos7, you'll also need the EPEL repository. You can install the repository and fail2ban by running these commands as root (or prepend them with 'sudo'):
```
    yum install epel-release
    yum install fail2ban
```

### Configuring fail2ban

On Centos 7, fail2ban is not mon
By default, fail2ban is not started at boot time yet. To make fail2ban start at boot time, use
```
   systemctl enable fail2ban
```
and to start it immediately, use
```
   systemctl start fail2ban
```

 
