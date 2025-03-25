terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "RG-${var.ENVIRONMENT}-MANAGEMENT"
  location = var.LOCATION
}

resource "azurerm_storage_account" "main" {
  name                     = var.STORAGE_ACCOUNT_NAME
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "main" {
  name                         = var.SQLNAME
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "P@ssword1234!"
}

resource "azurerm_mssql_database" "main" {
  name        = "sqldb-${var.SQLNAME}"
  server_id   = azurerm_mssql_server.main.id
  sku_name    = var.DATABASE_SKU
  max_size_gb = 250
}

resource "azurerm_app_service_plan" "main" {
  name                = "appserviceplan-${var.ENVIRONMENT}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Windows"
  reserved            = false

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "webapp-${var.ENVIRONMENT}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    always_on = true
  }
}
