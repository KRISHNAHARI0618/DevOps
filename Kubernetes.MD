# Introduction:
*Kubernetes is easy*
- Kubernetes is the future of DevOps
- People are moving towards Microservices

* Docker Vs Kubernetes *
[Kuberenetes 100 Questions](https://medium.com/@jaya.surya8068/top-100-kubernetes-interview-questions-and-answer-5adb4c427b17)

# Docker:
- Container Platform where it supports the building the containers
- Does not support AutoScaling
- Does not support AutoUpgrades
- Single Host
- Enterprise Level Management

# Conatiners
- Containers are ephemeral in nature
- Short lived > container can die and revive anytime
- Containers will die if it does not get enough resources
- Container will die if it does not support the building the image
- Docker will have only one host divided the resources into multiple
- Containers are getting effected due to lack of resource allocation between containers

### 1
*Lets take some one has killed container then to application inside will not work so we need the feature called AutoHealing Capacity*
### 2
*Lets take we are using the application at festival times or occasion time everyone will use that for offers at that time fixed container will not support that much traffic so we need auto scaling which docker does not support*
### 3
*Lets take we are using production systems enterprise level building need more*
- ELB:  Load Balancers
- Firewalls
- All above features

### Disadvantages of Docker:
- AutoHealing Does not support
- AutoScaling Does not support
- it is single host
- Enterprise Support does not support
- Docker server is Crashed not able to access the application
- More Traffic Does not support
- Balancing Load Does Not Support
- What about Configs and secrets Management

### Kubernetes :
- Container Orchestration Platform
- kubernetes Supports AutoScaling > Create more Containers *Using Replica Sets*
- Kubernetes supports AutoHealing > Auto restart,reboot.etc.. *Using Controllers and Probes*
- Single Host issue will Solve -- By Default Kubernetes is a Cluster
- Enterprise level Standards
- Stores Secret as 64d encoded format
- Master and Worker Architecture
- If the container is affected by another container it will be moved to another node so that the application cannot get affected.
- Enterprise Level Standard :
- Advanced Load Balancing support *Using Service and End Points*
- Advanced Security Support *Using Network Policies , Ingress Controllers , RBAC..*
- Service Discovery *Using Service ,Ingress,LoadBalancing,ClusterIP,NodePort etc..*
- Supports storage orchestration *Using Storage Class, Persistent Volume and Persistent Volume Claims*
- Designed For extensibility Using *Custom Resource Definitions*
- Batch Execution *Using K8s Jobs or Cron Jobs*
- Automated RollOuts and Roll Backs *Using Rolling Updates and Deployment Stratagies*

Kubernetes Secrets Management:
It will store all the secrets in one place either s3 Bucket or ETCd

### Kubernetes Architecture :

Docker Simplest Thing is Container
Kubernetes Simplest Thing is Pod

- To run any Container we need run time environment
  - Docker CRI: Docker Shim/Runc
  - K8s CRI: Containerd
  - Kubelet: Responsible for running the pod/application
  - Kubeproxy: responsible for networking

*Kubernetes Architecture:*
- Managing the Hosted Applications in the form of Containers in Worker Nodes
We look At An analogy of Ships and Containers

*Components:*
- Control Node, Worker Node
- Control Nodes: Manage the Applications
- Worker Nodes: Host The Applications as Containers

### Master Node(Control Plane):

- 1: Kube Api Server:
```
The Server which is responsible for all the activities in the k8s Cluster is called Kube Api Server
The Kubernetes API server validates and configures data for the api objects which include pods, services, replication controllers, and others.
The API Server services REST operations and provides the frontend to the cluster's shared state through which all other components interact
```
- 2: Controller Managers:
```
Which Controls and Manages the Nodes Based on State of Nodes and Controllers
The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes.
a control loop is a non-terminating loop that regulates the state of the system
It represents the state of Applications
a: Replication Controllers
b: Pod Controller
c: API Controller
d: Daemon-Set Controller
```
- 3: ETCD:
```
Which stored all information about activities going on Nodes and Control Planes in a Key Value Pairs
```
- 4: Kube-Scheduler:
```
A component which is responsible for Scheduling the pods/Services based on the availability of node status , Taints and Tolerations node affinity etc..
```
### Worker Nodes: (Data Plane)
- 1: Kubelet: A component which is responsible of collecting and Sharing and managing all the information about nodes and containers in the cluster
- 2: Kube-Proxy: a component which enables the communication between each container in the Cluster
- 3: Container Run time: A component which is responsible for Running the Containers

# Kubernetes Objects

Kubernetes objects are persistent entities in the Kubernetes system. They represent the state of your cluster.

## Verification of User Access to Clusters:

### Client Side:
1. Validation: Checks the syntax and structure of the configuration.
2. Format checking: Ensures the configuration follows the correct format.
3. Misconfiguration Detection: Identifies any misconfigurations in REST API calls.
4. Authentication Data: Passes authentication data saved in the configuration file.

### Server Side:
1. Authorization: Determines whether the user has permissions to perform the requested action.
2. Authentication: Validates the user's identity.

### Server Side Field Verification:
1. Strict: Enforces strict validation rules and rejects invalid requests.
2. Warn: Issues warnings for invalid requests but allows them to proceed.
3. Ignore: Ignores invalid requests without issuing warnings or rejecting them.

# Docker Swarm vs Kubernetes

- Kubernetes:
  - Better networking support.
  - Container orchestration system managing multiple containers.
  - Built-in support for stateful applications.

- Docker Swarm:
  - Minimal networking support.
  - Cluster manager for Docker containers.

# Kubernetes Production Systems:

## Kubernetes Distributions:

- Provide support for Kubernetes clusters.
- Popular systems include:
  - Kubernetes Cluster
  - OpenShift
  - Rancher
  - VMWars Tanzu
  - EKS
  - AKS
  - GKE.

## How DevOps Engineers Manage 100s of Clusters?

- Tools like:
  - Kops
  - Kubeadm
  - Lens

# Container Images:

- A container image encapsulates an application and all its dependencies.
- Images are executable software bundles and can run standalone.
- They make well-defined assumptions about their runtime.

- `kubelet` downloads and fetches images from the registry.
- To ensure using the same version of an image, replace `<image:tag>` with `<image@digest>`.

## % Types of Patterns/Multi-Containers Pods in K8s:

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

### ImagePullPolicy:
- Default imagePullPolicy is set as #ifNotPresent
- `IfNotPresent`: Pull the image only if it is not already present locally.
  - Set the image field as `image@digest == #imgae:IfnotPresent`.
- `Always`: Always pull the latest version of the image.
  - Set the image field as `image:latest == #image:always` or just `image:latest`.
- `Never`: Never pull the image, even if it is not present locally.
  - Set the image field as `image:nothing == ifnotPresent`.

## Images issues:

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

### Kubernetes Pods

#### What are Pods:

- A Pod (as in a pod of whales or pea pod) is a group of one or more containers, with shared storage and network resources, and a specification for how to run the containers.
- Pod is basically a wrapper like YAML file with all commands needed to run the container.
- Pod is the smallest deployable unit which contains one or more container specifications.
- Pod can share both network and storage with multiple containers.

#### Components of a Pod:
- Namespace
- Image names and container specification

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

Pods in Kubernetes can be configured in two main ways:
- Pods with a single container.
- Pods with multiple containers.

### Init Containers:

Init containers are containers that start before the actual containers are started.
- Init containers always run to completion.
- Each init container must complete successfully before the next one starts.

### Pod LifeCycle:

- **Pending:** Pod has been accepted by the Kubernetes system but has not yet been scheduled to a node.
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

1. **httpGet:** Should return a successful HTTP response.
2. **tcpSocket:** Port connectivity should be successful.
3. **exec:** Executes a specified command inside the container; should return an exit value of 0.
4. **grpc:** Performs a remote procedure call using gRPC.

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

- **Container:** Docker; lightweight in nature for running the application with all application-related packages and dependencies along with minimal OS usage.

- **ReplicaSet:** Maintains the desired number of pods/run the containers inside the pod for high availability.

- **Deployment:** Developed to update anything in the pods, including configuration files, by developing a Deployment set manifest file.

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
  1. ClusterIP
  2. NodePort
  3. LoadBalancer

### ClusterIP:
- Exposed only to ClusterIP (Inside the Kubernetes by kubeproxy).

### NodePort:
- Connects to all nodes equally.

### LoadBalancer:
- Distributes load based on incoming requests.

## Ingress in Kubernetes:
- Proxy In On-Premise Service.
- Load Balancers in Cloud:
  1. Application Load Balancers.
  2. Network Load Balancers.

## Service vs Ingress

### Sets:
To deploy an application, we need to make a set of pods because there should be no manual intervention to create multiple containers when the user requests heavily to the application. There are 4 Types of SETS Available:

1) ReplicaSet
2) Deployment
3) Daemon Set
4) Stateful Set

#### ReplicaSet:
ReplicaSet is responsible for maintaining the desired number of pods/run the containers inside the pod for high availability. When we delete the pod, the ReplicaSet will automatically create a new pod for high availability. However, once a pod is created with ReplicaSet, if we change the image or configuration/volumes for the container and rebuild the pod, it will not update anything. This is a disadvantage for ReplicaSet. Hence, Deployment was developed.

#### Deployment Set:
If we need to update anything in the pods, including configuration files, we need to develop a Deployment set manifest file.

### Objects in Kubernetes:
There are 11 Types of Objects in Kubernetes:

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

## Storage System/Services in Kubernetes:

### % Volume is a Simple Concept:
1. Create Volume
2. Mount That created volume

Every pod has some storage to store in the container space but it will not save the logs/data for a long time. When the Pod/Container is died then the logs/data will be lost so to save the data we need the storage system.

There are Different Storage systems for Containers:
1. EBS (Elastic Block Storage)
2. EFS/NFS (Elastic File System/System Service)

There are 4 Types of Storage systems for containers:
1. emptyDir
2. Hostpath
3. Static Provisioning (External, Permanent, EBS)
4. Dynamic Provisioning (External, Permanent, EFS)

- **emptyDir**: Ephimeral, inside pod. Used in side car patterns. Main container writes the logs, the side car container accesses those logs and ships to ELK.

- **HostPath**: Ephimeral, inside Server. It has full root access and is not a recommended approach.

#### FileBeat:
- Lightweight Shipper for forwarding and centralizing the log data.
- Installed as an agent in servers.
- Monitors log files or locations specified and forwards logs and events to Elasticsearch or Logstash for Indexing.
- FileBeat should have some configuration:
  - Elastic Search Address: Where to ship.
  - List of files to ship, provided through configuration (Configmap).

#### DaemonSet:
- Ensures that at least one pod should be delivered to each and every node.
- Used for shipping server logs.
- Hostpath access: has full root access, not a recommended approach.

#### Fluentd:
- Shipper that ships all host-level server and container-level log files to ELK (Elasticsearch, Logstash, and Kibana).
- HostPath: restricts access to a specific directory.

#### Static Provisioning:
- Hard Disk: sits next to the computer, stores fields in hard disk.
- EBS: Elastic Block Storage.
- Create EBS Volumes, give access to EKS clusters, store data in EBS Volumes. Data remains even if pods or servers are deleted, can be mounted again to another pod.

#### Dynamic Provisioning:
- Creation of disks/volumes handled by Kubernetes.
- StorageClass: dynamically provisions disks & PV, admin activity.

#### StatefulSet:
- Follows orderly creation of pods/containers.
- Preserves network identity.
- Headless Service for StatefulSet:
  - In Headless set, explicitly mention ` 

#### Storage Classes Definitions:
- Storage class used for Dynamic Provisioning.
- PV: Representation of external storage.
- PVC: A claim that can mount the volume.
- EBS: Elastic Block Storage.
- EFS: Elastic File System.

#### StatefulSet and Deployment:
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
#### What is A Probe:
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
*These are isolated environment for giving process ids for each containers*

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