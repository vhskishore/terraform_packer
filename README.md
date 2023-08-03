# **_terraform_packer_**


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
- Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.) Example: terraform apply --var-file <our_own_tfvars_file localtesting.tfvars>


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

# Remove Terraform Resource from statefile
    terraform state rm <resource_name>

# Example
    terraform state rm aws_s3_bucket.packer

**_Now we can comment s3 bucket or we can remove s3 bucket code._**


# Error: Backend configuration changed

- A change in the backend configuration has been detected, which may require migrating existing state.
- If you wish to attempt automatic migration of the state, use **"terraform init -migrate-state"**
- If you wish to store the current configuration with no changes to the state, use **"terraform init -reconfigure""**

# Git issue

.terraform/providers/registry.terraform.io/hashicorp/aws/5.10.0/darwin_arm64/terraform-provider-aws_v5.10.0_x5 is 337.85 MB; this exceeds GitHub's file size limit of 100.00 MB

    git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'

#  Meta Arguments
    1) Prevent Destroy
    2) Create Before Destroy
    3) Ignore Changes (If any changes are done in console if we run terraform apply that resource work be changes it's state
        if ec2 is shutdown or tages are changed if we run terraform apply then instance will start and tags will changed as per script values. if we place ignore changes terraform won't change it's current state.)

# Terraform Workspaces

- in realtime uat and production are same then we can use terraform workspaces
- we want multiple identical environments with same resources
- and it stores statefile in different environment folder locations.

# Terraform Debug Mode

### Terraform exposes the TF_LOG environment variable for setting the level of logging verbosity, of which there are five:
- TRACE: the most elaborate verbosity, showd every step taken by terraform and products enormous outputs with internal logs.
- DEBUG: describes what happens internally in a more concise way compared to TRACE.
- ERROR: showd errors that prevent terraform from continuing
- EARN: logs warning, which may indicate misconfiguration or mistakes, but are not critical to execution.
- INFO: shows general, high-level messages about the execution process.

# Example
 - For setting logging in terraform, enable logging by using below commands
 - For Windows:
        SET TF_LOG=DEBUG/TRACE/ERROR/EARN
 - For Windows Powershell:
        $env:TF_LOG="DEBUG/TRACE/ERROR/EARN" , Get-ChildItem Env:,
        $env:TF_LOG_PATH="terraform.txt"
 - For Linux
        export TF_LOG=DEBUG/TRACE/ERROR/EARN
- To Remove assign empty values to TF_LOG variable