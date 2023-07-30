# terraformpract"# terraform_packer" 


# Terraform on AWS

IaaC/IaC - Declare infra in HCL and execute to deploy it.

# Advantages of Terraform:

- HCL is simple to understand
- We can divide the infra into multiple tf files and execute.
- Terraform plan which is dry run gives good idea about with infra is going to get deployed.
- Terraform Workspaces for having identical environment.
- Terraform modules for reusable code.
-  terraform logic is cloud egnnostic but syntax changes.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

    Environment variables
    The terraform.tfvars file, if present.
    The terraform.tfvars.json file, if present.
    Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
    Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)


************************************Passing Environment Variables in Powershell*******************************

$env:AWS_ACCESS_KEY_ID=""
$env:AWS_SECRET_ACCESS_KEY=""

************************************Passing Environment Variables in Linux************************************

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""