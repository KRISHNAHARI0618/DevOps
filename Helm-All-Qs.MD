
# Helm Documents

- [Helm Official Docs](https://helm.sh/docs/)
- [Helm Masterclass - GitHub](https://github.com/stacksimplify/helm-masterclass)
- [Helm Masterclass Presentations](https://github.com/stacksimplify/helm-masterclass/tree/main/course-presentation)
- [Helm Charts - GitHub](https://github.com/stacksimplify/helm-charts)
- [Helm Charts Repo - GitHub](https://github.com/stacksimplify/helm-charts-repo)

## Port-Forwarding
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

## Helm Charts Folder Structure

**Base Chart Structure:**
- `.helmignore`
- `Chart.yaml`
- `charts/` (Child Charts)
- `templates/`
  - `NOTES.txt`
  - `readme.md`
  - `deployment.yaml`
  - `hpa.yaml`
  - `ingress.yaml`
  - `service.yaml`
  - `serviceaccount.yaml`
  - `tests/test-connection.yaml`
- `values.yaml`

## Before Helm

1. Static labels
2. Fixed port numbers
3. YAML files must be manually created (Service, Deployment, Pods, etc.)
4. High repetition across deployment files
5. Lack of consistency
6. Manual revision history
7. No native support for continuous deployment

## After Helm

1. Acts as a package manager for Kubernetes applications
2. Helm uses Charts (equivalent to packages)
3. Charts bundle YAML files like Service, Deployment, ConfigMap
4. Helm can install, upgrade, rollback, and uninstall applications

## Why Use Helm Charts

- Acts as a Kubernetes package manager
- Maintains revision history
- Dynamic configuration via `values.yaml`
- Promotes consistency
- Intelligent deployments
- Lifecycle hooks
- Enhanced security with signed charts

## Helm Architecture

- **Charts**: Collection of templates and values
- **Repository**: Storage for charts
- **Release**: Installed instance of a chart

## Helm Installation Order

1. Namespace  
2. ResourceQuota  
3. LimitRange  
4. PodSecurityPolicy  
5. Secret  
6. ConfigMap  
7. StorageClass  
8. PersistentVolume  
9. PersistentVolumeClaim  
10. ServiceAccount  
11. CustomResourceDefinition  
12. ClusterRole  
13. ClusterRoleBinding  
14. Role  
15. RoleBinding  
16. Service  
17. DaemonSet  
18. Pod  
19. ReplicaSet  
20. Deployment  
21. StatefulSet  
22. Job  
23. CronJob  
24. Ingress  
25. APIService

## Helm Templating Language

### pod.yaml
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: {{ .Values.name }}
spec:
  containers:
    - name: {{ .Values.container.name }}
      image: {{ .Values.container.image }}
      ports:
        - containerPort: {{ .Values.container.port }}
```

### values.yaml
```yaml
name: nginx-app
container:
  name: nginx-container
  image: nginx
  port: 8080
```

## Helm Chart Directory Structure

- `Chart.yaml`
- `values.yaml`
- `templates/`
- `charts/`

## Setting Passwords in Helm Charts

### CLI:
```bash
helm install <service-name> <repo-name>/<service-name> --set auth.rootPassword=somepassword
```

### Using File:
```yaml
auth:
  rootPassword: "test1234"
```
```bash
helm install <service-name> <repo-name>/<service-name> --values <file-path>
```

## Helm Repository Management

- `helm repo add <repo-name> <repo-url>`
- `helm repo update`
- `helm search repo <keyword>`
- `helm install <release-name> <chart-name>`
- `helm list`
- `helm uninstall <release-name>`

## Helm Practical Installation

```bash
helm install mybitnami https://charts.bitnami.com
helm upgrade nginx
```

## Helm Charts Best Practices

- Parameterize frequently changed values using `values.yaml`
- Avoid hardcoding
- Use variables and templates

## Helm Installation Structure

1. `charts/`
2. `templates/`
3. `charts/` (dependency charts)
4. `values.yaml`
5. `readme.md`

### Chart.yaml Required Fields

```yaml
apiVersion: v2
name: mychart
version: 1.0.0
description: "This is a Helm chart for nginx"
appVersion: "1.16.0"
```

### templates Folder

- Manifest files like `deployment.yaml`, `service.yaml`
- `helpers.tpl` for reusable methods

### values.yaml Sample

```yaml
replicaCount: 2
image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: ""
imagePullSecrets: []
nameOverride: ""
serviceAccount:
  create: true
  name: ""
service:
  type: ClusterIP
  port: 80
```

## Helm Lint

```bash
helm lint .

```

Scans templates and outputs:
- Info
- Warnings
- Errors

## Helm Public Charts

Available from repositories like Artifactory Hub or Bitnami

## Useful `kubectl` Commands

```bash
kubectl get secrets
kubectl get events
kubectl config get-contexts
kubectl config use-context docker-desktop
```

## Common Helm Commands

```bash
helm list
helm uninstall <release-name>
helm install <release-name> <chart-name>
helm upgrade <release-name> <chart-name>
helm rollback <release-name>
helm history <release-name>
helm get values <release-name>
helm get values <release-name> --all
helm get manifest <release-name>
helm template --debug
helm install --dry-run --debug
helm install --set spec.nodePort=31240
helm install --values <filename>
helm package <chart-directory>
helm dependency update <chart-name>
```

## Helm Upgrade with Set Option

```bash
helm upgrade <release-name> <repo-name>/mychart --set image.tag=1.0.0
helm lint
helm history
helm rollback <release-name>
```
