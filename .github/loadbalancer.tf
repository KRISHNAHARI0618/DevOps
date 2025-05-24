terraform {
  required_providers {
    azurerm = { 
        version = "value"
        source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}

module "modulename1" {
    source = "aws::htpsdjsdk.wdwh"
}