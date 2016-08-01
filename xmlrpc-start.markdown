---
layout: default
---

# OpenNebula's XML-RPC API

## Introduction: endpoint and bindings

OpenNebula offers an XML-RPC API, which you can use mainly for automating tasks related to handling VMs and get information out of the HPC Cloud environment. The XML-RPC API is accessible via the following URL: 

```
https://api.hpccloud.surfsara.nl
```

That URL is called the `endpoint`. At the server side, this `endpoint` allows you to operate with your UI's username and password as if you were operating on the UI itself. The beauty of having an API is that you can build programs that can handle interactions for you (think, for example, of shutting VMs down automatically once your computation is finished, so that you do not consume your quota).

And you can also get some extra information in formats that you can process. For example, you can look at your accounting status and, therefore, know how much of your CPU quota you have left.

In principle, you can "talk" directly to the XML-RPC `endpoint` just by sending HTTP POST requests and reading the information back from the HTTP responses. However, that can become rather tedious very quickly, because all communication must take place via XML, so most of your code should then need to be for creating, sending, receiving and extracting XML.

>**NOTE:**
>
>If you want to look at the plain XML-RPC documentation, it is [available here](http://docs.opennebula.org/4.14/integration/system_interfaces/api.html)

In order to hide all this XML-processing tediousness from the programmer, OpenNebula provide some bindings for programming languages. They make using the API a more intuitive experience. They offer bindings for the following languages:

* [Ruby](http://docs.opennebula.org/4.14/integration/system_interfaces/ruby.html)
* [Java](http://docs.opennebula.org/4.14/integration/system_interfaces/java.html)

The community has created bindings for other languages, like:

* [Python](https://github.com/python-oca/python-oca)

## Python bindings

>**NOTE:**
>
>We chose to use Python bindings because we have received many questions already about this language. We will be happy to include information about your favourite binding if you help us.

### Setting up the environment

>**NOTE:**
>
>We find _conda_ and _pip_ very useful, so that is why we recommend them here. Check for detailed instructions [here](http://conda.pydata.org/miniconda.html)

#### Setting up _conda_

The following commands will:

1. create a directory to install your Python environment there with _conda_
2. download the _conda_ installer
3. run the _conda_ installer to install _conda_ in the desired directory

Run in a terminal of an HPC Cloud VM:

```sh
mkdir ~/conda && cd ~/conda
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh
```

You may have to close and re-open your terminal for changes to take effect. Or you may go ahead in a new terminal.

#### Preparing a _conda_ environment

_Conda_ allows you to keep different environments, which are collections of libraries that you can use at once, so that different projects can use different libraries or versions.

The following commands will:

1. create an environment for your OpenNebula API project(s)
2. set your current terminal to use the newly created environment
3. install some basic dependencies in that environment
4. download and install the OpenNebula API Python bindings in that environment

Run in a terminal:

```sh
conda create --name one_api_env python=2.7
source activate one_api_env
conda install pip
pip install oca
```

You can now verify the packages that you have available in the current environment by running:

```sh
conda list
```

That should return something like:

>```sh
# packages in environment at ~/conda/envs/one_api_env:
#
oca                       4.10.0                    <pip>
openssl                   1.0.2f                        0
pip                       8.0.2                    py27_0
python                    2.7.11                        0
readline                  6.2                           2
setuptools                20.1.1                   py27_0
sqlite                    3.9.2                         0
tk                        8.5.18                        0
wheel                     0.29.0                   py27_0
zlib                      1.2.8                         0
```
>
> See that you have package `oca` available. These are the Python bindings for OpenNebula that you downloaded from GitHub with the previous commands.

### Running a first program

We will now use the Python bindings to send a simple request to the HPC Cloud `endpoint` that will tell you the version of OpenNebula that we have installed.

The following commands will:

1. create a directory that will act as our "project"
2. create a new file with a very basic first use of the API

Run in a terminal:

```sh
mkdir -p ~/workspace/my_project
touch ~/workspace/my_project/version_check.py
```

Open now the `~/workspace/my_project/version_check.py` file in your favourite editor. Copy and paste the following contents in it:

```python
import oca                          # this imports the OpenNebula API bindings


class VersionCheck():
    """A simple OpenNebula API test class"""

    ONE_ENDPOINT = 'https://api.hpccloud.surfsara.nl'
    ONE_USER = 'UI_username'          # replace this with your HPC Cloud UI username
    ONE_PASSWORD = 'UI_password'      # replace this with your HPC Cloud UI password

    def __init__(self):
        self.client = oca.Client(self.ONE_USER + ':' + self.ONE_PASSWORD, self.ONE_ENDPOINT)

    def ask_version(self):
        return self.client.version()

if __name__ == '__main__':
    found_version = VersionCheck().ask_version()
    print(found_version)
```

>**NOTE:**
>
>Pay attention to filling your username and password in the file! Save the file.

Now, let's run it:

```sh
python ~/workspace/my_project/version_check.py
```

It should print something like:

>```sh
4.14.2
```

## API explanation

OpenNebula's XML-RPC API is best described as a collection of _actions_ that you can invoke to query, create, modify and delete the different kinds of (let us call them) _objects_ that OpenNebula knows. In this sense, an _object_ can be a VM or an `image` (for example), and examples of _actions_ can be `create a new image` or `tell me which VMs I am running`. The XML-RPC documentation tells you which of these _actions_ (which they call _methods_) are available. The documentation describes, per _method_:

* what is the _method_'s name
* which parameters the _method_ accepts
* what the _method_ returns

### _Method_ names
In general terms, _method_ names for actions than can take effect directly on objects, have the form `one.<object>.<action>`. The `<object>` part is rather intuitive (e.g.: `vm` for actions on VMs, `image` for images...), and if you want to look for what different `<action>` options are available for a given type of object, they are shown grouped on the documentation. For example, if you want to change the name of a VM you can use method `one.vm.rename`, and if you want to create a new VM you can use method `one.vm.allocate`. 

If you want to query about several items of certain type of object (e.g.: tell me my VMs), you usually find an accompanying _pool_, in the form `<object>pool` that you can query. For example, to list all your VMs, you can use method `one.vmpool.info`.

### _Method_ parameters

Each _method_ requires a certain set of parameters. The parameters are positional, so if you see that a method is described as required 2 arguments, the order in which the parameters are described is the order in which you should provide your arguments as well. Each _method_ and its parameters have a different meaning, although, in general terms, you can expect that:

* _methods_ that create objects require (among others) an input parameter describing what the object should be like (e.g.: for a VM, you need to provide a string representing the `template` for that VM; that is precisely what _method_ `one.vm.allocate` requires as a second argument)
* _methods_ that modify or delete objects and _methods_ that query about a single object require (among others) an input parameter with the ID of the object you want to work on (e.g.: to rename a VM, that is precisely what _methods_ `one.vm.rename`, `one.vm.delete` and `one.vm.info` require as their second argument)
* _methods_ that query about a list of objects usually require (among others) some input parameters that allow you to filter the queried objects (e.g.: to query about the list of VMs you have, _method_ `one.vmpool.info` takes as 2nd parameter a number indicating whether you want to see your group's VM or only your VMs; the 3rd and 4th parameters allow you to paginate results; the 5th parameter allows you to show only VMs in a given state)

### _Method_ output

Normally, results are received as a 3-tuple where:

* the first element tells whether the request was successful or not
* the second element contains the returned information when the request was successful, or otherwise the error message if the call returned an error
* the third element is a numeric error code

