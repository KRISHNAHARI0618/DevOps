terraform {
  required_providers {
    azurerm = {
        version = "3.9.8"
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
    features {
      
    }
}
resource "azurerm_resource_group" "aks_rg" {
    name = "rg-cb-dsc-eus2"
    location = "eastus2"
  
}
resource "azurerm_kubernetes_cluster" "name" {
    name = "aks-cb-dsc-eus2"
    location = "eastus2"
    resource_group_name = azurerm_resource_group.aks_rg
    default_node_pool {
        name = "ubutnu-machine-1"
        vm_size = "Standard_D4as_v5"
        node_count = 1
    }
}
output "kubeconfig" {
  value = azurerm_kubernetes_cluster.name.kube_config_raw
}

output "client-Certificates" {
    value = azurerm_kubernetes_cluster.name.kube_config[0].client_certificates
    sensitive = true
}

