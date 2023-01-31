terraform {
  backend "azurerm" {
    resource_group_name  = "rg-iac"
    storage_account_name = "stacctfstate"
    container_name       = "tfstate"
    key                  = "webapp"
  }
}