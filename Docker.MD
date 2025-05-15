# 🐳 Docker Complete Notes

---

## 📌 What is Docker?

Docker is a **Containerization Platform** that packages your application and all its dependencies together in the form of containers to ensure that your app works seamlessly across environments — dev, QA, and prod.

- Docker is an open-source platform for building, shipping, and running distributed apps.
- With Docker, you can create lightweight, portable, and self-sufficient containers.

---

## 📄 What is a Dockerfile?

A `Dockerfile` is a **text file** that contains instructions to build a Docker image, including:

- OS base image
- Environment variables
- Application code locations
- Network ports
- Dependencies

---

## 📦 What is a Docker Image?

- A **Docker image** is a **read-only**, **immutable** template (like a snapshot).
- It contains:
  - Application binaries
  - Dependencies
  - Configuration files
  - Metadata for container runtime

### Key Points:
1. Cannot be run directly — it's just a blueprint.
2. Built using `docker build` with a Dockerfile.
3. Run with `docker run <image-name>`.
4. Can be pushed to Docker Hub or custom repos.
5. Stored in read-only layers, loosely coupled.
6. Cache stored in `/var/lib/docker`.

---

## 📦 What is a Docker Container?

A **Container** is a **runnable instance** of a Docker image.

### Features:

1. Platform-independent, lightweight.
2. Fully isolated — but can be networked.
3. Volatile — data lost unless volumes are used.
4. Configurable resource limits and isolation.
5. Containers are portable and self-describing.
6. Runtime environment for app, regardless of OS.

---

## 📚 Why Containers?

- Run anywhere (dev, test, prod)
- Encapsulate application and dependencies
- Lightweight & portable
- Self-contained

---

## 🆚 VM vs Container

| Feature            | Virtual Machines        | Containers               |
|--------------------|--------------------------|---------------------------|
| Virtualization     | Hardware-based           | OS-based                  |
| OS Requirement     | Full guest OS            | Minimal OS               |
| Security           | High                     | Moderate (can be secured)|
| Performance        | Heavy                    | Lightweight               |
| Portability        | Less                     | Highly portable           |

---

## ⚙️ Containerization Process

1. Write a `Dockerfile`
2. Build an image: `docker build -t <name> .`
3. Push image: `docker push`
4. Run container: `docker run -d <image>`

---

## 🔧 Run Container and Exec

``` docker run exec -it <container-name> ```

### How to Ensure that docker container start when the docker host restarts:
- 1: Using Restart policies in docker compose
    version: '3'
    services:
    your_service_name:
    image: your_image_name
    restart: always
- 2: Running the container using docker run -d --restart always -p 9090:8080 image-name/id

## What is Docker compose:
```
- 1: When we are having multiple containers to our project we can use docker compose where we can have volume mounts /networks
    version:
    network:
    name:
    volumes:
    name:
    services:
    volumes:
    networks

```
docker-compose up -d

## Difference between Image and Container:
```
image is read only
container is light weight portable
How to Configure Private Repository:
1: Create a Repository in
/etc/docker/daemon.json --> add the ip address/
```

### Types of Networks in Docker:
- 1: Bridge Network Default &
- 2: Host Network
- 3: Overlay Network 2
- 4: None Network
- 5: Macvlan Network

## **Networking** --> Communication between two hosts/devices over wired /wireless
```
Docker:
- Docker is Platform where it implements the Containerization
- Docker Networking is Communication between two docker containers
Docker Network:
There are two types of communication
1. Container 1
2. Container 2 
```

### How Containers will communicate with Host Systems:
- Docker will create one network called Virtual etho 0 that is docker0
- that will connect with the Host eth0 and makes the communication this is called bridge networking
- Virtual ethernet == Docker0.

### There are three Types of Networking in Docker Containers:
- Bridge Networking
- Host Networking
- OverLay Networking (Docker Swarm)

Host(eth0) --> Docker0 --> veth0 --> Docker(eth0)

**Host Networking:**
- Connecting all containers with host ip/eth0 networking.
- Securing Is more important in docker but host networking will not provide high security

**Custom Bridge networking:**
- Create Custom Virtual ETH0 To connect with host eth0 to implement complete isolation between two containers located in same docker engine and host

- Virtual Bridge == Bridge Networking

**Network Commands:** : Can do CRUD Operations:
```
docker network create secure-network
docker network ls
docker network inspect
docker network bridge
docker run -d --name finance --network=secure-network nginx:latest
```

**Why you need networking on Docker :**
- Docker networking enables a user to link a Docker container to as many networks as he/she requires.
- Docker Networks are used to provide complete isolation for Docker containers.

**Which Network Model is docker is following and give me some advantages :**
- Container network  model it is following
- The implementation of CNM specification by docker is called lib network

**How many types of blocks involved in docker lib network:**
- Networks : Software implementation of switch ,used for grouping and isolate the collection of endpoints
- Endpoints : Virtual Network Interfaces , used for Making the connections
- Sandboxes : Isolated Network Stack (Routing, Switching etc..)

**Disadvantages of Docker networking:**
```
we cannot able to create name for ip address for our server in docker Networking
Docker network commands:
docker network create
docker run -d --name mongodb --network=roboshop mongodb:v1
docker run -d --name mongodb --network=<networkname> <image-id>
```
**What is Bridge Networking:**
1: Bridge networking is the default networking mode in Docker. When you create a Docker container without specifying a network, it is connected to the default bridge network.

**Use Case:**
Suitable for standalone applications where containers need to communicate with each other on the same host.

**What is Host Networking:**
1: In host networking, a container shares the network namespace with the Docker host. The container bypasses Docker's network isolation and directly uses the host's network stack
Use Case:
Useful when performance is critical, and you want the container to have direct access to the host's network stack.
Note: It may compromise container isolation and security.

**What is Overlay Networking:**
```
1: Overlay networking used when we need to interact between the containers between multiple hosts

Use Case:
Ideal for applications that are distributed across multiple hosts in a Swarm cluster.
Provides a unified network view for services running on different hosts.

Scenarios:
Container with jenkins and new joine restarts the container and we cant see any data:

1: First Check the logs for container
2: Mount the jenkins directory to the Volumes var/jenkins_home directory to the Volumes to save the data
3: Ensure that permissions and ownership for that user to the directory where we mounted the jenkins data
4: Check the restart policy
5: Check the Configuration like env, ip address etc..
6: it might me using old/deprecated jenkins image
7: it might be causing due to recently added plugins
```
# Most of the times when we start the containers and it does not start correctly how to trouble shoot:
```
1: Check the docker logs: docker logs <container-id>
2: Check the container status: docker ps -a
3: Inspect Container configuration: docker inspect <container-id> # Like environment variables, volumes, and network configurations.
4: Check the resources constraints: docker stats <container-id> # Like CPU memory etc
5: Check the events: docker events
6: Verify the Docker version: docker --version
7: Check the Network setup: docker network inspect <container-id> # Networks Ip Address etc
8: Check the port conflicts: docker port <container-id> # Like Port Conflicts
9: Test with simple image: docker run hello-world
10: update the docker images: docker pull <image-name>
11: Check for Container Dependencies:
12: Recreate the container:
```
# How do you secure the docker containers:
```
1: Use the Official images:
2: Regularly update the images: docker pull <image_name>:<tag>
3: Minimize Container Size: Avoid adding unnecessary files to the container
4: Avoid Running as Root: USER nonrootuser
5: Use Docker Content Trust (DCT): export DOCKER_CONTENT_TRUST=1
6: Implement Resource Constraints: docker run --cpu-shares=512 --memory=512m -d <image_name>
7: Network Segmentation: docker network create my_network
8: Expose Only Necessary Ports:
9: Monitor Container Activity: Docker Bench
10: Limit Container Capabilities: --cap-drop=ALL --cap-add=NET_BIND_SERVICE
11: Use Docker Security Scanning Tools: Trivy
12: Limit Volume Mounts:
13: Apply SELinux/AppArmor Profiles:
14: Secure Docker Daemon:
15: Use Docker Secrets for Sensitive Data:
16: Regular Security Audits:
17: Educate Development Teams:
```
Performance, Scalability and Security

*Explain a Sample Docker file on each language:*
1: Js Application
2: Java application
3: Go Lang Application
4: Python
5: SpringBoot
6: C#
7: MySQL
8: MongoDB

*Can we launch Linux Containers on Windows and Vice Versa: No We cannot launch*

*What is OnBuild Instruction:*
The on build instruction adds to the image trigger instruction to be executed at a later time when the image is used as the base for another build

Commands executed on top of parent image is called OnBuild Instructions

Parent (UpStream Build Image)
Child (Down Stream Build Image)

**What is the use of Docker Ignore File:**
By Default we will set the directory as current .
The request will send to Docker daemon it will take all the files to remove all unwanted files we use docker ignore files

1: To remove all Zip/tar files
2: To remove all .git files
3: To remove .tf-vars etc..

**Docker Delete all the Stopped Containers:**
docker rm -f $(docker ps -a)
docker container prune

is it good to use docker compose in production: No it is not good

**How to Parameterize base image tag:**
```
using the ARG Instruction we can pass the OS Version
Parameterize the image version
Building Docker file in Large files directory good practice: No It is not a good practice
```
**Where pulled Image are stored:**
```
- /var/lib/docker/
Docker Image SHA:
- Full SHA256 code where we can get the image using HashCode
- it is also called Docker Dangling Image
- docker history <image-name>.
```

### ``` Architecture of Docker Images: `docker manifest inspect <image-name> ```

**Tagging an image:**
```
- docker tag
How to check the instructions that were used to build image:

- docker image history <image-name>
```
**Why Containers are Relatively Small:**
```
`Images don't contain kernel. They share and access the one used by the host on which they are running`
Virtualization --> Logical isolation of one physical systems into multiple systems
Image is Static and immutable
Container is Dynamic it can be runnable and mutable.
```
```
docker pull
docker create
docker start
docker run = pull + Create + Start
docker port forwarding
```
### Docker FROM: about tye os and version

## Docker RUN :
```
Run instruction will run at the time of image creation
It is used to install all packages required to build an image and run the container
```

## Docker CMD :
```
it is to run the container, it will run at image creation.
the instruction is used to RUN the container with given Instructions
Can be over ridden
```

## Docker EntryPoint:
```
This will fixed run time environment to the container
cannot be overridden
```

### LABEL :
```
Giving key value pairs to the docker file
labels are the key-value pairs that represents the tags for images not for the containers
images can be filtered based on the labels like
docker build -t <image-name> .
docker images --filter labels=key=value
docker inspect <image-id> --> This can inspect all the details about the images
```

**Standard input** : this is the file handle that your process reads to get information from you.

**Standard output** :  your process writes conventional output to this file handle.

**Standard error** : your process writes diagnostic output to this file handle.

## Expose  :
```
we can instruct the container builder to set the port for the container based on the expose instruction
EXPOSE 80/tcp
expose will not adding any functionalities this is just instruction for container builder
```

## ENV: Environment Variables
```
Configuration is supplied Through Environment Variables
we can add environment variables to the container
it is as same as Labels but env will be used in container but labels will used for filtering
```

## Docker Copy:
Copy The content from local to Image/conatiner
COPY /source/file/path  /destination/path

## Docker ADD :
```
This command will copy the content from local to image/container
This also copy the content from internet
This also copy the content by unzipping automatically
ADD /source/file/path  /destination/path
ADD http://source.file/url  /destination/path
```

## Docker CMD:
```
CMD ["executable","param1","param2"]
Docker save:
standard output
Save one or more images to a tar archive (streamed to STDOUT by default)
Docker Load:
Load an image from a tar archive
Docker Can be used in production
```

## Docker Stats: docker statistics used to To monitor cpu and memory the docker in production

## Docker Events: is used to monitor the eveents take place in the docker daemon

## Docker Compose: docker compose will always run in the dependency order
dependency :
depends_on
links
volumes_from

## Docker Cycle Management:
stop
pause
run

**Docker USER Instructions:**
```
With user instruction we can give the minimal previlages to the root access
After Creating the user, every instruction after user will be done in that user only.
```

**Docker WorkDirectory**:
```
Instead of cd command in normal linux we used work dir instruction to set the work directory where we should save the file
By default after work directory instruction every thing will run on that work dir.
```

**Docker Arg Commands**:
```
It will supply the variables at the build time but not supply at container run time
to supply arguments at run time we need to use it like
env var1=arg1
Arg can be used as a first instruction to supply the os version to from Instruction
docker build -t <name-of image> --build-arg version=9 .
```
```
ARG Vs ENV:
Arg: will work in only build time of image
ENV: will work on both at build time as well as RUN time
ARG name
ARG COURSE
```
```
ENV variable1 =${name: -hair }
ENV variable2 = ${COURSE: - ped }
```

```
docker build -t arg:v1 . --build-arg name=simple
--build-arg course=devops
```

**Docker OnBuild**:
```
On Build will work/execute/create at container run time not at image build time
We need to have file in our workspace while using the On build Instruction
```

Docker Is Easy Portable:
AMI --> Heavy Size, Full Operating System, Mutable, Immovable,
docker-compose up -d
docker-compose down -d

Data will be removed once the container is removed hence we need to store data somewhere there docker volumes will come into existence

Volumes : Docker Volumes
Docker is Ephemeral In nature
Databases --> RDBMS,NoSQL,Redis,MQ,MySQL
Docker has two types of Volumes:

1) Docker Named Volumes
2) Docker UnNamed Volumes

Volumes: -v <host-path>:<container-path>
Docker is storing temporary volumes in the directory -->/var/lib/docker/overlay2 --> temporary volumes
- CPU
- Memory
- Storage
- RAM

1: Bind Mounts:
2: Volumes:

UnNamed Volumes: (Bind Mounting/Bind Volume)
Create a Directory and map it with the docker containers to store data
We have to manage the directory
docker run -d -v <host_path>:<container_path> <image_name> /bin/bash

Named Volumes:
- Using Docker CLI we can Manage the volume and attach to Containers
- Mount Th volume to containers
- Docker Containers in same commands
- Volume mounts and Docker -v will do same

Docker Should manage these volumes
Everything is managed by docker commands
docker run -d -v <volume_name>:/data <image_name> /bin/bash

docker inspect <container-id> --.
docker volume inspect <container-id>
docker volumes ls --> list down all the volumes

StateFul Applications:
Mongodb
MySQL
Redis
RabbitMQ
docker run -p <host-port>:<container-port> -v <host volume path>:<container-volume-path> --name <container name>

Docker Compose File:
*****
volumes:
- source: rabbitmq
target: /var/lib/rabbitmq
type: volume
*****

Docker Best Practices:

1: Use Official Images
2: Pin Version (Specific Version Number)
3: Use DistroLess Images
4: Use Multi-Stage Build
5: Use Copy Command over ADD Instruction
6: Parameterize Everything (Use Args for parameters)
7: Set Workdir
8: Use Cache
9: Minimize the layers
10: Clean Up Cache
11: Avoid HardCoded Credentials (Use Environment Variables)
12: use Non-Root User (nonrootuser)
13: Specify The ports for Containers
14: USE Entrypoint to set the default process
15: Creating Named Volumes for each container and persist logs of each container to central logging system


### Docker Layers:
1: Order Matters in Caching
2: remove unnecessary dependencies --no-install-dependencies
3: remove package manager cache
2: Create Networking for each application
4: Try To reduce the memory using multistage building etc..
5: By Using Office Alpine images memory will be reduces to almost 100 percent
8: Use Docker Security Scanning
9: Export the environment variable as export DOCKER_CONTENT_TRUST=1
10: Reduce the layers in Docker files(Optimize Layers)
11: Use Trivy For Image Scanning
12: Use Dockle for Scanning the docker files
13: Keep The image size is low
14: don't run containers with root access use user command
15: Add only Relevant Files

**Docker Security Updates:**
1: Reduce the image size
2: Use multistage build
3: use Docker content trust=1
4: Regularly update the images
5: Implement the principle of least previlage
6: network segmentation
7: Runtime security
8: Secure Docker Daemon

use HadoLint to check the docker file and images securities

Container Vulnerability Scanning:
1: Docker Images / Containers are benifial in scaling,Portability,efficiency

How to Restrict Access From one container to another container in  same network:
1: Using Network Commands
2: Using Network Policies (1.18 or later)
3: Using Ip Tables Rules

Docker Architecture:
Docker CLI --> Where we write Docker Commands
Docker Daemon --> Where all The containers are managed using daemon
Docker HUB --> Where Docker Images are build and pushed for public use

Docker Layers:
Once we create the image we cannot change image
docker image is immutable and static in nature

Each Instruction in the Docker file is Called the Docker layer.

Each instruction will create one image and one mini container will create.

There is one component will be there to run and build everything that is docker engine

One layer will create one image and one container on top of each container the next instructions will be run when the instruction moves to next then previous mini container created by Docker Engine will be destroyed.


Docker is Located in :
/var/lib/docker/ : All information related to docker will be stored here
/opt/containerd/ : Is the place where container daemon is located
/lib/.systemd/docker.service : is the place docker service is located

**docker push :**
url/username/image-name:version
docker tag web:v1 docker-hub.io/hari9397/web-component:v1
"docker push docker-hub.io/hari9397/web-component:v1"

**docker commit:**
creates a new images to a running containers changes
if you have changed something in the running container then docker commit will add new changes and creates new images out of it

**docker history <image-name> :**
it will show the docker image histroy how many time the image got changed

**docker digest:**
Digest is content addressable identifier where it can filter the images based on the content even if it has the same name and tags

**docker manifest inspect <image-name> :**
client calls the image name
it will go the client then checks in the local if exits it will pull else it will go to the registry from there it will pulled
each manifest parsed layers will get ids
from that ids it will get pulled

**docker diff <containerid> :**
it will list down all the files added or copied to the container filesystem
registry configurations:
/etc/containers/registries.conf

**Docker Disadvantages:**
1: What will Happen if Docker Server is Down
2: What happens if you suddenly get more traffic
3: How to balance the load if you have multiple containers
4: Self Healing --> what happens when the correct resources are not reached
5: what about Secrets and Configs --> SSM Parameters are Stored
## Container Orchestration:

Orchestration means one person manages different individuals to complete tasks by giving instructions. When containers are running, we need to manage them.

- `docker run`: Creates a container from an image.
- **Image**: A static, immutable builder file (physical file).
- **Kubernetes**: Used for better networking, storage solutions, and security compared to Docker Swarm.

### How to monitor Docker in production:

- Using `docker stats`: Provides live container statistics.

### Is it a good practice to run Docker Compose in production?

- Yes, using Docker Compose in production is a practical application for managing multi-container applications.

### What is a namespace in Docker?

- Namespace is a Linux feature and a crucial concept for container isolation. It adds a layer of isolation within containers.
  1. PID (Process ID) namespaces
  2. Mount namespaces
  3. IPC (Inter-Process Communication) namespaces
  4. User namespaces
  5. Network namespaces
  6. Cgroup namespaces

### How to edit and update a container:

- `docker commit <container-id> <username/image-name>`: Creates a new image from a container's current state. You would then run a new container based on this modified image. Direct editing of a running container's filesystem for persistent changes is generally discouraged.

### `docker prune`:

- Used to delete unused images and stopped containers across all namespaces.

### Where is Docker being used?

1. Simplifying configuration
2. Code pipeline management
3. Developer Productivity
4. Application Isolation
5. Debugging Capabilities
6. Multi-Tenancy
7. Rapid Deployment

### Docker states:

1. create
2. start
3. pause
4. unpause
5. restarted
6. exited
7. dead

## 0. What is a Virtual Machine (VM)?

A Virtual Machine (VM) is a compute resource that uses software instead of a physical computer to run programs and deploy apps.

A virtual machine (VM) is a virtual environment that functions as a virtual computer system with its own CPU, memory, network interface, and storage, created on a physical hardware system (located off- or on-premises). Software called a hypervisor separates the machine’s resources from the hardware and provisions them appropriately so they can be used by the VM.

## 1. What is a hypervisor?

A hypervisor is a Virtual Machine Monitor (VMM). It's software that creates and runs virtual machines on one physical system, allowing one host computer to support multiple guest VMs by sharing resources such as memory and processing.

## 4. What is Bare Metal?

Bare Metal refers to a computer hard disk – the medium on which the operating system is installed.

A bare-metal environment is a specific kind of virtualization environment built with bare-metal hypervisors that do not rely on a host OS to function.

## 5. What is a bare metal hypervisor?

The virtualization software is directly installed on the platform where the real operating system would otherwise be installed.

Bare Metal Hypervisors are extremely secure since they are isolated from attack-prone operating systems.

## 6. What is Virtualization?

[https://www.geeksforgeeks.org/virtualization-cloud-computing-types/](https://www.geeksforgeeks.org/virtualization-cloud-computing-types/)

Virtualization is the separation of services from underlying physical services.

**Types of Virtualization:**
- Application Virtualization
- Network Virtualization
- Desktop Virtualization
- Storage Virtualization
- Server Virtualization
- Data virtualization

## % Containers vs Virtual Machines

**Virtual Machine:**
1. Hardware level Virtualization
2. Huge Maintenance Cost
3. Scalability is hard (But easy in cloud)
4. Better Resource Usage (Isolation)
5. Almost same as physical
6. VMs are not Portable

**Containers:**
1. OS Level Virtualization
2. No Maintenance Cost (of guest OS)
3. Easily Scalable
4. Dynamic resource Allocation
5. Take Very less time to initialize app
6. Containers are portable

**Key Differences:**

1. **Resource Utilization:** Containers share the host operating system kernel, making them lighter and faster than VMs. VMs have a full-fledged OS and hypervisor, making them more resource-intensive.

2. **Portability:** Containers are designed to be portable and can run on any system with a compatible host operating system. VMs are less portable as they need a compatible hypervisor to run.

3. **Security:** VMs provide a higher level of security as each VM has its own operating system and can be isolated from the host and other VMs. Containers provide less isolation, as they share the host operating system.

4. **Management:** Managing containers is typically easier than managing VMs, as containers are designed to be lightweight and fast-moving.

## 8. What are the files and folders available in containers base images?

- `/bin`: Contains binary executable files (e.g., `ls`, `cp`, `ps`).
- `/sbin`: Contains system binary executable files (e.g., `init`, `shutdown`).
- `/etc`: Contains configuration files for various system services.
- `/lib`: Contains library files used by the binary executables.
- `/usr`: Contains user-related files and utilities (applications, libraries, documentation).
- `/var`: Contains variable data (log files, spool files, temporary files).
- `/root`: The home directory of the root user.

## 9. Do Containers use host OS Files and folders?

Yes, containers interact with the host OS in several ways:

- **The host file system:** Docker containers can access the host file system using **bind mounts**, which allow the container to read and write files in specific directories on the host.
- **Networking stack:** The host's networking stack is used to provide network connectivity to the container. Docker containers can be connected to the host's network directly or through virtual networks.
- **System calls:** The host's kernel handles system calls from the container, which is how the container accesses the host's resources (CPU, memory, I/O).
- **Namespaces:** Docker containers use Linux namespaces to create isolated environments for the container's processes. Namespaces provide isolation for resources like the file system, process ID, and network.
- **Control groups (cgroups):** Docker containers use cgroups to limit and control the amount of resources (CPU, memory, I/O) that a container can access.

## 10. All About Docker GitHub repository:

[https://github.com/iam-veeramalla/Docker-Zero-to-Hero](https://github.com/iam-veeramalla/Docker-Zero-to-Hero)

## 11. What is the difference between `ENTRYPOINT` and `CMD`?

(This information was not provided in the initial text. You would need to add this explanation.)

## 12. What is a Dockerfile?

(This information was not provided in the initial text. You would need to add this explanation.)

## 13. Multi Stage Docker Builds

(This information was not provided in the initial text. You would need to add this explanation.)

## 14. Reduce Docker Image Size

(This information was not provided in the initial text. You would need to add this explanation.)

## 15. Distro Less Images

(This information was not provided in the initial text. You would need to add this explanation.)

## 16. Containers Security

(This information was not provided in the initial text. You would need to add this explanation.)

## 16. Interview Questions with Answers

(This section seems to be a heading for the following questions.)

## 17. Scenario Based Production Q & A

(This section seems to be a heading for potential scenario-based questions.)

## Docker Interview Questions:

- **What is Docker?**
  Docker is a platform for developing, shipping, and running applications in isolated environments called containers. Containers package up an application and all its dependencies, ensuring that it runs reliably across different computing environments.

- **How are Containers different from Virtual Machines?**
  (Answered in the "% Containers vs Virtual Machines" section above.)

- **Docker lifeCycle:**
  The typical Docker container lifecycle involves: creating the container from an image (`docker create` or `docker run`), starting the container (`docker start`), running the application within the container, potentially pausing and unpausing (`docker pause`, `docker unpause`), restarting (`docker restart`), stopping (`docker stop`), and finally removing the container (`docker rm`). The image itself is built from a Dockerfile (`docker build`) and can be stored in a registry (`docker push`, `docker pull`).

- **What is the difference Between `ENTRYPOINT` and `CMD`?**
  (This information was not provided in the initial text. You would need to add this explanation.)

- **Docker Networking types:**
  (This information was not provided in the initial text. You would need to add this explanation.)

- **Docker MultiStage Build:**
  (This information was not provided in the initial text. You would need to add this explanation.)

- **Docker labels vs ENV Instructions:**
  (This information was not provided in the initial text. You would need to add this explanation.)

- **Docker ADD vs COPY Instructions:**
  (This information was not provided in the initial text. You would need to add this explanation.)

## Docker Architecture or Docker Components:

- **Docker Client:** The command-line interface (CLI) tool used to interact with the Docker daemon.
- **Docker Host/Daemon (`dockerd`):** The background service running on the host machine that manages Docker objects (images, containers, networks, volumes). It listens for Docker API requests and manages Docker resources.
- **Docker Registry:** A service that stores Docker images (e.g., Docker Hub, private registries).

**Docker Host/Daemon Components:**

- `dockerd` (Docker Daemon/Server)
- **Volumes:** Persistent storage for containers.
- **Images:** Read-only templates used to create containers.
- **Containers:** Running instances of Docker images.
- **API:** The interface used by the Docker client to communicate with the Docker daemon.

1. Docker Client and Docker engine communicate using a REST API.
2. Client-Server Model.
3. It uses Unix or TCP Sockets for Communication.
4. When the client and server are on different machines, it uses TCP socket communication.

Automation can be done through programming (Python/Go) using the Docker REST API.

## Processes inside the VM & Docker:

- Any processes inside a VM cannot be directly accessed by the Host OS.
- Any process inside a Docker container can be observed and interacted with by the Docker host.

## What is A container Run Time Environment?

1. Container runtime is the software responsible for running and managing containers on a host system.
2. It interacts with the host OS kernel to start, stop, and delete containers.
3. Several container runtimes are available: Docker, containerd, CRI-O, rkt, dockershim, etc.
4. It follows standards set by the Open Container Initiative (OCI).
5. Docker's default runtime environment is `runc`, but Docker itself predates and doesn't strictly adhere to all OCI standards directly at the engine level. `containerd` is a core component that implements many OCI aspects.

## Docker Engine

Comprises the Docker server (daemon), client, and API. It also includes components for persistent storage, containerd, and networking.

1. The client sends commands to the Docker Daemon/Server using the REST API.
2. `dockerd` sends requests to `containerd`.
3. `containerd` sends requests to `runc` to perform low-level container operations.

**Command Flow:** `command` --> `client` --> `REST API` --> `dockerd` --> `containerd` --> `runc`

## Runc and Containerd:

1. `runc` is responsible for low-level tasks such as creating namespaces, cgroups, and other constructs that make up a container.
2. `containerd` acts as a supervisor for `runc`, managing the lifecycle of containers (pulling images, creating and starting containers, stopping, deleting, etc.). It manages `runc` to execute these tasks.

## Docker Command Syntax:

- `docker --help`: Displays general Docker command help.
- `docker system --help`: Provides a list of system-related subcommands.

**Important:** `/var/run/docker.sock`

- When connecting to Docker via a non-root user and both the client and daemon are on the same machine, it uses a Unix socket (`/var/run/docker.sock`).
- Permission denied errors occur for non-root users because the Unix socket is owned by the root user and the `docker` group.
- TCP sockets are used when the client and Docker engine are on different machines.

**To allow non-root users to run Docker commands:**

1. Add the user to the `docker` group:
```
   sudo usermod -aG docker <username>
```
























