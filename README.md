# rhcos-debug-tools

So you're at the point where you want to run ethtool, perf, systemtap, tc or
tcpdump as root on RHCOS?

## Build rhcos-debug-tools

Find the kernel version of your RHCOS host:

```bash
VERSION=$(uname -r | sed -Ee 's/\.[^.]*$//')
```

Build the rhcos-debug-tools image on a subscribed RHEL 8 host:

```bash
./build.sh my-registry/rhcos-debug-tools:$VERSION
```

Important notice: the Red Hat end user license agreement does not permit you to
distribute Red Hat binaries publicly, so please don't.

## Run rhcos-debug-tools

As root on your RHCOS host:

```bash
VERSION=$(uname -r | sed -Ee 's/\.[^.]*$//')

podman run --cap-add=ALL --net=host --privileged --rm -it my-registry/rhcos-debug-tools:$VERSION
```
