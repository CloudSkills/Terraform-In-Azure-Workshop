The terraform taint command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.

This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted. Once a resource is marked as tainted, the next plan will show that the resource will be destroyed and recreated and the next apply will implement this change.

When a resource declaration is modified, Terraform usually attempts to update the existing resource in place (although some changes can require destruction and re-creation, usually due to upstream API limitations). In some cases, you might want a resource to be destroyed and re-created even when Terraform doesn't think it's necessary.

To test the tftaint;
`terraform taint azurerm_resource_group.iqmetrix-rg`
`terraform plan`