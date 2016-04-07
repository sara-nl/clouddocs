# OpenNebula's XML-RPC API

> **NOTE:**
>
> We are still actively working on this documentation page, along with the opening of the API. The `endpoint` is **not** yet accessible. In general terms, though, this documentation should help you start preparing and giving you an idea of how to get started.

## Endpoint and bindings

OpenNebula offers an XML-RPC API. We have it available at:

>
TODOcument: find endpoint out

That URL is called the `endpoint`. At the server side, this `endpoint` allows you to operate with your UI's username and password as if you were operating on the UI itself. The beauty of having an API is that you can build programs that can handle interactions for you (think, for example, of shutting VMs down automatically once your computation is finished, so that you do not consume your quota).

And you can also get some extra information in formats that you can process. For example, you can look at your accounting status and, therefore, know how much of your CPU quota you have left.

In principle, you can "talk" directly to the XML-RPC `endpoint` just by sending http POST commands and reading the information back from the http responses. However, that can become rather tedious very quickly, because all communication must take place via XML, so most of your code will need to be fro creating, sending, receiving and extracting XML. Therefore, OpenNebula provides language bindings that can hide all this complexity from the programmer. They make using the API a more intuitive experience. They offer the following bindings:

* [Ruby](http://docs.opennebula.org/4.14/integration/system_interfaces/ruby.html)
* [Java](http://docs.opennebula.org/4.14/integration/system_interfaces/java.html) 

The community has created bindings for other languages, like:

* [Python](https://github.com/python-oca/python-oca)

>**NOTE:**
>
>If you want to look at the plain XML-RPC documentation, it is [available here](http://docs.opennebula.org/4.14/integration/system_interfaces/api.html)

## Python bindings

>**NOTE:**
>
>We chose to use Python bindings because we have received many questions already about this language. We will be happy to include information about your favourite binding if you help us. 

### Setting up the environment

>**NOTE:**
>
>We find _conda_ and _pip_ very useful, so that is why we recommend them here. We will be showing the installation steps for MacOS, but it should be analogous for Linux. Check for detailed instructions [here](http://conda.pydata.org/miniconda.html)

#### Setting up _conda_

The following commands will:
1. create a directory to install your Python environment there with _conda_
2. download the _conda_ installer
3. run the _conda_ installer to install _conda_ in the desired directory

Run in a terminal:

```sh
mkdir ~/conda && cd ~/conda
wget https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh
bash Miniconda-latest-MacOSX-x86_64.sh
```

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
pip install git+https://github.com/python-oca/python-oca.git@master
```

You can now verify the packages that you have available in the current environment by running:

```sh
conda list
```

That should return something like:

>```sh
# packages in environment at ~/conda/envs/one_api_env:
#
oca                       4.15.0a1                  <pip>
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
> See that you have package `oca` available. These are they Python bindings for OpenNebula that you downloaded from GitHub in the previous commands.

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

    ONE_ENDPOINT = 'http://localhost:8633/RPC2'
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

Pay attention to filling your username and password in the file! Save the file. Now, let's run it:

```sh
python ~/workspace/my_project/version_check.py
```

It should print something like:

>```sh
4.14.2
```