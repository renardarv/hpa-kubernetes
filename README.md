# hpa-kubernetes

Steps:

- First create a Kubernetes cluster with AWS VPS
- Configure Kube config AWS with your terminal
- Create ACM to get the secure app with https
- Docker login to push container in docker hub
- Go run bash run.sh to deploy the application to run app in production

You can create dev and stag container with command: \
\
```docker build -t renardarv/landing-page-dev:latest .```\
\
OR \
\
```docker build -t renardarv/landing-page-stag:latest .```
