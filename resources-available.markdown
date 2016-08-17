---
layout: default
---
# Resources available

## Compute nodes

The compute nodes are the physical machines where you can run Virtual Machines (VMs). 

* 32 HPC compute nodes, each node having:
  * 64 CPU cores (hyperthreading enabled)
  * 256 GB RAM
  * 3.2 TB local SSD disk
  * 2x 10 Gbit network connection per compute node

* 12 GPU compute nodes, each node having:
  * 32 CPU cores
  * 2 GPU's of type K2 GRID, accessible through PCI passthrough, enabling applications to get the performance boost of the direct access to a GPU card
  * 256 GB RAM
  * 800 GB local SSD disk
  * 2x 10 Gbit network connection per GPU node

* 1 High memory node, having:
  * 40 CPU cores
  * 2 TB RAM
  * 3.2 TB local SSD disk  
  * 2x 10 Gbit network connection

## Storage resources

* 900 TB Ceph distributed object storage with SSD caching
  * 2.7 PB total shared storage, used in x3 redundancy, which results in 900 TB net storage available
  * 10 Gbit network connection per storage node
  * Ceph storage is accessible as a block device within a VM
