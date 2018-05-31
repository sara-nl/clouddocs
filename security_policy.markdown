---
layout: default
---
# Security policy

There are two types of security notifications that can be sent regarding a VM:

 * Vulnerability notification; the VM is vulnerable for attacks from outside sources. For example, certain firewall rules allow access from the internet to services which are usually restricted. Or authentication settings are too loose or missing. SURF perform some regular checks on these kind of vulnerabilities. If a vulnerability is found, the owner of the VM and the contact person for the associated project environment are notified.
 * Abuse notifications; the VM is performing malicious activities which are not allowed. For example, port scans or brute force attempts on (project) external servers. SURF perform regular checks and can receive complaints from external parties. In this case, the associated VM will be stopped immediately and the VM owner and the contact person for the associated project environment are notified. Without additional measures, the VM is not allowed to resume.

Note that although SURF does some proactive checks, the VM owner remains responsible for the security of his/her VM.
