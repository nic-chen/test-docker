
gcr.azk8s.cn
quay.azk8s.cn


docker build -f ./Dockerfile -t johz/openresty-md5  .

docker save -o openresty-md5.tar johz/openresty-md5:latest

docker push johz/openresty-md5

docker commit eafd9111ada6 johz/apisix


#upstream

kubectl apply -f openresty.yaml



#nginx-ingress

tar -xzvf nginx-ingress-controller.tar.gz
docker load -i nginx-ingress-controller.tar

tar -xzvf openresty-md5.tar.gz
docker load -i openresty-md5.tar

kubectl apply -f ./ingress/mandatory.yaml

kubectl apply -f ./ingress/service.yaml

kubectl apply -f ./ingress/rule.yaml




#kong

tar -xzvf kong.tar.gz
docker load -i kong.tar

tar -xzvf kong-ingress.tar.gz
docker load -i kong-ingress.tar

kubectl apply -f https://bit.ly/k4k8s



#指定节点

kubectl get nodes

kubectl label nodes iz8vb1zupwmyv4gmlliwb7z gateway=yy

kubectl label nodes iz8vb1zupwmyv4gmlliwb8z upstream=yy

kubectl get nodes --show-labels





#扩容
kubectl scale --replicas=4 deployment/nginx-ingress-controller -n ingress-nginx





kubeadm init --pod-network-cidr=10.224.0.0/16 --kubernetes-version=v1.16.0 --apiserver-advertise-address 192.168.0.129 --service-cidr=10.225.0.0/16



kubeadm join 192.168.0.129:6443 --token rmgkmt.1lx8h0mcutwll0zf \
    --discovery-token-ca-cert-hash sha256:05c27128e5f1275a642dcd3fd410250781746d1eccf53122d4d6e2ec8a8b77fa


rm -f /etc/kubernetes/manifests/kube-apiserver.yaml
rm -f /etc/kubernetes/manifests/kube-controller-manager.yaml
rm -f /etc/kubernetes/manifests/kube-scheduler.yaml
rm -f /etc/kubernetes/manifests/etcd.yaml
rm -rf /var/lib/etcd



rm -f /etc/kubernetes/kubelet.conf
rm -f /etc/kubernetes/pki/ca.crt

