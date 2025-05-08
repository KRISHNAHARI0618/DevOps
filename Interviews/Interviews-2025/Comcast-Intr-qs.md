
# Comcast Interview Questions and Answers

---

### 1. Write a Script to Check Disk Usage and Send an Email Alert if It Exceeds 90%

**Answer:**
```
#!/bin/bash
THRESHOLD=90
EMAIL="admin@example.com"

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
  partition=$(echo $output | awk '{ print $2 }')
  if [ $usage -ge $THRESHOLD ]; then
    echo "Disk space alert: $partition is at ${usage}% usage" | mail -s "Disk Alert: $partition" $EMAIL
  fi
done
```

---

### 2. Terraform Script to Create EC2 Instance, VPC, Security Group, Key Pair, etc.

**Answer:**
You are expected to write Terraform code for:
- VPC
- Subnets
- Internet Gateway
- Route Table
- Security Group
- Key Pair
- EC2 Instance

> Let me know if you need a sample code block.

---

### 3. When You Want to Delete Particular Resource Without Using `terraform destroy`

**Answer:**
```
terraform destroy --target="aws_security_group.sg_name"
```

Alternative:
```
terraform taint aws_security_group.sg_name
terraform apply
```

Or using:
```
lifecycle {
  create_before_destroy = true
}
```

---

### 4. Why Did You Use the `depends_on` Method?

**Answer:**
```
depends_on = [aws_vpc.main]
```

Used when one resource depends on the creation of another resource explicitly.

---

### 5. Kubernetes Deployment Files Including Liveness and Readiness Probes

**Answer:**
```
livenessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 15
  periodSeconds: 20

readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 10
```

---

### 6. What is Kubernetes and Its Architecture?

**Answer:**
- Kubernetes is an open-source container orchestration platform.
- **Architecture Includes:**
  - **Master Node Components:** API Server, Controller Manager, Scheduler, etcd.
  - **Worker Node Components:** kubelet, kube-proxy, container runtime.
  - **Key Objects:** Pod, Deployment, ReplicaSet, Service.

---

### 7. What is the Use of Kubelet?

**Answer:**
- Kubelet is an agent that runs on each worker node.
- Ensures containers described in the PodSpecs are running and healthy.
- Communicates with the Kubernetes API server.

---

### 8. Have You Set Up the Kubernetes End-to-End Server?

**Answer:**
Yes. Involves:
- Creating cluster with tools like kubeadm, kops, EKS.
- Configuring networking (e.g., Calico).
- Deploying apps with Helm.
- Setting up monitoring and logging.

---

### 9. Explain Ansible Roles

**Answer:**
- A role is a way of organizing playbooks and related files.
- Structure:
  - `tasks/`
  - `handlers/`
  - `defaults/`
  - `vars/`
  - `templates/`
  - `files/`
  - `meta/`

Enables modular and reusable Ansible code.

---

### 10. What is `ansible.cfg` and What Is Stored in It?

**Answer:**
```
[defaults]
inventory = ./hosts
remote_user = ec2-user
forks = 5
host_key_checking = False

- Configuration settings for Ansible.
- Contains inventory, user, forks, variable settings, etc.
```
---

### 11. Is `become: true` and `become: yes` the Same?

**Answer:**
Yes, both are equivalent in Ansible. Used for privilege escalation (like `sudo` access).

---
