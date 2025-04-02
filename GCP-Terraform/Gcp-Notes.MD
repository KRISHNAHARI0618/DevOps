Infrastructure as a Code:
- Using the code we will create a Infra in just a some time
- Pay as you Go and use that service
- Hashi-Corp Configuration Language
- Terraform its a multi-cloud supports
- Popular tool for Infra Provisioning
- Terraform Has multiple cloud providers
- terrafrom has 3 tries for providers --> Official--> Managed By Hashi-Corp, Parter -> By Both Hashi& Company Community
- terraform is idempotent
- GCP --> Cloud native infra providers --> Deployment Manager
- Terraform is a Cloud Agnostic

Terraform + Google Cloud
- terraform workflow
    - Scope
    - Author
    - initialize
    - plan
    - apply
    - destroy
- Block
- Resource Type 
- Resource Name
- Arguments
- 

Terraform Commands
- terraform --version
- terraform state
- terraform init --> downloads the providers
- terraform plan
- terraform apply --> apply the actual changes 
- terraform state list

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  modules       Show all declared modules in a working directory
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Execute integration tests for Terraform modules
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.

- Terraform apply --help
Usage: terraform [global options] apply [options] [PLAN]

  Creates or updates infrastructure according to Terraform configuration
  files in the current directory.

  By default, Terraform will generate a new plan and present it for your
  approval before taking any action. You can optionally provide a plan
  file created by a previous call to "terraform plan", in which case
  Terraform will take the actions described in that plan without any
  confirmation prompt.

Options:

  -auto-approve --> Skip interactive approval of plan before applying.

  -backup=path           Path to backup the existing state file before
                         modifying. Defaults to the "-state-out" path with
                         ".backup" extension. Set to "-" to disable backup.

  -compact-warnings      If Terraform produces any warnings that are not
                         accompanied by errors, show them in a more compact
                         form that includes only the summary messages.

  -destroy               Destroy Terraform-managed infrastructure.
                         The command "terraform destroy" is a convenience alias
                         for this option.

  -lock=false            Don't hold a state lock during the operation. This is
                         dangerous if others might concurrently run commands
                         against the same workspace.

  -lock-timeout=0s       Duration to retry a state lock.

  -input=true            Ask for input for variables if not directly set.

  -no-color              If specified, output won't contain any color.

  -parallelism=n         Limit the number of parallel resource operations.
                         Defaults to 10.

  -state=path            Path to read and save state (unless state-out
                         is specified). Defaults to "terraform.tfstate".

  -state-out=path        Path to write state to that is different than
                         "-state". This can be used to preserve the old
                         state.
                         
  -var 'foo=bar'         Set a value for one of the input variables in the root
                         module of the configuration. Use this option more than
                         once to set more than one variable.

  -var-file=filename     Load variable values from the given file, in addition
                         to the default files terraform.tfvars and *.auto.tfvars.
                         Use this option more than once to include more than one
                         variables file.


#### Types of Variables:
- string
- number
- map(key:value)
- tuple (non homogeneous data)
- list(homogeneous data)
- set unique values should be passed
- object to create a own type
- bool sets true or false

#### Sequence of Variables
- Environment Varibales will be first
- Tf Vars file will apply next
- variable.auto.tfvars file 
- terraform apply -var "filename=sample.txt"
- module varibale 
- file variables

### Dependency :
- Implicitly
- Explicitly

#### Life Cycle Rules/Roles
- it is a meta arguments
- create_before_destroy
- prevent_destroy
- ignore_changes
- replace_trigger_by

#### Meta Data
- Depends_On
- count
- forEach
- dynamic Block
- provider
- lifecycle
  - create_before_destroy
  - ignore_changes
  - prevent_destroy
  - replace_triggered_by
- Custom Conditions
  - Pre Condition
  - Post Condition

#### Gcloud Commands to Login

- gcloud auth login `to log in to cloud account`
- gcloud auth application-default login `To Log Into all Applications/API's via CLI`
- 

#### Git Hub Actions for GCP:
- https://github.com/google-github-actions/auth/tree/main


#### Google Cloud Storage 
- Its a storage account where we can store anything we want
- we can save data based on our use
  - Standard: for daily use (front end files)
  - Nearline : for monthly use 
  - Coldline : for Quarterly Use
  - Archive : for yearly use
- We can protect data based :
  - Soft delete policy: Default
  - Object versioning: Disabled
  - Bucket retention policy: Disabled
  - Object retention: Disabled
  - Encryption type: Google-managed

- By default it will come like not accesible via pulic we need to enable to use it 

#### To Create VPC:
- 1:
  - vpc name
  - vpc description
  - maximum transmission unit
- 2: 
  - configure network profilfe
  - zone 
  - network profile

