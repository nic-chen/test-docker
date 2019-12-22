#docker 安装

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo



sudo yum install docker-ce      


sudo systemctl start docker
sudo systemctl enable docker


https://github.com/docker/compose/releases/download/1.25.1-rc1/docker-compose-Darwin-x86_64
cp /Users/meizu/Downloads/docker-compose-Darwin-x86_64 /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


#git 安装
yum install -y git

git clone git@github.com:nic-chen/docker-for-test.git

cd docker-for-test

docker-compose up --scale nginx=10 -d

docker-compose --compatibility up


#apisix 安装

wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm

sudo yum install yum-utils
sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo

sudo yum install -y etcd openresty curl git gcc luarocks lua-devel

sudo service etcd start


sudo luarocks install --lua-dir=/path/openresty/luajit apisix 0.9


sudo apisix start

#apisix 配置

curl http://127.0.0.1:9080/apisix/admin/routes/2 -X PUT -i -d '
{
    "uri": "/multi",
    "methods": ["GET"],
    "upstream": {
        "type": "roundrobin",
        "nodes": {
        "127.0.0.1:80001": 1,
        "127.0.0.1:80002": 1,
        "127.0.0.1:80003": 1,
        "127.0.0.1:80004": 1,
        "127.0.0.1:80005": 1,
        "127.0.0.1:80006": 1,
        "127.0.0.1:80007": 1,
        "127.0.0.1:80008": 1,
        "127.0.0.1:80009": 1,
        "127.0.0.1:80010": 1
        }
    }
}'

#nginx 配置

    upstream backend {
        server 127.0.0.1:9081;
        server 127.0.0.1:9082;
        server 127.0.0.1:9083;
    }

        location / {
            proxy_http_version 1.1;
            proxy_pass http://backend;
        }









