FROM registry.redhat.io/ubi8/ubi
ARG VERSION
RUN yum --setopt=tsflags=nodocs -y upgrade \
  && yum --setopt=tsflags=nodocs -y install \
    ethtool \
    iotop \
    iproute-tc \
    kernel-core-$VERSION \
    kernel-devel-$VERSION \
    less \
    perf \
    strace \
    systemtap \
    tcpdump \
  && yum clean all
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
