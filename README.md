# Terraform Workflow

This guide provides the workflow for using Terraform to manage your infrastructure across different environments (e.g., dev, QA, and prod). Follow these steps to clone the repository, initialize Terraform, and deploy resources using environment-specific `.tfvars` files.

---

## Prerequisites

Ensure the following tools are installed and configured on your local machine:

1. **Terraform** (version >= 1.0)  
   [Install Terraform](https://www.terraform.io/downloads.html)
2. **AWS CLI** (configured with valid credentials)  
   [Install AWS CLI](https://aws.amazon.com/cli/)
3. **Git**  
   [Install Git](https://git-scm.com/)

---

## Workflow Steps

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/chinnayyachintha/serverless.git
cd serverless
```

---

### 2. Initialize Terraform

Initialize the project to download required providers, plugins, and modules:

```bash
terraform init
```

---

### 3. Validate Configuration

Validate the Terraform configuration files to ensure there are no syntax errors:

```bash
terraform validate
```

---

### 4. Plan Infrastructure for a Specific Environment

Generate and review the execution plan for the desired environment. Use the appropriate `.tfvars` file (e.g., `dev.tfvars`, `qa.tfvars`, `prod.tfvars`) to define environment-specific variables:

#### Example for Dev Environment

```bash
terraform plan -var-file=env/dev.tfvars
```

#### Example for QA Environment

```bash
terraform plan -var-file=env/qa.tfvars
```

#### Example for Prod Environment

```bash
terraform plan -var-file=env/prod.tfvars
```

(Optional) Save the plan for later use:

```bash
terraform plan -var-file=env/<environment>.tfvars -out=tfplan
```

---

### 5. Apply Infrastructure for a Specific Environment

Apply the planned changes to deploy resources:

#### Example for Dev Environment

```bash
terraform apply -var-file=env/dev.tfvars
```

#### Example for QA Environment

```bash
terraform apply -var-file=env/qa.tfvars
```

#### Example for Prod Environment

```bash
terraform apply -var-file=env/prod.tfvars
```

If you saved the plan file in the previous step:

```bash
terraform apply tfplan
```

---

### 6. Verify Resources

After applying the configuration, verify the deployed resources:

1. Review the **output variables** displayed in the terminal.
2. Check the cloud provider's management console (e.g., AWS Management Console).

---

### 7. Destroy Infrastructure

When you no longer need the resources, clean up by destroying the infrastructure. Use the appropriate `.tfvars` file for the environment:

#### Example for Dev Environment

```bash
terraform destroy -var-file=env/dev.tfvars
```

#### Example for QA Environment

```bash
terraform destroy -var-file=env/qa.tfvars
```

#### Example for Prod Environment

```bash
terraform destroy -var-file=env/prod.tfvars
```

---

## Best Practices

1. **Environment Separation**: Use separate `.tfvars` files for each environment (dev, QA, prod).
2. **State Management**: Use remote backends (e.g., AWS S3 with DynamoDB locking) for managing Terraform state files securely.
3. **Sensitive Data**: Store sensitive information (e.g., keys, secrets) securely using AWS Secrets Manager or HashiCorp Vault.
4. **Version Control**: Commit `.tf` files to version control but exclude `.tfstate` files and sensitive data using `.gitignore`.

---

## Troubleshooting

- **Initialization Issues**: Run `terraform init` to reinitialize the project.
- **Validation Errors**: Ensure all variables are properly defined and `.tfvars` files are correctly formatted.
- **Apply Errors**: Review the plan output for conflicts or missing configurations.

---

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

---

Happy Terraforming!
