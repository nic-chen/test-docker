
/usr/bin/etcd --listen-client-urls 'http://0.0.0.0:2379' &

/usr/bin/apisix init && /usr/bin/apisix init_etcd && /usr/local/openresty/bin/openresty -p /usr/local/apisix -g