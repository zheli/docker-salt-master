FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y software-properties-common dmidecode && \
    add-apt-repository -y ppa:saltstack/salt && \
    apt-get update && apt-get install -y salt-master=2015.5.3+ds-1trusty1 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 4505 4506

ADD run.sh /usr/local/bin/run.sh
ADD run_debug.sh /run_debug.sh
RUN chmod +x /usr/local/bin/run.sh
RUN chmod +x /run_debug.sh

VOLUME ["/etc/salt/pki", "/var/cache/salt", "/var/logs/salt", "/etc/salt/master.d", "/srv/salt", "/srv/pillar"]

CMD "/usr/local/bin/run.sh"
