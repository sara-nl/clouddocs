---
layout: default
---
An example for the SURFcursus 5 Aug 2015.

The code was taken from [mandelbrot-rmi](https://code.google.com/p/mandelbrot-rmi/), a distributed Manderbrot renderer based on [Java RMI](https://en.wikipedia.org/wiki/Java_remote_method_invocation), with some small improvements.

> :warning: **WARNING** under construction

1. download one or both tar files: 
  - [mandelbrot-rmi-bin.tgz](../assets/mandelbrot-rmi-bin.tgz) contains runnable class files, you need the Java Runtime Environment to execute

```bash
curl -O http://hpccloud.docs.surfsaralabs.nl/assets/mandelbrot-rmi-bin.tgz
```

  - [mandelbrot-rmi-source.tgz](../assets/mandelbrot-rmi-source.tgz) contains the sources, you need `javac` to compile

```bash
curl -O http://hpccloud.docs.surfsaralabs.nl/assets/mandelbrot-rmi-source.tgz
```

1. create a blank directory and extract the tar(s)

```bash
mkdir mandelbrot-rmi
cd mandelbrot-rmi
tar xvzf ../mandelbrot-bin-src.tgz # or mandelbrot-rmi-src.tgz
make # only if you build from source
```

1. launch the first server that will pose as the RMI registry

```bash
./startserver.sh first # arbitrary name argument
```

1. launch additional servers with different names

```bash
./startserver.sh banana
./startserver.sh coconut
```

1. launch a client on an X11 capable machine and pass it one or more server names

```bash
./startclient.sh first banana coconut
```

1. interact with the display:
  - left click will zoom in to the yellow rectangle
  - right click will zoom out
  - dragging will change the size of the rectangle
1. repeat with different number of server names for the client

