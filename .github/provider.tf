terraform {
  required_providers {
    azurerm ={
        version = "3.9.8"
        source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    storage_account_name = ""
    container_name = "value"
  }
}
provider "azurerm" {
    features { }
}

resource "azurerm_resource_group" "name" {
  location = "eastus2"
  name = "rg-cbu-lbu-idea"
}

resource "azurerm_virtual_network" "MY_vnet" {
    address_space = [ "10.0.0.0/16" ]
    resource_group_name = azurerm_resource_group.name
    name = "peddireddy"
    location = "eastus2"
}

resource "azurerm_subnet" "subnetname" {
    resource_group_name = azurerm_resource_group.name
    virtual_network_name = azurerm_virtual_network.MY_vnet
    name = "peddireddy"
    address_prefixes = [ "10.0.1.0/24" ]
}

resource "azurerm_network_interface" "nic" {
    name = "Peddireddy_NIC"
    location = "eastus2"
    resource_group_name = azurerm_resource_group.name

    ip_configuration {
      subnet_id = azurerm_subnet.subnetname.id
      private_ip_address_allocation = "Dynamic"
      name = "internal"

    }
}
resource "azurerm_linux_virtual_machine" "MyVm" {
    name = "My_new_image"
    location = "eastus2"
    resource_group_name = azurerm_resource_group.name
    os_disk {
        storage_account_type = "haha"
        caching = true
    }
    network_interface_ids = azurerm_network_interface.nic
    admin_username = abs("peddireddy")

    admin_ssh_key {
        username = "peddireddy"
         public_key = file("/path/to/privatekey")
    
    }
    source_image_reference {
        version = "ajd"
        offer = "sdlsd"
        publisher = "peddireddy"
        sku = "devops-learning"
    }
    size = "12"
}

