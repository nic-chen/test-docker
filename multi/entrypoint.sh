#!/bin/base


etcd &

/usr/bin/apisix init && /usr/bin/apisix init_etcd && /usr/local/openresty/bin/openresty -p /usr/local/apisix -g