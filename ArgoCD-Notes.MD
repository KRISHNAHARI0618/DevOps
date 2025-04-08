### ArgoCD Notes:
- Argo Workflows is an open source container-native workflow engine for orchestrating parallel jobs on Kubernetes. Argo Workflows is implemented as a Kubernetes CRD.

- Define workflows where each step in the workflow is a container.
- Model multi-step workflows as a sequence of tasks or capture the dependencies between tasks using a graph (DAG).
- Easily run compute intensive jobs for machine learning or data processing in a fraction of the time using Argo Workflows on Kubernetes.
- Run CI/CD pipelines natively on Kubernetes without configuring complex software development products.


- To start the Argoworkflow `minikube start -p argowf`
- Make argowf is default profile `minikube profile argowf`
- minikube profile list
- kubectl create namespace argo
- kubectl apply -f <.> -n argo

### What is GitOps 
- Infra as a Code Configuration Code
- Collobaration and change mechanism 
- Improved Security
- It will take git as a source of truth
- it is secured and simple 
- We can configure multple clusters 
- can connect multiple repos

### What is argocd
- ArgoCD is a Gitops Continuous Delivery Tool for Kubernetes
- It has controller which checks the repository every when and then it will apply the changes in k8s
- it is followed pull machanism
- GitHub Actions -> Unit Test The code --> Build The docker image push it in GCR --> Build the Helm Chart and push them to Repository --> connect that repositoty to argocd where it will pull the helmcharts and deploy it in K8s
- Easy roll Back
- More Security Grant Access to ArgoCD Only
- Disaster Recovery Solution 
- You can easily deploy the same apps to any Cluster

#### Application Source - Tools
- ArgoCD Supports The below Tools:
    - Helm charts
    - Kustomize
    - Directory of Yaml Files
    - Json Net

- Project 
    - Projects Provides Logical Grouping
    - Useful when ArgoCd is Used by multiple teams
    - allow only specific git repos 
- Sync 
    - Actual state == Desired State
- Components
    - ArgoCD Server(Api & web server )
        - its a gRPC/ Rest Server which exposes the api consume by the webui and cli
        - Application Management(create, update,delete)
        - Application operations (sync,rollback)
        - Repos and cluster management
        - AUthentication
    - Repo Server
        - An internal Servive which looks out the git repo every 3 minutes and gnerate the required helm diffs and deploy it in K8s Cluster
        - Clone Git Repo
        - Generate k8s Manifests
    - Application controller
        - Connects Repo server and K8s API to get the actual state == desirred state
        - Out of sync apps and take corrective actins
    - Dex : Identity Service to integrate with external identity providers
    - Redis : Used for caching
    - Application set controller
        - It automates the generation of ArgoCD Applications

### Installations
- kubectl create namespace argocd
- kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
- kubectl config set-contexts --current --namespace=argocd

#### Cli
- Using cli we can do anything we need
- brew install argocd

### ArgoCD Installation
- yaml files
- helm manifests
- web ui
- cli
- argocd app create --source <repo link > --destrination <cluster link>

### How to Deploy when deployment file is in another directory
- add a config called  ```directory: recursive: true ```