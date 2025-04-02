# Jenkins Interview Questions

## What is Jenkins?
- Jenkins is a self-contained, open-source automation server used to automate tasks related to building, testing, and deploying software.
- It is written in Java and features a large number of built-in plugins that make it highly extensible for continuous integration.

## Define the Process of Jenkins:
1. Commit Changes
2. Detect Source Code Changes
3. Build Execution (Pass or Fail)
4. Generate Feedback

## Benefits of Jenkins:
1. Cache Build Failures
2. Automatic Build Report Notification
3. Achieves Continuous Integration
4. Automation of Maven Projects
5. Easy Tracking of Bugs
6. Version Control
7. Reusability
8. Parallel Execution
9. Visualization
10. Shared Libraries
11. Secrets Management
12. Multiple Agents
13. Open Source
14. Multi-Branch Support

## Pre-Requisites & Main Components Integrated with Jenkins:
- Java and Git

## What is Maven? Benefit of Integrating with Jenkins:
- Maven is a build management tool.
- Integration with Jenkins allows for automated building, testing, and deployment of Maven projects.

## How will you Define Post Section in Jenkins?

### Post Section:
- The Post section contains additional steps that execute after the completion of the pipeline.
- Examples include cleaning the workspace, mailing users based on results, and defining actions for different pipeline outcomes such as success, failure, or abortion.

## How to Define Parameters in Jenkins:
- Parameters are key-value pairs used to support various use cases in Jenkins pipelines.
- Parameters can be defined in the parameters section of the Jenkins pipeline script.
- Different parameter types include:
    - 1. String
    - 2. Password
    - 3. Boolean
    - 4. Text
    - 5. Choice

Example:
*Groovy*
parameters {
    string(name: 'hari', defaultValue: 'hari_vardhan', description: 'Hello To everyone')
}

# Jenkins Interview Questions

## How Does Jenkins Authenticate Users?
Jenkins can authenticate users using various methods:
1. IAM Role
2. Matrix-Based Access Control
3. Username and Password
4. Role-Based Access Control
5. Project-Based Security

## Name the Environment Variable Used in Shell Script:
Some commonly used environment variables in Jenkins shell scripts include:
- $JOB_NAME
- $NODE_NAME
- $WORKSPACE
- $BUILD_URL
- $JENKINS_URL
- $BUILD_ID
- $git_commit

## What is DSL Jenkins?
DSL (Domain Specific Language) in Jenkins refers to the Jenkins plugin that allows defining Jenkins jobs using a Groovy-based scripting language. It provides a programmatic way to create, configure, and manage Jenkins jobs.

## What are Active and Reactive Parameters or Dynamic Parameters in Jenkins?
Active and reactive parameters in Jenkins refer to dynamically changing parameters in the "Build with Parameters" section of a Jenkins pipeline job. These parameters update based on the selection made in other dropdowns.
To implement active and reactive parameters:
1. Install the Active Choices plugin.
2. Configure the job and add active choice parameters.
3. Use Groovy scripts to define the choices and dependencies between parameters.

## What is Groovy?
Groovy is a dynamic scripting language that runs on the Java Virtual Machine (JVM). It is the native scripting language used for Jenkins pipeline scripting and job configuration.

## How to Clone a Repository?
To clone a repository in Jenkins, you need to configure Git with your username and email:
git config --global user.name "hari"
git config --global user.email "mail-id"

# How to Create a Backup and copy files in Jenkins:
- To create a backup of jenkins you need to do periodically backup your jenkins_home directory
- Thin Back Plugin (Manually Triggered)
- Cron Tab / Shell Script (Cron Job particular time)
- Create a Snapshots in Cloud Providers
- (Every Time stopping or when server us not responding )

*Monitoring and Logging with Prometheus and Grafana:*
- Jenkins Prometheus Plugin expose an endpoint (default /prometheus/) with metrics where a Prometheus Server can scrape.

### How to Secure Jenkins Server:
- 1: Authentication
- 2: Authorization
- 3: Security Realms
- 4: Role Based Access Controls
- 5: Run Periodically Security Runs

### How can you deploy a custom build of a core plugin:
- 1: Stop Jenkins
- 2: Copy the custom HPI to Jenkins Home/plugins
- 3: Delete the previously Expanded plugin directory
- 4: Make an Empty file called plugin.hpi.pinned
- 5: restart jenkins

### How to Store Secrets in Jenkins:
- using Hashi-Corp Vault
- using global variables
- using credentials sections
- secret file
- secret text
- github app
- username with password
- ssh with private key etc...

### How many ways we Scheduled a Build in Jenkins:
- 1: Build after other projects are built
- 2: Build periodically
- 3: Generic Webhook Trigger
- 4: GitHub Branches
- 5: GitHub Pull Requests
- 6: GitHub hook trigger for GITScm polling
- 7: Monitor Docker Hub/Registry for image changes
- 8: Poll SCM
- 9: Quiet period
- 10: Trigger builds remotely (e.g., from scripts)

### What is a Trigger:
*Triggers are used to define when and hoe pipelines should be executed*

**Restart From Stage:**

*How to Set jenkins build to fail based specific word in console output:*
pipeline{
    agent{
        docker{
            image 'openjdk:11'
        }
    }
    stages{
        stage("build"){
            sh 'chmod +x gradlew'
            sh './gradlew build | tee output.log'

        }
        stage("Check") {
            sh '! grep "task" output.log'
        }
    }
}

**Can you provide an example of a time when you troubleshooted and optimized a CI-CD pipeline?**
What steps did you take and what was the outcome:

### 1: Issue : The pipeline has slow build process

## What are all files required for NodeJs Image Build:
- Index.js
- Package.json
- web files
- In index.js we configure port number
- in package.json file we define what file should run

### How to Customize the build number display to something else in jenkins job page:
- Using env Variables in Jenkins we can customize
- env variable--> Current Build --> Display Name
- currentBuild.displayName="Final Demo # "+ currentBuild.Number

### What are Multi Branch Pipeline:
- There are Multiple Branches n One organization for one application we create a jenkins file for each file
- configure it to Jenkins multi branch pipeline then automatically creates a job for each branch if Jenkins file is not present it will skip that branch
- It enable you to implement different jenkins files for different branches of the same project

### Create a Multi-Branch pipeline in jenkins ui
- Automatic Branch Detection
- Automatic Job Creation
- Isolation of Builds
- Dynamic and Scalable
- Configuration in Jenkinsfile

### Advantages:
- 1: Automatic Branch Management
- 2: Continuous Integration
- 3: Isolation
- 4: Visibility

### Types of Projects/Jobs:
- 1: Freestyle
- 2: Multibranch Pipeline
- 3: Pipeline
- 4: External Job
- 5: Organization
- 6: Multi configuration

### Jenkins File :
- it is also called as pipeline as a code
  - 1: Versioned
  - 2: Code stored in source repository
  - 3: it is code written in groovy language

### What are Shared Libraries:
- when some lines of code is repeated all the pipelines/jenkins file for multiple pipelines we can centralize that line of code into shared libraries Refer when it is required
  - 1: Configure Systems
  - 2: Global Shared Libraries
  - 3: Give the git where Library is present
  - 4: def call()
  - 5: @Library('Shared Library Name')

### Types Of Shared Libraries
  - Resources:
  - Handlers:
  - Vars:
*def call('')*
*@Library('Library Name')*

###What Type of Jenkins File you worked on:
- 1: FreeStyle
- 2: Pipeline --> Declarative,Scriptive

In Master Slave Setup:
agent{label 'my-label'}

Importance of Secrets:
Global Credentials
Secret text

Difference Between FreeStyle and Pipeline

###  Most Common Plugins Used in Jenkins:
- **Maven**
- **Sonar Scanner**
- **Nexus**
- **Kubernetes**
- **Dockers**
- **Hashi-Corp Vault**
- **Github**
- **Git-Hooks**
- **SSH Credentials**
- **OWASP Dependency Plugin**
- **envinject**
- **ssh-agent**
- **CloudBees**
- **Publish Over SSH**
- **SSH Server**
- **Rebuilder**
- **GitHub Webhook**
- **Active Choices Plugin**

### How to distribute jenkins pipeline using jenkins
- Using Agents Sections in that Node Section

### What is Agent:
- Agent Is a Machine where our jobs can run
- we can use same jenkins server as a agent

## What is artifactory :
- Where we store all the jar and war files stored

### Parallel Stages in jenkins pipeline:
For Testing on multiple OS systems we will use Parallel Sections/Block
1: One will run in windows agent
2: Another will run on Linux Systems

### Explain Complete CI-CD Setup In your Project:
*From*: GitHub
*To*: Kubernetes
**Stages**
- 1: Git Checkout
- 2: Continuous Integration
- 3: Build and Unit Text
- 4: Code Scanning - SonarQube
- 5: Build Artifacts - Code Scan
- 6: Image Building
- 7: Image Scanning
- 8: Image Push

**Build Tools**:
- NpM for Node
- Maven for Java
- PyBuilder for Python
- Go mod For go lang

***Helm Repository Updates in different GitHub Repo***
***5: Deploy in Kubernetes***

MultiBranch pipeline we use choice parameters

### TroubleShooting Jenkins Servers:

**OutOfMemory Issues:**
- 1: Jenkins id growing in data size requiring a bigger heap space in this case you just want to give it a bigger heap
- 2: If the jenkins are generating large amount of data
- 3: OutOfMemoryError: Your Jenkins may encounter out of memory issue due to installing heavy plugins etc..
- 4: One time we got issue with out of memory when we created the machine with less memory then the jobs got not executed due to java

cmd ["java", "-Xmx2048m", "-Xms512m", "-jar", "jenkins.war"]
Xmx == Maximum heap size 2048m
Xms == Initial Heap size 512m
Java Can take more memory when we are not building the application based on variable and objects class will not take memory

**Docker Agent is not configured in Jenkins:**
- 1: i have not added jenkins user in docker group then i have faced issue while building image

### Jenkins Issues
- 1: Job Failures: Issue in build jobs or pipelines are failing
- 2: Performance Issues:
- Jenkins is slow or unresponsive.
- 3: Node Connectivity: SSH and Egress is not allowed
- Nodes (build agents) are not connecting or going offline.
- 4: Plugin Compatibility: Plugins are not working or causing issues.
- 5: Authentication and Authorization: Users are unable to log in or encounter permission issues.
- 6: Build Environment Issues: Builds are failing due to missing dependencies or incorrect environment settings.
- 7: Jenkins Upgrade Issues: Problems arise after upgrading Jenkins.
- 8: Disk Space Issues: Jenkins is running out of disk space.
- 9: Logging and Debugging: Unable to identify the root cause of a problem.
- 10: Security Vulnerabilities: Security vulnerabilities are identified in Jenkins.

