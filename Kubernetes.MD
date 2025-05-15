# Introduction:
*Kubernetes is easy*
- Kubernetes is the future of DevOps
- People are moving towards Microservices

* Docker Vs Kubernetes *
- [Kuberenetes 100 Questions](https://medium.com/@jaya.surya8068/top-100-kubernetes-interview-questions-and-answer-5adb4c427b17)
- [Kubernetes SetUp Using KubeADM](https://github.com/piyushsachdeva/CKA-2024)
- [Deployment Apps Using Python Terraform K8s AWS](https://thelearningjourney.co/automating-the-cloud-the-evolution-of-a-python-app-with-docker-kubernetes-and-terraform/)
- [Github Repo For Deployment](https://github.com/bobocuillere/DevOpsProject-FintechAPP-AWS-Terraform)
  
## Docker:

- Container Platform where it supports the building the containers
- Does not support AutoScaling
- Does not support AutoUpgrades
- Single Host
- Enterprise Level Management

## Containers

- Containers are ephemeral in nature
- Short lived containers can die and revive anytime
- Containers will die if it does not get enough resources
- Container will die if it does not support the building the image
- Docker will have only one host divided the resources into multiple
- Containers are getting effected due to lack of resource allocation between containers

## 1

*Lets take some one has killed container then to application inside will not work so we need the feature called Auto-Healing Capacity*
## 2

*Lets take we are using the application at festival times or occasion time everyone will use that for offers at that time fixed container will not support that much traffic so we need auto scaling which docker does not support*
## 3 - `*Lets take we are using production systems enterprise level building need more*`

- ELB:  Load Balancers
- Firewalls
- All above features

## Disadvantages of Docker:

- AutoHealing Does not support
- AutoScaling Does not support
- it is single host
- Enterprise Support does not Provide
- if the Docker server is Crashed not able to access the application
- More Traffic Does not support
- Balancing Load Does Not Support
- What about Configs and secrets Management

## Kubernetes :

`Which files is used to configure the kubernetes`
  1. KubeConfig files is used to configure access to clusters and its resources
  2. commands to execute
     1. kubectl config view
     2. kubectl set-context --cluster="clustername" --namespace="namespace"
     3. kubectl get-context 
     4. kubectl use context
  3. kubeconfig file has all data related to 
     1. users, contexts,clusters
     2. for users which resources/clusters has access and what access he has
     3. clusters --> cluster details and its token etcc..
     4. contexts details 
```
  kubectl config --kubeconfig=config-demo set-cluster development --server=https://1.2.3.4 --certificate-authority=fake-ca-file
  kubectl config --kubeconfig=config-demo set-cluster test --server=https://5.6.7.8 --insecure-skip-tls-verify
```

### Kuberneets Advantages :

- Container Orchestration Platform
- kubernetes Supports AutoScaling > Create more Containers *Using Replica Sets*
- Kubernetes supports AutoHealing > Auto restart,reboot.etc.. *Using Controllers and Probes*
- Single Host issue will Solve -- By Default Kubernetes is a Cluster `[- Master and Worker Architecture]`
- Enterprise level Standards
- Stores Secret as 64d encoded format | `echo "string" | base64`
- If the container is affected by another container it will be moved to another node so that the application cannot get affected.
  
## Enterprise Level Standard :

- Advanced Load Balancing support *Using Service and End Points*
- Advanced Security Support *Using Network Policies , Ingress Controllers , RBAC..*
- Service Discovery *Using Service ,Ingress,LoadBalancing,ClusterIP,NodePort etc..*
- Supports storage orchestration *Using Storage Class, Persistent Volume and Persistent Volume Claims*
- Designed For extensibility Using *Custom Resource Definitions*
- Batch Execution *Using K8s Jobs or Cron Jobs*
- Automated RollOuts and Roll Backs *Using Rolling Updates and Deployment Stratagies*

## Kubernetes Secrets Management:
  
- Stored in Secrets 
- It will store all the secrets in one place either s3 Bucket or ETCd
- Secret are passed to pod as environment variable

### Kubernetes Architecture :

- Docker Simplest Thing is Container
- Kubernetes Simplest Thing is Pod

- To run any Container we need run time environment
  - Docker CRI: Docker Shim/Runc
  - K8s CRI: Containerd - crictl  
  - Kubelet: Responsible for running the pod/application
  - Kubeproxy: responsible for networking

- *Kubernetes Architecture:*
  - Managing the Hosted Applications in the form of Containers in Worker Nodes
  - We look At An analogy of Ships and Containers

- *Components:*
  - Control Node, Worker Node
  - Control Nodes: Manage the Applications
  - Worker Nodes: Host The Applications as Containers

## Master Node(Control Plane):

**`1: Kube Api Server:`**
  
  - The Server which is responsible for all the activities in the k8s Cluster is called Kube Api Server
  - The Kubernetes API server validates and configures data for the api objects which include pods, services, replication controllers, and others.
  - The API Server services REST operations and provides the frontend to the cluster's shared state through which all other components interact

**`2: Controller Managers:`**

  - Which Controls and Manages the Nodes Based on State of Nodes and Controllers
  - The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes.
  - a control loop is a non-terminating loop that regulates the state of the system
  - It represents the state of Applications
    - a: Replication Controllers
    - b: Pod Controller
    - c: API Controller
    - d: Daemon-Set Controller
    - 
**`3: ETCD:`**

  - Which stored all information about activities going on Nodes and Control Planes in a Key Value Pairs
  
**`4: Kube-Scheduler:`**

  - A component which is responsible for Scheduling the pods/Services based on the availability of node status , Taints and Tolerations node affinity etc..

## Worker Nodes: (Data Plane)

- 1: Kubelet: A component which is responsible of collecting and Sharing and managing all the information about nodes and containers in the cluster
  
- 2: Kube-Proxy: a component which enables the communication between each container in the Cluster
  
- 3: Container Run time: A component which is responsible for Running the Containers

## Kubernetes Objects

```Kubernetes objects are persistent entities in the Kubernetes system. They represent the state of your cluster.```

## Verification of User Access to Clusters:

### Client Side:

  - 1. Validation: Checks the syntax and structure of the configuration.
  - 2. Format checking: Ensures the configuration follows the correct format.
  - 3. Misconfiguration Detection: Identifies any misconfigurations in REST API calls.
  - 4. Authentication Data: Passes authentication data saved in the configuration file.

### Server Side:

  - 1. Authorization: Determines whether the user has permissions to perform the requested action.
  - 2. Authentication: Validates the user's identity.

### Server Side Field Verification:

  - 1. Strict: Enforces strict validation rules and rejects invalid requests.
  - 2. Warn: Issues warnings for invalid requests but allows them to proceed.
  - 3. Ignore: Ignores invalid requests without issuing warnings or rejecting them.

## Docker Swarm vs Kubernetes

- Kubernetes:
  - Better networking support.
  - Container orchestration system managing multiple containers.
  - Built-in support for stateful applications.

- Docker Swarm:
  - Minimal networking support.
  - Cluster manager for Docker containers.

## Kubernetes Production Systems:

### Kubernetes Distributions:

- Provide support for Kubernetes clusters.
- Popular systems include:
  - Kubernetes Cluster
  - OpenShift
  - Rancher
  - VMWars Tanzu
  - EKS
  - AKS
  - GKE.

### How DevOps Engineers Manage 100s of Clusters?

- Tools like:
  - Kops
  - Kubeadm
  - Lens

### Container Images:

  - A container image encapsulates an application and all its dependencies.
  - Images are executable software bundles and can run standalone.
  - They make well-defined assumptions about their runtime.
  - `kubelet` downloads and fetches images from the registry.
  - To ensure using the same version of an image, replace `<image:tag>` with `<image@digest>`.

### Types of Patterns/Multi-Containers Pods in K8s:

### Sidecar Pattern/Container:

- Useful for:
  - Logging utilities
  - Sync services
  - Watchers
  - Monitoring agents

### Application Containers:

- Main application containers.

### Init Containers:

- Starts to set up the configuration files, downloading data, etc.

### Helper Containers:

- Used for:
  - Data migrations
  - Backups
  - Maintenance activities

### Builder Containers:

- Used for building and packaging applications.

### Proxy Containers:

- Act as intermediaries between containers and external services.

### Ephemeral Containers:

- Used when utilities like curl are not available.
- Needed for interacting with the main application for debugging purposes.

### Adapter Containers:

- Take an input, change the output, and provide it in another format.

## Images Related Concepts:

### ImagePullPolicy:

- Default imagePullPolicy is set as #ifNotPresent
- `IfNotPresent`: Pull the image only if it is not already present locally.
  - Set the image field as `image@digest == #imgae:IfnotPresent`.
- `Always`: Always pull the latest version of the image.
  - Set the image field as `image:latest == #image:always` or just `image:latest`.
- `Never`: Never pull the image, even if it is not present locally.
  - Set the image field as `image:nothing == ifnotPresent`.

### ImagePullBackOff

- When the kubelet starts creating a container for a pod using the container runtime, the container enters a waiting state due to ImagePullBackOff.
- Kubernetes could not pull the images due to several reasons:
  - Invalid image name.
  - Pulling the image from a private registry without pull secrets.
- The "backoff" part indicates that Kubernetes will try to pull the image with an increasing backoff delay, typically 5 minutes (implied in limit).

### Serial and Parallel Image Pulls

- Each pod will pull images in serial order.
- Each node can pull images in parallel order.
- In kubelet configuration, set `serializeImagePulls` to false to allow parallel image pulls.

### Kubernetes Namespaces

- Kubernetes has namespace-level and non-namespace-level isolation.
- Namespaces are isolated project spaces in Kubernetes.
- Namespaces provide a mechanism for isolating groups of resources within a single cluster.
- Names of resources need to be unique within a namespace, but not across namespaces.
- Namespace-based scoping is applicable only for namespaced objects (e.g., Deployments, Services, Pods, etc.) and not for cluster-wide objects (e.g., StorageClass, Nodes, PersistentVolumes, etc.).

## Kubernetes Pods

### What are Pods:

  - A Pod (as in a pod of whales or pea pod) is a group of one or more containers, with shared storage and network resources, and a specification for how to run the containers.
  - Pod is basically a wrapper like YAML file with all commands needed to run the container.
  - Pod is the smallest deployable unit which contains one or more container specifications.
  - Pod can share both network and storage with multiple containers.

### Components of a Pod:
- Namespace
- Image names and Container specification

### Pod Template
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: example-pod
    labels:
      app: example
  spec:
    containers:
      - name: my-container
        image: redis
        ports:
        - containerPorts: 80
  ```
### Reasons for Pod Termination:

1. The pod object has been deleted.
2. The pod is evicted due to lack of resources or the node fails.

### Pod Configurations:

- Pods in Kubernetes can be configured in two main ways:
  - Pods with a single container.
  - Pods with multiple containers.

### Init Containers:

Init containers are containers that start before the actual containers are started.
- Init containers always run to completion.
- Each init container must complete successfully before the next one starts.

### Pod LifeCycle:

- **Pending:** Pod has been accepted by the Kubernetes system but has not yet been scheduled to a node.
  - **Reasons For Pending**
    - reason: "Insufficient Resources"
      - description: "The node(s) don't have enough CPU or memory to schedule the pod."
      solution: 
        - "Check resource requests/limits in pod spec."
        - "Use 'kubectl describe pod <name>' for detailed events."
        - "Scale the cluster or reduce resource demands."

    - reason: "No Matching Node Selector"
      - description: "The pod's nodeSelector or node affinity rules do not match any available node."
      solution:
        - "Verify node labels with 'kubectl get nodes --show-labels'."
        - "Check nodeAffinity and nodeSelector in the pod spec."

    - reason: "Unsatisfiable Tolerations and Taints"
      - description: "The pod doesn’t tolerate the taints applied to nodes."
      solution:
        - "Review tolerations in the pod spec and taints on nodes."
        - "Use 'kubectl describe node <name>' to inspect taints."

    - reason: "PersistentVolumeClaim (PVC) Pending"
      - description: "The pod is waiting for a PersistentVolume to be bound to its PVC."
      solution:
        - "Check PVC status with 'kubectl get pvc'."
        - "Ensure a matching PV is available and in the right StorageClass."

    - reason: "Image Pull Backoff (rare in Pending)"
      - description: "The image specified in the pod can’t be pulled (though often shows in 'ContainerCreating' or 'ImagePullBackOff')."
      solution:
        - "Check image name and credentials."
        - "Use 'kubectl describe pod' and inspect events."

    - reason: "Waiting for Scheduler"
      - description: "Scheduler has not yet assigned the pod to a node (rare and transient)."
      solution:
        - "Usually resolves quickly."
        - "If not, check scheduler logs or misconfigurations."

    - reason: "API Server Admission Denied"
      - description: "An admission controller or policy (like OPA/Gatekeeper) blocked the pod creation."
      solution:
        - "Check pod events for 'Forbidden' or 'Denied' messages."
        - "Review cluster policies and constraints."

- **Running:** Pod has been bound to a node, and all its containers have been created and started.
- **Succeeded:** All containers in the pod have terminated successfully.
- **Failed:** All containers in the pod have terminated, and at least one container has terminated in failure.
- **Unknown:** The state of the pod cannot be determined.

### Container States:

- **Waiting:** Container is waiting for some event to occur.
- **Running:** Container is executing.
- **Terminated:** Container has terminated, either in success or failure.

### How Pod Handles problems with Containers:

- **Initial crash** : Kubernetes attempts an immediate restart based on the Pod restartPolicy.
- **Repeated crashes**: After the initial crash Kubernetes applies an exponential backoff delay for subsequent restarts, described in restartPolicy. This prevents rapid, repeated restart attempts from overloading the system.
- **CrashLoopBackOff state**: This indicates that the backoff delay mechanism is currently in effect for a given container that is in a crash loop, failing and restarting repeatedly.
- **Backoff reset**: If a container runs successfully for a certain duration (e.g., 10 minutes), Kubernetes resets the backoff delay, treating any new crash as the first one.

### How Crash Loop Backoff will Occur:

- Application Error
- Configuration Error
- Resource Constraints
- Health Checks 
- Container Liveness and Readiness Probes

### To investigate the CrashLoopBackOff

- Check Logs: `kubectl logs <pod-name>`
- Inspect the events `kubectl describe pod <pod-name>`
- Review Configuration
- Check resource Limits
- Debug Applications

### Container Restart Policy:

- Restart Policy
  - always
  - OnFailure
  - Never

### Pod Conditions:

- **PodScheduled:** Pod has been scheduled to a node.
- **PodreadyToStartContainers:** Pod is ready to start containers.
- **ContainersReady:** All containers in the pod are ready.
- **Initialized:** Initialization of the pod has completed.
- **Ready:** Pod is ready to serve requests.

### Probes in Kubernetes (HealthChecks):

- **readiness probe:** Indicates whether the container is ready to serve requests.
```
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 10
  ```

- **liveness probe:** Checks if the container is working properly; if not, it will be restarted when required.
```
livenessProbe:
  httpGet:
    path: /healtz
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 120
```

### 3 Types of HealthChecks:

  - 1. **httpGet:** Should return a successful HTTP response.
  - 2. **tcpSocket:** Port connectivity should be successful.
  - 3. **exec:** Executes a specified command inside the container; should return an exit value of 0.
  - 4. **grpc:** Performs a remote procedure call using gRPC.

### Readinees probe and Liveness Probe yaml file

```
apiVersion: v1
kind: Pod
metadata:
  name: goproxy
  labels:
    app: goproxy
spec:
  containers:
  - name: goproxy
    image: registry.k8s.io/goproxy:0.1
    ports:
    - containerPort: 8080
    readinessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 10
    livenessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 10
```

## Why Pod YAML Files are Needed:

- To bring the Declarative Capabilities for the docker commands.
- Yaml > Pod Deployment > Example
- Pod is a single or group of containers.

## What is `kubectl`:

- It is a command-line tool to run or operate containers to run or manage like the docker CLI.

## Kubernetes Deployments:

### Deployment vs ReplicaSet vs Pod vs Container

- **Containers:** Docker; lightweight in nature for running the application with all application-related packages and dependencies along with minimal OS usage.

- **ReplicaSets:** Maintains the desired number of pods/run the containers inside the pod for high availability.

- **Deployments:** Developed to update anything in the pods, including configuration files, by developing a Deployment set manifest file.

## In Kubernetes Environment:

- **Master/Cluster:**
  - After Successful Minikube Installation, check the Files are there or not (`ls -l > kubeconfig, kubeconfig_ip`).
  - Then create a .kube directory (`mkdir .kube`), and copy kubeconfig as config to the .kube directory.

- **Worker Node(WorkStation):**
  - Checking The log files for Installation: `tail -f /var/log/cloudinitoutput.log`.
  - Install `kubectl` in Worker Node, create `.kube` directory (`mkdir .kube`), then add authentication to the `.kube` config file.

## Everything in Kubernetes is Resources:

- Create a Resource within the Workstation.

## Commands for Namespaces:

- `kubectl get pods`
- `kubectl create -f <namespacefilename>`: When the resource does not exist, this will create the namespace.
- `kubectl apply -f <namespacefilename>`: When resources do not exist, this will create the resource and if exists, it will update the resource.
- `kubectl get namespaces`

## Labels:

- Labels are key-value pairs that are attached to pods.
- No special characters should be used as key values in labels.
- Keys can have multiple values, but values should be unique.
- Labels are key-value pairs with some functionalities and help to filter the pod.
- Labels are intended to specify identifying attributes that are relevant to users and objects, but they do not directly imply semantics to the core system of pods.
- Labels are used in selectors that help to filter some functionalities.
- Labels cannot have special characters in key names, whereas annotations can have.
- Labels have some length restrictions, whereas annotations' length can be more than labels'.
- Labels are used in Kubernetes resources selectors.
- Annotations are used in selecting external resources.

## Annotations:

- Annotations are attached to the pods as arbitrary non-identifying objects.
- Annotations are similar to labels, but they have some differences:
  - Labels have a fixed (minimal length) length, whereas annotations do not have a fixed length.
  - Annotations can use special characters inside keys and values.
  - Annotations can contain links as values to download resources, which is not possible with labels.

## Resources:

- **Requests:** Soft Set
- **Limits:** Hard Set

## ConfigMap:

- Stores configurations related to the application as passed as data stored as key-value pairs.

## Secrets:

- Stores usernames and passwords securely in the environment variables.

## Image Pull Policy:

- Affects when the kubelet attempts to pull (download) the specified image.

## Kubernetes Services:

- Enable connectivity between pods and external users.
- Expose the application to the external world.
- Three Types of Services in Kubernetes:
  - 1. ClusterIP
  - 2. NodePort
  - 3. LoadBalancer

### ClusterIP:

- Exposed only to ClusterIP (Inside the Kubernetes by kubeproxy).

### NodePort:

- Connects to all nodes equally.[30000-32767]

### LoadBalancer:
- Distributes load based on incoming requests.

## Ingress in Kubernetes:

- Proxy In On-Premise Service.
- Load Balancers in Cloud:
  - 1. Application Load Balancers.
  - 2. Network Load Balancers.

## Service vs Ingress

### Sets:

- To deploy an application, we need to make a set of pods because there should be no manual intervention to create multiple containers when the user requests heavily to the application. There are 4 Types of SETS Available:

  - 1) ReplicaSet
  - 2) Deployment
  - 3) Daemon Set
  - 4) Stateful Set

### ReplicaSet:

- ReplicaSet is responsible for maintaining the desired number of pods/run the containers inside the pod for high availability. When we delete the pod, the ReplicaSet will automatically create a new pod for high availability. However, once a pod is created with ReplicaSet, if we change the image or configuration/volumes for the container and rebuild the pod, it will not update anything. This is a disadvantage for ReplicaSet. Hence, Deployment was developed.

### Deployment Set:

- If we need to update anything in the pods, including configuration files, we need to develop a Deployment set manifest file.

### Objects in Kubernetes: `There are 11 Types of Objects in Kubernetes:`

1. Pods
2. Deployment
3. ReplicaSets
4. StatefulSet
5. DaemonSets
6. PersistentVolume
7. Service
8. Namespaces
9. ConfigMaps
10. Secrets
11. Job

[More about Kubernetes Objects](https://kodekloud.com/blog/kubernetesobjects/#11typesofobjectsinkubernetes)

# Volume Section: 

## Storage System/Services in Kubernetes:

### Volume is a Simple Concept:

1. Create Volume
2. Mount That created volume

```
Every pod has some storage to store in the container space but it will not save the logs/data for a long time. 
When the Pod/Container is died then the logs/data will be lost so to save the data we need the storage system.

```

```There are Different Storage systems for Containers:```

1. EBS (Elastic Block Storage)
2. EFS/NFS (Elastic File System/System Service)

```There are 4 Types of Storage systems for containers:```
1. emptyDir
2. Hostpath
3. Static Provisioning (External, Permanent, EBS)
4. Dynamic Provisioning (External, Permanent, EFS)

- **emptyDir**: 
  - Ephimeral, inside pod. 
  - Used in side car patterns. 
  - Main container writes the logs, the side car container accesses those logs and ships to ELK.

- **HostPath**: 
  - Ephimeral
  - inside Server
  - It has full root access and `is not a recommended approach`

## FileBeat:

- Lightweight Shipper for forwarding and centralizing the log data.
- Installed as an agent in servers.
- Monitors log files or locations specified and forwards logs and events to Elasticsearch or Logstash for Indexing.
- FileBeat should have some configuration:
  - Elastic Search Address: Where to ship.
  - List of files to ship, provided through configuration (Configmap).

### DaemonSet:

- Ensures that at least one pod should be delivered to each and every node.
- Used for shipping server logs.
- Hostpath access: has full root access, not a recommended approach.

### Fluentd:

- Shipper that ships all host-level server and container-level log files to ELK (Elasticsearch, Logstash, and Kibana).
- HostPath: restricts access to a specific directory.

### Static Provisioning:

- Hard Disk: sits next to the computer, stores fields in hard disk.
- EBS: Elastic Block Storage.
- Create EBS Volumes, give access to EKS clusters, store data in EBS Volumes. Data remains even if pods or servers are deleted, can be mounted again to another pod.

### Dynamic Provisioning:

- Creation of disks/volumes handled by Kubernetes.
- StorageClass: dynamically provisions disks & PV, admin activity.

### StatefulSet:

- Follows orderly creation of pods/containers.
- Preserves network identity.
- Headless Service for StatefulSet:
  - In Headless set, explicitly mention

### Storage Classes Definitions:
- Storage class used for Dynamic Provisioning.
- PV: Representation of external storage.
- PVC: A claim that can mount the volume.
- EBS: Elastic Block Storage.
- EFS: Elastic File System.

### StatefulSet and Deployment:
- StatefulSet for DB-related components, uses Headless service.
- Deployment for Stateless applications.
- StatefulSet follows order to create the pods, maintains pod identity, and uses Headless service.

For DB, EBS is preferred due to low latency and direct attachment to the container.

### Steps to Create/Develop StatefulSet Manifest Files:
1. Install CSI Drivers
2. Give Access to EC2 Servers
3. Create a Storage Class
4. Create Persistent Volume
5. Create Persistent Volume Claim
6. Attach PVC as volumeMounts
7. Create a manifest.yaml file

## RBAC: Role based Access Control:
1. Simple But Complicated; it is directly related to Security

### RBAC is Divided into 2 Parts: Users and Service Accounts
- **Users:** By Humans (Users/Admins)
  - How to create a users in Kubernetes:
    - OffLoading the User Management to identity to Identity Providers
    - K8s Does not provide creating users
    - It gives that responsibility to identity providers

### Role and Role Binding:

- **Service Accounts:** An account used by any service to interact with Kubernetes Cluster
  - A service account is a type of non-human account that, in Kubernetes, provides a distinct identity in a Kubernetes cluster.
  - **Example:**
    - Monitoring --> Prometheus Service account
    - Jenkins --> To deploy the applications in K8s

### Kubernetes Roles/Cluster Roles
- Role Binding and Cluster Role Binding

## Custom Resource Definitions:
- CRD Custom Resource Definition
- CR Custom Resource
- Custom Control

## Security Related Tool:
- Kuberno
- kubeproxy

## CRD (Custom Resource Definitions):
- Defining a new type of API for Kubernetes deployment
- Extend the capabilities of Kubernetes by extending the API resources
- Yaml File Where We Can Define:
  - Gives all the possible options to support a user can Submit in the Virtual Service
  - Manifests/Helm/Operators/Kustomize.

## Why we need Containers and Container Orchestration:
1. To Increase the efficiency, portability, scalability
2. Reduce the usage of Operating system dependencies

## K8s Architecture:
- Nodes/Minions
- Components:
  - API-Server
  - ETCD
  - Controller Manager
  - DNS
  - Scheduler
  - Kubelet
  - Kube-Proxy
  - Container Runtime Interface (containerd)

## How To manage Clusters when down:
- There is a concept like Quorum, which means we need to mention one as leader
- When the Leader is not available, anyone voluntarily can take up the responsibilities

## Principles:
- Quorum: (n/2) + 1
- Number of Nodes: 1 Cluster & 6 Worker Nodes
- Versions in Use: Dev 1.27 & Prod 1.27

## How to talk with any cluster and set as default:
- **Kube-Config file**
  - Command: `kubectl config view`
  - **Location:** `.kube/config`
- **Config File has Three Fields:**
  1. Clusters: which cluster is using
  2. Contexts: cluster name
  3. Users: for which users have the access with

## Deploy Nginx:
kubectl run nginx --image=nginx

## List of resources/Objects:
kubectl api-resources

## Fields:
- Name
- Shortnames
- APIVersion
- Namespaced
- KIND

## List Of Objects which you worked on:
- Pod
- ReplicaSet
- Deployment
- StatefulSet
- Headless Set
- Daemon Set
- Service
- NodePort
- ClusterIP
- LoadBalancer
- Ingress

## To get the Documentation of Any Objects:
kubectl explain pod

## To deploy an application:
### 1. Front End
- **Stateless and Replica Count as 3**
- **Expose the deployment as Load Balancer/NodePort**

### 2. DB
- **A Stateful application**
- **No need to expose the application, create a service ClusterIP**
- **Create a Storage Class and Dynamic provisioning**
- **Storage Class will create PV and we just need to create a PVC**

**For Writing -> Databases**
**For Reading -> ClusterIP**

## Kubernetes Best Practices:

1. **Use Labels and Annotations in Resources:**
   - Use labels and annotations to organize and categorize resources. This facilitates easier management, monitoring, and automation.
   - Annotations: used for tools and libraries; use case is for Prometheus metrics pulling.

2. **Resource Limits and Requests:**
   - Define resource limits and requests for CPU and memory in pod specifications to ensure optimal resource utilization and prevent resource contention.

3. **Implement Horizontal Pod Autoscaling (HPA):**
   - Implement Horizontal Pod Autoscaling to automatically adjust the number of replicas based on resource usage or custom metrics.

4. **Namespace Isolation:**
   - Use Kubernetes namespaces to isolate workloads. This provides a logical separation and helps avoid naming conflicts.

5. **Role-Based Access Control (RBAC):**
   - Implement RBAC to control access to Kubernetes resources. Assign minimum necessary permissions to users and service accounts.

6. **Secrets Management:**
   - Use Kubernetes Secrets to store sensitive information. Regularly rotate secrets and avoid hardcoding them in configuration files.

7. **Network Policies:**
   - Implement network policies to control the communication between pods. This helps restrict unnecessary traffic and enhances overall network security.

8. **Use Helm for Application Packaging:**
   - Package and deploy applications using Helm charts. Helm simplifies the deployment process and allows for versioning and rollback.

9. **Regularly Update Kubernetes:**
   - Keep Kubernetes updated with the latest patches and releases to ensure security and stability.

10. **Backup and Disaster Recovery:**
    - Implement backup and disaster recovery strategies to protect against data loss and ensure business continuity.

## Kubernetes Security Considerations:

1. **API Server Security:**
   - Secure the Kubernetes API server using authentication and authorization mechanisms. Enable audit logging for better visibility.

2. **Image Security:**
   - Scan container images for vulnerabilities before deploying them. Utilize image signing and promote the use of verified images.

3. **Network Security:**
   - Secure communication between nodes and the control plane components using TLS. Implement network policies to control pod-to-pod communication.

4. **Runtime Security:**
   - Use PodSecurityPolicies or PodSecurity admission controllers to enforce security policies on pod specifications.

5. **Role-Based Access Control (RBAC):**
   - Regularly review and update RBAC policies. Remove unnecessary privileges and regularly audit RBAC configurations.

6. **Secrets Management:**
   - Encrypt sensitive data in transit and at rest. Use tools like sealed secrets or external secret management systems.

7. **CIS Kubernetes Benchmarks:**
   - Follow the Center for Internet Security (CIS) Kubernetes benchmarks. These provide guidelines for securing Kubernetes deployments.

8. **Network Policies:**
   - Enforce network policies to control communication between pods. Regularly review and update policies based on application requirements.

9. **Pod Security Standards:**
   - Implement standards for pod security, including specifying resource requirements, avoiding the use of privileged containers, and following security best practices.

10. **API Access Controls:**
    - Limit access to the Kubernetes API server and use RBAC to control which users and service accounts can perform specific actions.

11. **Use Service Mesh for Enhanced Security:**
    - Consider implementing a service mesh like Istio for advanced features such as mutual TLS, traffic control, and telemetry.

12. **Multi-tenancy Considerations:**
    - If using multi-tenancy, implement strict isolation between tenants using dedicated namespaces, network policies, and RBAC.

### Based on The load increase how to increase:
1. Based on the threshold we need to deploy
2. Horizontal Pod Auto-scaler

### What is Image Pull Policy:
1. IfNotPresent
2. Always
3. Never

### What is Container Pull Policy:
Container Restart Policy:
1. Always
2. OnFailure
3. Never

### Pod Phase/Status:
1. Pending
2. Running
3. Succeeded
4. Failed
5. Unknown

### Container States/Status:
1. Waiting
2. Running
3. Terminated

### Pod Checking Mechanisms:
### What is A Probe:
A diagnostic performed periodically by the kubelet on a container
1. exec
2. grpc
3. httpGet
4. tcpSocket

### Probe OutCome:
- Success
- Failure
- Unknown

### Types of Probes:
- livenessProbe
- readinessProbe
- StartupProbe


### What is an OOM Killed:
1. Out Of Memory Issue
2. We will implement Resources Requests and Limits memory
3. 1vCPU = 1000m (Milli Cores), 1 GB = 1024Mb

### What is ImagePullBackOff:
1. When the container run time is not able to pull the image

### How to store the images in private and pull from Private repo:
Create a Secret

### Can Pod Have Multiple Containers:
Maximum 2 containers

### We have an S3 Bucket and a File we need to install those files to access the application, what pattern will you follow:
1. I will follow the init containers
   - Volume: `emptyDir` `HostPath`
   - Download the file in the empty directory

### Can we have multiple init containers and if one fails:
1. Yes, we can have multiple init containers
2. It will restart

### How many init containers can we have:
There is no limit

### Situation:
To Ship Logs Sidecar Containers

### What are distroless images:
There are no utilities in the image; these are called distroless images

### Interview Questions:
"""
-How to show all labels: kubectl get pods --show-labels
What happen if we do not mention any labels
it will create default labels:
run: <metadata.name>
How to Add More labels to a pod:
kubectl labels pod <pod-name> env=dev bus=iot

How to override labels:
kubectl label pod <pod-name> --override

How to remove the labels:
kubectl labels pod <pod-name> -l app-
"""
**What are Annotations:**
- Non Identifying metadata or key value pairs it is used for extra tools or utilities
- when we need to integrate with any other tools these annotations will be helpful

**How many types of Selectors:**
- 1: Equality Based Selectors: --> uses  RC, Services
*Equality and Not Equality Checking #app=env app!=frontend % Using Equal operator*

- 2: Set Based Selectors: --> Used Replica Sets, Deployments Etc..
*env in (qa,uat) OR app 'notin' (front-end, backend) '%' Using Set operator*

Deployments, Replicasets and StatefulSets will get matchLabels section

**features:**
- ContainerOrchestration: true
- Portability: true
- Scalability: true
- ServiceDiscoveryAndLoadBalancing: true
- RollingUpdatesAndRollbacks: true
- SelfHealing: true
- DeclarativeConfiguration: true
- EcosystemAndCommunity: true
- MultiCloudAndHybridCloud: true
- Extensibility: true

**What is Kubernetes and why is so popular Reasons For Kuberenetes Popularity**
- Kubernetes has become popular due to its ability to simplify containerized application
- management, ensure portability across various environments, enable scalability, support
- rolling updates and rollbacks, provide self-healing mechanisms, use declarative
- configuration, foster a vibrant ecosystem and community, work well in multi-cloud
- and hybrid cloud deployments, and offer extensibility for diverse use cases.

**What is self Healing and What components are used:**
Self Healing means it will automatically heal the pod and containers
  - 1: Probes will be used
  - 2: Readiness Probe
  - 3: Liveliness Probe
  - 4: Health Check about the pods


**Is Kubernetes is Portable:**
- Portability is Primarily achieved :
  - 1: Containerization
  - 2: Abstraction of Infrastructure
  - 3: Declarative Configuration
  - 4: Cloud-Agnostic
  - 5: Compatibility with CNCF Standards

### How does k8s ensure High Availability:
**Kubernetes follows several mechanisms to ensure high availability of applications and the platform itself**
- 1: Node Redundancy
- 2: Pod Distribution
- 3: Self Healing
- 4: Replica Sets
- 5: Master Node Redundancy
- 6: Etcd Cluster
- 7: Load Balancing
- 8: Rolling Updates

**K8s Cluster Upgrades : 1.29 Mandala**

- Self Hosted Cluster
- Scaling Kubernetes
- Horizontal Pod AutoScaler
- Vertical Pod AutoScalar

**Kubernetes namespace:**

- *These are isolated environment for giving process ids for each containers*

*What are the key Components While Rolling Restart:*
- **maxSurge:** Max extra Pods allowed during rollout
- **maxUnavailable:**	Max Pods that can be unavailable during rollout

## Real Time Problems in K8s:

- **Scenario - 1 : Resource Sharing**:
  - Divide the environments into Namespace
  - Each NameSpace we can maintain Resouce Quota (Limits and Requests)
  - CPU & Memory Management (Limits 1 and memory : 10Gb)
  - Performance BenchMarking --> They have to comeup with ideal Quota
  - CrashLoopBack off Error: Someother service is taking more memory in another namespace
  - Resource Limits and Resource Requests Per Pod
- **Scenario - 2 : OOM Killed Crashed LoopBackOff**:
  - Due to OOM Killed and some threads are taking more memory
- **Scenario - 3 : Upgrades**:
  - Very Common

## Deployment Stratagies:
- **Rolling Update**
  - MaxUnavailable: How mch time the old verision will not available
  - MaxSurge: How much percentage the new version should take to up
- **Canary Model Deployment**
  - Split the traffic percenatge wise
  - Using Load Balancer can split traffic
  - 80% --> V1 and 20% --> V2
  - Ingress Controller
  - Default Ingress Contoller is NGINX
  - Deployment , Service and Ingress
  - 
- **Blue Green Deployment**
  - Two Different Envs need to create and change the URLs to DR region while upgrading
  - Costly and Safe

## Networking Model:
- Each pod in a cluster gets its own unique cluster wide
- A pod has its own private network namespace which is shared by all of the containers within the pod
- Process Running in different containers within same pod can communicate with each other via localhost
- `Pod network` Handles communication between pods
- `Cluster Network`: all pods can communicate with each other wether they are on same node or different node but should be in same Cluster.
- `Network Policy` Built in K8s API that allows you to control traffic between pods or between pods and the outside world.
- `Gateway API` Allows you to make services accesible to clinets that are outside the cluster
- Kubernetes provides a default implementation of service proxying, called `kube-proxy`

## Secure Pod Within Namespace with Security Contexts:

```
          # AT Container Level
          securityContext:
            readOnlyRootFilesystem: true
            allowPrivilegeEscalation: false
            capabilities:
              drop: ["ALL"]
  # At Pod Level for Root Users 
  securityContext:
    runAsUser: 1000
    runAsGroup: 3000
    fsGroup: 2000

```

## Network Policy

```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
  namespace: my-namespace
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: frontend
  egress:
    - from
    - to
```

# Trouble Shoot K8s :

## Most Important Topics in Kubernetes

- ### *1: Monitoring Containers & Pod Health Check using Probes*
  
  - Container Health `Auto Healing Features`
    - Automaticall Restart unhealthy containers
    - Active Monitoring
      - Pull The status Healthy or not
      - Application Status should be accurate

  - **Probes**
    - Liveness Probe
    - Readiness Probe
    - Start-Up Probe

  - **Types of Probes Health Check**
    
    - Command `Will be Check Using Command internally insdie the container`
    - HTTP Probe
    - TCP Probe
    - gRPC Probe
    - Exec Probe

  - **Errors Occur when Probes Failed**
    
    - CrashLoopBackOff
    - ImageCrashLoopBackOff
    - Err Image Pull

## **Liveness Probe**

- Liveness probe is powerful way to recover from application failures
- Liveness probe allow you to automatically determine container application health state
- By Default K8s will only consider a container to be terminated if the container process stops
- Liveness probe allows you to customize this detection mechanism and make it more flexible

**Liveness Probe Yaml manifest**

```
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mycontainer
    image: myimage:latest
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 10
      periodSeconds: 30
```

## **Startup Probe**
- Similar to the liveness probe however liveness probe run constantly on a schedule , startup probe run at container startup and stop running once they succeed
- They are used to determine when the application has successfully started
- Start Up probe are especially useful for some legacy applications that can have long startup times

***Start Up Probe Yaml Manifest***
```
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mycontainer
    image: myimage:latest
    startupProbe:
      httpGet:
        path: /ready
        port: 8080
      failureThreshold: 30
      periodSeconds: 10
      initialDelaySeconds: 10
```

## **Readiness Probe**
- Readiness Probe are used to determine when a conatiner is ready to accept requests
- When you have a service backed by multiple container endpoints user traffic will not be sent to a particular pod until its containers have passes all the readiness checks defined by their readiness probes
- Use Reainess probe to prevent user traffic from beings ent to pods that are still in the process of starting up

***Readiness Probe Yaml Manifest***
```
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mycontainer
    image: myimage:latest
    readinessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 120
      periodSeconds: 10
      failureThreasholds: 3
      timeoutSeconds: 3 
```

- ### *Liveness Probe three conditions*

  - **initialDelaySeconds** `This tells kubelet to wait for 5 seconds before performing the first probe`
  - **periodSeconds** `this field specifies that kubelet should perform a liveness probe every 5 seconds`
  - **cat /tmp/health** `This check the health of conatiner if returns 0 kubelet will decide conatiner is alive and healthy`
  - **failureThreshold** `indicates the number of consecutive failures required to consider the probe as failed.`

- ***Commands To Check the Status***
  
  - kubectl get pods -n namespace -c 
  - kubectl describe pod liveness-exec
  - kubectl get events

**Restart Policy For Pods**

- *By default the kubernetes will restart the pod always when it fails to run the containers*
- *We can change the `Restart Policy` we can change the setting and make a pod to fail*
  
- #### There are 3 Type of Restart Policies
  
  - **Always** --> `Default Setting In K8s`
  - **OnFailure** --> `K8s will restart when container exits on non-zero exit status`
  - **Never** --> `K8s will never automatically restart the container if exits`

***Restart Policy Yaml File***
```
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  restartPolicy: Always
  containers:
  - name: mycontainer
    image: myimage:latest
```

***Rolling Updates in Kubernetes***

- *Important Fields*
  - targetGracePeriodSeconds `K8s should wait before forcefully terminating a pod during a rolling update or deletion`
  - maxSurge 
  - maxUnavailable 

```
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1         # Number of extra Pods allowed above desired replicas during update
    maxUnavailable: 1   # Number of Pods allowed to be unavailable during the update
```

## NameSpaces and Resource Quotas

### **Resource Quotas**

- Resource Management is Most important in Kubernetes if the cluster is shared
- *Why?*
  - To Avoid any Particular team or person to consume all the resources
- To Achieve this you can divide everyone to use their own namespaces
  - With This you can enable resource Quota and ObjectQuota

## Insufficient Node Resources

- *Based On the ranking and priority pods will get evicted if the node resources are not sufficient and remaining pods will get deleted from one particular nodes*
- Implement the node autoscalers
- Implement the Cluster auto scaling
- Reduce the workloads on nodes based on the priority
- Using Taints and Tolerations
- Using Pod Afffinities and pod Antiaffinites 

**Kubernetes Descheduler**

- Utilize the taints and Tolerations
- Pod Affinity and Anti-Affinity Violations
- Excessive Pod Restarts Deletes by Scheduler
- Node Utilization Levels
- Pod Distribution Across Nodes

# **Understanding The Deployments**

- There are two types of operations will be done in Deployments
  - Client side Validations
  - Server Side Validations

## *Client Side Validations*

- Authentication
- Validations `Ensure the resource type ,group and client credentials are valid`
- Context & Validations `Extract Current Context cluster and Authentication information from kubeconfig`
- HTTP Request `Form and send the Deployment request to the API Server`

## *Server Side Validations*
- Authentication and Authorization
- Admission Control
  - Two Types of Admission Controls
    - Mutators `Mutations`
    - WebHooks/Validators `Allows Users`
- ETCD `Once validations are succesfull it will be stored in ETCD`
- Controller `Deployment controller watches for deployment for actual and desired pods to be there`
- Scheduler `Schedules the pod to the particular nodes`
- Kubelet  `Watches Scheduler`
  - Create Pod
    - Pull Image
    - Pod StartUp
    - Start Containers
    - Monitor Pod Health
    - Update Status of API Server

## Pod Debugging and Troubleshoot:

- 1: imagePullBackoff
  - invalid image name
  - invalid tag
  - invalid permissions
- 2: ErrImagePull
- 3: RegistryUnavailable
- 4: CrashLoopBackOff
- 5: KillContainerError

## Image Pulled but pod is pending:

- Resource Quota on Namespace
- Nodes does not have the required resource quotas
- Check Kube-Scheduler components
- Image is Pulled but pod is not ready:
- always check for the readiness probe
- Check the scheduler schedules it or not
- check for tolerations on pod related to taints in nodes

## CrashLoopBackOff:

- Liveness Probe Failure
- it is live for public and working fine without any issues and restarting if there any issues
- Application failed to start for any reason

## Kubernetes Events :

- 1: kubectl logs pod : kubectl logs mypod
- 2: kubectl describe pod
- 3: kubectl get events:
- kubectl get event --namespace abc-namespace --field-selector involvedObject.name=my-pod-zl6m6

```
Tail Logs: kubectl logs -f mypod `Live Logs collections using cmd`
OOM Killed: Out Of Memory Killed
Limit OverCommit Exceeded
Container Limit Exceeded
Resource Quotas: Requests and Limits
kill -3 PID
```

## What are the pod status:

- 1: Pending --> Pod is scheduled and all conatiners ready and started working will go to running
- 2: Running --> All containers are started and serving the requests
- 3: Succeeded --> When the containers is exited with success
- 4: Failed --> When the containers are exited with error
- 5: Unknown --> When the pod is unknown (usually node issues)

## How to Trouble shoot when the pod is in pending state:

## Why pod is Pending State:
- 1: Insufficient Resources (You dont have enough resources)
- 2: Taints on Nodes
- 3: Node Affinity / Pod Affinity
- 4: Node Selectors
- 5: Dependency Management
- 6: Image pull Problem
- 7: Init Conatiner are not completed properly
- 8: Pods are using Host ports

## Step By Step Trouble Shoot:

- 1: Check in the scheduling state
- 2: Check the image download
- 3: Check the dependencies
- 4: Check the node details about resources and allocatable memory
- 5: Check the PVC is created properly and attached it to pod
- 6: Check the Secrets and Config maps are attached
- 7: Check the replication controller why it has not able to create a pod

## Commands need to be executed:

- 1: kubectl describe pods ${pod_name}
- 2: kubectl get pod -o wide
- 3: kubectl get pods --field-selector=status.phase=Pending
- 4: kubectl get events | grep ${podname}
- 5: kubectl describe node | grep tainted
- 6: kubectl describe rc ${repication controller name}

## How to Troubleshoot pod in waiting state:

- 1: If the image you have given is incorrect
- 2: make sure that image is pushed to image registry
- 3: try to pull the image manually to check the image is present in registry or not
  
### *My pod is running but it is not doing what i expected --> Due to missed information in yaml file*

### kubectl apply --validate -f mypod.yaml.

## How to trouble shoot a service:

- 1: Service provide a load balancing across the pods
- 2: For every service object in k8s that api server will makes endpoints
- 3: kubectl get endpoints ${service name}
- 4: Check the pod selector and Services selectors are matching
- 5: check the nodeport mentioned it should not used by anyother service
- 6: Utilize the Load Balancing Techinique

# SRE & Signals

**Two Main Points**
- Focused on ensuring Uptime and Availability
- Monitoring and Designing Systems with resiliency in mind

***SRE Concepts***
- Move Fast Without break anything
- Automation
- Error Budgeting
- Setting SLAs SLOs and SLIs
- Service Level Agreements
- Service Level Objectives
- Service Level Indicators

***Monitoring 4 Golden Sinals***
- Latency
- Traffic
- Errors
- Saturation

***Incident Responses***
- Incident Command System
- Designed Roles
- Keep Record
- Document Everything and Every Issues

**Logging and Monitoring**
- ***Tools***
  - Prometheus --> Monitoring the Metrics(CPU,memory)
  - Grafana --> DashBoards Creations(Based on TSDB)
  - ELK --> Elastic Logstash & Kibana (Logs Management)
  - Cloud Watch Logs *`Cloud Native Solutions`*

**What Should We Monitor**
- Node Health *`taints & Tolerations`*
- Cluster CPU/Memory *`Resource Quotas & Requests and Limits`*
- Pod Health Checks *`Probes,Readiness Probes,Liveliness Probes`*
- Networking *`Kube-Proxy,Ingress,Service,LoadBalancers`*
- Applications Logs *`Side-Car Patterns`*

```
## Commands:

# Kubernetes Day-to-Day `kubectl` Commands Cheat Sheet

## 📄 1. Basic Cluster Info

kubectl version                            # Client & server version
kubectl cluster-info                       # Cluster endpoint info
kubectl config view                        # Show kubeconfig settings
kubectl get nodes                          # List all nodes in the cluster

## 📦 2. Pods / Deployments / Services

kubectl get pods                           # List all pods
kubectl get pods -o wide                   # Detailed pod info (with node/IP)
kubectl describe pod <pod-name>           # Pod details including events
kubectl logs <pod-name>                   # View logs of a pod
kubectl logs <pod-name> -c <container>    # Logs of specific container in a pod

kubectl get deployments                    # List deployments
kubectl describe deployment <name>         # Deployment details
kubectl get svc                            # List all services
kubectl get all                            # Get all resources in the namespace

## 🚀 3. Creating / Updating Resources

kubectl apply -f <file.yaml>              # Create/update from YAML
kubectl create deployment <name> --image=nginx
kubectl expose deployment <name> --port=80 --target-port=80 --type=ClusterIP
kubectl scale deployment <name> --replicas=5
kubectl set image deployment/<name> <container>=<image:tag>

## 🔍 4. Rollouts & History

kubectl rollout status deployment/<name>   # Check rollout progress
kubectl rollout history deployment/<name>  # View rollout history
kubectl rollout undo deployment/<name>     # Roll back to previous version

## 🪠 5. Deleting Resources

kubectl delete pod <pod-name>              # Delete a pod
kubectl delete deployment <name>           # Delete a deployment
kubectl delete -f <file.yaml>              # Delete from manifest
kubectl delete all --all                   # Delete all resources in namespace

## 📦 6. Namespaces

kubectl get namespaces                     # List all namespaces
kubectl create namespace <name>
kubectl config set-context --current --namespace=<name>  # Switch context


## 🧪 7. Debugging / Troubleshooting

kubectl get events                         # View cluster events
kubectl describe <resource> <name>         # Detailed view (good for issues)
kubectl exec -it <pod-name> -- /bin/sh     # Exec into a pod
kubectl top pod                            # View pod resource usage
kubectl port-forward pod/<name> 8080:80    # Access pod port locally

## 📁 8. ConfigMaps / Secrets

kubectl get configmaps
kubectl get secrets
kubectl create configmap my-config --from-literal=key=value
kubectl create secret generic my-secret --from-literal=password=1234

## 📂 9. Persistent Volumes (PV) / Claims (PVC)

kubectl get pv
kubectl get pvc
kubectl describe pvc <name>

## 🔄 10. Apply YAML Files (Declarative Approach)

kubectl apply -f deployment.yaml
kubectl diff -f deployment.yaml         # See changes before applying

## 🛑 11. Dry Run & YAML Output

kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-pod.yaml
kubectl explain pod.spec.containers     # Show API fields and structure

## 12. CRDs and Custom Resources

kubectl get crd                         # List all CustomResourceDefinitions
kubectl get <custom-resource>          # E.g., `kubectl get kafkas` (for Kafka CR)
```