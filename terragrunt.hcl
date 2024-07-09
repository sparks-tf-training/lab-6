terraform {
    source = "tfr:///Azure/network/azurerm?version=4.0.0"
}

generate "provider" {
    path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
    features {}
}
EOF
}

inputs = {
  resource_group_name = "terraform-training"
  vnet_name           = "module-vnet"
  address_space       = "10.1.0.0/20"
  subnet_prefixes     = ["10.1.0.0/24"]
  subnet_names        = ["sub1"]
}