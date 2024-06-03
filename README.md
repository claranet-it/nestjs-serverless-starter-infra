# Terraform Serverless Base Infrastructure
This repository contains the base infrastructure for a serverless application using Terraform. 

# Pre-requisites
- Terraform installed

# Usage

## Create state
- Change directory to `live/[stage]/tfstate`
- Customize `terraform.tfvars` file i
- Create the state by running the following commands:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
- Uncomment the resource `backend s3` from  `config.tf` 
- In order to change the state from local to S3, run the following commands:
    ```bash
    terraform init
    ```

## Create pipeline for serverless application
- Change directory to `live/[stage]/pipeline`
- Customize `terraform.tfvars` file
- Copy template file from `resources/example/[stack]`dir to `resources` dir (remove `.example` from the file name)
- Create the pipeline by running the following commands:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ``` 