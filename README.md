# devops-assessment

I created a simple golang rest api that operate CRUD to Mysql database. 
This app can be running with docker-compose, run as a native docker in a host, or inside a kubernetes cluster as a deployment.


### Option 1 - Run as Native Docker

To make this app run as a native docker with docker-compose, you just need docker engine installed and running.
Build this app with this command :

```docker-compose up --build```

With this docker-compose , it will run these tasks:
1. Build golang app docker image from dockerfile in the root project and run the image as a container
2. Download mysql docker image that has been availabe in the internet, and mount initial script (mysql-init/init.sql) so this script will be executed each time the mysql container boot up. this script will create a table if it is not exist
3. Create some variable for mysql credential
4. Run the configured mysql docker image as a container
5. Create a persistent volume for mysql datastore
5. Expose port 8000 to docker host


After docker-compose command shows that it's "ready for connection", mean the service is up and can be accessed at http://localhost:8000


### Option 2 - Run inside Kubernetes Cluster

To make this app run inside kubernetes cluster, below is the prerequisites:

- terminal is in the root directory of this project
- docker is installed and running
- minikube or kubernetes cluster is running
- kubectl has connected to the kubernetes cluster

Build this app in Kubernetes Cluster with the prepared script :

```sh deploy-to-kubernetes.sh```

This sript will run these tasks:
1. Install helm in your local
2. Deploy mysql stateful deployment helm chart (helm-charts/mysql) to the cluster 
3. Deploy golang app stateless deployment helm chart (helm-charts/tsquare-apis) to the cluster
4. Create a proxy to connect your local to the service at kubernetes, so the service can be accessed at http://localhost:8000

If you want to use Kubernetes Ingress you need to adjust the ingress yml at the helm chart and create a dns record for it and this is not covered in the script, because this need a real domain and its dns configuration.

Note : simple different things of the development (build) environment may create this script doesn't work or I missed some tasks that is not covered in the doc. So you can ask me at my email or whatsapp chat.

Thank you