> :warning: **WARNING** under construction

1. download one or both tar files: 
  - one tar contains runnable class files, you need the Java Runtime Environment to execute
  - the other tar the sources, you need `javac` to compile
1. create a blank directory and extract the tar(s)
```
mkdir mandelbrot-rmi
cd mandelbrot-rmi
tar xvzf ../mandelbrot-bin-src.tgz # or mandelbrot-rmi-src.tgz
make # only if you build from source
```
1. launch the first server that will pose as the RMI registry
```
./startserver.sh first # arbitrary name argument
```
1. launch additional servers with different names
```
./startserver.sh banana
./startserver.sh coconut
```
1. launch a client on an X11 capable machine and pass it one or more server names
```
./startclient.sh first banana coconut
```
1. interact with the display:
  - left click will zoom in to the yellow rectangle
  - right click will zoom out
  - dragging will change the size of the rectangle
1. repeat with different number of server names for the client