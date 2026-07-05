# Terraform Variables Demo

## Objective

The objective of this demo is to understand how Terraform Variables work and why they are used to make Infrastructure as Code reusable, configurable, and environment-independent.

Instead of hardcoding values such as the AWS region, AMI ID, instance type, or resource names, we will store them in variables and supply values using different methods.

---

# Project Structure

```text
terraform-variables-demo/
│
├── main.tf          # Infrastructure definition
├── variables.tf     # Variable declarations
├── outputs.tf       # Output values
├── terraform.tfvars # Variable values
└── README.md
```

---

# Prerequisites

* Terraform installed
* AWS CLI installed
* AWS credentials configured
* IAM user with EC2 permissions

Verify installation:

```bash
terraform --version
aws --version
```

Verify AWS authentication:

```bash
aws sts get-caller-identity
```

---

# Files Used

## main.tf

Contains the infrastructure definition.

Uses variables instead of hardcoded values.

Example:

* AWS Region
* AMI ID
* EC2 Instance Type
* Instance Name
* Environment

---

## variables.tf

Declares all variables used by Terraform.

Each variable includes:

* Name
* Description
* Data Type
* Default Value

Example:

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
```

---

## terraform.tfvars

Contains actual values for variables.

Example:

```hcl
aws_region    = "us-east-1"
ami_id        = "ami-053b0d53c279acc90"
instance_type = "t2.micro"
instance_name = "TerraformDemo"
environment   = "dev"
```

Terraform automatically loads this file.

---

## outputs.tf

Displays useful information after deployment.

Example outputs:

* Instance ID
* Public IP Address

---

# Demo Steps

## Step 1: Initialize Terraform

```bash
terraform init
```

Purpose:

* Downloads the AWS provider
* Creates the `.terraform` directory
* Initializes the working directory

Expected Output:

```
Terraform has been successfully initialized!
```

---

## Step 2: Format Configuration

```bash
terraform fmt
```

Purpose:

* Formats Terraform files
* Improves readability
* Maintains consistent coding style

---

## Step 3: Validate Configuration

```bash
terraform validate
```

Purpose:

* Checks syntax
* Verifies references
* Does not create any resources

Expected Output:

```
Success! The configuration is valid.
```

---

## Step 4: Preview Infrastructure

```bash
terraform plan
```

Purpose:

Shows what Terraform intends to create without making any changes.

Expected Output:

```
+ aws_instance.web will be created
```

---

## Step 5: Deploy Infrastructure

```bash
terraform apply
```

Type:

```
yes
```

Terraform creates the EC2 instance.

---

## Step 6: View Outputs

```bash
terraform output
```

Example:

```
instance_id = i-0123456789abcdef0

public_ip = 54.xxx.xxx.xxx
```

---

# Different Ways to Provide Variable Values

## Method 1 – Default Values

Defined inside `variables.tf`.

No additional input required.

---

## Method 2 – terraform.tfvars

Terraform automatically reads values from this file.

```bash
terraform apply
```

No extra parameters required.

---

## Method 3 – Command Line

Override a variable during execution.

```bash
terraform apply \
-var="instance_type=t3.micro" \
-var="instance_name=DemoCLI"
```

Highest priority for that execution.

---

## Method 4 – Environment Variables

Linux/macOS:

```bash
export TF_VAR_instance_name="DemoEnvironment"
```

Windows PowerShell:

```powershell
$env:TF_VAR_instance_name="DemoEnvironment"
```

Terraform automatically reads environment variables beginning with `TF_VAR_`.

---

# Variable Precedence

Terraform resolves variable values in the following order (highest priority first):

1. Command-line (`-var`)
2. Environment Variables (`TF_VAR_*`)
3. `terraform.tfvars`
4. Default values in `variables.tf`

Example:

Default:

```
t2.micro
```

`terraform.tfvars`:

```
t3.micro
```

Command line:

```
-var="instance_type=t3.large"
```

Terraform uses:

```
t3.large
```

---

# Why Use Variables?

Without Variables:

```hcl
instance_type = "t2.micro"
```

Changing environments requires editing source code.

With Variables:

```hcl
instance_type = var.instance_type
```

Only the variable value changes.

The same Terraform code can be reused across Development, QA, and Production.

---

# Advantages

* Eliminates hardcoded values
* Promotes reusable code
* Simplifies environment management
* Improves maintainability
* Supports automation and CI/CD pipelines

---

# Clean Up Resources

Delete the created infrastructure:

```bash
terraform destroy
```

Confirm:

```
yes
```

Terraform removes all resources created during the demo.

---

# Learning Outcome

By the end of this demo, you will understand:

* What Terraform Variables are
* Why variables are important
* How to declare variables
* Different variable data types
* How to use variables in Terraform resources
* Multiple ways to assign variable values
* Variable precedence
* How outputs display useful resource information
* Basic Terraform workflow using variables

This forms the foundation for writing reusable, scalable, and production-ready Terraform configurations.
