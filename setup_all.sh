#!/bin/sh

alias k="kubectl"
kind delete cluster --name kind-multi

kind create cluster --name kind-multi --config kind/config.yaml

# docker build -t myapi:v1 . 

kind load docker-image myapi:v1 --name kind-multi

curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:/mnt/v/projects/ku_exper/istio-1.6.5/bin"
istioctl manifest apply --set profile=demo

kubectl label namespace default istio-injection=enabled
kubectl get ns --show-labels
kubectl apply -f kind/manifest/myapi.yaml

kubectl apply -f kind/manifest//istio.yaml

