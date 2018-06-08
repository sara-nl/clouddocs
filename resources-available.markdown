---
layout: default
---
# Resources available

## Compute nodes

The compute nodes are the physical machines where you can run Virtual Machines (VMs).

* 21 HPC compute nodes, each node having:
  * 64 CPU cores
  * 256 GB RAM
  * 3.2 TB local SSD disk
  * 2x 10 Gbit network connection per compute node

* 10 HPC compute nodes, each node having:
  * 80 CPU cores
  * 512 GB RAM
  * 3.5 TB local SSD disk
  * 2x 10Gbit network connection per compute node

* 7 HPC compute nodes, each node having:
  * 80 CPU cores
  * 576 GB RAM
  * 3.0 TB local SSD disk
  * 2x 10Gbit network connection per compute node

* 12 GPU compute nodes, each node having:
  * 32 CPU cores
  * 4 GPU's of type NVidia K2 GRID, accessible through PCI passthrough, enabling applications to get the performance boost of the direct access to a GPU card
  * 256 GB RAM
  * 800 GB local SSD disk
  * 2x 10 Gbit network connection per GPU node

* 2 GPU compute nodes, each node having:
  * 16 CPU cores
  * 4 GPU's of type NVidia Tesla P100, accessible through PCI passthrough, enabling applications to get the performance boost of the direct access to a GPU card
  * 128 GB RAM
  * 800 GB local SSD disk
  * 2x 10 Gbit network connection per GPU node

<!---
* 1 High memory node, having:
  * 40 CPU cores
  * 2 TB RAM
  * 3.2 TB local SSD disk  
  * 2x 10 Gbit network connection
-->

## Storage resources

* 675 TB Ceph distributed object storage with SSD caching
  * used in x3 redundancy
  * 10 Gbit network connection per storage node
  * Ceph storage is accessible as a block device within a VM
