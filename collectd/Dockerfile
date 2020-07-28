FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# change timezone from UTC to KST
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

#
RUN apt-get update

# collectd
RUN apt-get install -y --no-install-recommends collectd libmnl0

COPY ./entrypoint.sh /opt/entrypoint.sh

CMD /opt/entrypoint.sh