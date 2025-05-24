## Azure Pipelines :

### Trigger:
1. A trigger tells a pipeline to run.

### Pipeline:
1. A pipeline is made up of one or more stages. 
2. A pipeline can deploy to one or more environments.

### Stages:
1. A stage is a way of organizing jobs in a pipeline and each stage can have one or more jobs.
   
### Job 
1. Each job runs on one agent. 
2. A job can also be agentless.

### Agent :
1. Each agent runs a job that contains one or more steps.

### Steps:
1. A step can be a task or script and is the smallest building block of a pipeline.

### Task
1. A task is a prepackaged script that performs an action, such as invoking a REST API or publishing a build artifact.

### Artifact:
1. An artifact is a collection of files or packages published by a run.

### Variables:
1. When you want to pass any secrets or parameters to pipeline
   
### Loops:
1. When you want to run particular steps or jobs multiple times
   

### Structure for Jobs
Pipeline
├── Stages
│   ├── Stage
│   │   ├── Jobs
│   │   │   ├── Job
│   │   │   │   ├── Steps
│   │   │   │   │   ├── Task
│   │   │   │   │   │   └── Inputs
│   │   │   │   │   └── Script (alternative step)
