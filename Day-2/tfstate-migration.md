1. Ensure that you have a TFSTATE on your local computer
2. Set up your Terraform backend to connect to Azure

```TF
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "cloudskills-rg"
#     storage_account_name = "cloudskills92sg"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#  }

#   required_providers {
#     azurerm = {
#         source = "hashicorp/azurerm"
#     }
#   }
# }
```

3. Run `terraform init` and you'll see a message similar to the screenshot below.
![]('images/1.png')

4. Type `yes` to copy the existing state to the new backend