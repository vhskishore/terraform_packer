# terraform_packer" 


# Terraform on AWS

- IaaC/IaC - Declare infra in HCL and execute to deploy it.

# Advantages of Terraform:

- HCL is simple to understand
- We can divide the infra into multiple tf files and execute.
- Terraform plan which is dry run gives good idea about with infra is going to get deployed.
- Terraform Workspaces for having identical environment.
- Terraform modules for reusable code.
-  terraform logic is cloud egnnostic but syntax changes.
- Importing of resources which is created manually is easy

# Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

    - Environment variables
    - The terraform.tfvars file, if present.
    - The terraform.tfvars.json file, if present.
    - Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
    - Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)


**Passing Environment Variables in Powershell**

$env:AWS_ACCESS_KEY_ID=""

$env:AWS_SECRET_ACCESS_KEY=""

**Passing Environment Variables in Linux**

export AWS_ACCESS_KEY_ID=""

export AWS_SECRET_ACCESS_KEY=""

# Authentication and Configuration

- Parameters in the provider configuration (provider.tf access keys)
- Environment Variables
- Shared Configuration files 
- Shared Configuration files
- Container Credentials
- Instance Profile Credentials and region. (IAM Role)

# Rename Terraform Resources
    terraform state list

    terraform state mv <current_resource_name> <rename_resource_name>

    # Example:

    terraform state mv aws_s3_bucket.packer aws_s3_bucket.vhskpackertest

Error: Backend configuration changed
│ 
│ A change in the backend configuration has been detected, which may require migrating existing state.
│ 
│ If you wish to attempt automatic migration of the state, use "terraform init -migrate-state".
│ If you wish to store the current configuration with no changes to the state, use "terraform init -reconfigure".
╵