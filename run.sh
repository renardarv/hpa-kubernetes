#!/bin/bash

# before do this, do docker login first
# create container with docker and push to docker hub
docker build -t renardarv/landing-page:latest .
docker push renardarv/landing-page:latest

docker rmi renardarv/pesbuk:latest

# create ingress controller
kubectl apply -f ingress-controller/mandatory.yaml
kubectl apply -f ingress-controller/service-l7.yaml
kubectl apply -f ingress-controller/patch-configmap-l7.yaml

# create kube metric and monitoring tools
kubectl apply -f kube-metrics.yaml
kubectl apply -f promotheus.yaml
kubectl apply -f grafana.yaml

# deploy application in dev,stag, and prod
kubectl apply -f hpa-deployemnt-dev.yaml
kubectl apply -f hpa-deployment-stag.yaml
kubectl apply -f hpa-deployment-prod.yaml