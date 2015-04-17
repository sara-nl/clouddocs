## Feature table old/new

| Feature | Old | New | Issue | Comment |
| ------- | --- | --- | ----- | ------- |
| Wizard | yes | no | - | Use marketplace. Do we have our own marketplace? Can we upload/download/update apps (images)? |
| SARA marketplace | (~Wizard) | possible | ? | technically possible, needs maintenance |
| VirDir storage | yes | no | #5 | Run your own NFS server |
| VirDir/Backup  | yes | no | ? | (a) Roll your own, (b) new feature? |
| HTTP proxy | on private net | ? | ? | Internet access for slaves with only private network |
| DHCP service | on Internet and private net | nope | ? | no longer use of DHCP, contextualization for NIC IP addresses |
| Contextualization | not used | yes | ? | communicates IP addresses and SSH keys to VM |
| NTP service | on private net | ? | ? | time synchronization |
| MySQL aaS | shared setup | no | ? | Run your own on SSD |
| Medium and Small nodes | yes | no | ? | no more dedicated nodes for size, different size VMs can run on the same node, users can use even 0.25 cpu |
| Backups of accounting information | yes | ? | | in the new ON: log/DB of VM state changes |
| DNS server | yes | ? | ? | add dynamic DNS *vmname.project.cloudlet.sara.nl* entry |
| SSD nodes | yes | yes | ? | OS images will only run on SSDs |
| Image upload | sftp via virdir | yes | ? | upload or provide image path via opennebula interface |
| Image download | sftp via virdir | yes | #7  | not possible via opennebula
| Documentation platform | redmine | yes | ? | possible options: gollum, sphinx, redmine |
| Start a marketplace VM | no | yes | #3 | add to documentation |
| Start a local image VM | yes | yes | #4 | add to documentation |
| Sharing objects | yes | yes | ? | add to documentation |
| VM management options | yes | yes | ? | add to documentation |
| Assign project quota | yes | yes | ? | as projectadmin (advisor), as groupadmin (user)|
| Network Filters | yes | no | ? | add best pracices to documentation |
| Lightpaths | yes | ? | ? | connect HPC Cloud to external location |
| Resource usage page | redmine | yes | ? | display overall Cloud usage |
| Datablocks | yes | yes | ? | ceph block storage |
| Resize images | no | yes | ? | add to documentation |
| SURFsara app | yes | yes | ? | display system status on [user portal](https://portal.surfsara.nl) |
| XML-RPC API | yes | yes | ? | add to documentation |
| OCCI | short of | ? | ? | rocci server |
| Windows VMs | yes | yes | #6 | add to documentation |


