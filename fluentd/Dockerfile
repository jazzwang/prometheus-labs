# Fluentd (td-agent version) for Debian 9 (Stretch)
#
# Reference:  
#    - http://docs.fluentd.org/articles/install-by-deb
#    - https://github.com/William-Yeh/docker-fluentd
#
# Also installed plugins:
#    - https://github.com/htgc/fluent-plugin-azurestorage
#    - https://github.com/fluent/fluent-plugin-kafka

# pull base image
FROM debian:9
MAINTAINER Jazz Wang <jazzwang.tw@gmail.com>

RUN echo "deb http://packages.treasuredata.com/3/debian/stretch/ stretch contrib" > /etc/apt/sources.list.d/td-agent.list && \
    apt-get update  && \
    apt-get install -y -q --allow-unauthenticated --no-install-recommends td-agent && \
    cp /etc/td-agent/td-agent.conf  /etc/td-agent/td-agent.conf.bak  && \
    td-agent-gem install \
        fluent-plugin-kafka \
        fluent-plugin-azurestorage \
        --no-rdoc --no-ri  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/td-agent"]
