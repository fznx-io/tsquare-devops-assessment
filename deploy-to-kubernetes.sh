# Prerequisites:
# cd to the root directory of this project
# docker is installed and running
# minikube or kubernetes cluster is running
# kubectl has connected to the kubernetes cluster

# Install Helm Client
sudo wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
sudo tar helm-v3.4.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm

# Install Mysql Stateful Deployment
helm install tsquare-db helm-charts/mysql

# Install Golang Application Stateless Deployment
helm install tsquare-apis helm-charts/tsquare-apis

# Create proxy to access the service
kubectl port-forward svc/tsquare-apis 8000