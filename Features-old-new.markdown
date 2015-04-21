## Feature table old/new

| Feature | Old | New | Issue | Comment | Beta blocker? | 
| ------- | --- | --- | ----- | ------- | ------------- |
| Wizard | yes | no | - (works) | Use marketplace. Do we have our own marketplace? Can we upload/download/update apps (images)? | Y |
| SARA marketplace | (~Wizard) | possible | ? | technically possible, needs maintenance | N |
| VirDir storage | yes | no | #5 | Run your own NFS server | Y |
| VirDir/Backup  | yes | no | #18  | (a) Roll your own, (b) new feature? | Y |
| HTTP proxy | on private net | ? | ? | Squid: internet access for slaves with only private network | N |
| DHCP service | on Internet and private net | nope | ? | no longer use of DHCP, contextualization for NIC IP addresses | N |
| Contextualization | not used | yes | #8 | communicates IP addresses and SSH keys to VM | Y |
| NTP service | on private net | ? | #9 | time synchronization | N |
| MySQL aaS | shared setup | no | ? | Run your own on SSD | N |
| Medium and Small nodes | yes | no | ? | no more dedicated nodes for size, different size VMs can run on the same node, users can use even 0.25 cpu | N |
| Backups of accounting information | yes | yes | #13 | in the new ON: log/DB of VM state changes | Y |
| DNS server | yes | yes | #14 | add dynamic DNS *vmname.project.cloudlet.sara.nl* entry | Y |
| SSD nodes | yes | yes | - (works) | OS images will only run on SSDs | Y |
| Image upload | sftp via virdir | yes | #12 | upload or provide image path via opennebula interface | Y |
| Image download | sftp via virdir | yes | #7  | not possible via opennebula | Y |
| Documentation platform | redmine | yes | #15 | possible options: gollum, sphinx, redmine | Y |
| Start a marketplace VM | no | yes | #3 | add to documentation | Y |
| Start a local image VM | yes | yes | #4 | add to documentation | Y |
| Sharing objects (images, VMs...) | yes | yes | ? | add to documentation | N |
| VM management options | yes | yes | #19  | add to documentation | Y |
| Create projects | yes | yes | #11 | project == OpenNebula group, quota allocation as projectadmin (advisor), as groupadmin (user) | Y |
| Standardise views for users | no | yes | #10 | Decide how we arrange PIP views, other users' views, what they can do from each view... | Y | 
| Network Filters | yes | yes | #23 | add best pracices to documentation | Y |
| Lightpaths | yes | ? | ? | connect HPC Cloud to external location | N |
| Resource usage page | redmine | yes | ? | display overall Cloud usage | N |
| Datablocks | yes | yes | #20 | ceph block storage | Y |
| Resize images | no | yes | ? | add to documentation | N |
| SURFsara app | yes | yes | ? | display system status on [user portal] (https://portal.surfsara.nl) | N |
| XML-RPC API | yes | yes | ? | add to documentation | N |
| OCCI | short of | ? | ? | rocci server | N |
| Windows VMs | yes | yes | #6 | add to documentation | N |
| MPI applications | yes | yes | ? | performance/scalability tests | N |
| High memory node | yes | ? | ? | installation, configuration | N |
| Resize data images| no | ? | ? | not needed in old cloud due to virdue |N |
| Remove non used options in sunstone| no |? | #21| remove options like non KVM options | N |
| use single read only CEPH image from multiple VM's | yes | ?| ? |  | N |
| Benchmark speed between VM's| yes | yes | #17 |QoS test |Y |
| Course tutorials | yes | yes | #22 | UVA/Unesco tutorial include all steps that a Cloud user requires. Repeat the practice to identify missing features | Y |
| Snapshots | no | yes | #16 | investigate snapshots for creating Open Nebula image backups | N |