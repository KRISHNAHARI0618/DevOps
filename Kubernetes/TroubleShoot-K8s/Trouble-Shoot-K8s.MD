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
    - Command `Will be Check using Command internally insdie the container`
    - HTTP Probe
    - TCP Probe
    - gRPC Probe
    - Exec Probe

  - **Errors Occur when Porbes Failed**
    - CrashLoopBackOff
    - ImageCrashLoopBackOff
    - Err Image Pull

## **Liveness Probe**

- Liveness probe is powerful way to recover from application failures
- Liveness probe allow you to automatically determine container application health state
- By Default K8s will only consider a conatiner to be terminated if the container process stops
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
- They are used to determins when the application has successfully started
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
      initialDelaySeconds: 10
      periodSeconds: 5
```

- ### *Liveness Probe three conditions*

  - **initialDelaySeconds** `This tells kubelet to wait for 5 seconds before performing the first probe`
  - **periodSeconds** `this field specifies that kubelet should perform a liveness probe every 5 seconds`
  - **cat /tmp/health** `This check the health of conatiner if returns 0 kubelet will decide conatiner is alive and healthy`
  - **failureThreshold** `indicates the number of consecutive failures required to consider the probe as failed.`

- ***Commands To Check the Status***
  - kubectl get pods
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
- reduce the workloads on nodes based on the priority

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

## CrashLoopBackOff:
- Liveness Probe Failure
- it is live for public sand working fine without any issues and restarting if there any issues
- Application failed to start for any reason

## Kubernetes Events :
- 1: kubectl logs pod : kubectl logs mypod
- 2: kubectl describe pod
- 3: kubectl get events:
- kubectl get event --namespace abc-namespace --field-selector involvedObject.name=my-pod-zl6m6

```
Tail Logs: kubectl logs -f mypod
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

How to Trouble shoot when the pod is in pending state:

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
- 3: Chcek the dependencies
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

-*My pod is running but it is not doing what i expected --> Due to missed information in yaml file*
### kubectl apply --validate -f mypod.yaml.

## How to trouble shoot a service:
- 1: Service provide a load balancing across the pods
- 2: For every service object in k8s that api server will makes endpoints
- 3: kubectl get endpoints ${service name}

















