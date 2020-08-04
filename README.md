# ku_exper

alias k="kubectl"

kind delete cluster --name kind-multi

```shell script
kind create cluster --name kind-multi --config kind/config.yaml
```

```shell script
docker build -t myapi:v1 . 
```

Dockerイメージをクラスタにロードする。
```shell script
kind load docker-image myapi:v1 --name kind-multi
```

istio
```shell script
curl -L https://istio.io/downloadIstio | sh -

export PATH="$PATH:/mnt/v/projects/ku_exper/istio-1.6.5/bin"
istioctl manifest apply --set profile=demo
```

myapiをデプロイ
```shell script
kubectl label namespace default istio-injection=enabled
kubectl get ns --show-labels

kubectl apply -f kind/manifest/myapi.yaml
```

```
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml

kubectl apply -f kind/l2_config.yaml

kubectl apply -f kind/sample_app.yaml

kubectl apply -f kind/sample_php.yaml


```

istio関連のリソースをデプロイ
```shell script
kubectl apply -f kind/manifest//istio.yaml
```

Dockerイメージ作り直したあとpod再起動
```
docker build -t myapi:v1 . 
kind load docker-image myapi:v1 --name kind-multi

kubectl -n default rollout restart deployment 
```


kubectl exec -it myapi-v1-57b484d688-m7k9b -- /bin/sh



https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/


```shell script
 kind delete cluster --name kind-multi
```


k get pod -A

kubectl port-forward -n istio-system  istio-ingressgateway-7fcd6df8f9-vbdjr 80:80 --address 0.0.0.0

