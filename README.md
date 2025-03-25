# Azure Web App + SQL Server with Terraform

This project provisions an Azure Web App connected to an Azure SQL Database, fully automated with Terraform & Azure DevOps CI/CD.

## Features
1- Deploy an Azure Web App  
2- Provision an Azure SQL Server & Database  
3- Store Terraform state in Azure Storage Account  
4- Set up CI/CD with Azure DevOps Pipelines  

## Project Structure
```
azure-webapp-sql-terraform/
│── infra/                           # Infrastructure as Code (IaC) using Terraform
│── pipeline/                         # CI/CD pipeline configuration
│── README.md                          # Project documentation
```

## Deployment Steps
1. Clone the repository  
2. Set up your Terraform variables  
3. Run `terraform init`, `terraform plan`, and `terraform apply`  

## Developed with Terraform & Azure DevOps  
