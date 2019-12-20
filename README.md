
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


docker-compose up --scale nginx=10 -d

docker-compose --compatibility up
