# rhcos-debug-tools

So you're at the point where you want to run ethtool, iotop, perf, systemtap, tc
or tcpdump as root on RHCOS?

## Build rhcos-debug-tools

Find the kernel version of your RHCOS host:

```bash
VERSION=$(uname -r | sed -Ee 's/\.[^.]*$//')
```

Build the rhcos-debug-tools image on a subscribed RHEL 8 host:

```bash
./build.sh my-registry/rhcos-debug-tools $VERSION
```

This will build and push two images:
* my-registry/rhcos-debug-tools-base:$VERSION, which has all of the above minus
  the kernel debuginfo RPMs
* my-registry/rhcos-debug-tools-full:$VERSION, which includes the kernel
  debuginfo RPMs

Important notice: the Red Hat end user license agreement does not permit you to
distribute Red Hat binaries publicly, so please don't.

## Run rhcos-debug-tools

As root on your RHCOS host:

```bash
VERSION=$(uname -r | sed -Ee 's/\.[^.]*$//')

podman run --cap-add=ALL --net=host --privileged --rm -it my-registry/rhcos-debug-tools-base:$VERSION
```
