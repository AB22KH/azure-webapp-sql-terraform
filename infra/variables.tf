variable "ENVIRONMENT" {
  description = "Deployment environment (e.g., DEV, STAGING, PROD)"
  type        = string
}

variable "LOCATION" {
  description = "Azure region for deployment."
  type        = string
}

variable "STORAGE_ACCOUNT_NAME" {
  description = "Name of the storage account"
  type        = string
}

variable "SQLNAME" {
  description = "SQL Server name"
  type        = string
}

variable "DATABASE_SKU" {
  description = "Database SKU (e.g., S10, S20)"
  type        = string
}
