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

## Memory Management or Storage Setup
