How to Migrate the already available resources in terraform ?
    Terraform import will help to import all the resources from already available to iac code

first write Provider block and then write the import block
    provider "aws"{}
    import {id = "id of resource",to = "name of resoucefile" }

run the commands one by one"
    1) terrafrom init
    2) terraform plan -generate-cofig-out="terraform file name"
    3) terraform plan 
    4) if someone changes the configuration in backend the use terraform refresh command
    5) Terraform refresh command will help us to create resource well
