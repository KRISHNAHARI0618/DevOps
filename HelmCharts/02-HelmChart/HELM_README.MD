## **Helm Architecture**
- Helm will interact with Kube-Api Server
- helm install 
- helm delete
- helm install -a

## Helm Commands:
- helm create
- helm install
- helm rollback
- helm upgrade
- helm lint --> Checks miss Configuration and errors
- helm plugin
- helm list
- helm install --set key=value,key=value2 --values filename.yaml
- helm install --dry-run 
- helm install --debug --dry-run helloworld
- kube-api-server will validate and verify 
- helm template --> Does not interact with Kube-Api server

## HelmFile Sync:
- helmfile sync -- it will run commands under the hood its just a helm file
```
releases:
  - name: helloworld
    chart: ./helloworld
    installed: true
```
## Helm Charts 
- Charts.yaml
- Values.yaml
- Templates/
  - Deployment.yaml
  - Service.Yaml
  - _helper.yaml

## Chart.yaml
- apiVersion: The chart API version (required)
- name: The name of the chart (required)
- version: A SemVer 2 version (required)
- dependencies: # A list of the chart requirements (optional)
  - name: The name of the chart (nginx)
    version: The version of the chart ("1.2.3")