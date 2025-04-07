# What is git:
  - Git is a Version Control System
  - Manage Source Code
  - Code Snapshots
  - Easy Roll Back
  - Distributed Mechanism
  - Source Code Management 

- ## Git Repositories
  - Local Repository
  - Staging Repository
  - Global Repository / Remote Repository
- ## Git Undo Commits Commands
  - git revert <commit id>
  - git reset --hard <commid id>
- ## Git Branches 
  - branches are like containers which contains commits
  - feature branches
- ** `rgb(9,105,218) Git Hub`**
  - Repositories

### Key Elements
- **Workflows**
  - 
- **Jobs**
  - 
- **Steps**
  - 
### Events Trigger : uses 'on' keyword 
- push
- workflow_dispatch
- pull_request
- create
- fork
- issues
- issues_comment
- watch
- release
- repository branch
- 

### Actions
- command run to trigger to run the tasks
- run - uses to run the commands in machine
- name : naming the task 
- uses: pulls the dependencies from actions repo
- needs : used to check the previous depends on jobs should finish 
- Expressions and metadata
- Context in git hub

### Sample Github Actions File:

```
name: First Pipeline
on: push
jobs:
  build-job:
    runs-on: ubuntu-latest
    steps:
      - name: checkout-code
        uses: actions/checkout@v3
      - name: set up node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Install Dependencies
        run: npm install
      - name: Run Build
        run: npm build
      - name: run tests
        run: npm test
```