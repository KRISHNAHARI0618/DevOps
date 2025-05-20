AWS Elastic Container Service:
- Docker Issues: Auto Scaling and Auto Healing
Open Shift Kubernetes: Support service system for kubernetes
Kubernetes has the concept of  custom resource Definitions

ECR : Elastic Container Registry

Like Docker HUB
Service Provided By AWS Like Docker Hub To store the images

ECR Vs Docker hub

ECR : Elastic Container Registry ...
Docker Hub: Open Source image store Hub

Share the images to world over the aws account

Elastic Means:
  Highly Scalable
  Highly Available
  Highly Maintainable
  Hightly Securable
Diff Between Dockerhub and ECR:
Docker hub is :
  Free
  Public Repository
  Create Account
  Only authorized people can use images in private account
ECR: Ecr supports private repository concept
  Can store any number of images
  ECR is highly secure
  ECR is more reliable
  ECR is more Maintainable
  ECR is very good integration with EKS,S3...

ECR is more important:

ECS : Elastic Container Services
  1: Auto-Scaling
  2: Auto Healing
  3: Ip Address will Change
  4: Production Support
  5: Security
  6: Upgrades etc..
  7: Tasks
  8: Services
  9: Clusters

## EKS Set Up:
1. Elastic Kubernetes Services 
  1. AWS Management Services
  2. Containarization Services 
  3. Running and scaling is highly difficult when you are handling multiple clsuters
2. There are two ways of Set Up K8s Cluster 
  1. Manual Set Up of Kubernetes Api Server
  2. Auto Set Up cluster and nodes using terraform or eksctl or cloud formation

3. There are three types of Nodes set up
  1. Self managed Nodes
    1. We need to create Nodes 
    2. We need to set coreDNS , kubelet, copy kubeconfig , etc all cri cni etc..
    3. We need to run to connect nodes to cluster
  2. Managed Nodes
    1. AWS Will set everything automaticaly we just need to pass amiid , instance types , min and max and which cluster to connect
  3. Fargates
    1. Serverless VM's which can configure everything on its own [ pay as you go feature ]
4. Flow to create a EKS Cluster
  1. Download EKSCTL in local
  2. Configure AWS using aws configure commands
  3. Create Roles and Policies and assign users and groups to that roles
  4. Provisioning Nodes[Self managed Nodes,Managed Nodes,Fargates]
  5. Set up Storages
  6. Set Up Secrets and Key management Services
  7. Create VPC and Subnets with relevant CIDR Ranges
  8. Define Security Groups and NACL's
5. Creating Worker Nodes
  1. Select One [Self managed Nodes,Managed Nodes,Fargates]
  2. Select the instance Types
  3. Mention Min and Max Nodes
  4. EKS Cluster To connect 
6. How to Connect Cluster to LOcal 
  1. Using Kubeconfig we can set context to New Cluster
7. Commands Mostly Use
  1. eksctl create cluster
  2. kubectl config set-context
  
  




