# README – Terraform AWS EC2 Demo

## Objective

In this lab, you will use **Terraform** to create an **AWS EC2 instance**.

By the end of this exercise, you will learn how to:

* Configure AWS credentials
* Initialize a Terraform project
* Validate Terraform code
* Preview infrastructure changes
* Create an EC2 instance
* Verify the deployment
* Destroy the resources

---

# Prerequisites

Ensure the following are installed on your machine:

* Terraform
* AWS CLI
* VS Code (or any text editor)
* AWS Account with IAM User and Access Keys

Verify the installations:

```bash
terraform --version
```

```bash
aws --version
```

---

# Step 1: Configure AWS Credentials

Terraform uses the AWS CLI credentials to authenticate with AWS.

Run:

```bash
aws configure
```

Enter the following details when prompted:

```text
AWS Access Key ID:     <Your Access Key>
AWS Secret Access Key: <Your Secret Key>
Default region name:   us-east-1
Default output format: json
```

Verify the configuration:

```bash
aws sts get-caller-identity
```

If configured correctly, AWS returns your Account ID, User ID, and ARN.

---

# Step 2: Create a Project Folder

Create a new folder for this lab.

Example:

```text
terraform-aws-demo
```

Open the folder in VS Code.

---

# Step 3: Add the Provided Terraform File

Copy the provided **main.tf** file into the project folder.

Your folder should look like:

```text
terraform-aws-demo/
│
├── main.tf
```

---

# Step 4: Initialize Terraform

Initialize the Terraform working directory.

Run:

```bash
terraform init
```

Terraform will:

* Download the AWS provider
* Create the `.terraform` directory
* Create the provider lock file

Expected output:

```text
Terraform has been successfully initialized!
```

---

# Step 5: Validate the Configuration

Check whether the Terraform configuration is valid.

Run:

```bash
terraform validate
```

Expected output:

```text
Success! The configuration is valid.
```

---

# Step 6: Review the Execution Plan

Generate a preview of the infrastructure that Terraform will create.

Run:

```bash
terraform plan
```

Review the output carefully.

You should see something similar to:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

At this stage, **nothing has been created yet**.

---

# Step 7: Apply the Configuration

Create the infrastructure.

Run:

```bash
terraform apply
```

Terraform will ask for confirmation.

Type:

```text
yes
```

Terraform will now create the EC2 instance.

Expected output:

```text
Apply complete!
Resources: 1 added.
```

---

# Step 8: Verify the Deployment

Log in to the AWS Management Console.

Navigate to:

```text
EC2 → Instances
```

Verify that your EC2 instance has been created.

Check:

* Instance Name
* Instance State (Running)
* Instance Type
* Region

---

# Step 9: View the State File

After the deployment, notice that Terraform created a new file:

```text
terraform.tfstate
```

This file stores information about the resources Terraform manages.

Do **not** edit this file manually.

---

# Step 10: View the Current State

Run:

```bash
terraform show
```

This command displays all the resources managed by Terraform.

You can also list the managed resources:

```bash
terraform state list
```

---

# Step 11: Destroy the Infrastructure

To avoid unnecessary AWS charges, delete the EC2 instance after completing the lab.

Run:

```bash
terraform destroy
```

Terraform will ask for confirmation.

Type:

```text
yes
```

Expected output:

```text
Destroy complete!
Resources: 1 destroyed.
```

---

# Project Structure After Completion

```text
terraform-aws-demo/
│
├── main.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── .terraform/
└── .terraform.lock.hcl
```

---

# Terraform Commands Summary

| Command                | Purpose                                            |
| ---------------------- | -------------------------------------------------- |
| `terraform init`       | Initializes the project and downloads providers    |
| `terraform validate`   | Validates the Terraform configuration              |
| `terraform plan`       | Displays the execution plan without making changes |
| `terraform apply`      | Creates or updates infrastructure                  |
| `terraform show`       | Displays the current Terraform state               |
| `terraform state list` | Lists resources managed by Terraform               |
| `terraform destroy`    | Deletes all resources managed by Terraform         |

---

# Cleanup

⚠️ **Important:** Always run the following command at the end of the lab to avoid incurring AWS charges:

```bash
terraform destroy
```

---

# Expected Learning Outcomes

After completing this lab, you should be able to:

* Configure AWS credentials for Terraform.
* Understand the purpose of a Terraform configuration (`main.tf`).
* Initialize a Terraform project.
* Validate Terraform syntax.
* Preview infrastructure changes before deployment.
* Provision an AWS EC2 instance using Terraform.
* Understand the role of the Terraform state file.
* Safely remove infrastructure using `terraform destroy`.
