FROM openresty/openresty:alpine


COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

COPY default.conf /etc/nginx/conf.d/default.conf


EXPOSE 80

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]