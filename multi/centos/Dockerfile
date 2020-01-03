FROM centos:7

ARG APISIX_VERSION=0.8
LABEL apisix_version="${APISIX_VERSION}"

RUN yum -y install yum-utils\
    && yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo \
    && yum install -y openresty \
    && yum install -y https://github.com/iresty/apisix/releases/download/v$APISIX_VERSION/apisix-$APISIX_VERSION-0.el7.noarch.rpm \
    && yum install -y etcd \
    && yum clean all

WORKDIR /usr/local/apisix

RUN echo "#!/bin/bash" > /usr/local/apisix/docker-entrypoint.sh \
    && echo "" >> /usr/local/apisix/docker-entrypoint.sh \
    && echo "/usr/bin/etcd --advertise-client-urls http://0.0.0.0:2379 --listen-client-urls http://0.0.0.0:2379 &" >> /usr/local/apisix/docker-entrypoint.sh \
    && echo "/usr/bin/apisix init && /usr/bin/apisix init_etcd && /usr/local/openresty/bin/openresty -p /usr/local/apisix -g 'daemon off;'" >> /usr/local/apisix/docker-entrypoint.sh \
    && chmod 777 /usr/local/apisix/docker-entrypoint.sh


EXPOSE 9080


CMD ["sh", "/usr/local/apisix/docker-entrypoint.sh"]

