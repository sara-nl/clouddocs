---
layout: default
---

# UNESCO-IHE symposium 2017-03-30&31  <br/> Extras - The XML-RPC API

<div style="float:right;max-width:205px;" markdown="1">
![UNESCO-IHE logo](/images/Unesco-Ihe-logo.png)

![SURFsara logo](/images/SURFsara_logo.png)
</div>

This is an exercise from the [Extras](extras) part of the Tutorial [UNESCO-IHE symposium 2017-03-30&31](.).

In this advanced part of our HPC Cloud tutorial we ask you to play around with the **XML RPC** API.

### a) Setting up a VM for the exercise

Exercise: start a new VM (you are now in the advanced part; you should be able to do this on your own)

### b) Run a first example

This exercise should make you familiar with our general documentation pages. 

* On our general documentation, find the _Getting started with the XML-RPC_ page.

* Follow the instructions to prepare your Python environment with the Python bindings for the API, on the VM you prepared on the previous section.

* Run the first example from that documentation page. Make sure you are able to see the API version number as a result.

> **_Food for brain:_**
>
> * What version does the API reply with?

### c) Run a second example

* Run the example from the presentation that shows a list of your VMs.

> **_Food for brain:_**
>
> * Can you now modify the VM list to show **only** the running VMs?
> * Can you make a program that will shutdown all your VMs but leaving intact the one you are running the program from?

## <a name="xml_print"></a> Helping code
 
  * [Helper XmlUtil class](./code/xml_util.py)
