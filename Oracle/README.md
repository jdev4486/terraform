# Oracle - EC2 TF Code

## Create the base.tf with required provider details

```
vi base.tf

# Provider Configuration
provider "aws" {
  access_key = "XXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXX"
  region     = "us-east-1"
}
```


#### Initialize Terraform before planning or Applying
---

```
# To init AWS TF Providers
~/terraform$ terraform init

# To determine what resources terraform is going to add or modify
~/terraform$ terraform plan

# To determine what resources terraform is going to add or modify
~/terraform$ terraform apply

# To save the terraform plan 
~/terraform$ terraform plan -out base-`date +'%s'`.plan

# To apply the saved plan
~/terraform$ terraform apply base-1519080786.plan


# To destory all resources
~/terraform$ terraform destroy

# To destroy targetted resource
~/terraform$ terraform destroy -target=aws_instance.base

# To destroy resource based on the plan files
~/terraform$ terraform plan -destroy -out base-destroy-`date +'%s'`.plan

```
