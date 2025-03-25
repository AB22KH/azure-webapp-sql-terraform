terraform {
  backend "azurerm" {
    resource_group_name   = "RG-STATE-MANAGEMENT"
    storage_account_name  = "tfstatestorageacct"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
